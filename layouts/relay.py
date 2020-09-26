# Stanford NEM Relay CAD Model
# Author: Akash Levy

# Import klayout
from math import sin, cos, pi
import pya

# RELAY PARAMETERS (lengths are in units of nm)
n_sides = 4                 # number of polygon sides

L_plate = 3000              # side length of parallel plate

L_cant = L_plate            # length of cantilever
W_cant = 200                # width of cantilever
g_cant = W_cant             # gap between plate and cantilever

L_via = 400                 # side length of via
L_anc = L_via + 200         # side length of anchor attachment

circ_cont = 1               # circular or grid contact mode
n_cont = 16                 # number of contacts
L_cont = 150                # side length of contact
r_cont = 1000                # radius of circle along which to place contacts

g_land = 50                 # spacing between landing pad

L_hole = 100                # side length of release hole
r_hole_pl = 0.78*L_plate/2  # distance from center
d_hole_pl = 200             # distance apart from release hole
max_hole = 2                # last hole to have full circle in range
n_hole = [1, 8, 16, 24]     # number of release holes at each layer

cont_rot_factor = 0.1       # contact rotation factor

# Create layout and top cell
layout = pya.Layout()
top = layout.create_cell("TOP")

# Rotation transformations
rotate = pya.ICplxTrans(1, 360/n_sides, False, 0, 0)
def ptrotate(pt, theta):
    x = pt[0] * cos(theta) - pt[1] * sin(theta)
    y = pt[0] * sin(theta) + pt[1] * cos(theta)
    return x, y

# Edge processor
ep = pya.EdgeProcessor()

# Create layers
nemanc = layout.layer(1, 0)
nemchan = layout.layer(2, 0)
nemcont = layout.layer(3, 0)
nembody = layout.layer(4, 0)
nemholes = layout.layer(5, 0)
nemsub = layout.layer(6, 0)
nemsubg = layout.layer(7, 0)
nemland = layout.layer(8, 0)

# Create anchors
ancloc = L_plate/2 + W_cant + L_anc/2
ancloc = pya.Point(ancloc, ancloc)
anchor = pya.Box(-L_via/2, -L_via/2, L_via/2, L_via/2).move(ancloc)
for _ in range(n_sides):
    top.shapes(nemanc).insert(anchor)
    top.shapes(nemsub).insert(anchor)
    anchor = anchor.transformed(rotate)

# Create relay body
plate = pya.Box(-L_plate/2, -L_plate/2, L_plate/2, L_plate/2)
anchor = pya.Box(-L_anc/2, -L_anc/2, L_anc/2, L_anc/2).move(ancloc)
cantloc = pya.Point(-L_plate/2, L_plate/2)
cantatt = pya.Box(0, 0, W_cant, W_cant).moved(cantloc)
cant = pya.Box(0, W_cant, L_cant + 2 * W_cant, 2 * W_cant).moved(cantloc)
relaycomps = [plate]
for _ in range(n_sides):
    relaycomps += [anchor, cantatt, cant]
    anchor = anchor.transformed(rotate)
    cantatt = cantatt.transformed(rotate)
    cant = cant.transformed(rotate)
relay = ep.merge_to_polygon(relaycomps, 0, True, True)[0]

# Insert relay holes
bound = pya.Box(-r_hole_pl*1.1, -r_hole_pl*1.1, r_hole_pl*1.1, r_hole_pl*1.1)
for i, n in enumerate(n_hole):
    r = float(i) / max_hole * r_hole_pl
    for h in range(n):
        holeloc = pya.Point(r*cos(2*pi/n*h), r*sin(2*pi/n*h))
        if bound.contains(holeloc):
            hole = pya.Box(-L_hole/2, -L_hole/2, L_hole/2, L_hole/2).moved(holeloc)
            top.shapes(nemholes).insert(hole)
            #relay.insert_hole(hole)
top.shapes(nembody).insert(relay)

# Create relay substrate
top.shapes(nemsub).insert(plate)

# Create contact layer and landing pads
for i in range(n_cont):
    if i % 4 in [2, 3]:
        r_cont = 825
    else:
        r_cont = 1000
    contx = r_cont * cos(2*pi*(i+(0.5-cont_rot_factor))/n_cont)
    conty = r_cont * sin(2*pi*(i+(0.5-cont_rot_factor))/n_cont)
    contloc = pya.Point(contx, conty)
    cont = pya.Box(-L_cont/2, -L_cont/2, L_cont/2, L_cont/2).moved(contloc)
    padl = L_cont + g_land*2
    lgap = pya.Box(-padl/2, -padl/2, padl/2, padl/2).moved(contloc)
    top.shapes(nemcont).insert(cont)
    top.shapes(nemsubg).insert(lgap)
    top.shapes(nemland).insert(cont)

# Create channel layer
for i in range(n_cont/2):
    if i % 2 == 1:
        r_cont = 825
    else:
        r_cont = 1000
    chanlen = pi * r_cont / n_cont * 2
    chanpts = []
    chanpts.append((-chanlen/2, r_cont*cos(pi/n_cont) - L_cont/2))
    chanpts.append((-chanlen/2, r_cont*cos(pi/n_cont) + L_cont/2))
    chanpts.append((chanlen/2, r_cont*cos(pi/n_cont) + L_cont/2))
    chanpts.append((chanlen/2, r_cont*cos(pi/n_cont) - L_cont/2))
    chanpts = map(lambda pt : ptrotate(pt, pi/n_cont*2*(1-cont_rot_factor)), chanpts)
    chanpts = map(lambda pt : ptrotate(pt, 4 * pi * i/n_cont), chanpts)
    chan = pya.Polygon([pya.Point(*chanpt) for chanpt in chanpts])
    top.shapes(nemchan).insert(chan)

# Write drawing output
layout.write("relay.gds")
layout.write("relay.dxf")
layout.write("relay.cif")

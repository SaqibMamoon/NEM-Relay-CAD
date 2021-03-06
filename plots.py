# Import libraries
import json, matplotlib as mpl, matplotlib.pyplot as plt, pandas as pd

# Parameters
params = json.load(open("params.json"))
propdf = pd.read_csv("output/mechprops.csv", header=None)
k_tot = propdf[1][0]
m = propdf[2][0]
L_plate = params["L_plate"]
n_cont = params["n_cont"]
L_cont = params["L_cont"]
A_gate = L_plate**2 - n_cont * L_cont**2
t_cont = params["t_cont"]
t_gap = params["t_gap"] + params["t_sp"] / params["K_sp"]
F_A = 0

# Constants
eps_0 = 8.85418782E-12 # m^-3 kg^-1 s^4 A^2
E_poly = 145E9 # Pa
rho_poly = 4126 # kg/m^3
rho_W = 55e-9 # Ohm m (W)
H_W = 1.1e9 # Pa
lambda_W = 33e-9 # m
k = 1 # dielectric constant of air
xi_W = 0.25 # elastic contact constant

# Calculations
V_pi = ((8 * k_tot * t_gap**3)/(27 * k * eps_0 * A_gate))**0.5
V_po = ((2 * (k_tot * (t_gap - t_cont) - F_A) * t_cont**2)/(k * eps_0 * A_gate))**0.5

# Plot quasi-static curves
qs_comsol = pd.read_csv("output/quasistatic.csv", header=None, names=["Vg", "z"])
qs_spice = pd.read_csv("output/quasistatic_sp.txt", delimiter='\t', header=0, names=["Vg", "z"])
plt.figure(figsize=(4, 3))
plt.xlabel("Gate-to-body Voltage $V_{gb}$ (V)")
plt.ylabel("Relay displacement (nm)")
plt.plot(qs_comsol["Vg"], qs_comsol["z"]*1e3, label="FEM")
plt.plot(qs_spice["Vg"], qs_spice["z"]*1e9, label="SPICE model")
plt.plot([V_pi, V_pi], [0, 40], '--', label="$V_{pi}$ formula")
plt.plot([V_po, V_po], [0, 40], '--', label="$V_{po}$ formula")
plt.xlim(0, 5)
plt.ylim(0, 40)
plt.legend()
plt.tight_layout()
plt.savefig("demo/quasistatic-curve.pdf")
plt.show()

# Plot transient curve rising
tran_spice = pd.read_csv("output/transient_sp.txt", delimiter='\t', header=0, names=["t", "Ids", "z", "Vg"])
tran_spice_rise = tran_spice[tran_spice["t"] >= 10000*1e-9]
tran_spice_rise = tran_spice_rise[tran_spice_rise["t"] <= 10800*1e-9]
tran_spice_rise["t"] = tran_spice_rise["t"] - 10000*1e-9
plt.figure(figsize=(4, 3))
plt.xlabel("Time (ns)")
plt.ylabel("Relay displacement (nm)")
plt.plot(tran_spice_rise["t"]*1e9, tran_spice_rise["z"]*1e9, label="SPICE model\n$V_{GB}$ = 5V\nQ=0.5")
plt.xlim(0, 800)
plt.ylim(0, 40)
plt.legend()
plt.tight_layout()
plt.savefig("demo/transient-curve-rise.pdf")
plt.show()

# Plot transient curve falling
tran_spice_fall = tran_spice[tran_spice["t"] >= 20000*1e-9]
tran_spice_fall = tran_spice_fall[tran_spice_fall["t"] <= 21200*1e-9]
tran_spice_fall["t"] = tran_spice_fall["t"] - 20000*1e-9
plt.figure(figsize=(4, 3))
plt.xlabel("Time (ns)")
plt.ylabel("Relay displacement (nm)")
plt.plot(tran_spice_fall["t"]*1e9, tran_spice_fall["z"]*1e9, label="SPICE model\n$V_{GB}$ = 5V\nQ=0.5")
plt.xlim(0, 1200)
plt.ylim(0, 40)
plt.legend()
plt.tight_layout()
plt.savefig("demo/transient-curve-fall.pdf")
plt.show()

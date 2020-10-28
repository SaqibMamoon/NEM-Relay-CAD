.title <nem_ohmux_invd0_2i_1b.sp>
.include tsmc40inc.sp
.hdl nem_relay_1b.va
.global VDD VB VSS

** Create relay and start at z=0 **
** Format is I{i}_{b} where {i} is input number, {b} is bit index **
.subckt nem_ohmux_invd0_2i_1b I0_0 I1_0 S0 S1 ZN_0 VDD VB VSS
    Xmux I0_0 I1_0 S0 S1 Z_0 VDD VB VSS nem_ohmux_2i_1b
    Xinv0 Z_0 ZN_0 VDD VSS INVD0BWP
.ends
    
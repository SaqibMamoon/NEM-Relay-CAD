.title <ohmux_test_invd0_2i_1b.sp>
.include ../models/nem_ohmux_invd0_2i_1b.sp

** Tests one-hot multiplexer with inverter using analog inputs **

** Create relay and start at z=0 **
Xmux I0_0 I1_0 S0 S1 ZN_0 VDD VB VSS nem_ohmux_invd0_2i_1b

** Source voltage **
VI0_0 I0_0 gnd 0.5V
VI1_0 I1_0 gnd 1.0V
VS0 S0 gnd 0V PWL(0s 0V 1ns 1.1V 1000ns 1.1V 1001ns 0V 2000ns 0V)
VS1 S1 gnd 0V PWL(0s 0V 1ns 0V 1000ns 0V 1001ns 1.1V 2000ns 1.1V)
RZN_0 ZN_0 gnd 1G
VDD VDD gnd 1.1V
VB VB gnd -2.6V
VSS VS gnd 0V

** Options **
.tran 0.0001us 2000ns
.option post=2
.option runlvl=5 accurate

.end
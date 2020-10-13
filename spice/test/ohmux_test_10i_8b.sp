.title <ohmux_test_10i_8b.sp>
.include ../models/nem_ohmux_10i_8b.sp

** Tests one-hot multiplexer using analog inputs **

** Create relay and start at z=0 **
Xmux I0_0 I0_1 I0_2 I0_3 I0_4 I0_5 I0_6 I0_7 I1_0 I1_1 I1_2 I1_3 I1_4 I1_5 I1_6 I1_7 I2_0 I2_1 I2_2 I2_3 I2_4 I2_5 I2_6 I2_7 I3_0 I3_1 I3_2 I3_3 I3_4 I3_5 I3_6 I3_7 I4_0 I4_1 I4_2 I4_3 I4_4 I4_5 I4_6 I4_7 I5_0 I5_1 I5_2 I5_3 I5_4 I5_5 I5_6 I5_7 I6_0 I6_1 I6_2 I6_3 I6_4 I6_5 I6_6 I6_7 I7_0 I7_1 I7_2 I7_3 I7_4 I7_5 I7_6 I7_7 I8_0 I8_1 I8_2 I8_3 I8_4 I8_5 I8_6 I8_7 I9_0 I9_1 I9_2 I9_3 I9_4 I9_5 I9_6 I9_7 S0 S1 S2 S3 S4 S5 S6 S7 S8 S9 Z_0 Z_1 Z_2 Z_3 Z_4 Z_5 Z_6 Z_7 VDD VB VSS nem_ohmux_10i_8b

** Source voltage **
VI0_0 I0_0 gnd 0.0125V
VI0_1 I0_1 gnd 0.025V
VI0_2 I0_2 gnd 0.0375V
VI0_3 I0_3 gnd 0.05V
VI0_4 I0_4 gnd 0.0625V
VI0_5 I0_5 gnd 0.075V
VI0_6 I0_6 gnd 0.0875V
VI0_7 I0_7 gnd 0.1V
VI1_0 I1_0 gnd 0.1125V
VI1_1 I1_1 gnd 0.125V
VI1_2 I1_2 gnd 0.1375V
VI1_3 I1_3 gnd 0.15V
VI1_4 I1_4 gnd 0.1625V
VI1_5 I1_5 gnd 0.175V
VI1_6 I1_6 gnd 0.1875V
VI1_7 I1_7 gnd 0.2V
VI2_0 I2_0 gnd 0.2125V
VI2_1 I2_1 gnd 0.225V
VI2_2 I2_2 gnd 0.2375V
VI2_3 I2_3 gnd 0.25V
VI2_4 I2_4 gnd 0.2625V
VI2_5 I2_5 gnd 0.275V
VI2_6 I2_6 gnd 0.2875V
VI2_7 I2_7 gnd 0.3V
VI3_0 I3_0 gnd 0.3125V
VI3_1 I3_1 gnd 0.325V
VI3_2 I3_2 gnd 0.3375V
VI3_3 I3_3 gnd 0.35V
VI3_4 I3_4 gnd 0.3625V
VI3_5 I3_5 gnd 0.375V
VI3_6 I3_6 gnd 0.3875V
VI3_7 I3_7 gnd 0.4V
VI4_0 I4_0 gnd 0.4125V
VI4_1 I4_1 gnd 0.425V
VI4_2 I4_2 gnd 0.4375V
VI4_3 I4_3 gnd 0.45V
VI4_4 I4_4 gnd 0.4625V
VI4_5 I4_5 gnd 0.475V
VI4_6 I4_6 gnd 0.4875V
VI4_7 I4_7 gnd 0.5V
VI5_0 I5_0 gnd 0.5125V
VI5_1 I5_1 gnd 0.525V
VI5_2 I5_2 gnd 0.5375V
VI5_3 I5_3 gnd 0.55V
VI5_4 I5_4 gnd 0.5625V
VI5_5 I5_5 gnd 0.575V
VI5_6 I5_6 gnd 0.5875V
VI5_7 I5_7 gnd 0.6V
VI6_0 I6_0 gnd 0.6125V
VI6_1 I6_1 gnd 0.625V
VI6_2 I6_2 gnd 0.6375V
VI6_3 I6_3 gnd 0.65V
VI6_4 I6_4 gnd 0.6625V
VI6_5 I6_5 gnd 0.675V
VI6_6 I6_6 gnd 0.6875V
VI6_7 I6_7 gnd 0.7V
VI7_0 I7_0 gnd 0.7125V
VI7_1 I7_1 gnd 0.725V
VI7_2 I7_2 gnd 0.7375V
VI7_3 I7_3 gnd 0.75V
VI7_4 I7_4 gnd 0.7625V
VI7_5 I7_5 gnd 0.775V
VI7_6 I7_6 gnd 0.7875V
VI7_7 I7_7 gnd 0.8V
VI8_0 I8_0 gnd 0.8125V
VI8_1 I8_1 gnd 0.825V
VI8_2 I8_2 gnd 0.8375V
VI8_3 I8_3 gnd 0.85V
VI8_4 I8_4 gnd 0.8625V
VI8_5 I8_5 gnd 0.875V
VI8_6 I8_6 gnd 0.8875V
VI8_7 I8_7 gnd 0.9V
VI9_0 I9_0 gnd 0.9125V
VI9_1 I9_1 gnd 0.925V
VI9_2 I9_2 gnd 0.9375V
VI9_3 I9_3 gnd 0.95V
VI9_4 I9_4 gnd 0.9625V
VI9_5 I9_5 gnd 0.975V
VI9_6 I9_6 gnd 0.9875V
VI9_7 I9_7 gnd 1.0V
VS0 S0 gnd 0V PWL(0s 0V 1ns 1.1V 1000ns 1.1V 1001ns 0V 2000ns 0V 2001ns 0V 3000ns 0V 3001ns 0V 4000ns 0V 4001ns 0V 5000ns 0V 5001ns 0V 6000ns 0V 6001ns 0V 7000ns 0V 7001ns 0V 8000ns 0V 8001ns 0V 9000ns 0V 9001ns 0V 10000ns 0V)
VS1 S1 gnd 0V PWL(0s 0V 1ns 0V 1000ns 0V 1001ns 1.1V 2000ns 1.1V 2001ns 0V 3000ns 0V 3001ns 0V 4000ns 0V 4001ns 0V 5000ns 0V 5001ns 0V 6000ns 0V 6001ns 0V 7000ns 0V 7001ns 0V 8000ns 0V 8001ns 0V 9000ns 0V 9001ns 0V 10000ns 0V)
VS2 S2 gnd 0V PWL(0s 0V 1ns 0V 1000ns 0V 1001ns 0V 2000ns 0V 2001ns 1.1V 3000ns 1.1V 3001ns 0V 4000ns 0V 4001ns 0V 5000ns 0V 5001ns 0V 6000ns 0V 6001ns 0V 7000ns 0V 7001ns 0V 8000ns 0V 8001ns 0V 9000ns 0V 9001ns 0V 10000ns 0V)
VS3 S3 gnd 0V PWL(0s 0V 1ns 0V 1000ns 0V 1001ns 0V 2000ns 0V 2001ns 0V 3000ns 0V 3001ns 1.1V 4000ns 1.1V 4001ns 0V 5000ns 0V 5001ns 0V 6000ns 0V 6001ns 0V 7000ns 0V 7001ns 0V 8000ns 0V 8001ns 0V 9000ns 0V 9001ns 0V 10000ns 0V)
VS4 S4 gnd 0V PWL(0s 0V 1ns 0V 1000ns 0V 1001ns 0V 2000ns 0V 2001ns 0V 3000ns 0V 3001ns 0V 4000ns 0V 4001ns 1.1V 5000ns 1.1V 5001ns 0V 6000ns 0V 6001ns 0V 7000ns 0V 7001ns 0V 8000ns 0V 8001ns 0V 9000ns 0V 9001ns 0V 10000ns 0V)
VS5 S5 gnd 0V PWL(0s 0V 1ns 0V 1000ns 0V 1001ns 0V 2000ns 0V 2001ns 0V 3000ns 0V 3001ns 0V 4000ns 0V 4001ns 0V 5000ns 0V 5001ns 1.1V 6000ns 1.1V 6001ns 0V 7000ns 0V 7001ns 0V 8000ns 0V 8001ns 0V 9000ns 0V 9001ns 0V 10000ns 0V)
VS6 S6 gnd 0V PWL(0s 0V 1ns 0V 1000ns 0V 1001ns 0V 2000ns 0V 2001ns 0V 3000ns 0V 3001ns 0V 4000ns 0V 4001ns 0V 5000ns 0V 5001ns 0V 6000ns 0V 6001ns 1.1V 7000ns 1.1V 7001ns 0V 8000ns 0V 8001ns 0V 9000ns 0V 9001ns 0V 10000ns 0V)
VS7 S7 gnd 0V PWL(0s 0V 1ns 0V 1000ns 0V 1001ns 0V 2000ns 0V 2001ns 0V 3000ns 0V 3001ns 0V 4000ns 0V 4001ns 0V 5000ns 0V 5001ns 0V 6000ns 0V 6001ns 0V 7000ns 0V 7001ns 1.1V 8000ns 1.1V 8001ns 0V 9000ns 0V 9001ns 0V 10000ns 0V)
VS8 S8 gnd 0V PWL(0s 0V 1ns 0V 1000ns 0V 1001ns 0V 2000ns 0V 2001ns 0V 3000ns 0V 3001ns 0V 4000ns 0V 4001ns 0V 5000ns 0V 5001ns 0V 6000ns 0V 6001ns 0V 7000ns 0V 7001ns 0V 8000ns 0V 8001ns 1.1V 9000ns 1.1V 9001ns 0V 10000ns 0V)
VS9 S9 gnd 0V PWL(0s 0V 1ns 0V 1000ns 0V 1001ns 0V 2000ns 0V 2001ns 0V 3000ns 0V 3001ns 0V 4000ns 0V 4001ns 0V 5000ns 0V 5001ns 0V 6000ns 0V 6001ns 0V 7000ns 0V 7001ns 0V 8000ns 0V 8001ns 0V 9000ns 0V 9001ns 1.1V 10000ns 1.1V)
RZ_0 Z_0 gnd 1G
RZ_1 Z_1 gnd 1G
RZ_2 Z_2 gnd 1G
RZ_3 Z_3 gnd 1G
RZ_4 Z_4 gnd 1G
RZ_5 Z_5 gnd 1G
RZ_6 Z_6 gnd 1G
RZ_7 Z_7 gnd 1G
VDD VDD gnd 1.1V
VB VB gnd -2.6V
VSS VS gnd 0V

** Options **
.tran 0.0001us 10000ns
.option post=2
.option runlvl=5 accurate

.end

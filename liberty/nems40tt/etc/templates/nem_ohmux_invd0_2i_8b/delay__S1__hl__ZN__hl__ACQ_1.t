##############################################################################
# Template generated by SiliconSmart M-2017.03-2 (built on Apr 12, 2017 14:36:58) #
# SiliconSmart Path: /cad/synopsys/SiliconSmart/M-2017.03-2/linux64/bin/siliconsmart #
# Host Name: r6cad-tsmc40r.stanford.edu, User Name: akashl, PID: 17038 #
# Directory: /home/akashl/NEM-Relay-CAD/liberty #
# Date Sun, 01 Nov 2020 18:46:55 PST #
#                                                                            #
# Copyright (C) 2017 Synopsys Inc.                                #
# This file contains confidential and proprietry information.                #
# All rights reserved.                                                       #
#                                                                            #
##############################################################################

set tempTestColl [ SBTestCollection automap ]


# Specifies the version of the template API expected by this file.
$tempTestColl setTemplateVer 7

## 
## Configuration Flags
$tempTestColl setConfigurationFlags { doTiming doPower doCcs }

## 
## Formal Ports
$tempTestColl makeFormalPorts {I1 I0 S1 S0 ZN}
$tempTestColl setParameter retention_ports {}
$tempTestColl setParameter synch_controls {}
$tempTestColl setParameter clock_ports {}
$tempTestColl setParameter asynch_ports {}
$tempTestColl setParameter asynch_ports_active_state {}

## 
## Tests

## 
## Test delay__S1__hl__ZN__hl
set tempTest [ SBTest "delay__S1__hl__ZN__hl" ]
$tempTest setTargets { delay__S1__hl__ZN__hl Cin__S0__lh Cin__S1__hl Tout__ZN__hl ccs_cin1__S0__lh ccs_cin1__S1__hl ccs_cin2__S0__lh ccs_cin2__S1__hl ccs_tin1__S0__lh ccs_tin1__S1__hl ccs_tin2__S0__lh ccs_tin2__S1__hl delay_ccs_native_current__S1__hl__ZN__hl time_at_voltage__S0__lh time_at_voltage__S1__hl }
$tempTest setTargetInputs {
  {S1 hl}}

$tempTest setTargetOutputs {
  {ZN hl}}

$tempTest setSwitchingInputs {
  {S1 hl}  {S0 lh}}

$tempTest setAnalysisType tranPlus

## 
## Sweep Specification
$tempTest setTagNumTableDimensions 0 mpw

## 
## Harnesses
$tempTest setAcquire 1
$tempTest setStateCoverage "1"

## 
## ACQ_1
set tempAcq [ SBDelayAcquisition "ACQ_1" ]
$tempAcq setHarnessName default
$tempAcq setAcquire 1
$tempAcq setState "I0&!I1"
$tempAcq setStateCoverage "1"

## 
## Wavetable
set tempWT [ SBWaveTable ]
$tempWT setInterface { I1 I0 ZN:out S0 S1 } { initial_delay units ct default_slew pp prop_delay_level ccsPoints volt_tolerance stable }

$tempWT setStimulus                                                {   I1   I0   S0   S1   ZN    } {
                                                 "0"            {} {   0    1    0    1    1     }
                                     "initial_delay" { start out } {   -    -    1    0    0     }
"max((initial_delay)+(pp),(initial_delay)+(stable))"            {} {   -    -    -    -    -     }
}

$tempWT addMeasurements {} {
  { tin_S1               Tin        { S1 start } NO_USER SYS }
  { tin_S0               Tin        { S0 start } NO_USER SYS }
  { cin_S1               Cin        { S1 start } NO_USER SYS }
  { cin_S0               Cin        { S0 start } NO_USER SYS }
  { ccs_cin1_S1          ccs_cin1   { S1 start } NO_USER SYS }
  { ccs_cin2_S1          ccs_cin2   { S1 start } NO_USER SYS }
  { ccs_tin1_S1          ccs_tin1   { S1 start } NO_USER SYS }
  { ccs_tin2_S1          ccs_tin2   { S1 start } NO_USER SYS }
  { ccs_time_ref_S1      time_at_voltage { S1 prop_delay_level*(__param_VDD-__param_VSS)+__param_VSS start } NO_USER SYS }
  { ccs_cin1_S0          ccs_cin1   { S0 start } NO_USER SYS }
  { ccs_cin2_S0          ccs_cin2   { S0 start } NO_USER SYS }
  { ccs_tin1_S0          ccs_tin1   { S0 start } NO_USER SYS }
  { ccs_tin2_S0          ccs_tin2   { S0 start } NO_USER SYS }
  { ccs_time_ref_S0      time_at_voltage { S0 prop_delay_level*(__param_VDD-__param_VSS)+__param_VSS start } NO_USER SYS }
  { tout_ZN              Tout       { ZN out } NO_USER SYS }
  { delay_S1_ZN          delay      { S1 start ZN out } NO_USER SYS }
  { delay_ccs_native_current__S1__hl__ZN__hl delay_ccs_native_current { S1 start ZN VSS out (initial_delay)+(stable) load_ZN __param_VDD __param_VSS ccsPoints volt_tolerance } NO_USER SYS }
}

$tempWT bindInterface { I1 I0 ZN S0 S1 } { cell_initial_delay S1[cycle_time] S1[cycle_time] S1[default_slew] cell_power_period S0[prop_delay_inp_level_rise] ZN[num_ccs_samples] ZN[ccs_max_voltage_error] ZN[stable_time] }
$tempAcq addWaveTable $tempWT
release_obj $tempWT

## 
## Sweep Specification
$tempAcq setTagNumTableDimensions 0 mpw

## 
## Harnesses

set tempHarness [ SBHarness default ]
set tempTopOp [ SBTopologyOperation ]
$tempTopOp setElement dcvs
$tempTopOp setElementName cap_ground_ZN
$tempTopOp setOperation insert
$tempTopOp setNodes {ground_ZN 0}
$tempTopOp setParam {0}
$tempHarness addTopologyOperation $tempTopOp
release_obj $tempTopOp
set tempTopOp [ SBTopologyOperation ]
$tempTopOp setElement capacitor
$tempTopOp setElementName cap_ZN
$tempTopOp setOperation insert
$tempTopOp setNodes {ZN ground_ZN}
$tempTopOp setParam {load_ZN}
$tempHarness addTopologyOperation $tempTopOp
release_obj $tempTopOp
$tempAcq addHarness $tempHarness
release_obj $tempHarness

$tempAcq setHarnessName default
$tempTest addAcquisition $tempAcq
release_obj $tempAcq

$tempTestColl addTest $tempTest
release_obj $tempTest

set tempTestColl


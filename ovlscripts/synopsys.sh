#!/bin/bash
mkdir -p libs/lib
mkdir -p libs/accellera_ovl_vhdl
cat > .synopsys_vss.setup <<heredoc
TIMEBASE    = NS
accellera_ovl_vhdl : ./libs/accellera_ovl_vhdl
WORKLIB  : ./libs/lib
WORK        > WORKLIB
heredoc

ovlInstallPath=../std_ovl
vhdlan -nc -work accellera_ovl_vhdl ${ovlInstallPath}/std_ovl.vhd 
vhdlan -nc -work accellera_ovl_vhdl ${ovlInstallPath}/std_ovl_procs.vhd 
vhdlan -nc -work accellera_ovl_vhdl ${ovlInstallPath}/std_ovl_clock_gating.vhd 
vhdlan -nc -work accellera_ovl_vhdl ${ovlInstallPath}/std_ovl_reset_gating.vhd 
vhdlan -nc -work accellera_ovl_vhdl ${ovlInstallPath}/ovl_*.vhd 
vhdlan -nc -work accellera_ovl_vhdl ${ovlInstallPath}/vhdl93/ovl_*_rtl.vhd
vhdlan -nc -work accellera_ovl_vhdl ${ovlInstallPath}/std_ovl_components.vhd
vhdlan -nc -work WORKLIB counter.vhd
vhdlan -nc -work WORKLIB countertb.vhd
vcs -gui -R WORKLIB.countertb

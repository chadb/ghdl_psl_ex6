#!/bin/bash
ovlInstallPath=../std_ovl
irun -compile -smartorder -v93 -makelib accellera_ovl_vhdl:accellera_ovl_vhdl \
${ovlInstallPath}/std_ovl.vhd \
${ovlInstallPath}/std_ovl_procs.vhd \
${ovlInstallPath}/std_ovl_clock_gating.vhd \
${ovlInstallPath}/std_ovl_reset_gating.vhd \
${ovlInstallPath}/ovl_*.vhd \
${ovlInstallPath}/vhdl93/ovl_*_rtl.vhd \
${ovlInstallPath}/std_ovl_components.vhd \

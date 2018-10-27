set ovlInstallPath "../std_ovl"

vlib ./libs/accellera_ovl_vhdl
vmap accellera_ovl_vhdl ./libs/accellera_ovl_vhdl
vcom -93 -work accellera_ovl_vhdl ${ovlInstallPath}/std_ovl.vhd 
vcom -93 -work accellera_ovl_vhdl ${ovlInstallPath}/std_ovl_procs.vhd 
vcom -93 -work accellera_ovl_vhdl ${ovlInstallPath}/std_ovl_clock_gating.vhd 
vcom -93 -work accellera_ovl_vhdl ${ovlInstallPath}/std_ovl_reset_gating.vhd 
vcom -93 -work accellera_ovl_vhdl ${ovlInstallPath}/ovl_*.vhd 
vcom -93 -work accellera_ovl_vhdl ${ovlInstallPath}/vhdl93/ovl_*_rtl.vhd
vcom -93 -work accellera_ovl_vhdl ${ovlInstallPath}/std_ovl_components.vhd

vlib ./libs/lib
vmap work ./libs/lib

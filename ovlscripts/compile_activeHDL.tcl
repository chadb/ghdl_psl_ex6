set ovlInstallPath "../../std_ovl"

if { [file exists ws.aws] == 0} {
  workspace create ws
  design create -a design .
  cd ..
} else {
  opendesign design
  cd ..
}
alib ./libs/accellera_ovl_vhdl
amap accellera_ovl_vhdl ./libs/accellera_ovl_vhdl
acom -dbg -work accellera_ovl_vhdl ${ovlInstallPath}/std_ovl.vhd 
acom -dbg -work accellera_ovl_vhdl ${ovlInstallPath}/std_ovl_procs.vhd 
acom -dbg -work accellera_ovl_vhdl ${ovlInstallPath}/std_ovl_clock_gating.vhd 
acom -dbg -work accellera_ovl_vhdl ${ovlInstallPath}/std_ovl_reset_gating.vhd 
acom -dbg -work accellera_ovl_vhdl ${ovlInstallPath}/ovl_*.vhd 
acom -dbg -work accellera_ovl_vhdl ${ovlInstallPath}/vhdl93/ovl_*_rtl.vhd
acom -dbg -work accellera_ovl_vhdl ${ovlInstallPath}/std_ovl_components.vhd
acom -dbg ../counter.vhd
acom -dbg ../countertb.vhd
asim countertb
add wave /countertb/*
run -all

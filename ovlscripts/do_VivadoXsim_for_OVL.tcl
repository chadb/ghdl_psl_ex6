# Copyright (c) Doulos 2016
# 2013-06-12   APF
# 2016-03-24   MJS - Added 'set_property rtl_top_arch ...' for synthesis (for ex03, Serial OR)
#                    Added 'launch_simulation' at the end
#
# Common behaviour for Vivado XSim for Comp. VHDL
# 
#

create_project $project_name ./$project_name -part $part -force
set_property target_language VHDL [current_project]
set_property file_type {VHDL 2008}  [get_filesets sim_1]

source vivado_ovl.tcl

add_files -fileset sim_1 $sim_files
set_property top $sim_top [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1

# enable range checking for VHDL, and all debug information
set_property xsim.elaborate.rangecheck true [get_filesets sim_1]
set_property xsim.elaborate.debug_level all [get_filesets sim_1]
set_property xsim.elaborate.more_options -value {-O0} -objects [get_filesets sim_1]
set_property top_arch $arch_name [get_filesets sim_1]

# set runtime to "forever"
set_property xsim.simulate.runtime all [get_filesets sim_1]

start_gui

launch_simulation

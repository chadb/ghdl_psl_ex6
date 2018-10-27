set ovlInstallPath "../../std_ovl"

# create list of files
set OVL_files [list\
[file normalize "$ovlInstallPath/std_ovl.vhd"]\
[file normalize "$ovlInstallPath/std_ovl_procs.vhd"]\
[file normalize "$ovlInstallPath/std_ovl_clock_gating.vhd"]\
[file normalize "$ovlInstallPath/std_ovl_reset_gating.vhd"]\
[file normalize "$ovlInstallPath/std_ovl_components.vhd"]\
]

# file lists with wildcards need to be added from a for loop and appended to the list one by one
# otherwise it seems to add the list as a single item
foreach files [glob "$ovlInstallPath/ovl_*.vhd"] {lappend OVL_files $files}
foreach files [glob "$ovlInstallPath/vhdl93/ovl_*_rtl.vhd"] {lappend OVL_files $files}

# add the list of OVL files to the project
add_files -fileset sim_1 $OVL_files

# Set OVL library for each added file
set OVLLib accellera_ovl_vhdl
set obj [get_files $OVL_files]
set_property library $OVLLib $obj
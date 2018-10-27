# Copyright (c) Doulos 2017
# 2013-06-12   APF
# 2016-03-24   MJS - Added rtl_top_arch
# 2017-12-15   MPAT
#
# A Tcl script to load a simulation in Xilinx Vivado Xsim
# This is written for "project mode"
#
set project_name  ex06sim
set sim_top       countertb
set arch_name     bench
set part          {xc7z020clg484-1}

# simulation only files
set sim_files      {
                    ../counter.vhd
                    ../countertb.vhd
}

source do_VivadoXsim_for_OVL.tcl


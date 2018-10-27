#!/bin/bash
./ovlscripts/cadence_ovl.sh
irun -gui -smartorder -v93 -access +rwc -top countertb -reflib accellera_ovl_vhdl:accellera_ovl_vhdl *.vhd 

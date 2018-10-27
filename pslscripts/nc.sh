#mkdir lib
ncvhdl -v93 -assert -mess -work lib -linedebug counter.vhd
ncvhdl -v93 -assert -mess -work lib -linedebug countertb.vhd
ncelab -access +rwc -mess -work lib lib.CounterTB:Bench
ncsim -mess -gui lib.CounterTB:Bench -input pslscripts/nc.tcl

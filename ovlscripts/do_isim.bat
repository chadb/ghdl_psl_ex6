REM cd to parent directory if run from scripts dir 
IF EXIST .\do_isim.bat cd ..

REM compile VHDL code
fuse work.CounterTB -prj ovlscripts/isim.prj -o tb.exe

REM run isim exectuble in GUI using commands in isim.tcl
tb -gui -tclbatch ovlscripts/isim.tcl

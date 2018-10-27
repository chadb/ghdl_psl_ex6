vlib lib
vmap work lib
vcom -novopt -O0 counter.vhd
vcom -novopt -O0 countertb.vhd
vsim -novopt -assertdebug  countertb
add wave /g1/*
configure wave -signalnamewidth 1
view assertions
run -all
wave zoomfull

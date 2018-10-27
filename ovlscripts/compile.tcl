vlib lib
vmap work lib
vcom -novopt -O0 counter.vhd
vcom -novopt -O0 countertb.vhd
vsim -novopt countertb
add wave *
run -all
wave zoomfull

## Expert VHDL design exercise 6

These examples demonstrate using ghdl with psl and ovl for functional verification.

There is a purposeful error on line 46 of counter.vhd to force the psl to create a psl assertion error:

``` vhdl
--psl property up   is always (UpDn and Enable and not Load     -> next Cnt = previous_cnt - 1) abort Reset;
```

Error:

``` bash
$ ./countertb
counter.vhd:52:7:@35ns:(psl assertion error): Assertion violation
...
counter.vhd:52:7:@2855ns:(psl assertion error): Assertion violation
```

To fix the error you will need to change the '-' to a '+'

Also here is what I did on the command line to compile the files:

``` bash
mkdir work
ghdl -i --work=work --workdir=work -fpsl counter.vhd countertb.vhd
ghdl -m --work=work --workdir=work -fpsl countertb
```

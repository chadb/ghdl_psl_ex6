database -open waves -into waves.shm -default
probe -create -shm -all -waveform

#################################################################
#                                                               #
# $probelist contains a list of the property names to be probed #
#                                                               #
# e.g. if you have properties prop1, prop2 you would write:     #
#                                                               #
# set probelist {prop1 prop2}                                   #
#                                                               #
#################################################################
set probelist {}

#################################################################
#                                                               #
# $vunit contains the scope in which the properties are defined #
# The default : represents the top level                        #
#                                                               #
#################################################################
set vunit {:G1:}

foreach probename $probelist {
  probe -create -assertions -failure $vunit$probename -waveform
}

foreach probename $probelist {
  probe -create -assertions -transaction $vunit$probename -waveform
}

set assert_output_stop_level { }

#assertion -logging -all -state all

# Now send command to SimVision to open 
# an Assertion Browser
simvision -submit {assertbrowser new}

run

#display summary of assertion results
assertion -summary

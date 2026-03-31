# file creation and operations

set fh [open "timing_report.txt" w]
puts $fh "Timing Report"
puts $fh "Path 1: slack = -0.8 ns VIOLATED"
puts $fh "Path 2: slack =  0.3 ns MET"
puts $fh "Path 3: slack = -0.2 ns VIOLATED"
puts $fh "Path 4: slack =  0.5 ns MET"
puts $fh "Path 5: slack =  0.1 ns MET"
close $fh

set fh [open "timing_report.txt" r]
while {[gets $fh line] >= 0} {
    puts $line
}
close $fh

set violated 0
set met 0
set fh [open "timing_report.txt" r]
while {[gets $fh line] >= 0} {
    if {[string match *VIOLATED* $line]} {
    incr violated 
    } elseif {[string match *MET* $line]} {
        incr met
    }
}

close $fh
puts "Violations : $violated"
puts "Met : $met"
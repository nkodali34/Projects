set violated 0
set met 0
set worst_slack 999
set worst_path ""
set current_path ""
set current_status ""
set startpoint ""
set endpoint ""

set fh [open "timing_report.rpt" r]
while {[gets $fh line] >= 0} {
    # catch path status
    if {[regexp {Path\s+(\d+)\s+\((\w+)\)} $line match pnum status]} {
        set current_status $status
        set current_path $pnum
    }
    # catch startpoint
    if {[regexp {Startpoint:\s+(\S+)} $line match sp]} {
        set startpoint $sp
    }
    # catch endpoint
    if {[regexp {Endpoint\s*:\s+(\S+)} $line match ep]} {
        set endpoint $ep
    }
    # catch slack
    if {[regexp {slack\s*:\s+([-\d.]+)} $line match slack]} {
        if {$slack < $worst_slack} {
            set worst_slack $slack
            set worst_path "$startpoint -> $endpoint"
        }
    puts "Path $current_path : $startpoint -> $endpoint slack = $worst_slack $current_status"
    }
    if {[string match *VIOLATED* $line]} {incr violated} 
    if {[string match *MET* $line]} {incr met}
}
close $fh

puts "\n=== Summary ==="
puts "Total Paths : [expr {$violated + $met}]"
puts "Violated    : $violated"
puts "Met         : $met"
puts "Worst Slack : $worst_slack ns ($worst_path)"
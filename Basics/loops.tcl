set cells [list AND2 OR2 INV NAND2 NOR2 XOR2]

foreach cell $cells {
    puts "Cell: $cell"
}

for {set i 0} {$i < [llength $cells]} {incr i} {
    puts "Cell [expr {$i+1}] : [lindex $cells $i]"
}
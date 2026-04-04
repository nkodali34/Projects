set fh [open "sample.def" r]
while {[gets $fh line] >=0} {
    if {[regexp {^DESIGN\s+(\w+)} $line match name]} {
        puts "Design : $name"
    }
    if {[regexp {DIEAREA\s+\(\s*(\d+)\s+(\d+)\s*\)\s+\(\s*(\d+)\s+(\d+)\s*\)} $line match a b x y]} {
        puts "Die Area : ($a,$b) to ($x,$y)"
    }
    if {[regexp {^-\s+(\w+)\s+(\w+).*PLACED\s+\(\s*(\d+)\s+(\d+)\s*\)\s+(\w+)} $line match inst cell x y orient]} {
        puts "$inst $cell at ($x,$y) orient = $orient"
    }
}
close $fh
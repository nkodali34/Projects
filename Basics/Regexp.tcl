#REGEXP

set report {
Path 1: start=FF_CLK end=AND2 slack=-0.85ns VIOLATED
Path 2: start=FF_DATA end=OR2 slack=0.32ns MET
Path 3: start=FF_RST end=INV slack=-0.12ns VIOLATED
Path 4: start=FF_EN end=NAND2 slack=0.56ns MET
Path 5: start=FF_OUT end=NOR2 slack=0.91ns MET
}

puts $report

foreach line [split $report "\n"] {
    if {[regexp {slack=([-\d.]+ns)} $line match slack]} {
        puts "Slack = $slack"
    } 
}

foreach line [split $report "\n"] {
    if {[regexp {VIOLATED} $line]} {
        puts "$line"
    } 
}

foreach line [split $report "\n"] {
    if {[regexp {(Path \d+).*start=(\w+).*end=(\w+)} $line match path start end]} {
        puts "$path $start to $end"
    } 
}


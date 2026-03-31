#String Operations

set parts [split "U123_AND2_X4" "_"]
set inst  [lindex $parts 0]   
set type  [lindex $parts 1]   
set drive [lindex $parts 2]   

puts $parts

regexp {U(\d+)} "U123_AND2_X4" match num
puts $num

regexp {(U\d+)_(\w+)_(X\d+)} "U123_AND2_X4" match inst type drive
puts $inst
puts $type
puts $drive

if {[regexp {clk} "U123_AND2_X4_clk"]} {
    puts "clk found"
} else {
    puts "clk not found"
}


set line "Path 1: slack=-0.85ns VIOLATED"
regexp {slack=([-\d.]+)ns} $line  match slack
puts $slack

set def "COMP AND2 ( 1000 2000 )"
regexp {\(\s*(\d+)\s+(\d+)\s*\)} $def match x y
puts "$x $y"

puts "Uppercase : [string toupper $line]"
puts "Lowercase : [string tolower $line]"

set line "Path 1 slack=-0.8ns VIOLATED"
set newline [string map {VIOLATED FAILING} $line]
puts "Original : $line"
puts "Modified : $newline"
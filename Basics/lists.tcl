set nets [list clk reset data_in data_out vdd gnd]
set length [llength $nets]
puts "Total nets : $length"

lappend nets scan_en
set newlength [llength $nets]
puts "Total nets after ading scan_en: $newlength"

for {set i 0} {$i < [llength $nets]} {incr i} {
    puts "$i : [lindex $nets $i] "
}

set idx [lsearch $nets reset]
set nets [lreplace $nets $idx $idx]
set new [llength $nets]
puts "Total nets after removing reset: $new"

set nets [lsort $nets]
puts "$nets"

set idx [lsearch $nets clk]
if {$idx >=0} {
    puts "clk found at $idx"
}

for {set i 0} {$i < [llength $nets]} {incr i} {
    puts "$i : [lindex $nets $i] "
}
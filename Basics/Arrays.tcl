set loc(AND2,x) 100
set loc(AND2,y) 200
set loc(OR2,x) 300
set loc(OR2,y) 400
set loc(INV,x) 500
set loc(INV,y) 100
set loc(NAND2,x) 200
set loc(NAND2,y) 300

puts "-- Cell Location --"
puts "AND2 : x = $loc(AND2,x) y = $loc(AND2,y)"
puts "OR2 : x = $loc(OR2,x) y = $loc(OR2,y)"
puts "INV : x = $loc(INV,x) y = $loc(INV,y)"
puts "NAND2 : x = $loc(NAND2,x) y = $loc(NAND2,y)"

set loc(AND2,x) 150
set loc(AND2,y) 250

puts "-- Updated Location --"
puts "AND2 : x = $loc(AND2,x) y = $loc(AND2,y)"

if {[info exists loc(XOR2,x)]} {
    puts "found"
} else {
    puts "not found"
}

puts [array names loc]
puts [lsort [array names loc]]

foreach key [lsort [array names loc]] {
    puts $key
}

foreach key [lsort [array names loc *,x]] {
    set cell [string  replace $key end-1 end ""]
    puts $cell
}
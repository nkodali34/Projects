set fh [open "sample.lef" r]
set pin_count 0
while {[gets $fh line] >=0} {
  if {[regexp {^MACRO\s+(\w+)} $line match name]} {
    puts "found macro : $name"
  }
  if {[regexp {\s+SIZE\s+([\d.]+)\s+BY\s+([\d.]+)} $line match w h]} {
    puts "Size : $w x $h"
  }
  if {[regexp {^\s+PIN\s+(\w+)} $line match pin]} {
    incr pin_count 
    puts "  Pin  : $pin (total: $pin_count)"
  }
}
close $fh
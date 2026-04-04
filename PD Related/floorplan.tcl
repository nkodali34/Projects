set design    "MyChip"
set tech_node "28nm"
set die_w     5000
set die_h     4000
set util      70
set io_margin 50

set Die_Area [expr {$die_w * $die_h}]
set core_origin "($io_margin, $io_margin)"
set core_w [expr {$die_w - 2*$io_margin}]
set core_h [expr {$die_h - 2*$io_margin}]
set core_area [expr {$core_w * $core_h}]
set Acc_cell_area [expr {$core_area * $util/100}]
puts "$Die_Area"
puts "$core_origin"
puts "$core_w"
puts "$core_h"
puts "$core_area"
puts "$Acc_cell_area"

set fh [open "floorplan_1.tcl" w]
puts $fh "#Floorplan commands"
puts $fh "create floorplan \\"
puts $fh "      -die_size{$die_w $die_h} \\"
puts $fh "      -core_margins{$io_margin $io_margin $io_margin $io_margin}"
close $fh
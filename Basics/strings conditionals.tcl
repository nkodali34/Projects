set chip_name "MyChip"
set node "28nm" 
set utilization "85"

if {$utilization < 70} {
    set status "LOW"
} elseif {$utilization <= 85} {
    set status "OPTIMAL"
} else {set status "HIGH"}

puts "Chip   : $chip_name"
puts "Node   : $node"
puts "Util   : $utilization %"
puts "Status : $status"

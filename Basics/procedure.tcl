proc calc_die_area {width height} {
    return [expr {$width * $height}]
}

proc calc_core_area {calc_die_area util} {
    return [expr {$calc_die_area * $util/100.0}]
}

proc check_util {util} {
    if {$util < 70} {
        return "LOW"
    } elseif {$util <= 85} {
        return "OPTIMAL"
    } else {
        return "HIGH"
    }
}

proc summary {chip node width height util} {
    puts "--PD Summary--"
    puts "Chip : $chip"
    puts "Node : $node"
    puts "Die width : $width"
    puts "Die height : $height"
    puts "Utilization : $util"
    set Die_Area [calc_die_area $width $height]
    puts "Die Area : $Die_Area"
    set Core_Area [calc_core_area $Die_Area $util]
    puts "Core Area : $Core_Area"
    set status [check_util $util]
    puts "Status : $status"
}



set area [calc_die_area 500 100]
puts "$area"

set i [summary MyChip 28 5000 1000 70]
puts "$i"

summary MyChip 28 5000 1000 70
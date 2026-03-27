# Variables & Arithmetic
# Physical Design: Die size and core area calculation

# Step 1: store width and height
set width "5000"
set height "4000"

# Step 2: calculate die area
set die_area [expr {$width * $height}]

# Step 3: store utilization (70% = 0.70)
set utilization "0.70"

# Step 4: calculate core area
set core_area [expr {$die_area * $utilization}]

# Step 5: print everything
puts "Die Width  : $width um"
puts "Die Height : $height um"
puts "Die Area   : $die_area um2"
puts "Core Area  : $core_area um2"
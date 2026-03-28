set slack -0.8
set iter 1

# first try got floating error 
#   while {$slack < 0} {
#       set slack [expr {$slack + 0.2}]
#       incr iter
#       puts "$iter. slack : $slack"
#   }


# second try its working
#   while {$slack < 0.7} {
#       set slack [expr {round($slack * 10 + 2) / 10.0}]
#       puts "$iter. slack : $slack"
#       incr iter
#   }

while {$slack < 0.7} {
    if {$slack < 0.0} {
        set status "Violating"
    } else {
        set status "Met"
    }
    puts "$iter. slack : $slack $status"
    set slack [expr {round($slack * 10 + 2) / 10.0}]
    incr iter 
}
if (launch_duration > 0) {
    movespeed = launch_movespeed;
    maxturnrate = launch_turnrate;
    alarm[1] = launch_duration;
} else {
    movespeed = cruise_movespeed;
    maxturnrate = cruise_turnrate;
    if (movespeed > 0) {
        alarm[0] = maxrange/movespeed;
    }
}

init = true;

var commandUnit = argument0;
var command_x = argument1;
var command_y = argument2;

//Overrides x,y if commandTarget exists
var commandTarget = argument3;

with (commandUnit) {
    if (instance_exists(commandTarget)) {
        // BOARD ENEMY
        if (commandUnit.side != commandTarget.side) {
            // Order a single transport to board target enemy, ignoring other fighters
            // TODO: store types of transports on ships to optimze this if needed
            scramble_transports = true;
            ds_list_add(transport_targetid_queue,commandTarget);
        }
        // REINFORCE ALLY
        else {
            // Order a single transport to board target ally, ignoring other fighters
            scramble_transports = true;
            ds_list_add(transport_targetid_queue,commandTarget);
        }
    } else {
        //INTERCEPT
        /*
        with (oallsingleships) {
            if (parentid == commandUnit)
            {
                intercept(command_x, command_y);
            }
        }
        scramble_fighters = true;
        fighter_targetid = noone;
        fighter_target_x = command_x;
        fighter_target_y = command_y;
        */
    }
}
    

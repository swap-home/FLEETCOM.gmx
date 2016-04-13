var commandUnit = argument0;
var command_x = argument1;
var command_y = argument2;

//Overrides x,y if commandTarget exists
var commandTarget = argument3;

with (commandUnit) {
    if (instance_exists(commandTarget)) {
        // ATTACK
        if (commandUnit.side != commandTarget.side) {
            // Order fighters to attack target enemy, ignoring other fighters
            // TODO: store types of fighters on ships to optimze this if needed
            with (oallsingleships) {
                if (parentid == commandUnit)
                {
                    attack(commandTarget);
                }
            }
            scramble_fighters = true;
            fighter_targetid = commandTarget;
        }
        // ESCORT
        else {
            // Order fighters to intercept enemies near target ally
            with (oallsingleships) {
                if (parentid == commandUnit)
                {
                    escort(commandTarget);
                }
            }
            scramble_fighters = true;
            fighter_targetid = commandTarget;
        }
    } else {
        //INTERCEPT
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
    }
}
    

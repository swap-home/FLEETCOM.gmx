var commandUnit = argument0;
var command_x = argument1;
var command_y = argument2;

//Overrides x,y if commandTarget exists
var commandTarget = argument3;

if (!instance_exists(commandUnit)) {
    exit;
}

var fighter_race;
if (commandUnit.race == "unsc") {
    fighter_race = global.UNSCfighters;
} else if (commandUnit.race == "cove") {
    fighter_race = global.Covefighters;
}

with (commandUnit) {
    if (instance_exists(commandTarget)) {
        // ATTACK
        if (commandUnit.side != commandTarget.side) {
            // Order fighters to attack target enemy, ignoring other fighters
            for (var i = 0; i < ds_list_size(fighter_race); i++) {
                with (fighter_race[| i]) {
                    if (parentid == commandUnit)
                    {
                        attack(commandTarget);
                    }
                }
            }
            scramble_fighters = true;
            fighter_targetid = commandTarget;
        }
        // REFUEL
        else if (commandUnit == commandTarget) {
            // Order fighters to return to capital ship
            for (var i = 0; i < ds_list_size(fighter_race); i++) {
                with (fighter_race[| i]) {
                    if (parentid == commandUnit)
                    {
                        refuel(commandTarget);
                    }
                }
            }
            scramble_fighters = false;
            fighter_targetid = noone;
            fighter_target_x = commandUnit.x;
            fighter_target_y = commandUnit.y;
        // ESCORT
        } else {
            // Order fighters to intercept enemies near target ally
            for (var i = 0; i < ds_list_size(fighter_race); i++) {
                with (fighter_race[| i]) {
                    if (parentid == commandUnit)
                    {
                        escort(commandTarget);
                    }
                }
            }
            scramble_fighters = true;
            fighter_targetid = commandTarget;
        }
    } else {
        //INTERCEPT
        for (var i = 0; i < ds_list_size(fighter_race); i++) {
                with (fighter_race[| i]) {
                    if (parentid == commandUnit)
                    {
                        intercept(command_x, command_y);
                    }
                }
            }
        scramble_fighters = true;
        fighter_targetid = noone;
        fighter_target_x = command_x;
        fighter_target_y = command_y;
    }
}
    

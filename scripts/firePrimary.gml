var commandUnit = argument0;
var command_x = argument1;
var command_y = argument2;

if (!instance_exists(commandUnit)) {
    exit;
}

commandUnit.fire_primary = true;
commandUnit.primary_target_dir = point_direction(commandUnit.x, commandUnit.y, command_x, command_y);

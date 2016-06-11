var commandUnit = argument0;
var command_x = argument1;
var command_y = argument2;

if (!instance_exists(commandUnit)) {
    exit;
}

commandUnit.fire_primary = true;
var fire_x = commandUnit.x + lengthdir_x(commandUnit.primary_origin_distance_offset,commandUnit.primary_origin_angle_offset);
var fire_y = commandUnit.y + lengthdir_y(commandUnit.primary_origin_distance_offset,commandUnit.primary_origin_angle_offset);
commandUnit.primary_target_dir = point_direction(fire_x, fire_y, command_x, command_y);

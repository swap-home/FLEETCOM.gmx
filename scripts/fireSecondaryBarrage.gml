var commandUnit = argument0;
var command_x = argument1;
var command_y = argument2;

if (!instance_exists(commandUnit)) {
    exit;
}

with (commandUnit) {
    secondary_barrage_duration = secondary_barrage_duration_max;
    secondary_barrage_cooldown = secondary_barrage_cooldown_max;
    secondary_barrage_x = command_x;
    secondary_barrage_y = command_y;
}

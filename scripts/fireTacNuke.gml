var commandUnit = argument0;
var command_x = argument1;
var command_y = argument2;

if (!instance_exists(commandUnit)) {
    exit;
}

with (commandUnit) {
    var ID = createChild(x, y, oUNSC_Shiva, point_direction(x,y,command_x,command_y));
    with (ID) {
        targetx = command_x;
        targety = command_y;
    }
    tacnuke -= 1;
    tacnuke_cooldown = tacnuke_cooldown_max;
}

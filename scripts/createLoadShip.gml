var name = argument0;
var type = argument1;
var experience = argument2;
var modules = argument3;

var ship_x = argument4;
var ship_y = argument5;
var ship_dir = argument6;

var shipid = instance_create(ship_x, ship_y, shiptype_to_objectindex(type));
with (shipid) {
    direction = ship_dir;
    side = UNSC;
    ship_name = name;
    ship_exp = experience;
    ship_modules = modules;
}

return shipid;

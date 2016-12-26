var name = argument0;
var type = argument1;
var experience = argument2;
var level = argument3;
var modules = argument4;
var skills = argument5;

var ship_x = argument6;
var ship_y = argument7;
var ship_dir = argument8;

var shipid = instance_create(ship_x, ship_y, shiptype_to_objectindex(type));
with (shipid) {
    direction = ship_dir;
    side = UNSC;
    ship_name = name;
    ship_exp = experience;
    ship_level = level;
    ship_modules = modules;
    ship_skills = skills;
}

return shipid;

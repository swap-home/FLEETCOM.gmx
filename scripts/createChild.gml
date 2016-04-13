var create_x = argument0;
var create_y = argument1;
var instance_type = argument2;
var create_direction = argument3;

// Also uses id, speed, direction, side, ai
if (!object_exists(instance_type)) {
    show_error("Could not create instance of type " + instance_type, true);
}

var ID = id;

var childId = instance_create(create_x, create_y, instance_type);
with (childId) {
    parentid = ID;
    //motion_add(ID.direction, ID.speed);
    side = ID.side;
    ai = ID.ai;
    direction = create_direction;
}
    
return childId;

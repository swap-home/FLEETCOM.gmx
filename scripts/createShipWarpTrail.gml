var shipid = argument0; // id of ship to spawn trail for
var size = argument1; // width multiplier of ship shadow to draw
var size_delta = argument2; // change in width multiplier per step
var alpha = argument3; // alpha of effect

with (instance_create(shipid.x, shipid.y, owarp)) {
    sprite_index = shipid.sprite_index;
    direction = shipid.direction;
    image_angle = shipid.direction;
    image_xscale = size;
    xscale_delta_speed = size_delta;
    image_alpha = alpha;
}

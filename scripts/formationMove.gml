var selection = argument0; //ds_list of units
var move_x = argument1;
var move_y = argument2;

// Use first unit as formation leader
// TODO: possibly use unit priority? eg. Bigger units become leaders?
var unitId = ds_list_find_value(selection, 0);
if (unitId.side == global.playerside)
{
    moveTo(unitId, move_x, move_y);
}
var centroid_x = unitId.x;
var centroid_y = unitId.y;
var group_direction = point_direction(centroid_x, centroid_y, move_x, move_y);
// Now to order units to move to the left/right of the leading unit
// Line Formation looks like
//      3                    2
//  1       ------------->   1
//    2                      3


// Ships will try to go to the closest destination to avoid strange criss-cross behavior
var unitids = ds_list_create();
ds_list_copy(unitids, selection);

var end_x = ds_list_create();
var end_y = ds_list_create();

var position = 1;
for (var i = 0; i < ds_list_size(selection); i++) {
    var unitId = ds_list_find_value(selection, i);
    if (instance_exists(unitId)) {
        if (unitId.side == global.playerside) {
            
            // add ending point of a ship
            if (position mod 2 == 1) {
                var right_position = (position - 1)/2;
                var right_direction = group_direction - separation_angle;
                var right_x = move_x + unit_separation * right_position * cos(degtorad(right_direction));
                var right_y = move_y - unit_separation * right_position * sin(degtorad(right_direction));
                ds_list_add(end_x, right_x);
                ds_list_add(end_y, right_y);
                
            } else {
                var left_position = position/2;
                var left_direction = group_direction + separation_angle;
                var left_x = move_x + unit_separation * left_position * cos(degtorad(left_direction));
                var left_y = move_y - unit_separation * left_position * sin(degtorad(left_direction));
                ds_list_add(end_x, left_x);
                ds_list_add(end_y, left_y);
            }   
            position++;
        }
    }
}

while (!ds_list_empty(unitids)) {
    var unitId = unitids[| 0];
    ds_list_delete(unitids, 0);
    
    var start_x = unitId.x;
    var start_y = unitId.y;
    
    var closest_dist = room_width+room_height;
    var closest_ind = -1;
    for (var i = 0; i < ds_list_size(end_x); i++) {
        var dist = point_distance(start_x, start_y, end_x[| i], end_y[| i]);
        if (dist < closest_dist) {
            closest_dist = dist;
            closest_ind = i;
        }
    }
    moveTo(unitId, end_x[| closest_ind], end_y[| closest_ind]);
    ds_list_delete(end_x, closest_ind);
    ds_list_delete(end_y, closest_ind);
}


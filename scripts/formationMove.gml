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
var position = 2;
// Now to order units to move to the left/right of the leading unit
// Line Formation looks like
//      3                    2
//  1       ------------->   1
//    2                      3
for (var i = 1; i < ds_list_size(selection); i++)
{
    var unitId = ds_list_find_value(selection, i);
    if (instance_exists(unitId)) {
        if (unitId.side == global.playerside)
        {
            if (position mod 2 == 1) 
            {
                var right_position = (position - 1)/2;
                var right_direction = group_direction - separation_angle;
                var right_x = move_x + unit_separation * right_position * cos(degtorad(right_direction));
                var right_y = move_y - unit_separation * right_position * sin(degtorad(right_direction));
                moveTo(unitId, right_x, right_y);
            } 
            else 
            {
                var left_position = position/2;
                var left_direction = group_direction + separation_angle;
                var left_x = move_x + unit_separation * left_position * cos(degtorad(left_direction));
                var left_y = move_y - unit_separation * left_position * sin(degtorad(left_direction));
                moveTo(unitId, left_x, left_y);
            }
        }
        position++;
    }
}

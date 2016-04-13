var source_id = argument0;      // firing obj
var target_id = argument1;      // target obj
var projectile_spd = argument2; // speed of the projectile to fire
var projectile_ind = argument3; // object index of projectile to fire
var list_return = argument4;    // id of a ds_list to return, the caller is responsible for deallocation

//  takes the above, and calculates intercept of a projectile from a source to a target
//  if succesful and projectile_ind is specified, 
//      creates a projectile, setting parentid, side, movespeed, direction
//  if succesful list_return is specified,
//      sets list[0] and list[1] to the x, y coordinates of the collision
//  then returns true if successful and false if not - if the enemy is moving away faster than your projectile, it will return false

//pull x,y, dx, dy from ids

var solution = false;
if (!instance_exists(source_id) || !instance_exists(target_id)) {
    return solution;
}

var v = projectile_spd;

var s_x = source_id.x;
var s_y = source_id.y;

var t_x = target_id.x;
var t_y = target_id.y;

var s_dx = lengthdir_x(source_id.speed, source_id.direction);
var s_dy = lengthdir_y(source_id.speed, source_id.direction);

var t_dx = lengthdir_x(target_id.speed, target_id.direction);
var t_dy = lengthdir_y(target_id.speed, target_id.direction);

var d_x = t_x - s_x;
var d_y = t_y - s_y;

var d_dx = t_dx - s_dx;
var d_dy = t_dy - s_dy;

//var d_dx = t_dx - s_dx;
//var d_dy = t_dy - s_dy;

var a = d_dx*d_dx + d_dy*d_dy - v*v;
var b = 2 * (d_dx * d_x + d_dy * d_y);
var c = d_x*d_x + d_y*d_y;    

var time = quadratic_smallest_nonnegative(a, b, c);
if (time >= 0) {
    solution = true;
    var collision_x = t_x + t_dx * time;
    var collision_y = t_y + t_dy * time;
    
    if (ds_exists(list_return, ds_type_list)) {
        list_return[| 0] = collision_x;
        list_return[| 1] = collision_y;
    }
    
    if (object_exists(projectile_ind)) {
        //not implemented 
    }
    
}

return solution;

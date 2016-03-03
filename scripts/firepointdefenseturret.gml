var number, targetid; 
var turret_R, turret_A, turret_x, turret_y;
var theta;

number = argument0;
targetid = argument1;

turret_R = pointdefenseturret_R[number];
turret_A = mod360(pointdefenseturret_A[number]);

theta = mod360(direction + turret_A);

turret_x = x + (turret_R*cos(theta));
turret_y = y - (turret_R*sin(theta));

var selfid;
selfid = id;

var ID;
ID = instance_create(turret_x,turret_y,oUNSC_50mm);
ID.side = selfid.side;
ID.parentid = selfid;
ID.targetid = targetid;

//default, overwrite if possible later
ID.direction = direction;

if (instance_exists(targetid))
{
    // calculus interception
    var interception_coords = ds_list_create();
    //TODO base firingSolution off of turret coords instead of ship center of mass
    if (firingSolution(selfid, targetid, 10, noone, interception_coords)) {
        ID.direction = point_direction(turret_x, turret_y, interception_coords[| 0], interception_coords[| 1]);        
    }
    ds_list_destroy(interception_coords);
    // simple extrapolation
    /*var traveltime = ceil(point_distance(x,y,targetid.x,targetid.y)/10); //movespeed of 50mm
    ID.direction = point_direction(turret_x, turret_y, 
        targetid.x+(lengthdir_x(targetid.movespeed*traveltime, targetid.direction)),
        targetid.y+(lengthdir_y(targetid.movespeed*traveltime, targetid.direction)));
    */
    
    // fire at current target position
    /*ID.direction = point_direction(turret_x, turret_y, targetid.x, targetid.y);
    */
}

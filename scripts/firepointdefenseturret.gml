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
var traveltime = ceil(point_distance(x,y,targetid.x,targetid.y)/10);
if (instance_exists(targetid))
{
    ID.direction = point_direction(turret_x, turret_y, 
        targetid.x+(lengthdir_x(targetid.movespeed*traveltime, targetid.direction)),
        targetid.y+(lengthdir_y(targetid.movespeed*traveltime, targetid.direction)));
    //ID.direction = point_direction(turret_x, turret_y, targetid.x, targetid.y);
}
else 
{
    ID.direction = direction;
}
ID.targetid = targetid;
ID.parentid = selfid;

var number, targetid; 
var turret_R, turret_A, turret_x, turret_y;
var theta, targetdir;

number = argument0;
targetid = argument1;

turret_R = pulselaserturret_R[number];
turret_A = mod360(pulselaserturret_A[number]);

theta = mod360(direction + turret_A);

turret_x = x + (turret_R*cos(theta));
turret_y = y - (turret_R*sin(theta));

var selfid;
selfid = id;

targetdir = point_direction(turret_x, turret_y, targetid.x, targetid.y);

global.shots++;
with (instance_create(turret_x,turret_y,oCove_PulseLaser))
{
    target = targetid;
    x = turret_x;
    y = turret_y;
    dir = targetdir;
    side = selfid.side;
    parentid = selfid;
}

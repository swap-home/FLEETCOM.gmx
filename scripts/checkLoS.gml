var xx, yy, dx, dy, cx, cy, instance, first_instance;
var _x = argument0;
var _y = argument1;
var range = argument2;
var dir = argument3;
var affects = argument4;

dx = 0;
dy = 0;
cx = 0;
cy = 0;

xx = _x + lengthdir_x(range, dir);
yy = _y + lengthdir_y(range, dir);

var selfid = id;

first_instance = collision_line(x, y, xx, yy, affects, false, true);

if (first_instance != noone)
{
    dx = xx - x;
    dy = yy - y;
    while (abs(dx) >= 1 || abs(dy) >= 1) 
    {
        dx /= 2;
        dy /= 2;
        instance = collision_line(x, y, xx - dx, yy - dy, affects, true, true);
        if (instance != noone) 
        {
            first_instance = instance;
            xx -= dx;
            yy -= dy;
        }
    }
}

cx = xx - dx;
cy = yy - (dy * 2);
if (first_instance != noone)
{
    return first_instance;
}

return noone;

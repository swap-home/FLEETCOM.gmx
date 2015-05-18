//requires targetid, direction, maxturnrate

var targetdir;
if (instance_exists(targetid))
{targetdir = point_direction(x,y,targetid.x,targetid.y);}
else
{exit;}

if (mod360(targetdir - direction) < 180)
{
    if (mod360(targetdir-direction) < maxturnrate){direction = targetdir;}
    else {direction += maxturnrate;}
}
else
{
    if (mod360(direction-targetdir) < maxturnrate){direction = targetdir;}
    else {direction -= maxturnrate;}
}
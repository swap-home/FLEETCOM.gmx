//requires obj vars x, y
var targetid = argument0;

var targetdir;
if (instance_exists(targetid))
{targetdir = point_direction(x,y,targetid.x,targetid.y);}
else
{exit;}

turnTowards(targetdir);

//requires targetid, direction, maxturnrate

var targetdir;
if (instance_exists(targetid))
{targetdir = point_direction(x,y,targetid.x,targetid.y);}
else
{exit;}

turnTowards(targetdir);

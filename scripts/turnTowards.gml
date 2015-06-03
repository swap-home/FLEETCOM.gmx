var targetdir = argument0;

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


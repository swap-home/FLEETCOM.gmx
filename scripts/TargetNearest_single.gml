var selfid;
var nearestid;
var nearestdist;
nearestdist = sight;
selfid = id;
with(oallsingleships)
{
    if (side!=call.side&&distance_to_object(selfid)<sight) 
    {
        var tmpdist;
        tmpdist = point_distance(call.x,call.y,x,y);
        if(tmpdist<nearestdist)
        {
            nearestid=id;
            nearestdist=tmpdist;
        }
    }
}

targetid = nearestid;
/*
if (targetid != -4 && targetid != 0)
{
    traveltime = ceil(point_distance(x,y,targetid.x,targetid.y)/movespeed);
    direction = point_direction(x,y,targetid.x+(targetid.image_xscale*targetid.movespeed*traveltime),targetid.y);
    
}
else
{
    if (side = 0){direction = 330;}
    else {direction = 210;}
}
*/
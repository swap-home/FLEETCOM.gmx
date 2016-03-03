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

var selfid;
var sight;
sight=argument0;
selfid=id;
objects_in_range=0;
capitalships_in_range=0;
singleships_in_range=0;
structures_in_range=0;
with(oallcapitalships){if(side!=selfid.side&&distance_to_object(selfid)<sight){if(id!=selfid)selfid.capitalships_in_range+=1;}}
with(oallstructures){if(side!=selfid.side&&distance_to_object(selfid)<sight){if(id!=selfid)selfid.structures_in_range+=1;}}

with(oallsingleships)
{
    if(side!=selfid.side&&distance_to_object(selfid)<sight)
    {
        if(id!=selfid)
        {
            selfid.singleships_targets[selfid.singleships_in_range] = id;
            selfid.singleships_in_range+=1;
        }
    }
}

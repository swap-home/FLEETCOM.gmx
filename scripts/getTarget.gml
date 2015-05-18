var selfid, enemies, criteria, sight, data;

selfid=id;

enemies=argument0;
criteria=argument1;
sight=argument2;
data=argument3;

/*
preconditions --------------------------------------

local variables read -------
id
side

parameters -------

enemies - id to ds_list of potential targets

criteria - method of targeting
0 = don't care, target any

1 = target nearest
2 = target nearest, with minimum range data

3 = target furthest
//target furthest with max range data === 2 with data <= sight

4 = target lowest life
5 = target lowest life above data

6 = target highest life
7 = target highest life below data

8 = target most clustered within radius data
9 = target most piercing with pierce range data
10 = target data id if it exists

sight - if non-zero, filter targets outside this range

data - used for some criteria

postconditions -----------------------------------------

adds id to targettedBy ds_list of targetid

targetid is set to either 0 or an existing id
returns targetid
*/

var i, check, tmpvar, tmpid, targets;

switch(criteria)
{
    case 1:
    case 2:
    case 4:
    case 5:
        tmpvar = 9999;
        tmpid = 0;
        break;
    case 3:
    case 6:
    case 7:
    case 8:
    case 9:
        tmpvar = 1;
        tmpid = 0;
        break;
}

for (i = 0; i < ds_list_size(enemies); i+=1)
{
    with (ds_list_find_value(enemies, i))
    {
        if (sight == 0 || sight >= distance_to_point(selfid.x, selfid.y))   //sight unspecified or within sight
        {
            switch (criteria)
            {
                case 0:     //don't care, target any
                    selfid.targetid = id;
                    return id;
                    //break;
                case 1:     //target nearest
                case 2:     //target nearest with minimum range data
                    check = distance_to_point(selfid.x, selfid.y);
                    if (check < tmpvar)
                    {
                        if (criteria == 2 && check < data){break;}
                        tmpvar = check;
                        tmpid = id;
                        if (criteria == 2 && check == data){return id;}
                    }
                    break;
                case 3:      //target furthest
                    check = distance_to_point(selfid.x, selfid.y);
                    if (check > tmpvar)
                    {
                        tmpvar = check;
                        tmpid = id;
                    }
                    break;
                case 4:     //target lowest health
                case 5:     //target lowest health above data
                    check = shield+hull;
                    if (check < tmpvar)
                    {
                        if (criteria == 4 && check < data){break;}
                        tmpvar = check;
                        tmpid = id;
                        if (criteria == 4 && check == data){return id;}
                    }
                    break;
                case 6:     //target highest health
                case 7:     //target highest health below data
                    check = shield+hull;
                    if (check > tmpvar)
                    {
                        if (criteria == 6 && check > data){break;}
                        tmpvar = check;
                        tmpid = id;
                        if (criteria == 6 && check == data){return id;}
                    }
                    break;
                case 8:     //target most clustered with radius data - naive implementation (check each unit as centroid)
                case 9:     //target most piercing with pierce range data - implement with detect collision?
                //collision_circle
                //collision_line
                    break;
            }
        }
    }
}
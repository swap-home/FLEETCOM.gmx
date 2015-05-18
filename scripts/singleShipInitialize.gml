//remove this later
hull_max = hull_max*7;
shield_max = shield_max*7;

if (instance_exists(parentid))
{
    singleship_damage = parentid.singleship_damage;
    singleship_rate = parentid.singleship_damage;
    singleship_speed = parentid.singleship_damage;
    singleship_range = parentid.singleship_damage;
}

hull = hull_max;
shield = shield_max;
movespeed = maxspeed;

alarm[0] = findtarget_delay;

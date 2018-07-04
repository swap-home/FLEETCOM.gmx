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

if (race == "unsc")
{
    autocannon_ammo = autocannon_ammo_max;
    asgm_ammo = asgm_ammo_max;
    bombcharge_ammo = bombcharge_ammo_max;
}

switch (side) {
    case UNSC:
        child_trail_color = c_yellow;
        break;
    case REBEL:
        child_trail_color = c_red;
        break;
    case COVE:
        child_trail_color = c_purple;
        break;
}

alarm[0] = findtarget_delay;

init = true;

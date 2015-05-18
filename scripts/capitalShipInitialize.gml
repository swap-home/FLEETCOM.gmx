//remove this later
hull_max = hull_max*7;
shield_max = shield_max*7;


hull = hull_max;
shield = shield_max;
movespeed = maxspeed;

if (race == "unsc")
{
    longsword = longsword_max;
    mac_cooldown = mac_cooldown_max;
}
else
{
    banshee = banshee_max;
    seraph = seraph_max;
    phantom = phantom_max;
    energyprojector_cooldown = energyprojector_cooldown_max;
}

alarm[0] = findtarget_delay;

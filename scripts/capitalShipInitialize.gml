//remove this later
hull_max = hull_max*7;
shield_max = shield_max*7;


hull = hull_max;
shield = shield_max;
movespeed = maxspeed;
security_level = security_level_initial;

if (race == "unsc")
{
    // Bonus fighters and transports if Hangar module
    if (ship_modules & MODULE_HANGAR) {
        longsword_max += 4;
        pelican_max += 2;
    }
    broadsword = broadsword_max;
    broadsword_deploy_cd = broadsword_deploy_cd_max;
    longsword = longsword_max;
    longsword_deploy_cd = longsword_deploy_cd_max;
    pelican = pelican_max;
    pelican_deploy_cd = pelican_deploy_cd_max;
    mac_cooldown = mac_cooldown_max;
    // MAC module
    if (ship_modules & MODULE_MAC) {
        mac = mac_max;
    }
    
}
else
{
    banshee = banshee_max;
    banshee_deploy_cd = banshee_deploy_cd_max;
    seraph = seraph_max;
    seraph_deploy_cd = seraph_deploy_cd_max;
    phantom = phantom_max;
    phantom_deploy_cd = phantom_deploy_cd_max;
    energyprojector_cooldown = energyprojector_cooldown_max;
}

alarm[0] = findtarget_delay;

init = true;

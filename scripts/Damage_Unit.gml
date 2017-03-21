var basedmg, attackerid, targetid, damagetype;

basedmg = argument0;
attackerid = argument1;
targetid = argument2;
damagetype = argument3;

if (basedmg == 0 || !instance_exists(targetid) || targetid.invulnerable){exit;}

if (targetid.shield > 0)  //damage shields
{
    var tmpdmg, tmpratio;
    tmpratio = global.damageRatio[enumDamageTypes(damagetype),1];
    tmpdmg = basedmg * tmpratio;
    
    if (tmpdmg > targetid.shield)
    {
        targetid.shield = 0;
        Damage_Unit((tmpdmg-targetid.shield)/tmpratio, attackerid, targetid, damagetype);
    }
    else
    {
        targetid.shield -= tmpdmg;
    }
}
else    //damage hull (titianiumA or battleplating
{
    var tmpdmg, tmpratio;
    if (targetid.race == "unsc"){tmpratio = global.damageRatio[enumDamageTypes(damagetype),0];}
    else if (targetid.race == "cove"){tmpratio = global.damageRatio[enumDamageTypes(damagetype),2];}
    else {tmpratio = 1;}
    tmpdmg = basedmg * tmpratio;
    
    // apply directional damage
    if (targetid.takes_directional && damagetype != "boarding") {
        var incoming_direction = point_direction(attackerid.x, attackerid.y, targetid.x, targetid.y);
        if (abs(angle_difference(targetid.direction+180, incoming_direction)) < front_angle) {
            tmpdmg *= front_dmg;
        } else if (abs(angle_difference(targetid.direction, incoming_direction)) < back_angle) {
            tmpdmg *= back_dmg;
        } else {
            tmpdmg *= side_dmg;
        }
    }
    
    targetid.hull -= tmpdmg;
    with (targetid){
        if (hull <= 0 && targetid != 0) { // TODO: what is this targetid != 0 doing?
            var parent = attackerid;
            while (instance_exists(parent) && parent.parentid != noone) {
                parent = parent.parentid;
            }
            if (instance_exists(parent) && object_is_ancestor(parent.object_index, oallcapitalships)) {
                with (parent) {
                    if (ds_map_exists(global.exp_reward, targetid.object_index)) {
                        ship_exp += global.exp_reward[? targetid.object_index];
                    }
                }
            }
            instance_destroy();
        }
    }

}

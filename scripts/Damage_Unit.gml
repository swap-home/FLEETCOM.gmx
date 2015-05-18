var basedmg, attackerid, targetid, damagetype;

basedmg = argument0;
attackerid = argument1;
targetid = argument2;
damagetype = argument3;

if (basedmg == 0 || !instance_exists(targetid)){exit;}

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
else                                                    //damage hull (titianiumA or battleplating
{
    var tmpdmg, tmpratio;
    if (race == "unsc"){tmpratio = global.damageRatio[enumDamageTypes(damagetype),0];}
    else if (race == "cove"){tmpratio = global.damageRatio[enumDamageTypes(damagetype),2];}
    tmpdmg = basedmg * tmpratio;
    
    targetid.hull -= tmpdmg;
    with (targetid){
        if (hull <= 0 && targetid != 0) {
            //show_message(string(targetid) + " " + object_get_name(object_index));
            instance_destroy();
            
            //TODO: Update the killboard
        }
    }

}
var affects, expid;
affects = argument0;
expid = argument1;

with (expid) {
    if (explosive_aoe) {
        with (affects) {
            var dist = distance_to_point(expid.x, expid.y);
            if (dist > expid.explosive_range) {continue;}
            else {
                var kinetic_dmg = (1-dist/expid.explosive_range) 
                    * (expid.explosive_full_dmg_kinetic - expid.explosive_falloff_dmg_kinetic) + expid.explosive_falloff_dmg_kinetic;
                var explosive_dmg = (1-dist/expid.explosive_range) * (expid.explosive_full_dmg_explosive - expid.explosive_falloff_dmg_explosive) + expid.explosive_falloff_dmg_explosive;
                var thermal_dmg = (1-dist/expid.explosive_range) * (expid.explosive_full_dmg_thermal - expid.explosive_falloff_dmg_thermal) + expid.explosive_falloff_dmg_thermal;
                Damage_Unit(kinetic_dmg, expid, id, "kinetic");
                Damage_Unit(explosive_dmg, expid, id, "explosive");
                Damage_Unit(thermal_dmg, expid, id, "thermal");
            }
        }
    }
}

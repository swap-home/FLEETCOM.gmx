var group = argument0;

if (!ds_exists(group, ds_type_list)) {
    return 1;
}

// Return 0 if all units are off cooldown, else return lowest non-zero remaining cooldown
var lowest = 2;
for (var i = 0; i < ds_list_size(group); i++) {
    var unitId = group[| i];
    
    var cd_percent = unitId.secondary_barrage_cooldown/unitId.secondary_barrage_cooldown_max;
    if (cd_percent != 0 && cd_percent < lowest) {
        lowest = cd_percent;
    }
}

// All units off cooldown == 0
if (lowest == 2) {
    return 0;
}
return lowest;

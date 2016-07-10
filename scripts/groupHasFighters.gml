var group = argument0;

if (!ds_exists(group, ds_type_list)) {
    return false;
}

for (var i = 0; i < ds_list_size(group); i++) {
    var unitId = group[| i];
    if (unitId.race == "unsc") {
        if (unitId.broadsword_max > 0 || unitId.longsword_max > 0) {
            return true;
        }
    } else if (unitId.race == "cove") {
        if (unitId.banshee_max > 0 || unitId.seraph_max > 0) {
            return true;
        }
    }
}

return false;

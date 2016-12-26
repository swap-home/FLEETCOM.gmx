var savemgrid = id;

var indices_to_remove = ds_list_create();

for (var i = 0; i < ds_list_size(ship_id); i++) {
    var shipid = ship_id[| i];
    if (shipid == noone) {
        continue;
    } else if (!instance_exists(shipid)) {
        ds_list_add(indices_to_remove,i);
    } else {
        ship_name[| i] = shipid.ship_name;
        ship_exp[| i] = shipid.ship_exp;
        ship_level[| i] = shipid.ship_level;
        ship_modules[| i] = shipid.ship_modules;
        ship_skills[| i] = shipid.ship_skills;
    }
}

// Iterate in reverse to remove dead ships
for (var i = ds_list_size(ship_id)-1; i >= 0; i--) {
    if (ship_id[| i] != noone && !instance_exists(ship_id[| i])) {
        ds_list_delete(ship_name, i);
        ds_list_delete(ship_type, i);
        ds_list_delete(ship_exp, i);
        ds_list_delete(ship_level, i);
        ds_list_delete(ship_modules, i);
        ds_list_delete(ship_skills, i);
    }
}
ds_list_destroy(indices_to_remove);

with (oallcapitalships) {
    if (side == UNSC && !unselectable && !object_is_ancestor(id.object_index,oUNSCstructures)) {
        if (ds_list_find_index(savemgrid.ship_id, id) == -1) {
            var shipindex = objectindex_to_shiptype(object_index);
            if (shipindex != NO_SHIP) {
                ds_list_add(savemgrid.ship_name, id.ship_name);
                ds_list_add(savemgrid.ship_type, shipindex);
                ds_list_add(savemgrid.ship_exp, id.ship_exp);
                ds_list_add(savemgrid.ship_level, id.ship_level);
                ds_list_add(savemgrid.ship_modules, id.ship_modules);
                ds_list_add(savemgrid.ship_skills, id.ship_skills);
            }
        }
    }
}
ship_count = ds_list_size(ship_name);

// at the end of a mission, update save manager with ship stats from ship instances
// TODO REDO
var savemgrid = id;

for (var i = 0; i < ds_list_size(ship_status); i++) {
    var shipid = ship_id[| i];
    // Ship not in current mission, do not update
    if (ship_status[| i] != SAVE_SHIP_STATUS_ACTIVE) {
        continue;
    // Otherwise check ship
    } else if (ship_status[| i] == SAVE_SHIP_STATUS_ACTIVE) {
        // Ship destroyed during mission
        if (!instance_exists(shipid)) {
            ship_status[| i] = SAVE_SHIP_STATUS_DESTROYED;
        } else {
            ship_name[| i] = shipid.ship_name;
            ship_exp[| i] = shipid.ship_exp;
            ship_level[| i] = shipid.ship_level;
            ship_health[| i] = shipid.hull/shipid.hull_max;
            ds_map_destroy(ship_modules[| i]);
            ship_modules[| i] = saveModules(shipid);
        }
    }
}

with (oallcapitalships) {
    if (side == UNSC && !unselectable && !object_is_ancestor(id.object_index,oUNSCstructures)) {
        if (ds_list_find_index(savemgrid.ship_id, id) == -1) {
            var shipindex = objectindex_to_shiptype(object_index);
            if (shipindex != NO_SHIP) {
                ds_list_add(savemgrid.ship_name, id.ship_name);
                ds_list_add(savemgrid.ship_type, shipindex);
                ds_list_add(savemgrid.ship_exp, id.ship_exp);
                ds_list_add(savemgrid.ship_level, id.ship_level);
                ds_list_add(savemgrid.ship_modules, saveModules(id));
            }
        }
    }
}
ship_count = ds_list_size(ship_name);

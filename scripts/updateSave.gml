var savemgrid = id;
with (oallcapitalships) {
    if (side == UNSC && !unselectable) {
        var shipindex = objectindex_to_shiptype(object_index);
        if (shipindex != NO_SHIP) {
            ds_list_add(savemgrid.ship_name, id.ship_name);
            ds_list_add(savemgrid.ship_type, shipindex);
            ds_list_add(savemgrid.ship_exp, ship_exp);
            ds_list_add(savemgrid.ship_modules, ship_modules);
        }
    }
}
ship_count = ds_list_size(ship_name);

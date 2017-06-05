// initializes new save for save manager

saveslot = argument0;

resetSave();

mission = 0;
credits = 0;
ship_count = 1;
ds_list_add(ship_name, "UNSC Seven Seas");
ds_list_add(ship_type, FRIGATE_CHARON);
ds_list_add(ship_exp, 0);
ds_list_add(ship_level, 0);
ds_list_add(ship_health, 1);
var map_id = ds_map_create();
ds_list_add(ship_modules, map_id);
map_id[? MODULE_HELIX] = 2;
map_id[? MODULE_ARES] = 4;
map_id[? MODULE_HANGAR] = 2;
map_id[? MODULE_TRANSPORT] = 4;
map_id[? MODULE_TOWER] = 3;
ds_list_add(ship_status, SAVE_SHIP_STATUS_ACTIVE);
ds_list_add(ship_id, noone);

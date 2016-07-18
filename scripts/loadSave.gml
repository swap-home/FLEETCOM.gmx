saveslot = argument0;

var savefile = file_text_open_read(working_directory+"\save"+string(saveslot)+".txt");
if (savefile != -1) {
    mission = file_text_read_real(savefile);
    ship_count = file_text_read_real(savefile);
    for (var i = 0; i < ship_count; i++) {
        ds_list_add(ship_name, file_text_read_string(savefile));
        ds_list_add(ship_type, file_text_read_real(savefile));
        ds_list_add(ship_exp, file_text_read_real(savefile));
        ds_list_add(ship_modules, file_text_read_real(savefile));
    }
}

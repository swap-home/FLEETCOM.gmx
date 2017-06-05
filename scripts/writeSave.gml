// write save manager state into savefile

var savefile = file_text_open_write(working_directory+"save"+string(saveslot)+".txt");
if (savefile == -1) {
    show_debug_message("Could not write to " + working_directory);
} else {
    file_text_write_real(savefile, mission);
    file_text_write_real(savefile, credits);
    file_text_write_real(savefile, ship_count);
    for (var i = 0; i < ship_count; i++) {
        file_text_writeln(savefile);
        file_text_write_string(savefile, ship_name[| i]);
        file_text_writeln(savefile);
        file_text_write_real(savefile, ship_type[| i]);
        file_text_write_real(savefile, ship_exp[| i]);
        file_text_write_real(savefile, ship_level[| i]);
        file_text_write_string(savefile, ds_map_write(ship_modules[| i]));
        file_text_write_real(savefile, ship_status[| i]);
    }
    file_text_close(savefile);
}

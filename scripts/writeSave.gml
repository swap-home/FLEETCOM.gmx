var savefile = file_text_open_write(working_directory+"\save"+string(saveslot)+".txt");
file_text_write_real(savefile, mission);
file_text_write_real(savefile, ship_count);
for (var i = 0; i < ship_count; i++) {
    file_text_write_string(savefile, ship_name[| i]);
    file_text_write_real(savefile, ship_type[| i]);
    file_text_write_real(savefile, ship_exp[| i]);
    file_text_write_real(savefile, ship_modules[| i]);
}

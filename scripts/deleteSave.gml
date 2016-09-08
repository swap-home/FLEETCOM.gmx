var slot = argument0;

if (file_exists(working_directory+"save"+string(slot)+".txt")) {
    file_delete(working_directory+"save"+string(slot)+".txt");
}

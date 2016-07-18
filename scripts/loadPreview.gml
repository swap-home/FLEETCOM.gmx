var savenum = argument0;
var result = argument1;

var savefile = file_text_open_read(working_directory+"\save"+string(savenum)+".txt");
if (savefile != -1) {
    result[| 0] = file_text_read_real(savefile);
    result[| 1] = file_text_read_real(savefile);
} else {
    result[| 0] = -1;
    result[| 1] = -1;
}

return result;

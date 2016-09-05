var text = argument0;
var fade_begin = argument1;
var fade_end = argument2;
var width = argument3;
var height = argument4;

if (!instance_exists(global.ui_controller)) {
    show_debug_message("textbox_show called but ui controller does not exist");
    exit;
}

with (global.ui_controller) {
    text_string = text;
    text_fade_begin = fade_begin;
    text_fade_end = fade_end;
    textbox_width = width;
    textbox_height = height;
    text_fade_counter = 0;
    text_show_count = 0;
    textbox_text_alpha = 1.0;
}

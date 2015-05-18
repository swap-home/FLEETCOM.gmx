var x1, y1, x2, y2;
var width, height;
var value, value_max;
var border; 
x1 = argument0;
y1 = argument1;
width = argument2;
height = argument3;
value = argument4;
value_max = argument5;
if(value_max = 0){exit}
border = 1;
draw_set_color(c_black);
draw_rectangle(x1-border, y1-border, x1+width+border, y1+height+border, false);
x2 = x1 + (value/value_max * width);
if value < 0 then
x2 = x1-border;
y2 = y1 + height;
draw_set_color(c_blue);
draw_rectangle(x1,y1,x2,y2,false);
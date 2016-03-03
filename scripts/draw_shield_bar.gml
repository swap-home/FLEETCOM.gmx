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
if(value_max <= 0 || value <= 0){exit}
x2 = x1 + (value/value_max * width);
y2 = y1 + height;
draw_set_color(c_blue);
draw_rectangle(x1,y1,x2,y2,false);

var x1, y1, x2, y2;
var width, height;
var value, value_max;
var border;
var color1, color2;

x1 = argument0;
y1 = argument1;
width = argument2;
height = argument3;
value = argument4;
value_max = argument5;
color1 = argument6;
color2 = argument7;

// draws a rectangular bar from x1,y1 to x2,y2 with border, 
// with color ranging from color1 to color2 from 0 -> 100%

if(value_max <= 0 || value <= 0){exit}
if(value > value_max){value = value_max;}
x2 = x1 + (value/value_max * width);
y2 = y1 + height;
draw_set_color(merge_color(color1, color2, value/value_max));
draw_rectangle(x1,y1,x2,y2,false);


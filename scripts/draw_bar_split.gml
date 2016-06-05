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

// draws two rectangular bars from x1,y1 to x2,y2 with border
// with left bar having color1, right bar having color2
// proportions are split value/value_max

if(value_max <= 0 || value <= 0){exit}
if(value > value_max){value = value_max;}
x2 = x1 + (value/value_max * width);
y2 = y1 + height;
draw_set_color(color1);
draw_rectangle(x1,y1,x2,y2,false);
draw_set_color(color2);
draw_rectangle(x2,y1,x1+width,y2,false);


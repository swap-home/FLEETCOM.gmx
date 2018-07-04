/// draw_rectangle_cd_tex(x1, y1, x2, y2, value, texture, color)
// https://forum.yoyogames.com/index.php?threads/ring-health-bar-help.24093/
var oldColor = draw_get_color();
draw_set_color(argument6);

var v, x1, y1, x2, y2, xm, ym, vd, vx, vy, vl;
v = argument4
if (v <= 0) return 0 // nothing to be drawn
x1 = argument0; y1 = argument1; // top-left corner
x2 = argument2; y2 = argument3; // bottom-right corner
//if (v >= 1) return draw_rectangle(x1, y1, x2, y2, false) // entirely filled
xm = (x1 + x2) / 2; ym = (y1 + y2) / 2; // middle point
draw_primitive_begin_texture(pr_trianglefan, argument5)
draw_vertex_texture(xm, ym, 0.5, 0.5); draw_vertex_texture(xm, y1, 0.5, 0)
// draw corners:
if (v >= 0.125) draw_vertex_texture(x2, y1, 1, 0)
if (v >= 0.375) draw_vertex_texture(x2, y2, 1, 1)
if (v >= 0.625) draw_vertex_texture(x1, y2, 0, 1)
if (v >= 0.875) draw_vertex_texture(x1, y1, 0, 0)
// calculate angle & vector from value:
vd = pi * (v * 2 - 0.5)
vx = cos(vd)
vy = sin(vd)
// normalize the vector, so it hits -1\+1 at either side:
vl = max(abs(vx), abs(vy))
if (vl < 1) {
    vx /= vl
    vy /= vl
}
draw_vertex_texture(xm + vx * (x2 - x1) / 2, ym + vy * (y2 - y1) / 2, 0.5 + vx * 0.5, 0.5 + vy * 0.5)
draw_primitive_end()

draw_set_color(oldColor);

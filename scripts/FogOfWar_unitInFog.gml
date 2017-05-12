var point_x = argument0;
var point_y = argument1;
var focus = argument2;
var grid = argument3;

return !ds_grid_get(grid, point_x div focus, point_y div focus);

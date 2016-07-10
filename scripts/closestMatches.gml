// similar to Stable Matching Problem - Gale Shapley algorithm
// Hungarian algorithm

// ds_lists of coordinates
// assumed sizes of lists are equal
var begin_x = argument0;
var begin_y = argument1;
var end_x = argument2;
var end_y = argument3;

var result = argument4;
// returns a ds_list with begin coordinates 
//  matching end coordinates with pareto efficiency

// example:
// result[0] = 2
// result[1] = 0
// result[2] = 1
// means
// distance(begin_x[0], begin_x[0], end_x[2], end_y[2]) +
// distance(begin_x[1], begin_x[1], end_x[0], end_y[0]) +
// distance(begin_x[2], begin_x[2], end_x[1], end_y[1]) 
// is minimized s.t. no other pairing results in a lower total distance

var size = ds_list_size(begin_x);

var prefer_grid = ds_list_create();

for (var i = 0; i < size; i++) {
    var distances_to_end = ds_list_create();
    var preferred_order = ds_list_create();
    for (var j = 0; j < size; j++) {
        distances_to_end[| j] = point_distance(begin_x[| i], begin_y[| i], end_x[| j], end_y[| j]);
    }
    // insertion sort good enough for small lists
    ds_list_insert(preferred_order, 0, 0);
    for (var j = 1; j < size; j++) {
        var pos = 0;
        while (distances_to_end[| j] > distances_to_end[| pos] && pos != ds_list_size(preferred_order)) {
            pos++;
        }
        ds_list_insert(preferred_order, pos, j);
    }
    ds_list_destroy(distances_to_end);
    prefer_grid[| i] = preferred_order;
}

ds_list_clear(result);
for (var i = 0; i < size; i++) {
    result[| i] = -1;
}

var free_pos = ds_list_find_index(result, -1);
while (free_pos != -1) {
    result[| free_pos] = ds_list_find_value(prefer_grid[| free_pos], 0);
    // check if already taken, if so, resolve
    for (var i = 0; i < size; i++) {
        if (result[| i] == result[| free_pos] && i != free_pos) {
            if (point_distance(begin_x[| i], begin_y[| i], end_x[| preferred_order[| 0]], end_y[| preferred_order[| 0]])
                < point_distance(begin_x[| free_pos], begin_y[| free_pos], end_x[| preferred_order[| 0]], end_y[| preferred_order[| 0]])) {
                if (ds_list_size(prefer_grid[| free_pos]) > 1) {
                    ds_list_delete(prefer_grid[| free_pos], 0);
                    result[| free_pos] = -1;
                }
            }
        }
    }
    free_pos = ds_list_find_index(result, -1);
}
    
for (var i = 0; i < size; i++) {
    ds_list_destroy(prefer_grid[| i]);
}
ds_list_destroy(prefer_grid);

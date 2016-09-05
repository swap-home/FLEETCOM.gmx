var shipid = argument0;
var result = argument1;

// takes a shipid, returns current/total module capacity as result[| 0] / result[| 1]
// result is a ds_list and should be destroyed by the caller

ds_list_clear(result);
result[| 0] = 0;
result[| 1] = 0;


var shiptype = objectindex_to_shiptype(shipid.object_index);

// Get current capacity from modules
var modules = shipid.ship_modules;
var checkbit = 1;
while (modules != 0) {
    if (modules & checkbit) {
        var moduletype = modulebit_to_moduleupgrade(checkbit);
        if (moduletype != NO_UPGRADE) {
            result[| 0]++;
        }
        modules -= checkbit;
    }
    checkbit *= 2;
}

// Get total capacity from exp
var experience = shipid.ship_exp;
for (var i = 0; i < MAX_LEVELUPS; i++) {
    if (experience >= global.exp_level[| i]) {
        experience -= global.exp_level[| i];
    } else {
        result[| 1] = i;
        break;
    }
}

return result;

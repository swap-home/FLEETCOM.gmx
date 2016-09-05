var shipid = argument0;

// takes a shipid, returns its fleet strength, requires game menu controller
var ctrlid = instance_find(oGameMenucontroller, 0);
if (ctrlid == noone) {
    return 0;
}

if (!object_is_ancestor(shipid, oallcapitalships)) {
    return 0;
}

var fleetStrength = 0;

var shiptype = objectindex_to_shiptype(shipid.object_index);
if (shiptype != NO_SHIP && ds_map_exists(ctrlid.fleetStrength, shiptype)) {
    fleetStrength += ctrlid.fleetStrength[? shiptype];
}

var modules = shipid.ship_modules;
var checkbit = 1;
while (modules != 0) {
    if (modules & checkbit) {
        var moduletype = modulebit_to_moduleupgrade(checkbit);
        if (moduletype != NO_UPGRADE && ds_map_exists(ctrlid.fleetStrength, moduletype)) {
            fleetStrength += ctrlid.fleetStrength[? moduletype];
        }
        modules -= checkbit;
    }
    checkbit *= 2;
}

return fleetStrength;

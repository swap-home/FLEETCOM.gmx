var unitId = argument0;
var duration = argument1; // in seconds

if (!object_is_ancestor(unitId.object_index, oallcapitalships)) {
    exit;
}

var rand = irandom(3);

switch (rand) {
    case 0: 
        status_half_pointdefense += duration * STEPS_PER_SECOND;
        break;
    case 1:
        status_half_secondary += duration * STEPS_PER_SECOND;
        break;
    case 2:
        status_half_primarycharge += duration * STEPS_PER_SECOND;
        break;
    case 3:
        status_immobilization += duration * STEPS_PER_SECOND;
        break;
}
    

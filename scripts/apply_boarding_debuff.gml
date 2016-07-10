var unitId = argument0;
var duration = argument1; // in seconds

if (!object_is_ancestor(unitId.object_index, oallcapitalships)) {
    exit;
}

status_half_primarycharge += duration * STEPS_PER_SECOND;
status_half_secondary += duration * STEPS_PER_SECOND;
status_half_pointdefense += duration * STEPS_PER_SECOND;
status_half_fighter_deploymax += duration * STEPS_PER_SECOND;
status_half_speed += duration * STEPS_PER_SECOND;    

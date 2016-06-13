var commandUnit = argument0;

commandUnit.move_x = commandUnit.x;
commandUnit.move_y = commandUnit.y;
commandUnit.assignedMove_x = commandUnit.x;
commandUnit.assignedMove_y = commandUnit.y;

commandUnit.fire_primary = false;
ds_list_clear(commandUnit.transport_targetid_queue);

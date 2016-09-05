var credit_reward = argument0;
var progress_mission = argument1;

if (!instance_exists(global.save_manager)) {
    show_debug_message("ERROR: Could not find save manager to save ships");
    exit;
}

with (oallcapitalships) {
    // Retreat surviving enemy ships
    if (side == COVE || side == REBEL) {
        createShipWarpTrail(id, 5, 0.5, 0.5);
        instance_destroy();
    
    } 
    // Add mission exp to player ships
    else if (side == UNSC) {
        ship_exp += 25;
    }
}

var end_text = "Mission Complete##";
with (global.save_manager) {
    end_text += "Credits: " + string(credits) + " -> " + string(credits+credit_reward) + "cR##";
    credits += credit_reward;
    for (var i = 0; i < ds_list_size(ship_id); i++) {
        // Skip ships not participating in current mission
        if (ship_id[| i] == noone) {
            continue;
        }
        end_text += ship_name[| i] + ": ";
        var shipid = ship_id[| i];
        if (!instance_exists(shipid)) {
            end_text += "Lost with all hands";
        } else {
            if (shipid.hull <= 0.1 * shipid.hull_max) {
                end_text += "Catastrophic damage, ";
            } else if (shipid.hull <= 0.25 * shipid.hull_max) {
                end_text += "Badly damaged, ";
            } else if (shipid.hull <= 0.5 * shipid.hull_max) {
                end_text += "Awaiting repairs, ";
            } else if (shipid.hull <= 0.8 * shipid.hull_max) {
                end_text += "Venting atmosphere, ";
            } else if (shipid.hull < 1.0) {
                end_text += "Sustained light damage, ";
            } else {
                end_text += "Hull intact, "
            }
            
            end_text += "XP: " + string(ship_exp[| i]) + " -> " + string(shipid.ship_exp) + "#";
        }
    }
}

textbox_show(end_text, 200, 260, 800, 600);

if (progress_mission) {
    global.save_manager.mission++;
}

with (global.save_manager) {
    updateSave();
    writeSave();
}

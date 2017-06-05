// convert ship instance vars to map of modules and return map

var shipid = argument0;

var module_map = ds_map_create();
for (var i = 0; i < MODULE_MAX; ++i) {
    switch (i) {
        case MODULE_LMAC: 
            if (shipid.lmac > 0)
            module_map[? i] = shipid.lmac;
            break;
        case MODULE_HMAC:
            if (shipid.hmac > 0)
            module_map[? i] = shipid.hmac / 2;
            break;
        case MODULE_ARES:
            if (shipid.ares > 0)
            module_map[? i] = shipid.ares;
            break;
        case MODULE_HELIX:
            if (shipid.helix > 0)
            module_map[? i] = shipid.helix;
            break;
        case MODULE_ARCHER:
            if (shipid.archerpod > 0)
            module_map[? i] = shipid.archerpod / 6;
            break;
        case MODULE_PDT:
            if (shipid.pdt > 0)
            module_map[? i] = shipid.pdt / 2;
            break;
        case MODULE_LANCE:
            if (shipid.lance > 0)
            module_map[? i] = shipid.lance;
            break;
        case MODULE_RAPIER:
            if (shipid.rapier > 0)
            module_map[? i] = shipid.rapier / 4;
            break;
        case MODULE_HOWLER:
            if (shipid.howler > 0)
            module_map[? i] = shipid.howler / 2;
            break;
        case MODULE_SCANNER:
            if (shipid.scanner > 0)
            module_map[? i] = shipid.scanner;
            break;
        case MODULE_REPAIR:
            if (shipid.repair > 0)
            module_map[? i] = shipid.repair;
            break;
        case MODULE_ODST:
            if (shipid.odst_detachment > 0)
            module_map[? i] = shipid.odst_detachment;
            break;
        case MODULE_THRUSTER:
            if (shipid.emergency_thruster > 0)
            module_map[? i] = shipid.emergency_thruster;
            break;
        case MODULE_HORNET:
            if (shipid.hornet_mines_max > 0)
            module_map[? i] = shipid.hornet_mines_max;
            break;
        case MODULE_HANGAR:
            if (max(shipid.longsword_max, shipid.broadsword_max) > 0)
            module_map[? i] = max(shipid.longsword_max, shipid.broadsword_max) / 2;
            break;
        case MODULE_TOWER:
            if (max(shipid.longsword_deploy_max, shipid.broadsword_deploy_max) - 1 > 0)
            module_map[? i] = max(shipid.longsword_deploy_max, shipid.broadsword_deploy_max) - 1;
            break;
        case MODULE_SHIVA:
            if (shipid.shiva_nuke_max > 0)
            module_map[? i] = shipid.shiva_nuke_max;
            break;
        case MODULE_SCANDRONE:
            if (shipid.scanner_remote_max > 0)
            module_map[? i] = shipid.scanner_remote_max;
            break;
        case MODULE_REPAIRDRONE:
            if (shipid.emergency_repair > 0)
            module_map[? i] = shipid.emergency_repair;
            break;
        case MODULE_BARRACKS:
            if (shipid.security_level_garrison > 0)
            module_map[? i] = shipid.security_level_garrison;
            break;
        case MODULE_TRANSPORT:
            if (shipid.pelican_max > 0)
            module_map[? i] = shipid.pelican_max;
            break;
        default:
            show_debug_message("module " + string(i) + " could not be saved");
            break;
    }
}

return module_map;


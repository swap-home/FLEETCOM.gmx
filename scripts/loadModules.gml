var module_map = argument0;
var shipid = argument1;

//reset ship modules to 0
with (shipid) {
    lmac = 0;
    hmac = 0;
    ares = 0;
    helix = 0;
    archerpod = 0;
    pdt = 0;
    lance = 0;
    rapier = 0;
    howler = 0;
    scanner = 0;
    repair = 0;
    odst_detachment = 0;
    emergency_thruster = 0;
    hornet_mines_max = 0;
    longsword_max = 0;
    longsword_deploy_max = 1;
    broadsword_max = 0;
    broadsword_deploy_max = 1;
    shiva_nuke_max = 0;
    scanner_remote_max = 0;
    emergency_repair = 0;
    pelican_max = 0;
}

show_debug_message(json_encode(module_map));
for (var i = 0; i < MODULE_MAX; ++i) {
    // TODO: There is no good map iteration, we'll use a hack for O(n)
    if (ds_map_exists(module_map, i)) {
        switch (i) {
            case MODULE_LMAC: 
                shipid.lmac = module_map[? i];
                break;
            case MODULE_HMAC:
                shipid.hmac = module_map[? i] * 2;
                break;
            case MODULE_ARES:
                shipid.ares = module_map[? i];
                break;
            case MODULE_HELIX:
                shipid.helix = module_map[? i];
                break;
            case MODULE_ARCHER:
                shipid.archerpod = module_map[? i] * 6;
                break;
            case MODULE_PDT:
                shipid.pdt = module_map[? i] * 2;
                break;
            case MODULE_LANCE:
                shipid.lance = module_map[? i];
                break;
            case MODULE_RAPIER:
                shipid.rapier = module_map[? i] * 4;
                break;
            case MODULE_HOWLER:
                shipid.howler = module_map[? i] * 2;
                break;
            case MODULE_SCANNER:
                shipid.scanner = module_map[? i];
                break;
            case MODULE_REPAIR:
                shipid.repair = module_map[? i];
                break;
            case MODULE_ODST:
                shipid.odst_detachment = module_map[? i];
                break;
            case MODULE_THRUSTER:
                shipid.emergency_thruster = module_map[? i];
                break;
            case MODULE_HORNET:
                shipid.hornet_mines_max = module_map[? i];
                break;
            case MODULE_HANGAR:
                shipid.longsword_max = module_map[? i] * 2;
                break;
            case MODULE_TOWER:
                shipid.longsword_deploy_max = module_map[? i] + 1;
                shipid.broadsword_deploy_max = module_map[? i] + 1;
                break;
            case MODULE_SHIVA:
                shipid.shiva_nuke_max = module_map[? i];
                break;
            case MODULE_SCANDRONE:
                shipid.scanner_remote_max = module_map[? i];
                break;
            case MODULE_REPAIRDRONE:
                shipid.emergency_repair = module_map[? i];
                break;
            case MODULE_BARRACKS:
                shipid.security_level_garrison = module_map[? i];
                break;
            case MODULE_TRANSPORT:
                shipid.pelican_max = module_map[? i];
                break;
            default:
                //TODO: report some bug with module not listed for saving
                break;
        }
    }
}


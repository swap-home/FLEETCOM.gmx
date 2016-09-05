var moduleupgrade = argument0;

switch (moduleupgrade) {
    case UPGRADE_MAC:
        return MODULE_MAC;
    case UPGRADE_HANGAR:
        return MODULE_HANGAR;
}

return NO_UPGRADE;

var modulebit = argument0;

switch (modulebit) {
    case MODULE_MAC:
        return UPGRADE_MAC;
    case MODULE_HANGAR:
        return UPGRADE_HANGAR;
}

return NO_UPGRADE;

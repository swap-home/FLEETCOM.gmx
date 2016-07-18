var ship_index = argument0;

switch (ship_index) {
    case oUNSC_corvette_fast:
        return CORVETTE_FAST;
    case oUNSC_corvette_repair:
        return CORVETTE_REPAIR;
    case oUNSC_frigate_charonL:
        return FRIGATE_CHARON;
    case oUNSC_frigate_parisH:
        return FRIGATE_PARIS;
    case oUNSC_destroyer_diligence:
        return DESTROYER_DILIGENCE;
    case oUNSC_destroyer_halberd:
        return DESTROYER_HALBERD;
    case oUNSC_cruiser_marathonH:
        return CRUISER_MARATHON;
}

return NO_SHIP;

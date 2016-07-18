var shiptype_macro = argument0;

switch (shiptype_macro) {
    case CORVETTE_FAST:
        return oUNSC_corvette_fast;
    case CORVETTE_REPAIR:
        return oUNSC_corvette_repair;
    case FRIGATE_CHARON:
        return oUNSC_frigate_charonL;
    case FRIGATE_PARIS:
        return oUNSC_frigate_parisH;
    case DESTROYER_DILIGENCE:
        return oUNSC_destroyer_diligence;
    case DESTROYER_HALBERD:
        return oUNSC_destroyer_halberd;
    case CRUISER_MARATHON:
        return oUNSC_cruiser_marathonH;
        
    // TODO: add covenant ships
}

return NO_SHIP;

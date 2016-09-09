var shipid = argument0;
var mod_bit = argument1;

with (shipid) {
    switch (mod_bit) {
        case MODULE_MAC:
            mac = mac_max;
            break;
        case MODULE_HANGAR:
            longsword_max += 4;
            pelican_max += 2;
            break;
    }
}

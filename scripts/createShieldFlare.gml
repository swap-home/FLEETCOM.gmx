var shipid = argument0; // id of ship to spawn trail for

with (instance_create(shipid.x, shipid.y, oshieldflare)) {
    parentid = shipid;
}

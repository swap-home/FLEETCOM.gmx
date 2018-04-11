var commandUnit = argument0;

if (!instance_exists(commandUnit)) {
    exit;
}

with (commandUnit) {
    tertiary_barrage_duration = tertiary_barrage_duration_max;
    tertiary_barrage_cooldown = tertiary_barrage_cooldown_max;
}

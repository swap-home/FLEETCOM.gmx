var commandUnit = argument0;
var targetUnit = argument1;

if (instance_exists(commandUnit)) {
    commandUnit.targetid = targetUnit;
    commandUnit.assignedTargetid = targetUnit;
}

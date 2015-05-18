var my_angle, target_angle, difference;
my_angle = argument0; //direction I am facing
target_angle = argument1; //point_direction(me.x, me.y, target.x, target.y)
difference = argument2; //difference in angle to be checked

//returns true if angles differ by equal to or less than difference degrees, false otherwise
return (mod360(my_angle - target_angle) < difference) || (mod360(target_angle - my_angle) < difference);

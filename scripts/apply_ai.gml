var unitId = argument0;

// 0-10 number
// 10 is max risk/aggressiveness
// 0 is min risk/aggressiveness
// <0 means randomize
risk = argument1; 
if (risk < 0) {
    risk = irandom(10);
}

ai = true;

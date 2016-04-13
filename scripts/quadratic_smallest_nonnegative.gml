var a = argument0;
var b = argument1;
var c = argument2;

//  returns -1 (or another negative number) if no solutions to the quadratic 
//      with ax^2 + bx + c = 0 are found
//  otherwise, returns the lowest nonnegative solution for x
var sol_1, sol_2;

if (a == 0) {
  if (b == 0) {
    if (c == 0) {
        return 0;
    } else {
        return -1;
    }
  } else {
    return -c/b;
  }
} else {
  var disc = b*b - 4*a*c;
  if (disc >= 0) {
    disc = sqrt(disc);
    sol_1 = (-b - disc)/(2*a);
    sol_2 = (-b + disc)/(2*a);
    
    if (min(sol_1, sol_2) < 0) {
        return max(sol_1, sol_2);
    } else {
        return min(sol_1, sol_2);
    }
  }
}
return -1;

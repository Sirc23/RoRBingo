///pos_in_rect(x1, y1, x2, y2, pos_x, pos_y)

var x_min = min(argument0, argument2);
var x_max = max(argument0, argument2);
var y_min = min(argument1, argument3);
var y_max = max(argument1, argument3);

return (argument4 > x_min && argument4 < x_max && argument5 > y_min && argument5 < y_max);

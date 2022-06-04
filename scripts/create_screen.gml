///create_screen(start_x, start_y, end_x, end_y)
var this_instance = instance_create(argument0 * room_width, argument1 * room_height, ScreenInstance);

this_instance.width = (argument2 - argument0) * room_width;
this_instance.height = (argument3 - argument1) * room_height;

return this_instance;

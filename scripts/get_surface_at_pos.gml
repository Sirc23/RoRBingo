///get_surface_at_pos(x, y)
var this_x = argument0;
var this_y = argument1;

//Adjust for bottom message bar
this_y *= (500) / (480);

var num_surfaces = 0;
var surfaces_array;
//Calculate all surfaces overlapping position
for(var a = 0; a < ds_list_size(global.master_controller.instances); a++)
{
    var this_surface = ds_list_find_value(global.master_controller.instances, a);
    var left_x = this_surface.x;
    var right_x = this_surface.x + this_surface.width;
    var top_y = this_surface.y;
    var bottom_y = this_surface.y + this_surface.height;
    if(pos_in_rect(left_x, top_y, right_x, bottom_y, this_x, this_y))
    {
        surfaces_array[num_surfaces] = this_surface;
        num_surfaces++;
    }
}

if(num_surfaces == 0)
{
    return noone;
}
else if(num_surfaces == 1)
{
    return surfaces_array[0];
}
else
{
    var return_surface = surfaces_array[0];
    for(var b = 1; b < num_surfaces; b++)
    {
        if(surfaces_array[b].depth < return_surface.depth)
        {
            return_surface = surfaces_array[b];
        }
    }
    return return_surface;
}

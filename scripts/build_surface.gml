///build_surface(surface_name)
var this_surface = ds_map_find_value(surfaces, argument0);

if(is_undefined(this_surface))
{
    ds_map_delete(surfaces, argument0);
    ds_map_add(surfaces, argument0, surface_create(room_width, room_height));
}
else if(!surface_exists(this_surface))
{
    surface_free(this_surface);
    ds_map_delete(surfaces, argument0);
    ds_map_add(surfaces, argument0, surface_create(room_width, room_height));
}

//show_debug_message(ds_map_find_value(surfaces, argument0));
return ds_map_find_value(surfaces, argument0);

///get_surface(surface_name)
var this_surface = ds_map_find_value(surfaces, argument0);

if(is_undefined(this_surface))
{
    return build_surface(argument0);
}
else if(!surface_exists(this_surface))
{
    surface_free(this_surface);
    return build_surface(argument0);
}
else
{
    return this_surface;
}

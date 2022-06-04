///master_map_add(spriteID_A, spriteID_B)
var found_a = false;
var found_b = false;

var sprite_a = noone;
var sprite_b = noone;
for(var i = 0; sprite_exists(i); i++)
{
    var this_string = string_replace_all(sprite_get_name(i), "sprite", "");
    var first_underscore = string_pos("_",this_string) + 1;
    this_string = string_copy(this_string, first_underscore, 999);
    if(this_string == argument0)
    {
        //show_debug_message("a:" + this_string);
        sprite_a = i;
        found_a = true;
    }
    else if(this_string == argument1)
    {
        //show_debug_message("b:" + this_string);
        sprite_b = i;
        found_b = true;
    }
    if(found_a && found_b)
    {
        break;
    }
}

ds_map_add(masterMap,sprite_a,sprite_b);
ds_map_add(masterMap,sprite_b,sprite_a);

//show_debug_message(string(sprite_a) + "," + string(sprite_b));

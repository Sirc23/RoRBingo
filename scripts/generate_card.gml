///generate_card()
if(argument_count > 0)
{
    if(is_string(argument[0]) && string_digits(argument[0]) != argument[0])
    {
        random_set_seed(string_to_bin(argument[0]));
    }
    else
    {
        random_set_seed(argument[0]);
    }
    this_seed = argument[0];
}
else
{
    randomize();
    this_seed = irandom(9999999);
    random_set_seed(this_seed);
}
next_seed = irandom(9999999);

while(ds_list_size(instances) > 0)
{
    instance_destroy(instances[|0]);
    ds_list_delete(instances, 0);
}

for(var a = 0; a < n; a++) //y
{
    for(var b = 0; b < n; b++) //x
    {
        var border_percent_x = border_width / room_width;
        var border_percent_y = border_width / room_height;
        
        var sum_of_surface_widths = room_width - ((n+1)*border_width);
        var sum_of_surface_heights = room_height - ((n+1)*border_width);
        
        var start_x = ((b)/n) * (sum_of_surface_widths/room_width) + (b+1) * border_percent_x;
        var start_y = ((a)/n) * (sum_of_surface_heights/room_height) + (a+1) * border_percent_y;
        var end_x = ((b+1)/n) * (sum_of_surface_widths/room_width) + (b+1) * border_percent_x;
        var end_y = ((a+1)/n) * (sum_of_surface_heights/room_height) + (a+1) * border_percent_y;
        ds_list_add(instances, create_screen(start_x,start_y,end_x,end_y));
    }
}

//Rules:

//1. If the board size is larger than 3x3, there must be exactly 1 equipment item in each column, row, and diagonal.
if(n > 3) //Cannot do this for boards smaller than 4x4 because most configurations are invalid
{
    while(!generate_equipment())
    {
    }
}
//2. For each row, there is an 85% chance a lunar item will appear on that row.
//This chance is rolled twice when the board is 8x8 or higher,
//and the chance is reduced to 40% for boards smaller than 5x5.
generate_lunar();

//3. There must be exactly 1 rare item on the board. This number increases by 1 for each increase in board size over 4x4.
generate_rare();

//4. There must be exactly 1 boss item on the board. This number increases by 1 for every 2 increases in board size over 5x5.
generate_boss();

//5. An item cannot have its corrupted version on the same ringo line (and vice versa)
generate_others();

return true;

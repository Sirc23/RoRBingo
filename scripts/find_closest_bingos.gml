var list_of_bingos = array_create(0);
var longest_length = 0;

var counting = 0;
var this_instance_list = noone;

//Rows
for(var a = 0; a < this_n; a++)
{
    counting = 0;
    this_instance_list = array_create(0);
    for(var b = 0; b < this_n; b++)
    {
        counting += instances[|a*this_n + b].captured;
        this_instance_list[array_length_1d(this_instance_list)] = a*this_n + b;
    }
    
    if(counting > longest_length)
    {
        longest_length = counting;
        list_of_bingos = array_create(0);
        var this_height = array_height_2d(list_of_bingos);
        for(var c = 0; c < array_length_1d(this_instance_list); c++)
        {
            list_of_bingos[this_height, c] = this_instance_list[c];
        }
    }
    else if(counting == longest_length)
    {
        var this_height = array_height_2d(list_of_bingos);
        for(var c = 0; c < array_length_1d(this_instance_list); c++)
        {
            list_of_bingos[this_height, c] = this_instance_list[c];
        }
    }
}

//Columns
for(var a = 0; a < this_n; a++)
{
    counting = 0;
    this_instance_list = array_create(0);
    for(var b = 0; b < this_n; b++)
    {
        counting += instances[|b*this_n + a].captured;
        this_instance_list[array_length_1d(this_instance_list)] = b*this_n + a;
    }
    
    if(counting > longest_length)
    {
        longest_length = counting;
        list_of_bingos = array_create(0);
        var this_height = array_height_2d(list_of_bingos);
        for(var c = 0; c < array_length_1d(this_instance_list); c++)
        {
            list_of_bingos[this_height, c] = this_instance_list[c];
        }
    }
    else if(counting == longest_length)
    {
        var this_height = array_height_2d(list_of_bingos);
        for(var c = 0; c < array_length_1d(this_instance_list); c++)
        {
            list_of_bingos[this_height, c] = this_instance_list[c];
        }
    }
}

//Diagonals
//D1
counting = 0;
this_instance_list = array_create(0);
for(var a = 0; a < this_n; a++)
{
    this_instance_list[a] = 0 + (this_n+1)*a;
    counting += instances[|0 + (this_n+1)*a].captured;
}

if(counting > longest_length)
{
    longest_length = counting;
    list_of_bingos = array_create(0);
    var this_height = array_height_2d(list_of_bingos);
    for(var c = 0; c < array_length_1d(this_instance_list); c++)
    {
        list_of_bingos[this_height, c] = this_instance_list[c];
    }
}
else if(counting == longest_length)
{
    var this_height = array_height_2d(list_of_bingos);
    for(var c = 0; c < array_length_1d(this_instance_list); c++)
    {
        list_of_bingos[this_height, c] = this_instance_list[c];
    }
}

//D2
counting = 0;
this_instance_list = array_create(0);
for(var a = 0; a < this_n; a++)
{
    this_instance_list[a] = (this_n*this_n - 1) - (this_n-1)*(a+1);
    counting += instances[|(this_n*this_n - 1) - (this_n-1)*(a+1)].captured;
}

if(counting > longest_length)
{
    longest_length = counting;
    list_of_bingos = array_create(0);
    var this_height = array_height_2d(list_of_bingos);
    for(var c = 0; c < array_length_1d(this_instance_list); c++)
    {
        list_of_bingos[this_height, c] = this_instance_list[c];
    }
}
else if(counting == longest_length)
{
    var this_height = array_height_2d(list_of_bingos);
    for(var c = 0; c < array_length_1d(this_instance_list); c++)
    {
        list_of_bingos[this_height, c] = this_instance_list[c];
    }
}

if(longest_length >= floor(this_n / 2))
{
    return list_of_bingos;
}
else
{
    return array_create(0);
}

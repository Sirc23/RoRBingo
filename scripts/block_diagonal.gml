///block_diagonal(diagonal)
var diagonal = argument0;

if(diagonal == 1)
{
    //Top left to bottom right
    for(var a = 0; a < n; a++)
    {
        if(get_space(a, a) == "E")
        {
            equipmentValidSpace[a*n + a] = "B";
        }
    }
}
else if(diagonal == 2)
{
    //Bottom left to rop right
    for(var a = 0; a < n; a++)
    {
        if(get_space(n-1-a, a) == "E")
        {
            equipmentValidSpace[(n-1-a)*n + (a)] = "B";
        }
    }
}

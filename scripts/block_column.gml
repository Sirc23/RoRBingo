///block_column(column)
var column = argument0;
for(var a = 0; a < n; a++)
{
    if(get_space(a, column) == "E")
    {
        equipmentValidSpace[a*n + column] = "B";
    }
}

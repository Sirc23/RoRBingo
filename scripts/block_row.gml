///block_row(row)
var row = argument0;
for(var a = 0; a < n; a++)
{
    if(get_space(row, a) == "E")
    {
        equipmentValidSpace[row*n + a] = "B";
    }
}

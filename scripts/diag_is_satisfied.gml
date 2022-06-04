///diag_is_satisfied(diag_num)
if(argument0 == 1)
{
    var diagbool1 = false;
    for(var diag1 = 0; diag1 < n; diag1++)
    {
        if(get_space(diag1, diag1) == "X")
        {
            diagbool1 = true;
            break;
        }
    }
    return diagbool1;
}
else if(argument0 == 2)
{
    var diagbool2 = false;
    for(var diag2 = 0; diag2 < n; diag2++)
    {
        if(get_space(diag2, n-1-diag2) == "X")
        {
            diagbool2 = true;
            break;
        }
    }
    return diagbool2;
}

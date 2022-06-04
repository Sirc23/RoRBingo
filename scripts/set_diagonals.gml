///set_diagonals(x, y)
if(satisfies_diag(argument0,argument1,1))
{
    //Check if other diagonal was satisfied by the last placement
    if(diag_is_satisfied(2))
    {
        block_diagonal(2);
        //return 1;
    }
    else
    {
        var array2 = array_create(0);
        for(var row2 = 0; row2 < n; row2++)
        {
            if(get_space(row2, n-1-row2) == "E")
            {
                array2[array_length_1d(array2)] = n-1-row2;
            }
        }
        //Remove options that would satisfy the other diagonal
        var array3 = array_create(0);
        for(var ar2 = 0; ar2 < array_length_1d(array2); ar2++)
        {
            if(!satisfies_diag(array2[ar2],n-1-array2[ar2],1))
            {
                array3[array_length_1d(array3)] = array2[ar2];
            }
        }
        //randomize();
        if(array_length_1d(array3) > 0)
        {
            var d = irandom(array_length_1d(array3) - 1);
            d = array3[d];
            mark(n-1-d,d);
            block_row(d);
            block_column(d);
            block_diagonal(1);
            block_diagonal(2);
            return 1;
        }
        else
        {
            return 0;
        }
    }
}

if(satisfies_diag(argument0, argument1,2))
{
    //Check if other diagonal was satisfied by the last placement
    
    if(diag_is_satisfied(1))
    {
        block_diagonal(1);
        //return 1;
    }
    else
    {
        var array2 = array_create(0);
        for(var row2 = 0; row2 < n; row2++)
        {
            if(get_space(row2, row2) == "E")
            {
                array2[array_length_1d(array2)] = row2;
            }
        }
        //Remove options that would satisfy the other diagonal
        var array3 = array_create(0);
        for(var ar2 = 0; ar2 < array_length_1d(array2); ar2++)
        {
            if(!satisfies_diag(array2[ar2],array2[ar2],2))
            {
                array3[array_length_1d(array3)] = array2[ar2];
            }
        }
        //randomize();
        if(array_length_1d(array3) > 0)
        {
            var d = irandom(array_length_1d(array3) - 1);
            d = array3[d];
            mark(d,d);
            block_row(d);
            block_column(d);
            block_diagonal(1);
            block_diagonal(2);
            return 1;
        }
        else
        {
            return 0;
        }
    }
}

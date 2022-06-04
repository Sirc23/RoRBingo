equipmentValidSpace = array_create(ds_list_size(instances));
for(var a = 0; a < ds_list_size(instances); a++)
{
    equipmentValidSpace[a] = "E";
}

//1. Exactly one equipment per row, column, and diagonal
//Forces upper limit of n = 25 (25 equipment items)

//Construct equipmentValidSpace as list of indexes with valid equipment spaces
for(var row1 = 0; row1 < n; row1++)
{
    //If the diagonals aren't satisfied, check if only one space can fulfill the diagonal
    if(!diag_is_satisfied(1))
    {
        //Diagonal not satisfied. Check for only one solution
        var diagcount1 = 0;
        var diagspot1 = 0;
        for(var diag1 = 0; diag1 < n; diag1++)
        {
            if(get_space(diag1, diag1) == "E")
            {
                diagcount1 += 1;
                diagspot1 = diag1;
            }
        }
        if(diagcount1 == 1)
        {
            //Set diagonals
            mark(diagspot1, diagspot1);
            block_row(diagspot1);
            block_column(diagspot1);
            set_diagonals(diagspot1, diagspot1);
        }
        else if(diagcount1 == 0)
        {
            //The last placement blocked off the last two remaining options at once
            return false;
        }
    }
    
    //
    
    if(!diag_is_satisfied(2))
    {
        //Diagonal not satisfied. Check for only one solution
        var diagcount2 = 0;
        var diagspot2 = 0;
        for(var diag2 = 0; diag2 < n; diag2++)
        {
            if(get_space(diag2, n-1-diag2) == "E")
            {
                diagcount2 += 1;
                diagspot2 = diag2;
            }
        }
        if(diagcount2 == 1)
        {
            //Set diagonals
            mark(diagspot2, n-1-diagspot2);
            block_row(diagspot2);
            block_column(n-1-diagspot2);
            set_diagonals(diagspot2, n-1-diagspot2);
        }
        else if(diagcount2 == 0)
        {
            //The last placement blocked off the last two remaining options at once
            return false;
        }
    }
    
    //

    var array1 = array_create(0);
    for(var column1 = 0; column1 < n; column1++)
    {
        if(get_space(row1, column1) == "E")
        {
            array1[array_length_1d(array1)] = column1;
        }
    }
    if(array_length_1d(array1) == 0)
    {
        var bool1 = false;
        for(var column2 = 0; column2 < n; column2++)
        {
            if(get_space(row1, column2) == "X")
            {
                bool1 = true;
                break;
            }
        }
        if(bool1)
        {
            continue;
        }
        else
        {
            return false;
        }
    }
    else if(array_length_1d(array1) == 1)
    {
        mark(row1, array1[0]);
        block_row(row1);
        block_column(array1[0]);
    }
    else
    {
        //randomize();
        var v = irandom(array_length_1d(array1) - 1);
        v = array1[v];
        mark(row1, v);
        block_row(row1);
        block_column(v);
        if(v == row1 || v == n-1-row1)
        {
            set_diagonals(row1, v);
        }
    }
}

var imagesCopy = ds_list_create();
ds_list_copy(imagesCopy, global.master_controller.equipmentImages);

for(var a = 0; a < array_length_1d(equipmentValidSpace); a++)
{
    instances[|a].list_pos = a;
    if(equipmentValidSpace[a] != "X")
    {
        continue;
    }
    var found_candidate = false;
    var this_index = -1;
    
    
        //randomize();
        this_index = irandom(ds_list_size(imagesCopy)-1);
    
    instances[|a].mySprite = imagesCopy[|this_index];
    instances[|a].captured = false;
    instances[|a].myClass = "equipment";
    instances[|a].myColor = class_colors[4];
    switch(instances[|a].mySprite)
    {
        case sprite91_equipment_26:
        case sprite97_equipment_27:
        case sprite98_equipment_28:
        case sprite104_equipment_29:
        {
            instances[|a].myColor = class_colors[3];
            break;
        }
    }
    ds_list_delete(imagesCopy, this_index);
}

ds_list_destroy(imagesCopy);

return true;

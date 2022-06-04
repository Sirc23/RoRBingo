var imagesCopy = ds_list_create();
ds_list_copy(imagesCopy, global.master_controller.lunarImages);

var n_diff = n - 5;

var tries_per_row = floor(1 + max(0,n_diff * 0.34));

var try_percent = 0.85;
if(n < 5)
{
     try_percent = 0.4;
}

for(var row = 0; row < n; row++)
{
    var row_tries = 0;
    for(var p = 0; p < tries_per_row; p++)
    {
        //randomize();
        if(random(1) >= (1 - try_percent))
        {
            row_tries++;
        }
    }
    //Check if lunar equipment is already on the row; reduce tries by 1 if found
    for(var col = 0; col < n; col++)
    {
        switch(instances[|row*n + col].mySprite)
        {
            case sprite91_equipment_26:
            case sprite97_equipment_27:
            case sprite98_equipment_28:
            case sprite104_equipment_29:
            {
                row_tries = max(0, row_tries - 1);
                break;
            }
        }
    }
    if(row_tries <= 0)
    {
        continue;
    }
    
    for(var tries = 0; tries < row_tries; tries++)
    {
        var rowCandidates = array_create(0);
        for(var column = 0; column < n; column++)
        {
            if(instances[|(row*n + column)].mySprite == noone)
            {
                rowCandidates[array_length_1d(rowCandidates)] = column;
            }
        }
        if(array_length_1d(rowCandidates) > 0)
        {
            //randomize();
            var b = irandom(array_length_1d(rowCandidates)-1);
            b = row*n + rowCandidates[b];
            
            //randomize();
            var this_index = irandom(ds_list_size(imagesCopy)-1);
        
            instances[|b].mySprite = imagesCopy[|this_index];
            instances[|b].captured = false;
            instances[|b].myClass = "lunar";
            instances[|b].myColor = class_colors[3];
            ds_list_delete(imagesCopy, this_index);
        }
        else
        {
            continue;
        }
    }
}



ds_list_destroy(imagesCopy);
return true;

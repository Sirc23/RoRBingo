var n_diff = n - 4;
var max_reds = floor(1 + max(0,n_diff * 1));

var imagesCopy = ds_list_create();
ds_list_copy(imagesCopy, global.master_controller.rareImages);

for(var a = 0; a < max_reds; a++)
{
    var found_candidate = false;
    while(!found_candidate)
    {
        //randomize();
        var b = irandom(ds_list_size(instances)-1);
        if(instances[|b].mySprite != noone)
        {
            continue;
        }
        found_candidate = true;
    }
    this_index = irandom(ds_list_size(imagesCopy)-1);
    
    instances[|b].mySprite = imagesCopy[|this_index];
    instances[|b].captured = false;
    instances[|b].myClass = "rare";
    instances[|b].myColor = class_colors[2];
    ds_list_delete(imagesCopy, this_index);
}

ds_list_destroy(imagesCopy);
return true;

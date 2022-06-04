var imagesCopy = ds_list_create();
ds_list_copy(imagesCopy, global.master_controller.otherImages);

var classCopy = ds_list_create();
ds_list_copy(classCopy, global.master_controller.otherClass);

var corruptDict = ds_map_create();
ds_map_copy(corruptDict, global.master_controller.masterMap);



for(var row = 0; row < n; row++)
{
    for(var column = 0; column < n; column++)
    {
        var b = row*n + column;
        if(instances[|b].mySprite == noone)
        {
            var found_index = false;
            var this_index = -1;
            while(!found_index)
            {
                //randomize();
                var this_index = irandom(ds_list_size(imagesCopy)-1);
                var valid_space = true;
                switch(imagesCopy[|this_index])
                {
                    case sprite150_corrupted_06: //Newly Hatched Zoea
                    {
                        for(var a = 0; a < n; a++)
                        {
                            var this_iter = instances[|(row*n + a)].myClass == "boss" || instances[|(a*n + column)].myClass == "boss"; 
                            this_iter = this_iter || (satisfies_diag(row,column,1) && instances[|(a*n + a)].myClass == "boss");
                            this_iter = this_iter || (satisfies_diag(row,column,2) && instances[|(a*n + (n-1-a))].myClass == "boss");
                            if(this_iter)
                            {
                                show_debug_message("Newly Hatched Zoea was spawning on " + string(column) + "," + string(row));
                                valid_space = false;
                                break;
                            }
                        }
                        break;
                    }
                    case sprite155_corrupted_11: //Singularity Band
                    {
                        for(var a = 0; a < n; a++)
                        {
                            var this_iter = instances[|(row*n + a)].mySprite == sprite44_uncommon_13 || instances[|(a*n + column)].mySprite == sprite44_uncommon_13; 
                            this_iter = this_iter || (satisfies_diag(row,column,1) && instances[|(a*n + a)].mySprite == sprite44_uncommon_13);
                            this_iter = this_iter || (satisfies_diag(row,column,2) && instances[|(a*n + (n-1-a))].mySprite == sprite44_uncommon_13);
                            
                            this_iter = instances[|(row*n + a)].mySprite == sprite54_uncommon_23 || instances[|(a*n + column)].mySprite == sprite54_uncommon_23; 
                            this_iter = this_iter || (satisfies_diag(row,column,1) && instances[|(a*n + a)].mySprite == sprite54_uncommon_23);
                            this_iter = this_iter || (satisfies_diag(row,column,2) && instances[|(a*n + (n-1-a))].mySprite == sprite54_uncommon_23);
                            if(this_iter)
                            {
                                show_debug_message("Singularity Band was spawning on " + string(column) + "," + string(row));
                                valid_space = false;
                                break;
                            }
                        }
                        break;
                    }
                    case sprite44_uncommon_13: //Fire Band
                    case sprite54_uncommon_23: //Ice Band
                    {
                        for(var a = 0; a < n; a++)
                        {
                            var this_iter = instances[|(row*n + a)].mySprite == sprite155_corrupted_11 || instances[|(a*n + column)].mySprite == sprite155_corrupted_11; 
                            this_iter = this_iter || (satisfies_diag(row,column,1) && instances[|(a*n + a)].mySprite == sprite155_corrupted_11);
                            this_iter = this_iter || (satisfies_diag(row,column,2) && instances[|(a*n + (n-1-a))].mySprite == sprite155_corrupted_11);
                            if(this_iter)
                            {
                                show_debug_message("Fire/Ice Band was spawning on " + string(column) + "," + string(row));
                                valid_space = false;
                                break;
                            }
                        }
                        break;
                    }
                    default:
                    {
                        //show_debug_message(string(b) + ": looking for alt to " + sprite_get_name(this_index));
                        //General corrupt/non-corrupt
                        var alt_sprite = ds_map_find_value(masterMap,imagesCopy[|this_index]);
                        if(!is_undefined(alt_sprite))
                        {
                            //show_debug_message(string(b) + ": found " + sprite_get_name(alt_sprite));
                            for(var a = 0; a < n; a++)
                            {
                                var this_iter = instances[|(row*n + a)].mySprite == alt_sprite || instances[|(a*n + column)].mySprite == alt_sprite; 
                                this_iter = this_iter || (satisfies_diag(row,column,1) && instances[|(a*n + a)].mySprite == alt_sprite);
                                this_iter = this_iter || (satisfies_diag(row,column,2) && instances[|(a*n + (n-1-a))].mySprite == alt_sprite);
                                if(this_iter)
                                {
                                    show_debug_message(sprite_get_name(imagesCopy[|this_index]) + " was spawning on " + string(column) + "," + string(row) + ", stopped by " + sprite_get_name(alt_sprite));
                                    valid_space = false;
                                    break;
                                }
                            }
                            if(valid_space)
                            {
                                //show_debug_message(string(b) + ": alt found for " + sprite_get_name(alt_sprite) + " but is fine");
                            }
                        }
                        else
                        {
                            //show_debug_message(string(b) + ": " + sprite_get_name(this_index) + " has no alt on the board");
                        }
                        break;
                    }
                }
                found_index = valid_space;
            }
            instances[|b].mySprite = imagesCopy[|this_index];
            instances[|b].captured = false;
            instances[|b].myClass = classCopy[|this_index];
            
            for(var c = 0; c < array_length_1d(classes); c++)
            {
                if(instances[|b].myClass == classes[c])
                {
                    instances[|b].myColor = class_colors[c];
                    break;
                }
            }
            
            ds_list_delete(imagesCopy, this_index);
            ds_list_delete(classCopy, this_index);
        }
        else
        {
            continue;
        }
    }
    
}



ds_list_destroy(imagesCopy);
return true;

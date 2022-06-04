//Card generation ds structures
instances = ds_list_create();
//masterImages = ds_list_create();
//masterClass = ds_list_create();

equipmentImages = ds_list_create();
rareImages = ds_list_create();
bossImages = ds_list_create();
lunarImages = ds_list_create();
otherImages = ds_list_create();
otherClass = ds_list_create();

masterMap = ds_map_create();


classes = array_create(7);
classes[0] = "common";
classes[1] = "uncommon";
classes[2] = "rare";
classes[3] = "lunar";
classes[4] = "equipment";
classes[5] = "boss";
classes[6] = "corrupted";

class_colors = array_create(7);
class_colors[0] = $b4b2aa; //White-gray
class_colors[1] = $40c57c; //Green
class_colors[2] = $4052f9; //Red
class_colors[3] = $e4cc4a; //Blue
class_colors[4] = $329be5; //Orange
class_colors[5] = $1ee0d3; //Yellow
class_colors[6] = $b170e3; //Purple

/*
var file_name = file_find_first("..\RoRBingo\*.jpg", fa_readonly);
show_debug_message(working_directory + "..\RoRBingo");
while (file_name != "")
{
    show_debug_message(file_name);
    ds_list_add(masterImages, sprite_add(file_name,1,false,false,0,0));
    
    //TODO: string parsing to find class name
    ds_list_add(masterFileNames, false);
    
    file_name = file_find_next();
}
file_find_close();*/

//Fill ds structs
for(var i = 0; sprite_exists(i); i++)
{
    var this_string = string_replace_all(sprite_get_name(i), "sprite", "");
    this_string = string_letters(this_string);
    
    for(var a = 0; a < array_length_1d(classes); a++)
    {
        if(classes[a] == this_string)
        {
            //ds_list_add(masterImages, i);
            //ds_list_add(masterClass, this_string);
            
            switch(this_string)
            {
                case "equipment":
                {
                    ds_list_add(equipmentImages, i);
                    break;
                }
                case "rare":
                {
                    ds_list_add(rareImages,i);
                    break;
                }
                case "boss":
                {
                    ds_list_add(bossImages,i);
                    break;
                }
                case "lunar":
                {
                    ds_list_add(lunarImages,i);
                    break;
                }
                case "common":
                case "uncommon":
                case "corrupted":
                {
                    ds_list_add(otherImages,i);
                    ds_list_add(otherClass, this_string);
                    break;
                }
            }
            break;
        }
    }
}


master_map_add("corrupted_01","rare_01");
master_map_add("corrupted_02","common_22");
master_map_add("corrupted_03","common_12");
master_map_add("corrupted_04","uncommon_06");
master_map_add("corrupted_05","common_28");
//master_map_add("corrupted_06",""); //Boss items
master_map_add("corrupted_07","uncommon_01");
master_map_add("corrupted_08","rare_07");
master_map_add("corrupted_09","uncommon_27");
master_map_add("corrupted_10","common_27");
//master_map_add("corrupted_11","uncommon_23"); //Bands items
//master_map_add("corrupted_11","uncommon_13");
master_map_add("corrupted_12","uncommon_04");
master_map_add("corrupted_13","uncommon_30");
master_map_add("corrupted_14","common_04");

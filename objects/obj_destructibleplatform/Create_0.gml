falling = 0
reset = 100
image_speed = 0
depth = 10
if (ds_list_find_index(global.saveroom, id) != -1)
    sprite_index = spr_moldycheese
else
    sprite_index = spr_cheeseblock

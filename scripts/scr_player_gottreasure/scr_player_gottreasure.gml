function scr_player_gottreasure() //scr_player_gottreasure
{
    sprite_index = spr_gottreasure
    if (character != "S")
        image_speed = 0.2
    else
        image_speed = 0.35
    obj_drawcontroller.happyhud = 1
    obj_drawcontroller.alarm[10] = 60
    restore_combo()
}


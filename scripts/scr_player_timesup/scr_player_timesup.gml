function scr_player_timesup() //scr_player_timesup
{
    xscale = 1
    inv_frames = 0
    sprite_index = spr_Timesup
    alarm[7] = -1
    alarm[8] = -1
    alarm[5] = -1
    if (place_meeting(x, y, obj_timesup) && visible)
    {
        visible = false
        instance_create_depth(x, y, (depth - 3), obj_timesupplayer)
    }
    if (room == timesuproom)
    {
        x = 480
        y = 270
    }
    if (floor(image_index) == (image_number - 1))
        image_speed = 0
    else
        image_speed = 0.35
}


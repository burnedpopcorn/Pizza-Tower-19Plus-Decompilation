if (fadealpha > fademax)
{
    fadein = 1
    if instance_exists(obj_player)
    {
        if (room != obj_player.targetRoom)
        {
            room_goto(obj_player.targetRoom)
            if (obj_player.state == (14 << 0))
            {
                with (obj_player)
                {
                    visible = 1
                    sprite_index = spr_pizzaportalentrancestart
                    image_index = 0
                }
                event_play_oneshot("event:/sfx/misc/lap2")
                instance_create_depth(x, y, -9999, obj_lap2flag)
                if (!global.lapping)
                    global.lapping = 1
                global.laps += 1
            }
        }
    }
}
fadealpha += ((!fadein) ? fadeadd : (-fadeadd))
if (fadein && fadealpha < 0)
    instance_destroy()

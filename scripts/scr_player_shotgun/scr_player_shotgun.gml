function scr_player_shotgun() //scr_player_shotgun
{
    dir = xscale
    landAnim = 0
    momemtum = 1
    if (sprite_index != spr_shotgunpullout)
    {
        move = input_check_opposing("left", "right")
        hsp = move * movespeed
        if (movespeed < 4)
            movespeed += 0.25
        if (movespeed > 4)
            movespeed -= 0.125
        if (scr_solid((x + sign(hsp)), y) && move == xscale && (!(place_meeting((x + xscale), y, obj_slope))))
            movespeed = 0
    }
    if (sprite_index == spr_shotgunpullout)
    {
        restore_combo()
        movespeed = 0
        hsp = 0
    }
    if (character == "N")
    {
        var shooting = 0
        if ((image_index + image_speed) >= image_number)
            shooting = 1
        if (shooting == 1)
        {
            with (instance_create_depth((x + xscale * 60), (y + 30), 0, obj_shotgunbullet))
            {
                spdh = random_range(4, -1)
                playerid = other.playerobj
            }
        }
    }
    if (floor(image_index) == (image_number - 1))
    {
        if (sprite_index == spr_shotgunpullout && inwar)
            fmod_studio_event_instance_set_parameter_by_name(global.music.event, "state", 2, true)
        if (character != "N")
        {
            if grounded
                sprite_index = spr_shotgunidle
            else
                sprite_index = spr_shotgunfall
            state = (0 << 0)
        }
    }
    if ((!input_check("shoot")) && character == "N" && sprite_index != spr_shotgunpullout)
    {
        if grounded
            sprite_index = spr_shotgunidle
        else
            sprite_index = spr_shotgunfall
        state = (0 << 0)
    }
    image_speed = (sprite_index != spr_shotgunpullout ? 0.5 : 0.35)
    if ((!instance_exists(obj_slidecloud)) && grounded && movespeed > 4)
        instance_create_depth(x, y, 0, obj_slidecloud)
}


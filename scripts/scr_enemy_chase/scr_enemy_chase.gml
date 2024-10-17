function scr_enemy_chase() //scr_enemy_chase
{
    switch object_index
    {
        case obj_minijohn:
            var targetplayer = obj_player
            if (x != targetplayer.x)
                image_xscale = (-(sign(x - targetplayer.x)))
            hsp = Approach(hsp, (image_xscale * movespeed), 0.1)
            if scr_solid(x, (y + 1))
                steppy--
            if (steppy <= 0)
            {
                instance_create_depth(x, (y + 43), 0, obj_cloudeffect)
                steppy = 20
            }
            if ((scr_solid((x + image_xscale), y) || place_meeting((x + hsp), y, obj_hallway)) && (!(place_meeting((x + sign(hsp)), y, obj_slope))))
            {
                instance_create_depth((x + image_xscale * 10), (y + 15), 0, obj_bumpeffect)
                vsp = -6
                hsp = -3 * image_xscale
            }
            break
    }

}


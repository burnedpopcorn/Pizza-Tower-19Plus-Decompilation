function scr_player_gunshoot() //scr_player_gunshoot
{
    hsp = xscale * movespeed
    if (scr_solid((x + sign(hsp)), y) && xscale == 1 && move == 1 && (!(place_meeting((x + 1), y, obj_slope))))
        movespeed = 0
    if (scr_solid((x + sign(hsp)), y) && xscale == -1 && move == -1 && (!(place_meeting((x - 1), y, obj_slope))))
        movespeed = 0
    if (movespeed <= 0)
        movespeed = 0
    if (movespeed > 0)
        movespeed -= 0.15
    if (floor(image_index) == (image_number - 1))
    {
        if input_check("dash")
        {
            state = (47 << 0)
            sprite_index = spr_mach
            movespeed = 10
        }
        else if (!input_check("dash"))
            state = (0 << 0)
    }
    if (sprite_index == spr_player_gunshoot || sprite_index == spr_player_gunshootup)
    {
        if (input_check_pressed("shoot") && image_index > 2)
        {
            sprite_index = spr_player_gunshoot
            image_index = 0
            with (instance_create_depth(x, (y + 7), 0, obj_pistolgunbullet))
            {
                if (!input_check("up"))
                {
                    dir = xscale_angle(other.xscale)
                    x += (10 * other.xscale)
                }
                else
                {
                    dir = 90
                    y -= 17
                    other.sprite_index = spr_player_gunshootup
                }
                if (other.object_index == obj_player)
                    playerid = 1
            }
            camera_shake(3, 3)
            scr_fmod_soundeffect(revolversnd, x, y)
        }
    }
    image_speed = 0.5
}


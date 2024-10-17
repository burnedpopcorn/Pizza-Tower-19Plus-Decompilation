function scr_player_held() //scr_player_held
{
    if (held == 1)
    {
        xscale = (-grabbedby.xscale)
        stunned = 200
        if (grabbedby.state == (28 << 0) || grabbedby.state == (119 << 0) || grabbedby.state == (7 << 0))
        {
            x = grabbedby.x
            if ((grabbedby.sprite_index != spr_player_haulingstart && grabbedby.character == "P") || (grabbedby.sprite_index != spr_playerN_haulingstart && grabbedby.character == "N"))
                y = grabbedby.y - 40
            else if (floor(grabbedby.image_index) == 0)
                y = grabbedby.y
            else if (floor(grabbedby.image_index) == 1)
                y = grabbedby.y - 10
            else if (floor(grabbedby.image_index) == 2)
                y = grabbedby.y - 20
            else if (floor(grabbedby.image_index) == 3)
                y = grabbedby.y - 30
            image_xscale = (-grabbedby.xscale)
        }
        with (grabbedby)
        {
            if (!((state == (28 << 0) || grabbedby.state == (119 << 0) || state == (2 << 0) || state == (7 << 0) || state == (29 << 0) || state == (25 << 0) || state == (30 << 0) || state == (87 << 0))))
            {
                other.x = x
                other.y = y
                other.state = (50 << 0)
                other.image_index = 0
                other.vsp = -6
                other.held = 0
                other.depth = depth + 1
            }
        }
        hsp = 0
        if (grabbedby.state == (2 << 0) && grabbedby.image_index < 5)
        {
            x = grabbedby.x + grabbedby.xscale * 60
            y = grabbedby.y
        }
        if ((grabbedby.state == (2 << 0) && floor(grabbedby.image_index) == 6 && grabbedby.sprite_index != grabbedby.spr_swingdingend) || (floor(grabbedby.image_index) == 0 && grabbedby.sprite_index == grabbedby.spr_swingdingend))
        {
            scr_enemygibs()
            camera_shake(3, 3)
            xscale = (-grabbedby.xscale)
            restore_combo()
            state = (50 << 0)
            thrown = 1
            with (grabbedby)
            {
                if (sprite_index == spr_uppercutfinishingblow)
                {
                    other.movespeed = 0
                    other.vsp = -25
                }
                else
                {
                    other.movespeed = -25
                    other.vsp = -4
                    other.y = y - 4
                }
            }
            if scr_solid(x, y)
            {
                x = grabbedby.x
                y = grabbedby.y
            }
        }
        if ((grabbedby.state == (25 << 0) && grabbedby.sprite_index == spr_player_piledriver) || grabbedby.sprite_index == spr_playerN_piledriver)
        {
            if (grabbedby.character == "P")
            {
                y = grabbedby.y
                switch floor(grabbedby.image_index)
                {
                    case 0:
                    case 1:
                    case 2:
                    case 3:
                    case 4:
                        depth = grabbedby.depth + 1
                        x = grabbedby.x + grabbedby.xscale * 5 * (2 - floor(grabbedby.image_index))
                        break
                    case 5:
                    case 6:
                    case 7:
                        depth = -8
                        x = grabbedby.x + grabbedby.xscale * 5 * (floor(grabbedby.image_index) - 6)
                        break
                }

            }
            else
            {
                if (grabbedby.character == "N")
                    depth = grabbedby.depth + 1
                x = grabbedby.x
                y = grabbedby.y - 40
            }
        }
        if ((grabbedby.state == (28 << 0) && grabbedby.sprite_index == grabbedby.spr_swingding) || (grabbedby.state == (87 << 0) && grabbedby.sprite_index == grabbedby.spr_swingding))
        {
            if (floor(grabbedby.image_index) == 0)
            {
                depth = -8
                x = grabbedby.x + grabbedby.xscale * 15
                y = grabbedby.y
            }
            if (floor(grabbedby.image_index) == 1)
            {
                depth = -8
                x = grabbedby.x + grabbedby.xscale * 10
                y = grabbedby.y
            }
            if (floor(grabbedby.image_index) == 2)
            {
                depth = -8
                x = grabbedby.x
                y = grabbedby.y
            }
            if (floor(grabbedby.image_index) == 3)
            {
                depth = -8
                x = grabbedby.x + grabbedby.xscale * -10
                y = grabbedby.y
            }
            if (floor(grabbedby.image_index) == 4)
            {
                depth = -8
                x = grabbedby.x + grabbedby.xscale * -15
                y = grabbedby.y
            }
            if (floor(grabbedby.image_index) == 5)
            {
                depth = 0
                x = grabbedby.x + grabbedby.xscale * -10
                y = grabbedby.y
            }
            if (floor(grabbedby.image_index) == 6)
            {
                depth = 0
                x = grabbedby.x
                y = grabbedby.y
            }
            if (floor(grabbedby.image_index) == 7)
            {
                depth = 0
                x = grabbedby.x + grabbedby.xscale * 10
                y = grabbedby.y
            }
        }
        if (floor(grabbedby.image_index) == (grabbedby.image_number - 1) && grabbedby.sprite_index == grabbedby.spr_piledriverland)
        {
            scr_enemygibs(2)
            camera_shake(3, 3)
            flash = 1
            restore_combo()
            x = grabbedby.x
            y = grabbedby.y
            state = (50 << 0)
            movespeed = -8
            vsp = -11
            held = 0
        }
    }
    sprite_index = spr_hurt
    image_speed = 0.35
}


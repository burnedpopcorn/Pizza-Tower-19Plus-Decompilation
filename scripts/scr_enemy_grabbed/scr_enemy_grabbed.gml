function scr_enemy_grabbed() //scr_enemy_grabbed
{
    image_xscale = (-grabbedby.xscale)
    stunned = 200
    grabbedby.baddiegrabbedID = id
    if (grabbedby.state == (28 << 0) || grabbedby.state == (7 << 0))
    {
        x = grabbedby.x
        if (grabbedby.sprite_index != spr_player_haulingstart && grabbedby.character == "P")
            y = grabbedby.y - 60
        else if (floor(grabbedby.image_index) == 0)
            y = grabbedby.y - 10
        else if (floor(grabbedby.image_index) == 1)
            y = grabbedby.y - 30
        else if (floor(grabbedby.image_index) == 2)
            y = grabbedby.y - 45
        else if (floor(grabbedby.image_index) == 3)
            y = grabbedby.y - 50
        else if (floor(grabbedby.image_index) == 4)
            y = grabbedby.y - 55
        image_xscale = (-grabbedby.xscale)
    }
    if (grabbedby.state == (119 << 0))
    {
        x = grabbedby.x + grabbedby.xscale * 60
        y = grabbedby.y
        image_xscale = (-grabbedby.xscale)
    }
    with (grabbedby)
    {
        suplexhavetomash = other.hp - 1
        move = input_check_opposing_pressed("left", "right")
        if (input_check("attack") && sprite_index == spr_grab && state != (119 << 0))
        {
            restore_combo()
            image_index = 0
            sprite_index = choose(spr_suplexmash1, spr_suplexmash2, spr_suplexmash3, spr_suplexmash4)
            other.hp -= 1
            scr_enemygibs(1)
            other.flash = 1
            camera_shake(3, 3)
        }
        if (!((state == (28 << 0) || state == (2 << 0) || state == (119 << 0) || state == (7 << 0) || state == (29 << 0) || state == (25 << 0) || state == (30 << 0) || state == (87 << 0))))
        {
            other.x = x
            other.y = y
            other.state = 104
            other.image_index = 0
        }
    }
    hsp = 0
    if (grabbedby.state == (29 << 0))
    {
        alarm[3] = 3
        restore_combo()
        hp -= 1
        instance_create_depth((x + grabbedby.xscale * 30), y, 0, obj_bumpeffect)
        alarm[1] = 5
        thrown = 1
        x = grabbedby.x
        vsp = 0
        y = grabbedby.y
        state = 104
        hsp = (-image_xscale) * 25
        grav = 0
        scr_enemygibs(1)
        flash = 1
        camera_shake(3, 3)
    }
    if (grabbedby.state == (2 << 0))
    {
        var _ray = fire_ray(grabbedby.x, grabbedby.y, (grabbedby.x + grabbedby.xscale * 60), (grabbedby.y - 3), 1, -4, -4, mask_index)
        x = _ray.x
        y = _ray.y
    }
    if (grabbedby.state == (30 << 0))
    {
        alarm[3] = 3
        restore_combo()
        hp -= 1
        instance_create_depth(x, (y + 20), 0, obj_bumpeffect)
        alarm[1] = 5
        thrown = 1
        x = grabbedby.x
        y = grabbedby.y
        state = 104
        if (grabbedby.sprite_index == spr_player_shoulder)
            vsp = 15
        if (grabbedby.sprite_index == spr_player_diagonaldownthrow)
        {
            hsp = (-image_xscale) * 10
            vsp = 15
            y = grabbedby.y + 25
        }
        if (grabbedby.sprite_index == spr_player_diagonalupthrow)
        {
            hsp = (-image_xscale) * 10
            vsp = -15
        }
        scr_enemygibs(1)
        flash = 1
        camera_shake(3, 3)
    }
    if (grabbedby.state == (7 << 0))
    {
        x = grabbedby.x + grabbedby.xscale * 15
        y = grabbedby.y
    }
    if (grabbedby.state == (25 << 0) && grabbedby.sprite_index == grabbedby.spr_piledriver)
    {
        image_yscale = -1
        if (grabbedby.character == "P")
        {
            y = grabbedby.y + 45
            if (floor(grabbedby.image_index) == 0)
            {
                depth = 0
                x = grabbedby.x + grabbedby.xscale * 10
            }
            if (floor(grabbedby.image_index) == 1)
            {
                depth = 0
                x = grabbedby.x + grabbedby.xscale * 5
            }
            if (floor(grabbedby.image_index) == 2)
            {
                depth = 0
                x = grabbedby.x
            }
            if (floor(grabbedby.image_index) == 3)
            {
                depth = 0
                x = grabbedby.x + grabbedby.xscale * -5
            }
            if (floor(grabbedby.image_index) == 4)
            {
                depth = 0
                x = grabbedby.x + grabbedby.xscale * -10
            }
            if (floor(grabbedby.image_index) == 5)
            {
                depth = -8
                x = grabbedby.x + grabbedby.xscale * -5
            }
            if (floor(grabbedby.image_index) == 6)
            {
                depth = -8
                x = grabbedby.x
            }
            if (floor(grabbedby.image_index) == 7)
            {
                depth = -8
                x = grabbedby.x + grabbedby.xscale * 5
            }
        }
        else
        {
            if (grabbedby.character == "N")
                depth = -7
            x = grabbedby.x
            y = grabbedby.y
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
    if (grabbedby.sprite_index != grabbedby.spr_swingding && grabbedby.sprite_index != grabbedby.spr_piledriver)
        depth = 0
    if (floor(grabbedby.image_index) == (grabbedby.image_number - 2) && grabbedby.sprite_index == grabbedby.spr_piledriverland)
        instance_destroy()
    sprite_index = grabbedspr
    image_speed = 0.35
}


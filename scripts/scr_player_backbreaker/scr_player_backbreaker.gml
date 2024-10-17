function scr_player_backbreaker() //scr_player_backbreaker
{
    if (floor(image_index) == (image_number - 1) && sprite_index == spr_levelcomplete)
        state = (0 << 0)
    if (floor(image_index) == (image_number - 1) && sprite_index == spr_player_bossscared)
        state = (0 << 0)
    if (floor(image_index) == (image_number - 1) && sprite_index == spr_Timesup && (!(place_meeting(x, y, obj_exitgate))))
    {
        global.panic = 1
        sprite_index = spr_bossintro
        image_index = 0
    }
    if (floor(image_index) == (image_number - 1) && sprite_index == spr_Timesup && place_meeting(x, y, obj_exitgate))
        state = (0 << 0)
    if (floor(image_index) == (image_number - 1) && sprite_index == spr_player_titlescared && titlescreenstart == 0)
    {
        introscared = 1
        state = (0 << 0)
        with (instance_create_depth(x, (y + 16), (depth + 1), obj_debris))
        {
            sprite_index = spr_seat
            hsp = irandom_range(-9, 9)
            vsp = -5
        }
    }
    if (floor(image_index) == (image_number - 1) && sprite_index == spr_player_titlescared && titlescreenstart == 1)
        state = (0 << 0)
    mach2 = 0
    if (sprite_index != spr_machfreefall)
    {
        hsp = 0
        movespeed = 0
    }
    else
    {
        hsp = xscale * movespeed
        image_speed = 0.35
    }
    landAnim = 0
    if (grounded && vsp >= 0)
    {
        if (sprite_index == spr_machfreefall)
        {
            state = (48 << 0)
            sprite_index = spr_player_crouchslide
        }
    }
    if (sprite_index == spr_taunt || sprite_index == spr_throwitback)
    {
        with (obj_baddie)
        {
            if (distance_to_object(instance_nearest(x, y, obj_player)) < 100 && state == 104)
            {
                stunned = 0
                bombreset = 0
            }
        }
        if (supertauntcooldown == 10 && input_check("up") && global.battle != 1)
        {
            supertauntcooldown = 0
            with (obj_baddie)
            {
                if bbox_in_camera(1, id)
                {
                    stunned = 200
                    state = 104
                    hsp = 0
                    vsp = 0
                    insupertaunt = 1
                }
            }
            camera_shake(10, 30)
            event_stop(tauntsnd, true)
            scr_fmod_soundeffectONESHOT("event:/sfx/player/supertaunt", x, y)
            restore_combo()
            if (global.throwitback == 0)
                sprite_index = choose(spr_supertaunt1, spr_supertaunt2, spr_supertaunt3, spr_supertaunt4)
            else if (global.throwitback == 1)
                sprite_index = spr_player_supertauntass
            image_index = 0
            taunttimer = 20
        }
        taunttimer--
        vsp = 0
    }
    if (sprite_index == spr_supertaunt1 || sprite_index == spr_supertaunt2 || sprite_index == spr_supertaunt3 || sprite_index == spr_supertaunt4 || sprite_index == spr_player_supertauntass)
    {
        image_speed = 0.35
        vsp = 0
        if (floor(image_index) == 5 && (!instance_exists(obj_tauntaftereffectspawner)))
            instance_create_depth(x, y, 0, obj_tauntaftereffectspawner)
    }
    if (taunttimer <= 0 && (sprite_index == spr_taunt || sprite_index == spr_throwitback))
    {
        movespeed = tauntstoredmovespeed
        sprite_index = tauntstoredsprite
        state = tauntstoredstate
        vsp = tauntstoredvsp
        image_index = tauntstoredimageindex
    }
    if (sprite_index == spr_supertaunt1 || sprite_index == spr_supertaunt2 || sprite_index == spr_supertaunt3 || sprite_index == spr_supertaunt4 || sprite_index == spr_player_supertauntass)
    {
        if (floor(image_index) == (image_number - 1))
        {
            movespeed = tauntstoredmovespeed
            sprite_index = tauntstoredsprite
            state = tauntstoredstate
            vsp = tauntstoredvsp
            image_index = tauntstoredimageindex
            with (obj_baddie)
            {
                if insupertaunt
                    instance_destroy()
            }
        }
    }
}


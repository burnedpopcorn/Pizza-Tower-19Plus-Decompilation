function scr_player_Sjump() //scr_player_Sjump
{
    collide_destructibles = function(argument0, argument1) //anon@55@scr_player_Sjump_scr_player_Sjump
    {
        if (argument1 < 0)
            scr_destroy_vertical(argument1, ((1 << 0) * (sprite_index == spr_presentjump || sprite_index == spr_player_bombjump)))
    }

    hsp = 0
    mach2 = 0
    jumpAnim = 1
    dashAnim = 1
    landAnim = 0
    moveAnim = 1
    stopAnim = 1
    crouchslideAnim = 1
    crouchAnim = 0
    machhitAnim = 0
    move = input_check_opposing("left", "right")
    if (sprite_index == spr_superjump || sprite_index == spr_presentjump || sprite_index == spr_player_bombjump)
    {
        vsp = sjumpvsp
        if (steppy > 0)
            steppy--
        else
        {
            instance_create_depth((x + (irandom_range(-25, 25))), (y + (irandom_range(-10, 35))), 1, obj_cloudeffect)
            steppy = 8
        }
    }
    sjumpvsp -= 0.1
    if (sprite_index == spr_player_bombjump)
    {
        if (floor(image_index) == (image_number - 1))
        {
            with (instance_create_depth(x, (y + 25), 0, obj_balloonpop))
                sprite_index = spr_shotgunimpact
        }
    }
    if (sprite_index == spr_player_supersidejump)
    {
        if (a < 25)
            a++
        hsp = xscale * a
        vsp = 0
    }
    if place_meeting(x, (y - 1), obj_metalblock)
    {
        if cancel_Sjump
        {
            a = 0
            if (sprite_index == spr_player_supersidejump)
                sprite_index = spr_player_supersidejumpland
            if (sprite_index == spr_superjump || sprite_index == spr_presentjump || sprite_index == spr_player_bombjump)
                sprite_index = spr_superjumpland
            camera_shake(10, 30)
            gamepadvibrate(0.7, 0, 15)
            with (obj_baddie)
            {
                if bbox_in_camera(1, id)
                {
                    image_index = 0
                    if grounded
                        vsp = -7
                }
            }
            scr_fmod_soundeffectONESHOT("event:/sfx/player/groundpound", x, y)
            image_index = 0
            state = (68 << 0)
            machhitAnim = 0
        }
    }
    else if (!cancel_Sjump)
    {
        if place_meeting(x, (y - 1), obj_metalblock)
        {
            with (instance_place(x, (y - 1), obj_metalblock))
                instance_destroy()
        }
    }
    if (scr_solid(x, (y - 1)) && (!(place_meeting(x, (y - 1), obj_destructibles))) && (!(place_meeting(x, (y - 1), obj_metalblock))))
    {
        a = 0
        if (sprite_index == spr_player_supersidejump)
            sprite_index = spr_player_supersidejumpland
        if (sprite_index == spr_superjump || sprite_index == spr_presentjump || sprite_index == spr_player_bombjump)
        {
            if (sprite_index == spr_player_bombjump)
                instance_create_depth(x, y, (depth + 1), obj_genericpoofeffect)
            sprite_index = spr_superjumpland
        }
        gamepadvibrate(0.7, 0, 15)
        camera_shake(10, 30)
        with (obj_baddie)
        {
            if bbox_in_camera(1, id)
            {
                image_index = 0
                if grounded
                    vsp = -7
            }
        }
        scr_fmod_soundeffectONESHOT("event:/sfx/player/groundpound", x, y)
        image_index = 0
        state = (68 << 0)
        machhitAnim = 0
    }
    if ((input_check_pressed("dash") || input_buffer_attack < 8) && cancel_Sjump)
    {
        if (input_buffer_attack < 8)
            input_buffer_attack = 8
        if (move != 0)
            xscale = move
        sjumpcancelmode = true
        machhitAnim = 0
        image_index = 0
        if (character != "N")
        {
            state = (45 << 0)
            sprite_index = spr_player_sjumpcancelstart
            scr_fmod_soundeffectONESHOT("event:/sfx/player/mach/superjumpcancel", x, y)
        }
        else
        {
            state = (47 << 0)
            vsp = -5
            movespeed = 12
            instance_create_depth(x, y, 0, obj_shoulderbashcrazyrunothereffect)
            sprite_index = spr_mach2jump
            image_index = 0
            scr_fmod_soundeffectONESHOT("event:/sfx/player/mach/superjumpcancel", x, y)
        }
        if event_isplaying(char_superjumpsnd)
            event_stop(char_superjumpsnd, 1)
    }
    image_speed = 0.5
    scr_collide_player()
}


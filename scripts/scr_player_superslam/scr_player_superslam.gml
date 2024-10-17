function scr_player_superslam() //scr_player_superslam
{
    collide_destructibles = function(argument0, argument1) //anon@59@scr_player_superslam_scr_player_superslam
    {
        if (argument1 >= 0)
            scr_destroy_vertical(argument1)
    }

    if (sprite_index == spr_piledriver)
    {
        hit_vertical = function(argument0) //anon@186@scr_player_superslam_scr_player_superslam
        {
            if (argument0 >= 0 && piledrivervsp > 0)
                scr_destroy_vertical(argument0, ((1 << 0) * (freefallsmash > 10)))
        }

        move = input_check_opposing("left", "right")
        hsp = move * movespeed
        vsp = piledrivervsp
        if (piledrivervsp < 25)
        {
            piledrivervsp += 0.5
            if (piledrivervsp > 1)
                piledrivervsp += 0.4
        }
    }
    else
    {
        move = 0
        hsp = 0
    }
    if (place_meeting(x, (y + sign(piledrivervsp)), obj_solid) && (!(place_meeting(x, (y + sign(piledrivervsp)), obj_destructibles))))
        piledrivervsp = 0
    if (grounded && (!(place_meeting(x, (y + 1), obj_destructibles))) && sprite_index == spr_piledriver && piledrivervsp >= 0)
    {
        scr_fmod_soundeffectONESHOT("event:/sfx/player/groundpound", x, y)
        sprite_index = spr_piledriverland
        image_index = 0
        camera_shake(20, 40)
        gamepadvibrate(0.7, 0, 15)
        hsp = 0
        piledrivervsp = 0
        bounce = 0
        with (instance_create_depth(x, (y + 35), 0, obj_bangeffect))
            xscale = other.xscale
        freefallstart = 0
    }
    jumpAnim = 1
    dashAnim = 1
    landAnim = 0
    machslideAnim = 1
    moveAnim = 1
    stopAnim = 1
    crouchslideAnim = 1
    crouchAnim = 1
    if (piledrivervsp > 0)
        freefallsmash++
    if (move != 0)
    {
        if (movespeed < 6)
            movespeed += 0.5
        else if (floor(movespeed) == 6)
            movespeed = 6
    }
    else
        movespeed = 0
    if (movespeed > 6)
        movespeed -= 0.1
    if (sprite_index != spr_piledriverland)
    {
        if (vsp > 1)
            image_speed = 0.65
        if (vsp < 0)
            image_speed = 0.35
    }
    else
        image_speed = 0.35
    if (freefallsmash > 10 && (!instance_exists(obj_superslameffect)))
    {
        with (instance_create_depth(x, y, 0, obj_superslameffect))
        {
            playerid = other.playerobj
            other.superslameffectid = id
        }
    }
    if (floor(image_index) == (image_number - 1) && sprite_index == spr_piledriverland)
    {
        vsp = -11
        jumpstop = 0
        jumpAnim = 1
        sprite_index = spr_airjugglestart
        image_index = 0
        state = (36 << 0)
    }
}


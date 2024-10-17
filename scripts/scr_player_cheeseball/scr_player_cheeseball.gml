function scr_player_cheeseball() //scr_player_cheeseball
{
    collide_destructibles = function(argument0, argument1) //anon@60@scr_player_cheeseball_scr_player_cheeseball
    {
        scr_destroy_horizontal(argument0, (16 << 0))
    }

    hsp = xscale * 12
    if ((!scr_slope()) && instance_place((x + sign(hsp)), y, obj_solid) && (!(place_meeting((x + xscale), y, obj_destructibles))))
    {
        scr_fmod_soundeffectONESHOT("event:/sfx/player/transfo/detransfo", x, y)
        grav = 0.5
        repeat (8)
            instance_create_depth(x, y, -1, obj_slimedebris)
        movespeed = 5
        vsp = -3
        visible = true
        image_index = 0
        flash = 1
        state = (49 << 0)
    }
    sprite_index = spr_Cheeseball
    if input_check_pressed("jump")
        input_buffer_jump = 0
    if ((!input_check("jump")) && (!jumpstop) && vsp < 0.5)
    {
        vsp /= 10
        jumpstop = 1
    }
    if (grounded && vsp > 0)
        jumpstop = 0
    image_speed = 0.35
    if (input_buffer_jump < 8 && grounded)
    {
        scr_fmod_soundeffect(char_jumpsnd, x, y)
        vsp = -10
        instance_create_depth(x, y, 0, obj_highjumpcloud2)
    }
    if (input_buffer_down < 8 && (!godown))
    {
        input_buffer_down = 8
        godown = 1
        vsp = 10
    }
}


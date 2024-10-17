function scr_player_shoryuken() //scr_player_shoryuken
{
    collide_destructibles = function(argument0, argument1) //anon@59@scr_player_shoryuken_scr_player_shoryuken
    {
        scr_destroy_horizontal(argument0, (256 << 0))
    }

    hit_vertical = function(argument0) //anon@158@scr_player_shoryuken_scr_player_shoryuken
    {
        if (argument0 < 0)
            scr_destroy_vertical(argument0)
    }

    vsp = shoryukenvsp
    if (shoryukenvsp < 20)
        shoryukenvsp += 0.5
    if (place_meeting(x, (y + sign(shoryukenvsp)), obj_solid) && (!(place_meeting(x, (y + sign(shoryukenvsp)), obj_destructibles))))
        shoryukenvsp = 0
    if (sprite_index == spr_shoryukenstart && floor(image_index) == (image_number - 1))
    {
        sprite_index = spr_shoryuken
        image_index = 0
    }
    if (scr_solid((x + sign(hsp)), y) && xscale == 1 && move == 1 && (!(place_meeting((x + 1), y, obj_slope))) && (!(place_meeting((x + 1), y, obj_destructibles))))
        movespeed = 0
    if (scr_solid((x + sign(hsp)), y) && xscale == -1 && move == -1 && (!(place_meeting((x - 1), y, obj_slope))) && (!(place_meeting((x - 1), y, obj_destructibles))))
        movespeed = 0
    move = input_check_opposing("left", "right")
    if (move != 0)
        hsp = Approach(hsp, (6 * move), 0.4)
    else
        hsp = Approach(hsp, 0, 0.2)
    if ((!instance_exists(obj_dashcloud)) && grounded)
    {
        with (instance_create_depth(x, y, 0, obj_dashcloud))
            image_xscale = other.xscale
    }
    if (cangrab && input_buffer_attack < 8)
    {
        input_buffer_attack = 8
        if (global.currentbadge == (1 << 0))
        {
            if (!kungfumove)
            {
                kungfumove = true
                state = (91 << 0)
                scr_fmod_soundeffectONESHOT("event:/sfx/player/kungfu", x, y)
                if (movespeed < 10)
                    movespeed = 10
                if (vsp > 0)
                    vsp = 0
                if grounded
                    sprite_index = choose(spr_kungfu1, spr_kungfu2, spr_kungfu3)
                else
                    sprite_index = choose(spr_kungfuair1start, spr_kungfuair2start, spr_kungfuair3start)
                image_index = 0
            }
        }
        else
        {
            cangrab = 0
            suplexmove = 1
            fmod_studio_event_instance_start(suplexdashsnd)
            state = (16 << 0)
            image_index = 0
            sprite_index = spr_suplexgrabjumpstart
            if (move != 0)
                xscale = move
            movespeed = 8
            momemtum = 1
        }
    }
    if (grounded && vsp >= 0)
    {
        if (hsp != 0)
            xscale = sign(hsp)
        movespeed = abs(hsp)
        state = (0 << 0)
        jumpAnim = 1
        jumpstop = 0
        image_index = 0
        freefallstart = 0
        cangrab = 1
        instance_create_depth(x, y, 0, obj_landcloud)
    }
    if (input_buffer_down < 8 && uppercutcancel == 0 && sprite_index == spr_shoryuken)
    {
        input_buffer_down = 8
        uppercutcancel = 1
        shoryukenvsp = 10
    }
    if (!instance_exists(obj_shoryukenhitbox))
    {
        with (instance_create_depth(x, y, 0, obj_shoryukenhitbox))
        {
            playerid = other.id
            image_xscale = other.id.xscale
        }
    }
    image_speed = 0.35
}


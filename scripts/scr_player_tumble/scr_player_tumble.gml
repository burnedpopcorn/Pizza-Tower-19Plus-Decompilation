function scr_player_tumble() //scr_player_tumble
{
    collide_destructibles = function(argument0, argument1) //anon@57@scr_player_tumble_scr_player_tumble
    {
        scr_destroy_horizontal(argument0, (2 << 0))
    }

    mask_index = spr_crouchmask
    movespeed = clamp(movespeed, 9, 20)
    hsp = xscale * movespeed
    if place_meeting(x, (y + 1), obj_railh)
        movespeed -= (0.2 * xscale)
    else if place_meeting(x, (y + 1), obj_railh2)
        movespeed += (0.2 * xscale)
    if (scr_slope_ext(x, (y + 1)) && vsp >= 0)
    {
        with (instance_place(x, (y + 1), obj_slope))
        {
            var slope_acceleration = abs(image_yscale) / abs(image_xscale)
            if (other.sprite_index != other.spr_tumblestart)
            {
                if (other.xscale == sign(image_xscale))
                {
                    if (other.movespeed > 10)
                        other.movespeed -= (0.15 * slope_acceleration)
                }
                else if (other.xscale == (-sign(image_xscale)))
                {
                    if (other.movespeed < 20)
                        other.movespeed += (0.15 * slope_acceleration)
                }
            }
        }
    }
    if ((!scr_slope()) && sprite_index == spr_tumblestart && floor(image_index) < 11 && character != "S")
        image_index = 11
    if (sprite_index == spr_tumblestart && floor(image_index) == (image_number - 1))
    {
        sprite_index = spr_tumble
        movespeed = 14
    }
    if (place_meeting((x + xscale), y, obj_solid) && (!(place_meeting((x + hsp), y, obj_destructibles))) && (!(place_meeting((x + hsp), y, obj_ballblock))))
    {
        hsp = 0
        movespeed = 0
        sprite_index = spr_tumbleend
        state = (49 << 0)
        gamepadvibrate(0.4, 0, 7)
        image_index = 0
    }
    if input_check_pressed("jump")
        input_buffer_jump = 0
    if ((!input_check("jump")) && (!jumpstop) && vsp < 0.5 && (!stompAnim) && bumped == 0)
    {
        vsp /= 2
        jumpstop = 1
    }
    if (grounded && vsp > 0)
        jumpstop = 0
    if (input_buffer_jump < 8 && grounded && hsp != 0)
        vsp = -10
    if (sprite_index == spr_tumblestart)
        movespeed = 6
    if (sprite_index == spr_tumble)
        image_speed = 0.02 + (abs(movespeed / 20))
    else
        image_speed = 0.35
    if (input_buffer_down < 8 && (!godown) && vsp < 10)
    {
        input_buffer_down = 8
        godown = 1
        vsp = 10
    }
}


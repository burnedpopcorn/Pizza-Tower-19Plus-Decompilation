function scr_player_smallpep() //scr_player_smallpep
{
    collide_destructibles = function(argument0, argument1) //anon@58@scr_player_smallpep_scr_player_smallpep
    {
        if (argument1 < 0)
        {
            if scr_destroy_vertical(argument0)
                vsp = 0
        }
    }

    move = input_check_opposing("left", "right")
    hsp = xscale * movespeed
    if (sprite_index == spr_smalljump || sprite_index == spr_smallfall || sprite_index == spr_smallstompprep || sprite_index == spr_smallstomp)
    {
        if (vsp > 0 && grounded)
        {
            if (move != 0)
                sprite_index = spr_smallland2
            else
                sprite_index = spr_smallland1
            image_index = 0
            landAnim = true
        }
        if ((!input_check("jump")) && jumpstop == false && vsp < 0.5 && stompAnim == false)
        {
            vsp /= 10
            jumpstop = 1
        }
    }
    else
        jumpstop = false
    if (move != 0)
    {
        xscale = move
        movespeed = Approach(movespeed, 4, 0.5)
        if (grounded && (!landAnim))
            sprite_index = spr_smallwalk
        if (movespeed <= 2)
            image_speed = 0.2
        else
            image_speed = 0.35
    }
    else
    {
        movespeed = 0
        if (grounded && (!landAnim))
            sprite_index = spr_smallidle
        image_speed = 0.35
    }
    if (input_check_pressed("jump") && grounded)
    {
        vsp = -13
        sprite_index = spr_smalljump
        image_index = 0
    }
    if ((sprite_index == spr_smalljump && floor(image_index) == (image_number - 1)) || ((!grounded) && sprite_index != spr_smalljump && sprite_index != spr_smallstompprep && sprite_index != spr_smallstomp))
        sprite_index = spr_smallfall
    if (sprite_index == spr_smallstompprep && floor(image_index) == (image_number - 1))
        sprite_index = spr_smallstomp
    if ((sprite_index == spr_smallland1 || sprite_index == spr_smallland2) && floor(image_index) == (image_number - 1))
        landAnim = false
    if (input_check("dash") && grounded && (!(place_meeting((x + xscale), y, obj_solid))))
    {
        state = (107 << 0)
        movespeed = 0
        sprite_index = spr_smalldashstart
        image_index = 0
    }
    if grounded
        stompAnim = false
}


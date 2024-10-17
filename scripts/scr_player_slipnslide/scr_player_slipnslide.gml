function scr_player_slipnslide() //scr_player_slipnslide
{
    collide_destructibles = function(argument0, argument1) //anon@60@scr_player_slipnslide_scr_player_slipnslide
    {
        scr_destroy_horizontal(argument0)
        scr_destroy_vertical(argument1)
    }

    mach2 = 0
    jumpAnim = 1
    dashAnim = 1
    landAnim = 0
    moveAnim = 1
    stopAnim = 1
    crouchslideAnim = 1
    crouchAnim = 0
    machhitAnim = 0
    hsp = xscale * movespeed
    machhitAnim = 0
    crouchslideAnim = 1
    jumpstop = 1
    alarm[5] = 2
    if slipnslidewall
    {
        vsp = -14
        movespeed = 0
        if (place_meeting(x, (y - 1), obj_solid) && (!(place_meeting(x, (y - 1), obj_destructibles))))
        {
            state = (36 << 0)
            sprite_index = spr_rockethitwall
        }
        if (!(place_meeting((x + xscale), y, obj_solid)))
        {
            state = (36 << 0)
            sprite_index = spr_fall
        }
    }
    else
        movespeed = 14
    if (sprite_index == spr_player_slipnslidewallstart && floor(image_index) == (image_number - 1))
    {
        sprite_index = spr_player_slipnslidewall
        image_index = 0
    }
    if ((!slipnslidewall) && scr_solid((x + xscale), y) && (!(place_meeting((x + sign(hsp)), y, obj_slope))) && (!(place_meeting((x + sign(hsp)), y, obj_destructibles))))
    {
        slipnslidewall = 1
        sprite_index = spr_player_slipnslidewallstart
        image_index = 0
    }
    image_speed = 0.45
    if ((!instance_exists(obj_slidecloud)) && grounded)
    {
        with (instance_create_depth(x, y, 0, obj_slidecloud))
            image_xscale = other.xscale
    }
}


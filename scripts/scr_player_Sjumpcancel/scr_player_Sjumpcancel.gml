function scr_player_Sjumpcancel() //scr_player_Sjumpcancel
{
    var sjumpcancelstate = "intro"
    hsp = xscale * movespeed
    if (movespeed >= 0 && grounded && (!(instance_place((x + xscale), (y + 1), obj_slope))))
        movespeed -= 0.15
    if (hsp > 0)
        xscale = 1
    if (hsp < 0)
        xscale = -1
    if (instance_place((x + xscale), (y + 1), obj_slope) && xscale == 1 && instance_place((x + xscale), (y + 1), obj_slope).image_xscale < 1)
    {
        if (movespeed < 24)
            movespeed += 0.25
    }
    if (instance_place((x + xscale), (y + 1), obj_slope) && xscale == -1 && instance_place((x + xscale), (y + 1), obj_slope).image_xscale >= 1)
    {
        if (movespeed < 24)
            movespeed += 0.25
    }
    if (instance_place((x + xscale), (y + 1), obj_slope) && xscale == 1 && instance_place((x + xscale), (y + 1), obj_slope).image_xscale >= 1)
        movespeed -= 0.25
    if (instance_place((x + xscale), (y + 1), obj_slope) && xscale == -1 && instance_place((x + xscale), (y + 1), obj_slope).image_xscale < 1)
        movespeed -= 0.25
    if (sjumpcancelstate == "intro")
    {
        hsp = 0
        vsp = 0
        movespeed = 0
    }
    if (sprite_index == spr_player_sjumpcancelstart && floor(image_index) == (image_number - 1))
    {
        sprite_index = spr_player_sjumpcancel
        image_index = 0
        sjumpcancelstate = "freefall"
        movespeed = 13
        vsp = -3
    }
    if (sjumpcancelstate == "freefall" && grounded && vsp > 0)
    {
        sprite_index = spr_player_sjumpcancelgroundstart
        image_index = 0
        sjumpcancelstate = "slide"
    }
    if (sprite_index == spr_player_sjumpcancelgroundstart && floor(image_index) == (image_number - 1))
    {
        sprite_index = spr_player_sjumpcancelground
        image_index = 0
    }
    mask_index = spr_crouchmask
    if (((movespeed <= 0 && (!(instance_place((x + xscale), (y + 1), obj_slope)))) || (scr_solid((x + 1), y) && xscale == 1) || (scr_solid((x - 1), y) && xscale == -1)) && (!(place_meeting((x + sign(hsp)), y, obj_slope))))
    {
        state = (0 << 0)
        movespeed = 0
        mach2 = 0
        crouchslideAnim = 1
        image_index = 0
        crouchAnim = 1
        start_running = 1
        alarm[4] = 14
    }
    if (scr_solid((x + 1), y) && xscale == 1 && (!(place_meeting((x + sign(hsp)), y, obj_slope))) && (!(place_meeting((x + sign(hsp)), y, obj_destructibles))))
    {
        movespeed = 0
        state = (0 << 0)
        mach2 = 0
        image_index = 0
        machslideAnim = 1
        machhitAnim = 0
        instance_create_depth((x + 10), (y + 10), 0, obj_bumpeffect)
    }
    if (scr_solid((x - 1), y) && xscale == -1 && (!(place_meeting((x + sign(hsp)), y, obj_slope))) && (!(place_meeting((x + sign(hsp)), y, obj_destructibles))))
    {
        movespeed = 0
        state = (0 << 0)
        mach2 = 0
        image_index = 0
        machslideAnim = 1
        machhitAnim = 0
        instance_create_depth((x - 10), (y + 10), 0, obj_bumpeffect)
    }
    if ((!instance_exists(obj_slidecloud)) && grounded && movespeed > 5)
    {
        with (instance_create_depth(x, y, 0, obj_slidecloud))
            image_xscale = other.xscale
    }
    if (movespeed < 12 && grounded && (!(scr_solid(x, (y - 16)))) && (!(scr_solid(x, (y - 32)))) && input_check_pressed("dash"))
    {
        instance_create_depth(x, y, 0, obj_jumpdust)
        flash = 0
        state = (23 << 0)
        vsp = 10
        if (movespeed < 8)
            movespeed = 8
    }
    else if (movespeed >= 12 && grounded && (!(scr_solid(x, (y - 16)))) && (!(scr_solid(x, (y - 32)))) && input_check_pressed("dash"))
    {
        instance_create_depth(x, y, 0, obj_jumpdust)
        flash = 0
        state = (23 << 0)
        vsp = 10
        if (movespeed < 12)
            movespeed = 12
    }
    image_speed = 0.35
}


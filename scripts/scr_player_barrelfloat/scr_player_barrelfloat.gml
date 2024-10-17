function scr_player_barrelfloat() //scr_player_barrelfloat
{
    mask_index = spr_player_mask
    move = input_check_opposing("left", "right")
    hsp = move * movespeed
    vsp = 0
    if input_check_pressed("jump")
    {
        jumpstop = 1
        jumpAnim = 1
        state = (36 << 0)
        landAnim = 0
        vsp = -7
        with (instance_create_depth(x, y, 0, obj_volumebarrelfloat))
            image_xscale = other.xscale
        image_index = 0
        barrel = 0
    }
    movespeed = 2.6
    if (move != 0)
        xscale = move
    sprite_index = spr_player_barrelfloat
    image_speed = 0.35
    if place_meeting(x, y, obj_water2)
        vsp -= 1
}


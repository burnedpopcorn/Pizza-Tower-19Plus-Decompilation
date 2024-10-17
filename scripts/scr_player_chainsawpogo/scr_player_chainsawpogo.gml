function scr_player_chainsawpogo() //scr_player_chainsawpogo
{
    movespeed = 14
    hsp = xscale * movespeed
    if ((scr_solid((x + 1), y) && xscale == 1) || (scr_solid((x - 1), y) && xscale == -1))
        movespeed = 0
    landAnim = 1
    if (ladderbuffer > 0)
        ladderbuffer--
    if (scr_solid(x, (y - 1)) && (!jumpstop) && jumpAnim)
    {
        vsp = grav
        jumpstop = 1
    }
    if (scr_solid((x + xscale), y) && (!(place_meeting(x, (y + 1), obj_slope))))
    {
        image_index = 0
        if (!instance_exists(obj_bumpeffect))
            instance_create_depth((x + xscale * 10), (y + 10), 0, obj_bumpeffect)
        hsp = (-xscale) * 5
        vsp = -3
        state = (15 << 0)
        scr_fmod_soundeffectONESHOT("event:/sfx/player/bump", x, y)
        chainsaw = 50
    }
    if (!input_check("down"))
    {
        sprite_index = spr_player_chainsawair
        state = (22 << 0)
        movespeed = 14
    }
    if (sprite_index != spr_player_chainsawpogobounce)
    {
        if (sprite_index == spr_player_chainsawpogo1 && floor(image_index) == 3)
            sprite_index = spr_player_chainsawpogo2
    }
    else if (floor(image_index) == 4)
        sprite_index = spr_player_chainsawpogo2
    image_speed = 0.35
    if (!instance_exists(obj_chainsawpogohitbox))
        instance_create_depth(x, y, 0, obj_chainsawpogohitbox)
    if (!instance_exists(obj_mach3effect))
        instance_create_depth(x, y, 0, obj_mach3effect)
}


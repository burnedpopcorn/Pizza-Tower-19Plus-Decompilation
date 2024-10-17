hsp = 10
if (vsp < 12)
    vsp += grav
if (scr_solid((x + 1), y) && (!scr_slope()))
{
    with (obj_player)
    {
        if (state == (65 << 0) && place_meeting(x, y, other.id))
        {
            scr_fmod_soundeffectONESHOT("event:/sfx/player/bump", x, y)
            scr_fmod_soundeffectONESHOT("event:/sfx/player/transfo/detransfo", x, y)
            barrel = 0
            mask_index = spr_player_mask
            grav = 0.5
            movespeed = 0
            state = (49 << 0)
            hsp = 2.5
            vsp = -3
            mach2 = 0
            image_index = 0
            machslideAnim = 1
            machhitAnim = 0
            instance_create_depth((x - 10), (y + 10), 0, obj_bumpeffect)
        }
    }
    with (instance_create_depth((x + 32), (y + 32), -1, obj_debris))
        sprite_index = spr_rockdebris
    with (instance_create_depth((x + 32), (y + 32), -1, obj_debris))
        sprite_index = spr_rockdebris
    with (instance_create_depth((x + 32), (y + 32), -1, obj_debris))
        sprite_index = spr_rockdebris
    with (instance_create_depth((x + 32), (y + 32), -1, obj_debris))
        sprite_index = spr_rockdebris
    with (instance_create_depth((x + 32), (y + 32), -1, obj_debris))
        sprite_index = spr_rockdebris
    with (instance_create_depth((x + 32), (y + 32), -1, obj_debris))
        sprite_index = spr_rockdebris
    with (instance_create_depth((x + 32), (y + 32), -1, obj_debris))
        sprite_index = spr_rockdebris
    instance_destroy()
}
if grounded
{
    if (floor(image_index) == 0)
    {
        with (instance_create_depth(x, (y - 17), 0, obj_dashcloud))
            image_xscale = other.image_xscale
    }
}
scr_collide()

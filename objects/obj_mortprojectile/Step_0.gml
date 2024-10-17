hspeed = 20 * image_xscale
if ((place_meeting((x + hspeed), y, obj_solid) || place_meeting((x + hspeed), y, obj_hallway) || place_meeting((x + hspeed), y, obj_slope)) && (!(place_meeting((x + hspeed), y, obj_destructibles))) && (!(place_meeting((x + hspeed), y, obj_ratblock))))
{
    instance_destroy()
    scr_enemygibs()
    instance_create_depth(x, y, -100, obj_genericpoofeffect)
    camera_shake(3, 3)
    if obj_player.inwar
        instance_create_depth(x, y, 0, obj_baddiecorpse)
    else
    {
        with (instance_create_depth(x, y, 0, obj_baddiedead))
            sprite_index = other.deadspr
    }
}

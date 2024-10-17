with (obj_player)
{
    if (state == (36 << 0) && (!grounded) && vsp > 0 && place_meeting(x, (y + 1), other) && other.player_isseated == 0 && other.player_cansit == 1)
    {
        other.player_isseated = 1
        state = (104 << 0)
        sprite_index = spr_emo
        xscale = 1
        x = other.x
        y = other.y
        instance_create_depth(x, y, -20, obj_genericpoofeffect)
    }
}

if (place_meeting(x, (y - 1), obj_player) && obj_player.state != (33 << 0))
{
    with (instance_place(x, (y - 1), obj_player))
    {
        if (state != (66 << 0) && state != (87 << 0) && sprite_index != spr_machslideboost3 && sprite_index != spr_machslideboost3end)
        {
            state = (4 << 0)
            scr_fmod_soundeffectONESHOT("event:/sfx/misc/splash", x, y)
            image_index = 0
            vsp = -20
            sprite_index = spr_scaredjumpstart
            instance_create_depth(x, (other.y + 1), (other.depth + 1), obj_factorywaterhand)
        }
    }
}

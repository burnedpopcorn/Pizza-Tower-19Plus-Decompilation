with (other.id)
{
    if is_player_grabbing(id)
    {
        instance_create_depth((x + 32 * xscale), y, 0, obj_bangeffect)
        scr_fmod_soundeffectONESHOT("event:/sfx/enemy/punched", x, y)
        sprite_index = choose(spr_suplexmash1, spr_suplexmash2, spr_suplexmash3, spr_suplexmash4, spr_suplexmash5, spr_suplexmash6, spr_suplexmash7)
        image_index = 0
        state = (35 << 0)
        movespeed = 3
        vsp = -3
        other.wavespd = 2 * xscale
        playerhit = true
        gamepadvibrate(0.5, 0, 7)
    }
}

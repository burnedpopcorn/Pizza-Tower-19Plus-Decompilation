with (other.id)
{
    if (state == (76 << 0))
    {
        instance_create_depth(x, y, 0, obj_explosioneffect)
        instance_create_depth(x, y, 0, obj_bangeffect)
        sprite_index = spr_presentjump
        state = (40 << 0)
        scr_fmod_soundeffectONESHOT("event:/sfx/player/pipeout", x, y)
        vsp = -10
        x = other.x + 32
        y = other.y
        cancel_Sjump = false
        pipedir = "noone"
        other.sprite_index = spr_pipesuperjumpflip
        other.image_index = 0
    }
}

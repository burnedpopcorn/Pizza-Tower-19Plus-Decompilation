if place_meeting(x, y, obj_player)
{
    with (instance_place(x, y, obj_player))
    {
        if (state == (76 << 0))
        {
            vsp += 14
            state = (51 << 0)
            scr_fmod_soundeffectONESHOT("event:/sfx/player/pipeout", x, y)
            sprite_index = spr_bodyslamfall
            freefallsmash = 20
            x = other.x + 32
            y = other.y + 32
            pipedir = "noone"
            other.sprite_index = spr_pipegroundpoundflip
            other.image_index = 0
        }
    }
}

if place_meeting((x + 32), (y + 32), obj_player)
{
    with (instance_place((x + 32), (y + 32), obj_player))
    {
        if (state == (76 << 0))
        {
            vsp = 0
            state = (66 << 0)
            movespeed = 12
            sprite_index = spr_Dashpad
            image_index = 0
            scr_fmod_soundeffectONESHOT("event:/sfx/player/pipeout", x, y)
            xscale = -1
            x = other.x + 32
            y = other.y + 16
            other.sprite_index = spr_pipedashleftflip
            other.image_index = 0
            pipedir = "noone"
        }
    }
}
if (sprite_index == spr_pipedashleftflip && floor(image_index) == (image_number - 1))
{
    sprite_index = spr_pipedashleftidle
    image_index = 0
}

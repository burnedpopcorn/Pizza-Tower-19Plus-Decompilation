if (vsp < 12)
    vsp += grav
if barrelspawn
{
    visible = 1
    if place_meeting(x, (y - 1), obj_player)
    {
        with (instance_place(x, (y - 1), obj_player))
        {
            if (vsp > 0 && (state == (36 << 0) || state == (44 << 0) || state == (49 << 0)))
            {
                state = (105 << 0)
                sprite_index = spr_barrelidle
                image_index = 0
                barrel = 1
                barrelbump = 0
                instance_create_depth(x, y, -100, obj_genericpoofeffect)
                voice_transfo()
                scr_fmod_soundeffectONESHOT("event:/sfx/player/transfo/transfo", x, y)
                other.barrelspawn = 0
                other.alarm[0] = 180
            }
        }
    }
}
else
    visible = 0
if grounded
{
    hsp = 0
    bounce = 0
}
scr_collide()

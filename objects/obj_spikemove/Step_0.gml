with (obj_player)
{
    if place_meeting(x, y, other.id)
    {
        if (state == (19 << 0) && (!hurted))
        {
            scr_fmod_soundeffectONESHOT("event:/sfx/player/transfo/bombpepexplode", x, y)
            image_index = 0
            hurted = 1
            vsp = -4
            sprite_index = spr_bombpepend
            state = (19 << 0)
            bombpeptimer = 0
            instance_create_depth(x, y, 0, obj_bombexplosion)
        }
    }
    if place_meeting(x, y, other.id)
    {
        if (state == (11 << 0))
        {
            if (x != other.x)
                obj_player.hsp = (sign(x - other.x)) * 5
            else
                obj_player.hsp = 5
            vsp = -3
            scr_fmod_soundeffectONESHOT("event:/sfx/player/bump", x, y)
            scr_fmod_soundeffectONESHOT("event:/sfx/player/transfo/detransfo", x, y)
            image_index = 0
            obj_player.image_index = 0
            obj_player.flash = 1
            state = (49 << 0)
        }
    }
}
hspeed = hmove
vspeed = vmove
if (dire == "left")
    hspeed = (-hmove)
if (dire == "right")
    hspeed = hmove
if place_meeting(x, y, obj_spikemoveleftsensor)
{
    if (dire == "right")
        dire = "left"
}
if place_meeting(x, y, obj_spikemoverightsensor)
{
    if (dire == "left")
        dire = "right"
}

if (other.state == (18 << 0))
{
    instance_create_depth(x, y, -1, obj_slimedebris)
    instance_create_depth(x, y, -1, obj_slimedebris)
    instance_create_depth(x, y, -1, obj_slimedebris)
    instance_create_depth(x, y, -1, obj_slimedebris)
    instance_create_depth(x, y, -1, obj_slimedebris)
    instance_create_depth(x, y, -1, obj_slimedebris)
    instance_create_depth(x, y, -1, obj_slimedebris)
    instance_create_depth(x, y, -1, obj_slimedebris)
    instance_destroy()
}
else
{
    if (other.state != (8 << 0) && other.state != (31 << 0) && other.state != (70 << 0))
    {
        movespeed = 0
        other.xscale = image_xscale
        other.hsp = hsp
        other.vsp = vsp
        other.x = x
        other.y = y
        other.state = (8 << 0)
        instance_create_depth(x, y, -1, obj_slimedebris)
        instance_create_depth(x, y, -1, obj_slimedebris)
        instance_create_depth(x, y, -1, obj_slimedebris)
        instance_create_depth(x, y, -1, obj_slimedebris)
        instance_create_depth(x, y, -1, obj_slimedebris)
        instance_create_depth(x, y, -1, obj_slimedebris)
        instance_create_depth(x, y, -1, obj_slimedebris)
        instance_create_depth(x, y, -1, obj_slimedebris)
        voice_transfo(other.id)
        scr_fmod_soundeffectONESHOT("event:/sfx/player/transfo/transfo", x, y)
        instance_destroy()
    }
    else if (other.state == (31 << 0) && place_meeting(x, y, obj_parryhitbox) && other.state != (70 << 0))
    {
        with (other.id)
        {
            scr_fmod_soundeffectONESHOT("event:/sfx/player/parry", x, y)
            movespeed = -6
            vsp = 0
            instance_create_depth(x, y, 1, obj_parryeffect)
            if (xscale == 1)
            {
                if (!instance_exists(obj_bangeffect))
                    instance_create_depth((x + 20), y, 0, obj_bangeffect)
            }
            else if (xscale == -1)
            {
                if (!instance_exists(obj_bangeffect))
                    instance_create_depth((x - 20), y, 0, obj_bangeffect)
            }
            sprite_index = choose(spr_parry1, spr_parry2, spr_parry3)
            state = (70 << 0)
            image_index = 0
            flash = 1
        }
        image_xscale *= -1
    }
    if (other.state == (8 << 0))
    {
        instance_create_depth(x, y, -1, obj_slimedebris)
        instance_create_depth(x, y, -1, obj_slimedebris)
        instance_create_depth(x, y, -1, obj_slimedebris)
        instance_create_depth(x, y, -1, obj_slimedebris)
        instance_create_depth(x, y, -1, obj_slimedebris)
        instance_create_depth(x, y, -1, obj_slimedebris)
        instance_create_depth(x, y, -1, obj_slimedebris)
        instance_create_depth(x, y, -1, obj_slimedebris)
        scr_fmod_soundeffectONESHOT("event:/sfx/enemy/punched", x, y)
        instance_destroy()
    }
}

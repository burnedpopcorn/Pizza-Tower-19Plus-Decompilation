function scr_playerS_homingattack() //scr_playerS_homingattack
{
    if (homingtarget != noone)
    {
        var _dir = point_direction(x, y, homingtarget.x, homingtarget.y)
        var _dist = distance_to_object(homingtarget)
        if (_dist < 250 && (!(collision_line(x, y, homingtarget.x, homingtarget.y, obj_solid, true, false))) && (!(collision_line(x, y, homingtarget.x, homingtarget.y, obj_platform, true, false))) && (!(collision_line(x, y, homingtarget.x, homingtarget.y, obj_slope, true, false))))
        {
            var spd = 18
            spd += 0.1
            hsp = lengthdir_x(spd, _dir)
            vsp = lengthdir_y(spd, _dir)
        }
        else
        {
            homingtarget = noone
            state = (36 << 0)
        }
        if (!instance_exists(homingtarget))
        {
            homingtarget = -4
            state = (36 << 0)
        }
        if (hsp > 0)
            xscale = 1
        if (hsp < 0)
            xscale = -1
    }
    if grounded
    {
        homingtarget = -4
        state = (36 << 0)
    }
    if (homingtarget == -4)
        state = (36 << 0)
}


var __player = other.id
with (__player)
{
    if scr_transformationcheck()
    {
        if (hsp != 0)
            xscale = sign(hsp)
        movespeed = abs(hsp)
        state = (0 << 0)
        sprite_index = spr_idle
        dir = xscale
        instance_create_depth(x, y, -100, obj_genericpoofeffect)
        with (other.id)
        {
            if (ds_list_find_index(global.saveroom, id) == -1)
                ds_list_add(global.saveroom, id)
            scr_fmod_soundeffect(other.priestsnd, other.x, other.y)
            with (instance_create_depth((other.x - 540), (camera_get_view_y(view_camera[1]) - 100), -99, obj_priestangel))
            {
                priestID = other.id
                playerid = __player
            }
            praying = 1
            alarm[0] = 120
            if givepoints
            {
                givepoints = 0
                with (other.id)
                {
                    givepoints = 1
                    givepointamount = 250
                    givepointmultiplier = 5
                }
                if (global.currentbadge != (3 << 0))
                    restore_combo()
            }
        }
    }
}

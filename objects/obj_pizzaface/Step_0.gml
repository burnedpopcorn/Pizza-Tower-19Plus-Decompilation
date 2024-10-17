event_set_3d_position(movingsnd, x, y)
if (sprite_index == spr_pizzaface_dead)
{
    stunshakeX = random_range(-6, 6)
    stunshakeY = random_range(-6, 6)
    if event_isplaying(movingsnd)
        event_stop(movingsnd, true)
    image_alpha = 1
}
else
{
    stunshakeX = 0
    stunshakeY = 0
    image_alpha = Approach(image_alpha, (!self.pizzaface_fadeout()), 0.025)
    if (image_alpha < 1)
    {
        dir = point_direction(x, y, obj_player.x, obj_player.y)
        movespeed = defaultspeed
    }
    if (image_alpha >= 1 && (!self.pizzaface_freeze()))
    {
        var _targetdir = point_direction(x, y, obj_player.x, obj_player.y)
        var _speedup = abs(angle_difference(_targetdir, dir)) < 15
        movespeed = Approach(movespeed, (_speedup ? maxspeed : minspeed), (_speedup ? 0.1 : 0.05))
        dir += ((angle_difference(_targetdir, dir)) * 0.04)
        x += lengthdir_x(movespeed, dir)
        y += lengthdir_y(movespeed, dir)
        if place_meeting(x, y, obj_player)
        {
            global.panic = false
            obj_player.state = (94 << 0)
            with (obj_baddie)
                persistent = false
            room_goto(timesuproom)
            obj_player.image_index = 0
            obj_player.visible = true
            obj_player.vsp = 0
            obj_player.hsp = 0
            scr_fmod_soundeffectONESHOT("event:/sfx/player/groundpound2d", x, y)
            event_play_oneshot("event:/music/timesup")
            instance_destroy(obj_fadeout)
            instance_destroy()
        }
    }
    if scr_treasureroomcheck()
    {
        x = -600
        y = -600
    }
    if (movespeed > defaultspeed)
    {
        if (!instance_exists(obj_pizzafacemach3effect))
        {
            macheffect = 1
            toomuchalarm = 6
            with (instance_create_depth(x, y, 0, obj_pizzafacemach3effect))
            {
                playerid = other.id
                image_index = other.image_index - 1
                image_xscale = other.image_xscale
                sprite_index = other.sprite_index
            }
            if (!trailerror)
            {
                errors += "\nERROR!: Can't find object ref 263"
                trailerror = true
            }
        }
        if (toomuchalarm > 0)
        {
            toomuchalarm -= 1
            if (toomuchalarm <= 0)
            {
                with (instance_create_depth(x, y, 0, obj_pizzafacemach3effect))
                {
                    playerid = other.id
                    image_index = other.image_index - 1
                    image_xscale = other.image_xscale
                    sprite_index = other.sprite_index
                }
                toomuchalarm1 = 6
            }
        }
    }
    else
        toomuchalarm = 0
}

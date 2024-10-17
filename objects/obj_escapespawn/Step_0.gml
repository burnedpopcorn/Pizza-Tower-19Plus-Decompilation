if (state == 0 || state == 1)
    instance_deactivate_object(baddieID)
switch state
{
    case 0:
        if (!global.panic)
            visible = false
        else
            state = 1
        break
    case 1:
        var p = instance_nearest(x, y, obj_player)
        visible = false
        image_index = 0
        if (p.x < (x + 500) && p.x > (x - 500) && p.y > (y - 100) && p.y < (y + 100))
        {
            state = 2
            visible = true
        }
        break
    case 2:
        if (floor(image_index) > 5)
        {
            instance_activate_object(baddieID)
            with (baddieID)
            {
                x = other.x
                y = other.y
                if escapestun
                {
                    state = 104
                    sprite_index = stunfallspr
                    stunned = 20
                }
                boundbox = 0
                hitboxcreate = 0
                instance_create_depth(x, y, -1, obj_genericpoofeffect)
            }
            scr_fmod_soundeffectONESHOT("event:/sfx/enemy/spatout", x, y)
            state = 3
        }
        break
    case 3:
        if (floor(image_index) == (image_number - 1))
            visible = false
        break
}


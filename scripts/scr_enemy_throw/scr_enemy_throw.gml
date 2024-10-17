function scr_enemy_throw() //scr_enemy_throw
{
    if (!variable_global_exists("throw_frame"))
    {
        global.throw_frame = 0
        global.throw_frame[obj_pizzagoblin] = 11
        global.throw_frame[obj_pepgoblin] = 2
        global.throw_frame[obj_swedishmonkey] = 15
        global.throw_sprite = spr_plug
        global.throw_sprite[obj_pizzagoblin] = spr_pizzagoblin_throwbomb
        global.throw_sprite[obj_pepgoblin] = spr_pepgoblin_kick
        global.throw_sprite[obj_swedishmonkey] = spr_swedishmonkey_eat
        global.reset_timer = 0
        global.reset_timer[obj_pizzagoblin] = 200 / (global.stylethreshold + 1)
        global.reset_timer[obj_pepgoblin] = 100 / (global.stylethreshold + 1)
        global.reset_timer[obj_swedishmonkey] = 200 / (global.stylethreshold + 1)
    }
    hsp = 0
    if place_meeting(x, (y + 1), obj_railh)
        hsp = -5
    else if place_meeting(x, (y + 1), obj_railh2)
        hsp = 5
    if (floor(image_index) == (image_number - 1))
        state = 100
    if (bombreset == 0 && floor(image_index) == global.throw_frame[object_index])
    {
        bombreset = global.reset_timer[object_index]
        sprite_index = global.throw_sprite[object_index]
        scr_fmod_soundeffectONESHOT("event:/sfx/enemy/projectile", x, y)
        switch object_index
        {
            case obj_pizzagoblin:
                with (instance_create_depth(x, y, 0, obj_bomb))
                {
                    hsp = other.image_xscale * 10
                    vsp = -8
                    goblinbomb = true
                }
                break
            case obj_pepgoblin:
                with (instance_create_depth(x, y, 0, obj_pepgoblin_kickhitbox))
                {
                    baddieID = other.id
                    image_xscale = other.image_xscale
                }
                break
            case obj_swedishmonkey:
                with (instance_create_depth(x, (y - 30), 0, obj_slipnslide))
                {
                    baddieID = other.id
                    image_xscale = other.image_xscale
                    hsp = (-other.image_xscale) * 4
                    vsp = -5
                    with (obj_slipnslide)
                    {
                        if (baddieID == other.baddieID)
                            banana += 1
                    }
                }
                break
        }

    }
    if ((!grounded) && hsp < 0)
        hsp += 0.1
    else if ((!grounded) && hsp > 0)
        hsp -= 0.1
}


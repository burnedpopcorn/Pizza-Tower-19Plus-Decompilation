if dead
{
    if (obj_player.state != (87 << 0))
        instance_destroy()
}
else if instance_exists(grabbedby)
{
    if place_meeting(x, y, obj_swordhitbox)
    {
        if (grabbedby.sprite_index == grabbedby.spr_uppercutfinishingblow)
        {
            vsp = -18
            hsp = 0
        }
        else
        {
            vsp = -4
            hsp = 16 * grabbedby.xscale
        }
        var _ray = fire_ray(x, y, grabbedby.x, grabbedby.y, 1, -4, -4, mask_index)
        if (!_ray.clear)
        {
            x = _ray.x
            y = _ray.y
        }
        if scr_solid(x, y)
        {
            x = grabbedby.x
            y = grabbedby.y
        }
        grabbedby = noone
        thrown = true
        return;
    }
    if (grabbedby.state != (87 << 0) && grabbedby.state != (28 << 0) && grabbedby.state != (119 << 0) && grabbedby.state != (7 << 0) && grabbedby.state != (2 << 0) && grabbedby.sprite_index != grabbedby.spr_piledriver && grabbedby.sprite_index != grabbedby.spr_piledriverland)
    {
        x = grabbedby.x
        y = grabbedby.y
        grabbedby = noone
        depth = 0
        return;
    }
    if (grabbedby.state == (28 << 0) || grabbedby.state == (7 << 0))
    {
        x = grabbedby.x
        if (grabbedby.sprite_index != spr_player_haulingstart && grabbedby.character == "P")
            y = grabbedby.y - 60
        else if (floor(grabbedby.image_index) == 0)
            y = grabbedby.y - 10
        else if (floor(grabbedby.image_index) == 1)
            y = grabbedby.y - 30
        else if (floor(grabbedby.image_index) == 2)
            y = grabbedby.y - 45
        else if (floor(grabbedby.image_index) == 3)
            y = grabbedby.y - 50
        else if (floor(grabbedby.image_index) == 4)
            y = grabbedby.y - 55
        image_xscale = (-grabbedby.xscale)
        depth = 0
    }
    if ((grabbedby.state == (28 << 0) && grabbedby.sprite_index == grabbedby.spr_swingding) || (grabbedby.state == (87 << 0) && grabbedby.sprite_index == grabbedby.spr_swingding))
    {
        if (floor(grabbedby.image_index) == 0)
        {
            depth = -8
            x = grabbedby.x + grabbedby.xscale * 15
            y = grabbedby.y
        }
        if (floor(grabbedby.image_index) == 1)
        {
            depth = -8
            x = grabbedby.x + grabbedby.xscale * 10
            y = grabbedby.y
        }
        if (floor(grabbedby.image_index) == 2)
        {
            depth = -8
            x = grabbedby.x
            y = grabbedby.y
        }
        if (floor(grabbedby.image_index) == 3)
        {
            depth = -8
            x = grabbedby.x + grabbedby.xscale * -10
            y = grabbedby.y
        }
        if (floor(grabbedby.image_index) == 4)
        {
            depth = -8
            x = grabbedby.x + grabbedby.xscale * -15
            y = grabbedby.y
        }
        if (floor(grabbedby.image_index) == 5)
        {
            depth = 0
            x = grabbedby.x + grabbedby.xscale * -10
            y = grabbedby.y
        }
        if (floor(grabbedby.image_index) == 6)
        {
            depth = 0
            x = grabbedby.x
            y = grabbedby.y
        }
        if (floor(grabbedby.image_index) == 7)
        {
            depth = 0
            x = grabbedby.x + grabbedby.xscale * 10
            y = grabbedby.y
        }
    }
    if (grabbedby.state == (119 << 0))
    {
        x = grabbedby.x + grabbedby.xscale * 60
        y = grabbedby.y
        image_xscale = (-grabbedby.xscale)
        depth = 0
    }
    if (grabbedby.state == (2 << 0))
    {
        _ray = fire_ray(grabbedby.x, grabbedby.y, (grabbedby.x + grabbedby.xscale * 60), (grabbedby.y - 1), 1, -4, -4, mask_index)
        x = _ray.x
        y = _ray.y
        depth = 0
    }
    if (grabbedby.sprite_index == grabbedby.spr_piledriver)
    {
        if (grabbedby.character == "P")
        {
            if (floor(grabbedby.image_index) == 0)
            {
                depth = 0
                x = grabbedby.x + grabbedby.xscale * 10
                y = grabbedby.y
            }
            if (floor(grabbedby.image_index) == 1)
            {
                depth = 0
                x = grabbedby.x + grabbedby.xscale * 5
                y = grabbedby.y
            }
            if (floor(grabbedby.image_index) == 2)
            {
                depth = 0
                x = grabbedby.x
                y = grabbedby.y
            }
            if (floor(grabbedby.image_index) == 3)
            {
                depth = 0
                x = grabbedby.x + grabbedby.xscale * -5
                y = grabbedby.y
            }
            if (floor(grabbedby.image_index) == 4)
            {
                depth = 0
                x = grabbedby.x + grabbedby.xscale * -10
                y = grabbedby.y
            }
            if (floor(grabbedby.image_index) == 5)
            {
                depth = -8
                x = grabbedby.x + grabbedby.xscale * -5
                y = grabbedby.y
            }
            if (floor(grabbedby.image_index) == 6)
            {
                depth = -8
                x = grabbedby.x
                y = grabbedby.y
            }
            if (floor(grabbedby.image_index) == 7)
            {
                depth = -8
                x = grabbedby.x + grabbedby.xscale * 5
                y = grabbedby.y
            }
        }
        else
        {
            if (grabbedby.character == "N")
                depth = -7
            x = grabbedby.x
            y = grabbedby.y - 40
        }
    }
    if (grabbedby.sprite_index == grabbedby.spr_piledriverland)
    {
        x = grabbedby.x
        y = grabbedby.y
        if (floor(grabbedby.image_index) == (grabbedby.image_number - 1))
        {
            with (grabbedby)
            {
                vsp = -11
                jumpstop = 0
                jumpAnim = 1
                sprite_index = spr_airjugglestart
                image_index = 0
                state = (36 << 0)
            }
            grabbedby = noone
            thrown = true
            vsp = -8
            hsp = 2 * image_xscale
        }
    }
}
else
{
    var _hitsomething = scr_collide_and_destroy([obj_destructibles, obj_ratblock, obj_enemyblock])
    if (_hitsomething && thrown)
        hitblock = true
    if (hsp == 0 && grounded && vsp >= 0)
    {
        if thrown
        {
            if (!hitblock)
            {
                trace("junk missed")
                push_notif((17 << 0), [image_index])
            }
            hitblock = false
            thrown = false
        }
    }
    if (grounded && vsp >= 0)
    {
        if midair
        {
            midair = false
            if bbox_in_camera(view_camera[1], id)
                camera_shake(8, 30)
            scr_fmod_soundeffectONESHOT("event:/sfx/player/groundpound", x, y)
        }
        hsp = Approach(hsp, 0, 0.5)
        var _arr = array_create(4)
        var _i = 0
        var _cheese = instance_place(x, y, obj_destructibleplatform)
        while (_cheese != -4 && _i < array_length(_arr))
        {
            with (_cheese)
            {
                falling = 1
                image_speed = 0.35
                push_notif((1 << 0), [id])
                _arr[_i++] = id
                y -= room_height
            }
            _cheese = instance_place(x, y, obj_destructibleplatform)
        }
        repeat _i
            _arr[--_i].y += room_height
    }
    else
        midair = true
    depth = 0
}
if (place_meeting(x, y, obj_cheesedragon) && hsp == 0)
{
    image_xscale = obj_cheesedragon.image_xscale
    hsp = -5 * image_xscale
    vsp = -5
}
if (place_meeting(x, y, [obj_hallway, obj_verticalhallway]) || (!(rectangle_in_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, -50, -50, (room_width + 50), (room_height + 50)))))
{
    x = xstart
    y = ystart
    instance_create_depth(x, y, (depth - 1), obj_genericpoofeffect)
    if instance_exists(grabbedby)
    {
        grabbedby.state = (0 << 0)
        grabbedby = -4
    }
}

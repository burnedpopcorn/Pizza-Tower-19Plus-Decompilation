if ((sprite_index == spr_geromedoorunopened && there_is_follower_obj(obj_gerome)) || sprite_index == spr_geromedooropened)
{
    if (!instance_exists(uparrowid))
        uparrowid = create_uparrow()
}
else if instance_exists(uparrowid)
    instance_destroy(uparrowid)
var p = obj_player
if (place_meeting(x, y, p) && input_check("up") && p.grounded && (p.state == (0 << 0) || p.state == (47 << 0) || p.state == (66 << 0) || p.state == (42 << 0)) && sprite_index == spr_geromedoorunopened && there_is_follower_obj(obj_gerome))
{
    ds_list_add(global.saveroom, id)
    p.state = (54 << 0)
    p.image_index = 0
    p.sprite_index = p.spr_lookdoor
    p.enteredDoor = other.id
    p.image_speed = 0.35
    event_play_oneshot("event:/sfx/player/collect/treasure")
    if instance_exists(obj_gerome)
    {
        with (obj_gerome)
        {
            if (sprite_index != spr_gerome_openingdoor && sprite_index != spr_gerome_openingdoorloop)
                sprite_index = spr_gerome_openingdoor
            image_speed = 0.35
            image_index = 0
            x = p.x
            y = p.y
        }
    }
}
if instance_exists(obj_gerome)
{
    with (obj_gerome)
    {
        if (sprite_index == spr_gerome_openingdoor)
        {
            if (floor(image_index) == 4 && (!other.playedrattling))
            {
                scr_fmod_soundeffectONESHOT("event:/sfx/player/unlockdoorstart", x, y)
                other.playedrattling = true
            }
            if (floor(image_index) == 11 && other.sprite_index != spr_geromedooropened)
            {
                scr_fmod_soundeffectONESHOT("event:/sfx/player/unlockdoor", x, y)
                instance_create_depth((other.x + 50), (other.y + 50), 0, obj_lock)
                other.sprite_index = spr_geromedooropened
            }
            if (floor(image_index) == (image_number - 1))
            {
                sprite_index = spr_gerome_openingdoorloop
                p.state = (41 << 0)
                p.sprite_index = p.spr_victory
                p.image_index = 14
            }
        }
    }
}
with (p)
{
    if (sprite_index == spr_lookdoor && floor(image_index) == (image_number - 1))
        image_speed = 0
    if (place_meeting(x, y, obj_geromedoor) && input_check("up") && grounded && other.sprite_index == spr_geromedooropened && (state == (0 << 0) || state == (47 << 0) || state == (66 << 0)) && (!instance_exists(obj_fadeout)) && state != (54 << 0) && state != (41 << 0) && state != (39 << 0))
    {
        image_index = 0
        obj_drawcontroller.chargecamera = 0
        sprite_index = spr_lookdoor
        targetDoor = other.targetDoor
        targetRoom = other.targetRoom
        enteredDoor = other.id
        image_index = 0
        state = (54 << 0)
        event_play_oneshot("event:/sfx/player/doorenter")
        instance_create_depth(x, y, -9999, obj_fadeout)
    }
    if (floor(image_index) == (image_number - 1) && state == (41 << 0))
    {
        targetDoor = other.targetDoor
        targetRoom = other.targetRoom
        if (!instance_exists(obj_fadeout))
            instance_create_depth(x, y, -9999, obj_fadeout)
    }
}
if place_meeting(x, y, obj_doorletterpar)
    targetDoor = instance_place(x, y, obj_doorletterpar).letter

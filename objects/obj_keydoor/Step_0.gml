if ((sprite_index == spr_doorkey && global.key_inv) || sprite_index == spr_door)
{
    if (!instance_exists(uparrowid))
        uparrowid = create_uparrow()
}
else if instance_exists(uparrowid)
    instance_destroy(uparrowid)
if (obj_player.grounded && (obj_player.state == (0 << 0) || obj_player.state == (46 << 0) || obj_player.state == (47 << 0) || obj_player.state == (66 << 0) || obj_player.state == (42 << 0)) && (sprite_index == spr_doorkey || sprite_index == spr_factorydoorkey) && input_check("up") && global.key_inv == 1 && place_meeting(x, y, obj_player))
{
    ds_list_add(global.saveroom, id)
    obj_player.state = (41 << 0)
    obj_player.image_index = 0
    obj_player.enteredDoor = id
    image_index = 0
    sprite_index = spr_door
    if layer_exists(layer_get_id(string("{0}keydoor", doortype)))
        layer_destroy(layer_get_id(string("{0}keydoor", doortype)))
    image_speed = 0.35
    instance_create_depth((x + 50), (y + 50), 0, obj_lock)
    scr_fmod_soundeffectONESHOT("event:/sfx/player/unlockdoor", obj_player.x, obj_player.y)
    with (instance_create_depth((x + 50), (y + 50), 0, obj_baddiedead))
        sprite_index = spr_keytlyn_dead
    global.key_inv = 0
}
with (obj_player)
{
    if (place_meeting(x, y, obj_keydoor) && grounded && other.sprite_index == spr_door && input_check("up") && (state == (0 << 0) || state == (42 << 0) || state == (46 << 0) || state == (47 << 0) || state == (66 << 0)) && (!instance_exists(obj_fadeout)) && state != (54 << 0) && state != (41 << 0) && state != (39 << 0))
    {
        lastroom_x = other.x
        lastroom_y = other.y
        lastroom = room
        event_play_oneshot("event:/sfx/player/doorenter")
        obj_drawcontroller.chargecamera = 0
        ds_list_add(global.saveroom, id)
        obj_player.sprite_index = spr_lookdoor
        obj_player.enteredDoor = other.id
        obj_player.targetDoor = other.targetDoor
        obj_player.targetRoom = other.targetRoom
        obj_player.image_index = 0
        obj_player.state = (54 << 0)
        obj_player.mach2 = 0
        other.visited = 1
        instance_create_depth(x, y, -9999, obj_fadeout)
    }
}
if (floor(obj_player.image_index) == (obj_player.image_number - 1) && obj_player.state == (41 << 0))
{
    with (obj_player)
    {
        obj_player.targetDoor = other.targetDoor
        obj_player.targetRoom = other.targetRoom
        if (!instance_exists(obj_fadeout))
        {
            instance_create_depth(x, y, -9999, obj_fadeout)
            event_play_oneshot("event:/sfx/player/doorenter")
        }
    }
}
if place_meeting(x, y, obj_doorletterpar)
    targetDoor = instance_place(x, y, obj_doorletterpar).letter

with (obj_player)
{
    if (input_check("up") && grounded && state != (54 << 0) && state != (39 << 0) && (state == (0 << 0) || state == (47 << 0) || state == (66 << 0) || state == (42 << 0)) && (!instance_exists(obj_fadeout)) && get_savestate() == (0 << 0))
    {
        event_play_oneshot("event:/sfx/player/doorenter")
        obj_drawcontroller.chargecamera = 0
        sprite_index = spr_lookdoor
        image_index = 0
        state = (54 << 0)
        enteredDoor = other.id
        targetDoor = "D"
        targetRoom = Scootertransition
        instance_create_depth(x, y, -9999, obj_titleloadfade)
    }
}

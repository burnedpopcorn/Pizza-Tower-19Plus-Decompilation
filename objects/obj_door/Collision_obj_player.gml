function doorcheck() //doorcheck@gml_Object_obj_door_Collision_obj_player
{
    if (input_check("up") && grounded && other.sprite_index != spr_blockeddoor && state != (54 << 0) && state != (39 << 0) && (state == (0 << 0) || state == (47 << 0) || state == (66 << 0) || state == (42 << 0)) && (!instance_exists(obj_fadeout)))
        enterdoor()
}

if (!(place_meeting(x, y, obj_doorblocked)))
{
    with (obj_player)
        doorcheck()
}

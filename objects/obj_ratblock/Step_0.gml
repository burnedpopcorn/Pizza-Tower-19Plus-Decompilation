if (shouldsniff && (!event_isplaying(ratsniffsnd)))
    fmod_studio_event_instance_start(ratsniffsnd)
else
    destroy_sounds([ratsniffsnd])
with (obj_mortprojectile)
{
    if (place_meeting((x + hspeed), y, other.id) || place_meeting((x + image_xscale), y, other.id))
        instance_destroy(other.id)
}
if (sprite_index == bumpspr && floor(image_index) == (image_number - 1))
{
    sprite_index = idlespr
    image_index = 0
}

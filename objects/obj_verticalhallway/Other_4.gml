if place_meeting(x, y, obj_player)
    visited = 1
if (instance_exists(obj_doorletterpar) && place_meeting(x, y, obj_doorletterpar))
{
    targetDoor = instance_place(x, y, obj_doorletterpar).letter
    doorletterid = instance_place(x, y, obj_doorletterpar).id
}

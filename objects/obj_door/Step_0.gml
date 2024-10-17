if (place_meeting(x, y, obj_destructibles) || invisible)
    visible = false
else
    visible = true
if visited
{
    var doorspr = spr_door
    if escape
        doorspr = (global.panic ? spr_blockeddoor : spr_door)
    else
        doorspr = spr_door
    sprite_index = doorspr
}
if place_meeting(x, y, obj_doorletterpar)
    targetDoor = instance_place(x, y, obj_doorletterpar).letter

if place_meeting(x, y, obj_destructibles)
    visible = false
else
    visible = true
with (obj_player)
{
    if (other.image_yscale == 1)
    {
        if ((!(place_meeting(x, (y + 1), obj_destructibles))) && place_meeting(x, (y + 1), other.id) && (state == (43 << 0) || character == "S" || state == (23 << 0) || state == (45 << 0) || state == (51 << 0) || state == (53 << 0) || state == (120 << 0)) && (!(place_meeting(x, (y + 1), obj_destructibles))) && place_meeting(x, (y + 1), other.id) && (!instance_exists(obj_fadeout)) && state != (54 << 0) && state != (39 << 0))
            enterboxofpizza(spr_downpizzabox)
    }
    if (other.image_yscale == -1)
    {
        if ((!(place_meeting(x, (y - 1), obj_destructibles))) && place_meeting(x, (y - 1), other.id) && ((input_check("up") && (state == (0 << 0) || state == (36 << 0) || state == (75 << 0) || state == (47 << 0) || state == (66 << 0) || state == (120 << 0))) || state == (40 << 0) || state == (68 << 0)) && (!(place_meeting(x, (y - 1), obj_destructibles))) && place_meeting(x, (y - 1), other.id) && (!instance_exists(obj_fadeout)) && state != (54 << 0) && state != (39 << 0))
            enterboxofpizza(spr_uppizzabox)
    }
}
if place_meeting(x, (y + 1), obj_doorletterpar)
    targetDoor = instance_place(x, (y + 1), obj_doorletterpar).letter
if place_meeting(x, (y - 1), obj_doorletterpar)
    targetDoor = instance_place(x, (y - 1), obj_doorletterpar).letter

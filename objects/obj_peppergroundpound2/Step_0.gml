if instance_exists(obj_pepperman)
{
    with (obj_player)
    {
        if (place_meeting(x, y, obj_peppergroundpound2) && (!(place_meeting(x, y, obj_peppergroundpound))))
            obj_pepperman.cangroundpound = true
        if ((!(place_meeting(x, y, obj_peppergroundpound2))) && (!(place_meeting(x, y, obj_peppergroundpound))))
            obj_pepperman.cangroundpound = false
    }
}

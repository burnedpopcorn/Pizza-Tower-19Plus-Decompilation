visible = 1
if place_meeting(x, y, obj_baddiecollisionbox)
{
    with (instance_place(x, y, obj_baddiecollisionbox))
    {
        if (instance_exists(baddieID) && baddieID.thrown == 1)
        {
            if place_meeting((x - baddieID.hsp), y, other.id)
                instance_destroy()
            if place_meeting((x + baddieID.hsp), y, other.id)
                instance_destroy()
            if place_meeting(x, (y - baddieID.vsp), other.id)
                instance_destroy()
            if place_meeting(x, (y + baddieID.vsp), other.id)
                instance_destroy()
        }
    }
}

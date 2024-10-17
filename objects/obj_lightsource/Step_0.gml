for (var i = 0; i < array_length(darkobjarr); i++)
{
    with (darkobjarr[i])
    {
        if place_meeting(x, y, other.id)
            darkalpha = (point_distance(x, y, other.x, other.y)) / other.distance
        if (!(place_meeting(x, y, obj_lightsource)))
            darkalpha = 1
    }
}

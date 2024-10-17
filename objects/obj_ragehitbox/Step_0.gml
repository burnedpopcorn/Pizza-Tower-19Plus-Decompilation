if (!instance_exists(ID))
    instance_destroy()
if instance_exists(ID)
{
    x = ID.x
    y = ID.y
    image_xscale = ID.image_xscale
    image_index = ID.image_index
    with (ID)
    {
        if (object_index == obj_fencer || object_index == obj_ancho || object_index == obj_cheeseslime)
        {
            if (state != 94)
            {
                hitboxcreate = 0
                instance_destroy(other.id)
            }
        }
    }
}

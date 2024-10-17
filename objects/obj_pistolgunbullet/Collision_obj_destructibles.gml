with (other)
{
    if (object_index == obj_onewaybigblock)
    {
        if (other.image_xscale != image_xscale)
            instance_destroy()
    }
    else if (object_index != obj_onewaybigblock)
        instance_destroy()
}

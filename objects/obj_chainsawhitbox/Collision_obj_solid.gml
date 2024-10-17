if (bumpeffect == 0)
{
    bumpeffect = 1
    if (!instance_exists(obj_spikehurteffect))
    {
        with (instance_create_depth((x + image_xscale * 40), y, 0, obj_spikehurteffect))
            other.image_xscale = image_xscale
    }
}

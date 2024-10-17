function effectMapAdd(argument0, argument1) //effectMapAdd
{
    if (argument0 == undefined)
        argument0 = 1
    if (argument1 == undefined)
        argument1 = object_index
    if (!visible)
        return;
    with (obj_player)
    {
        if (_player != argument0)
        {
        }
        else
        {
            var key = array_get_index(vfxobjs, argument1)
            if (key == -1)
            {
                show_debug_message("{0} not represented in drawn effects list!", object_get_name(argument1))
                return;
            }
            array_push(vfx[key], other)
        }
    }
}


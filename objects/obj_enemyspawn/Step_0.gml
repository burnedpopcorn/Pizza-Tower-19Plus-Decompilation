if (global.spawned == true && (!obj))
{
    obj = instance_create_depth(x, y, 0, content)
    obj.image_xscale = image_xscale
    instance_create_depth(x, (y - 5), 1, obj_pizzaportalfade)
}
if (obj && (!instance_exists(obj)))
    instance_destroy()
string("doing {0}", "this")

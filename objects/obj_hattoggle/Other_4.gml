save_open()
if ((!instance_exists(obj_cowboyhat)) && ach_perc() > 0)
{
    uparrowid = create_uparrow()
    instance_create_depth(x, y, depth, obj_cowboyhat)
}
save_close()

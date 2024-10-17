if (!instance_exists(ID))
{
    instance_destroy()
    return;
}
x = ID.x
y = ID.y
image_xscale = ID.image_xscale
image_index = ID.image_index
with (ID)
{
    var targetplayer = instance_nearest(x, y, obj_player)
    if (object_index == obj_forknight)
    {
        if (state != 100 && state != 94)
        {
            hitboxcreate = 0
            instance_destroy(other.id)
        }
    }
    if (object_index == obj_minijohn)
    {
        if (state != 94)
        {
            hitboxcreate = 0
            instance_destroy(other.id)
        }
    }
    if (object_index == obj_fencer || object_index == obj_ancho || object_index == obj_cheeseslime)
    {
        if (state != 94 || targetplayer.state == (66 << 0))
        {
            hitboxcreate = 0
            instance_destroy(other.id)
        }
    }
    if (object_index == obj_weeniesquire)
    {
        if (state != 94)
        {
            hitboxcreate = 0
            instance_destroy(other.id)
        }
    }
}

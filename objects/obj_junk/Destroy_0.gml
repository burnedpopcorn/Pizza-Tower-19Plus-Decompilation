if (image_index == 3)
    instance_create_depth(x, y, depth, obj_bombexplosion2)
else
{
    with (instance_create_depth(x, y, depth, obj_baddiedead))
    {
        sprite_index = spr_deadjunk
        image_speed = 0
        image_index = other.image_index
    }
}
ds_list_add(global.saveroom, id)

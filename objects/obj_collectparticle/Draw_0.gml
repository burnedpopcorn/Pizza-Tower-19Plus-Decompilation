if global.timetrial
{
    with (instance_create_depth(x, y, depth, obj_debris))
    {
        sprite_index = other.sprite_index
        image_index = other.image_index
        image_angle = other.image_angle
        image_speed = other.image_speed
        image_alpha = other.image_alpha
    }
    instance_destroy()
}

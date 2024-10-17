if (other.state != 107 && other.state != 300 && (sprite_index == spr_brick1falling || sprite_index == spr_brick2falling))
{
    instance_destroy(other.id)
    instance_destroy()
    push_notif((13 << 0), [object_index])
}

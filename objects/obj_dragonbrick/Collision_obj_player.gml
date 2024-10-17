if (other.state != (87 << 0) && (sprite_index == spr_brick1falling || sprite_index == spr_brick2falling))
{
    scr_hurtplayer(other.id, false)
    instance_destroy()
}

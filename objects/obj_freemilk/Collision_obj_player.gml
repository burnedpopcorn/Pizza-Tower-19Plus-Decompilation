with (obj_player)
{
    if (state == (5 << 0) && sprite_index != spr_firemouthend && sprite_index != spr_firemouthintro)
    {
        image_index = 0
        sprite_index = spr_firemouthend
        other.sprite_index = spr_freemilksuprised
        other.image_index = 0
    }
}
if (sprite_index == spr_freemilksuprised && floor(image_index) == (image_number - 1))
    sprite_index = spr_freemilk

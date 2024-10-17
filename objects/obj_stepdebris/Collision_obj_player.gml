var _spr = debrisspr
with (other.id)
{
    if (hsp != 0 && vsp >= 0 && grounded && (floor(image_index) % 10) == 0)
    {
        with (instance_create_depth(x, (y + 43), (depth + 1), obj_debris))
            sprite_index = _spr
    }
}

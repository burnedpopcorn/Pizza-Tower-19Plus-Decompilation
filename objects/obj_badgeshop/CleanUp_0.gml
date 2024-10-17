if surface_exists(surf)
    surface_free(surf)
destroy_sounds([mu])
if instance_exists(obj_player)
{
    if (obj_player.state == (110 << 0))
    {
        obj_player.state = (0 << 0)
        input_clear_momentary(true)
    }
}
if (coinsspent == 0)
    instance_destroy(subtracteffect)

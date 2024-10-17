image_xscale = obj_player.xscale
x = obj_player.x
y = obj_player.y
if (obj_player.state != (20 << 0))
    instance_destroy()
if (place_meeting(x, (y + 1), obj_solid) || place_meeting(x, y, obj_spike))
{
    if (!instance_exists(obj_pogoeffect))
        instance_create_depth(x, y, 0, obj_pogoeffect)
    obj_player.image_index = 0
    obj_player.sprite_index = spr_player_chainsawpogobounce
    obj_player.vsp = -7
}
if place_meeting(x, y, obj_pizzaboxunopen)
{
    with (obj_pizzaboxunopen)
    {
        if (sprite_index == spr_pizzaboxunopen)
        {
            if (!instance_exists(obj_pogoeffect))
                instance_create_depth(other.x, other.y, 0, obj_pogoeffect)
            obj_player.image_index = 0
            obj_player.sprite_index = spr_player_chainsawpogobounce
            obj_player.vsp = -7
        }
    }
}
if place_meeting(x, y, obj_destructibles)
{
    obj_player.image_index = 0
    obj_player.sprite_index = spr_player_chainsawpogobounce
    obj_player.vsp = -7
}
if place_meeting(x, y, obj_bigdestructibles)
{
    obj_player.image_index = 0
    obj_player.sprite_index = spr_player_chainsawpogobounce
}
if place_meeting(x, y, obj_metalblock)
{
    obj_player.image_index = 0
    obj_player.sprite_index = spr_player_chainsawpogobounce
    obj_player.vsp = -7
}

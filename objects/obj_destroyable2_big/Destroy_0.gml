if (ds_list_find_index(global.saveroom, id) == -1)
{
    with (instance_create_depth(x, y, -1, obj_stompeffect))
    {
        image_index = 0
        sprite_index = other.deadspr
    }
    scr_sound_multiple("event:/sfx/player/collect/topping", x, y)
    add_collect(50)
    with (instance_create_depth((x + (irandom_range(-32, 32))), (y + (irandom_range(-32, 32))), -9999999, obj_collectparticle))
    {
        sprite_index = get_collectspr((1 << 0), obj_player.character)
        image_speed = 0.35
        image_index = other.id.image_index
        value = 25
        shake = 6
    }
    with (instance_create_depth((x + (irandom_range(-32, 32))), (y + (irandom_range(-32, 32))), -9999999, obj_collectparticle))
    {
        sprite_index = get_collectspr((1 << 0), obj_player.character)
        image_speed = 0.35
        image_index = other.id.image_index + irandom(9)
        value = 25
        shake = 6
    }
    with (instance_create_depth((x + 16), y, 0, obj_smallnumber))
        number = "50"
    restore_combo()
    scr_sound_multiple("event:/sfx/misc/breakblock", x, y)
    ds_list_add(global.saveroom, id)
}

if (ds_list_find_index(global.saveroom, id) == -1)
{
    with (instance_create_depth(x, y, -1, obj_stompeffect))
    {
        image_index = 0
        sprite_index = other.deadspr
    }
    scr_sound_multiple("event:/sfx/player/collect/topping", x, y)
    with (instance_create_depth(x, y, -9999999, obj_collectparticle))
    {
        sprite_index = get_collectspr((0 << 0), obj_player.character)
        image_speed = 0.35
        image_index = other.id.image_index
        value = 10
        shake = 4
    }
    add_collect(10)
    with (instance_create_depth((x + 16), y, 0, obj_smallnumber))
        number = "10"
    restore_combo(10)
    scr_sound_multiple("event:/sfx/misc/breakblock", x, y)
    ds_list_add(global.saveroom, id)
}

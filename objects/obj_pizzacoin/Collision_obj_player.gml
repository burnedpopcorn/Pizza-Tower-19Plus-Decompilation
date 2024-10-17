if (other.state == (126 << 0))
    return;
if (!collectmode)
{
    var _id = string_concat(room_get_name(room), "|", xstart, "|", ystart)
    ds_list_add(ds_map_find_value(global.pizzacointracker, global.levelname), _id)
    if (get_levelcoincount(global.levelname) < 25)
        obj_pizzacoinindicator.show = 70
    else
    {
        obj_pizzacoinindicator.show = 0
        obj_pizzacoinindicator.image_alpha = 0
        event_play_oneshot("event:/sfx/player/collect/pizzacoinallcollected")
        with (instance_create_depth(x, y, -999, obj_comboend))
            sprite_index = spr_pizzacoinallcollected
    }
}
else
{
    with (instance_create_depth(x, y, -9999999, obj_collectparticle))
    {
        sprite_index = other.id.sprite_index
        image_speed = other.image_speed
        image_index = other.image_index
        value = 10
        shake = 4
    }
    add_collect(10)
    with (instance_create_depth((x + 16), y, 0, obj_smallnumber))
        number = "10"
}
ds_list_add(global.saveroom, id)
scr_sound_multiple("event:/sfx/player/collect/pizzacoin", x, y)
with (instance_create_depth(x, y, 0, obj_parryeffect))
    sprite_index = choose(spr_collectsparkleeffect, spr_collectsparkleeffect2)
if (global.currentbadge != (3 << 0))
    restore_combo(30)
instance_destroy()

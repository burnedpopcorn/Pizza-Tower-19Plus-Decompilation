if (place_meeting(x, y, obj_player) && sprite_index == spr_pizzaboxunopen)
{
    if object_is_ancestor(content, obj_toppinpar)
    {
        voice_collect(obj_player)
        event_play_oneshot("event:/sfx/player/collect/toppin")
        with (instance_create_depth(x, y, 0, obj_smallnumber))
            number = "1000"
        add_collect(1000)
        instance_create_depth(x, y, 4, obj_taunteffect)
        with (instance_create_depth(x, (y - 25), 0, content))
            sprite_index = introspr
        with (obj_drawcontroller)
        {
            self.tv_thintext()
            alarm[9] = 180
            var _toppincount = get_toppincount()
            if (_toppincount < 5)
                thintext = string_get("thintexts/toppinget", (5 - _toppincount))
            if (_toppincount >= 5)
                thintext = string_get("thintexts/toppinall")
            happyhud = 1
            alarm[10] = 120
        }
        if (global.currentbadge != (3 << 0))
            restore_combo()
    }
    sprite_index = spr_pizzaboxopen
}
if (sprite_index == spr_pizzaboxopen && floor(image_index) == 16)
    instance_destroy()

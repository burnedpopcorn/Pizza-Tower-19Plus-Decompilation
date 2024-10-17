x = xstart + (random_range(-2, 2))
y = ystart + (random_range(-2, 2))
if (obj_player.state != (87 << 0))
{
    instance_destroy()
    if (global.levelname != "dragonslair")
        fmod_studio_event_instance_start(global.snd_escaperumble)
    else if (room == dragonslair_1 && layer_exists(layer_get_id("dragonlair_backgroundrain")))
        layer_set_visible(layer_get_id("dragonlair_backgroundrain"), true)
    if (global.levelname == "tutorial")
    {
        if layer_exists(layer_get_id("tutorialdoor"))
            layer_destroy(layer_get_id("tutorialdoor"))
        if layer_exists(layer_get_id("tutorialdoorblocked"))
            layer_set_visible(layer_get_id("tutorialdoorblocked"), 1)
    }
    add_combo()
    instance_create_depth(x, y, 8, obj_johnflash)
    instance_create_depth(x, y, 0, obj_bangeffect)
    repeat (4)
    {
        instance_create_depth(irandom_range(bbox_left, bbox_right), irandom_range(bbox_top, bbox_bottom), -1, obj_slapstar)
        instance_create_depth(irandom_range(bbox_left, bbox_right), irandom_range(bbox_top, bbox_bottom), -1, obj_baddiegibs)
    }
    with (instance_create_depth(x, y, 0, obj_baddiedead))
        sprite_index = spr_pillarjohn_dead
    scr_fmod_soundeffectONESHOT("event:/sfx/enemy/die", x, y)
    instance_create_depth(x, (y + 600), 0, obj_itspizzatime)
    if (global.levelname == "tutorial")
        trigger_news(string_get("tvmessages/tutorial/escape"), ["tutorialpanic"])
    obj_drawcontroller.escapetimery = 64
    global.panic = true
    global.escapetime = get_escapetime(global.levelname)
    obj_drawcontroller.alarm[0] = 60
    global.wave = 0
    global.maxwave = global.escapetime * 60
}

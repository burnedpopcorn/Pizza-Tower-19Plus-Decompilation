if (global.tutorialdone || obj_player.trapactivated)
{
    var _layer = layer_get_id("ground")
    var _background = layer_background_get_id(_layer)
    layer_background_sprite(_background, bg_tutorialgroundtraptriggered)
    instance_destroy()
}

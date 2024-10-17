function scr_parrallax(argument0) //scr_parrallax
{
    if (argument0 == undefined)
        argument0 = false
    var _cam_x = camera_get_view_x(view_camera[0])
    var _cam_y = camera_get_view_y(view_camera[0])
    if argument0
        secretspeed++
    layer_x("Backgrounds_1", (_cam_x * 0.25))
    layer_y("Backgrounds_1", (_cam_y * 0.25))
    layer_x("Backgrounds_2", (_cam_x * 0.15))
    layer_y("Backgrounds_2", (_cam_y * 0.15))
    layer_x("Backgrounds_3", (_cam_x * 0.05))
    layer_y("Backgrounds_3", (_cam_y * 0.05))
    layer_x("Backgrounds_still", _cam_x)
    layer_y("Backgrounds_still", _cam_y)
    layer_x("Backgrounds_Ground1", (_cam_x * 0.25))
    layer_x("Backgrounds_Ground2", (_cam_x * 0.25))
    layer_x("Parallax_1", (_cam_x * 0.65))
    layer_y("Parallax_1", _cam_y)
    layer_x("Parallax_2", (_cam_x * 0.25))
    layer_y("Parallax_2", _cam_y)
    layer_x("Backgrounds_sky", (_cam_x * 0.85))
    layer_y("Backgrounds_sky", (_cam_y * 0.85))
    layer_x("Backgrounds_sky5", (_cam_x * 0.85))
    layer_x("Backgrounds_secret", secretspeed)
    layer_y("Backgrounds_secret", secretspeed)
    layer_x("backgrounds_medievalclouds", (_cam_x + secretspeed))
    layer_y("backgrounds_medievalclouds", _cam_y)
    layer_x("BBackgrounds_1", (_cam_x * 0.25))
    layer_y("BBackgrounds_1", (_cam_y * 0.25))
    layer_x("Still_BG1", (_cam_x * 0.25))
    layer_y("Still_BG1", _cam_y)
    layer_x("normalT_statue", (_cam_x * 0.5))
    layer_y("normalT_statue", (_cam_y * 0.85))
    layer_x("normalT_parrallax2_3", (_cam_x * 0.6))
    layer_y("normalT_parrallax2_3", _cam_y)
    layer_x("normalT_parrallax2", (_cam_x * 0.7))
    layer_y("normalT_parrallax2", _cam_y)
    layer_x("normalT_parrallax2_2", (_cam_x * 0.8))
    layer_y("normalT_parrallax2_2", _cam_y)
    layer_x("normalT_parrallax1", _cam_x)
    layer_y("normalT_parrallax1", _cam_y)
    if layer_exists("Backgrounds_horizontalonly")
    {
        layer_x("Backgrounds_horizontalonly", (_cam_x * 0.25))
        layer_y("Backgrounds_horizontalonly", (_cam_y - (clamp((_cam_y * (0.15 * (540 / room_height))), 0, (sprite_get_height(layer_background_get_sprite(layer_background_get_id(layer_get_id("Backgrounds_horizontalonly")))) - 540)))))
    }
    layer_x("Backgrounds_far", (_cam_x * 0.98))
    layer_y("Backgrounds_far", _cam_y)
    layer_x("Backgrounds_far2", (_cam_x * 0.98))
    layer_y("Backgrounds_far2", (_cam_y * 0.98))
    layer_x("Backgrounds_far2_novertical", (_cam_x * 0.98))
    layer_x("Backgrounds_far3", (_cam_x * 0.75))
    layer_x("Backgrounds_far4", (_cam_x * 0.8))
    layer_y("Backgrounds_far4", _cam_y)
    layer_x("Backgrounds_far5", (_cam_x * 0.98))
    layer_y("Backgrounds_far5", (_cam_y * 0.8))
    layer_x("Moon", (_cam_x * 0.97))
    layer_y("Moon", _cam_y)
    if layer_exists("Backgrounds_farclamp1")
    {
        var _layer = "Backgrounds_farclamp1"
        layer_x(_layer, (_cam_x - (clamp((_cam_x * (0.95 * (960 / room_width))), 0, (sprite_get_height(layer_background_get_sprite(layer_background_get_id(layer_get_id(_layer)))) - 960)))))
        layer_y(_layer, (_cam_y - (clamp((_cam_y * (0.95 * (540 / room_height))), 0, (sprite_get_height(layer_background_get_sprite(layer_background_get_id(layer_get_id(_layer)))) - 540)))))
    }
    if layer_exists("Backgrounds_farclamp2")
    {
        _layer = "Backgrounds_farclamp2"
        layer_x(_layer, (_cam_x - (clamp((_cam_x * (0.85 * (960 / room_width))), 0, (sprite_get_height(layer_background_get_sprite(layer_background_get_id(layer_get_id(_layer)))) - 960)))))
        layer_y(_layer, (_cam_y - (clamp((_cam_y * (0.85 * (540 / room_height))), 0, (sprite_get_height(layer_background_get_sprite(layer_background_get_id(layer_get_id(_layer)))) - 540)))))
    }
    layer_x("plains_sky", (_cam_x * 0.7))
    layer_y("plains_sky", _cam_y)
    layer_x("plains_middleground", (_cam_x * 0.35))
    layer_y("plains_middleground", _cam_y)
    if layer_exists("plains_foreground")
    {
        layer_x("plains_foreground", (_cam_x * 0.15))
        layer_y("plains_foreground", _cam_y)
    }
    layer_x("dragonlair_backgrounds2", (_cam_x * 0.98))
    layer_y("dragonlair_backgrounds2", _cam_y)
    layer_x("dragonlair_backgroundrain", _cam_x)
    layer_y("dragonlair_backgroundrain", _cam_y)
    if layer_exists("Backgrounds_foreground")
    {
        layer_x("Backgrounds_foreground", (_cam_x * 0.25))
        layer_y("Backgrounds_foreground", (room_height - sprite_get_height(layer_background_get_sprite(layer_background_get_id(layer_get_id("Backgrounds_foreground"))))))
    }
}


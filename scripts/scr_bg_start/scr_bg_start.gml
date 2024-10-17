function scr_bg_start() //scr_bg_start
{
    if (!surface_exists(global.bg_surface))
        global.bg_surface = surface_create((camera_get_view_width(view_camera[1]) + 200), (camera_get_view_height(view_camera[1]) + 200))
    if (event_type == 8 && event_number == 0)
    {
        surface_set_target(global.bg_surface)
        draw_clear_alpha(c_black, 0)
        var _cam_x = camera_get_view_x(view_camera[1])
        var _cam_y = camera_get_view_y(view_camera[1])
        var bg1 = layer_get_id("Backgrounds_1")
        var bg2 = layer_get_id("Backgrounds_2")
        var bg3 = layer_get_id("Backgrounds_3")
        layer_x(bg1, (layer_get_x(bg1) - _cam_x + 100))
        layer_y(bg1, (layer_get_y(bg1) - _cam_y + 100))
        layer_x(bg2, (layer_get_x(bg2) - _cam_x + 100))
        layer_y(bg2, (layer_get_y(bg2) - _cam_y + 100))
        layer_x(bg3, (layer_get_x(bg3) - _cam_x + 100))
        layer_y(bg3, (layer_get_y(bg3) - _cam_y + 100))
    }
}


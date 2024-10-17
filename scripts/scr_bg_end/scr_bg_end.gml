function scr_bg_end() //scr_bg_end
{
    if (event_type == 8 && event_number == 0)
    {
        surface_reset_target()
        if (global.panic == 1 && global.panicbg)
        {
            shader_set(shd_panicbg)
            var panic_id = shader_get_uniform(shd_panicbg, "panic")
            shader_set_uniform_f(panic_id, (global.wave / global.maxwave))
            var time_id = shader_get_uniform(shd_panicbg, "time")
            shader_set_uniform_f(time_id, (current_time / 1000))
        }
        gpu_set_blendenable(false)
        draw_surface(global.bg_surface, (camera_get_view_x(view_camera[1]) - 100), (camera_get_view_y(view_camera[1]) - 100))
        gpu_set_blendenable(true)
        shader_reset()
    }
}


gpu_set_blendenable(false)
with (obj_pause)
{
    if pause
    {
        if other.copyapp
        {
            scr_pause_deactivate_objects()
            fmod_studio_event_instance_start(pausemusicID)
            fmod_studio_event_instance_set_paused(pausemusicID, false)
            view_visible[1] = false
            buffer_get_surface(surfbuffer, surf, 0)
            other.copyapp = false
        }
        if surface_exists(surf)
        {
            var _ratio = global.currentres[0] / global.currentinternalres[0]
            var _offx = camera_get_view_x(view_camera[1]) - camera_get_view_x(view_camera[0])
            var _offy = camera_get_view_y(view_camera[1]) - camera_get_view_y(view_camera[0])
            surface_set_target(application_surface)
            draw_surface_ext(surf, (_offx * _ratio), (_offy * _ratio), _ratio, _ratio, 0, c_white, 1)
            surface_reset_target()
        }
        else
        {
            surf = surface_create(global.maxscreenwidth, global.maxscreenheight)
            buffer_set_surface(surfbuffer, surf, 0)
        }
    }
}
if (!surface_exists(finalsurf))
    finalsurf = surface_create(global.currentres[0], global.currentres[1])
if (surface_get_width(finalsurf) != global.currentres[0] || surface_get_height(finalsurf) != global.currentres[1])
    surface_resize(finalsurf, global.currentres[0], global.currentres[1])
surface_set_target(finalsurf)
draw_sprite_stretched_ext(spr_1x1, 0, 0, 0, global.currentres[0], global.currentres[1], c_black, 1)
if (instance_exists(obj_wavyRoom) && global.screeneffect)
{
    shader_set(shd_wind_noalpha)
    var wave_id = shader_get_uniform(shd_wind, "Time")
    shader_set_uniform_f(wave_id, (current_time / 2000))
}
else
    shader_set(shd_noalpha)
draw_surface_stretched(application_surface, 0, 0, global.currentres[0], global.currentres[1])
shader_reset()
surface_reset_target()
gpu_set_blendenable(true)

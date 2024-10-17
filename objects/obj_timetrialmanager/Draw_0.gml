if (!global.timetrial)
    return;
if ((!scr_hudroomcheck()) && global.levelname != -4 && global.levelname != "tutorial" && room != timesuproom && room != rank_room && (!instance_exists(obj_endlevelfade)))
{
    var _buff = ds_map_find_value(global.timetrialreplays, global.levelname)
    if (_buff != -1)
    {
        if (buffer_tell(_buff[1]) < buffer_get_size(_buff[1]))
        {
            if (asset_get_index(framestruct.room) == room && framestruct.visible)
            {
                if (!surface_exists(ghostsurf))
                    ghostsurf = surface_create(200, 200)
                surface_set_target(ghostsurf)
                draw_clear_alpha(c_black, 0)
                var _spr = asset_get_index(framestruct.sprite_index)
                clone_set(_spr, framestruct.image_index)
                if framestruct.flash
                    shader_set(shd_hit)
                draw_sprite_ext(_spr, framestruct.image_index, 100, 100, 1, 1, 0, framestruct.image_blend, 1)
                shader_reset()
                if obj_drawcontroller.dark
                    draw_sprite_ext(_spr, framestruct.image_index, 100, 100, 1, 1, 0, c_black, framestruct.darkalpha)
                shader_reset()
                surface_reset_target()
                var _x = roundlower(framestruct.x + framestruct.hitstunshakeX)
                var _y = roundlower(framestruct.y + framestruct.hitstunshakeY)
                ghostx = _x
                ghosty = _y
                ghostvisible = true
                var _xscale = framestruct.xscale * framestruct.scale_xs * framestruct.gravityflip
                var _yscale = framestruct.yscale * framestruct.scale_ys * framestruct.gravityflip
                var _angle = framestruct.angle
                if (framestruct.state == (109 << 0))
                    _angle = framestruct.fireworkangle - 90
                var _xoff = -100 * _xscale
                var _yoff = -100 * _yscale
                shader_set(shd_whiteoutline)
                var _tex = surface_get_texture(ghostsurf)
                shader_set_uniform_f(outlinetexel, texture_get_texel_width(_tex), texture_get_texel_height(_tex))
                shader_set_uniform_f(outlinealpha, global.ghostoutlinealpha)
                draw_surface_ext(ghostsurf, (_x + _xoff), (_y + _yoff), _xscale, _yscale, _angle, c_white, (framestruct.image_alpha * global.ghostalpha))
                shader_reset()
                draw_surface_ext(ghostsurf, (_x + _xoff), (_y + _yoff), _xscale, _yscale, _angle, framestruct.image_blend, (framestruct.image_alpha * global.ghostalpha))
            }
            else
                ghostvisible = false
        }
        else if (dopoof && (global.ghostalpha > 0 || global.ghostoutlinealpha > 0) && ghostvisible)
        {
            instance_create_depth(ghostx, ghosty, depth, obj_genericpoofeffect)
            dopoof = false
        }
    }
}

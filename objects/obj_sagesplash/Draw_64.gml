var _playbackdata = video_draw()
var _width = get_game_width()
var _height = _width / 16 * 9
gpu_set_texfilter(true)
if (_playbackdata[0] == 0)
    draw_surface_stretched(_playbackdata[1], 0, ((get_game_height() - _height) / 2), _width, _height)
gpu_set_texfilter(false)
if (_playbackdata[0] != 0 || input_check_pressed("jump"))
{
    video_seek_to(video_get_duration() + 1)
    video_close()
    instance_create_depth(x, y, depth, obj_purefatintro)
    instance_destroy()
}

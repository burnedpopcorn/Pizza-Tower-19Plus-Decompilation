if (!global.timetrial)
    return;
if ((!scr_hudroomcheck()) && global.levelname != -4 && global.levelname != "tutorial" && room != timesuproom && room != rank_room && (!instance_exists(obj_endlevelfade)))
{
    var _buff = ds_map_find_value(global.timetrialreplays, global.levelname)
    if (_buff != -1)
    {
        if (buffer_tell(_buff[1]) < buffer_get_size(_buff[1]))
        {
            framestruct.visible = buffer_read(_buff[1], buffer_bool)
            framestruct.flash = buffer_read(_buff[1], buffer_bool)
            framestruct.fireworkangle = buffer_read(_buff[1], buffer_f64)
            framestruct.hitstunshakeX = buffer_read(_buff[1], buffer_f64)
            framestruct.hitstunshakeY = buffer_read(_buff[1], buffer_f64)
            framestruct.image_index = buffer_read(_buff[1], buffer_f64)
            framestruct.image_alpha = buffer_read(_buff[1], buffer_f64)
            framestruct.image_blend = buffer_read(_buff[1], buffer_f64)
            framestruct.gravityflip = buffer_read(_buff[1], buffer_f64)
            framestruct.darkalpha = buffer_read(_buff[1], buffer_f64)
            framestruct.scale_xs = buffer_read(_buff[1], buffer_f64)
            framestruct.scale_ys = buffer_read(_buff[1], buffer_f64)
            framestruct.xscale = buffer_read(_buff[1], buffer_f64)
            framestruct.yscale = buffer_read(_buff[1], buffer_f64)
            framestruct.angle = buffer_read(_buff[1], buffer_f64)
            framestruct.state = buffer_read(_buff[1], buffer_f64)
            framestruct.x = buffer_read(_buff[1], buffer_f64)
            framestruct.y = buffer_read(_buff[1], buffer_f64)
            framestruct.sprite_index = buffer_read(_buff[1], buffer_string)
            framestruct.room = buffer_read(_buff[1], buffer_string)
            if (buffer_tell(_buff[1]) == buffer_get_size(_buff[1]))
                dopoof = true
        }
    }
    buffer_write(global.timetrialrecording, buffer_bool, bool(obj_player.visible))
    buffer_write(global.timetrialrecording, buffer_bool, bool(obj_player.flash))
    buffer_write(global.timetrialrecording, buffer_f64, obj_player.fireworkangle)
    buffer_write(global.timetrialrecording, buffer_f64, obj_player.hitstunshakeX)
    buffer_write(global.timetrialrecording, buffer_f64, obj_player.hitstunshakeY)
    buffer_write(global.timetrialrecording, buffer_f64, obj_player.image_index)
    buffer_write(global.timetrialrecording, buffer_f64, obj_player.image_alpha)
    buffer_write(global.timetrialrecording, buffer_f64, obj_player.image_blend)
    buffer_write(global.timetrialrecording, buffer_f64, obj_player.gravityflip)
    buffer_write(global.timetrialrecording, buffer_f64, obj_player.darkalpha)
    buffer_write(global.timetrialrecording, buffer_f64, obj_player.scale_xs)
    buffer_write(global.timetrialrecording, buffer_f64, obj_player.scale_ys)
    buffer_write(global.timetrialrecording, buffer_f64, obj_player.xscale)
    buffer_write(global.timetrialrecording, buffer_f64, obj_player.yscale)
    buffer_write(global.timetrialrecording, buffer_f64, obj_player.angle)
    buffer_write(global.timetrialrecording, buffer_f64, obj_player.state)
    buffer_write(global.timetrialrecording, buffer_f64, obj_player.x)
    buffer_write(global.timetrialrecording, buffer_f64, obj_player.y)
    buffer_write(global.timetrialrecording, buffer_string, sprite_get_name(obj_player.sprite_index))
    buffer_write(global.timetrialrecording, buffer_string, room_get_name(room))
    global.timetrialtick++
}
else
{
    framestruct = {}
}

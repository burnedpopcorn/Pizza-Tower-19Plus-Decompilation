var camx = camera_get_view_x(view_camera[1])
var camy = camera_get_view_y(view_camera[1])
var camw = camera_get_view_width(view_camera[1])
var camh = camera_get_view_height(view_camera[1])
visible = move
event_set_3d_position(snd, x, y)
if (!move)
{
    if (!(bbox_in_camera(1, obj_cheesedragon)))
    {
        x = clamp(obj_cheesedragon.x, (camx - 55), (camx + camw + 55))
        y = clamp(obj_cheesedragon.y, (camy - 55), (camy + camh + 55))
    }
    else
    {
        instance_destroy(id, false)
        return;
    }
    dir = point_direction(x, y, obj_player.x, obj_player.y)
}
else
{
    if (heatseektimer > 0)
    {
        dir = point_direction(x, y, obj_player.x, obj_player.y)
        heatseektimer--
    }
    x += lengthdir_x(spd, dir)
    y += lengthdir_y(spd, dir)
    var _hborder = (sign(lengthdir_x(spd, dir)) == -1 ? camx : (camx + camw))
    var _vborder = (sign(lengthdir_y(spd, dir)) == -1 ? camy : (camy + camh))
    var _checkspotx = (sign(lengthdir_x(spd, dir)) == -1 ? (x + sprite_xoffset) : (x - sprite_xoffset))
    var _checkspoty = (sign(lengthdir_y(spd, dir)) == -1 ? (y + sprite_yoffset) : (y - sprite_yoffset))
    var _checkx = (sign(lengthdir_x(spd, dir)) == -1 ? _checkspotx < _hborder : _checkspotx > _hborder)
    var _checky = (sign(lengthdir_y(spd, dir)) == -1 ? _checkspoty < _vborder : _checkspoty > _vborder)
    if (_checkx || _checky)
        instance_destroy(id, false)
}

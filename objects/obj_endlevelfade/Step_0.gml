obj_drawcontroller.alpha = max(0, (obj_drawcontroller.alpha - 0.1))
if (fadealpha > 1)
{
    fadein = 1
    var _camw = camera_get_view_width(view_camera[0])
    var _camh = camera_get_view_height(view_camera[0])
    var _centrex = camera_get_view_x(view_camera[0]) + _camw / 2
    var _centrey = camera_get_view_y(view_camera[0]) + _camh / 2
    var _roominfo = room_get_info(rank_room, false, false, false, false, false)
    var _rw = _roominfo.width
    var _rh = _roominfo.height
    with (obj_player)
    {
        x = x - _centrex + _rw / 2
        y = y - _centrey + _rh / 2
    }
    with (obj_pizzaface)
    {
        x = x - _centrex + _rw / 2
        y = y - _centrey + _rh / 2
    }
    if (room != rank_room)
    {
        room_goto(rank_room)
        save_dump(global.levelname)
    }
    instance_destroy()
}
if (fadein == 0)
    fadealpha += 0.1
else if (fadein == 1)
    fadealpha -= 0.1

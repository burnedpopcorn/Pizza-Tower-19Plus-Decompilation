with (obj_player)
{
    var _prevx = x
    var _prevy = y
    x = lerp(x, (room_width / 2), 0.1)
    y = lerp(y, (room_height / 2), 0.1)
    var _xdiff = x - _prevx
    var _ydiff = y - _prevy
}
with (obj_pizzaface)
{
    x += _xdiff
    y += _ydiff
}
if (floor(image_index) == (image_number - 1))
    image_speed = 0
if global.timetrial
{
    switch global.timetrialrank
    {
        case (3 << 0):
            sprite_index = spr_TTrankPURPLE
            break
        case (2 << 0):
            sprite_index = spr_TTrankGOLD
            break
        case (1 << 0):
            sprite_index = spr_TTrankSILVER
            break
        case (0 << 0):
            sprite_index = spr_TTrankBRONZE
            break
    }

}
else
{
    switch global.rank
    {
        case (5 << 0):
            sprite_index = obj_player.spr_prank
            break
        case (4 << 0):
            sprite_index = obj_player.spr_srank
            break
        case (3 << 0):
            sprite_index = obj_player.spr_arank
            break
        case (2 << 0):
            sprite_index = obj_player.spr_brank
            break
        case (1 << 0):
            sprite_index = obj_player.spr_crank
            break
        case (0 << 0):
            sprite_index = obj_player.spr_drank
            break
    }

}

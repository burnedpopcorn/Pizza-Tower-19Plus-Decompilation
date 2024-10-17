if instance_exists(obj_player)
{
    x = obj_player.x
    y = obj_player.y - 150
    if (obj_player.state == (95 << 0))
    {
        ramptricks = obj_player.ramptricks
        maxramptricks = ramptricks
    }
}
if ((!instance_exists(obj_player)) || obj_player.state != (95 << 0))
{
    instance_destroy()
    event_play_oneshot("event:/sfx/player/ramptrickdone")
}
for (var i = 0; i < (ramptricks * collectmul); i++)
{
    collectrand[i][2] += 0.35
    collectrand[i][2] %= sprite_get_number(collectrand[i][1])
    collectrand[i][0] += collectrand[i][3]
    collectrand[i][0] %= 360
    var _x = x + (lengthdir_x(collectlen, collectrand[i][0]))
    var _y = y + (lengthdir_y(collectlen, collectrand[i][0]))
    draw_sprite_ext(collectrand[i][1], collectrand[i][2], (_x - 16), (_y - 16), 1, 1, 0, c_white, 0.5)
}
draw_set_font(global.font)
draw_set_valign(fa_middle)
draw_set_halign(fa_center)
if (!goaway)
    __draw_text_hook(x, y, string(25 * maxramptricks))

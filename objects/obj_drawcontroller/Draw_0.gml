var _bound = 128
draw_sprite_stretched_ext(spr_1x1, 0, (-_bound), (-_bound), (room_width + _bound), _bound, c_black, 1)
draw_sprite_stretched_ext(spr_1x1, 0, (-_bound), room_height, (room_width + _bound), _bound, c_black, 1)
draw_sprite_stretched_ext(spr_1x1, 0, (-_bound), 0, _bound, room_height, c_black, 1)
draw_sprite_stretched_ext(spr_1x1, 0, room_width, 0, _bound, room_height, c_black, 1)
if (obj_pause.pause && (!copyapp))
    return;
for (var i = 0; i < array_length(ghostcollectibles); i++)
{
    ghostcollectibles[i].image_index += ghostcollectibles[i].image_speed
    ghostcollectibles[i].image_index %= ghostcollectibles[i].image_number
    draw_sprite_ext(ghostcollectibles[i].sprite_index, ghostcollectibles[i].image_index, ghostcollectibles[i].x, ghostcollectibles[i].y, 1, 1, 0, c_white, 0.35)
}
draw_set_font(global.smallnumber)
draw_set_halign(fa_center)
with (obj_smallnumber)
    __draw_text_colour_hook(x, y, number, 16777215, 16777215, 16777215, 16777215, 1)
if instance_exists(obj_player)
{
    pummelalpha = Approach(pummelalpha, (obj_player.pummelpunch * 0.5), 0.1)
    draw_sprite_stretched_ext(spr_1x1, 0, 0, 0, room_width, room_height, c_black, pummelalpha)
}

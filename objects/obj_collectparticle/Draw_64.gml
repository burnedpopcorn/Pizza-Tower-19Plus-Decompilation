shader_set(shd_premultiply)
var drawpoint = point_direction(collectx, collecty, targetx, targety)
collectx += lengthdir_x(spd, drawpoint)
collecty += lengthdir_y(spd, drawpoint)
draw_set_font(global.font)
draw_set_halign(fa_center)
if (!numbermode)
    draw_sprite_ext(sprite_index, -1, collectx, collecty, 1, 1, 0, c_white, image_alpha)
else
    __draw_text_colour_hook(collectx, collecty, string(number), 16777215, 16777215, 16777215, 16777215, 1)
if point_in_circle(collectx, collecty, targetx, targety, spd)
{
    collectx = targetx
    collecty = targety
    instance_destroy()
    with (obj_drawcontroller)
    {
        if ((!scorehudvisible) && global.levelname == "tutorial")
        {
            scorehudvisible = true
            instance_create_depth(other.targetx, other.targety, (depth - 2), obj_hudpoof)
        }
        if (other.shake > shaking)
            shaking += other.shake
    }
}

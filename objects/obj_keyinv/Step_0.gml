if (!global.key_inv)
{
    instance_create_depth(x, y, -100, obj_genericpoofeffect)
    instance_destroy()
}
if (draw_y != 5 && (!bob))
    draw_y = Approach(draw_y, 5, 0.2)
if (draw_y == 5 && (!bob))
    bob = 1
if (draw_y != -5 && bob)
    draw_y = Approach(draw_y, -5, 0.2)
if (draw_y == -5 && bob)
    bob = 0

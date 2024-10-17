if (scr_solid((x + (sign(lengthdir_x(spd, dir)))), (y + (sign(lengthdir_y(spd, dir))))) && (!(place_meeting((x + (sign(lengthdir_x(spd, dir)))), (y + (sign(lengthdir_y(spd, dir)))), obj_destructibles))))
    instance_destroy()
with (instance_place((x + (sign(lengthdir_x(spd, dir)))), (y + (sign(lengthdir_y(spd, dir)))), obj_destructibles))
{
    if (object_index == obj_onewaybigblock)
    {
        if (other.image_xscale != image_xscale)
            instance_destroy()
    }
    else if (object_index != obj_onewaybigblock)
        instance_destroy()
}
if (sprite_index == spr_peppinobullet_land && floor(image_index) == (image_number - 1))
    instance_destroy()
if (sprite_index == spr_peppinobullet)
{
    x += lengthdir_x(spd, dir)
    y += lengthdir_y(spd, dir)
}
var _wrappedangle = (wrap(dir, 90, 270)) + 180
var _xscale = 1
if (dir > 89 && dir <= 271)
    _xscale = -1
image_angle = _wrappedangle
image_xscale = _xscale

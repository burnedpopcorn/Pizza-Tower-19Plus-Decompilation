event_inherited()
hp = 2
depth = 1
image_speed = 0.35
solidid = noone
if (image_xscale > 0)
    solidid = instance_create_depth(x, y, 0, obj_solid)
if (image_xscale < 0)
    solidid = instance_create_depth((x - 32), y, 0, obj_solid)
solidid.image_yscale = 2

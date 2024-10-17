x += hsp
y += vsp
if (vsp < 20)
    vsp += grav
image_angle += 16
image_angle %= 360
if scr_solid(x, (y + 1))
    instance_destroy()

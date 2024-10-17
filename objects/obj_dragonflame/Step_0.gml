if (vsp < 12)
    vsp += 0.5
x += hsp
y += vsp
image_angle = point_direction(0, 0, hsp, vsp)
if (!(scr_solid(x, y)))
    inwall = false
if (scr_solid(x, (y + 1)) && vsp >= 0 && (!inwall))
    instance_destroy()

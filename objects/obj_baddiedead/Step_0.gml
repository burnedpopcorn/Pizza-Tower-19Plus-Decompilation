if (vsp < 20)
    vsp += grav
x += hsp
y += vsp
if (!(bbox_in_camera(1, id)))
    instance_destroy()

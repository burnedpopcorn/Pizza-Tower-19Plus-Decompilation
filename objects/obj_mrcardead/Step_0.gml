if (!event_isplaying(spinsound))
    fmod_studio_event_instance_start(spinsound)
event_set_3d_position(spinsound, x, y, 0)
x += hsp
vsp += 0.5
y += vsp
if scr_solid(x, y)
    instance_destroy()
angle = wrap((angle + 25 * image_xscale), 0, 359)

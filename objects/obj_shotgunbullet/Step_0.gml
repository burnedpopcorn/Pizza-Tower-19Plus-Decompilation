if (scr_solid((x + spd), y) && (!(place_meeting((x + spd), y, obj_destructibles))) && (!(place_meeting((x + spd), y, obj_targetblock))))
    instance_destroy()
with (instance_place((x + spd), y, obj_destructibles))
    instance_destroy()
with (instance_place((x + spd), y, obj_targetblock))
    instance_destroy()
x += spd
y += (-spdh)

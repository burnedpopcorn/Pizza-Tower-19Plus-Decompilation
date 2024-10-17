depth = -999
w = camera_get_view_width(view_camera[1])
h = camera_get_view_height(view_camera[1])
if radiusgrow
    radius += 10
if (!surface_exists(surf))
    surf = surface_create(w, h)
if (surface_get_width(surf) != w || surface_get_height(surf) != h)
    surface_resize(surf, w, h)

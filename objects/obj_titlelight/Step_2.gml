depth = -999
w = camera_get_view_width(view_camera[1])
h = camera_get_view_height(view_camera[1])
switch cirlceradiusphase
{
    case 0:
        circleradius = 0
        break
    case 1:
        circleradius = lerp(circleradius, 100, 0.2)
        break
    case 2:
        circleradius = lerp(circleradius, 2000, 0.1)
        break
}

if (!surface_exists(surf))
    surf = surface_create(w, h)
if (surface_get_width(surf) != w || surface_get_height(surf) != h)
    surface_resize(surf, w, h)

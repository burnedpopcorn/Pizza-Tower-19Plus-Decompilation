windowwidth = window_get_width()
windowheight = window_get_height()
switch global.scalemode
{
    case (0 << 0):
        appscalex = min((windowwidth / global.currentres[0]), (windowheight / global.currentres[1]))
        appscaley = min((windowwidth / global.currentres[0]), (windowheight / global.currentres[1]))
        break
    case (1 << 0):
        appscalex = windowwidth / global.currentres[0]
        appscaley = windowheight / global.currentres[1]
        break
    case (2 << 0):
        appscalex = floor(min((windowwidth / global.currentres[0]), (windowheight / global.currentres[1])))
        appscaley = floor(min((windowwidth / global.currentres[0]), (windowheight / global.currentres[1])))
        break
    case (3 << 0):
        appscalex = 1
        appscaley = 1
        break
}

if (global.scalemode != (1 << 0) && global.scalemode != (3 << 0))
{
    if (global.currentres[0] > windowwidth || global.currentres[1] > windowheight)
    {
        appscalex = min((windowwidth / global.currentres[0]), (windowheight / global.currentres[1]))
        appscaley = min((windowwidth / global.currentres[0]), (windowheight / global.currentres[1]))
    }
}
if copyapp
{
    with (obj_pause)
    {
        if (!surface_exists(surf))
            surf = surface_create(global.maxscreenwidth, global.maxscreenheight)
        surface_set_target(surf)
        draw_sprite_stretched_ext(spr_1x1, 0, 0, 0, global.maxscreenwidth, global.maxscreenheight, c_black, 1)
        surface_reset_target()
        view_visible[1] = true
        view_surface_id[1] = surf
    }
}

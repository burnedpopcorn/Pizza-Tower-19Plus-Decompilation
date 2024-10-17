gameframe_update()
goawaytimer = Approach(goawaytimer, 0, 1)
if ((device_mouse_x_to_gui(0) != mouse_xprev || device_mouse_y_to_gui(0) != mouse_yprev) && gameframe_mouse_in_window())
    goawaytimer = 100
if (goawaytimer == 0)
    global.gameframe_alpha = Approach(global.gameframe_alpha, 0, 0.1)
else
    global.gameframe_alpha = Approach(global.gameframe_alpha, 1, 0.1)
mouse_xprev = device_mouse_x_to_gui(0)
mouse_yprev = device_mouse_y_to_gui(0)
depth = -15000

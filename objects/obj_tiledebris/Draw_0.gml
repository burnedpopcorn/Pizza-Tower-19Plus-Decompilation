if (tileset == -1 || data == -1)
    return;
if obj_drawcontroller.dark
    shader_set(shd_darktile)
draw_tile(tileset, data, 0, x, y)
shader_reset()

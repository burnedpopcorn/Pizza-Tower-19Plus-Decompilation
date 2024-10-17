function pal_swap_reset() //pal_swap_reset
{
    if (surface_get_target() == obj_drawcontroller.guisurf)
        shader_set(shd_premultiply)
    else
        shader_reset()
}


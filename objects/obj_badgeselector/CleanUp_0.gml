if variable_instance_exists(id, "surf")
{
    if surface_exists(surf)
        surface_free(surf)
}
if variable_instance_exists(id, "mu")
    destroy_sounds([mu])

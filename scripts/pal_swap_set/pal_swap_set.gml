function pal_swap_set(argument0, argument1, argument2) //pal_swap_set
{
    static PalN_Texel_Size = shader_get_uniform(shd_pal_swapper, "texel_size")
    static PalN_UVs = shader_get_uniform(shd_pal_swapper, "palette_UVs")
    static PalN_Index = shader_get_uniform(shd_pal_swapper, "palette_index")
    static PalN_Texture = shader_get_sampler_index(shd_pal_swapper, "palette_texture")
    static PalPM_Texel_Size = shader_get_uniform(shd_pal_premultiply, "texel_size")
    static PalPM_UVs = shader_get_uniform(shd_pal_premultiply, "palette_UVs")
    static PalPM_Index = shader_get_uniform(shd_pal_premultiply, "palette_index")
    static PalPM_Texture = shader_get_sampler_index(shd_pal_premultiply, "palette_texture")

    var Pal_Shader = (surface_get_target() == obj_drawcontroller.guisurf ? shd_pal_premultiply : shd_pal_swapper)
    var texel = (Pal_Shader == shd_pal_swapper ? PalN_Texel_Size : PalPM_Texel_Size)
    var uv = (Pal_Shader == shd_pal_swapper ? PalN_UVs : PalPM_UVs)
    var i = (Pal_Shader == shd_pal_swapper ? PalN_Index : PalPM_Index)
    var texture = (Pal_Shader == shd_pal_swapper ? PalN_Texture : PalPM_Texture)
    shader_set(Pal_Shader)
    var _pal_sprite = argument0
    var _pal_index = argument1
    if (!argument2)
    {
        var tex = sprite_get_texture(_pal_sprite, 0)
        var UVs = sprite_get_uvs(_pal_sprite, 0)
        texture_set_stage(texture, tex)
        gpu_set_texfilter_ext(texture, 1)
        var texel_x = texture_get_texel_width(tex)
        var texel_y = texture_get_texel_height(tex)
        var texel_hx = texel_x * 0.5
        var texel_hy = texel_y * 0.5
        shader_set_uniform_f(texel, texel_x, texel_y)
        shader_set_uniform_f(uv, (UVs[0] + texel_hx), (UVs[1] + texel_hy), (UVs[2] + texel_hx), (UVs[3] + texel_hy))
        shader_set_uniform_f(i, _pal_index)
    }
    else
    {
        tex = surface_get_texture(_pal_sprite)
        texture_set_stage(texture, tex)
        gpu_set_texfilter_ext(texture, 1)
        texel_x = texture_get_texel_width(tex)
        texel_y = texture_get_texel_height(tex)
        texel_hx = texel_x * 0.5
        texel_hy = texel_y * 0.5
        shader_set_uniform_f(texel, texel_x, texel_y)
        shader_set_uniform_f(uv, texel_hx, texel_hy, (1 + texel_hx), (1 + texel_hy))
        shader_set_uniform_f(i, _pal_index)
    }
}


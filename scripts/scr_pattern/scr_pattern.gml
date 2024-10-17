function pattern_set(argument0, argument1, argument2, argument3) //pattern_set
{
    if (argument1 == undefined)
        argument1 = sprite_index
    if (argument2 == undefined)
        argument2 = image_index
    if (argument3 == undefined)
        argument3 = 4259839
    static u_mask = shader_get_uniform(shd_pattern, "u_Mask")
    static u_spr = shader_get_uniform(shd_pattern, "u_SprRect")
    static u_pat = shader_get_uniform(shd_pattern, "u_PatRect")
    static u_texel = shader_get_uniform(shd_pattern, "u_TexelScl")
    static u_offset = shader_get_uniform(shd_pattern, "u_SprOffset")

    var _s_pat = shader_get_sampler_index(shd_pattern, "s_Pattern")
    var _tex = sprite_get_texture(argument0, 0)
    var _tex2 = sprite_get_texture(argument1, argument2)
    shader_set(shd_pattern)
    texture_set_stage(_s_pat, _tex)
    shader_set_uniform_f(u_mask, (color_get_red(argument3) / 255), (color_get_green(argument3) / 255), (color_get_blue(argument3) / 255), 1)
    var _uvs = sprite_get_uvs(argument1, argument2)
    shader_set_uniform_f(u_spr, _uvs[0], _uvs[1], _uvs[2], _uvs[3])
    shader_set_uniform_f(u_offset, (_uvs[4] - sprite_get_xoffset(argument1)), (_uvs[5] - sprite_get_yoffset(argument1)))
    _uvs = sprite_get_uvs(argument0, 0)
    shader_set_uniform_f(u_pat, _uvs[0], _uvs[1], _uvs[2], _uvs[3])
    shader_set_uniform_f(u_texel, texture_get_texel_width(_tex), texture_get_texel_height(_tex), texture_get_texel_width(_tex2), texture_get_texel_height(_tex2))
}

function clone_set(argument0, argument1) //clone_set
{
    if (argument0 == undefined)
        argument0 = sprite_index
    if (argument1 == undefined)
        argument1 = image_index
    static u_spr = shader_get_uniform(shd_pizzaclone, "u_SprRect")
    static u_pat = shader_get_uniform(shd_pizzaclone, "u_PatRect")
    static u_texel = shader_get_uniform(shd_pizzaclone, "u_TexelScl")
    static u_offset = shader_get_uniform(shd_pizzaclone, "u_SprOffset")

    var _s_pat = shader_get_sampler_index(shd_pizzaclone, "s_Pattern")
    var _tex = sprite_get_texture(spr_pizzaclonepattern, 0)
    var _tex2 = sprite_get_texture(argument0, argument1)
    shader_set(shd_pizzaclone)
    texture_set_stage(_s_pat, _tex)
    var _uvs = sprite_get_uvs(argument0, argument1)
    shader_set_uniform_f(u_spr, _uvs[0], _uvs[1], _uvs[2], _uvs[3])
    shader_set_uniform_f(u_offset, (_uvs[4] - sprite_get_xoffset(argument0)), (_uvs[5] - sprite_get_yoffset(argument0)))
    _uvs = sprite_get_uvs(spr_pizzaclonepattern, 0)
    shader_set_uniform_f(u_pat, _uvs[0], _uvs[1], _uvs[2], _uvs[3])
    shader_set_uniform_f(u_texel, texture_get_texel_width(_tex), texture_get_texel_height(_tex), texture_get_texel_width(_tex2), texture_get_texel_height(_tex2))
}


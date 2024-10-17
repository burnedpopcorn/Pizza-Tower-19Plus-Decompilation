if (sprite_index == spr_brick1readytofall)
    sprite_index = spr_brick1falling
if (sprite_index == spr_brick2readytofall)
    sprite_index = spr_brick2falling
with (instance_create_depth(x, y, (depth + 1), obj_dragonbrickhand))
{
    wavex = wave(other.waveamount, (-other.waveamount), other.wavespd, 0)
    xoffset = other.xoffset
    yoffset = other.yoffset
}
image_speed = 0.35

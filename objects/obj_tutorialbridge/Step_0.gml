if (bridgepiecey < y)
{
    bridgepiecey += bridgepiecevsp
    bridgepiecevsp += 0.5
}
if (bridgepiecey >= y)
{
    bridgepiecey = y
    if (currentpiece < image_xscale)
    {
        scr_fmod_soundeffectONESHOT("event:/sfx/misc/bridgeland", (x + currentpiece * sprite_get_width(sprite_index) + sprite_get_width(sprite_index) / 2), y)
        currentpiece++
        bridgepiecey = -32
    }
}
if (place_meeting(x, (y - obj_player.vsp), obj_player) && obj_player.state == (51 << 0))
{
    var _pos = bbox_left
    repeat image_xscale
    {
        with (instance_create_depth(_pos, y, 0, obj_baddiedead))
            sprite_index = other.sprite_index
        with (instance_create_depth(_pos, y, 0, obj_baddiedead))
            sprite_index = spr_tutorialbridgerope
        _pos += sprite_get_width(sprite_index)
    }
    scr_fmod_soundeffectONESHOT("event:/sfx/misc/bridgebreak", obj_player.x, y)
    scr_fmod_soundeffectONESHOT("event:/sfx/misc/breakblock", obj_player.x, y)
    gamepadvibrate(0.2, 0, 8)
    instance_destroy()
}

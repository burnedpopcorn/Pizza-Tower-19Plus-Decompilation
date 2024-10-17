if (global.tutorialdone || other.trapactivated)
    return;
if (!other.grounded)
{
    other.trapactivated = true
    other.state = (123 << 0)
    var _dirt = instance_place(x, y, obj_tutorialdirt)
    repeat (12)
        instance_create_depth(irandom_range(_dirt.bbox_left, _dirt.bbox_right), _dirt.bbox_top, -1, obj_tutorialgrassblades)
    _dirt.grav = 0.5
    var _layer = layer_get_id("ground")
    var _background = layer_background_get_id(_layer)
    layer_background_sprite(_background, bg_tutorialgroundtraptriggered)
    scr_fmod_soundeffectONESHOT("event:/sfx/misc/tutorialtrap", obj_player.x, _dirt.y)
}

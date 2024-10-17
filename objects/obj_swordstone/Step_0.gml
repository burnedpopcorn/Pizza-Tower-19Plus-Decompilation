with (obj_player)
{
    var _checkstate = state
    if (state == (116 << 0))
        _checkstate = tauntstoredstate
    if (state == (87 << 0))
        _checkstate = hitstunstoredstate
    if (_checkstate == (18 << 0) || _checkstate == (115 << 0) || _checkstate == (13 << 0))
        other.sprite_index = spr_swordstonetaken
    else
        other.sprite_index = spr_swordstone
}

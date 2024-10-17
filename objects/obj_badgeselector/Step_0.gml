fade = clamp((fade + 0.05), 0, 1)
bubbleind = (bubbleind + 0.35) % sprite_get_number(spr_badgemenu_explanationbox)
headind = (headind + 0.35) % sprite_get_number(headspr)
if (headspr == spr_badgemenu_mrincognitotalk && floor(headind) == (sprite_get_number(headspr) - 1))
    headspr = spr_badgemenu_mrincognito
if instance_exists(obj_fadeout)
    return;
if (input_check_pressed("left") && selectedbadge > 0)
{
    currentchar = 0
    selectedbadge--
    event_play_oneshot("event:/sfx/misc/menumove")
}
if (input_check_pressed("right") && selectedbadge < (badgeslots - 1))
{
    currentchar = 0
    selectedbadge++
    event_play_oneshot("event:/sfx/misc/menumove")
}
if (input_check_pressed("up") && (selectedbadge - (floor(badgeslots / badgerows))) > -1)
{
    currentchar = 0
    selectedbadge = clamp((selectedbadge - (floor(badgeslots / badgerows))), 0, badgeslots)
    event_play_oneshot("event:/sfx/misc/menumove")
}
if (input_check_pressed("down") && (selectedbadge + (floor(badgeslots / badgerows))) < badgeslots)
{
    currentchar = 0
    selectedbadge = clamp((selectedbadge + (floor(badgeslots / badgerows))), 0, badgeslots)
    event_play_oneshot("event:/sfx/misc/menumove")
}
if input_check_pressed("jump")
{
    var _badge = array_get_undefined(badges, selectedbadge)
    var _unlocked = false
    if (!is_undefined(_badge))
    {
        save_open()
        _unlocked = (_badge[3] == -1 ? true : ini_read_real("UnlockedBadges", _badge[3], false))
        save_close()
    }
    if ((!is_undefined(_badge)) && _unlocked)
    {
        global.currentbadge = _badge[1]
        global.lastbadge = selectedbadge
        instance_create_depth(x, y, -9999, obj_fadeout)
        event_stop(mu, true)
        event_play_oneshot("event:/sfx/player/collect/bigpizza")
    }
    else
    {
        event_stop_description("event:/sfx/misc/badgemenulocked", true)
        event_play_oneshot("event:/sfx/misc/badgemenulocked")
    }
}

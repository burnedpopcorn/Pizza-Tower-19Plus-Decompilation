if closing
{
    fade = clamp((fade - 0.05), 0, 1)
    if (fade <= 0)
        instance_destroy()
}
else
    fade = clamp((fade + 0.05), 0, 1)
bubbleind = (bubbleind + 0.35) % sprite_get_number(spr_badgemenu_explanationbox)
headind = (headind + 0.35) % sprite_get_number(headspr)
if (headspr == spr_badgemenu_mrincognitotalk && floor(headind) == (sprite_get_number(headspr) - 1))
    headspr = spr_badgemenu_mrincognito
if ((!instance_exists(obj_fadeout)) && (!closing))
{
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
        save_open()
        if ((!is_undefined(_badge)) && (!(ini_read_real("UnlockedBadges", _badge[2], false))) && (get_coins() - _badge[3]) >= 0)
        {
            ini_write_real("UnlockedBadges", _badge[2], true)
            ini_write_real("GameProgress", "usedcoins", ((ini_read_real("GameProgress", "usedcoins", 0)) + _badge[3]))
            coinsspent += _badge[3]
            event_stop_description("event:/sfx/misc/badgebuy", true)
            event_play_oneshot("event:/sfx/misc/badgebuy")
        }
        else
        {
            event_stop_description("event:/sfx/misc/badgemenulocked", true)
            event_play_oneshot("event:/sfx/misc/badgemenulocked")
        }
        save_close()
    }
    if input_check_pressed("attack")
    {
        save_dump()
        closing = true
        event_stop(mu, true)
        fmod_studio_system_set_parameter_by_name("badgemenumute", false, false)
    }
}
with (subtracteffect)
{
    grav = 0
    vsp = 0
    yoff = -50
    number = (-other.coinsspent)
    image_alpha = 0
    alarm[0] = 50
}

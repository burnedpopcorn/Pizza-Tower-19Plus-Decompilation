badgeslots = 4
badgerows = 1
selectedbadge = global.lastbadge
badges = [[spr_badge_none, (0 << 0), string_get("menu/badge/none"), -1], [spr_badge_kungfu, (1 << 0), string_get("menu/badge/kungfu"), "kungfu"], [spr_badge_breakdance, (2 << 0), string_get("menu/badge/breakdance"), "breakdance"], [spr_badge_nohit, (3 << 0), string_get("menu/badge/nohit"), "nohit"]]
var _anyunlocked = false
var i = 0
while (i < array_length(badges))
{
    if (badges[i][3] == -1)
        i++
    else
    {
        save_open()
        var _unlocked = ini_read_real("UnlockedBadges", badges[i][3], false)
        save_close()
        if _unlocked
        {
            _anyunlocked = true
            break
        }
        else
            i++
    }
}
if (!_anyunlocked)
{
    instance_create_depth(x, y, -9999, obj_fadeout)
    instance_destroy()
    return;
}
fade = 0
surf = surface_create(960, 540)
mu = event_instance("event:/music/badgeselect")
fmod_studio_event_instance_start(mu)
currentchar = 0
headind = 0
headspr = spr_badgemenu_mrincognito
bubbleind = 0

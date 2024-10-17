badgeslots = 3
badgerows = 1
selectedbadge = global.lastbadge
badges = [[spr_badge_kungfu, string_get("menu/badge/kungfu"), "kungfu", 35], [spr_badge_breakdance, string_get("menu/badge/breakdance"), "breakdance", 40], [spr_badge_nohit, string_get("menu/badge/nohit"), "nohit", 50]]
fade = 0
closing = false
surf = surface_create(960, 540)
mu = event_instance("event:/music/badgeselect")
fmod_studio_event_instance_start(mu)
fmod_studio_system_set_parameter_by_name("badgemenumute", true, false)
currentchar = 0
headind = 0
headspr = spr_badgemenu_mrincognito
bubbleind = 0
subtracteffect = instance_create_depth(x, y, depth, obj_pizzacoinsubtract)
coinsspent = 0

np_update()
if (global.levelname != -4)
    details = scr_getlevelname(global.levelname)
var _state = string_concat("Score: ", global.collect, " / Rank: ", scr_getlevelpoints(), " / Combo: ", global.combo)
if global.timetrial
{
    var _seconds = string_padzeros(floor((global.timetrialtick / 60) % 60))
    var _minutes = string_padzeros(((global.timetrialtick div 60) div 60) % 60)
    _state = string_concat("Time: ", string_concat(_minutes, ":", _seconds), " / Medal: ", scr_getleveltime(), " / Combo: ", global.combo)
}
if (scr_hudroomcheck() || global.levelname == "tutorial")
    _state = ""
switch room
{
    case init:
    case logos:
        details = "Get ready for...."
        break
    case TitlescreenRoom:
        details = "PT ‘19 Plus SAGE Demo"
        break
    case Scootertransition:
    case intro:
        details = "What's this?"
        break
    case hub_forcedtutorial:
        details = "One step away from"
        _state = "the scrapers entrance."
        break
    case hub_snicksoft:
        details = "Welcome to... Snicksoft HQ!"
        break
    case rank_roomtutorial:
        details = "This is just the beginning..."
        break
    case rank_room:
        details = "And your final rank is.... "
        if (!global.timetrial)
        {
            switch global.rank
            {
                case (5 << 0):
                    _state = "a SPECTACULAR P!!!"
                    break
                case (4 << 0):
                    _state = "a PERFECT S!!"
                    break
                case (3 << 0):
                    _state = "a Nice A!"
                    break
                case (2 << 0):
                    _state = "a Subpar B."
                    break
                case (1 << 0):
                    _state = "a Decent C... Could've been better."
                    break
                case (0 << 0):
                    _state = "a TERRIBLE D. Shameful."
                    break
            }

        }
        else
        {
            switch global.timetrialrank
            {
                case (3 << 0):
                    _state = "a SPECTACULAR Purple medal!!!"
                    break
                case (2 << 0):
                    _state = "a PERFECT Gold medal!!"
                    break
                case (1 << 0):
                    _state = "a Nice Silver medal!"
                    break
                case (0 << 0):
                    _state = "a Subpar Bronze medal."
                    break
            }

        }
        break
    case timesuproom:
        details = "Oh well, that's... unfortunate."
        break
}

var _smallimage = ""
var _smalltext = ""
switch global.currentbadge
{
    case (1 << 0):
        _smallimage = "blackbelt"
        _smalltext = "Current Badge: Kung Fu"
        break
    case (2 << 0):
        _smallimage = "boombox"
        _smalltext = "Current Badge: Breakdance"
        break
    case (3 << 0):
        _smallimage = "puppet"
        _smalltext = "Current Badge: No Hit"
        break
}

np_setpresence(_state, details, "ptpicon", _smallimage)
np_setpresence_more(_smalltext, "Peppino!", true)

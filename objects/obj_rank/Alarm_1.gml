push_notif((19 << 0), [global.levelname])
scr_playerreset(0)
scr_leavelevel()
with (obj_player)
{
    state = (88 << 0)
    vsp = -8
    hsp = 0
    movespeed = 0
    sprite_index = spr_rockethitwall
    exitgatescale = 0
    image_blend = c_white
    doorblend = 1
    image_index = 0
    room_goto(backtohubroom)
    targetDoor = "HUB"
    if (backtohubroom == TitlescreenRoom)
    {
        character = "P"
        scr_characterspr()
        paletteselect = 1
        state = (6 << 0)
        sprite_index = spr_player_title
        targetDoor = "A"
    }
    else
    {
        x = backtohubstartx + gateoffsetx
        y = backtohubstarty + gateoffsety
    }
}

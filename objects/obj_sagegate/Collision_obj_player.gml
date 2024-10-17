if (unlockedanim >= 1 && unlocked)
{
    with (obj_player)
    {
        if (input_check_pressed("up") && grounded && (state == (0 << 0) || state == (47 << 0) || (state == (66 << 0) && (!rocket))) && (!instance_exists(obj_fadeout)) && state != (41 << 0) && state != (39 << 0))
        {
            enteredDoor = other.id
            mach2 = 0
            obj_drawcontroller.chargecamera = 0
            image_index = 0
            state = (41 << 0)
            if (global.music != noone)
                event_stop(global.music.event, 0)
            with (obj_drawcontroller)
            {
                image_index = 0
                sprite_index = spr_hud_start
                thintextfade = 1
                wavetext = 0
            }
        }
    }
    if (floor(other.image_index) == 19 && other.state == (41 << 0) && currspr != self.get_sprite("portal"))
    {
        event_play_oneshot("event:/sfx/misc/sagegateportal")
        currspr = self.get_sprite("portal")
    }
    if (floor(other.image_index) == (other.image_number - 1) && other.state == (41 << 0))
    {
        var _x = (-sprite_get_xoffset(currspr)) + gateox
        var _y = (-sprite_get_yoffset(currspr)) + gateoy
        with (obj_player)
        {
            visible = false
            if (!instance_exists(obj_sagegateplayer))
            {
                voice_scream()
                instance_create_depth((other.x + _x), (other.y + _y), depth, obj_sagegateplayer)
            }
        }
        if instance_exists(obj_sagegateplayer)
        {
            if (obj_sagegateplayer.scale <= 0)
            {
                if ((!instance_exists(obj_badgeselector)) && (!instance_exists(obj_fadeout)))
                {
                    other.targetDoor = targetDoor
                    other.targetRoom = targetRoom
                    other.backtohubstartx = x
                    other.backtohubstarty = other.y
                    other.gateoffsetx = _x
                    other.gateoffsety = _y + other.y - y
                    other.backtohubroom = room
                    global.levelname = level
                    gateind = sprite_get_number(currspr)
                    instance_create_depth(x, y, -8888, obj_badgeselector)
                }
            }
        }
    }
}

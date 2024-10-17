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
    if (floor(obj_player.image_index) == (obj_player.image_number - 1) && obj_player.state == (41 << 0))
    {
        with (obj_player)
        {
            targetDoor = other.targetDoor
            targetRoom = other.targetRoom
            backtohubstartx = x
            backtohubstarty = y
            backtohubroom = room
            global.levelname = other.level
            if ((!instance_exists(obj_badgeselector)) && (!instance_exists(obj_fadeout)))
                instance_create_depth(x, y, -8888, obj_badgeselector)
        }
    }
}

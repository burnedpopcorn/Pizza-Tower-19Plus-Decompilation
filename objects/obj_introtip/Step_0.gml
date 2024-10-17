if input_check_pressed("attack")
{
    if (!skipconfirm)
        skipconfirm = true
    else if (skipconfirm && (!skip) && (!instance_exists(obj_sonicfadeout)))
    {
        skip = true
        with (instance_create_depth(x, y, -9999, obj_sonicfadeout))
        {
            obj_player.targetRoom = hub_forcedtutorial
            obj_player.targetDoor = "B"
            if global.tutorialdone
                obj_player.targetDoor = "C"
            obj_player.xscale = 1
        }
        event_stop(global.music.event, true)
        event_stop(global.windloop, true)
        with (obj_titlecutscene)
        {
            event_stop(taxihonksnd, true)
            event_stop(taxidrivesnd, true)
        }
    }
}
if (input_check_pressed(["up", "down", "left", "right", "jump", "attack", "taunt", "shoot", "dash", "groundpound", "superjump", "pause"]) && (!skip) && ((!input_check_pressed("attack")) || skipconfirm))
{
    var _text = string_get((other.skipconfirm ? "tips/menu/intro/skiptipconfirm" : "tips/menu/intro/skiptip"))
    if (!instance_exists(tip))
        tip = scr_tiptext(_text)
    else
        tip.text = _text
}

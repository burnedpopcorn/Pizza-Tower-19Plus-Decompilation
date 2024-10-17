if instance_exists(obj_sonicfadeout)
    return;
with (instance_create_depth(x, y, -9999, obj_sonicfadeout))
{
    obj_player.targetRoom = hub_forcedtutorial
    obj_player.targetDoor = "B"
    obj_player.xscale = 1
}
with (obj_drawcontroller)
{
    thintextfade = 1
    wavetext = 0
}
event_stop(global.windloop, true)

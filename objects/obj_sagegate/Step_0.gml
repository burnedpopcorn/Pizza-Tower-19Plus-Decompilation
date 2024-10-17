if (unlockedanim >= 1 && unlocked)
{
    if (!instance_exists(uparrowid))
        uparrowid = create_uparrow()
}
else if instance_exists(uparrowid)
    instance_destroy(uparrowid)
targetDoor = "A"
if (place_meeting(x, y, obj_player) && (!instance_exists(obj_sagegateplayer)) && (!showtext) && unlockedanim >= 1 && unlocked)
{
    showtext = 1
    var text = string_get("levelnames/" + level)
    with (obj_drawcontroller)
    {
        thintextfade = 0
        wavetext = 1
        thintext = text
        self.tv_thintext()
    }
}
if (((!(place_meeting(x, y, obj_player))) || instance_exists(obj_sagegateplayer) || unlockedanim < 1) && showtext)
{
    showtext = 0
    with (obj_drawcontroller)
    {
        thintextfade = 1
        wavetext = 0
    }
}

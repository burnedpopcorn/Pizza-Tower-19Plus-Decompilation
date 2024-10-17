if (unlockedanim >= 1 && unlocked)
{
    if (!instance_exists(uparrowid))
        uparrowid = create_uparrow()
}
else if instance_exists(uparrowid)
    instance_destroy(uparrowid)
targetDoor = "A"
if place_meeting(x, y, obj_player)
    image_speed = 0.35
else
{
    image_speed = 0
    image_index = 0
}
if (distance_to_object(obj_player) < 50 && unlockedanim >= 1 && unlocked && (!showtext))
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
if ((distance_to_object(obj_player) >= 50 || unlockedanim < 1) && showtext)
{
    showtext = 0
    with (obj_drawcontroller)
    {
        thintextfade = 1
        wavetext = 0
    }
}

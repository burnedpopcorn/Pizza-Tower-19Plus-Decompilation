if (get_savestate() != (0 << 0))
{
    if instance_exists(uparrowid)
        instance_destroy(uparrowid)
}
else if (!instance_exists(uparrowid))
    uparrowid = create_uparrow()
if (!(file_exists(get_savedir() + "/saveData.save")))
{
    perc = -1
    time = -1
}
else if (perc == -1)
    self.get_file_percentage()
if (place_meeting(x, y, obj_player) && (!showtext))
{
    showtext = true
    with (obj_drawcontroller)
    {
        thintextfade = 0
        wavetext = 1
        thintext = string_get("thintexts/select")
        self.tv_thintext()
    }
}
if ((!(place_meeting(x, y, obj_player))) && showtext)
{
    showtext = false
    with (obj_drawcontroller)
    {
        thintextfade = 1
        wavetext = 0
    }
}

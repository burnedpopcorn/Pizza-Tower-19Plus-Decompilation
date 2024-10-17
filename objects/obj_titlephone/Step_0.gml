if (place_meeting(x, y, obj_player) && obj_player.grounded && obj_player.state != 1000000)
{
    if input_check_pressed("up")
    {
        instance_create_depth(x, y, -99, obj_optionsmenu)
        obj_player.state = (110 << 0)
        obj_player.hsp = 0
        obj_player.vsp = 0
    }
}
if (place_meeting(x, y, obj_player) && (!showtext))
{
    showtext = true
    with (obj_drawcontroller)
    {
        thintextfade = 0
        wavetext = 1
        thintext = string_get("thintexts/options")
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

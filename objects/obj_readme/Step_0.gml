if (obj_player.state != (6 << 0))
{
    if (place_meeting(x, y, obj_player) && obj_player.grounded && input_check_pressed("up"))
    {
        instance_create_depth(0, 0, 0, obj_manual)
        obj_player.state = (110 << 0)
        obj_player.sprite_index = obj_player.spr_idle
        vis = false
    }
    visible = vis
}
else
    visible = false
if (place_meeting(x, y, obj_player) && (!instance_exists(obj_manual)) && (!showtext))
{
    showtext = true
    with (obj_drawcontroller)
    {
        thintextfade = 0
        wavetext = 1
        thintext = string_get("thintexts/manual")
        self.tv_thintext()
    }
}
if (((!(place_meeting(x, y, obj_player))) || instance_exists(obj_manual)) && showtext)
{
    showtext = false
    with (obj_drawcontroller)
    {
        thintextfade = 1
        wavetext = 0
    }
}

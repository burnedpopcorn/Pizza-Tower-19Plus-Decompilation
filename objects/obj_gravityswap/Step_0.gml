if (place_meeting(x, y, obj_player) && touched == 0)
{
    touched = 1
    alarm[0] = 80
    obj_player.gravityflip = myflip
}

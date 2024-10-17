if input_check_pressed("jump")
{
    if event_isplaying(introaudio)
        event_stop(introaudio, true)
    room_goto(TitlescreenRoom)
}
if (introstate == (7 << 0))
{
    if (logofade <= 0 && (!event_isplaying(introaudio)))
        room_goto(TitlescreenRoom)
}

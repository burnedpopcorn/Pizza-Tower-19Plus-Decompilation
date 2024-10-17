switch descstate
{
    case 0:
        descanim += 0.05
        descalpha += 0.05
        descspin += 40
        descspin %= 360
        if (descanim >= 1)
        {
            descanim = 1.2
            descspin = 0
            descstate = 1
            event_play_oneshot("event:/sfx/misc/disclamersplat")
        }
        break
    case 1:
        descanim = Approach(descanim, 1, 0.05)
        break
    case 2:
        descalpha -= 0.05
        if (descalpha <= 0)
        {
            obj_player.state = (0 << 0)
            instance_destroy()
        }
        break
}

if input_check_pressed("jump")
    descstate = 2

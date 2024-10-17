var tx = playerid.x
var ty = playerid.y - 60
switch state
{
    case 0:
        x = lerp(x, tx, 0.1)
        y = lerp(y, ty, 0.1)
        if (alarm[0] == -1 && abs(tx - x) < 8 && abs(ty - y) < 8)
        {
            alarm[0] = 50
            x = tx
            y = ty
            state = 1
        }
        break
    case 1:
        x = lerp(x, tx, 0.2)
        y = lerp(y, ty, 0.2)
        break
    case 2:
        x += 4
        y -= 8
        break
}


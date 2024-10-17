if (place_meeting(x, y, obj_player) && alarm[0] == -1)
    gonnajump = 1
if ((!(place_meeting(x, y, obj_player))) && gonnajump == 1 && alarm[0] == -1)
    alarm[0] = 12
if (alarm[0] != -1)
    y -= 4

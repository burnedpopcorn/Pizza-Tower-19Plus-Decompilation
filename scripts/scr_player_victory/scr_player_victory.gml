function scr_player_victory() //scr_player_victory
{
    hsp = 0
    movespeed = 0
    mach2 = 0
    jumpAnim = 1
    dashAnim = 1
    landAnim = 0
    moveAnim = 1
    stopAnim = 1
    crouchslideAnim = 1
    crouchAnim = 1
    machhitAnim = 0
    if (enteredDoor != noone)
        x = lerp(x, (enteredDoor.x + 48.5 + 1.5 * (enteredDoor.object_index == obj_geromedoor) - 47.5 * (enteredDoor.object_index == obj_startgate || enteredDoor.object_index == obj_sagegate)), min(1, (image_index / sprite_get_number(spr_lookdoor))))
    if place_meeting(x, y, obj_keydoor)
        sprite_index = spr_victory
    if place_meeting(x, y, obj_startgate)
        sprite_index = spr_entergate
    if place_meeting(x, y, obj_sagegate)
        sprite_index = spr_player_sagegatestart
    if (floor(image_index) == (image_number - 1))
    {
        image_speed = 0
        enteredDoor = -4
    }
    else
        image_speed = 0.35
    if (floor(image_index) == 17 && sprite_index != spr_entergate && sprite_index != spr_player_sagegatestart)
    {
        if (character == "P")
            fmod_studio_event_instance_start(PcollectVA)
        else if (character == "N")
            fmod_studio_event_instance_start(NrandomVA)
    }
    restore_combo()
}


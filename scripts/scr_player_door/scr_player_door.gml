function scr_player_door() //scr_player_door
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
    if instance_exists(enteredDoor)
    {
        if (enteredDoor.object_index == obj_elevator)
        {
            x = lerp(x, (enteredDoor.x + 25), min(1, (image_index / (image_number - 2))))
            y = lerp(y, (enteredDoor.y + 23), min(1, (image_index / (image_number - 2))))
        }
        else if (enteredDoor.object_index != obj_boxofpizza)
        {
            x = lerp(x, (enteredDoor.x + 48.5), min(1, (image_index / (image_number - 2))))
            y = lerp(y, (enteredDoor.y + 50), min(1, (image_index / (image_number - 2))))
        }
    }
    image_speed = 0.35
    if (floor(image_index) == (image_number - 1))
        image_speed = 0
    if (floor(image_index) == (image_number - 1) && (!instance_exists(obj_fadeout)) && (sprite_index == spr_downpizzabox || sprite_index == spr_uppizzabox))
    {
        instance_create_depth(x, y, -9999, obj_fadeout)
        enteredDoor = -4
    }
}


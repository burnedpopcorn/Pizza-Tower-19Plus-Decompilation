function scr_playerC_attack() //scr_playerC_attack
{
    hsp = xscale * movespeed
    if (floor(image_index) > 10)
    {
        movespeed = 8
        with (instance_create_depth(x, y, depth, obj_playablecheeseattackhitbox))
        {
            playerid = other.id
            image_xscale = other.image_xscale
        }
    }
    else
        movespeed = 0
    if (floor(image_index) == (image_number - 1))
        state = (112 << 0)
}


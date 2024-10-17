function scr_player_skateboard() //scr_player_skateboard
{
    machhitAnim = 0
    crouchslideAnim = 1
    hsp = xscale * movespeed
    if input_check_pressed("jump")
        input_buffer_jump = 0
    if ((!input_check("jump")) && (!jumpstop) && vsp < 0.5 && (!stompAnim))
    {
        vsp /= 2
        jumpstop = 1
    }
    if (grounded && vsp > 0)
        jumpstop = 0
    if (input_buffer_jump < 8 && grounded && (mask_index != spr_crouchmask || (!(scr_solid(x, (y - 16))))))
        vsp = -11
    if grounded
    {
        if ((!input_check("down")) && (!(scr_solid(x, (y - 16)))))
            sprite_index = spr_player_skateboardmach
        else
            sprite_index = spr_player_skateboardcrouch
        if (scr_solid((x + xscale), y) && (!(place_meeting((x + sign(hsp)), y, obj_slope))))
            xscale *= -1
    }
    else
    {
        mask_index = spr_player_mask
        if (sprite_index != spr_player_skateboardwall)
            sprite_index = spr_player_skateboardfall
        if ((place_meeting((x + hsp), y, obj_solid) && (!(place_meeting((x + hsp), y, obj_destructibles))) && (!(place_meeting((x + sign(hsp)), y, obj_slope)))) || (grounded && place_meeting((x + hsp), (y - 16 + (8 * character) != "S"), obj_solid) && (!(place_meeting((x + hsp), y, obj_destructibles))) && (!(place_meeting((x + hsp), y, obj_metalblock))) && place_meeting(x, (y + 1), obj_slope)))
        {
            wallspeed = 8
            sprite_index = spr_player_skateboardwall
        }
        if (input_check_pressed("down") && (!godown))
        {
            godown = 1
            vsp = 12
        }
    }
    if (sprite_index == spr_player_skateboardwall)
    {
        vsp = (-wallspeed)
        if (wallspeed < 16 && move == xscale)
            wallspeed += 0.2
        if (wallspeed > 16)
            wallspeed -= 0.1
        if (!(scr_solid((x + xscale), y)))
        {
            instance_create_depth(x, y, 0, obj_jumpdust)
            vsp = 0
            sprite_index = spr_player_skateboardmach
        }
        if input_check_pressed("jump")
        {
            image_index = 0
            vsp = -11
            xscale *= -1
            jumpstop = 0
            sprite_index = spr_player_skateboardfall
        }
        if (scr_solid(x, (y - 1)) && (!(place_meeting((x + sign(hsp)), y, obj_slope))) && (!(place_meeting((x - sign(hsp)), y, obj_slope))))
        {
            sprite_index = spr_player_skateboardmach
            xscale *= -1
        }
    }
    image_speed = 0.35
    if ((!instance_exists(obj_slidecloud)) && grounded && movespeed > 5)
        instance_create_depth(x, y, 0, obj_slidecloud)
}


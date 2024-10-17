function scr_player_kungfugrab() //scr_player_kungfugrab
{
    jumpstop = 0
    landAnim = 0
    anger = 100
    movespeed = 0
    sprite_index = spr_grab
    hsp = Approach(hsp, 0, 0.4)
    if (grounded && vsp > 0 && input_buffer_jump < 8 && (!input_check("down")) && (!input_check("dash")) && (!input_check_pressed("left")) && (!input_check_pressed("right")))
    {
        input_buffer_jump = 8
        piledrivervsp = -14
        state = (25 << 0)
        sprite_index = spr_piledriver
        movespeed = 0
        hsp = 0
        fmod_studio_event_instance_start(groundpoundfallsnd)
    }
    if (ladderbuffer > 0)
        ladderbuffer--
    if (input_buffer_attack < 8)
    {
        input_buffer_attack = 8
        state = (2 << 0)
        sprite_index = choose(spr_finishingblow1, spr_finishingblow2, spr_finishingblow3, spr_finishingblow4, spr_finishingblow5)
        image_index = 0
    }
    if input_check_pressed("up")
    {
        state = (2 << 0)
        sprite_index = spr_uppercutfinishingblow
        image_index = 0
    }
    if (input_check_pressed("left") || input_check_pressed("right"))
    {
        var _move = input_check_opposing("left", "right")
        if (_move != 0)
            xscale = _move
        state = (2 << 0)
        sprite_index = choose(spr_finishingblow1, spr_finishingblow2, spr_finishingblow3, spr_finishingblow4, spr_finishingblow5)
        image_index = 0
    }
    if (input_check("down") && grounded)
    {
        state = (43 << 0)
        landAnim = 0
        crouchAnim = 1
        image_index = 0
        idle = 0
    }
    image_speed = 0.35
}


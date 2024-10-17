function scr_player_machroll() //scr_player_machroll
{
    collide_destructibles = function(argument0, argument1) //anon@58@scr_player_machroll_scr_player_machroll
    {
        scr_destroy_horizontal(argument0)
    }

    hit_horizontal = function(argument0) //anon@133@scr_player_machroll_scr_player_machroll
    {
        state = (49 << 0)
        sprite_index = spr_wallsplat
        gamepadvibrate(0.4, 0, 7)
        image_index = 0
        mach2 = 0
        movespeed = 0
        scr_fmod_soundeffectONESHOT("event:/sfx/player/splat", x, y)
    }

    mach2 = 100
    machslideAnim = 0
    movespeed = clamp(movespeed, 8, 24)
    move = input_check_opposing("left", "right")
    hsp = xscale * movespeed
    if place_meeting(x, (y + 1), obj_railh)
        movespeed -= (0.1 * xscale)
    else if place_meeting(x, (y + 1), obj_railh2)
        movespeed += (0.1 * xscale)
    if (scr_slope_ext(x, (y + 1)) && vsp >= 0)
    {
        with (instance_place(x, (y + 1), obj_slope))
        {
            var slope_acceleration = abs(image_yscale) / abs(image_xscale)
            if (other.xscale == sign(image_xscale))
            {
                if (other.movespeed > 0)
                    other.movespeed -= (0.15 * slope_acceleration)
            }
            else if (other.xscale == (-sign(image_xscale)))
            {
                if (other.movespeed < 25)
                    other.movespeed += (0.3 * slope_acceleration)
            }
        }
    }
    if ((!instance_exists(obj_cloudeffect)) && grounded)
        instance_create_depth(x, (y + 43), 0, obj_cloudeffect)
    if (movespeed >= 12)
        blurafterimageeffect(3, 0.05)
    if grounded
    {
        timeuntilslide -= 0.5
        if (sprite_index == spr_dive)
            image_index = 0
        if (sprite_index != spr_longjumpslide && sprite_index != spr_longjumpslidestart)
            sprite_index = spr_machroll
        if (sprite_index == spr_machroll && ((timeuntilslide <= 0 && character != "N") || character == "N") && movespeed >= 12)
        {
            sprite_index = spr_longjumpslidestart
            timeuntilslide = 10
        }
        if (floor(image_index) == (image_number - 1) && sprite_index == spr_longjumpslidestart)
            sprite_index = spr_longjumpslide
        if (character == "S")
        {
            state = (45 << 0)
            sprite_index = spr_crouchslip
        }
    }
    else if (sprite_index != spr_dive)
    {
        sprite_index = spr_dive
        vsp = 12
    }
    if (sprite_index == spr_machroll && grounded && vsp > 1 && character == "S")
    {
        if (movespeed < 12)
            movespeed = 12
        with (instance_create_depth(x, y, 0, obj_shoulderbashcrazyrunothereffect))
            image_xscale = other.xscale
    }
    image_speed = 0.8
    if ((!input_check("down")) && grounded && (!(scr_solid((x + 27), (y - 32)))) && (!(scr_solid((x - 27), (y - 32)))) && (!(scr_solid(x, (y - 32)))) && (!(scr_solid(x, (y - 16)))) && movespeed < 12)
    {
        image_index = 0
        scr_fmod_soundeffectONESHOT("event:/sfx/player/mach/rollgetup", x, y)
        state = (47 << 0)
        sprite_index = spr_rollgetup
    }
    if ((!input_check("down")) && grounded && (!(scr_solid((x + 27), (y - 32)))) && (!(scr_solid((x - 27), (y - 32)))) && (!(scr_solid(x, (y - 32)))) && (!(scr_solid(x, (y - 16)))) && movespeed >= 12)
    {
        image_index = 0
        scr_fmod_soundeffectONESHOT("event:/sfx/player/mach/rollgetup", x, y)
        if (character != "S")
            state = (66 << 0)
        else if snickmach3mode
            state = (66 << 0)
        else
            state = (47 << 0)
        sprite_index = spr_rollgetup
    }
    if (sprite_index == spr_dive && input_check_pressed("jump") && (!(scr_solid(x, (y - 16)))) && (!(scr_solid(x, (y - 32)))))
    {
        cancancelpoundcancel = 1
        state = (51 << 0)
        momemtum = 1
        bodyslamvsp = -7
        sprite_index = spr_player_poundcancel1
        freefallsmash = -20
        fmod_studio_event_instance_start(groundpoundfallsnd)
    }
}


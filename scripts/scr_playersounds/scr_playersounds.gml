function scr_playersounds() //scr_playersounds
{
    with (obj_player)
    {
        var _attr = new Fmod3DAttributes()
        _attr.position.x = x
        _attr.position.y = y
        _attr.position.z = 0
        _attr.forward.z = 1
        _attr.up.y = 1
        if instance_exists(obj_pizzaface)
        {
            if event_isplaying(obj_pizzaface.movingsnd)
            {
                var _val = (800 - distance_to_object(obj_pizzaface)) / 800
                fmod_studio_system_set_parameter_by_name("pizzafaceattenuation", (_val * obj_pizzaface.image_alpha), true)
            }
            else
                fmod_studio_system_set_parameter_by_name("pizzafaceattenuation", 0, true)
        }
        else
            fmod_studio_system_set_parameter_by_name("pizzafaceattenuation", 0, true)
        if (character != "N")
        {
            char_jumpsnd = jumpsnd
            char_machsnd = machsnd
            char_machbreaksnd = machbreaksnd
            char_machturnsnd = machturnsnd
            char_superjumpsnd = superjumpsnd
            char_hurtsnd = hurtsnd
        }
        else
        {
            char_jumpsnd = noisejumpsnd
            char_machsnd = noisemachsnd
            char_machbreaksnd = noisemachbreaksnd
            char_machturnsnd = noisemachturnsnd
            char_superjumpsnd = noisesuperjumpsnd
            char_hurtsnd = noisehurtsnd
        }
        if (state == (47 << 0) || state == (66 << 0) || state == (87 << 0) || state == (12 << 0))
        {
            if (!event_isplaying(char_machsnd))
                fmod_studio_event_instance_start(char_machsnd)
            var s = 0
            if ((state == (47 << 0) && sprite_index == spr_mach1 && character != "N") || (state == (47 << 0) && character == "N"))
                s = 1
            else if ((state == (47 << 0) && sprite_index == spr_mach && character != "N") || (state == (47 << 0) && character == "N") || state == (12 << 0))
                s = 2
            else if ((state == (66 << 0) || state == (87 << 0)) && (sprite_index == spr_mach4 || sprite_index == spr_rollgetup || sprite_index == spr_mach3hit || sprite_index == spr_mach3jump) && sprite_index != spr_crazyrun)
                s = 3
            else if (sprite_index == spr_crazyrun)
                s = 4
            if (character == "N")
                fmod_studio_event_instance_set_parameter_by_name(char_machsnd, "ground", grounded, true)
            fmod_studio_event_instance_set_parameter_by_name(char_machsnd, "state", s, true)
            event_set_3d_position_struct(char_machsnd, _attr)
        }
        else
            event_stop(char_machsnd, 1)
        if (state != (16 << 0) && state != (73 << 0) && state != (118 << 0))
            event_stop(suplexdashsnd, true)
        event_set_3d_position_struct(suplexdashsnd, _attr)
        if (state != (47 << 0) && state != (66 << 0) && sprite_index != spr_player_longjumpstart && sprite_index != spr_player_longjump)
            event_stop(longjumpsnd, true)
        event_set_3d_position_struct(longjumpsnd, _attr)
        if (state == (42 << 0) || state == (40 << 0) || (state == (87 << 0) && sprite_index == spr_superjump))
        {
            if (state == (42 << 0))
            {
                if (!event_isplaying(char_superjumpsnd))
                    fmod_studio_event_instance_start(char_superjumpsnd)
                fmod_studio_event_instance_set_parameter_by_name(char_superjumpsnd, "state", 0, true)
            }
            else if (state == (40 << 0))
                fmod_studio_event_instance_set_parameter_by_name(char_superjumpsnd, "state", 1, true)
            event_set_3d_position_struct(char_superjumpsnd, _attr)
        }
        else
            event_stop(char_superjumpsnd, 1)
        if (state != (67 << 0) && state != (51 << 0) && state != (25 << 0) && state != (87 << 0))
            event_stop(groundpoundfallsnd, 1)
        else
            event_set_3d_position_struct(groundpoundfallsnd, _attr)
        if ((state == (13 << 0) && grounded && vsp > 0) || state == (27 << 0))
        {
            if (!event_isplaying(knightslidesnd))
                fmod_studio_event_instance_start(knightslidesnd)
            event_set_3d_position_struct(knightslidesnd, _attr)
        }
        else
            event_stop(knightslidesnd, 1)
        if (sprite_index == spr_bombpeprun || sprite_index == spr_bombpeprunabouttoexplode)
        {
            if (!event_isplaying(bombpep1snd))
                fmod_studio_event_instance_start(bombpep1snd)
            event_set_3d_position_struct(bombpep1snd, _attr)
        }
        else if (sprite_index != spr_bombpeprun && sprite_index != spr_bombpeprunabouttoexplode && event_isplaying(bombpep1snd))
            event_stop(bombpep1snd, 1)
        if (sprite_index == spr_barrelroll && grounded)
        {
            if (!event_isplaying(barrelsnd))
                fmod_studio_event_instance_start(barrelsnd)
            event_set_3d_position_struct(barrelsnd, _attr)
        }
        else
            event_stop(barrelsnd, 1)
        if (state == (11 << 0))
        {
            if (!event_isplaying(boxxeddashsnd))
                fmod_studio_event_instance_start(boxxeddashsnd)
            s = 0
            if (sprite_index == spr_boxxeddash && grounded)
                s = 1
            fmod_studio_event_instance_set_parameter_by_name(boxxeddashsnd, "state", s, true)
            event_set_3d_position_struct(boxxeddashsnd, _attr)
        }
        else
            event_stop(boxxeddashsnd, 1)
        if (state == (96 << 0))
        {
            if (hsp != 0)
            {
                if (!event_isplaying(weeniegallopingsnd))
                    fmod_studio_event_instance_start(weeniegallopingsnd)
                event_set_3d_position_struct(weeniegallopingsnd, _attr)
            }
            else
                event_stop(weeniegallopingsnd, 1)
        }
        else
            event_stop(weeniegallopingsnd, 1)
        if (sprite_index == spr_machroll || sprite_index == spr_longjumpslidestart || sprite_index == spr_longjumpslide)
        {
            if (!event_isplaying(machrollsnd))
                fmod_studio_event_instance_start(machrollsnd)
            event_set_3d_position_struct(machrollsnd, _attr)
        }
        else
            event_stop(machrollsnd, 1)
        s = 0
        if (sprite_index == spr_tumblestart || sprite_index == spr_tumble)
        {
            if (!event_isplaying(tumblesnd))
            {
                fmod_studio_event_instance_start(tumblesnd)
                s = 0
                if (sprite_index == spr_tumblestart)
                    tumbleintro = true
            }
            if (sprite_index == spr_tumble && (!tumbleintro))
                s = 0.5
        }
        else
        {
            s = 1
            tumbleintro = false
        }
        if (sprite_index == spr_swingding)
        {
            if (!event_isplaying(swingdingsnd))
                fmod_studio_event_instance_start(swingdingsnd)
            event_set_3d_position_struct(swingdingsnd, _attr)
        }
        else
            event_stop(swingdingsnd, 1)
        event_set_3d_position_struct(tumblesnd, _attr)
        fmod_studio_event_instance_set_parameter_by_name(tumblesnd, "state", s, true)
        event_set_3d_position_struct(PrandomVA, _attr)
        event_set_3d_position_struct(PcollectVA, _attr)
        event_set_3d_position_struct(PhurtVA, _attr)
        event_set_3d_position_struct(PtransfoVA, _attr)
        event_set_3d_position_struct(NrandomVA, _attr)
        event_set_3d_position_struct(NhurtVA, _attr)
        event_set_3d_position_struct(divesnd, _attr)
        event_set_3d_position_struct(priestsnd, _attr)
        event_set_3d_position_struct(slipsnd, _attr)
        event_set_3d_position_struct(swingdingsnd, _attr)
    }
}


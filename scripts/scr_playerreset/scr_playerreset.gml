/*
WARNING: Recursive script decompilation (for member variable name resolution) failed for fmod_studio_system_set_parameter_by_name

System.InvalidOperationException: Stack empty.
   at System.Collections.Generic.Stack`1.ThrowForEmptyStack()
   at System.Collections.Generic.Stack`1.Pop()
   at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block, List`1 tempvars, Stack`1 workQueue) in D:\a\UndertaleModToolCE\UndertaleModToolCE\UndertaleModLib\Decompiler\Decompiler.cs:line 265
   at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block) in D:\a\UndertaleModToolCE\UndertaleModToolCE\UndertaleModLib\Decompiler\Decompiler.cs:line 869
   at UndertaleModLib.Decompiler.Decompiler.<DecompileFromBlock>g__FindActualNameForAnonymousCodeObject|5_2(DecompileContext context, UndertaleCode anonymousCodeObject) in D:\a\UndertaleModToolCE\UndertaleModToolCE\UndertaleModLib\Decompiler\Decompiler.cs:line 629
*/
/*
WARNING: Recursive script decompilation (for member variable name resolution) failed for fmod_studio_event_instance_set_parameter_by_name

System.InvalidOperationException: Stack empty.
   at System.Collections.Generic.Stack`1.ThrowForEmptyStack()
   at System.Collections.Generic.Stack`1.Pop()
   at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block, List`1 tempvars, Stack`1 workQueue) in D:\a\UndertaleModToolCE\UndertaleModToolCE\UndertaleModLib\Decompiler\Decompiler.cs:line 265
   at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block) in D:\a\UndertaleModToolCE\UndertaleModToolCE\UndertaleModLib\Decompiler\Decompiler.cs:line 869
   at UndertaleModLib.Decompiler.Decompiler.<DecompileFromBlock>g__FindActualNameForAnonymousCodeObject|5_2(DecompileContext context, UndertaleCode anonymousCodeObject) in D:\a\UndertaleModToolCE\UndertaleModToolCE\UndertaleModLib\Decompiler\Decompiler.cs:line 629
*/
function scr_playerreset(argument0, argument1) //scr_playerreset
{
    if (argument1 == undefined)
        argument1 = true
    global.timeractive = 0
    global.wavenum = 0
    global.maxwave = 0
    global.secretfound = 0
    global.hurtcounter = 0
    global.golfhit = 0
    global.stylethreshold = 0
    global.enemypalette = false
    global.snickchallenge = 0
    global.timetrialtime = 0
    scr_unrevokeprank()
    global.smallpep = false
    global.currentpowerup = (0 << 0)
    global.timer = 0
    global.followers = []
    if (global.levelname != -4 && global.levelname != "tutorial")
    {
        wallet_open()
        wallet_readcoins(global.levelname, true)
        wallet_close()
        ds_map_copy(global.timetrialsplits, ds_map_find_value(global.timetrialsavedsplits, global.levelname))
        if (ds_map_find_value(global.timetrialreplays, global.levelname) != -1)
            buffer_seek(array_get(ds_map_find_value(global.timetrialreplays, global.levelname), 1), buffer_seek_start, 0)
    }
    achievements_reset()
    fmod_studio_system_set_parameter_by_name("pizzafaceattenuation", 0, true)
    instance_destroy(obj_pointloss)
    instance_destroy(obj_pizzaface)
    instance_destroy(obj_tiptext)
    instance_destroy(obj_timetrialtime)
    instance_destroy(obj_comboend)
    instance_destroy(obj_itspizzatime)
    instance_destroy(obj_lap2flag)
    instance_destroy(obj_keyinv)
    instance_destroy(obj_trickpoints, false)
    input_vibrate_stop()
    with (obj_drawcontroller)
    {
        showcombo = 0
        news = -1
        newshud = -1
        statichud = false
        hudstate = "default"
        sprite_index = spr_hud_start
        image_index = 0
        image_speed = 0
        thintextshow = false
        thintextalpha = 0
        thintextfade = true
        wavetext = 0
        tutorialdrop = false
        tutorialintroanim = -180
        tutorialintroanimbounce = false
        tutorialintroanimvsp = 20
        combobarvsp = 0
        combobary = -120
        combostate = 0
        comboguypos = tvX + 123 - 61
        comboguyind = 0
        combobubbleind = 0
        visualcombo = 0
        visualheat = 0
        visualprank = 0
        staticspr = spr_hud_static
        tvplayedstart = false
        tvplayedend = false
        pointlosstimer = 60
        barcracked = false
        prevcollect = -1
        scorey = []
        scorebounce = []
        scorehudvisible = false
        barspeed = 0
        ded = 0
        chargecamera = 0
        camangle = 0
        previousrank = 0
    }
    with (obj_pizzacoinindicator)
    {
        show = 0
        image_alpha = 0
    }
    if argument1
    {
        with (obj_music)
        {
            if (global.music != noone)
            {
                if (global.music.event != -4)
                    fmod_studio_event_instance_set_parameter_by_name(global.music.event, "state", 0, true)
                global.music = noone
            }
        }
    }
    if instance_exists(obj_timesup)
        instance_destroy(obj_timesup)
    if instance_exists(obj_baddie)
    {
        with (obj_baddie)
            persistent = false
    }
    global.escapetime = 120
    global.timetrialtick = 0
    ds_list_clear(global.saveroom)
    ds_list_clear(global.instancelist)
    ds_list_clear(global.baddieroom)
    ds_list_clear(global.waveroom)
    ds_list_clear(global.collectspawn)
    ds_list_clear(global.escapecollect)
    buffer_resize(global.timetrialrecording, 0)
    buffer_seek(global.timetrialrecording, buffer_seek_start, 0)
    with (obj_player)
    {
        if (!argument0)
        {
            state = (0 << 0)
            punchedenemy = false
        }
        visible = 1
        image_blend = c_white
        alarm[0] = -1
        alarm[1] = -1
        alarm[3] = -1
        alarm[4] = -1
        alarm[5] = -1
        alarm[6] = -1
        alarm[7] = -1
        alarm[8] = -1
        alarm[9] = -1
        alarm[10] = -1
        grav = 0.5
        hsp = 0
        vsp = 0
        global.playerhealth = 5
        xscale = 1
        yscale = 1
        scale_xs = 1
        scale_ys = 1
        enteringsecret = 0
        backupweapon = 0
        shotgunAnim = 0
        box = 0
        steppy = 0
        movespeed = 0
        movespeedmax = 5
        jumpstop = 0
        start_running = 1
        doorblend = 1
        visible = true
        global.panic = 0
        global.stoptimer = 0
        turn = 0
        jumpAnim = 1
        dashAnim = 1
        landAnim = 0
        machslideAnim = 0
        moveAnim = 1
        stopAnim = 1
        crouchslideAnim = 1
        crouchAnim = 1
        machhitAnim = 0
        stompAnim = 0
        inv_frames = 0
        turning = 0
        hurtbounce = 0
        hurted = 0
        autodash = 0
        mach2 = 0
        input_buffer_jump = 8
        input_buffer_pummel = 6
        input_buffer_attack = 8
        input_buffer_down = 8
        flash = 0
        global.key_inv = 0
        global.keyget = 0
        global.collect = 0
        global.ammo = 0
        global.treasure = 0
        global.combo = 0
        global.combomilestone = 5
        global.combotime = 0
        global.combogalstate = 0
        in_water = 0
        key_particles = 0
        barrel = 0
        bounce = 0
        a = 0
        idle = 0
        attacking = 0
        slamming = 0
        superslam = 0
        machpunchAnim = 0
        punch = 0
        machfreefall = 0
        shoot = 1
        instakillmove = 0
        windingAnim = 0
        facestompAnim = 0
        ladderbuffer = 0
        chainsaw = 50
        transfocleartimer = -1
        toomuchalarm1 = 0
        toomuchalarm2 = 0
        dashdust = 0
        throwforce = 0
        hurtsound = 0
        idleanim = 0
        momemtum = 0
        cutscene = 0
        grabbing = 0
        dir = xscale
        goingdownslope = 0
        goingupslope = 0
        fallinganimation = 0
        bombpeptimer = 100
        slapbuffer = 0
        slaphand = 1
        suplexmove = 0
        suplexhavetomash = 0
        pummelpunch = 0
        pummeltimer = 0
        timeuntilhpback = 300
        anger = 0
        angry = 0
        global.funmode = 0
        ammo = 0
        global.heatbar = 0
        global.heat = 0
        global.lapping = 0
        global.laps = 0
        canuppercut = 1
        global.pepperhp = 100
        hittimer = 45
        dance = "breakdance"
        momemtumspeed = 6
        arenahp = 30
        flashlight = 0
        gravityflip = 1
        pitfalltime = 10
        firemouthdash = 0
        bombspawnerid = -4
        supertauntcooldown = 0
        global.hasgotkeybefore = 0
        global.permshotgun = 0
        combopointduration = false
        global.combopoints = 0
        combopointstogive = 0
        global.switchblock = false
        pipedir = "noone"
        pipe = -4
        inwar = 0
        snickmach2mode = 0
        snickmach3mode = 0
        shield = 0
        shieldhealth = 3
        givepoints = 0
        givepointamount = 0
        givepointmultiplier = 1
        mach4time = 0
        inmach4 = false
        trapactivated = false
        pummeldoublejump = false
        exitgatescale = 1
        gateoffsetx = 0
        gateoffsety = 0
        hallway = false
        box = false
        verticalhallway = false
        elevator = false
        if (isnoise || global.levelname == "chateau")
        {
            isnoise = 0
            character = saved_prevcharacter
        }
    }
}

function scr_unrevokeprank() //scr_unrevokeprank
{
    global.prank = false
    global.prankattempt = false
}

function scr_leavelevel() //scr_leavelevel
{
    global.levelname = -4
    global.currentbadge = (0 << 0)
}


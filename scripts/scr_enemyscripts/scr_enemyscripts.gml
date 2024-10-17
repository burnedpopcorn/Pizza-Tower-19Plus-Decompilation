function scr_enemygibs(argument0, argument1, argument2) //scr_enemygibs
{
    if (argument0 == undefined)
        argument0 = 3
    if (argument1 == undefined)
        argument1 = x
    if (argument2 == undefined)
        argument2 = y
    repeat argument0
    {
        instance_create_depth(x, y, -1, obj_slapstar)
        instance_create_depth(x, y, -1, obj_baddiegibs)
    }
}

function scr_enemycorpse(argument0, argument1, argument2, argument3, argument4) //scr_enemycorpse
{
    if (argument0 == undefined)
        argument0 = spr_dead
    if (argument1 == undefined)
        argument1 = enemypalette
    if (argument2 == undefined)
        argument2 = global.enemypalette
    if (argument3 == undefined)
        argument3 = x
    if (argument4 == undefined)
        argument4 = y
    with (instance_create_depth(x, y, 0, obj_baddiedead))
    {
        sprite_index = argument0
        palettespr = argument1
        pal = argument2
    }
}

function scr_enemy_create() //scr_enemy_create
{
    x_start = x
    y_start = y
    killed = 0
    escape = 0
    active = 1
    toomuchalarm1 = 0
    palette = 0
    ishurt = 0
    parried = 0
    hitfactor = 0
    hurttype = 0
    stompscale = 0
    hitboxID = -4
    insupertaunt = 0
    superhurt = 0
    escapespawnID = -4
    escapestun = true
    stuntouchbuffer = 0
    hitboxcreate = 0
    enemypalette = -1
    chargeeffectID = -4
    throwhsp = 0
    throwvsp = 0
    pummelled = -4
    scaredbuffer = 100
    darkalpha = 1
    killedbyfireassstoredsprite = -4
    killedbyknightslide = false
    killedwithbypiledrive = -4
    playkillsound = true
}

function scr_escapeenemy() //scr_escapeenemy
{
    if (killed == 1)
        instance_destroy()
    if (place_meeting(x, y, obj_swordhitbox) && visible)
    {
        if (hp > 0)
        {
            var __player = instance_place(x, y, obj_swordhitbox).playerid
            if (hitfactor < 12)
                hitfactor += 4
            hp = 0
            scr_enemygibs()
            camera_shake(3, 3)
            image_xscale = (-__player.xscale)
            alarm[3] = 3
            restore_combo()
            alarm[1] = 5
            grav = 0
            thrown = 1
            stunned = 10000
            state = 104
            parried = 1
            with (__player)
            {
                if (sprite_index == spr_uppercutfinishingblow)
                {
                    other.throwhsp = 0
                    other.throwvsp = -25
                }
                else
                {
                    other.throwhsp = (-other.image_xscale) * 25
                    other.throwvsp = 0
                    other.y = y - 4
                }
            }
            var _ray = fire_ray(x, y, __player.x, __player.y, 1, -4, -4, mask_index)
            if (!_ray.clear)
            {
                x = _ray.x
                y = _ray.y
            }
            if scr_solid(x, y)
            {
                x = __player.x
                y = __player.y
            }
        }
    }
    if insupertaunt
    {
        hsp = 0
        movespeed = 0
        vsp = 0
    }
    var targetplayer = instance_nearest(x, y, obj_player)
    var _x = targetplayer.x
    var _y = targetplayer.y
    var range = 400
}

function scr_enemy_scared() //scr_enemy_scared
{
    if (state == 300)
        return;
    var p = instance_nearest(x, y, obj_player)
    if (p.x > (x - 400) && p.x < (x + 400) && y <= (p.y + 60) && y >= (p.y - 60))
    {
        if (state != 92 && state != 104 && (p.state == (66 << 0) || p.state == (13 << 0) || p.state == (118 << 0)))
        {
            scaredbuffer = 100
            hsp = 0
            state = 92
            image_index = 0
            sprite_index = scaredspr
            if (x != p.x)
                image_xscale = (-(sign(x - p.x)))
            if grounded
                vsp = -3
            if (irandom(8) == 2)
                scr_fmod_soundeffectONESHOT("event:/sfx/enemy/scream", x, y)
        }
    }
}

function enemy_palettepoof() //enemy_palettepoof
{
    if ((!global.enemypalette) && global.stylethreshold >= 2)
    {
        global.enemypalette = 1
        with (obj_baddie)
            instance_create_depth(x, y, -1, obj_genericpoofeffect)
    }
    else if (global.enemypalette && global.stylethreshold < 2)
    {
        global.enemypalette = 0
        with (obj_baddie)
            instance_create_depth(x, y, -1, obj_genericpoofeffect)
    }
}


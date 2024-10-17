if place_meeting(x, (y + 1), obj_railh)
    hsp = Approach(hsp, -4, 2)
else if place_meeting(x, (y + 1), obj_railh2)
    hsp = Approach(hsp, 4, 2)
if (!important)
    countdown -= 0.5
if scr_solid((x + sign(hsp)), y)
    drop = 1
if (scr_solid(x, (y + 1)) && vsp > 0)
    kicked = 0
if grounded
    hsp = Approach(hsp, 0, 1)
if (scr_solid((x + hsp), y) && (!(place_meeting((x + hsp), y, obj_slope))) && (!(place_meeting((x + hsp), y, obj_ratblock))))
{
    if ((hsp > 2 && sign(hsp) == 1) || (hsp < -2 && sign(hsp) == -1))
        hsp = round((-((hsp / 2))))
    else
        hsp = 0
}
if (scr_solid(x, (y + vsp)) && (!(place_meeting(x, (y + vsp), obj_ratblock))))
{
    if ((vsp > 2 && sign(vsp) == 1) || (vsp < -2 && sign(vsp) == -1))
        vsp = round((-((vsp / 2))))
    else
        vsp = 0
}
if (vsp < 12)
    vsp += grav
if (countdown < 50)
    sprite_index = (global.throwitback ? spr_pipebomblit : spr_bomblit)
var _destructibles = [obj_bombblock, obj_ratblock]
if (countdown == 0 || place_meeting((x + 1), y, _destructibles) || place_meeting((x - 1), y, _destructibles) || place_meeting(x, (y - 1), _destructibles) || place_meeting(x, (y + 1), _destructibles))
{
    with (instance_create_depth(x, y, 0, obj_bombexplosion))
        bygoblin = other.goblinbomb
    instance_destroy()
}
scr_collide()

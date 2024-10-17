function scr_transformationcheck(argument0) //scr_transformationcheck
{
    if (argument0 == undefined)
        argument0 = instance_nearest(x, y, obj_player)
    if (argument0.state == (18 << 0) || argument0.state == (13 << 0) || argument0.state == (115 << 0) || argument0.state == (19 << 0) || argument0.state == (9 << 0) || argument0.state == (10 << 0) || argument0.state == (8 << 0) || argument0.state == (99 << 0) || argument0.state == (11 << 0) || argument0.state == (5 << 0) || argument0.state == (4 << 0) || argument0.state == (97 << 0) || argument0.state == (105 << 0))
        return true;
    return false;
}


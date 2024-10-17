if (obj_player.state != (37 << 0) && obj_player.state != (54 << 0))
    spaceb = Approach(spaceb, (maxspace * (-xscale)), spaceaccel)
else
    spaceb = Approach(spaceb, 0, spaceaccel)
xscale = obj_player.xscale
positioninline = array_get_index(global.followers, id)
lastfollowerid = (positioninline > 0 ? global.followers[(positioninline - 1)] : noone)
ds_queue_enqueue(followerqueue, ((lastfollowerid == noone ? obj_player.x : lastfollowerid.x) + (round((abs(bbox_left - bbox_right)) * spaceb))))
ds_queue_enqueue(followerqueue, (lastfollowerid == noone ? obj_player.y : lastfollowerid.y))
ds_queue_enqueue(followerqueue, (lastfollowerid == noone ? (obj_player.state == (31 << 0) && obj_player.sprite_index == obj_player.spr_taunt) : lastfollowerid.taunting))
if (ds_queue_size(followerqueue) > (lag * 2))
{
    var _xnext = ds_queue_dequeue(followerqueue)
    var _ynext = ds_queue_dequeue(followerqueue)
    taunting = ds_queue_dequeue(followerqueue)
    if (!taunting)
    {
        if ((!(obj_moved(lastfollowerx, _xnext))) && (!(obj_moved(lastfollowery, _ynext))) && interpfirstmove >= 1 && obj_player.state != (54 << 0))
            colliding = true
        else
        {
            if colliding
                interpfirstmove = 0.05
            colliding = false
        }
        if (!colliding)
        {
            if (interpfirstmove < 1)
            {
                interpfirstmove += 0.01
                if (interpfirstmove > 1 || ((!(obj_moved(x, _xnext))) && (!(obj_moved(y, _ynext)))))
                    interpfirstmove = 1
                x = lerp(x, _xnext, interpfirstmove)
                y = lerp(y, _ynext, interpfirstmove)
            }
            else
            {
                x = _xnext
                y = _ynext
            }
        }
    }
    else
        colliding = false
    lastfollowerx = _xnext
    lastfollowery = _ynext
}
if colliding
    scr_collide()

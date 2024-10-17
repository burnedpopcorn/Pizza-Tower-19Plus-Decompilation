if (!there_is_follower_id(id))
    array_push(global.followers, id)
persistent = true
image_speed = 0.35
vsp = 0
hsp = 0
grav = 0.5
lag = 20
followerqueue = ds_queue_create()
positioninline = array_length(global.followers) - 1
lastfollowerid = (positioninline > 0 ? global.followers[(positioninline - 1)] : -4)
interpfirstmove = 0.05
colliding = false
lastfollowerx = 0
lastfollowery = 0
spaceb = 0
spaceaccel = 0.2
maxspace = 1
xscale = 1
taunting = false
depth = obj_player.depth + 3

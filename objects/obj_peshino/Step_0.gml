if (room == rank_room || room == timesuproom)
    visible = false
if there_is_follower_id(id)
{
    image_alpha = obj_player.image_alpha
    depth = -7
    if (obj_player.hsp != 0)
        sprite_index = spr_peshino_move
    else
        sprite_index = spr_peshino
    if global.pineapplefollow
    {
        ds_queue_enqueue(followQueue, (obj_pizzakinpineapple.x + image_xscale * 4))
        ds_queue_enqueue(followQueue, obj_player.y)
    }
    else if global.sausagefollow
    {
        ds_queue_enqueue(followQueue, (obj_pizzakinsausage.x + image_xscale * 4))
        ds_queue_enqueue(followQueue, obj_player.y)
    }
    else if global.tomatofollow
    {
        ds_queue_enqueue(followQueue, (obj_pizzakintomato.x + image_xscale * 4))
        ds_queue_enqueue(followQueue, obj_player.y)
    }
    else if global.cheesefollow
    {
        ds_queue_enqueue(followQueue, (obj_pizzakincheese.x + image_xscale * 4))
        ds_queue_enqueue(followQueue, obj_player.y)
    }
    else if global.shroomfollow
    {
        ds_queue_enqueue(followQueue, (obj_pizzakinshroom.x + image_xscale * 4))
        ds_queue_enqueue(followQueue, obj_player.y)
    }
    else
    {
        ds_queue_enqueue(followQueue, obj_player.x)
        ds_queue_enqueue(followQueue, obj_player.y)
    }
    LAG_STEPS = 10
    if (ds_queue_size(followQueue) > (LAG_STEPS * 2))
    {
        x = ds_queue_dequeue(followQueue) - image_xscale * 4
        y = ds_queue_dequeue(followQueue) + 2
    }
    image_xscale = obj_player.xscale
}

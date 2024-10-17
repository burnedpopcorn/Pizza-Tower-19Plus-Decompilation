if (place_meeting(x, y, obj_player) && self.condition())
{
    trigger_news(texts, tvs)
    instance_destroy()
}

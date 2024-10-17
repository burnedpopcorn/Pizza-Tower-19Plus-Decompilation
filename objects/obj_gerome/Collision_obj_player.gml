if (other.state != (50 << 0) && (!there_is_follower_id(id)))
{
    event_perform_object(obj_follower, ev_create, 0)
    restore_combo()
    sprite_index = spr_gerome_intro
    image_index = 0
    event_play_oneshot("event:/sfx/player/collect/gerome")
    instance_create_depth(x, y, (depth + 1), obj_taunteffect)
    if (global.levelname == "entry")
        trigger_news(string_get("tvmessages/entry/gerome"), ["", "", "gerome"])
}

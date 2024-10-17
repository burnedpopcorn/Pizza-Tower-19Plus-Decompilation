while (!ds_list_empty(notifications))
{
    var _notif = ds_list_find_value(notifications, 0)
    for (var a = 0; a < array_length(achievements); a++)
    {
        var _ach = achievements[a]
        if _ach.done
        {
        }
        else
        {
            with (_ach)
                self.updatefunc(_notif)
        }
    }
    ds_list_delete(notifications, 0)
}
if ((!ds_list_empty(popupqueue)) && popupy <= 0 && popuptime <= 0)
{
    popupstruct = ds_list_find_value(popupqueue, 0)
    ds_list_delete(popupqueue, 0)
    popupy = 0
    popuptime = 200
    event_play_oneshot("event:/sfx/player/collect/giantpizza")
}
if (popuptime > 0)
{
    popupy += 0.025
    if (popupy > 1)
        popupy = 1
    popuptime--
}
else if (popupy > 0)
    popupy -= 0.025

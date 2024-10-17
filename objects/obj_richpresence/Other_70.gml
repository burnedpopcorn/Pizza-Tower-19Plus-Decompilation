var ev_type = ds_map_find_value(async_load, "event_type")
if (ev_type == "DiscordReady")
{
    global.discord_initialized = true
    ready = true
    show_debug_message("date: " + string(date_current_datetime()))
    np_setpresence_timestamps(date_current_datetime(), 0, false)
    np_setpresence_more("", "Peppino!", true)
    np_setpresence(details, "ptpicon", "")
}

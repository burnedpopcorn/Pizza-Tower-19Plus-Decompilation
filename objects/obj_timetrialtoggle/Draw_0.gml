draw_self()
save_open()
if ini_read_real("GameProgress", "timetrialunlocked", false)
{
    draw_sprite(clockspr, clockind, x, y)
    if (clonespr != -4)
    {
        clone_set(clonespr, cloneind)
        draw_sprite(clonespr, cloneind, x, y)
        shader_reset()
    }
}
save_close()

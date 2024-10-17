if (savestate != (0 << 0))
{
    saveiconalpha = 3
    if (savestate == (3 << 0))
        saveiconspr = spr_configsaveindicator
    else
        saveiconspr = spr_saveindicator
}
else
{
    saveiconalpha -= 0.05
    if (saveiconalpha < 0)
        saveiconalpha = 0
}
saveiconind += 0.25
saveiconind %= sprite_get_number(saveiconspr)

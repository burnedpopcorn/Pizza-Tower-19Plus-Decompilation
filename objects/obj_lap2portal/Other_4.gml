save_open()
if (ini_read_real("Highscores", global.levelname, 0) == 0 && (!(ini_read_real("GameProgress", "lap2unlocked", false))))
{
    sprite_index = spr_pizzaportaloutline
    image_alpha = 0.5
}
save_close()
if (global.laps > 0)
    instance_destroy()

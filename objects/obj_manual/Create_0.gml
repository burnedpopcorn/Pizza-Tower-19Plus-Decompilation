depth = -100
page = 0
maxpage = sprite_get_number(spr_manual) - 1
creditsstr = ""
var _creditsbuff = buffer_load(working_directory + "Data/credits.txt")
creditsstr = buffer_read(_creditsbuff, buffer_string)
buffer_delete(_creditsbuff)

stringsstruct = {}
dialoguemap = ds_map_create()
var _strfiledir = working_directory + "Data/"
var _strfile = "strings_en.json"
if file_exists(_strfiledir + _strfile)
    strings_read(_strfiledir + _strfile)
else
    show_error(string("Fatal Error! Language File \"{0}\" Not Found!", _strfile), true)
var _dialoguefolder = working_directory + "Data/DialogueTexts"
if directory_exists(_dialoguefolder)
    dialogue_read(_dialoguefolder)
else
    show_error("Fatal Error! Dialogue Folder Not Found!", true)
pausemusicID = event_instance("event:/music/pause")
backtohubroom = TitlescreenRoom
hubeject = false
pause = false
i = 0
color = make_color_rgb(121, 103, 151)
selected = 0
image_speed = 0.175
shroomspr = (there_is_follower_obj(obj_pizzakinshroom) ? spr_pausetoppins : spr_pausetoppinsmissing)
cheesespr = (there_is_follower_obj(obj_pizzakincheese) ? spr_pausetoppins : spr_pausetoppinsmissing)
tomatospr = (there_is_follower_obj(obj_pizzakintomato) ? spr_pausetoppins : spr_pausetoppinsmissing)
sausagespr = (there_is_follower_obj(obj_pizzakinsausage) ? spr_pausetoppins : spr_pausetoppinsmissing)
pineapplespr = (there_is_follower_obj(obj_pizzakinpineapple) ? spr_pausetoppins : spr_pausetoppinsmissing)
depth = -10000
draw_screen = false
w = global.maxscreenwidth * 2
h = global.maxscreenheight * 2
pausealpha = 0
surf = -1
surfbuffer = buffer_create((w * h * 4), buffer_fast, 1)
prevcollect = -1
previousrank = 0
rank_scale = 1
pause_collect = 0
collectcolor = [0]
pausecharacterspr = spr_pausepeppino
cursorx = 544
cursory = 160
stickpressed = 0
bgxspd = 0
bgyspd = 0
pause_portraitX = (-get_game_width())
pause_portraitY = (-get_game_height())
pause_toppinsX = (-get_game_width())
pause_toppinsY = get_game_height()
pause_pizzascoreX = get_game_width()
pause_pizzascoreY = get_game_height()
pause_textX = get_game_width()
pause_textY = (-get_game_height())
currentbadge = 0
secrets = 0
treasure = 0
inhub = 0
prank = 0
srank = 0
arank = 0
brank = 0
crank = 0
panic = 0
global.throwitback = false
mus = -4

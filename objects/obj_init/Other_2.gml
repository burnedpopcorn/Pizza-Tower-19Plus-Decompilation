global.playerhealth = 5
global.saveroom = ds_list_create()
global.instancelist = ds_list_create()
global.baddiecollidelist = ds_list_create()
global.collectspawn = ds_list_create()
global.escapecollect = ds_list_create()
global.baddieroom = ds_list_create()
global.escaperoom = ds_list_create()
global.waveroom = ds_list_create()
global.boxlist = ds_list_create()
global.Pal_Map = ds_map_create()
global.bg_surface = -1
global.stylethreshold = 0
global.key_inv = 0
global.keyget = 0
global.collect = 0
global.treasure = 0
global.combotime = 0
global.gotshotgun = 0
global.followers = []
global.throwitback = 0
global.panic = 0
global.stoptimer = 0
global.snickchallenge = 0
global.golfhit = 0
global.dangerouscommands = false
global.secretfound = 0
global.shotgunammo = 0
global.funmode = 0
global.mach2mode = 0
global.waiting = 0
global.building = 0
global.playmode = 0
global.lapping = 0
global.laps = 0
global.pepperhp = 100
global.palmax = 19
global.hitstun = 1
global.pizzasgiven = 0
global.givingpizza = 0
global.battle = 0
global.wavenum = 0
global.enemiesbeaten = 0
global.enemiescount = [0]
global.enemyamount = 0
global.combo = 0
global.combomilestone = 5
global.portalmode = true
global.smallpep = false
global.prank = 0
global.prankattempt = false
global.levelname = -4
global.currentbadge = (0 << 0)
global.cheeseblocknumb = 0
function checkCheese(argument0, argument1) //checkCheese@gml_Object_obj_init_Other_2
{
    return argument0.object_index == object_get_name(obj_destructibleplatform);
}

var _rooms = [ruin_1, ruin_2, ruin_3, ruin_4, ruin_5, ruin_6, ruin_7, ruin_8, ruin_9, ruin_10, ruin_11, ruin_12, ruin_13]
for (var i = 0; i < array_length(_rooms); i++)
{
    var _info = room_get_info(_rooms[i], false, true, false, false, false)
    global.cheeseblocknumb += array_length(array_filter(_info.instances, checkCheese))
}
global.enemypalette = 0
global.permshotgun = 0
global.hasgotkeybefore = 0
global.combopoints = 0
global.combopointmultipler = 1
global.combogalstate = 0
global.switchblock = false
global.voicelines = 1
for (i = 0; i < 100; i += 1)
    global.CollectablesArray[i] = 0

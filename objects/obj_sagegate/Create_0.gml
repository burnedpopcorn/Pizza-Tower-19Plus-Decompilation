function get_sprite(argument0) //get_sprite@gml_Object_obj_sagegate_Create_0
{
    if (argument0 == undefined)
        argument0 = ""
    return asset_get_index(sprite_get_name(gatespr) + argument0);
}

depth = 10
level = ""
targetDoor = "A"
checked = 0
showtext = 0
targetRoom = virtualinsanity
uparrowid = create_uparrow()
gatesurf = -1
unlocked = true
unlockedanim = 1
unlockingsound = event_instance("event:/sfx/misc/gateunlockloop")
gateind = 0
gatespd = 0.1
gatespr = spr_sagegate_entry
gateox = 78
gateoy = 142
currspr = -1
image_speed = 0.35
mask_index = spr_entrancegate

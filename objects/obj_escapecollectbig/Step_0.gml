visible = (!(place_meeting(x, y, [obj_destructibles, obj_bigdestructibles, obj_metalblock])))
image_alpha = (global.panic ? 1 : 0.5)
mask_index = (global.panic ? spr_pizzacollect : spr_masknull)

if (ds_list_find_index(global.saveroom, id) != -1)
    instance_destroy()
if (ds_list_find_index(global.collectspawn, id) != -1)
    activate = 1
if place_meeting(x, y, obj_collectspawnarea)
    area = instance_place(x, y, obj_collectspawnarea).selfID
else
    area = -4

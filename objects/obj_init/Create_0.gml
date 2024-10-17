var groupstobeloaded = ["Default", "player", "baddies", "rank", "title", "hub", "hud", "shop", "blood", "levelshared", "samplegroup"]
texturelist = array_create(0)
for (var i = 0; i < array_length(groupstobeloaded); i++)
{
    var pagetextures = texturegroup_get_textures(groupstobeloaded[i])
    for (var b = 0; b < array_length(pagetextures); b++)
        array_push(texturelist, pagetextures[b])
}
texturecount = array_length(texturelist)
randomize()
stanley = irandom(1)
alarm[0] = 5

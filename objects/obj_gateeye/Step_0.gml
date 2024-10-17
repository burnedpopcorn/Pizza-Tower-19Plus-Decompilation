visible = (!global.timetrial)
timer += 20
var _prevx = x
x = xstart + (wave((-xrange), xrange, durx, 10, timer))
y = ystart + (wave((-yrange), yrange, dury, 10, timer))
depth = startingdepth + ((x - _prevx) < 0 ? 1 : -1)

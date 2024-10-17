function scr_collide()
{
    var vy, v, vx, cDefault, skipCollision, snapPrecision, maxSnapUp, maxSnapDown, snap, ogY;
    
    grounded = false;
    vy = vsp;
    
    repeat (ceil(abs(vy)))
    {
        v = clamp(vy, -1, 1);
        
        if (!scr_solid(x, y + v))
        {
            y += v;
            vy -= v;
        }
        else
        {
            vsp = 0;
            break;
        }
    }
    
    vx = hsp;
    
    repeat (ceil(abs(vx)))
    {
        v = clamp(vx, -1, 1);
        cDefault = scr_solid(x + v, y);
        skipCollision = false;
        snapPrecision = 0.25;
        maxSnapUp = 2.75;
        maxSnapDown = 3;
        snap = 0;
        ogY = y;
        
        if (cDefault)
        {
            while (scr_solid(x + v, y))
            {
                skipCollision = true;
                y -= snapPrecision;
                snap += snapPrecision;
                
                if (snap > maxSnapUp)
                {
                    skipCollision = false;
                    y = ogY;
                    break;
                }
            }
        }
        else
        {
            skipCollision = true;
            
            while (!scr_solid(x + v, y + snapPrecision))
            {
                y += snapPrecision;
                snap += snapPrecision;
                
                if (snap > maxSnapDown)
                {
                    y = ogY;
                    break;
                }
            }
        }
        
        if (skipCollision)
        {
            x += v;
            vx -= v;
        }
        else
        {
            hsp = 0;
            break;
        }
    }
    
    if (vsp < 10)
        vsp += grav;
    
    grounded |= scr_solid(x, y + 1);
}

function scr_collide_enemy()
{
    var _selfcollision, vy, v, vx, cDefault, skipCollision, snapPrecision, maxSnapUp, maxSnapDown, snap, ogY;
    
    grounded = false;
    _selfcollision = -4;
    
    with (obj_baddiecollisionbox)
    {
        if (baddieID == other.id)
        {
            _selfcollision = id;
            y -= room_height;
        }
    }
    
    vy = vsp;
    
    repeat (ceil(abs(vy)))
    {
        v = clamp(vy, -1, 1);
        scr_enemy_destructibles(0, v);
        killed |= scr_enemy_enemies(0, v);
        
        if (!scr_solid(x, y + v))
        {
            y += v;
            vy -= v;
        }
        else
        {
            killed |= (hp <= 0);
            
            if (state == 104 && thrown)
                killed = true;
            
            vsp = 0;
            break;
        }
    }
    
    vx = hsp;
    
    repeat (ceil(abs(vx)))
    {
        v = clamp(vx, -1, 1);
        scr_enemy_destructibles(v, 0);
        killed |= scr_enemy_enemies(v, 0);
        cDefault = scr_solid(x + v, y);
        skipCollision = false;
        snapPrecision = 0.25;
        maxSnapUp = 2.75;
        maxSnapDown = 3;
        snap = 0;
        ogY = y;
        
        if (cDefault)
        {
            while (scr_solid(x + v, y))
            {
                skipCollision = true;
                y -= snapPrecision;
                snap += snapPrecision;
                
                if (snap > maxSnapUp)
                {
                    skipCollision = false;
                    y = ogY;
                    break;
                }
            }
        }
        else
        {
            skipCollision = true;
            
            while (!scr_solid(x + v, y + snapPrecision))
            {
                y += snapPrecision;
                snap += snapPrecision;
                
                if (snap > maxSnapDown)
                {
                    y = ogY;
                    break;
                }
            }
        }
        
        if (skipCollision)
        {
            x += v;
            vx -= v;
        }
        else
        {
            killed |= (hp <= 0);
            
            if (state == 104 && thrown)
                killed = true;
            
            hsp = 0;
            break;
        }
    }
    
    if (vsp < 10)
        vsp += grav;
    
    grounded |= scr_solid(x, y + 1);
    
    with (_selfcollision)
        y += room_height;
}

function scr_collide_and_destroy(argument0)
{
    var _destroyedsomething, vy, v, _i, vx, cDefault, skipCollision, snapPrecision, maxSnapUp, maxSnapDown, snap, ogY;
    
    grounded = false;
    _destroyedsomething = false;
    vy = vsp;
    
    repeat (ceil(abs(vy)))
    {
        v = clamp(vy, -1, 1);
        _i = instance_place(x, y + v, argument0);
        
        while (_i != -4)
        {
            _destroyedsomething = true;
            instance_destroy(_i);
            _i = instance_place(x, y + v, argument0);
        }
        
        if (!scr_solid(x, y + v))
        {
            y += v;
            vy -= v;
        }
        else
        {
            vsp = 0;
            break;
        }
    }
    
    vx = hsp;
    
    repeat (ceil(abs(vx)))
    {
        v = clamp(vx, -1, 1);
        _i = instance_place(x + v, y, argument0);
        
        while (_i != -4)
        {
            _destroyedsomething = true;
            instance_destroy(_i);
            _i = instance_place(x + v, y, argument0);
        }
        
        cDefault = scr_solid(x + v, y);
        skipCollision = false;
        snapPrecision = 0.25;
        maxSnapUp = 2.75;
        maxSnapDown = 3;
        snap = 0;
        ogY = y;
        
        if (cDefault)
        {
            while (scr_solid(x + v, y))
            {
                skipCollision = true;
                y -= snapPrecision;
                snap += snapPrecision;
                
                if (snap > maxSnapUp)
                {
                    skipCollision = false;
                    y = ogY;
                    break;
                }
            }
        }
        else
        {
            skipCollision = true;
            
            while (!scr_solid(x + v, y + snapPrecision))
            {
                y += snapPrecision;
                snap += snapPrecision;
                
                if (snap > maxSnapDown)
                {
                    y = ogY;
                    break;
                }
            }
        }
        
        if (skipCollision)
        {
            x += v;
            vx -= v;
        }
        else
        {
            hsp = 0;
            break;
        }
    }
    
    if (vsp < 10)
        vsp += grav;
    
    grounded |= scr_solid(x, y + 1);
    return _destroyedsomething;
}


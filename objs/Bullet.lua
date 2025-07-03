Bullet = {}

function BulletStep(self)
    ObjMove(self)

    if self.p.y<-32 then
        del(Objs, self)
    end
end

Bullet.proto = {
    p=Vec2Make(Center, ScreenSize - 16),
    s=SpriteMake(3, nil, Vec2Make(4,4)),
    spd=Vec2Make(0,-2),
    step=BulletStep,
    layer="playerbullets"
}

function BulletMake(t)
    sfx(0)

    local t = t or {} -- Allows user to pass in values
    local copy = deepcopy(ObjMake(Bullet.proto)) -- Copy the prototype table to a new table
    -- Update copy with values from t
    for k,v in pairs(t) do
        copy[k] = v
    end
    return copy -- Return the new object!
end
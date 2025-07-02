function PlayerStep(self)
    self.p = Vec2Add(self.p, Vec2Mul(Input, Vec2Make(.5,.5)))

    if Input.zp then
        add(Objs, BulletMake({
            p = ObjPosOrigin(self)
        }))
    end
end

Player = {}

Player.proto = {
    p=Vec2Make(Center, ScreenSize - 16),
    s=SpriteMake(1, nil, Vec2Make(4,4)),
    step=PlayerStep,
}

function PlayerMake(t)
    local t = t or {} -- Allows user to pass in values
    local copy = deepcopy(ObjMake(Player.proto)) -- Copy the prototype table to a new table
    -- Update copy with values from t
    for k,v in pairs(t) do
        copy[k] = v
    end
    return copy -- Return the new object!
end
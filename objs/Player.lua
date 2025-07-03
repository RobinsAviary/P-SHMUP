function PlayerStep(self)
    self.p = Vec2Add(self.p, Vec2Mul(Input, Vec2MakeS(self.spd)))

    if Input.zp then
        add(Objs, BulletMake({
            p = Vec2Sub(ObjPosOrigin(self), Vec2Make(1,3))
        }))
    end

    local s = self.s
    if Input.x < 0 then
        s.i = 7
    elseif Input.x > 0 then
        s.i = 7
        s.fh = true
    else
        local s = self.s
        s.i = 1
        s.fh = false
    end

    ObjLimitBounds(self,RectMake(32 - 4, 0, 64 + 8, 128))
end

function PlayerDraw(self)
    if Input.y != 0 then
        SprRelative(self, 9 + self.animFlag, Vec2Make(-4,-1))
    end
    --spr(9, self.p.x, self.p.y)
    DrawSelf(self)
end

Player = {}

Player.proto = {
    p=Vec2Make(Center, ScreenSize - 16),
    s=SpriteMake(1, nil, Vec2Make(4,4)),
    step=PlayerStep,
    draw=PlayerDraw,
    layer="player",
    animFlag = 0,
    hull = RectMake(-1,-1,2,2),
    spd = .75,
}

function CallbackTest(o)
    while true do
        wait(30)
        o.animFlag = 1
        wait(30)
        o.animFlag = 0
    end
end

function PlayerMake(t)
    local t = t or {} -- Allows user to pass in values
    local copy = deepcopy(ObjMake(Player.proto)) -- Copy the prototype table to a new table
    TableAdd(copy, t)

    copy.coroutines = {
        cocreate(CallbackTest)
    }

    return copy -- Return the new object!
end
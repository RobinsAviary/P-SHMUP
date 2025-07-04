Caution = {}

function AnimationCoro(o)
    while true do
        o.animOffset += .25

        if o.animOffset >= 8 then
            o.animOffset = 0
            o.animFlag = not o.animFlag
        end

        yield()
    end
end

function CautionDraw(self)
    local palFlag = self.animFlag

    for x=0,9 do
        if palFlag then
            pal(9, 10)
            pal(10, 9)
        end
        spr(12, self.p.x - self.animOffset + (x * 8), self.p.y)
        if palFlag then
            pal()
        end
        palFlag = not palFlag
    end
end

Caution.proto = {
    s = SpriteMake(12, Vec2Make(2,1)),
    layer = "caution",
    draw = CautionDraw,
    animOffset = 0,
    animFlag = false,
    p = Vec2Make(32 - 4, 128 - PlayerUpper - 3)
}

function CautionMake(t)
    local t = t or {} -- Allows user to pass in values
    local copy = deepcopy(ObjMake(Caution.proto)) -- Copy the prototype table to a new table
    TableAdd(copy, t)

    copy.coroutines = {
        cocreate(AnimationCoro),
    }

    return copy -- Return the new object!
end
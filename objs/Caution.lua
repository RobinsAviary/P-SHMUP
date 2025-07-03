--[[Caution = Obj:new({
    offset = 0,

    animTimer = 0,
    animTimerMax = 30,
    animFlag = false, -- Used for offsetting the tape for animation
    
    new = function(self, tbl)
        tbl = Obj.new(self, tbl)

        self.x = 32 - 4 - 8
        self.y = 128 - PlayerUpper - 4

        return tbl
    end,

    step=function(self)
        if self.animTimer > 0 then
            self.animTimer -= 1
        else
            self.animTimer = self.animTimerMax
            self.animFlag = not self.animFlag
            --self.animFlag = ~self.animFlag
        end

        self.offset -= .125
        if self.offset < -15 then
            self.offset += 16
        end
    end,

    draw=function(self)
        local finalOffset = self.offset

        if self.animFlag then
            finalOffset += 8
        end

        sprrpt(12, self.x + finalOffset, self.y, 6, 1, 2, 1)
    end,
})]]--

Caution = {}

function CautionStep(self)
    ObjMove(self)

    if self.p.y<-32 then
        del(Objs, self)
    end
end

Caution.proto = {
    s = SpriteMake(12, Vec2Make(2,1)),
    layer = "caution",
}

function CautionMake(t)
    local t = t or {} -- Allows user to pass in values
    local copy = deepcopy(ObjMake(Caution.proto)) -- Copy the prototype table to a new table
    TableAdd(copy, t)
    return copy -- Return the new object!
end
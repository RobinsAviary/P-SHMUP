SpriteOptions = {
    20,
    22,
    24,
    27,
}

Planet = Obj:new({
    si = 0,
    sw = 2,
    sh = 2,
    yspd = .125,

    new = function(self, tbl)
        tbl = Obj.new(self, tbl)

        tbl.x = rndrng(8, 128 - 32 + 8 - tbl:getwidth())
        tbl.y = -tbl:getheight()
        tbl.si = rnd(SpriteOptions)
        tbl.yspd = rndrng(.05,.125)

        return tbl
    end,

    step=function(self)
        if self.y > 128 then
            del(Planets, self)
        end
        self.x += -StarSpdOffset.x * .25

        local mul = .75

        if StarSpdOffset.y > 0 then
            mul *= .5
        end
        self.y += self.yspd + (-StarSpdOffset.y * mul)
    end,

    draw=function(self)
        self:drawself()
    end,
})
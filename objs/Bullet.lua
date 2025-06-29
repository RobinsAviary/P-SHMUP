Bullet = Obj:new({
    yspd = -2,

    new = function(self, tbl)
        tbl = Obj.new(self, tbl)

        sfx(0)

        return tbl
    end,

    step=function(self)
        self:move()

        if self.y < -8 then
            del(Bullets, self)
        end
    end,

    draw=function(self)
        spr(3, self.x, self.y)
    end,
})
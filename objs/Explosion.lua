Explosion = Obj:new({
    si = 11,
    timer = 15,
    new = function(self, tbl)
        tbl = Obj.new(self, tbl)

        sfx(1)
        sfx(2)
        sfx(3)

        return tbl
    end,

    step=function(self)
        if self.timer > 0 then
            self.timer -= 1
        else
            del(Objs, self)
        end
    end,

    draw=function(self)
        self:drawself()
    end,
})
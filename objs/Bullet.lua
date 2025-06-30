Bullet = Obj:new({
    yspd = -2,
    si = 3,
    player = true, -- Did the player shoot this?

    coll = makeColl(0,0,1,4),

    new = function(self, tbl)
        tbl = Obj.new(self, tbl)

        sfx(0)

        return tbl
    end,

    step=function(self)
        self:move()

        if self.y < -8 or self.y > 128 then
            del(Bullets, self) -- Deallocate once offscreen
        end
    end,

    draw=function(self)
        self:drawself()
    end,
})
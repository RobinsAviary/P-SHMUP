-- Used for enemy ships only, as they have different movement

Ship = Obj:new({
    si = 2,

    coll = makeColl(0,0,8,8),
    shottimer = 60,
    shottimermax = 60,

    new=function(self,tbl)
        tbl=Obj.new(self, tbl)

        self.x = self:getcenterx()
        self.y = 32

        return tbl
    end,

    step=function(self)
        for bullet in all(Bullets) do
            if bullet.player and collTest(self, bullet) then
                local e = Explosion:new()
                e.x = self.x
                e.y = self.y
                add(Objs, e)
                del(Bullets, bullet)
                del(Ships, self)
            end
        end

        if self.shottimer > 0 then
            self.shottimer -= 1
        else
            self.shottimer = self.shottimermax
            local b = Bullet:new()
            b.x = self.x
            b.y = self.y
            b.yspd = 1
            b.player =false

            add(Bullets, b)
        end
    end,

    draw=function(self)
        self:drawself()
    end,
})
-- Used for enemy ships only, as they have different movement

Ship = Obj:new({
    si = 2,
    yspd = .25,

    coll = makeColl(0,0,8,8),
    shottimer = 60,
    shottimermax = 60,
    bulletsprite = 26,
    bulletspeed = 1,
    bulletcoll = makeColl(1,1,2,2),
    bulletoffset = {
        x = 2,
        y = 1,
    },

    new=function(self,tbl)
        tbl=Obj.new(self, tbl)

        self.x = self:getcenterx()
        self.y = -(self.sh*8)

        return tbl
    end,

    step=function(self)
        self:move()

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
            b.x = self.x + self.bulletoffset.x
            b.y = self.y + self.bulletoffset.y
            b.yspd = self.bulletspeed
            b.player = false
            b.coll = self.bulletcoll
            b.si = self.bulletsprite

            add(Bullets, b)
        end

        if self.y>=128 then
            self.y -= 128 + (self.sh * 8)
        end
    end,

    draw=function(self)
        self:drawself()
    end,
})
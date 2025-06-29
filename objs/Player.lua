Player = Obj:new({
    upperBound = 64,

    sprindex = 1,
    fliph = false,

    new=function(self,tbl)
        tbl=Obj.new(self, tbl)

        tbl.x = 60
        tbl.y = 128 - 16

        return tbl
    end,

    step=function(self)
        self.x += Input.x
        self.y += Input.y

        local leftbound = 32 - 4 - 3
        
        if Input.x != 0 then
            self.sprindex = 7
        else
            self.sprindex = 1
        end

        if Input.x > 0 then
            self.fliph = true
        else
            self.fliph = false
        end

        if self.x < leftbound then
            self.x = leftbound
        end

        if self.x > 128 - leftbound - 8 then
           self.x = 128 - leftbound - 8
        end

        if self.y > 128-8+3 then
            self.y = 128-8+3
        end

        if Input.zp then
            local bullet = Bullet:new()

            bullet.x = self.x + 3
            bullet.y = self.y + 1

            add(Bullets,bullet)
        end
    end,

    draw=function(self)
        if (Input.y != 0) then
            spr(9 + time() * 5 % 2, self.x, self.y + 2)
        end

        spr(self.sprindex,self.x, self.y, 1, 1, self.fliph)
    end,
})

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
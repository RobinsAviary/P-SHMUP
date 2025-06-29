--obj_vector2

--obj_gameobj

Obj = {
    x = 0,
    y = 0,
    xspd = 0,
    yspd = 0,

    new=function(self, tbl)
        tbl=tbl or {}
            setmetatable(tbl, {
                __index=self,
            })
        return tbl
    end,

    step=function(self)
        
    end,

    move=function(self)
        self.x += self.xspd
        self.y += self.yspd
    end,

    draw=function(self)
  
    end,
}

Star = Obj:new({
    size = 0,
    color = 1,
    draw=function(self)
        rect(self.x, self.y, self.x + self.size, self.y + self.size, self.color)
    end,

    new=function(self,tbl)
        tbl=Obj.new(self, tbl)
        
        tbl.y = rnd(128)
        tbl:randomize()

        return tbl
    end,

    step=function(self)
        self:move()

        if self.y > 128 then
            self.y = -8
            self:randomize()
        end

        local sidebounds = 32 - 4

        if self.x < sidebounds then
            self.x += 64 + 8
            self.y += rndrng(-5,5)
        end

        if self.x > 128 - sidebounds then
            self.x -= 64 + 8
            self.y += rndrng(-5,5)
        end

        self.x += -Input.x * (self.yspd / 2)
    end,

    randomize=function(self)
        self.x = rndrng(32 - 4,32 + 64 + 4 - self.size)
        self.yspd = rndrng(0.5, 1.25)
        if self.yspd < .88 then
            --elf.size = 0
            self.color = 1
        elseif self.yspd > 1.12 then
            --self.size = 1
            self.color = 6
        else
            self.color = 13
        end
    end,
})

Player = Obj:new({
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
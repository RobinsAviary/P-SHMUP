Player = Obj:new({
    si = 1,
    palFlag = true,

    new=function(self,tbl)
        tbl=Obj.new(self, tbl)

        tbl.x = self:getcenterx()
        tbl.y = 128 - 16

        return tbl
    end,

    step=function(self)
        self.x += Input.x
        self.y += Input.y

        local leftbound = 32 - 4 - 3
        
        if Input.x != 0 then
            self.si = 7
        else
            self.si = 1
        end

        if Input.x > 0 then
            self.sfh = true
        else
            self.sfh = false
        end

        -- bounds checking
        if self.x < leftbound then
            self.x = leftbound
        end

        if self.x > 128 - leftbound - 8 then
           self.x = 128 - leftbound - 8
        end

        if self.y > 128-8+3 then
            self.y = 128-8+3
        end

        if self.y < 128 - PlayerUpper - 4 then
            self.y = 128 - PlayerUpper - 4
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
        if self.palFlag then
            pal(9, 1)
            pal(1, 7)
            --pal(13, 1)
            pal(2, 6)
            pal(14, 13)
            --palall(5)
        end
        self:drawself()
        pal()
    end,
})
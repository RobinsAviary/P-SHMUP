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
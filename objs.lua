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
    end,

    randomize=function(self)
        self.x = rndrng(32,32 + 64)
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
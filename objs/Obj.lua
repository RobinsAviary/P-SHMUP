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
Obj = {
    x = 0,
    y = 0,
    xspd = 0,
    yspd = 0,
    collflag = false,
    coll = {
        x = 0,
        y = 0,
        w = 0,
        h = 0,
    },
    -- Sprite flags
    si = 0, -- index
    sw = 1, -- width
    sh = 1, -- height
    sfh = false, -- flip horizontal
    sfv = false, -- flip vertical

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

    drawself=function(self)
        spr(self.si, self.x, self.y, self.sw, self.sh, self.sfh, self.sfv)
    end,

    collision=function(self,other)

    end,
}
-- Used for enemy ships only, as they have different movement

Ship = Obj:new({
    new=function(self,tbl)
        tbl=Obj.new(self, tbl)

        self.x = 128 /2

        return tbl
    end,

    step=function(self)

    end,

    draw=function(self)
        spr(2, self.x, self.y)
    end,
})
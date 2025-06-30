-- Used for enemy ships only, as they have different movement

Ship = Obj:new({
    si = 2,
    new=function(self,tbl)
        tbl=Obj.new(self, tbl)

        self.x = 128 /2

        return tbl
    end,

    step=function(self)

    end,

    draw=function(self)
        self:drawself()
    end,
})
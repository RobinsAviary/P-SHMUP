StarSpdOffset = {
    x = 0,
    y = 0,
}

-- Responsible for the player movement effects
function UpdateStarSpeedOffset()
    StarSpdOffset.x = stween(StarSpdOffset.x, Input.x, .05)

    local ygoal = StarSpdOffset.y

    if Input.y < 0 then
        ygoal = -.25
    end

    if Input.y > 0 then
        ygoal = .05
    end

    StarSpdOffset.y = stween(ygoal, Input.y, .05)
end

function IterateStars()
    local LowerLayer = {}
    local MiddleLayer = {}
    local UpperLayer = {}

    for star in all(Stars) do
        star:step()

        if star.layer == 0 then
            add(LowerLayer, star)
        elseif star.layer == 1 then
            add(MiddleLayer, star)
        elseif star.layer == 2 then
            add(UpperLayer, star)
        end
    end

    iterateDraw(LowerLayer)
    iterateDraw(MiddleLayer)
    iterateDraw(UpperLayer)
end

Star = Obj:new({
    color = 1,
    layer = 0, -- Higher are above
    draw=function(self)
        if self.si == 0 then
            local dodraw = true
            if self.color == 1 or self.color == 6 then
                if pget(self.x, self.y) != 0 then
                    dodraw = false
                end
            end
            if dodraw then
                pset(self.x, self.y, self.color)
            end
        else
            self:drawself()
        end
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

        local spdDiv = self.yspd / 2

        self.x += -StarSpdOffset.x * spdDiv * 2 -- Multiply by star speed for parallax
        self.y += -StarSpdOffset.y * spdDiv * 5
    end,

    randomize=function(self)
        self.si = 0

        self.x = rndrng(32 - 4,32 + 64 + 4)
        self.yspd = rndrng(0.5, 1.75)
        if self.yspd < .88 then
            self.color = 1
            self.layer = 0
        elseif self.yspd > 1.12 then
            self.color = 6
            self.layer = 1
            if flr(rnd(10)) == 0 then
                self.si = 15
            end
        else
            self.color = 13
            self.layer = 2
            if flr(rnd(7)) == 0 then
                self.si = 14
            end
        end
    end,
})
function rndrng(mn, mx)
    return mn + rnd(mx - mn)
end

function iteratecollection(coll)
	for item in all(coll) do
		item:step()
		item:draw()
	end
end

function stween(val, goal, amnt)
	return val + (goal - val) * amnt
end

function btndly(delay, freq)
	poke(0x5f5c, delay, freq) 
end

Vector2 = {
	x = 0,
	y = 0,
   }
   
   function Vector2:new(xpos, ypos) 
	t = {}
	setmetatable(t, self)
	self.__index = self
	self.x = xpos or 0;
	self.y = ypos or 0;
   
	return t
   end

function Vector2:Add(vec)
 self.x += vec.x
 self.y += vec.y
end
function rndrng(min, max)
    return min + rnd(max - min)
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

function scalartoperc(scalar)
	return sub(tostr(scalar * 100), 0, 5) .. "%"
end

function getramusage()
	return scalartoperc(stat(0)/2048)
end

function getdebuginfo()
	return "ram: " .. getramusage() .. "\ncpu: " ..  scalartoperc(stat(1))
end

function makeBounds(xPos, yPos, width, height)
	return {
		x = xPos,
		y = yPos,
		w = width,
		h = height,
	}
end

function absBounds(bounds)
	return makeBounds(abs(bounds.x), abs(bounds.y), abs(bounds.w), abs(bounds.h))
end

function coll(a, b)
	a = absBounds(a)
	b = absBounds(b)

	if a.x1 > a.x2 or
	a.y1 > b.y2 or
	b.x1 > a.x2 or
	b.y1 > a.y2 then
		return false
	end

	return true
end
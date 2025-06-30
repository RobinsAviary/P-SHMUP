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

function scalartoperc(scalar)
	return sub(tostr(scalar * 100), 0, 5) .. "%"
end

function getramusage()
	return scalartoperc(stat(0)/2048)
end

function getdebuginfo()
	return "ram: " .. getramusage() .. "\ncpu: " ..  scalartoperc(stat(1))
end

function makeBounds(x, y, x2, y2)
	return {
		x = x,
		y = y,
		x2 = x2,
		y2 = y2,
	}
end

function absBounds(bounds)
	return makeBounds(abs(bounds.x), abs(bounds.y), abs(bounds.x2), abs(bounds.y2))
end

function collTest(obj1, obj2)
	local a = {}
	local b = {}
	a.x = obj1.x + obj1.coll.x
	a.y = obj1.y + obj1.coll.y
	b.x = obj2.x + obj2.coll.x
	b.y = obj2.y + obj2.coll.y
	
	a.x2 = a.x + obj1.coll.w
	a.y2 = a.y + obj1.coll.h
	b.x2 = b.x + obj2.coll.w
	b.y2 = b.y + obj2.coll.h

	a = absBounds(a)
	b = absBounds(b)

	if a.x > b.x2 or
	a.y > b.y2 or
	b.x > a.x2 or
	b.y > a.y2 then
		return false
	end

	return true
end

function clamp(val, mn, mx)
	local lower = val >= min
	local upper = val <= mx

	if lower and upper then 
		return val
	elseif lower == false then
		return lower
	else
		return upper
	end
end

function remap(lower1, upper1, lower2, upper2, value)
	return (scalar(lower1, upper1, value) * (upper2 - lower2)) + lower2
end

function scalar(lower, upper, value)
	return (value - lower) / (upper - lower)
end

function sprrpt(ind, x, y, rw, rh, sw, sh)
	sw = sw or 1;
	sh = sh or 1;

	for xx=0,rw-1 do
		for yy=0,rh-1 do
			spr(ind, x + (xx * (sw * 8)), y + (yy * (sh * 8)), sw, sh)
		end
	end
end

function makeColl(x, y, w, h)
	return {
		x = x,
		y = y,
		w = w,
		h = h,
	}
end
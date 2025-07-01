function iteratecollection(coll)
	for item in all(coll) do
		item:step()
		item:draw()
	end
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

function iterateDraw(collection)
	for item in all(collection) do
		item:draw()
	end
end

function lerp(a,b,t)
	return a+(b-a)*t
end

function palall(col)
	for i=0,15 do
		pal(i, col)
	end
end
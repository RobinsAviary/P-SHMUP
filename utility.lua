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
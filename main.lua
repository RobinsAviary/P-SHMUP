-- Main

function _init()
	cls(0) -- Clear screen
	drawborder()
	clip(32 - 4, 0, 64 + 8, 128)
 	btndly(3,3)
	add(Objs, PlayerMake())
	add(Objs, CautionMake())
	--test = Player
	--test.p.x = 0
	--add(Objs, Player)
end

function drawborder()
 	for i=0,16 do
		local y = (i*8) - 2
		map(0,0,0,y,4,1)
		map(12,0,96,y, 4, 1)
 	end
end

function preobjUpdates()
	updateInput()
end

function IterateLayers(objs, str)
	for line in all(split(str, "\n", false)) do
		IterateLayer(objs, line)
	end

	IterateLayer(objs, nil)
end

local layers = [[
caution
playerbullets
player]]

function IterateAllCoroutines()
	iteratecoroutines()
	IterateObjCoroutines(Objs)
end

function Update()
	IterateAllCoroutines()

	IterateCollection(Objs, "step")
	IterateLayers(Objs, layers) -- Draw
end

-- WE'RE RUNNIN AT SUPERSPEED BABY
function _update60()
	preobjUpdates()
	rectfill(32-4, 0, 32 + 64 + 8, 128, 0) -- Clear only what we need

	Update()

	--map(0,0,0,0,16,16)

	IterateAllCoroutines()

	print(getdebuginfo(),32-4,128-12,7)
end
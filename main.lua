function _init()
 	btndly(3,3)
	add(Objs, PlayerMake())
	add(Objs, CautionMake())
	--test = Player
	--test.p.x = 0
	--add(Objs, Player)
end

function drawborder()
 	for i=0,16 do
  		map(0,0,0,(i*8) - 2,16,1)
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
 	cls(0) -- clear screen

	drawborder()

	Update()

	IterateAllCoroutines()

	print(getdebuginfo(),0,0,7)
end
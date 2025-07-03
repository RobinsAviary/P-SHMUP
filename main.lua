function _init()
 	btndly(3,3)
	add(Objs, PlayerMake())
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

-- WE'RE RUNNIN AT SUPERSPEED BABY
function _update60()
	preobjUpdates()
 	cls(0) -- clear screen

	drawborder()
	iteratecoroutines()
	IterateObjCoroutines(Objs)
	IterateCollection(Objs, "step")
	IterateLayer(Objs, "playerbullets")
	IterateLayer(Objs, "player")
	IterateLayer(Objs, nil)
	
	print(getdebuginfo(),0,0,7)
end
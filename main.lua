function _init()
 	btndly(3,3)
 	for i=0,31 do
  		add(Stars, Star:new())
 	end
	player = Player:new()
	add(Players, player)
	add(Ships, Ship:new())
	caution = Caution:new()
	add(CautionBar, caution)
	--[[async(function()


		while true do
			wait(60)	
			add(Ships, Ship:new())
		end
	end)]]--
end

function drawborder()
 	for i=0,16 do
  		map(0,0,0,(i*8) - 2,16,1)
 	end
end

-- Effectively layers
Layers = {
	CautionBar,
	Players,
	Bullets,
	Ships,
	Objs,
}

function managePlanets()
	if PlanetTimer > 0 then
		PlanetTimer -= 1
	else
		PlanetTimer = getRandomPlanetTime()
		add(Planets, Planet:new())
	end
end

function preobjUpdates()
	updateInput()
	UpdateStarSpeedOffset()
	managePlanets()
end

function IterateCollections()
	iteratecollection(Planets)
	IterateStars()

	for layer in all(Layers) do
		iteratecollection(layer)
	end
end

function getRandomPlanetTime()
	return flr(rndrng(10,15) * 60)
end

PlanetTimer = getRandomPlanetTime() / 4

-- WE'RE RUNNIN AT SUPERSPEED BABY
function _update60()
	preobjUpdates()
 	cls(0) -- clear screen
	
	IterateCollections()
	iteratecoroutines()

	drawborder()
	print(getdebuginfo(),0,0,7)
end
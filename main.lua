function _init()
 	btndly(3,3)
 	for i=0,31 do
  		add(Stars, Star:new())
 	end
	player = Player:new()
	add(Objs, player)
	add(Ships, Ship:new())
	caution = Caution:new()
	add(CautionBar, caution)
end

function drawhudBG()
 	for i=0,16 do
  		map(0,0,0,(i*8) - 2,16,1)
 	end
end

-- Effectively layers
Collections = {
	Stars,
	CautionBar,
	Bullets,
	Ships,
	Objs,
}

function preobjUpdates()
	updateInput()
	UpdateStarSpeedOffset()
end

function IterateCollections()
	for collection in all(Collections) do
		iteratecollection(collection)
	end
end

-- WE'RE RUNNIN AT SUPERSPEED BABY
function _update60()
	preobjUpdates()
 	cls(0) -- clear screen
	IterateCollections()

	drawhudBG()
	print(getdebuginfo(),0,0,7)
end
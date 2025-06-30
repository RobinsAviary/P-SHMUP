function _init()
 	btndly(3,3)
 	for i=0,31 do
  		add(Stars, Star:new())
 	end
	player = Player:new()
	add(Objs, player)
	add(Objs, Ship:new())
	caution = Caution:new()
	add(CautionBar, caution)
end

function drawhudBG()
 	for i=0,16 do
  		map(0,0,0,(i*8) - 2,16,1)
 	end
end

-- WE'RE RUNNIN AT SUPERSPEED BABY
function _update60()
	updateInput()
	UpdateStarSpeedOffset()
 	cls(0) -- clear screen
	iteratecollection(Stars)
	iteratecollection(CautionBar)
	iteratecollection(Bullets)
 	iteratecollection(Objs)
	drawhudBG()
	print(getdebuginfo(),0,0,7)
end
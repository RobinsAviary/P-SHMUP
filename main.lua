function _init()
 	btndly(5,5) -- disable btnp multiples
 	for i=0,31 do
  		add(Stars, Star:new())
 	end
	add(Objs, Player:new())
end

function drawhudBG()
 	for i=0,16 do
  		map(0,0,0,(i*8) - 1,16,1)
 	end
end

-- WE'RE RUNNIN AT SUPERSPEED BABY
function _update60()
	updateInput()
 	cls(0) -- clear screen
 	iteratecollection(Stars)
	iteratecollection(Bullets)
 	iteratecollection(Objs)
	drawhudBG()
	print(getdebuginfo(),0,0,7)
end
function _init()
 	btndly(5,5) -- disable btnp multiples
 	for i=0,31 do
  		add(Objs, Star:new())
 	end
end

function drawhudBG()
 	for i=0,16 do
  		map(0,0,0,(i*8) - 1,16,1)
 	end
end

-- WE'RE RUNNIN AT SUPERSPEED BABY
function _update60()
 	cls(0) -- clear screen
 	drawhudBG()
 	iteratecollection(Stars)
 	iteratecollection(Objs)
 	print(getdebuginfo(),0,0,7)
end
Coroutines = {}

function iteratecoroutines()
    for c in all(Coroutines) do
		if costatus(c) == "dead" then
			del(Coroutines, c)
		else
			coresume(c)
		end
	end
end
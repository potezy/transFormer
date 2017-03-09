

function string:split(sep) --credit to lua user manual
    local sep, fields = sep or ":", {}
    local pattern = string.format("([^%s]+)", sep)
    self:gsub(pattern, function(c) fields[#fields+1] = c end)
    return fields
 end


function parseFile(f)
	 local lines = {}
	 local s = 0
	 local n = "line.png"
	 for line in io.lines(f) do
	     table.insert(lines, line)
	     s = s + 1
	 end
	 --print(s)
	 for i = 1, s do
	     ln = lines[i]:split(" ")
	     --args = lines[i+1]:split(" ")
	     if (ln[1] == "line") then
	     	args = lines[i+1]:split(" ")
		--print(args[1],args[2])
	     	addEdge(eMatrix, tonumber(args[1]), tonumber(args[2]),tonumber(args[3]),tonumber(args[4]),tonumber(args[5]), tonumber(args[6]))
		i = i +1
	     elseif (ln[i] == "indent") then
	     	    identify(tMatrix)
	     elseif (ln[i] == "scale") then
	     	    args = lines[i+1]:split(" ")
		    scale(args[1], args[2] , args[3])
		    i = i+1
	     elseif (ln[i] == "move") then 
	     	    args = lines[i+1]:split(" ")
	     	    translate(args[1], args[2],args[3])
		    i = i+1
	     elseif (ln[1] == "rotate") then
	     	    args = lines[i+1]:split(" ")
	     	    rotate(args[1], math.rad(args[2]))
		    i = i +1
             elseif (ln[1] == "apply") then
	     	    matrixMult(tMatrix, eMatrix)
	     elseif (ln[1] == "save") then
	     	    draw(board,eMatrix)
		    save(board, args[1])
		    n = args[1]
	     elseif (ln[1] == "display") then
	     	    local s = "display " .. n 
	     	    os.execute(s) 
	     end
 	 end
end

--parseFile("commands")
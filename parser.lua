require 'transformations'


function string:split(sep) --credit to lua user manual
    local sep, fields = sep or ":", {}
    local pattern = string.format("([^%s]+)", sep)
    self:gsub(pattern, function(c) fields[#fields+1] = c end)
    return fields
 end



function parseFile(f)
	 local lines = {}
	 for line in io.lines(f) do
	     table.insert(lines, line)
	 end
	 
	 print((lines[1]:split(" "))[1])
	 
	 
	 

end

parseFile("commands")
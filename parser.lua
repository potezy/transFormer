function parseFile(f)
	 file = io.open(f , "r")
	 local lines = {}
	 for line in io.lines() do
	     table.insert(lines, line)
	     print(1)
	 end
	 io.close(file)
	 for i , l in ipairs(lines) do
	     print(l , "\n")
	 end
end

parseFile("commands")
require 'matrix'
require 'draw'
require 'display'
require 'parser'

pMatrix = {{},{},{},{}}

function edgeMaker(matrix)
	 for x = 0, 499 do
	     for y = 0, 499 do
	     	 if((x-250)^2 == y) then addEdge(matrix, 250,250,0,x,y,0) end
       	     end
	end
	addEdge(matrix, 0,0,0,250,500,0)
	addEdge(matrix, 250,250,0,0,500,0)
 	addEdge(matrix,	250,250,0,500,0,0)
	addEdge(matrix, 250,250,0,500,500,0)

	addEdge(matrix, 250,250,0,375,0,0)	
	addEdge(matrix, 250,250,0,375,500,0)
	addEdge(matrix, 250,250,0,500,375,0)
	addEdge(matrix, 250,250,0,0,375,0)
end

function main()
	 clear_screen(board)
	 edgeMaker(pMatrix)
	 draw(board, pMatrix)
	 save_ppm(board)
	 os.execute("display line.ppm")
end
main()
print("file is saved as line.ppm\n")
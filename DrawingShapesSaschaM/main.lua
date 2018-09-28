--Name: Sascha Motz
--Course: ICS2O/3C
-- Tittle: Display Shapes
-- This program displays different shapes/polygons with its name underneath it on iPad simulator 

local textObject = textPentagon



-- Colour and vertices of triangle 
local verticesTriangle = {50,100, 100,-100, -100,-100 }
triangle = display.newPolygon (150, 150, verticesTriangle )
triangle:setFillColor( 1, 0, 0 )

--Colour and vertices of Trapizoid
local verticesPentagon = { -50,100, 50,100, 100,0, -50,0, -100,0 }
pentagon = display.newPolygon ( 400, 150, verticesPentagon)
pentagon:setFillColor( 255/255, 128/255, 0 )

--Colour and vertices of Quadrilateral
local verticesQuadrilateral = { -100,50, 50,50, 100,-50, -50,-50 }
Quadrilateral = display.newPolygon ( 650, 150, verticesQuadrilateral)
Quadrilateral:setFillColor( 255/255, 255/255, 0 )

--Colour and vertices of Hexagon
local verticesHexagon = { -100,50, 50,50, 100,-50, -50,-50 }
Hexagon = display.newPolygon ( 650, 150, verticesQuadrilateral)
Hexagon:setFillColor( 0, 255/255, 0 )




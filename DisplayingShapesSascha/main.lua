--Name: Sascha Motz
--Course: ICS2O/3C
-- Tittle: Display Shapes
-- This program displays different shapes/polygons with its name underneath it on iPad simulator 
local offset = 165
local S1x = 100
local A1x = S1x+offset
local S2x = A1x+offset
local C1x = S2x+offset
local H1x = C1x+offset
local A2x = H1x+offset
local halfH = display.contentHeight * 0.5

--local vertices = { 0,-110, 27,-35, 105,-35, 43,16, 65,90, 0,45, -65,90, -43,15, -105,-35, -27,-35, }
-- { 0,600, 200,500, 200,450, 50,450, 50,275, 200,275, 200,0, 0,0, 0,50, 150,50, 150,225, 0,225 }
local Svertices = { 0,250, -150,250, -150,200, -50,200, -50,150, -150,150, -150,0, 0,0, 0,50, -100,50, -100,100, 0,100 }
-- { 0,250, -150,250, -150,0, -100,0, -100,125, -50,125, -50,0, 0,0 }
local Avertices = { 0,0, -150,0, -150,250, -100,250, -100,125, -50,125, -50,250, 0,250 }

local Cvertices = { 0,0, 150,0, 150,50, 50,50, 50,200, 150,200, 150,250, 0,250 }

local Hvertices = { 0,0, 50,0, 50,100, 100,100, 100,0, 150,0, 150,250, 100,250, 100,150, 50,150, 50,250, 0,250 }

local AholeVertices = { 50,50, 100,50, 100,100, 50,100 }


local S1 = display.newPolygon( S1x, halfH, Svertices )
S1.strokeWidth = 10
S1:setStrokeColor( 1, 0, 0 )

local A1 = display.newPolygon( A1x, halfH, Avertices )
A1.strokeWidth = 10
A1:setStrokeColor( 255/255, 128/255, 0)

local Ahole1 = display.newPolygon( A1x, halfH-60, AholeVertices )
Ahole1.fill = { type="image", filename="Icon-80.png" }
Ahole1.strokeWidth = 10
Ahole1:setStrokeColor( 255/255, 255/255, 0 )

local S2 = display.newPolygon( S2x, halfH, Svertices )
S2.strokeWidth = 10
S2:setStrokeColor( 1, 0, 0 )

local C1 = display.newPolygon( C1x, halfH, Cvertices )
C1.strokeWidth = 10
C1:setStrokeColor( 1, 0, 0 )

local H1 = display.newPolygon( H1x, halfH, Hvertices )
H1.strokeWidth = 10
H1:setStrokeColor( 1, 0, 0 )

local A2 = display.newPolygon( A2x, halfH, Avertices )
A2.strokeWidth = 10
A2:setStrokeColor( 1, 0, 0 )

local Ahole2 = display.newPolygon( A2x, halfH-60, AholeVertices )
Ahole2.fill = { type="image", filename="Icon-80.png" }
Ahole2.strokeWidth = 10
Ahole2:setStrokeColor( 1, 0, 0 )

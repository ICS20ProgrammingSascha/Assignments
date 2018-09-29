--Name: Sascha Motz
--Course: ICS2O/3C
-- Title: Display Shapes
-- This program displays different shapes/polygons with its name underneath it on iPad simulator 

-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)
-- sets the background colour
display.setDefault("background", 192/255, 192/255, 192/255 )
-- half the height of the the display
local halfH = display.contentHeight * 0.5
-- top polygon type text location
local TopTextH = halfH - 150
-- bottom polygon type text location
local BottomTextH = halfH + 150
-- size of the polygon type text
local textSize = 40
-- spacing of the polygons
local polygonSpacing = 165
---------------------------------------------------------
-- Vertices for the S polygons
local Svertices = { -75,-125, 75,-125, 75,-75, -25,-75, -25,-25, 75,-25, 75,125, -75,125, -75,75, 25,75, 25,25, -75,25 }
-- vertices for the A polygons
local Avertices = { -75,-125, 75,-125, 75,125, 25,125, 25,0, -25,0, -25,125, -75,125 }
--Vertices for the C polygon
local Cvertices = { -75,-125, 75,-125, 75,-75, -25,-75, -25,75, 75,75, 75,125, -75,125 }
-- Vertices for the H polygon
local Hvertices = { -75,-125, -25,-125, -25,-25, 25,-25, 25,-125, 75,-125, 75,125, 25,125, 25,25, -25,25, -25,125, -75,125 }
-- Vertices for the A polygon holes
local AholeVertices = { -25,100, 25,100, 25,25, -25,25 }
-----------------------------------------------------------------------------------------------------------------------------------------
-- location of the first polygon
local S1x = 100
-- create S1 polygon
local S1 = display.newPolygon( S1x, halfH, Svertices )
-- set width of the border
S1.strokeWidth = 5
-- set border colour
S1:setStrokeColor( 0, 0, 0 )
-- set colour for the polygon
S1:setFillColor( 1, 0, 0 )

-- create S1 text
local S1Text = display.newText("Dodecagon", S1x, BottomTextH, Arial, textSize)
-- set the colour of S1 text
S1Text:setTextColor( 1, 0, 0 )
---------------------------------------------------------------------------------------------
-- location of the polygon
local A1x = S1x+polygonSpacing
-- create A1 polygon
local A1 = display.newPolygon( A1x, halfH, Avertices )
-- set width of the border
A1.strokeWidth = 5
-- set border colour
A1:setStrokeColor( 0, 0, 0 )
-- set colour for the polygon
A1:setFillColor( 255/255, 128/255, 0 )

-- create A1 text
local A1Text = display.newText("Octagon", A1x, TopTextH, Arial, textSize)
-- set the colour of the newText
A1Text:setTextColor( 255/255, 128/255, 0 )
--------------------------------------------------------------
-- create AHole1 polygon
local Ahole1 = display.newPolygon( A1x, halfH-60, AholeVertices )
-- set image for Ahole1 polygon
Ahole1.fill = { type="image", filename="mountains.jpg" }
-- set width of the border
Ahole1.strokeWidth = 5
--set colour of the border
Ahole1:setStrokeColor( 0, 0, 0 )  
-------------------------------------------------------------
-- location of the polygon
local S2x = A1x+polygonSpacing
-- create S1 polygon
local S2 = display.newPolygon( S2x, halfH, Svertices )
-- set width of the border
S2.strokeWidth = 5
-- set colour of the border
S2:setStrokeColor( 0, 0, 0 )
-- set colour for the polygon
S2:setFillColor( 255/255, 255/255, 0 )

-- create S2 text
local S2Text = display.newText("Dodecagon", S2x, BottomTextH, Arial, textSize)
-- set the colour of the newText
S2Text:setTextColor( 255/255, 255/255, 0 )
--------------------------------------------------------------------------------
-- location of the polygon
local C1x = S2x+polygonSpacing
-- create C1 polygon
local C1 = display.newPolygon( C1x, halfH, Cvertices )
-- set width of the border
C1.strokeWidth = 5
-- set colour of the border
C1:setStrokeColor( 0, 0, 0 )
-- set colour of the polygon
C1:setFillColor( 0, 255/255, 0 )

-- create C1 text
local C1Text = display.newText("Octagon", C1x, TopTextH, Arial, textSize)
-- set the colour of the newText
C1Text:setTextColor( 0, 255/255, 0 )
--------------------------------------------------------------------------------
-- location of the polygon
local H1x = C1x+polygonSpacing
-- create H1 polygon
local H1 = display.newPolygon( H1x, halfH, Hvertices )
-- set width of the border
H1.strokeWidth = 5
-- set colour of the border
H1:setStrokeColor( 0, 0, 0 )
-- set colour of the polygon
H1:setFillColor( 0, 0, 255/255 )

-- create H1 text
local H1Text = display.newText("Dodecagon", H1x, BottomTextH, Arial, textSize)
-- set the colour of the newText
H1Text:setTextColor( 0, 0, 255/255 )
---------------------------------------------------------------------------------------
-- location of the polygon
local A2x = H1x+polygonSpacing
-- create A2 polygon
local A2 = display.newPolygon( A2x, halfH, Avertices )
--set width of the border
A2.strokeWidth = 5
-- set colour of the border
A2:setStrokeColor( 0, 0, 0 )
--set colour of the polygon
A2:setFillColor( 1, 0, 5 )

-- create A2 text
local A2Text = display.newText("Octagon", A2x, TopTextH, Arial, textSize)
-- set the colour of the newText
A2Text:setTextColor( 1, 0, 5 )
-----------------------------------------------------------------------------------------

-- create AHole2 polygon
local Ahole2 = display.newPolygon( A2x, halfH-60, AholeVertices )
-- set image for AHole2 
Ahole2.fill = { type="image", filename="mountains.jpg" }
-- set width of the border
Ahole2.strokeWidth = 5
-- set colour of the border
Ahole2:setStrokeColor( 0, 0, 0 )
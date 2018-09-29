--Name: Sascha Motz
--Course: ICS2O/3C
-- Tittle: Display Shapes
-- This program displays different shapes/polygons with its name underneath it on iPad simulator 

-- hide the staus bar
display.setStatusBar(display.HiddenStatusBar)

-- sets the background colour
display.setDefault("background", 192/255, 192/255, 192/255 )
-- spacing for the polygons
local letterSpacing = 165
-- location of the polygon
local S1x = 100
-- location of the polygon
local A1x = S1x+letterSpacing
-- location of the polygon
local S2x = A1x+letterSpacing
-- location of the polygon
local C1x = S2x+letterSpacing
-- location of the polygon
local H1x = C1x+letterSpacing
-- location of the polygon
local A2x = H1x+letterSpacing
-- half of the display height
local halfH = display.contentHeight * 0.5
-- text where the polygons go on top
local TopTextH = halfH - 150
-- text where the polygons go on the bottom
local BottomTextH = halfH + 150
-- size of the text
local textSize = 40
---------------------------------------------------------
-- Vertices for the letter A
local Svertices = { -75,-125, 75,-125, 75,-75, -25,-75, -25,-25, 75,-25, 75,125, -75,125, -75,75, 25,75, 25,25, -75,25 }
-- vertices for the letter A
local Avertices = { -75,-125, 75,-125, 75,125, 25,125, 25,0, -25,0, -25,125, -75,125 }
--Vertices for the letter C
local Cvertices = { -75,-125, 75,-125, 75,-75, -25,-75, -25,75, 75,75, 75,125, -75,125 }
-- Vertices for the letter H
local Hvertices = { -75,-125, -25,-125, -25,-25, 25,-25, 25,-125, 75,-125, 75,125, 25,125, 25,25, -25,25, -25,125, -75,125 }
-- Vertices for the hole in the A
local AholeVertices = { -25,100, 25,100, 25,25, -25,25 }

-- Colour, width, and height for S1
local S1 = display.newPolygon( S1x, halfH, Svertices )
-- set width of the border
S1.strokeWidth = 5
-- set border colour
S1:setStrokeColor( 0, 0, 0 )
-- set colour for the polygon
S1:setFillColor( 1, 0, 0 )
--------------------------
-- name of polygon
local S1Text = display.newText("Dodecagon", S1x, BottomTextH, Arial, textSize)
-- set the colour of the newText
S1Text:setTextColor( 1, 0, 0 )
--------------------------------------------
-- Colour, width, and height for A1
local A1 = display.newPolygon( A1x, halfH, Avertices )
-- set width of the border
A1.strokeWidth = 5
-- set border colour
A1:setStrokeColor( 0, 0, 0 )
-- set colour for the polygon
A1:setFillColor( 255/255, 128/255, 0 )
---------------------------------------
-- name of polygon
local A1Text = display.newText("Octagon", A1x, TopTextH, Arial, textSize)
-- set the colour of the newText
A1Text:setTextColor( 255/255, 128/255, 0 )
--------------------------------------------------------------
-- Colour, width, image, and height for AHole1
local Ahole1 = display.newPolygon( A1x, halfH-60, AholeVertices )
-- set image for the hole of the polygon
Ahole1.fill = { type="image", filename="mountains.jpg" }
-- set width of the border
Ahole1.strokeWidth = 5
--set colour of the border
Ahole1:setStrokeColor( 0, 0, 0 )  

-- Colour, width, and height for S2
local S2 = display.newPolygon( S2x, halfH, Svertices )
-- set width of the border
S2.strokeWidth = 5
-- set colour of the border
S2:setStrokeColor( 0, 0, 0 )
-- set colour of the polygon
S2:setFillColor( 255/255, 255/255, 0 )
-------------------------------------------
-- name of polygon
local S2Text = display.newText("Dodecagon", S2x, BottomTextH, Arial, textSize)
-- set the colour of the newText
S2Text:setTextColor( 255/255, 255/255, 0 )
------------------------------------

-- Colour, width, and height for C1
local C1 = display.newPolygon( C1x, halfH, Cvertices )
-- set width of the border
C1.strokeWidth = 5
-- set colour of the border
C1:setStrokeColor( 0, 0, 0 )
-- set colour of the polygon
C1:setFillColor( 0, 255/255, 0 )
--------------------------------------
-- name of polygon
local C1Text = display.newText("Octagon", C1x, TopTextH, Arial, textSize)
-- set the colour of the newText
C1Text:setTextColor( 0, 255/255, 0 )
------------------------------------------

-- Colour, width, and height for H1
local H1 = display.newPolygon( H1x, halfH, Hvertices )
-- set width of the border
H1.strokeWidth = 5
-- set colour of the border
H1:setStrokeColor( 0, 0, 0 )
-- set colour of the polygon
H1:setFillColor( 0, 0, 255/255 )
--------------------------------------
-- name of polygon
local H1Text = display.newText("Dodecagon", H1x, BottomTextH, Arial, textSize)
-- set the colour of the newText
H1Text:setTextColor( 0, 0, 255/255 )
----------------------------------------

-- Colour, width, and height for A2
local A2 = display.newPolygon( A2x, halfH, Avertices )
--set width of the border
A2.strokeWidth = 5
-- set colour of the border
A2:setStrokeColor( 0, 0, 0 )
--set colour of the polygon
A2:setFillColor( 1, 0, 5 )
----------------------------------
-- name of polygon
local A2Text = display.newText("Octagon", A2x, TopTextH, Arial, textSize)
-- set the colour of the newText
A2Text:setTextColor( 1, 0, 5 )
--------------------------------------

-- Colour, width, image, and height for AHole2
local Ahole2 = display.newPolygon( A2x, halfH-60, AholeVertices )
-- set image for hole of the polygon
Ahole2.fill = { type="image", filename="mountains.jpg" }
-- set width of the border
Ahole2.strokeWidth = 5
-- set colour of the border
Ahole2:setStrokeColor( 0, 0, 0 )
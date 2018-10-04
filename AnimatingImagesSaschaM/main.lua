-- Title: Animating Images
-- Name: Sascha Motz
-- Course: ICS2O
-- This program has different objects that move around the screen.

-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

--local variables
local backgroundImage = display.newImageRect("Images/park.png", 2048, 1600)

local bird = display.newImageRect("Images/bird.png", 400, 400)
bird.x = display.contentWidth/5
bird.y = display.contentHeight/8

local personWalkingDog = display.newImageRect("Images/personWalkingDog.png", 1000, 500)

-- Title: Animating Images
-- Name: Sascha Motz
-- Course: ICS2O
-- This program has different objects that move around the screen.

-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

--create a local variable
local textObject

--background image with width and height
local backgroundImage = display.newImageRect("Images/underwater.png", 2048, 1600)

-- display text on the screen a position x = 500 and y = 500 width
-- a default font style and font size of 100
textObject = display.newText( "UNDER THE SEA", display.contentWidth/2, display.contentHeight/8, nil, 70 )

-- sets the colour of the text
textObject:setTextColor(0, 255/255, 255/255)
---------------------------------------
--character image with width and height
local fish = display.newImageRect("Images/fish2.png", 200, 200)
--set initial x and y position of fish
fish.x = display.contentWidth/10
fish.y = display.contentHeight/3

-- variable for speed of the fish
scrollSpeedFish = 1

-- set the image to be transparent
fish.alpha = 0
local fadeFish = 1
local directionFish = 1

--Function: MoveFish
-- Input: this function accepts and event listener
--Description: This function adds the scroll speed to the x-value of the fish
local function MoveFish (event)
	--add the scroll speed to the x-value of the fish
	-- change the transparency of the fish every time it moves so that it fades in/out
	--make the fade in/out speeds different
	--make the fish go across the display non-stop
	if  fish.alpha == 1 then
		fadeFish = 0
	end
    if fish.alpha == 0 then
    	fadeFish = 1
	end

    if fadeFish == 1 then
        fish.alpha = fish.alpha + 0.02
    else
       fish.alpha = fish.alpha - 0.02
    end
    
    if fish.x > 1000 then
		directionFish = 0
		fish.xScale = -1
    end
    if fish.x < 0 then
    	directionFish = 1
		fish.xScale = 1	
	end

    if directionFish == 1 then
    	fish.x = fish.x - scrollSpeedFish + 5
    else
    	fish.x = fish.x - scrollSpeedFish - 5
    end

end

--MoveFish will be called over and over again
Runtime:addEventListener("enterFrame", MoveFish)
------------------------------------------------------

--charcter image with width and height
local starfish = display.newImageRect("Images/starfish.png", 200, 200)
--set initaial x and y position of starfish
starfish.x = display.contentWidth/5.5
starfish.y = display.contentHeight/1.15

--make starfish spin
transition.to( starfish, { rotation = starfish.rotation-9000, time=50000, onComplete=spinImage } )
-----------------------------------------------------------------------------------------------------

--charcter image with width and height
local seaturtle = display.newImageRect("Images/seaturtle.png", 200, 200)
--set initaial x and y position of seaturtle
seaturtle.x = display.contentWidth/1.5
seaturtle.y = display.contentHeight/1.1

-- variable for speed of the seaturtle
scrollSpeedSeaturtle = 1

-- set the image to be transparent
seaturtle.alpha = 0
local fadeSeaturtle = 1

--Function: MoveSeaturtle
-- Input: this function accepts and event listener
--Description: This function adds the scroll speed to the x-value and y-value of the seaturtle
local function MoveSeaturtle (event)
	--add the scroll speed to the x-value and y-value of the seaturtle
	seaturtle.x = seaturtle.x - scrollSpeedSeaturtle - 1
	seaturtle.y = seaturtle.y - scrollSpeedSeaturtle - 1
	-- change the transparency of the seaturtle so that it fades in/out
	--make the seaturtle go on a diagonal line
	--the fade in/out at different speeds
	if  seaturtle.alpha == 1 then
		fadeSeaturtle = 0
	end
    if seaturtle.alpha == 0 then
    	fadeSeaturtle= 1
	end

    if fadeSeaturtle == 1 then
        seaturtle.alpha = seaturtle.alpha + 0.01
    else
       seaturtle.alpha = seaturtle.alpha - 0.04
    end

end

--MoveSeaturtle will be called over and over again
Runtime:addEventListener("enterFrame", MoveSeaturtle)



---------------------------------------------------------------------
--charcter image with width and height
local pufferFish = display.newImageRect("Images/pufferFish2.png", 200, 200)
--set initaial x and y position of pufferfish
pufferFish.x = display.contentWidth/1.15
pufferFish.y = display.contentHeight/1.6

--local variable for the size of the PufferFish
--local variable for count
local increasePufferFish = 1
local pufferFishCount = 10

--Function: ChangePufferFishSize
-- Input: this function accepts and event listener
--Description: This function changes the size of the x-value and y-value of the PufferFish
local function ChangePufferFishSize(event)
	-- start the Puffer fish at 1 
	--increse the size by 1.05,1.05 on a count of 10
	--else the PufferFish will start at 0
    --decrease the size by 0.95,0.95 on a coynt down of 10
    if increasePufferFish == 1 then
    	pufferFish:scale(1.05,1.05)
    else
    	pufferFish:scale(0.95,0.95)
    end

 	pufferFishCount = pufferFishCount - 1

    if pufferFishCount == 0 then
		if increasePufferFish == 1 then
			increasePufferFish = 0
        else
			increasePufferFish = 1
		end
        pufferFishCount = 10
    end
 
end

--ChangePufferFishSize will be called over and over again
Runtime:addEventListener("enterFrame", ChangePufferFishSize)
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
--fish image with width and height
local fish = display.newImageRect("Images/fish2.png", 200, 200)
--set initial x and y position of fish
fish.x = display.contentWidth/10
fish.y = display.contentHeight/3

-- variable for speed of the fish
scrollSpeedFish = 4

-- set the transparency of the fish
fish.alpha = 0
-- controls if fish is more or less transparent
local fadeFish = 1
-- controls the x direction of the fish
local directionFish = 1

--Function: MoveFish
-- Input: this function accepts and event listener
--Description: This function adds the scroll speed to the x-value of the fish
local function MoveFish (event)
	-- make the fish more transparent if it is fully visible
	if  fish.alpha == 1 then
		fadeFish = 0
	end
    -- make the fish less transparent if it is fully transparent
    if fish.alpha == 0 then
    	fadeFish = 1
	end

	-- change the transparency of the fish based on fadeFish
    if fadeFish == 1 then
        fish.alpha = fish.alpha + 0.02
    else
       fish.alpha = fish.alpha - 0.02
    end
    
    -- Flip fish and change its direction if hits right side of screen
    if fish.x > 1000 then
		directionFish = 0
		fish.xScale = -1
    end
    -- Flip fish and change its direction if hits left side of screen
    if fish.x < 0 then
    	directionFish = 1
		fish.xScale = 1	
	end

    -- change x position of fish based on directionFish
	if directionFish == 1 then
    	fish.x = fish.x + scrollSpeedFish
    else
    	fish.x = fish.x - scrollSpeedFish
    end

end

--MoveFish will be called over and over again
Runtime:addEventListener("enterFrame", MoveFish)
------------------------------------------------------

--star fish image with width and height
local starfish = display.newImageRect("Images/starfish.png", 200, 200)
--set initial x and y position of starfish
starfish.x = display.contentWidth/5.5
starfish.y = display.contentHeight/1.15

--make starfish spin
transition.to( starfish, { rotation = starfish.rotation-9000, time=50000, onComplete=spinImage } )
-----------------------------------------------------------------------------------------------------

--sea turtle image with width and height
local seaturtle = display.newImageRect("Images/seaturtle.png", 200, 200)
--set initial x and y position of seaturtle
seaturtle.x = display.contentWidth/1.5
seaturtle.y = display.contentHeight/1.1

-- variable for speed of the seaturtle
scrollSpeedSeaturtle = 2

-- set the image to be transparent
seaturtle.alpha = 0
-- controls if sea turtle is more or less transparent
local fadeSeaturtle = 1

--Function: MoveSeaturtle
-- Input: this function accepts and event listener
--Description: This function adds the scroll speed to the x-value and y-value of the seaturtle
local function MoveSeaturtle (event)
	--add the scroll speed to the x-value and y-value of the seaturtle. makes the seaturtle go on a diagonal line
	seaturtle.x = seaturtle.x - scrollSpeedSeaturtle
	seaturtle.y = seaturtle.y - scrollSpeedSeaturtle
	
	-- make the sea turtle more transparent if it is fully visible
	if  seaturtle.alpha == 1 then
		fadeSeaturtle = 0
	end
    -- make the sea turtle less transparent if it is fully transparent
	if seaturtle.alpha == 0 then
    	fadeSeaturtle= 1
	end

    -- change the sea turtle transparency based on fadeSeaTurtle 
    if fadeSeaturtle == 1 then
        seaturtle.alpha = seaturtle.alpha + 0.01
    else
       seaturtle.alpha = seaturtle.alpha - 0.04
    end

end

--MoveSeaturtle will be called over and over again
Runtime:addEventListener("enterFrame", MoveSeaturtle)

---------------------------------------------------------------------
--puffer fish image with width and height
local pufferFish = display.newImageRect("Images/pufferFish2.png", 200, 200)
--set initaial x and y position of pufferfish
pufferFish.x = display.contentWidth/1.15
pufferFish.y = display.contentHeight/1.6

--local variable for the size of the PufferFish
local increasePufferFish = 1
--local variable for puffer fish count
local pufferFishCount = 10

--Function: ChangePufferFishSize
-- Input: this function accepts and event listener
--Description: This function changes the size of the x-value and y-value of the PufferFish
local function ChangePufferFishSize(event)
	--puffer fish initially starts increasing because increasePufferFish == 1) 
	--increse the size by 1.05,1.05 ten times
	--else decrease size of puffer Fish when increasePufferFish == 0
    --decrease the size by 0.95,0.95 ten times
    if increasePufferFish == 1 then
    	pufferFish:scale(1.05,1.05)
    else
    	pufferFish:scale(0.95,0.95)
    end

 	-- decrease puffer fish count
 	pufferFishCount = pufferFishCount - 1

    -- change direction of size when pufferFishCount is zero and reset pufferFishCount to 10 
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
-- Title: CompanyLogoAnimation
-- Name: Sascha Motz

-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

-- sets the background colour
display.setDefault("background", 192/255, 192/255, 192/255 )

-- Logo sound
local logoSound = audio.loadSound("Sounds/logoSound.aup" ) 
-- Setting a variable to an mp3 file
local logoSoundChannel

--add the logo image
local logo = display.newImageRect("Images/CompanyLogoSaschaM.png", 600, 600)

--set initial x and y position of the logo
logo.x = -500
logo.y = display.contentHeight/2

-- variable for speed of the logo
scrollSpeedLogo = 8

-- set the transparency of the Logo
logo.alpha = 0
-- controls if logo is more or less transparent
local fadeLogo = 1
-- controls the x direction of the logo
local directionLogo = 1

--Function: MoveLogo
-- Input: this function accepts and event listener
--Description: This function adds the scroll speed to the x-value of the logo
local function MoveLogo (event)
	-- make the logo more transparent if it is fully visible
	if  logo.alpha == 1 then
		fadeLogo = 0
	end
    -- make the logo less transparent if it is fully transparent
    if logo.alpha == 0 then
    	fadeLogo = 1
	end

	-- change the transparency of the logo based on fadeLogo
    if fadeLogo == 1 then
        logo.alpha = logo.alpha + 0.02
    else
       logo.alpha = logo.alpha - 0.02
    end

    -- change x position of logo based on directionLogo
	if directionLogo == 1 then
    	logo.x = logo.x + scrollSpeedLogo
    else
    	logo.x = logo.x - scrollSpeedLogo
    end

end

-- play sound effect
logoSoundChannel = audio.play(logoSound)

--MoveLogo will be called 
Runtime:addEventListener("enterFrame", MoveLogo)

--make logo spin
transition.to( logo, { rotation = logo.rotation-1440, time=17000, onComplete=spinImage } )
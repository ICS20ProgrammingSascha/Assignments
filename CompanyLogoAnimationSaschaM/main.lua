-- Title: CompanyLogoAnimation
-- Name: Sascha Motz

-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

--add the logo image
local logo = display.newImageRect("Images/CompanyLogoSaschaM.png", 200, 200)

--set initial x and y position of the logo
logo.x = display.contentCenter
logo.y = display.contentCenter
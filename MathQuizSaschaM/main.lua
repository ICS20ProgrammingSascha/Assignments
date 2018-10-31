-- Title: MathQuiz
-- Name: Sascha Motz
-- Course: ICS2O
-- This program displays a math question and asks the user 
-- to answer in a numeric textfield terminal.

-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

--sets the background colour
display.setDefault("background", 255/255, 153/255, 255/255)

-----------------------------------------------------------
-- LOCAL VARIABLES
-----------------------------------------------------------

-- create local variables
local questionObject
local correctObject
local incorrectObject
local speedObject
local speedSound
local numericField
local randomNumber1
local randomNumber2
local userAnswer
local correctAnswer
local correctSounds
local score = 0
local scoreObject

-- variables for the timer
local totalSeconds = 10
local secondsLeft = totalSeconds
local clockText
local countDownTimer

-- varibles of the images
local lives = 3
local heart1
local heart2
local heart3
local heart4
local gameOver

-----------------------------------------------------------------
-- SOUNDS
----------------------------------------------------------------

-- Background music
local bkgMusic = audio.loadSound("Sounds/bkgMusic.mp3" )
-- setting a variable to an mp3 file
local bkgMusicChannel
-- plays the music
bkgMusicChannel = audio.play(bkgMusic)
-- Reduce the overall volume of the channel
audio.setVolume( 0.05, { bkgMusicChannel } )

-- Correct sound
local correctSound = audio.loadSound("Sounds/correctSound.mp3" ) 
-- Setting a variable to an mp3 file
local correctSoundChannel

-- Incorrect sound
local incorrectSound = audio.loadSound("Sounds/incorrectSound.mp3" ) 
-- Setting a variable to an mp3 file
local incorrectSoundChannel

-- Game over sound
local gameOverSound = audio.loadSound("Sounds/gameOverSound.mp3" ) 
-- Setting a variable to an mp3 file
local gameOverSoundChannel

-- Won game sound
local wonGameSound = audio.loadSound("Sounds/wonGameSound.mp3" ) 
-- Setting a variable to an mp3 file
local wonGameChannel

-- Speed sound
local speedSound = audio.loadSound("Sounds/speedSound.mp3" ) 
-- Setting a variable to an mp3 file
local speedSoundChannel

--------------------------------------------------------------------------------------------
-- LOCAL FUNCTIONS
--------------------------------------------------------------------------------------------

-- create fuction to ask the question
local function AskQuestion()

	-- controls the amount of seconds left
	secondsLeft = totalSeconds

	-- generate 2 random numbers between a max. and a min. number
	randomOperator = math.random(5)

	-- creating the random operator 1
	if ( randomOperator == 1) then

		-- creating the two random numbers
      	randomNumber1 = math.random(1,20)
	    randomNumber2 = math.random(1,20)

	    	-- making the correct answer equal the equation
        	correctAnswer = randomNumber1 + randomNumber2

			-- create question in text object
			questionObject.text = randomNumber1.. " + " ..  randomNumber2 .. " = "

	-- creating the random operator 2
	elseif ( randomOperator == 2) then

		-- creating the two random numbers
      	randomNumber1 = math.random(1,20)
	    randomNumber2 = math.random(1,20)

	    -- controling the random numbers to make sure the first number is bigger
	    -- than the second to avoid negatives.
		if (randomNumber1 >= randomNumber2) then

			-- making the correct answer equal the equation
        	correctAnswer = randomNumber1 - randomNumber2

			-- create question in text object
			questionObject.text = randomNumber1.. " - " ..  randomNumber2 .. " = "
	    else
	    	-- Calling ask question
			AskQuestion()
	    end

	elseif ( randomOperator == 3) then

		-- creating the two random numbers
      	randomNumber1 = math.random(1,10)
	    randomNumber2 = math.random(1,10)
	    	-- making the correct answer equal the equation
        	correctAnswer = randomNumber1 * randomNumber2

			-- create question in text object
			questionObject.text = randomNumber1.. " * " ..  randomNumber2 .. " = "
	
	elseif ( randomOperator == 4) then

		-- creating the two random numbers
      	randomNumber1 = math.random(1,100)
	    randomNumber2 = math.random(1,100)

	    	-- making the equation to avoid decimals
			randomNumber1 = randomNumber1 - (randomNumber1 % randomNumber2)

			-- making the correct answer equal the equation
        	correctAnswer = randomNumber1 / randomNumber2

			-- create question in text object
			questionObject.text = randomNumber1.. " / " ..  randomNumber2 .. " = "

	else

		-- creating the two random numbers
		randomNumber1 = math.random(1,3)
	    randomNumber2 = math.random(1,3)

	    	-- making the correct answer equal the equation
        	correctAnswer = randomNumber1 ^ randomNumber2

			-- create question in text object
			questionObject.text = randomNumber1.. " ^ " ..  randomNumber2 .. " = "
	end
end

-- make the correct object visible
local function HideCorrect()
	-- make the object invisible
	correctObject.isVisible = false
	-- Call the function AskQuestion()
	AskQuestion()
end

-- make the incorrect object visible
local function HideIncorrect()
	-- make the object invisible
	incorrectObject.isVisible = false
	-- Call the function AskQuestion()
	AskQuestion()
end

-- make the speed object visible
local function HideSpeed()
	-- make the object invisible
	speedObject.isVisible = false
	-- Call the function AskQuestion()
	AskQuestion()
end

-- function that operates decrese lives
local function DecreaseLives()

	-- make heart 3 invisble
	if (lives == 3) then
		heart3.isVisible = false
	-- make heart 2 invisble
	elseif (lives == 2) then
		heart2.isVisible = false
	-- make heart 1 invisble
	elseif (lives == 1) then
		heart1.isVisible = false
		-- cancel the countdown timer
		timer.cancel( countDownTimer )
		-- numeric field is invisible
		numericField.isVisible = false
		-- the game over sound
		gameOverSoundChannel = audio.play(gameOverSound)
		 -- Stop the  bkg music
        audio.stop( bkgMusicChannel )
        -- display the game over image
		gameOver = display.newImageRect("Images/gameOver.png", display.contentWidth, display.contentHeight)
		gameOver.x = display.contentWidth * 1 / 2
		gameOver.y = display.contentHeight * 1 / 2
	end

	-- decrese the number of lives by 1
	lives = lives - 1

end

-----------------------------------------------
-- function that operates decrese lives
local function WinGame()
	
	-- Cancel the timer remove the third heart by making it invisible
		timer.cancel( countDownTimer )
		-- make numberic field lister invisible
		numericField.isVisible = false
		-- play win game sound
		wonGameSoundChannel = audio.play(wonGameSound)
		 -- Stop the bkg music
        audio.stop( bkgMusicChannel )
        -- display the win game image
		wonGame = display.newImageRect("Images/wonGame.jpg", display.contentWidth, display.contentHeight)
		wonGame.x = display.contentWidth * 1 / 2
		wonGame.y = display.contentHeight * 1 / 2
end
------------------------------------------------------

-- function that operates numeric field lives
local function NumericFieldListener(event)

	-- User begins editing "numericField"
	if ( event.phase == "began" ) then

		-- clear text field
		event.target.text = ""

	elseif event.phase == "submitted" then

		--when the answer is submitted (eneter key is pressed) set user input to user's answer
		userAnswer = tonumber(event.target.text)

			-- if the users answer and the correct answer are the same:
		if (userAnswer == correctAnswer) then
			-- display the correct object
			correctObject.isVisible = true
			-- play the correct sound
			correctSoundChannel = audio.play(correctSound)
			-- perform with 2000 delay
			timer.performWithDelay(2000, HideCorrect)
			-- add 1 to the score
			score = score + 1

			-- call WinGame
			if (score == 5) then
				-- Call WinGame()
				WinGame()
			end

			-- displaying the text object for the score
			scoreObject.text = "Score:" .. score
			
		else
			-- display the inccorect text object
            incorrectObject.text = "Incorrect! The answer is ".. correctAnswer
            -- make the object visible
			incorrectObject.isVisible = true
			-- play incorrect sound
			incorrectSoundChannel = audio.play(incorrectSound)
			-- play with 2000 delay
			timer.performWithDelay(2000, HideIncorrect)

			-- call the function to decrease lives
			DecreaseLives()
		end


		--clear text field
		event.target.text = ""
	end
end

-- create local function to update the time
local function UpdateTime()

	-- decrement the number of seconds
	secondsLeft = secondsLeft -1

	-- display the number of seconds left in the clock object
	clockText.text = "Time Remaining: " .. secondsLeft

	if (secondsLeft == 0 ) then

		-- call the function to decrease lives
		DecreaseLives()

		-- displays the speed object
		speedObject.isVisible = true
		-- play the correct sound
		speedSoundChannel = audio.play(speedSound)
		-- perform with 2000 delay
		timer.performWithDelay(2000, HideSpeed)
	end
end

-- function that calls the timer
local function StartTimer()
	
	-- create a countdown timer that loops infinitly
	countDownTimer = timer.performWithDelay( 1000, UpdateTime, 0)
end

--------------------------------------------------------------------------------------------
-- OBJECT CREATION
--------------------------------------------------------------------------------------------

-- display a question and sets the colour
questionObject = display.newText( "", display.contentWidth/3, display.contentHeight/2, nil, 55 )
questionObject:setTextColor(0,255, 204,255, 255,255)

-- display the score and sets the colour
scoreObject = display.newText( "Score:" .. score , display.contentWidth/1.2, display.contentHeight/3, nil, 60 )
scoreObject:setTextColor(0,255, 0,255, 255,255)

-- display the text of the timer
clockText = display.newText( "", display.contentWidth/4, display.contentHeight/3, nil, 55 )
clockText:setTextColor(0,255, 100,255, 255,255)

-- create the correct text object and make it invisible
correctObject = display.newText( "Correct!", display.contentWidth/2, display.contentHeight*2/3, nil, 50)
correctObject:setTextColor(255,255, 0,255, 0,255)
correctObject.isVisible = false

-- create the incorrect text object and make it invisible
incorrectObject = display.newText( "", display.contentWidth/2, display.contentHeight*2/3, nil, 80)
incorrectObject:setTextColor(255,255, 0,255, 0,255)
incorrectObject.isVisible = false

-- create the incorrect text object and make it invisible
speedObject = display.newText( "Speed Up!", display.contentWidth/2, display.contentHeight*2/3, nil, 80)
speedObject:setTextColor(0,255, 2,255, 0,255)
speedObject.isVisible = false

-- Create the numeric field
numericField = native.newTextField( display.contentWidth/1.7, display.contentHeight/2, 200, 110 )
numericField.inputType = "number"

-- add the event listener for the numeric field
numericField:addEventListener( "userInput", NumericFieldListener )

--create the lives to display on the screen
heart1 = display.newImageRect("Images/heart.png", 100, 100)
heart1.x = display.contentWidth * 7 / 8
heart1.y = display.contentHeight * 1 / 7

--create the lives to display on the screen
heart2 = display.newImageRect("Images/heart.png", 100, 100)
heart2.x = display.contentWidth * 6 / 8
heart2.y = display.contentHeight * 1 / 7

--create the lives to display on the screen
heart3 = display.newImageRect("Images/heart.png", 100, 100)
heart3.x = display.contentWidth * 5 / 8
heart3.y = display.contentHeight * 1 / 7

-- call the function to ask a new question
AskQuestion()

-- call the function to ask a new question
StartTimer()
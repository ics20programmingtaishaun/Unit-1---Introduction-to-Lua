-- Title: Livesandtimers
-- Name: Taishaun Johnson
-- Course: ICS2O/3C
-- This program displays a math question and asks the user
-- to answer in a numeric textfeild terminal.
----------------------------------------------------------

-- hide the status bar 
display.setStatusBar(display.HiddenStatusBar)

-- sets the background colour 
display.setDefault("background", 0, 0, 1)

---------------------------------------------------------
-- Local Variables
---------------------------------------------------------

-- Create local variables
local questionObject
local correctObject
local numericField 
local randomNumber1
local randomNumber2
local userAnswer
local correctAnswer
local incorrectAnswer
local incorrectObject
local correctSound = audio.loadSound( "sounds/correctSound.mp3")
local incorrectSound = audio.loadSound( "sounds/wrongSound.mp3")
local whackSound = audio.loadSound( "sounds/whack.mp3")
local correctSoundChannel
local incorrectSoundChannel
local whackSoundChannel

-- variable of timer
local totalSeconds = 15
local secondsLeft = 15
local clockText = display.newText("", display.contentWidth/7.5, display.contentHeight/7.8, nil, 50)
local scoreText = display.newText("", display.contentWidth/7.0, display.contentHeight/4.5, nil, 50)
local countDownTimer
local lives = 3
local heartOne
local heartTwo 
local heartThree 
local score = 0
local pointsObject
local gameOver  

-----------------------------------------------------------------------
-- Local Functions
-----------------------------------------------------------------------
local function AskQuestion()
	-- generate a random number between 1 and 4
	-- *** Make sure to declare this variable above
	randomOperator = math.random(1,4) 
	-- generate 2 random numbers
	randomNumber1 = math.random(11,30)
	randomNumber2 = math.random(0,10)

	-- if the random operator is 1, then do addition
	if (randomOperator == 1) then

		-- calculate the correct answer
		correctAnswer = randomNumber1 + randomNumber2

		-- create question in text object 
		questionObject.text = randomNumber1 .. " + " .. randomNumber2 .. " = "

	-- otherwise, if the random operator is 2, do subtraction
	elseif (randomOperator == 2) then 
		-- calculate the correct answer
		correctAnswer = randomNumber1 - randomNumber2

		-- create question in text object 
		questionObject.text = randomNumber1 .. " - " .. randomNumber2 .. " = "

	-- if the random operator is 3, then do multiplication
	elseif (randomOperator == 3) then

		-- calculate the correct answer
		correctAnswer = randomNumber1 * randomNumber2

		-- create question in text object 
		questionObject.text = randomNumber1 .. " * " .. randomNumber2 .. " = "

	-- otherwise, if the random operator is 2, do subtraction
	elseif (randomOperator == 4) then 
		-- calculate the correct answer
		correctAnswer = math.round(randomNumber1 / randomNumber2)

		-- create question in text object 
		questionObject.text = randomNumber1 .. " / " .. randomNumber2 .. " = " 
        	
	end	
end 

local function UpdateTime()

	-- number of seconds 
	secondsLeft = secondsLeft - 1

	-- show the number of seconds left in clock text 
	clockText.text = secondsLeft .. ""

	if (secondsLeft == 0) then 
		-- reset the number of seconds 
		secondsLeft = totalSeconds
		lives = lives - 1 

		if (lives == 2) then 
			heartThree.isVisible = false 
			AskQuestion()
			elseif (lives == 1) then 
			heartTwo.isVisible = false
			AskQuestion()
			elseif (lives == 0) then 
			heartOne.isVisible = false
			whackSoundChannel = audio.play(whackSound) 
			timer.cancel(countDownTimer)
           
		end
	end
end

UpdateTime()
-- calls the timer
local function StartTimer()
	-- make a timer that goes on forever
	countDownTimer = timer.performWithDelay( 1500, UpdateTime, 0)
end 

local function KeepTime()
	timer.resume(countDownTimer)
	secondsLeft = 15
end

local function HideCorrect()
	correctObject.isVisible = false 
	AskQuestion()
end 

local function HideIncorrect()
	incorrectObject.isVisible = false
	AskQuestion()
end

local function NumericFieldListener( event )

	-- User begins editing "numericField"
	if ( event.phase == "began" ) then

		-- clear text field
		event.target.text = ""

	elseif (event.phase == "submitted") then 

		-- when the answer is submitted (enter key is pressed) set user input to user's answer
		userAnswer = tonumber(event.target.text)

		-- if the users answer and the correct answer are the same:
		if (userAnswer == correctAnswer) then
			correctObject.isVisible = true 
			incorrectObject.isVisible = false
			-- number of score 
		score = score + 2

		-- show the score 
		scoreText.text = score .. " : score"
			timer.performWithDelay(2000, HideCorrect)
			correctSoundChannel = audio.play(correctSound)
			timer.pause(countDownTimer)
			timer.performWithDelay(2000, KeepTime)

		elseif  (userAnswer ~= correctAnswer) then
			incorrectObject.isVisible = true
			correctObject.isVisible = false
			timer.performWithDelay(2000, HideIncorrect)
			incorrectSoundChannel = audio.play(incorrectSound)
			lives = lives - 1
			timer.pause(countDownTimer)
			timer.performWithDelay(2000, KeepTime)
		end

		-- clear text field
		event.target.text = ""
	end
end

------------------------------------------------------------------------
-- Object Creation
------------------------------------------------------------------------

-- displays a question and sets the colour 
questionObject = display.newText( "", display.contentWidth/3, display.contentHeight/2, nil, 50 )
questionObject:setTextColor(0/255, 0/255, 0/255)

-- create the correct text object and make it invisible 
correctObject = display.newText( "Correct!", display.contentWidth/2, display.contentHeight*2/3, nil, 50 )
correctObject:setTextColor(89/255, 89/255, 89/255)
correctObject.isVisible = false 

-- create the incorrect text object and make it invisible
incorrectObject = display.newText( "Incorrect!", display.contentWidth/2, display.contentHeight*2/3, nil, 50 )
incorrectObject:setTextColor(1, 0, 0)
incorrectObject.isVisible = false

-- create numeric field 
numericField = native.newTextField(display.contentWidth/1.8, display.contentHeight/2, 150, 100)
numericField.inputType = "decimal"

-- add the event listener for the numeric field
numericField:addEventListener( "userInput", NumericFieldListener)

-- make the lives show 
heartOne = display.newImageRect("images/heart.png", 115, 115)
heartOne.x = display.contentWidth * 5 / 8
heartOne.y = display.contentHeight * 1 / 7 

heartTwo = display.newImageRect("images/heart.png", 115, 115)
heartTwo.x = display.contentWidth * 6 / 8
heartTwo.y = display.contentHeight * 1 / 7 

heartThree = display.newImageRect("images/heart.png", 115, 115)
heartThree.x = display.contentWidth * 7 / 8
heartThree.y = display.contentHeight * 1 / 7 

-- make the score isVisible
pointsObject = display.newText( "", display.contentWidth/1.4, display.contentHeight*1/3, nil, 50)
pointsObject:setTextColor(1, 0, 0)
pointsObject.isVisible = true

------------------------------------------------------------------------
-- Function Calls 
------------------------------------------------------------------------

-- call the function to ask the question 
AskQuestion()
StartTimer()
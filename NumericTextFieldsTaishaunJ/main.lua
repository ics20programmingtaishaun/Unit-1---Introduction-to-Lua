-- Title: NumericTextFields
-- Name: Your Name
-- Course: ICS2O/3C
-- This program displays a math question and asks the user
-- to answer in a numeric textfeild terminal.
----------------------------------------------------------

-- hide the status bar 
display.setStatusBar(display.HiddenStatusBar)

-- sets the background colour 
display.setDefault("background", 0, 175/255, 225/255)

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

-- Correct Sound
local correctSound = audio.loadSound("Sounds/Correct Answer Sound Effect.mp3") -- Settting a variable to an mp3 file
local correctSoundChannel
-----------------------------------------------------------------------
-- Local Functions
-----------------------------------------------------------------------
local function AskQuestion()
	-- generate 2 random numbers between a max. and a min. number
	randomNumber1 = math.random(10, 20)
	randomNumber2 = math.random(10, 20)

	correctAnswer = randomNumber1 + randomNumber2 

	-- create question in text object 
	questionObject.text = randomNumber1 .. " + " .. randomNumber2 .. " = "

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

			correctSoundChannel = audio.play(correctSound)
			
			timer.performWithDelay(2000, HideCorrect)

		elseif  (userAnswer ~= correctAnswer) then
			incorrectObject.isVisible = true
			correctObject.isVisible = false
			timer.performWithDelay(2000, HideCorrect)
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
numericField = native.newTextField(display.contentWidth/1.75, display.contentHeight/2, 150, 100)
numericField.inputType = "number"

-- add the event listener for the numeric field
numericField:addEventListener( "userInput", NumericFieldListener)

------------------------------------------------------------------------
-- Function Calls 
------------------------------------------------------------------------

-- call the function to ask the question 
AskQuestion()


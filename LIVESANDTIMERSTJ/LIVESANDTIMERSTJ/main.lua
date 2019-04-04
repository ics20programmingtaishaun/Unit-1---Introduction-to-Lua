-- Title: Math Fun
-- Name: Taishaun Johnson
-- Course: ICS2O/3C
-- This program displays a math question and asks the user
-- to answer in a numeric textfeild terminal.
----------------------------------------------------------

-- hide the status bar 
display.setStatusBar(display.HiddenStatusBar)

-- sets the background colour 
display.setDefault("background", 0, 1, 1)

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
local correctAnswerD
local incorrectAnswer
local incorrectObject
-----------------------------------------------------------------------
-- Local Functions
-----------------------------------------------------------------------
local function AskQuestion()
	-- generate a random number between 1 and 4
	-- *** Make sure to declare this variable above
	randomOperator = math.random(1,4) 
	-- generate 2 random numbers
	randomNumber1 = math.random(20,40)
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
		correctAnswer =math.round (randomNumber1 / randomNumber2) 
      

		-- create question in text object 
		questionObject.text = randomNumber1 .. " / " .. randomNumber2 .. " = "

	end	
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
			timer.performWithDelay(2000, HideCorrect)

		else
			incorrectObject.isVisible = true
			correctObject.isVisible = false
			timer.performWithDelay(2000, HideIncorrect)
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

------------------------------------------------------------------------
-- Function Calls 
------------------------------------------------------------------------

-- call the function to ask the question 
AskQuestion()

-- create a 
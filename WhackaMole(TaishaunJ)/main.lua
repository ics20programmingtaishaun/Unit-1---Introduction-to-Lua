-- Title: WhackAMole
-- Name: Your Name
-- Course: ICS2O/3C
-- This program places a random object on the screen. If the user clicks on it in time, 
-- the score increases by 1 
----------------------------------------------------------------------------------------------------------

-- Hide the status bar
display.setStatusBar(display.HiddenstatusBar)

--------------------------------------------------------------------------------------------------------
-- LOCAL VARIABLE AND OBJECT CREATION
--------------------------------------------------------------------------------------------------------

-- Creating Background
local bkg = display.newRect( 0, 0, display.contentWidth, display.contentHeight) 

	-- set the colour of the background
	bkg:setFillColor( 1, 1, 1)

	-- Setting Position
	bkg.anchorX = 0
	bkg.anchorY = 0 
	bkg.x = 0
	bkg.y = 0

-- Creating Mole 
local mole = display.newImage( "Images/mole.png" , 0, 0 ) 

	-- Setting the position
	mole.x = display.contentCenterX
	mole.y = display.contentCenterY

	-- Make the mole so its a third of its size
	mole:scale( 1/3, 1/3)

	-- Make the mole invisible
	mole.isVisible = false

-- Score variable and the score text
local score = 0
local scoreText = display.newText( "score", display.contentWidth/7, display.contentHeight/4.5, nil, 50)

----------------------------------------------------------------------------------------------------------------
-- FUNCTIONS
----------------------------------------------------------------------------------------------------------------

-- This function that makes the mole appaer in a random (x,y) position on the screen before calling the Hide function
function Popup()
	-- Choosing random position on the screen between 0 and the size of the screen 
	mole.x = math.random( 0, display.contentWidth)
	mole.y = math.random( 0, display.contentHeight)

	-- Make the mole visible
	mole.isVisible = true

	-- Call Hide Function
	timer.perfomWithDelay( 500, Hide)
end

-- This function calls the Popup Function after 3 seconds 
function PopUpDelay()
 	timer.performWithDelay( 3000, PopUp)
 end 

 -- This function makes the mole invisible and the calls the PopUpDelay function
 function Hide()

 	-- Change the visibility
 	mole.isVisible = false 

 	-- Call the PopUpDelay function
 	PopUpDelay()
end

-- This function starts the game 
function GameStart()
	PopUpDelay()
end
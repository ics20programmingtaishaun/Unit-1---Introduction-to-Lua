-- Title: TouchAndReact
-- Name: Taishaun Johnson
-- Course: ICS2O/3C
-- This program displays a blue botton. When I click on it, it changes to a red button and the word "Clicked" appears as well as an image and a sound effect. When I release the button, it returns to the original screen. 
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- set background colour 
display.setDefault ("background", 255/255, 255/255, 255/255)

-- hide status bar 
display.setStatusBar(display.HiddenStatusBar)

-- create blue button, set its position and make it visible 
local blueButton = display.newImageRect("Images/Fast Button Inactive@2x.png",198, 96)
blueButton.x = display.contentWidth/2
blueButton.y = display.contentHeight/2
blueButton.isVisible = true 

-- create red button, set its position and make in invisible 
local redButton = display.newImageRect("Images/Fast Button Active@2x.png", 198, 96)
redButton.x = display.contentWidth/2
redButton.y = display.contentHeight/2
redButton.isVisible = false 

-- create text object, set its position and make it invisible 
local textObject = display.newText ("Clicked!", 0, 0, nil, 50)
textObject.x = display.contentWidth/2 
textObject.y = display.contentHeight/3
textObject:setTextColor (0,1,0)
textObject.isVisible = false 

-- Function: BlueButtonListener
-- Input: touch listener
-- Output: none
-- Discription: when blue button is clicked, it will make the text 
-- appear with the red button, and make the blue button disappear
local function BlueButtonListener(touch)
	if (touch.phase == "began") then 
		blueButton.isVisible = false 
		redButton.isVisible = true 
		textObject.isVisible = true 
	end 

	if (touch.phase == "ended") then 
		blueButton.isVisible = true 
		redButton.isVisible = false 
		textObject. isVisible = false 
	end
end
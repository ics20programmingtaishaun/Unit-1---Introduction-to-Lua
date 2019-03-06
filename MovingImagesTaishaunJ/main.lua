-- Title: MovingImages
-- Name: Your Name
-- Course: ICS2O/3C
-- This program hat has 2 images that move across the screen in 
-- differnet directions. One image fades out the other fades in. 
-- There is also a background image. 
---------------------------------------------------------------------------------------
-- hide the status bar 
display.setStatusBar(display.HiddenStatusBar)

-- global variables
scrollSpeed = 3 

-- background image with width and height 
local backgroundImage = display.newImageRect("Images/background.png", 2048, 1536)

-- character image with width and height 
local beetleship = display.newImageRect("Images/beetleship.png", 200, 200)

-- Scale the image by 200% (x) and 50% (y)
beetleship:scale(2,2)

-- set the image to be transparent
beetleship.alpha = 0

-- set the initial x and y position of beetleship 
beetleship.x = 0
beetleship.y = display.contentHeight/3 

-- Function: MoveShip
-- Input: this function accepts an event listener
-- Output: none 
-- Discription: This function adds the scroll speed to the x-value of the ship
local function MoveShip(event)
	-- add the scroll speed to the x-value of the ship
	beetleship.x = beetleship.x + scrollSpeed
	-- change the transparency of the ship every time it moves so that it fades out 
	beetleship.alpha = beetleship.alpha + 0.01
end

-- global variables
scrollSpeed2 = -5

-- MoveShip will be called over and over again
Runtime:addEventListener("enterFrame", MoveShip)

-- character image with width and hieght 
local rocketship = display.newImageRect("Images/rocketship.png", 200, 200)

-- set the image to be visible
rocketship.alpha = 1 
 
-- set the initial x and y position of rocketship
rocketship.x = 1024
rocketship.y = display.contentHeight/1.5

-- Function: MoveShip
-- Input: this function accepts an event listener
-- Output: none 
-- Discription: This function adds the scroll speed to the x-value of the ship
local function MoveRocketShip(event) 
	-- adds the scroll speed to the x-value of the ship
	rocketship.x = rocketship.x + scrollSpeed2
	-- change the visibleness of the ship every time it moves so that it fades in 
	rocketship.alpha = rocketship.alpha - 0.001
end

-- MoveShip will be called over and over again
Runtime:addEventListener("enterFrame", MoveRocketShip)

-- Flip the image vertically and horizantally 
rocketship:scale(-1,1)

-- Scale the image by 200% (x) and 50% (y)
rocketship:scale(1.5, 0.5)
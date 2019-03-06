-- Title: TouchAndDrag
-- Name: Your Name
-- Course: ICS2O/3C
-- This program has 2 images on the screen. When I click and drag on each image, it moves with my finger.
-----------------------------------------------------------------------------------------------------------

-- hide the status bar 
display.setStatusBar(display.HiddenStatusBar)

-- local Variables. I am still trying to get the x-value to be set properly
local backgroundImage = display.newImageRect("Images/background.png",2048, 1536)
local girlBlue = display.newImageRect("Images/girl2.png", 150, 150)
local girlBlueWidth = girlBlue.width 
local girlBlueHeight = girlBlue.Height 

local girlYellow = display.newImageRect("Images/girl3.png", 150, 150)
local girlYellowWidth = girlYellow.width
local girlYellowHeight = girlYellow.height 

-- my boolean variables to keep track of which object I touched first
local alreadyTouchedGirlBlue = false
local alreadyTouchedGirlYellow = false

-- set the intial x and y position of myImage
girlBlue.x = 400 
girlBlue.y = 550

girlYellow.x = 300
girlYellow.y = 150

-- Function: GirlBlueListener
-- Input: touch listener 
-- Output: none
-- Description: when girl blue is touched, move her
local function GirlBlueListener(touch)

	if (touch.phase == "began") then 
		if (alreadyTouchedGirlYellow == false) then 
			alreadyTouchedGirlBlue= true 
		end 
	end
	
	if ((touch.phase == "moved") and (alreadyTouchedGirlBlue == true) )	then
		girlBlue.x = touch.x 
		girlBlue.y = touch.y 
	end

	if (touch.phase == "ended") then
	   alreadyTouchedGirlBlue = false
	   alreadyTouchedGirlYellow = false
	end
end	

-- add the respective listeners to each object
girlBlue:addEventListener("touch", GirlBlueListener)
local function GirlYellowListener(touch)

	if (touch.phase == "began") then 
		if (alreadyTouchedGirlBlue == false) then 
			alreadyTouchedGirlYellow= true 
		end 
	end
	
	if ((touch.phase == "moved") and (alreadyTouchedGirlYellow == true) )	then
		girlYellow.x = touch.x 
		girlYellow.y = touch.y 
	end

	if (touch.phase == "ended") then
	   alreadyTouchedGirlBlue = false
	   alreadyTouchedGirlYellow = false
	end
end	

-- add the respective listeners to each object
girlYellow:addEventListener("touch", GirlYellowListener)

local star = display.newImageRect("Images/star.png", 150, 150)
local starWidth = girlYellow.width
local starHeight = girlYellow.height 

-- my boolean variables to keep track of which object I touched first
local alreadyTouchedStar = false

-- set the intial x and y position of myImage
star.x = 700 
star.y = 350

-- Function: StarListener
-- Input: touch listener 
-- Output: none
-- Description: when the star is touched, move her
local function StarListener(touch)

	if (touch.phase == "began") then 
		if (alreadyTouchedGirlYellow == false) then 
			alreadyTouchedStar= true 
		end 
	end
	
	if ((touch.phase == "moved") and (alreadyTouchedStar == true) )	then
		star.x = touch.x 
		star.y = touch.y 
	end

	if (touch.phase == "ended") then
	   alreadyTouchedGirlBlue = false
	   alreadyTouchedGirlYellow = false
	   alreadyTouchedStar = false 
	end
end	

-- add the respective listeners to each object
star:addEventListener("touch", StarListener)
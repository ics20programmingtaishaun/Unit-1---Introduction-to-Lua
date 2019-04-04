-- -----------------------------------------------------------------------------------------
-- Title: AreaOfRectangleAndCircle
-- Name: Your Name
-- Course: ICS2O/3C
-- This program displays a coloured rectangle with a border of a different colour. 
-- It also calculates the rectangle's area and displays it on the screen. 
-- Then I added the code to draw a circle of a given radius that is coloured 
-- and a border of a different colour. I used the radius to calculate the area 
-- and displayed this on the ipad.
-----------------------------------------------------------------------------------------

-- create my local variables
local areaText
local textSize = 50
local myRectangle
local widthOfRectangle = 350 
local heightOfRectangle = 200 
local areaOfRectangle
local myCircle
local areaOfCircle  
local PI = 3.14 
local radiusOfCircle = 15

-- set the background colour of my screen.Remember that colors are between 0 and 1.\
display.setDefault("background", 255/255, 0/255, 0/255)

-- to remove status bar 
display.setStatusBar(display.HiddenStatusBar)

-- draw the rectangle that is half the width and height of the screen size.
myRectangle = display.newRect(0, 0, widthOfRectangle, heightOfRectangle) 

-- anchor the rectangle in the top left corner of the screen and set its (x,y) position                                                                            

myRectangle.anchorX = 0
myRectangle.anchorY = 0
myRectangle.x = 20
myRectangle.y = 20

-- set the width of the border 
myRectangle.strokeWidth = 20

-- set the color of the rectangle
myRectangle:setFillColor(0, 0.5, 1)

-- set the colour of the border 
myRectangle:setStrokeColor(255/255, 255/255, 51/255)

-- calculate the area 
areaOfRectangle = widthOfRectangle * heightOfRectangle

-- write the area on the screen.
areaText = display.newText("The area of this rectangle with a width of\n"..
	widthOfRectangle .. " and a height of " .. heightOfRectangle .. " is " ..
	areaOfRectangle .. " .", 0, 0, Arial, textSize)	

-- anchor the text and set the (x,y) position
areaText.anchorX = 0
areaText.anchorY = 0
areaText.x = 20
areaText.y = display.contentHeight/3.2

-- set the colour of the newText
areaText:setTextColor(0, 0, 0)

-- draw the circle 
myCircle = display.newCircle(200, 200, 120) 

-- anchor the rectangle in the top left corner of the screen and set its (x,y) position                                                                            

myCircle.anchorX = 0
myCircle.anchorY = 0
myCircle.x = 20
myCircle.y = 345

-- set the width of the border 
myCircle.strokeWidth = 20

-- set the color of the rectangle
myCircle:setFillColor(0, 0, 1)

-- set the colour of the border 
myCircle:setStrokeColor(255/255, 255/255, 255/255)

-- calculate the area 
areaOfCircle = PI * radiusOfCircle * radiusOfCircle

-- write the area on the screen.
areaText = display.newText("The area of this circle with a radius of\n"..
	radiusOfCircle .. " and Pi which is " .. PI .. " is " ..
	areaOfCircle .. " .", 0, 0, Arial, textSize)	

-- anchor the text and set the (x,y) position
areaText.anchorX = 0
areaText.anchorY = 0
areaText.x = 20
areaText.y = display.contentHeight/1.3

-- set the colour of the newText
areaText:setTextColor(0, 0, 0)
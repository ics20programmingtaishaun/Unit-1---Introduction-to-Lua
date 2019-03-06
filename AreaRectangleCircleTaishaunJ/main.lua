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
myRectangle:setFillColor(255/255, 255/255, 51/255)
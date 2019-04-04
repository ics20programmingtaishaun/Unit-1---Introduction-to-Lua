-- Title: HelloWorld
-- Name: Taishaun
-- Course: ICS2O/3C
-- This program displays Hello to the simulator and to the command terminal.
---------------------------------------------------------------------------------------

-- print " It is the weekend " to the comand terminal 
print ("It is the weekend")

-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

-- sets the background colour
display.setDefault("background", 80/255, 255/255, 150/255)

-- create a local variable 
local textObject 

-- displays text on the screen at postion x = 500 and y = 500 with 
-- a default font style and font size of 65
textObject = display.newText("It is the weekend!", 500, 350, nil, 65)

-- sets the color of the text 
textObject:setTextColor(0/255, 0/255, 0/255) 

-- print " By: Taishaun Johnson " to the comand terminal
print ("By Taishaun Johnson ")

-- displays text on the screen at postion x = 500 and y = 450 with 
-- a default font style and font size of 50
textObject = display.newText("By Taishaun Johnson", 500, 450, nil, 50)

-- sets the color of the text 
textObject:setTextColor(255/255, 0/255, 0/255) 

-- Create a sound variable 
local correctSound = audio.loadSound( "Sounds/correctSound.mp3")
local correctSoundChannel 

correctSoundChannel =  audio.play(correctSound)

local composer = require( "composer" )
local scene = composer.newScene()
---------------------------------------------------------------------------------
-- All code outside of the listener functions will only be executed ONCE
-- unless "composer.removeScene()" is called.
---------------------------------------------------------------------------------

-- local forward references should go here
---------------------------------------------------------------------------------

local foreground
local launchPadLeft
local launchPadRight
local padTopLeft 
local padTopRight

local myCircle
local circle1
local circle2

local squareHt = 10
local squareWd = 10



--text:setTextColor( unpack(myColor) )

local squaresBottomLeftArray;
local squaresBottomRightArray;
local squaresTopLeftArray;
local squaresTopRightArray;
 
function createSquares(orientation, length) 
	local blue = { 0.25, 0.25, 0.75 }
    local gray = { 0.50, 0.50, 0.50 }
	local squaresArry, offset, squareY, squareX, identifier = {}, 20, 0, 0, "";
	if(orientation == "bottom left") then 
		squareY = 280
		squareX = 0
		identifier = "bottom left"
	elseif(orientation == "bottom right") then 
		squareY = 280
		squareX = 340
		identifier = "bottom right"
	elseif(orientation == "top left") then 
		--padTopLeft = display.newRect(130, 150, 245, 20)
		squareY = 150
		squareX = 0
		identifier = "top left"
	elseif(orientation == "top right") then 
		squareY = 150 
		squareX = 340 
		identifier = "top right"
	end

	for i = 1, length do 
		squareX = squareX + offset
		local square = display.newRect(squareX, squareY, squareHt, squareWd);
		if(orientation == "top left" or orientation == "bottom right") then 
		  square:setFillColor(unpack(blue))
		elseif(orientation == "top right" or orientation == "bottom left") then 
		  square:setFillColor(unpack(gray))
		end
		square.identifier = identifier
		table.insert(squaresArry, square)
	end
	return squaresArry
end


squaresBottomLeftArray = createSquares("bottom left", 10)
squaresBottomRightArray = createSquares("bottom right", 10)
squaresTopLeftArray = createSquares("top left", 10)
squaresTopRightArray = createSquares("top right", 10)

-- next scene
local function levelEventListener( event )
   local myParams = {
      param1 = "param1",
      param2 = "param2"
   }

   composer.gotoScene("level1", {effect="fade", time=500, params=myParams })
end

-- "scene:create()"
function scene:create( event )
	local sceneGroup = self.view
	foreground = display.newImage("foreground.png")
	foreground.width = 640
	foreground.height = 320
	foreground.anchorX = 0
	foreground.anchorY = 0

	launchPadLeftBottom = display.newRect(130, 280, 245, 20)
	launchPadRightBottom = display.newRect(442, 280, 245, 20)
	padTopLeft = display.newRect(130, 150, 245, 20)
	padTopRight = display.newRect(442, 150, 245, 20)

	sceneGroup:insert(foreground)
	sceneGroup:insert(launchPadLeftBottom)
	sceneGroup:insert(launchPadRightBottom)
	sceneGroup:insert(padTopLeft)
	sceneGroup:insert(padTopRight)

	--  Initialize the scene here.
	-- Example: add display objects to "sceneGroup", add touch listeners, etc.
end

-- "scene:show()"
function scene:show( event )
	local sceneGroup = self.view
	local phase = event.phase
	if ( phase == "will" ) then
		-- Called when the scene is still off screen (but is about to come on screen).
	elseif ( phase == "did" ) then
		-- Called when the scene is now on screen.
		-- Insert code here to make the scene come alive.
		-- Example: start timers, begin animation, play audio, etc.
	end
end

-- "scene:hide()"
function scene:hide( event )
	local sceneGroup = self.view
	local phase = event.phase
	if ( phase == "will" ) then
		-- Called when the scene is on screen (but is about to go off screen).
		-- Insert code here to "pause" the scene.
		-- Example: stop timers, stop animation, stop audio, etc.
	elseif ( phase == "did" ) then
		-- Called immediately after scene goes off screen.
	end
end

-- "scene:destroy()"
function scene:destroy( event )
	local sceneGroup = self.view
	-- Called prior to the removal of scene's view ("sceneGroup").
	-- Insert code here to clean up the scene.
	-- Example: remove display objects, save state, etc.
end
---------------------------------------------------------------------------------

-- Listener setup
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

--Runtime:addEventListener( "enterFrame", tmp )
---------------------------------------------------------------------------------

return scene
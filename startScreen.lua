local composer = require( "composer" )
local scene = composer.newScene()
---------------------------------------------------------------------------------
-- All code outside of the listener functions will only be executed ONCE
-- unless "composer.removeScene()" is called.
---------------------------------------------------------------------------------

-- local forward references should go here
---------------------------------------------------------------------------------

local startScreen
local startText

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
	startScreen = display.newImage("startScreen1.png")
	startText = display.newText( "START", display.contentCenterX+74, display.contentCenterY-10, native.systemFont, 28 )
	startText:setFillColor( 1, 1, 0 )
	startScreen.width = 640
	startScreen.height = 320
	startScreen.anchorX = 0
	startScreen.anchorY = 0
	sceneGroup:insert(startScreen)
	sceneGroup:insert(startText)
	-- Initialize the scene here.
	-- Example: add display objects to "sceneGroup", add touch listeners, etc.
end

-- "scene:show()"
function scene:show( event )
	local sceneGroup = self.view
	local phase = event.phase
	if ( phase == "will" ) then
		-- Called when the scene is still off screen (but is about to come on screen).
		startText:addEventListener("touch", levelEventListener)
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
---------------------------------------------------------------------------------

return scene
-- PILLPOPPER
-- Development by Matthew Maday
-- DBA - Weekend Warrior Collective
-- a 100% not-for-profit developer collective

-- This is the opening scene

--------------------------------------------------------------------------------------
-- External Libraries
--------------------------------------------------------------------------------------

	local fileio     = require ("classes.fileio")
	local strObj     = require ("classes.str")
	local uiObj      = require ("classes.ui")
	-- local easyfb 	 = require ("classes.easyfb")   
	local json       = require "json"
	local widget     = require( "widget" )
	local easingx    = require("classes.easing")  -- cool library i found- important easing"x"
	local storyboard = require ("storyboard")
	local mathLib    = require("classes.mathlib")

-----------------------------------------------------------------------------------------
-- Global Variables 
-----------------------------------------------------------------------------------------

	--local scene = storyboard.newScene()

-----------------------------------------------------------------------------------------
-- faceBook Functions 
-----------------------------------------------------------------------------------------




-----------------------------------------------------------------------------------------
-- local Functions 
-----------------------------------------------------------------------------------------


-----------------------------------------------------------------------------------------
-- storyboard Functions 
-----------------------------------------------------------------------------------------


function touchScreen(event)

end

--------------------------------------------------------------------------------------
-- INIT storyboard scene
--------------------------------------------------------------------------------------

function scene:createScene(event)


	return screenGroup

end
--------
function scene:enterScene(event)
end
--------
function scene:exitScene(event)



end

--------------------------------------------------------------------------------------
-- scene execution
--------------------------------------------------------------------------------------

scene:addEventListener("createScene", scene)
scene:addEventListener("enterScene", scene)
scene:addEventListener("exitScene", scene)


return scene






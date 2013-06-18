-- PILLPOPPER
-- Development by Matthew Maday
-- DBA - Weekend Warrior Collective
-- a 100% not-for-profit developer collective

-- This is the main scene

display.setStatusBar( display.HiddenStatusBar )

--------------------------------------------------------------------------------------
-- External Libraries
--------------------------------------------------------------------------------------

--local storyboard = require "storyboard"

--------------------------------------------------------------------------------------
-- variable declaritions
--------------------------------------------------------------------------------------
local gCollector           = {} 

--------------------------------------------------------------------------------------
-- functions
--------------------------------------------------------------------------------------

--------------------------------------------------------------------------------------
-- INIT storyboard scene
--------------------------------------------------------------------------------------

--------------------------------------------------------------------------------------
-- scene execution
--------------------------------------------------------------------------------------

  	gCollector[#gCollector+1] = {background=nil}
	gCollector.background = display.newImageRect("images/background.png", 640, 1136)


local function testMainScreen()
	require "views.screen_MainScreen"
	local mainScreen = MainScreen:new()

	mainScreen:show()
	Runtime:addEventListener("aboutScreenBackButtonTouched", function()
		print("Dude, you pressed the back button")
	end
	)
	-- local t = {}
	-- function t:timer(event)
	-- 	print("HELLLLLLLLOOOOO")
	-- 	mainScreen:hide()
	-- end
	-- timer.performWithDelay(2*1000,t)
end

local function testProgramScreen()
	require "views.screen_ProgramScreen"
	local programScreen = ProgramScreen:new()

	programScreen:show()

	-- local t = {}
	-- function t:timer(event)
	-- 	programScreen:hide()
	-- end
	-- timer.performWithDelay(2*1000,t)
end
--------
local function testPlanScreen()
	require "views.screen_PlanScreen"
	local planScreen = PlanScreen:new()

	planScreen:show()

	-- local t = {}
	-- function t:timer(event)
	-- 	planScreen:hide()
	-- end
	-- timer.performWithDelay(2*1000,t)
end
--------
local function testReportScreen()
	require "views.screen_ReportScreen"
	local reportScreen = ReportScreen:new()

	reportScreen:show()

	-- local t = {}
	-- function t:timer(event)
	-- 	reportScreen:hide()
	-- end
	-- timer.performWithDelay(2*1000,t)
end
--------
local function testSettingScreen()
	require "views.screen_SettingScreen"
	local settingScreen = SettingScreen:new()

	settingScreen:show()

	-- local t = {}
	-- function t:timer(event)
	-- 	settingScreen:hide()
	-- end
	-- timer.performWithDelay(2*1000,t)
end

 testMainScreen()
--testProgramScreen()
-- testPlanScreen()
-- testReportScreen()
-- testReportScreen()
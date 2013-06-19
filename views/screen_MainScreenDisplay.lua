-- Top Menu Panel

MainScreenDisplay = {}
local widget = require( "widget" )

function MainScreenDisplay:new()

	local screen = display.newGroup()

	------------------------------------------------------------------------------------------
	-- Primary Views
	------------------------------------------------------------------------------------------

	-- initialize()
	-- show()
	-- hide()

	function screen:initialize()

		local options = {
			width=36,                 -- width of one frame
			height=37,                -- height of one frame
			numFrames=2,              -- total number of frames in spritesheet
		    sheetContentWidth = 72,  -- width of original 1x size of entire sheet
    		sheetContentHeight = 37  -- height of original 1x size of entire sheet
		}

		screen.icons = graphics.newImageSheet("images/icons.png", options)
		
		local scrollView = widget.newScrollView
		{
		   left           = 0,
		   top            = 97,
		   width          = 400,
		   height         = 380,
		   scrollWidth    = 465,
		   scrollHeight   = 670,
		   friction       = 0.972,
		   hideBackground = true,
		   listener       = function(event)
			screen:scrollListener(event)
			end
			
		}

		self.scrollView    = scrollView
		screen:insert(self.scrollView)
		self.actionObjects = {}

	end
	--------
	function screen:show()

	end
	--------
	function screen:hide()


	end	
	

	------------------------------------------------------------------------------------------
	-- Supporting Functions
	------------------------------------------------------------------------------------------

	-- tweenButtons(obj, startX, endX, startY, endY, startAlpha, endAlpha)
	-- cancelTween(obj)
	-- getButton(image,w,h)

	function screen:scrollListener( event )

   		local phase = event.phase
   		print( phase )

   		local direction = event.direction

		   -- If the scrollView has reached it's scroll limit
		   if ( event.limitReached ) then
		      if ( "up" == direction ) then
		         print( "Reached Top Limit" )
		      elseif ( "down" == direction ) then
		         print( "Reached Bottom Limit" )
		      elseif ( "left" == direction ) then
		         print( "Reached Left Limit" )
		      elseif ( "right" == direction ) then
		         print( "Reached Right Limit" )
		      end
		   end
		   return true
	end
	--------
	function screen:addAlert(id, icon,status,time,med)

		print("ALERT ADDED",id, name)

		self.actionObjects[#self.actionObjects+1] = {background="hello", icon=nil, status=nil,time=nil,med=nil}
		local objFocus                            = self.actionObjects[#self.actionObjects]
		local obj                                 = display.newGroup()

		print("icons",screen.icons)

		-- insert background
		objFocus.background = display.newImageRect("images/panelBkg.png", 320,68)
		obj:insert(objFocus.background)
		objFocus.background.x, objFocus.background.y = 0, 0

		-- insert icon
		objFocus.icon = display.newImageRect(screen.icons,icon, 50,50)
		obj:insert(objFocus.icon)
		objFocus.icon:setReferencePoint(TopLeftReferencePoint)
		objFocus.icon.x, objFocus.icon.y = -(objFocus.background.width*.5)+30, 5

		-- insert status
		objFocus.status = display.newText(obj, status, 40, 20, "Myriad Pro", 25)
		objFocus.status:setTextColor(0, 0, 0)
		obj:insert(objFocus.status)
		objFocus.status:setReferencePoint(TopLeftReferencePoint)
		objFocus.status.x, objFocus.status.y = 0+30, 5

		-- insert time

		-- insert medication

		-- 
		
		

		self.scrollView:insert( obj)
		obj.x, obj.y = obj.width*.5, (#self.actionObjects-1)*56

	end
	--------
	function screen:tweenButtons(obj, startX, endX, startY, endY, startAlpha, endAlpha)

		-- obj.x,obj.y,obj.alpha = startX + obj.width*.5,startY, startAlpha

		-- screen:cancelTween(obj)

		-- obj.tween = transition.to(obj, {time=400,y=endY,alpha=endAlpha,onComplete=function()
		-- 	screen:cancelTween(obj)
		-- 	end
		-- 	})

		-- return startX + obj.width
	end
	--------
	function screen:cancelTween(obj)

		-- if obj.tween ~= nil then
		-- 	transition.cancel(obj.tween)
		-- 	obj.tween = nil
		-- end
	end
	--------
	function screen:getButton(image,name,pos,endpos,w,h)

		-- local options = {{ name=name, frames={pos,endpos}, time=0, loopCount=2 }}
		-- local img = display.newSprite(image, options)

		-- img:setFrame(1)
		-- self:insert(img)
		
		-- function img:touch(event)
		-- 	screen:onButtonTouch(event)
		-- end
		-- img:addEventListener("touch",img)
		-- return img
	end
	--------
	function screen:onButtonTouch(event)

		-- if event.target == self.programButton then 
		-- 	print("program button pressed")
		-- 	if event.phase == "began" then
		-- 		gCollector.textBlock.text = "1"
		-- 		self.programButton:setFrame(2)
		-- 	elseif event.phase == "ended" then 
		-- 		self.programButton:setFrame(1) 
		-- 	end
		-- elseif event.target == self.planButton then 
		-- 	print("plan button pressed")
		-- 	if event.phase == "began" then
		-- 		gCollector.textBlock.text =  "2"
		-- 		self.planButton:setFrame(2)
		-- 	elseif event.phase == "ended" then 
		-- 		self.planButton:setFrame(1) 
		-- 	end
		-- elseif event.target == self.reportsButton then 
		-- 	print("reports button pressed")
		-- 	if event.phase == "began" then
		-- 		gCollector.textBlock.text =  "3"
		-- 		self.reportsButton:setFrame(2)
		-- 	elseif event.phase == "ended" then 
		-- 		self.reportsButton:setFrame(1) 
		-- 	end
		-- elseif event.target == self.settingsButton then 
		-- 	print("settings button pressed")
		-- 	if event.phase == "began" then
		-- 		gCollector.textBlock.text = "4"
		-- 		self.settingsButton:setFrame(2)
		-- 	elseif event.phase == "ended" then 
		-- 		self.settingsButton:setFrame(1) 
		-- 	end
		-- end

		-- return true
	end
	-------


	screen:initialize()

	return screen

end

return MainScreenDisplay
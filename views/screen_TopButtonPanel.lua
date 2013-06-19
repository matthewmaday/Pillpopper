-- Top Menu Panel

TopButtonPanel = {}

function TopButtonPanel:new()

	local screen = display.newGroup()

	------------------------------------------------------------------------------------------
	-- Primary Views
	------------------------------------------------------------------------------------------

	-- initialize()
	-- show()
	-- hide()

	function screen:initialize()

		local options = {
			width              = 80,  -- width of one frame
			height             = 76,  -- height of one frame
			numFrames 		   = 8,   -- total number of frames in spritesheet
		    sheetContentWidth  = 320, -- width of original 1x size of entire sheet
    		sheetContentHeight = 154  -- height of original 1x size of entire sheet
		}

		screen.topSheet = graphics.newImageSheet("images/toppanel.png", options)
		
		local programButton  = self:getButton(screen.topSheet, "programBTN", 1,5,options.width,options.height)
		self.programButton   = programButton

		local planButton     = self:getButton(screen.topSheet, "planBTN", 2,6,options.width,options.height)
		self.planButton      = planButton

		local reportsButton  = self:getButton(screen.topSheet, "reportsBTN", 3,7,options.width,options.height)
		self.reportsButton   = reportsButton

		local settingsButton = self:getButton(screen.topSheet, "settingsBTN", 4,8,options.width,options.height)
		self.settingsButton  = settingsButton

	end
	--------
	function screen:show()

		local programButton  = self.programButton
		local planButton     = self.planButton
		local reportsButton  = self.reportsButton
		local settingsButton = self.settingsButton

		local w = 0
		w = self:tweenButtons(programButton, w, w, -(programButton.height*.5), programButton.height*.5, 0, 1)
		w = self:tweenButtons(planButton, w, w, -(planButton.height*.5), planButton.height*.5, 0, 1)
		w = self:tweenButtons(reportsButton, w, w, -(reportsButton.height*.5), reportsButton.height*.5, 0, 1)
		w = self:tweenButtons(settingsButton, w, w, -(settingsButton.height*.5), settingsButton.height*.5, 0, 1)

	end
	--------
	function screen:hide()

		local programButton  = self.programButton
		local planButton     = self.planButton
		local reportsButton  = self.reportsButton
		local settingsButton = self.settingsButton

		local w = 0
		w = self:tweenButtons(programButton, w, w, programButton.height*.5, -(programButton.height*.5), 1, 0)
		w = self:tweenButtons(planButton, w, w, planButton.height*.5, -(planButton.height*.5), 1, 0)
		w = self:tweenButtons(reportsButton, w, w, reportsButton.height*.5, -(reportsButton.height*.5),  1, 0)
		w = self:tweenButtons(settingsButton, w, w, settingsButton.height*.5,-(settingsButton.height*.5), 1, 0)

	end	
	

	------------------------------------------------------------------------------------------
	-- Supporting Functions
	------------------------------------------------------------------------------------------

	-- tweenButtons(obj, startX, endX, startY, endY, startAlpha, endAlpha)
	-- cancelTween(obj)
	-- getButton(image,w,h)

	function screen:tweenButtons(obj, startX, endX, startY, endY, startAlpha, endAlpha)

		obj.x,obj.y,obj.alpha = startX + obj.width*.5,startY, startAlpha

		screen:cancelTween(obj)

		obj.tween = transition.to(obj, {time=400,y=endY,alpha=endAlpha,onComplete=function()
			screen:cancelTween(obj)
			end
			})

		return startX + obj.width
	end
	--------
	function screen:cancelTween(obj)

		if obj.tween ~= nil then
			transition.cancel(obj.tween)
			obj.tween = nil
		end
	end
	--------
	function screen:getButton(image,name,pos,endpos,w,h)

		local options = {{ name=name, frames={pos,endpos}, time=0, loopCount=2 }}
		local img = display.newSprite(image, options)

		img:setFrame(1)
		self:insert(img)
		
		function img:touch(event)
			screen:onButtonTouch(event)
		end
		img:addEventListener("touch",img)
		return img
	end
	--------
	function screen:onButtonTouch(event)

		if event.target == self.programButton then 
			print("program button pressed")
			if event.phase == "began" then
				gCollector.textBlock.text = "1"
				self.programButton:setFrame(2)
			elseif event.phase == "ended" then 
				self.programButton:setFrame(1) 
			end
		elseif event.target == self.planButton then 
			print("plan button pressed")
			if event.phase == "began" then
				gCollector.textBlock.text =  "2"
				self.planButton:setFrame(2)
			elseif event.phase == "ended" then 
				self.planButton:setFrame(1) 
			end
		elseif event.target == self.reportsButton then 
			print("reports button pressed")
			if event.phase == "began" then
				gCollector.textBlock.text =  "3"
				self.reportsButton:setFrame(2)
			elseif event.phase == "ended" then 
				self.reportsButton:setFrame(1) 
			end
		elseif event.target == self.settingsButton then 
			print("settings button pressed")
			if event.phase == "began" then
				gCollector.textBlock.text = "4"
				self.settingsButton:setFrame(2)
			elseif event.phase == "ended" then 
				self.settingsButton:setFrame(1) 
			end
		end

		return true
	end
	-------


	screen:initialize()

	return screen

end

return TopButtonPanel
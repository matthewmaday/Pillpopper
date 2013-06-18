-- MAIN SCREEN

MainScreen = {}

function MainScreen:new()

	local screen = display.newGroup()

	------------------------------------------------------------------------------------------
	-- Primary Views
	------------------------------------------------------------------------------------------

	-- initialize()
	-- show()
	-- hide()

	function screen:initialize()

		local options = {
			width=80, 
			height=77, 
			numFrames=8,
		    sheetContentWidth = 320,  -- width of original 1x size of entire sheet
    		sheetContentHeight = 154  -- height of original 1x size of entire sheet
		}

		screen.topSheet = graphics.newImageSheet("images/toppanel.png", options)
		
		local programButton  = self:getButton(screen.topSheet, 1,80,77)
		self.programButton   = programButton

		local planButton     = self:getButton(screen.topSheet, 2,80,77)
		self.planButton      = planButton

		local reportsButton  = self:getButton(screen.topSheet, 3,80,77)
		self.reportsButton   = reportsButton

		local settingsButton = self:getButton(screen.topSheet, 4,80,77)
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
	function screen:getButton(image,pos,w,h)

	local sequenceData =
		{
		    { name="running", frames={1,2,3,4,5,6,7,8}, time=0, loopCount=8 },
		}

		local img = display.newSprite(image, sequenceData)
		img:setFrame(pos)

		self.image = img
		self.image.x,self.image.y  = self.image.width*.5,self.height*.5

		self:insert(self.image)
		
		function img:touch(event)
			screen:onButtonTouch(event)
		end
		img:addEventListener("touch",img)
		return img
	end
	--------
	function screen:onButtonTouch(event)

		if event.target == self.programButton then 
			if event.phase == "began" then


				self.image:setFrame(5)
				


			elseif event.phase == "ended" then
				self.image:setFrame(1) 
				self.image.x,self.image.y  = self.image.width*.5,self.height*.5
			end

		end
		return true
	end
	-------


	screen:initialize()

	return screen

end

return MainScreen
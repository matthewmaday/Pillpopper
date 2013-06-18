-- PROGRAM SCREEN

ProgramScreen = {}

function ProgramScreen:new()

	local screen = display.newGroup()

	------------------------------------------------------------------------------------------
	-- Primary Views
	------------------------------------------------------------------------------------------

	-- initialize()
	-- show()
	-- hide()
	
	function screen:initialize()

		local programButton  = self:getButton("images/programs0.png",77,78)
		self.programButton   = programButton

	end
	--------
	function screen:show()

		local programButton  = self.programButton
		local w = 0
		w = self:tweenButtons(programButton, w, w, -(programButton.height*.5), programButton.height*.5, 0, 1)


	end
	--------
	function screen:hide()

		local programButton  = self.programButton
		local w = 0
		w = self:tweenButtons(programButton, w, w, programButton.height*.5, -(programButton.height*.5), 1, 0)


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
	function screen:getButton(image,w,h)
		local img =display.newImageRect(image, w, h)
		self:insert(img)
		function img:touch(event)
			screen:onButtonTouch(event)
		end
		img:addEventListener("touch",img)
		return img
	end

	screen:initialize()

	return screen

end

return ProgramScreen
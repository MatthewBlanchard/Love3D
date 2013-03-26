Controller = Object:new()

function Controller:Controller(entity)
	self.controlled = entity
end

local hw, hh = love.graphics.getWidth()/2, love.graphics.getHeight()/2
function Controller:update(dt)
	if love.keyboard.isDown("w") then
		self.controlled:moveForward(0, 0, 25*dt)
	elseif love.keyboard.isDown("s") then
		self.controlled:moveForward(0, 0, -25*dt)
	elseif love.keyboard.isDown("a") then
		self.controlled:moveForward(-13*dt, 0, 0)
	elseif love.keyboard.isDown("d") then
		self.controlled:moveForward(13*dt, 0, 0)
	end

	local mx, my = love.mouse.getX(), love.mouse.getY()
	if not (mx/hw == 0 and my/hh == 0) then
		self.controlled:rotate(-((mx/hw)-1), ((my/hh)-1))
	end	

	love.mouse.setPosition(hw, hh)
end
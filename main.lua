require "loove"
require "camera"
require "spoon"

Game = Object:new()

function Game:Game()
	self.camera = Camera:new(90)
	self.mdl = Mesh:new(spoon, Vector:new(0, 0, 4))

	love.mouse.setGrab(true)
	love.mouse.setVisible(false)
end

function Game:update(dt)
	print(1/dt)

	-- Movement
	if love.keyboard.isDown("w") then
		self.camera:move(0, 0, 1*dt)
	elseif love.keyboard.isDown("s") then
		self.camera:move(0, 0, -1*dt)
	end

	-- Camera
	local mx, my = love.mouse.getX(), love.mouse.getY()
	local hw, hh = love.graphics.getWidth()/2, love.graphics.getHeight()/2
	if not (mx/hw == 0 and my/hh == 0) then
		self.camera:rotate(-((mx/hw)-1), ((my/hh)-1))
	end	
	
	self.mdl.rot = self.mdl.rot*Quaternion:fromAngle(0, 1*dt, 1*dt)

	love.mouse.setPosition(hw, hh)
end

function Game:draw()
	self.camera:draw(self.mdl)
end

function Game:keypressed(key)
	if key == "escape" then
      	love.event.push("quit")
   	end
end

love.state(Game:new(math.rad(90)))
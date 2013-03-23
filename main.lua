require "loove"
require "camera"
require "teapot"

Game = Object:new()

function Game:Game()
	self.camera = Camera:new(90)
	self.mdl = Mesh:new(teapot, Vector:new(0, 0, 40))

	love.graphics.setMode(800, 600, false, false)
	love.mouse.setGrab(true)
	love.mouse.setVisible(false)
end

local fps, frames, ttime, ltime = 0, 0, 0, 0	-- fps, frame counter, time accumulator, last time
function Game:update(dt)
	-- Update fps counter twice per second.
	-- This keeps track of the number of frames rendered in each time period.
	local ctime = love.timer.getMicroTime()	-- current time
	ttime = ttime + (ctime - ltime)
	ltime = ctime
	frames = frames + 1
	if ttime >= 0.5 then
		fps = math.floor(frames / ttime + 0.5)
		frames, ttime = 0, 0
	end

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

local cwhite = {0xff, 0xff, 0xff}	-- color white
function Game:draw()
	self.camera:draw(self.mdl)

	love.graphics.setColor(cwhite)
	love.graphics.print("FPS: " .. fps, 0, 0)
end

function Game:keypressed(key)
	if key == "escape" then
      	love.event.push("quit")
   	end
end

love.state(Game:new(math.rad(90)))
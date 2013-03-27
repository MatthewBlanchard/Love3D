require "loove"
require "camera"
require "fps"
require "controller"

local monkey = require "monkey"

Game = Object:new()

function Game:Game()
	self.fps = FPS:new()
	self.camera = Camera:new(math.rad(74))
	self.controller = Controller:new(self.camera)

	-- Set up monkey head
	local verts, faces = Mesh.OBJ(monkey)
	self.mdl = Mesh:new(verts, faces, Vector(1, 0, 0))
	self.mdl:setPos(Vector(0, 0, 4))

	love.graphics.setMode(800, 600, false, false)
	love.mouse.setGrab(true)
	love.mouse.setVisible(false)
end

function Game:update(dt)
	self.fps:update(dt)
	self.controller:update(dt)

	self.mdl:rotate(0, 1*dt, 1*dt)
end

function Game:draw()
	self.camera:drawsorted(self.mdl)
	self.fps:draw()
end

function Game:keypressed(key)
	if key == "escape" then
      	love.event.push("quit")
   	end
end

love.state(Game:new())

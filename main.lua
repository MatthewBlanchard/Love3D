require "./Object/object"
require "./lOOve/loove"
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
	self.mdl = Mesh.OBJ(monkey, Vector(1, 0, 0))
	self.mdl:setPos(Vector(0, 0, 4))

	self.mdl2 = Mesh.OBJ(monkey, Vector(1, 0, 0))
	self.mdl2:setPos(Vector(2, 0, 4))

	self.mdl3 = Mesh.OBJ(monkey, Vector(1, 0, 0))
	self.mdl3:setPos(Vector(4, 0, 4))

	self.mdl4 = Mesh.OBJ(monkey, Vector(1, 0, 0))
	self.mdl4:setPos(Vector(6, 0, 4))


	love.window.setMode(800, 600)
	love.mouse.setGrabbed(true)
	love.mouse.setVisible(false)
end

function Game:update(dt)
	self.fps:update(dt)
	self.controller:update(dt)

	self.mdl:rotate(0, 1*dt, 1*dt)
end

function Game:draw()
	self.camera:drawsorted(self.mdl)
	self.camera:drawsorted(self.mdl2)
		self.camera:drawsorted(self.mdl3)
	self.camera:drawsorted(self.mdl4)
	self.fps:draw()
end

function Game:keypressed(key)
	if key == "escape" then
      	love.event.push("quit")
   	end
end

love.state(Game:new())

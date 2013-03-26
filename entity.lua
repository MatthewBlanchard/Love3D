require "vector"
require "quaternion"

Entity = Object:new()

Entity.pos = Vector:new(0, 0, 0)
Entity.rot = Quaternion:new(0, 0, 0, 1)

function Entity:move(x, y, z)
	if type(x) ~= "table" then
		self.pos.x = self.pos.x + x
		self.pos.y = self.pos.y + y
		self.pos.z = self.pos.z + z
	else
		self.pos = self.pos + x
	end
end

function Entity:setPos(x, y, z)
	if type(x) ~= "table" then
		self.pos.x = x
		self.pos.y = y
		self.pos.z = z
	else
		self.pos = x
	end
end

function Entity:rotate(x, y, z)
	if type(x) == "table" then
		x, y, z = x.x, x.y, x.z
	end

	self.rot = Quaternion:fromAngle(0, 0, x or 0)*self.rot
	self.rot = Quaternion:fromAngle(0, y or 0, 0)*self.rot
	self.rot = Quaternion:fromAngle(z or 0, 0, 0)*self.rot
	self.rot:normal()
end

function Entity:setRot(x, y, z)
	if type(x) == "table" then
		x, y, z = x.x, x.y, x.z
	end

	self.rot = Quaternion:fromAngle(0, 0, x or 0) 
	self.rot = Quaternion:fromAngle(0, y or 0, 0)
	self.rot = Quaternion:fromAngle(z or 0, 0, 0)
	self.rot:normal()
end

function Entity:moveForward(x, y, z)
	local vec
	if type(x) == "table" then
		vec = x
	else
		vec = Vector:new(x, y, z)
	end
	self.pos = self.pos + self.rot:conjugate():rotate(vec)
end
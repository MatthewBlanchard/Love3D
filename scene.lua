require "quaternion"
require "model"
require "spoon"

Scene = Object:new()

local hw, hh = love.graphics.getWidth()/2, love.graphics.getHeight()/2

function Scene:Scene(vfov)
	self.focallen = .5/math.tan(vfov/2)
	self.pos = Vector:new(0, 0, 0)
	self.rot = Quaternion(0, 0, 0, 1);
	self.mdl = Model:new(spoon, Vector:new(0, 0, 4))

	love.mouse.setGrab(true)
	love.mouse.setVisible(false)
end

function Scene:keypressed(key)
	if key == "escape" then
      	love.event.push("quit")
   	end
end

function Scene:update(dt)
	print(1/dt)
	local mx, my = love.mouse.getX(), love.mouse.getY()

	if love.keyboard.isDown("w") then
		self.rot:normal()
		local move = self.rot:rotate(Vector:new(0, 0, 1*dt))
		--print("move:\t" .. tostring(move))
		--print("pos:\t" .. tostring(self.pos))
		--print("rot:\t" .. tostring(self.rot))
		self.pos = self.pos + move
	elseif love.keyboard.isDown("s") then
	end

	self.rot = Quaternion:fromAngle(0, 0, -((mx/hw)-1))*self.rot
	self.rot = Quaternion:fromAngle(0, ((my/hh)-1), 0)*self.rot

	self.rot:normal()

	self.mdl.rot = self.mdl.rot*Quaternion:fromAngle(0, 1*dt, 1*dt)

	love.mouse.setPosition(hw, hh)
end

function Scene:draw()
	self:drawmdl(self.mdl)
end

local nverts, sverts = {}, {}

local tempvec = Vector:new(0, 0, 0)
local edgeo, edget, norm = Vector:new(0,0,0), Vector:new(0,0,0), Vector:new(0,0,0)
local avg, lightvec, lightnorm = Vector:new(0, 0, 0), Vector:new(0, 0, 2), Vector:new(0, 0, 0)
-- Draw a model
function Scene:drawmdl(mdl)
	love.graphics.push()
	love.graphics.translate(hw, hh)
	love.graphics.scale(love.graphics.getWidth())

	local depthn = 0
	local flen, rot = self.focallen, self.rot
	local mrot = mdl.rot
	local mpos = mdl.pos-self.pos

	lightvec = self.rot:rotate(Vector(0, 0, 2) + mpos)

	if not nverts[mdl] then nverts[mdl] = {} sverts[mdl] = {} end
	for k,v in pairs(mdl.vertices) do
		if not nverts[k] then nverts[k] = Vector:new() sverts[k] = {0, 0} end
		tempvec.x, tempvec.y, tempvec.z = mrot:inlinerotate(v)
		nverts[k].x, nverts[k].y, nverts[k].z = rot:inlinerotate(tempvec:fastadd(tempvec, mpos))

		sverts[k].x = nverts[k].x * (flen/nverts[k].z)
		sverts[k].y = nverts[k].y * (flen/nverts[k].z)

		if nverts[k].z < 0 then sverts[k].x = math.huge sverts[k].y = math.huge end
	end

	for k,v in pairs(mdl.faces) do
		avg.x = (nverts[v[1]].x+nverts[v[2]].x+nverts[v[3]].x)/3
		avg.y = (nverts[v[1]].y+nverts[v[2]].y+nverts[v[3]].y)/3
		avg.z = (nverts[v[1]].z+nverts[v[2]].z+nverts[v[3]].z)/3

		edgeo = edgeo:fastsub(nverts[v[3]], nverts[v[1]])
		edget = edget:fastsub(nverts[v[3]], nverts[v[2]])	

		norm = norm:fastcross(edgeo, edget)
		norm = norm:fastnormal(norm)
		local ang = nverts[v[1]]:dot(norm)

		edgeo = edgeo:fastsub(nverts[v[3]], nverts[v[1]])
		edget = edget:fastsub(nverts[v[3]], nverts[v[2]])
		norm = norm:fastcross(edgeo, edget):fastnormal(norm)
		lightnorm:fastsub(norm, lightvec)
		lightnorm:fastnormal(lightnorm)
		local l = math.max(norm:dot(lightnorm), 0)

		if ang < 0 then
			local avg = (mdl.vertices[v[1]].x + mdl.vertices[v[2]].x + mdl.vertices[v[3]].x)/3
			love.graphics.setColor(200*l, 30*l, 200*l)
			love.graphics.triangle("fill", 
				sverts[v[1]].x, sverts[v[1]].y,
				sverts[v[2]].x, sverts[v[2]].y,
				sverts[v[3]].x, sverts[v[3]].y
			)
		end
	end

	love.graphics.pop()
end
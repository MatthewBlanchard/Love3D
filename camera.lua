require "quaternion"
require "mesh"
require "spoon"

Camera = Object:new()

local hw, hh = love.graphics.getWidth()/2, love.graphics.getHeight()/2

function Camera:Camera(vfov)
	self.focallen = .5/math.tan(vfov/2)
	self.pos = Vector:new(0, 0, 0)
	self.rot = Quaternion:fromAngle(0, 0, 0);
end

function Camera:rotate(x, y)
	self.rot = Quaternion:fromAngle(0, 0, x)*self.rot
	self.rot = Quaternion:fromAngle(0, y, 0)*self.rot
	self.rot:normal()
end

function Camera:move(x, y, z)
	self.pos = self.pos + self.rot:conjugate():rotate(Vector:new(x, y, z))
end


-- UGLY OPTIMIZATION ZONE BELOW

local nverts, sverts = {}, {}

local tempvec, edgeo, edget, avg, lightvec, lightnorm = Vector:new(0, 0, 0),
	Vector:new(0, 0, 0), Vector:new(0, 0, 0), Vector:new(0, 0, 0),
	Vector:new(0, 0, 0), Vector:new(0, 0, 2)
-- Draw a model
function Camera:draw(mdl)
	love.graphics.push()
	love.graphics.translate(hw, hh)
	love.graphics.scale(love.graphics.getWidth())

	local depthn = 0
	local flen, rot = self.focallen, self.rot
	local mrot = mdl.rot
	local mpos = mdl.pos-self.pos

	lightvec = self.rot:fastrotate(Vector(0, 0, 2) + mpos)

	if not nverts[mdl] then nverts[mdl] = {} sverts[mdl] = {} end
	for i = 1, #mdl.vertices do
		if not nverts[i] then nverts[i] = Vector:new() sverts[i] = {0, 0} end
		tempvec.x, tempvec.y, tempvec.z = mrot:inlinerotate(mdl.vertices[i])
		nverts[i].x, nverts[i].y, nverts[i].z = rot:inlinerotate(tempvec:fastadd(tempvec, mpos))
		--print(rot)
		--print(nverts[i])
		--print(mdl.pos)
		sverts[i].x = nverts[i].x * (flen/nverts[i].z)
		sverts[i].y = nverts[i].y * (flen/nverts[i].z)

		if nverts[i].z < 0 then sverts[i].x = math.huge sverts[i].y = math.huge end
	end

	for i = 1, #mdl.faces do
		avg.x = (nverts[mdl.faces[i][1]].x+nverts[mdl.faces[i][2]].x+nverts[mdl.faces[i][3]].x)/3
		avg.y = (nverts[mdl.faces[i][1]].y+nverts[mdl.faces[i][2]].y+nverts[mdl.faces[i][3]].y)/3
		avg.z = (nverts[mdl.faces[i][1]].z+nverts[mdl.faces[i][2]].z+nverts[mdl.faces[i][3]].z)/3

		edgeo = edgeo:fastsub(nverts[mdl.faces[i][3]], nverts[mdl.faces[i][1]])
		edget = edget:fastsub(nverts[mdl.faces[i][3]], nverts[mdl.faces[i][2]])	

		local tempvec = tempvec:fastcross(edgeo, edget)
		tempvec = tempvec:fastnormal(tempvec)
		local ang = nverts[mdl.faces[i][1]]:dot(tempvec)

		lightnorm:fastsub(tempvec, lightvec)
		lightnorm:fastnormal(lightnorm)
		local l = math.max(tempvec:dot(lightnorm), 0)

		if ang < 0 then
			local avg = (mdl.vertices[mdl.faces[i][1]].x + mdl.vertices[mdl.faces[i][2]].x + mdl.vertices[mdl.faces[i][3]].x)/3
			love.graphics.setColor(200*l, 30*l, 200*l)
			love.graphics.triangle("fill", 
				sverts[mdl.faces[i][1]].x, sverts[mdl.faces[i][1]].y,
				sverts[mdl.faces[i][2]].x, sverts[mdl.faces[i][2]].y,
				sverts[mdl.faces[i][3]].x, sverts[mdl.faces[i][3]].y
			)
		end
	end

	love.graphics.pop()
end
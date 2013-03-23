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
		local nv = nverts[i]
		tempvec.x, tempvec.y, tempvec.z = mrot:inlinerotate(mdl.vertices[i])
		nv.x, nv.y, nv.z = rot:inlinerotate(tempvec:fastadd(tempvec, mpos))

		sverts[i].x = nv.x * (flen/nv.z)
		sverts[i].y = nv.y * (flen/nv.z)

		if nverts[i].z < 0 then sverts[i].x = math.huge sverts[i].y = math.huge end
	end

	for i = 1, #mdl.faces do
		local v = mdl.faces[i]

		edgeo = edgeo:fastsub(nverts[v[3]], nverts[v[1]])
		edget = edget:fastsub(nverts[v[3]], nverts[v[2]])	

		local tempvec = tempvec:fastcross(edgeo, edget)
		tempvec = tempvec:fastnormal(tempvec)
		local ang = nverts[v[1]]:dot(tempvec)

		lightnorm:fastsub(tempvec, lightvec)
		lightnorm:fastnormal(lightnorm)
		local l = math.max(tempvec:dot(lightnorm), 0)

		if ang < 0 then
			love.graphics.setColor(mdl.color.x*l*255, mdl.color.y*l*255, mdl.color.z*l*255)
			love.graphics.triangle("fill", 
				sverts[v[1]].x, sverts[v[1]].y,
				sverts[v[2]].x, sverts[v[2]].y,
				sverts[v[3]].x, sverts[v[3]].y
			)
		end
	end

	love.graphics.pop()
end
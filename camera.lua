require "quaternion"
require "model"
require "spoon"

Camera = Object:new()

local hw, hh = love.graphics.getWidth()/2, love.graphics.getHeight()/2

function Camera:Camera(vfov)
	self.focallen = .5/math.tan(vfov/2)
	self.pos = Vector:new(0, 0, 0)
	self.rot = Quaternion:fromAngle(0, 0, 0);

	love.mouse.setGrab(true)
	love.mouse.setVisible(false)
end

function Camera:rotate(x, y)
	print(x, y)
	self.rot = Quaternion:fromAngle(0, 0, x)*self.rot
	self.rot = Quaternion:fromAngle(0, y, 0)*self.rot
	self.rot:normal()
end

function Camera:move(x, y, z)
	self.pos = self.pos + self.rot:conjugate():rotate(Vector:new(x, y, z))
end


-- UGLY OPTIMIZATION ZONE BELOW

local nverts, sverts = {}, {}

local tempvec, edgeo, edget, norm, avg, lightvec, lightnorm = Vector:new(0, 0, 0),
	Vector:new(0, 0, 0), Vector:new(0, 0, 0), Vector:new(0, 0, 0),
	Vector:new(0, 0, 0), Vector:new(0, 0, 2), Vector:new(0, 0, 0)
-- Draw a model
function Camera:draw(mdl)
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
		--print(rot)
		--print(nverts[k])
		--print(mdl.pos)
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
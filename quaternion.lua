require "vector"

Quaternion = Object:new()

function Quaternion:Quaternion(x, y, z, w)
	self.x = x
	self.y = y
	self.z = z
	self.w = w
end

-- Static methods

local sin, cos = math.sin, math.cos
function Quaternion:fromAngle(r, p, y)
	--local a = love.timer.getMicroTime()
	cyaw = cos(0.5 * y)
	cpitch = cos(0.5 * p)
	croll = cos(0.5 * r)
	syaw = sin(0.5 * y)
	spitch = sin(0.5 * p)
	sroll = sin(0.5 * r)
	--print(love.timer.getMicroTime() - a)

	cycp = cyaw * cpitch
	sysp = syaw * spitch
	cysp = cyaw * spitch
	sycp = syaw * cpitch

	w = cycp * croll + sysp * sroll
	x = cysp * croll + sycp * sroll
	y = sycp * croll - cysp * sroll
	z = cycp * sroll - sysp * croll

	return Quaternion:new(x, y, z, w)
end

-- Metamethods

function Quaternion:__tostring()
	return self.x .. "\t" .. self.y .. "\t" .. self.z .. "\t" .. self.w
end

function Quaternion:__mul(quat)
	local x, y, z, w = self.x, self.y, self.z, self.w
	return Quaternion:new(
						w * quat.x + x * quat.w + y * quat.z - z * quat.y,
	                	w * quat.y + y * quat.w + z * quat.x - x * quat.z,
	                 	w * quat.z + z * quat.w + x * quat.y - y * quat.x,
	                 	w * quat.w - x * quat.x - y * quat.y - z * quat.z)
end

-- Methods
local sqrt = math.sqrt
function Quaternion:normal()
	local mag = sqrt(self.w * self.w +
					self.x * self.x +
					self.y * self.y +
					self.z * self.z)

	self.w = self.w/mag
	self.x = self.x/mag
	self.y = self.y/mag
	self.z = self.z/mag
end

function Quaternion:forward()
	x = self.x
	y = self.y
	z = self.z
	w = self.w
	return Vector:new( 	2 * (x * z + w * y), 
                    	2 * (y * x - w * x),
                    	1 - 2 * (x * x + y * y)
                    )
end

function Quaternion:conjugate()
	return Quaternion:new(-self.x, -self.y, -self.z, self.w)
end

-------------- WARNING MICRO OPTIMIZATION BECAUSE ITS NEEDED

function Quaternion:rotate(vec)
	local sx, sy, sw, sz = self.x, self.y, self.w, self.z
	local nx, ny, nz, mag = vec:inlinenormal()

	local cx, cy, cz, cw = -self.x, -self.y, -self.z, self.w
	local rx, ry, rz, rw = 
						nx * cw + ny * cz - nz * cy,
	                	ny * cw + nz * cx - nx * cz,
	                 	nz * cw + nx * cy - ny * cx,
	                 	0 - nx * cx - ny * cy - nz * cz
	rx, ry, rz = 
			(sw * rx + sx * rw + sy * rz - sz * ry)*mag,
	       	(sw * ry + sy * rw + sz * rx - sx * rz)*mag,
	        (sw * rz + sz * rw + sx * ry - sy * rx)*mag

	return Vector:new(rx*mag, ry*mag, rz*mag)
end

function Quaternion:inlinerotate(vec)
	local sx, sy, sw, sz = self.x, self.y, self.w, self.z
	local nx, ny, nz, mag = vec:inlinenormal()

	local cx, cy, cz, cw = -self.x, -self.y, -self.z, self.w
	local rx, ry, rz, rw = 
						nx * cw + ny * cz - nz * cy,
	                	ny * cw + nz * cx - nx * cz,
	                 	nz * cw + nx * cy - ny * cx,
	                 	0 - nx * cx - ny * cy - nz * cz
	
	return	(sw * rx + sx * rw + sy * rz - sz * ry)*mag,
	       	(sw * ry + sy * rw + sz * rx - sx * rz)*mag,
	        (sw * rz + sz * rw + sx * ry - sy * rx)*mag
end

function Quaternion:fastrotate(vec)
	local sx, sy, sw, sz = self.x, self.y, self.w, self.z
	local nx, ny, nz, mag = vec:inlinenormal()

	local cx, cy, cz, cw = -self.x, -self.y, -self.z, self.w
	local rx, ry, rz, rw = 
						nx * cw + ny * cz - nz * cy,
	                	ny * cw + nz * cx - nx * cz,
	                 	nz * cw + nx * cy - ny * cx,
	                 	0 - nx * cx - ny * cy - nz * cz

	vec.x , vec.y, vec.z = 
			(sw * rx + sx * rw + sy * rz - sz * ry)*mag,
	       	(sw * ry + sy * rw + sz * rx - sx * rz)*mag,
	        (sw * rz + sz * rw + sx * ry - sy * rx)*mag
	return vec
end
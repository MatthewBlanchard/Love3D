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

local vecQuat = Quaternion:new(0, 0, 0, 0)
local conjugate = Quaternion:new(0, 0, 0, 0)
local resQuat = Quaternion:new(0, 0, 0, 0)
local normvec = Vector:new(0, 0, 0)
function Quaternion:rotate(vec)
	normvec.x, normvec.y, normvec.z, mag = vec:inlinenormal()

	vecQuat.x, vecQuat.y, vecQuat.z = normvec.x, normvec.y, normvec.z
	conjugate.x, conjugate.y, conjugate.z, conjugate.w = -self.x, -self.y, -self.z, self.w
	resQuat.x , resQuat.y, resQuat.z, resQuat.w = 
						vecQuat.w * conjugate.x + vecQuat.x * conjugate.w + vecQuat.y * conjugate.z - vecQuat.z * conjugate.y,
	                	vecQuat.w * conjugate.y + vecQuat.y * conjugate.w + vecQuat.z * conjugate.x - vecQuat.x * conjugate.z,
	                 	vecQuat.w * conjugate.z + vecQuat.z * conjugate.w + vecQuat.x * conjugate.y - vecQuat.y * conjugate.x,
	                 	vecQuat.w * conjugate.w - vecQuat.x * conjugate.x - vecQuat.y * conjugate.y - vecQuat.z * conjugate.z
	resQuat.x , resQuat.y, resQuat.z, resQuat.w = 
						self.w * resQuat.x + self.x * resQuat.w + self.y * resQuat.z - self.z * resQuat.y,
	                	self.w * resQuat.y + self.y * resQuat.w + self.z * resQuat.x - self.x * resQuat.z,
	                 	self.w * resQuat.z + self.z * resQuat.w + self.x * resQuat.y - self.y * resQuat.x,
	                 	self.w * resQuat.w - self.x * resQuat.x - self.y * resQuat.y - self.z * resQuat.z

	return Vector:new(resQuat.x*mag, resQuat.y*mag, resQuat.z*mag)
end

function Quaternion:inlinerotate(vec)
	normvec.x, normvec.y, normvec.z, mag = vec:inlinenormal()

	vecQuat.x, vecQuat.y, vecQuat.z = normvec.x, normvec.y, normvec.z
	conjugate.x, conjugate.y, conjugate.z, conjugate.w = -self.x, -self.y, -self.z, self.w
	resQuat.x , resQuat.y, resQuat.z, resQuat.w = 
						vecQuat.w * conjugate.x + vecQuat.x * conjugate.w + vecQuat.y * conjugate.z - vecQuat.z * conjugate.y,
	                	vecQuat.w * conjugate.y + vecQuat.y * conjugate.w + vecQuat.z * conjugate.x - vecQuat.x * conjugate.z,
	                 	vecQuat.w * conjugate.z + vecQuat.z * conjugate.w + vecQuat.x * conjugate.y - vecQuat.y * conjugate.x,
	                 	vecQuat.w * conjugate.w - vecQuat.x * conjugate.x - vecQuat.y * conjugate.y - vecQuat.z * conjugate.z
	resQuat.x , resQuat.y, resQuat.z, resQuat.w = 
						self.w * resQuat.x + self.x * resQuat.w + self.y * resQuat.z - self.z * resQuat.y,
	                	self.w * resQuat.y + self.y * resQuat.w + self.z * resQuat.x - self.x * resQuat.z,
	                 	self.w * resQuat.z + self.z * resQuat.w + self.x * resQuat.y - self.y * resQuat.x,
	                 	self.w * resQuat.w - self.x * resQuat.x - self.y * resQuat.y - self.z * resQuat.z
	return  resQuat.x*mag, resQuat.y*mag, resQuat.z*mag
end
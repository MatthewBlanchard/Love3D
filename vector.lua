local sqrt = math.sqrt

Vector = Object:new()

function Vector:Vector(x, y, z)
	self.x = x
	self.y = y
	self.z = z
end

function Vector:__add(vec)
	return Vector:new(self.x + vec.x, self.y + vec.y, self.z + vec.z)
end

function Vector:__sub(vec)
	return Vector:new(self.x - vec.x, self.y - vec.y, self.z - vec.z)
end

function Vector:__mul(scalar)
	return Vector:new(self.x*scalar, self.y*scalar, self.z*scalar)
end

function Vector:__tostring()
	return self.x .. "\t" .. self.y .. "\t" .. self.z
end

function Vector:fastadd(vec, vec2)
	self.x, self.y, self.z = vec.x + vec2.x, vec.y + vec2.y, vec.z + vec2.z
	return self
end

function Vector:fastsub(vec, vec2)
	self.x, self.y, self.z = vec.x - vec2.x, vec.y - vec2.y, vec.z - vec2.z
	return self
end

function Vector:normal()
	local mag = sqrt(self.x * self.x + self.y * self.y + self.z * self.z)
	return Vector:new(self.x/mag, self.y/mag, self.z/mag), mag
end

function Vector:inlinenormal()
	local mag = math.max(sqrt(self.x * self.x + self.y * self.y + self.z * self.z), 0.00000001)
	return self.x/mag, self.y/mag, self.z/mag, mag
end

function Vector:fastnormal(vec)
	local mag = sqrt(vec.x * vec.x + vec.y * vec.y + vec.z * vec.z)
	self.x, self.y, self.z = vec.x/mag, vec.y/mag, vec.z/mag
	return self
end

function Vector:cross(vec)
	return Vector:new( 	self.y * vec.z - vec.y * self.z,
						self.z * vec.x - vec.z * self.x,
						self.x * vec.y - vec.x * self.y
					)
end

function Vector:fastcross(vec, vec2)
	self.x, self.y, self.z = 
			vec.y * vec2.z - vec2.y * vec.z,
			vec.z * vec2.x - vec2.z * vec.x,
			vec.x * vec2.y - vec2.x * vec.y

	return self
end

function Vector:dot(vec)
	return self.x*vec.x+self.y*vec.y+self.z*vec.z
end

function Vector:transform(vec)
	local x = self.x + vec.x
	local y = self.y + vec.y
	local z = self.z + vec.z
	return Vector:new(x, y, z)
end

function VectorNormal(vec)
	local mag = sqrt(vec.x * vec.x + vec.y * vec.y + vec.z * vec.z)
	vec.x, vec.y, vec.z = vec.x/mag, vec.y/mag, vec.z/mag
end
Mesh = Object:new()

function Mesh:Mesh(data, color, pos, ang)
	self.rot = ang or Quaternion(0, 0, 0, 1)
	self.pos = pos or Vector:new(0, 0, 0)
	self.color = color or Vector:new(0, 0, 0)

	self.vertices = data.vertices
	self.faces = data.faces
end
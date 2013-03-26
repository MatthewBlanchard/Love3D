Mesh = Entity:new()

function Mesh:Mesh(data, color)
	self.color = color or Vector:new(0, 0, 0)
	self.vertices = data.vertices
	self.faces = data.faces
end
Model = Object:new()

function Model:Model(data, pos, ang)
	self.rot = ang or Quaternion(0, 0, 0, 1)
	self.pos = pos or Vector:new(0, 0, 0)

	self.vertices = data.vertices
	self.faces = data.faces
end

function Model:OBJ()

end
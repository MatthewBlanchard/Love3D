Mesh = Entity:new()

function Mesh:Mesh(verts, faces, color)
	self.color = color or Vector:new(0, 0, 0)
	self.vertices = verts
	self.faces = faces
end

function Mesh.load(file)
	mesh = love.filesystem.load(file)
    return mesh()
end

function Mesh.OBJ(str, color)
	local verts, faces = {}, {}

	-- Replace quads with triangles.
	str = string.gsub(str, "f%s+(%d+)%A-%s+(%d+)%A-%s+(%d+)%A-%s+(%d+)", "f %1 %2 %3\nf %1 %3 %4")

	-- Find vertices
	for x, y, z in string.gfind(str, "v%s+(-?%d+.%d+)%s+(-?%d+.%d+)%s+(-?%d+.%d+)") do
     	table.insert(verts, Vector:new(tonumber(x), tonumber(y), tonumber(z)))
    end

    -- Find faces
	for x, y, z in string.gfind(str, "f%s+(%d+)%A-%s+(%d+)%A-%s+(%d+)") do
     	table.insert(faces,  {tonumber(x), tonumber(y), tonumber(z)})
    end

    return Mesh:new(verts, faces, color)
end
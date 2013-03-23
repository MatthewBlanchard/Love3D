function OBJtoMesh(str, name)
	local verts, faces = {}, {}
	local header = "require \"Vector\"\nlocal v = Vector\n\n" .. name .. " = {}\n\n" .. name

	str = string.gsub(str, "f (%d+).-%s+(%d+).-%s+(%d+).-%s+(%d+)", "f %1 %2 %3 %4")
	for x, y, z in string.gfind(str, "v%s+(-?%d+.%d+)%s+(-?%d+.%d+)%s+(-?%d+.%d+)") do
     	table.insert(verts, "v(" .. x .. "," .. y .. "," .. z .. ")")
    end

	for x, y, z in string.gfind(str, "f%s+(%d+).-%s+(%d+).-%s+(%d+)") do
     	table.insert(faces, "{" .. x .. "," .. y .. "," .. z .. "}")
    end

    local final = header .. ".vertices = {\n\t" .. table.concat(verts, ",\n\t") .. "\n}\n\n" .. name
   	final = final .. "mesh.faces = {" .. table.concat(faces, ",\n\t") .. "\n}"
    return final
end
require "vector"

cube = {}

cube.vertices = {
	Vector:new(-.5, -.5,  -.5),
	Vector:new(-.5,  -.5,  .5),
	Vector:new(-.5,  .5,  -.5),
	Vector:new(-.5,  .5,  .5),
	Vector:new(.5,  -.5,  -.5),
	Vector:new(.5,  -.5,  .5),
	Vector:new(.5,  .5,  -.5),
	Vector:new(.5,  .5,  .5)
}

--[[vn  -.5  -.5  .5
vn  -.5  -.5 -.5
vn  -.5  .5  -.5
vn  -.5 -.5  -.5
vn  .5  -.5  -.5
vn -.5  -.5  -.5]]

cube.faces = {
	{1,  7,  5},
	{1,  3,  7},
	{1,  4,  3},
	{1,  2,  4},
	{3,  8,  7},
	{3,  4,  8},
	{5,  7,  8},
	{5,  8,  6},
	{1,  5,  6},
	{1,  6,  2},
	{2,  6,  8},
	{2,  8,  4} 
}
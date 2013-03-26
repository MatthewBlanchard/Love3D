FPS = Object:new()

FPS.fps = 0
FPS.frames = 0

local totaltime, lasttime = 0, 0
function FPS:update()
	local time = love.timer.getMicroTime()

	totaltime = totaltime + (time - lasttime)
	lasttime = time
	self.frames = self.frames + 1
	if totaltime >= 0.5 then
		self.fps = math.floor(self.frames/totaltime + 0.5)
		self.frames, totaltime = 0, 0
	end

end

function FPS:draw()
	love.graphics.setColor(255, 255, 255)
	love.graphics.print("FPS: " .. self.fps, 0, 0)
end
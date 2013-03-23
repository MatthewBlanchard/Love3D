require "object"

function love.run()

    assert(love.s, "Please call love.state with a gamestate object.")
    
    math.randomseed(os.time())
    math.random() math.random()

    if love.s.load then love.load(arg) end

    local dt = 0

    while true do
        -- Process events.
        if love.event then
            love.event.pump()
            for e,a,b,c,d in love.event.poll() do
                if e == "quit" then
                    if not love.s.quit or not love.s:quit() then
                        if love.audio then
                            love.audio.stop()
                        end
                        return
                    end
                end
                
                if love.s[e] then
                    love.s[e](love.s,a,b,c,d)
                end
            end
        end

        if love.timer then
            love.timer.step()
            dt = love.timer.getDelta()
        end

        if love.s.update then love.s:update(dt) end
        if love.graphics then
            love.graphics.clear()
            if love.s.draw then love.s:draw() end
        end

        if love.graphics then love.graphics.present() end

    end

end

function love.state(o)
    love.s = o
end
x = 0
y = 100


function love.draw()
    love.graphics.setColor(0, 1, 0)
    love.graphics.circle('fill', z, y, 30)
end

function love.update(dt)
    x = x + (dt * 8)

    z = (10 * 1.5^x)
    
    if z > 1000 then
        z = 0
        x = 0
    end
end

-- function love.keypressed()
--    if key == 'spaces' then
--        green = green + 0.1
--    end
-- end
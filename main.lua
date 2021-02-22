x = 0
y = 270


function love.draw()
    love.graphics.setColor(0, 1, 0, 0.9)
    love.graphics.rectangle('fill', 0, 300, 1000, 500)
    love.graphics.setColor(0.5, 0, 0.8)
    love.graphics.rectangle('fill', x, y, 30, 30)
end



function love.update()
    if love.keyboard.isDown("right") then
        x = x + 2
    end
    if love.keyboard.isDown("left") then
        x = x - 2
    end
end

local x = 50
local y = 150
local speed = 4
local message = "Go !"

function love.draw()
    love.graphics.setColor(1, 1, 1)
    love.graphics.rectangle("fill", 0, 200, 500, 800)
    love.graphics.rectangle("fill", 0, 0, 800, 100)
    love.graphics.rectangle("fill", 600, 100, 200, 700)
    love.graphics.circle("fill", x, y, 30)
    love.graphics.setColor(1, 0, 1)
    love.graphics.setFont(love.graphics.newFont(60))
    love.graphics.print(message)
end

function love.update(dt)
    if love.keyboard.isDown("right") then
        x = x + speed
    end
    if love.keyboard.isDown("left") then
        x = x - speed
    end
    if love.keyboard.isDown("down") then
        y = y + speed
    end
    if love.keyboard.isDown("up") then
        y = y - speed
    end
    if x > -30 and x < 530 then
        if y > 170 and y < 1030 then
            x = 50
            y = 150
            love.window.showMessageBox(":(", "You Lost !!!", "info" )
        end
    end
    if x > -30 and x < 830 then
        if y > -30 and y < 130 then
            x = 50
            y = 150
            love.window.showMessageBox(":(", "You Lost !!!", "info" )
        end
    end
    if x > 570 and x < 830 then
        if y > 70 and y < 830 then
            x = 50
            y = 150
            love.window.showMessageBox(":(", "You Lost !!!", "info" )
        end
    end
    if y > 570 then
        x = 50
        y = 150
        love.window.showMessageBox(":)", "Congrats, you Won !!!", "info" )
    end
end
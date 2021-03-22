function collision(centerX, centerY, radius, map)
    if map[math.floor((centerY)/100)][math.floor((centerX)/100)] == 1 then
        love.window.showMessageBox(":(", "You lost !!!", "info" )
        wallTouched = wallTouched + 1
        ballX = 150
        ballY = 250
    end
end

function love.load()
    ballX = 150
    ballY = 250
    ballRadius = 30
    speed = 4
    message = "Go !"
    wallTouched = 0
    
    grid = {
        {1, 1, 1, 1, 1, 1, 1, 1},
        {0, 0, 1, 1, 1, 0, 0, 0},
        {1, 0, 0, 1, 0, 0, 1, 1},
        {1, 1, 0, 1, 0, 1, 1, 1},
        {1, 1, 0, 0, 0, 1, 1, 1},
        {1, 1, 1, 1, 1, 1, 1, 1}
    }
    -- for i = 1, 360, 10 do
        
    -- end
    circlePoints = {
        {-30, 0},
        {30, 0},
        {0, -30},
        {0, 30},
        {21, -21},
        {-21, -21},
        {-21, 21},
        {-21, 21}
    }
end
  
function love.draw()
    love.graphics.setColor(1, 1, 1)
    love.graphics.circle("fill", ballX - 100, ballY - 100, ballRadius)
    love.graphics.setColor(1, 0, 1)

    for y = 1, #grid do
        for x = 1, #grid[y] do
            if grid[y][x] == 1 then
                love.graphics.rectangle("fill", 100 * (x - 1), 100 * (y - 1), 100, 100)
            end
        end
    end
    love.graphics.setColor(1, 1, 1)
    love.graphics.setFont(love.graphics.newFont(30))
    love.graphics.print("You have touched the wall " .. wallTouched .. " times")
end


function love.update(dt)
    if love.keyboard.isDown("right") then
        ballX = ballX + speed
    end
    if love.keyboard.isDown("left") then
        ballX = ballX - speed
    end
    if love.keyboard.isDown("down") then
    ballY = ballY + speed
    end
    if love.keyboard.isDown("up") then
        ballY = ballY - speed
    end
    -- kallar på collision så många gånger som circlePoints är
    for index, value in ipairs(circlePoints) do
        collision(ballX + circlePoints[index][1], ballY + circlePoints[index][2], ballRadius, grid)
    end
end
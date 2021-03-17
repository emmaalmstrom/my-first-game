function collision(centerX, centerY, radius, g)
    if g[math.floor((centerY)/100)][math.floor((centerX)/100)] == 1 then
        love.window.showMessageBox(":(", "You lost !!!", "info" )
        love.load()
    end
end

function love.load()
    ballX = 150
    ballY = 250
    ballRadius = 30
    speed = 4
    message = "Go !"
    
    grid = {
        {1, 1, 1, 1, 1, 1, 1, 1},
        {0, 0, 1, 1, 1, 0, 0, 0},
        {1, 0, 0, 1, 0, 0, 1, 1},
        {1, 1, 0, 1, 0, 1, 1, 1},
        {1, 1, 0, 0, 0, 1, 1, 1},
        {1, 1, 1, 1, 1, 1, 1, 1}
    }
    circlePoints = {
        {-30, 0},
        {30, 0},
        {0, -30},
        {0, 30}
    }
end
  
function love.draw()
    love.graphics.setColor(1, 1, 1)
    love.graphics.circle("fill", ballX - 100, ballY - 100, ballRadius)
    love.graphics.setColor(1, 0, 1)
    love.graphics.setFont(love.graphics.newFont(60))
    love.graphics.print(message)

    for y = 1, #grid do
        for x = 1, #grid[y] do
            if grid[y][x] == 1 then
                love.graphics.rectangle("fill", 100 * (x - 1), 100 * (y - 1), 100, 100)
            end
        end
    end
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
    
    print(ballX, ballY)
    
    collision(ballX - 30, ballY, ballRadius, grid)
    collision(ballX + 30, ballY, ballRadius, grid)
    collision(ballX, ballY - 30, ballRadius, grid)
    collision(ballX, ballY + 30, ballRadius, grid)
end
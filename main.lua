function_collision = require('collisionFile')
function movment(key, kordinates, direction, velocity)
    if love.keyboard.isDown(key) then
        kordinates = kordinates + velocity
        direction = true
    end
    return direction, kordinates
end
function stopClipp(map, circleX, circleY, movement, X, Y, cordinate, velocity)
    if map[math.floor((circleY + Y)/100)][math.floor((circleX + X)/100)] == 1 and movement == true then
        cordinate = cordinate + velocity
    end
    return cordinate
end

function love.load()
    ballX = 150
    ballY = 250
    ballRadius = 30
    speed = 4
    wallTouched = 100
    start = love.timer.getTime()
    movingright = false
    movingleft = false
    movingup = false
    movingdown = false
    collission = false

    
    grid = {
        {1, 1, 1, 1, 1, 1, 1, 1},
        {0, 0, 1, 0, 0, 0, 0, 1},
        {1, 0, 1, 0, 1, 1, 0, 1},
        {0, 0, 1, 0, 1, 0, 0, 1},
        {0, 1, 1, 0, 1, 0, 1, 1},
        {0, 0, 0, 0, 1, 0, 0, 0}
    }

    circleEdge = {}
    -- a for-loop that will decribe 36 pionts on the circles circumference
    for i = 0, 360, 10 do
       table.insert(circleEdge, {math.cos(i) * ballRadius, math.sin(i) * ballRadius})
    end
    print(#circleEdge)

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
    love.graphics.print("Walltouchcountdown: " .. wallTouched, 300, 20, 0, 1)
    love.graphics.print("Time: ".. math.floor(result) .. "s", 10, 0, 0, 2)
end


function love.update(dt)
    movingright, ballX = movment("right", ballX, movingright, speed)
    movingleft, ballX = movment("left", ballX, movingleft, -speed)
    movingdown, ballY = movment("down", ballY, movingdown, speed)
    movingup, ballY = movment("up", ballY, movingup, -speed)
    
    -- calls the collision-function for every table in my 'circlePoints'- table
    for index, value in ipairs(circleEdge) do
        collision(ballX + circleEdge[index][1], ballY + circleEdge[index][2], grid)
    end

    -- victory
    -- set a variable that describes delta between the time right now and the time the game started
    result = love.timer.getTime() - start
    if ballX > love.graphics.getWidth() + 100 - ballRadius then
        love.window.showMessageBox(":)", "You won! It took you " .. math.floor(result) .. " seconds", "info")
        love.load()
        bestTime = result
    end


    -- stop the ball from clipping the wall
    -- if the ball in on a 1 on the gridsystem and the ball moves in a specific direction
    -- then the movment is nullified

    ballX = stopClipp(grid, ballX, ballY, movingright, ballRadius - 1, 0, ballX, -speed)
    ballX = stopClipp(grid, ballX, ballY, movingleft, -ballRadius, 0, ballX, speed)
    ballY = stopClipp(grid, ballX, ballY, movingup, 0, -ballRadius, ballY, speed)
    ballY = stopClipp(grid, ballX, ballY, movingdown, 0, ballRadius - 1, ballY, -speed)
    ballY = stopClipp(grid, ballX, ballY, movingup, math.sin(45) * ballRadius, -math.cos(45) * ballRadius, ballY, speed)
    ballX = stopClipp(grid, ballX, ballY, movingright, math.sin(45) * ballRadius, -math.cos(45) * ballRadius, ballX, -speed)
    ballY = stopClipp(grid, ballX, ballY, movingup, -math.sin(45) * ballRadius, -math.cos(45) * ballRadius, ballY, speed)
    ballX = stopClipp(grid, ballX, ballY, movingleft, -math.sin(45) * ballRadius, -math.cos(45) * ballRadius, ballX, speed)
    ballY = stopClipp(grid, ballX, ballY, movingdown, math.sin(45) * ballRadius, math.cos(45) * ballRadius, ballY, -speed)
    ballX = stopClipp(grid, ballX, ballY, movingright, math.sin(45) * ballRadius, math.cos(45) * ballRadius, ballX, -speed)
    ballY = stopClipp(grid, ballX, ballY, movingdown, -math.sin(45) * ballRadius, math.cos(45) * ballRadius, ballY, -speed)
    ballX = stopClipp(grid, ballX, ballY, movingleft, -math.sin(45) * ballRadius, math.cos(45) * ballRadius, ballX, speed)

    if wallTouched <= -1 then
        love.window.showMessageBox(":(", "You lost !!!", "info" )
        love.load()
    end
    if ballX <= ballRadius + 99  then
        ballX = ballX + speed
        wallTouched = wallTouched - 1
    end
    if ballY >= love.graphics.getHeight() + 96 - ballRadius then
        ballY = ballY - speed
        wallTouched = wallTouched - 1
    end
end

function collision(centerX, centerY, map)
    if map[math.floor((centerY)/100)][math.floor((centerX)/100)] == 1 then
        
        wallTouched = wallTouched - 1
        --ballX = 150
        --ballY = 250

    end
end

function love.load()
    ballX = 150
    ballY = 250
    ballRadius = 30
    speed = 4
    message = "Go !"
    wallTouched = 100
    start = love.timer.getTime()
    movingright = false
    movingleft = false
    movingup = false
    movingdown = false

    
    grid = {
        {1, 1, 1, 1, 1, 1, 1, 1},
        {0, 0, 0, 1, 1, 0, 0, 0},
        {1, 1, 0, 0, 0, 0, 1, 1},
        {1, 1, 1, 1, 1, 1, 1, 1},
        {1, 1, 1, 1, 1, 1, 1, 1},
        {1, 1, 1, 1, 1, 1, 1, 1}
    }
    for i = 1, 360, 10 do
       circleEdge = {

       } 
       
    end
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
    love.graphics.print("You have touched the wall " .. wallTouched .. " times," .. math.floor(result) .. "s")
end


function love.update(dt)
    if love.keyboard.isDown("right") then
        ballX = ballX + speed
        movingright = true
    end
    if love.keyboard.isDown("left") then
        ballX = ballX - speed
        movingleft = true
    end
    if love.keyboard.isDown("down") then
        ballY = ballY + speed
        movingdown = true
    end
    if love.keyboard.isDown("up") then
        ballY = ballY - speed
        movingup = true
    end
    -- calls the collision-function for every table in my 'circlePoints'- table
    for index, value in ipairs(circlePoints) do
        collision(ballX + circlePoints[index][1], ballY + circlePoints[index][2], grid)
    end
    -- victory
    -- set a variable that describes delta between the time right now and the time the game started
    result = love.timer.getTime() - start
    if ballX > love.graphics.getWidth() + 70 then
        love.window.showMessageBox(":)", "You won! It took you " .. math.floor(result) .. " seonds", "info")
        love.load()
    end

    -- stop the ball from clipping the wall
    -- if the ball in on a 1 on the gridsystem and the ball moves in a specific direction
    -- then the movment is nullified
    if grid[math.floor((ballY)/100)][math.floor((ballX + 29)/100)] == 1 and movingright == true then
        ballX = ballX - 4
    end
    if grid[math.floor((ballY)/100)][math.floor((ballX - 29)/100)] == 1 and movingleft == true then
        ballX = ballX + 4
    end
    if grid[math.floor((ballY - 29)/100)][math.floor((ballX)/100)] == 1 and movingup == true then
        ballY = ballY + 4
    end
    if grid[math.floor((ballY + 29)/100)][math.floor((ballX)/100)] == 1 and movingdown == true then
        ballY = ballY - 4
    end

    if wallTouched == -1 then
        love.window.showMessageBox(":(", "You lost !!!", "info" )
        love.load()
    end
end
function love.load()
    ballX = 150
    ballY = 250
    speed = 4
    message = "Go !"
end
  
function love.draw()
    love.graphics.setColor(1, 1, 1)
    love.graphics.circle("fill", ballX - 100, ballY - 100, 30)
    love.graphics.setColor(1, 0, 1)
    love.graphics.setFont(love.graphics.newFont(60))
    love.graphics.print(message)

    for x = 1, #grid do
        for y = 1, #grid[x] do
            if grid[x][y] == 1 then
                love.graphics.rectangle("fill", 100 * (x - 1), 100 * (y - 1), 100, 100)
            end
        end
    end
end

grid = {
    {1, 0, 0, 0, 0},
    {0, 1, 0, 0, 0},
    {0, 0, 1, 0, 0},
    {0, 0, 0, 0, 0},
    {0, 0, 0, 0, 0}
}



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
    if grid[math.floor((ballY + 30)/100)][math.floor((ballX )/100)] == 1 then
        love.window.showMessageBox(":)", "Congrats, you Won !!!", "info" )
        love.load()
    end
    if grid[math.floor((ballY - 30)/100)][math.floor((ballX)/100)] == 1 then
        love.window.showMessageBox(":)", "Congrats, you Won !!!", "info" )
        love.load()
    end
    if grid[math.floor((ballY)/100)][math.floor((ballX + 30)/100)] == 1 then
        love.window.showMessageBox(":)", "Congrats, you Won !!!", "info" )
        love.load()
    end
    if grid[math.floor((ballY)/100)][math.floor((ballX - 30)/100)] == 1 then
        love.window.showMessageBox(":)", "Congrats, you Won !!!", "info" )
        love.load()
    end
end
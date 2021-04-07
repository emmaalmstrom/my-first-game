function collision(centerX, centerY, map)
    if map[math.floor((centerY)/100)][math.floor((centerX)/100)] == 1 then
        
        wallTouched = wallTouched - 1
        --ballX = 150
        --ballY = 250

    end
end
function stopClipp(map, circleX, circleY, movement, X, Y, cordinate, velocity)
    if map[math.floor(circleY + Y/100)][math.floor(circleX + X/100)] == 1 and movement == true then
        cordinate = cordinate + velocity
    end
end
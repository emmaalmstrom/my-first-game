function movment(key, kordinates, direction, velocity)
    if love.keyboard.isDown(key) then
        kordinates = kordinates + velocity
        direction = true
    end
end
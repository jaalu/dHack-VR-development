function lovr.draw(pass)
    pass:cube(0, 1.7, -1, .5, lovr.headset.getTime(), 0, 1, 0, 'line')
    for i, hand in ipairs(lovr.headset.getHands()) do
        local x, y, z = lovr.headset.getPosition(hand)
        local size = 0.05
        if lovr.headset.isDown(hand, 'trigger') then
            size = 0.1
        end
        pass:sphere(x, y, z, size)
    end
end
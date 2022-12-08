function lovr.load()
    model = lovr.graphics.newModel('dips.glb')
end

function lovr.draw(pass)
    pass:draw(model, 0, 1.7, -3)
end
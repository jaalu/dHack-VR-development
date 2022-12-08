function lovr.load()
    model = lovr.graphics.newModel('dips.glb')
    vertexShader = [[
        vec4 lovrmain()
        {
            return Projection * View * Transform * VertexPosition;
        }
    ]]
    fragmentShader = [[
        Constants {
            vec4 ambience;
            vec4 lightColor;
            vec3 lightPos;
        };
    
        vec4 lovrmain()
        {
            vec3 norm = normalize(Normal);
            vec3 lightDir = normalize(lightPos - PositionWorld);
            float diff = max(dot(norm, lightDir), 0.0);
            vec4 diffuse = diff * lightColor;
    
            vec4 baseColor = Color * getPixel(ColorTexture, UV);
            return baseColor * (ambience + diffuse);
        }
    ]]
    shader = lovr.graphics.newShader(vertexShader, fragmentShader)
end

function lovr.draw(pass)
    pass:setShader(shader)
    pass:send('ambience', {0.2, 0.2, 0.2, 1.0})
    pass:send('lightColor', {1.0, 1.0, 1.0, 1.0})
    pass:send('lightPos', {2.0, -10.0, -10.0})
    pass:draw(model, 0, 1.7, -3)
end
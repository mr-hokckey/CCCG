
io.stdout:setvbuf("no")

love.graphics.setDefaultFilter("nearest", "nearest")

function love.load()
    require "utils"
    require "vector"
    require "gameManager"
    require "player"
    require "grabber"
    require "card"
    require "deck"
    require "location"

    love.window.setTitle("Mythomagic") -- A reference to the Percy Jackson series :)

    gameManager = GameManagerClass:new(25)

end

function love.update(dt)
    gameManager:update()
end

function love.draw()
    love.graphics.rectangle("fill", 0, 0, SCREEN_WIDTH / 2, SCREEN_HEIGHT / 2)

    -- for _, card in ipairs(cards) do
    --     card:draw()
    -- end
    gameManager:draw()
end

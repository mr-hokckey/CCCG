
io.stdout:setvbuf("no")

love.graphics.setDefaultFilter("nearest", "nearest")

function love.load()
    require "utils"

    require "vector"
    require "gameManager"
    require "card"
    require "deck"
    require "location"
    require "player"

    gameManager = GameManagerClass:new(25)

    -- cards = {}

    -- for l = 1, 3, 1 do
    --     for s = 1, 4, 1 do
    --         local card = CardClass:new("P1", "LOCATION_" .. l, s, "Sword of Damocles")
    --         table.insert(cards, card)
    --     end
    -- end

    -- for l = 1, 3, 1 do
    --     for s = 1, 4, 1 do
    --         local card = CardClass:new("P2", "LOCATION_" .. l, s, "Prometheus")
    --         table.insert(cards, card)
    --     end
    -- end

    -- for s = 1, 5, 1 do
    --     local card = CardClass:new("P1", "HAND", s, "Sword of Damocles")
    --     table.insert(cards, card)
    -- end

    -- table.insert(cards, CardClass:new("P1", "DECK", 1, "Zeus"))
    -- table.insert(cards, CardClass:new("P1", "DISCARD", 1, "Zeus"))

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

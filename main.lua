
io.stdout:setvbuf("no")

love.graphics.setDefaultFilter("nearest", "nearest")

require "vector"
require "gameManager"
require "card"
require "deck"

function love.load()
    gameManager = GameManagerClass:new(25)
end

function love.update(dt)
    gameManager:update()
end

function love.draw()
    
end

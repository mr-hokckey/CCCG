
require "vector"
require "utils"

CardClass = {}

CARD_STATE = {
    IDLE = 0,
    SELECTED = 1,
    GRABBED = 2
}

function CardClass:new(owner, location, name)
    local card = {}
    local metadata = {__index = CardClass}
    setmetatable(card, metadata)

    card.owner = owner
    card.location = location
    card.position = Vector()
    card.isFaceUp = false
    -- card.isRevealed = false
    card.state = CARD_STATE.IDLE

    card.name = name
    card.power = 0
    card.cost = 0
    card.text = "Placeholder"
    card.sprite = nil
    card.ability = nil

    return card
end

function CardClass:update()
    self.state = CARD_STATE.IDLE
end

-- Function to flip cards face-up or face-down. 
-- This also has bonus functionality: if a card is flipped face-up in one of the 3 locations,
-- it permanently sets card.isRevealed to true (MAY OR MAY NOT IMPLEMENT THIS)
function CardClass:flip()
    self.isFaceUp = not self.isFaceUp
end

-- Power and cost numbers will have different colors if they're affected by modifiers!
-- (MAY OR MAY NOT INPLEMENT THIS)
function CardClass:draw()
    love.graphics.push()

    love.graphics.translate(self.position.x, self.position.y)

    if self.state ~= CARD_STATE.IDLE then
        love.graphics.setColor(0,0,0,1)
        love.graphics.rectangle("fill", -4 * self.state, -4 * self.state, CARD_WIDTH, CARD_HEIGHT)
    end
    love.graphics.setColor(0, 0, 0, 1)
    love.graphics.rectangle("line", 0, 0, CARD_WIDTH, CARD_HEIGHT)
    love.graphics.setColor(1, 0.97, 0.86, 1)
    love.graphics.rectangle("fill", 0, 0, CARD_WIDTH, CARD_HEIGHT)
    love.graphics.setColor(0, 0, 0, 1)
    love.graphics.printf(self.cost, 0, 0, CARD_WIDTH / 4, "center", 0)
    love.graphics.printf(self.power, CARD_WIDTH * 3 / 4, 0, CARD_WIDTH / 4, "center", 0)
    love.graphics.printf(self.name, 0, CARD_HEIGHT * 3 / 4, CARD_WIDTH, "center", 0)

    love.graphics.pop()
end


-- used for grabbing
function CardClass:checkForMouseOver()
    local isMouseOver = 
        love.mouse.getX() > self.position.x and
        love.mouse.getX() < self.position.x + CARD_WIDTH and
        love.mouse.getY() > self.position.y and
        love.mouse.getY() < self.position.y + CARD_HEIGHT
        
    return isMouseOver
end

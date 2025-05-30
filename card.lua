
require "vector"
require "utils"

CardClass = {}

function CardClass:new(owner, location, slot, name)
    local card = {}
    local metadata = {__index = CardClass}
    setmetatable(card, metadata)

    card.owner = owner
    card.location = location
    card.scale = (string.find(location, "LOCATION_") and SMALL_CARD_SCALE) or 1
    card.position = Vector(POSITIONS[location][owner][slot].x, POSITIONS[location][owner][slot].y) - (Vector(CARD_WIDTH/2, CARD_HEIGHT/2) * card.scale)
    card.isFaceUp = false
    -- card.isRevealed = false

    card.name = name
    card.power = 0
    card.cost = 0
    card.text = "Placeholder"
    card.sprite = nil
    card.ability = nil

    return card
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
    love.graphics.scale(self.scale, self.scale)

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
        love.mouse.getX() < self.position.x + self.size.x and
        love.mouse.getY() > self.position.y and
        love.mouse.getY() < self.position.y + self.size.y
        
    return isMouseOver
end

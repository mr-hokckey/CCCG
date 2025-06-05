
require "card"

LocationClass = {}

function LocationClass:new(name, cards, positions, dropZone)
    local location = {}
    local metadata = {__index = LocationClass}
    setmetatable(location, metadata)

    location.cards = cards
    location.name = name
    location.positions = positions
    location.dropZone = dropZone

    return location
end


function LocationClass:draw()
    for _, card in ipairs(self.cards) do
        card:draw()
    end
end


function LocationClass:repositionCards()
    local i = 1
    local j = 1

    for c, card in ipairs(self.cards) do
        if card.owner == "P1" then
            card.position = self.positions[card.owner][i] - Vector(CARD_WIDTH/2, CARD_HEIGHT/2)
            i = i + 1
        elseif card.owner == "P2" then
            card.position = self.positions[card.owner][j] - Vector(CARD_WIDTH/2, CARD_HEIGHT/2)
            j = j + 1
        end
    end
end

function LocationClass:insertCard(card)
    if #self.cards >= 4 then 
        return false
    end
    card.location = self.name
    table.insert(self.cards, card)
    return true
end

-- check if the mouse is hovering over
function LocationClass:checkForMouseOver()
    local isMouseOver = 
        love.mouse.getX() > self.dropZone[1].x and
        love.mouse.getX() < self.dropZone[2].x and
        love.mouse.getY() > self.dropZone[1].y and
        love.mouse.getY() < self.dropZone[2].y
        
    return isMouseOver and self.name or "FALSE"
end

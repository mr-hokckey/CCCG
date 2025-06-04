
require "utils"
require "card"

LocationClass = {}

function LocationClass:new(locationNum, cards)
    local location = {}
    local metadata = {__index = LocationClass}
    setmetatable(location, metadata)

    location.cards = cards
    location.locationNum = locationNum

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

    for c = 1, #self.cards, 1 do
        if card.owner == "P1" then
            card.position = POSITIONS[card.location][card.owner][i] - Vector(CARD_WIDTH/2, CARD_HEIGHT/2) * card.scale
            i = i + 1
        elseif card.owner == "P2" then
            card.position = POSITIONS[card.location][card.owner][j] - Vector(CARD_WIDTH/2, CARD_HEIGHT/2) * card.scale
            j = j + 1
        end
    end
end

function LocationClass:insertCard(card)
    card.location = "LOCATION_" .. self.locationNum
    table.insert(self.cards, card)
end

function LocationClass:checkForMouseOver()
    
end

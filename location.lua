
require "utils"
require "card"

LocationClass = {}

function LocationClass:new(locationNum)
    local location = {}
    local metadata = {__index = LocationClass}
    setmetatable(location, metadata)

    location.cards = {}
    location.locationNum = locationNum

    return location
end

-- update() method for locations shifts
function LocationClass:update()
    for i, card in ipairs(self.cards) do
        if card.owner == "P1" then
            card.position = POSITIONS[card.location][card.owner][i] - Vector(CARD_WIDTH/2, CARD_HEIGHT/2) * card.scale
        end
    end

    for i, card in ipairs(self.cards) do
        if card.owner == "P2" then
            card.position = POSITIONS[card.location][card.owner][i] - Vector(CARD_WIDTH/2, CARD_HEIGHT/2) * card.scale
        end
    end
end

function LocationClass:draw()
    for _, card in ipairs(self.cards) do
        card:draw()
    end
end

function LocationClass:insertCard(card)
    card.location = "LOCATION_" .. self.locationNum
    table.insert(self.cards, card)
end

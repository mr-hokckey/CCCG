
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

function LocationClass:draw()
    for _, card in ipairs(self.cards) do
        card:draw()
    end
end

function LocationClass:insert()
    
end

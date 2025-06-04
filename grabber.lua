
require "card"
require "vector"

GrabberClass = {}

function GrabberClass:new(cardTables)
    local grabber = {}
    local metadata = {__index = GrabberClass}
    setmetatable(grabber, metadata)

    grabber.cardTables = cardTables

    grabber.selectedCard = nil
    grabber.grabbedCard = nil
    grabber.grabPos = Vector()
    grabber.grabOffset = Vector()

    return grabber
end

-- update the position of the grabbed card.
function GrabberClass:update()
    self.selectedCard = nil
    
    for key, cardTable in pairs(self.cardTables) do
        for i, card in ipairs(cardTable) do
            card.state = CARD_STATE.IDLE
            if card:checkForMouseOver() then
                self.selectedCard = card
            end
        end
    end

    if self.selectedCard ~= nil then
        self.selectedCard.state = CARD_STATE.SELECTED
    end

    
    if self.grabbedCard == nil and love.mouse.isDown(1) then
        self:grab()
    end
  
    if not love.mouse.isDown(1) and self.grabbedCard ~= nil then
        self:release()
    end

    if self.grabbedCard ~= nil then
        self.grabbedCard.state = CARD_STATE.GRABBED
        self.grabbedCard.position = Vector(love.mouse.getX(), love.mouse.getY()) - self.grabOffset
    end
end

-- draw the selectedCard with a description
function GrabberClass:draw()
    if self.grabbedCard ~= nil then
        self.grabbedCard:draw()
    end
end

function GrabberClass:grab()
    if self.selectedCard ~= nil then
        self.grabbedCard = self.selectedCard
        self.grabPos = self.grabbedCard.position
        self.grabOffset = Vector(love.mouse.getX(), love.mouse.getY()) - self.grabPos 
    end
end

function GrabberClass:release()
    self.grabbedCard.state = CARD_STATE.IDLE

    self.grabbedCard = nil
    self.grabPos = Vector()
    self.grabOffset = Vector()
end

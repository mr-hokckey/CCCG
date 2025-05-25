
CardClass = {}

function CardClass:new(owner, name)
    local card = {}
    local metadata = {__index = card}
    setmetatable(card, metadata)

    card.position = Vector()
    card.owner = owner
    card.location = 0
    card.isFaceUp = false
    -- card.isRevealed = false

    card.name = name
    card.power = 0
    card.cost = 0
    card.text = nil
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
function CardClass:draw()
    
end

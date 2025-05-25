
DeckClass = {}

function DeckClass:new(owner)
    local deck = {}
    local metadata = {__index = deck}
    setmetatable(deck, metadata)

    deck.cards = {}
    deck.owner = owner

    return deck
end

-- function to check if a deck is legal - 20 cards, no more than 2 of the same card
function DeckClass:checkLegal()
    if #self.cards ~= 20 then
        print("Player " .. self.owner .. "'s deck doesn't have 20 cards!")
        return false
    end

    local numberOfEachCard = {}
    -- for _, card in ipairs(self.cards) do
        
    -- end
    for _, n in pairs(numberOfEachCard) do
        if (n > 2) then
            print("Player " .. self.owner .. "'s deck has more than 2 of a certain card!")
            return false
        end
    end
    
    return true
end

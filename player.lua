
require "utils"
require "card"
require "deck"

PlayerClass = {}

function PlayerClass:new(playerNum, deck)
    local player = {}
    local metadata = {__index = PlayerClass}
    setmetatable(player, metadata)

    player.playerNum = playerNum
    player.points = 0
    player.mana = 0

    player.deck = DeckClass:new(playerNum, deck)
    player.hand = {}
    player.discard = {}

    return player
end

function PlayerClass:update()
    for i, card in ipairs(self.hand) do
        card.position = POSITIONS[card.location][card.owner][i] - Vector(CARD_WIDTH/2, CARD_HEIGHT/2) * card.scale
    end
end

function PlayerClass:draw()
    for _, card in ipairs(self.hand) do
        card:draw()
    end
end

function PlayerClass:opponent()
    return "P" .. 3 - self.playerNum
end

function PlayerClass:submitPlay()
    
end

-- take a card from the top of the player's deck and place it in their hand.
-- Unless the player has 7 cards in their hand. Return true or false.
function PlayerClass:takeCard()
    if #self.hand >= 7 then 
        return false
    end
    
    table.insert(self.hand, CardClass:new("P" .. self.playerNum, "HAND", table.remove(self.deck.cards, 1)))
    return true
end

function PlayerClass:playCard(i, location)
    card = table.remove(self.hand, i)
    location:insertCard(card)
end

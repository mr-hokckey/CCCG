
require "vector"
require "utils"

require "card"
require "deck"
require "location"
require "player"

GameManagerClass = {}

TURN_STATE = {
    SELECT = 1,
    REVEAL = 2,
    ENDOFTURN = 3,
}

P1_DECK = { "Wooden Cow", "Wooden Cow", "Pegasus", "Pegasus", "Minotaur", "Minotaur", "Titan", "Titan", "Zeus", "Zeus", "Ares", "Ares", "Medusa", "Medusa", "Cyclops", "Cyclops", "Poseidon", "Poseidon", "Artemis", "Artemis", "Hera", "Hera" }
P2_DECK = { "Wooden Cow", "Wooden Cow", "Pegasus", "Pegasus", "Minotaur", "Minotaur", "Titan", "Titan", "Zeus", "Zeus", "Ares", "Ares", "Medusa", "Medusa", "Cyclops", "Cyclops", "Poseidon", "Poseidon", "Artemis", "Artemis", "Hera", "Hera" }

function GameManagerClass:new(pointsToWin)
    local gameManager = {}
    local metadata = {__index = GameManagerClass}
    setmetatable(gameManager, metadata)

    gameManager.pointsToWin = pointsToWin
    gameManager.turnNum = 1

    gameManager.p1 = PlayerClass:new(1, P1_DECK)
    gameManager.p2 = PlayerClass:new(2, P2_DECK)

    gameManager.locations = {
        ["LOCATION_1"] = LocationClass:new(1),
        ["LOCATION_2"] = LocationClass:new(2),
        ["LOCATION_3"] = LocationClass:new(3)
    }

    gameManager.p1:takeCard()
    gameManager.p1:takeCard()
    gameManager.p1:takeCard()
    gameManager.p1:takeCard()
    gameManager.p1:takeCard()
    gameManager.p1:takeCard()
    gameManager.p1:takeCard()

    gameManager.p2:takeCard()
    gameManager.p2:takeCard()
    gameManager.p2:takeCard()


    return gameManager
end

function GameManagerClass:update()
    
end

function GameManagerClass:draw()
    self.p1:draw()
    self.p2:draw()

    self.locations["LOCATION_1"]:draw()
    self.locations["LOCATION_2"]:draw()
    self.locations["LOCATION_3"]:draw()
end

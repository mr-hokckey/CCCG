
-- require "vector"
-- require "utils"

-- require "card"
-- require "deck"
-- require "location"
-- require "player"
-- require "grabber"

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

    gameManager.cardTables = {
        ["LOCATION_1"] = {},
        ["LOCATION_2"] = {},
        ["LOCATION_3"] = {},
        ["HAND_P1"] = {},
        ["HAND_P2"] = {},
        ["DISCARD_P1"] = {},
        ["DISCARD_P2"] = {},
    }
    
    gameManager.p1 = PlayerClass:new(1, P1_DECK, gameManager.cardTables["HAND_P1"], gameManager.cardTables["DISCARD_P1"])
    gameManager.p2 = PlayerClass:new(2, P2_DECK, gameManager.cardTables["HAND_P2"], gameManager.cardTables["DISCARD_P2"])

    gameManager.locations = {
        LocationClass:new("LOCATION_1", gameManager.cardTables["LOCATION_1"], POSITIONS["LOCATION_1"], DROP_ZONES["LOCATION_1"]),
        LocationClass:new("LOCATION_2", gameManager.cardTables["LOCATION_2"], POSITIONS["LOCATION_2"], DROP_ZONES["LOCATION_2"]),
        LocationClass:new("LOCATION_3", gameManager.cardTables["LOCATION_3"], POSITIONS["LOCATION_3"], DROP_ZONES["LOCATION_3"])
    }

    gameManager.grabber = GrabberClass:new(gameManager.cardTables, gameManager.locations)

    gameManager.p1:takeCard()
    gameManager.p1:takeCard()
    gameManager.p1:takeCard()
    gameManager.p1:takeCard()

    gameManager.p2:takeCard()
    gameManager.p2:takeCard()
    gameManager.p2:takeCard()
    gameManager.p2:takeCard()

    gameManager.p1:repositionCards()
    gameManager.p2:repositionCards()

    gameManager.locations[1]:insertCard(CardClass:new("P1", "LOCATION_1", "Zeus"))
    gameManager.locations[1]:insertCard(CardClass:new("P1", "LOCATION_1", "Zeus"))
    gameManager.locations[1]:insertCard(CardClass:new("P1", "LOCATION_1", "Zeus"))
    gameManager.locations[1]:insertCard(CardClass:new("P1", "LOCATION_1", "Zeus"))


    gameManager.locations[1]:repositionCards()

    return gameManager
end

function GameManagerClass:update()
    self.grabber:update()
end

function GameManagerClass:draw()
    self.p1:draw()
    self.p2:draw()

    self.locations[1]:draw()
    self.locations[2]:draw()
    self.locations[3]:draw()

    self.grabber:draw()
end

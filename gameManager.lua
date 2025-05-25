
GameManagerClass = {}

TURN_STATE = {
    SELECT = 1,
    REVEAL = 2,
    ENDOFTURN = 3,
}

function GameManagerClass:new(pointsToWin)
    local gameManager = {}
    local metadata = {__index = GameManagerClass}
    setmetatable(gameManager, metadata)

    gameManager.pointsToWin = pointsToWin
    gameManager.turnNo = 1

    gameManager.p1 = nil
    gameManager.p2 = nil

    gameManager.locations = {}

    return gameManager
end

function GameManagerClass:update()
    
end


PlayerClass = {}

function PlayerClass:new(playerNo)
    local player = {}
    local metadata = {__index = player}
    setmetatable(player, metadata)

    player.playerNo = playerNo
    player.points = 0
    player.mana = 0

    player.deck = {}
    player.hand = {}
    player.discard = {}

    return player
end

function PlayerClass:getOpponent()
    return 3 - self.playerNo
end

function PlayerClass:submitPlay()
    
end


require "vector"

SCREEN_WIDTH = 800
SCREEN_HEIGHT = 600
love.window.setMode(SCREEN_WIDTH, SCREEN_HEIGHT)
love.graphics.setBackgroundColor(0.82, 0.41, 0.12, 1)

local font = love.graphics.newFont("fonts/MinecraftStandard.otf", 6, "mono")
love.graphics.setFont(font)

CARD_WIDTH = 64
CARD_HEIGHT = 96

SMALL_CARD_SCALE = 1
SMALL_CARD_WIDTH = CARD_WIDTH * SMALL_CARD_SCALE
SMALL_CARD_HEIGHT = CARD_HEIGHT * SMALL_CARD_SCALE

POSITIONS = {
    ["LOCATION_1"] = {
        ["P1"] = {
            Vector(SCREEN_WIDTH / 4 - SMALL_CARD_WIDTH / 2, SCREEN_HEIGHT / 2 + SMALL_CARD_HEIGHT/2),
            Vector(SCREEN_WIDTH / 4 + SMALL_CARD_WIDTH / 2, SCREEN_HEIGHT / 2 + SMALL_CARD_HEIGHT/2),
            Vector(SCREEN_WIDTH / 4 - SMALL_CARD_WIDTH / 2, SCREEN_HEIGHT / 2 + SMALL_CARD_HEIGHT/2 + SMALL_CARD_HEIGHT),
            Vector(SCREEN_WIDTH / 4 + SMALL_CARD_WIDTH / 2, SCREEN_HEIGHT / 2 + SMALL_CARD_HEIGHT/2 + SMALL_CARD_HEIGHT)
        },
        ["P2"] = {
            Vector(SCREEN_WIDTH / 4 - SMALL_CARD_WIDTH / 2, SCREEN_HEIGHT / 2 - (SMALL_CARD_HEIGHT/2)),
            Vector(SCREEN_WIDTH / 4 + SMALL_CARD_WIDTH / 2, SCREEN_HEIGHT / 2 - (SMALL_CARD_HEIGHT/2)),
            Vector(SCREEN_WIDTH / 4 - SMALL_CARD_WIDTH / 2, SCREEN_HEIGHT / 2 - (SMALL_CARD_HEIGHT/2 + SMALL_CARD_HEIGHT)),
            Vector(SCREEN_WIDTH / 4 + SMALL_CARD_WIDTH / 2, SCREEN_HEIGHT / 2 - (SMALL_CARD_HEIGHT/2 + SMALL_CARD_HEIGHT))
        }
    },
    ["LOCATION_2"] = {
        ["P1"] = {
            Vector(SCREEN_WIDTH / 2 - SMALL_CARD_WIDTH / 2, SCREEN_HEIGHT / 2 + SMALL_CARD_HEIGHT/2),
            Vector(SCREEN_WIDTH / 2 + SMALL_CARD_WIDTH / 2, SCREEN_HEIGHT / 2 + SMALL_CARD_HEIGHT/2),
            Vector(SCREEN_WIDTH / 2 - SMALL_CARD_WIDTH / 2, SCREEN_HEIGHT / 2 + SMALL_CARD_HEIGHT/2 + SMALL_CARD_HEIGHT),
            Vector(SCREEN_WIDTH / 2 + SMALL_CARD_WIDTH / 2, SCREEN_HEIGHT / 2 + SMALL_CARD_HEIGHT/2 + SMALL_CARD_HEIGHT)
        },
        ["P2"] = {
            Vector(SCREEN_WIDTH / 2 - SMALL_CARD_WIDTH / 2, SCREEN_HEIGHT / 2 - (SMALL_CARD_HEIGHT/2)),
            Vector(SCREEN_WIDTH / 2 + SMALL_CARD_WIDTH / 2, SCREEN_HEIGHT / 2 - (SMALL_CARD_HEIGHT/2)),
            Vector(SCREEN_WIDTH / 2 - SMALL_CARD_WIDTH / 2, SCREEN_HEIGHT / 2 - (SMALL_CARD_HEIGHT/2 + SMALL_CARD_HEIGHT)),
            Vector(SCREEN_WIDTH / 2 + SMALL_CARD_WIDTH / 2, SCREEN_HEIGHT / 2 - (SMALL_CARD_HEIGHT/2 + SMALL_CARD_HEIGHT))
        }
    },
    ["LOCATION_3"] = {
        ["P1"] = {
            Vector(SCREEN_WIDTH * 3 / 4 - SMALL_CARD_WIDTH / 2, SCREEN_HEIGHT / 2 + SMALL_CARD_HEIGHT/2),
            Vector(SCREEN_WIDTH * 3 / 4 + SMALL_CARD_WIDTH / 2, SCREEN_HEIGHT / 2 + SMALL_CARD_HEIGHT/2),
            Vector(SCREEN_WIDTH * 3 / 4 - SMALL_CARD_WIDTH / 2, SCREEN_HEIGHT / 2 + SMALL_CARD_HEIGHT/2 + SMALL_CARD_HEIGHT),
            Vector(SCREEN_WIDTH * 3 / 4 + SMALL_CARD_WIDTH / 2, SCREEN_HEIGHT / 2 + SMALL_CARD_HEIGHT/2 + SMALL_CARD_HEIGHT)
        },
        ["P2"] = {
            Vector(SCREEN_WIDTH * 3 / 4 - SMALL_CARD_WIDTH / 2, SCREEN_HEIGHT / 2 - (SMALL_CARD_HEIGHT/2)),
            Vector(SCREEN_WIDTH * 3 / 4 + SMALL_CARD_WIDTH / 2, SCREEN_HEIGHT / 2 - (SMALL_CARD_HEIGHT/2)),
            Vector(SCREEN_WIDTH * 3 / 4 - SMALL_CARD_WIDTH / 2, SCREEN_HEIGHT / 2 - (SMALL_CARD_HEIGHT/2 + SMALL_CARD_HEIGHT)),
            Vector(SCREEN_WIDTH * 3 / 4 + SMALL_CARD_WIDTH / 2, SCREEN_HEIGHT / 2 - (SMALL_CARD_HEIGHT/2 + SMALL_CARD_HEIGHT))
        }
    },
    ["DECK"] = {
        ["P1"] = { Vector(SCREEN_WIDTH - CARD_WIDTH/2, SCREEN_HEIGHT - CARD_HEIGHT/2) },
        ["P2"] = { Vector(SCREEN_WIDTH - CARD_WIDTH/2, CARD_HEIGHT/2) }
    },
    ["HAND"] = {
        ["P1"] = {
            Vector(SCREEN_WIDTH / 2 - CARD_WIDTH * 3, SCREEN_HEIGHT - CARD_HEIGHT / 2),
            Vector(SCREEN_WIDTH / 2 - CARD_WIDTH * 2, SCREEN_HEIGHT - CARD_HEIGHT / 2),
            Vector(SCREEN_WIDTH / 2 - CARD_WIDTH * 1, SCREEN_HEIGHT - CARD_HEIGHT / 2),
            Vector(SCREEN_WIDTH / 2 - CARD_WIDTH * 0, SCREEN_HEIGHT - CARD_HEIGHT / 2),
            Vector(SCREEN_WIDTH / 2 + CARD_WIDTH * 1, SCREEN_HEIGHT - CARD_HEIGHT / 2),
            Vector(SCREEN_WIDTH / 2 + CARD_WIDTH * 2, SCREEN_HEIGHT - CARD_HEIGHT / 2),
            Vector(SCREEN_WIDTH / 2 + CARD_WIDTH * 3, SCREEN_HEIGHT - CARD_HEIGHT / 2)
        },
        ["P2"] = {
            Vector(SCREEN_WIDTH / 2 - CARD_WIDTH * 3, CARD_HEIGHT / 2),
            Vector(SCREEN_WIDTH / 2 - CARD_WIDTH * 2, CARD_HEIGHT / 2),
            Vector(SCREEN_WIDTH / 2 - CARD_WIDTH * 1, CARD_HEIGHT / 2),
            Vector(SCREEN_WIDTH / 2 - CARD_WIDTH * 0, CARD_HEIGHT / 2),
            Vector(SCREEN_WIDTH / 2 + CARD_WIDTH * 1, CARD_HEIGHT / 2),
            Vector(SCREEN_WIDTH / 2 + CARD_WIDTH * 2, CARD_HEIGHT / 2),
            Vector(SCREEN_WIDTH / 2 + CARD_WIDTH * 3, CARD_HEIGHT / 2)
        }
    },
    ["DISCARD"] = {
        ["P1"] = { Vector(CARD_WIDTH/2, SCREEN_HEIGHT - CARD_HEIGHT/2) },
        ["P2"] = { Vector(CARD_WIDTH/2, CARD_HEIGHT/2) }
    }
}

function opponent(str)
    if str == "P1" then
        return "P2"
    elseif str == "P2" then
        return "P1"
    else
        return "HUH"
    end
end
local dungeonAID = 60003
local PORTAL_TARGET = {x = 937, y = 1120, z = 7}

local function teleportToDungeon(player)
    local playerPosition = player:getPosition()
    local playerNewPosition = player:setPositions()
    playerPosition.x = PORTAL_TARGET.x
    playerPosition.y = PORTAL_TARGET.y
    playerPosition.z = PORTAL_TARGET.z
    player:teleportTo(playerPosition)
end

local function enterDungeon(player)
    local modalWindow = ModalWindow({
        title = "Entrar na Dungeon?",
        message = "Tem certeza que quer entrar na Dungeon?",
    })

    modalWindow:addButton("Sim", function(player)
        teleportToDungeon(player)
    end)

    modalWindow:addButton("Nao", function(player)
        player:sendTextMessage(MESSAGE_INFO_DESCR, "Voce recusou entrar na dungeon.")
    end)

    modalWindow:sendToPlayer(player)
end

local dungeonAction = Action()

function dungeonAction.onUse(player, words, param)
    enterDungeon(player)
    return false
end

dungeonAction:aid(dungeonAID)
dungeonAction:register()

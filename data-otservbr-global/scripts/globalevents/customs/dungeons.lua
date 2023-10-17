local config = {
    itemId = 25050,
    edges = {
        fromPos = {x = 1064, y = 1104, z = 7},
        toPos = {x = 1071, y = 1108, z = 7},
    },
    actionId = 60003,
    maxPortals = 5, -- Número máximo de portais permitidos
}

local dungeonsOnMap = GlobalEvent("dungeonsOnMap")
local createdPortals = 0 -- Variável global para rastrear o número de portais criados

function getRandomPos(f, t)
    local maxAttempts = 10
    for _ = 1, maxAttempts do
        local pos = {
            x = math.random(f.x, t.x),
            y = math.random(f.y, t.y),
            z = math.random(f.z, t.z)
        }
        return pos
    end
    return nil
end

function createDungeonPortal()
    -- Verifique se o número máximo de portais já foi criado
    if createdPortals >= config.maxPortals then
        print("Número máximo de portais foi atingido. Não é possível criar mais.")
        return
    end

    local pos = getRandomPos(config.edges.fromPos, config.edges.toPos)
    if pos then
        print("Coordenadas selecionadas para o item: " .. ItemType(config.itemId):getName())
        print("X: " .. pos.x .. ", Y: " .. pos.y .. ", Z: " .. pos.z)

        local dungeon = Game.createItem(config.itemId, 1, pos)
        dungeon:setActionId(config.actionId)
        
        createdPortals = createdPortals + 1 -- Incrementa o contador de portais criados
        
        return dungeon
    else
        print("Não foi possível encontrar uma posição válida para criar a dungeon.")
    end
end

function dungeonsOnMap.onThink()
    -- Verifique se o número máximo de portais já foi criado antes de tentar criar mais
    if createdPortals < config.maxPortals then
        local portalsToCreate = config.maxPortals - createdPortals
        for _ = 1, portalsToCreate do
            createDungeonPortal()
        end
    end
    return true
end

dungeonsOnMap:interval(1000)
dungeonsOnMap:register()

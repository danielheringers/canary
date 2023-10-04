local config = {
    itemId = 39546,
    edges = {
        fromPos = {x = 1007, y = 1111, z = 7},
        toPos = {x = 1157, y = 1183, z = 7},
    },
    actionId = 60002, 
}

local bagsOnMap = GlobalEvent("bagsOnMap")


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


function createGiftBag()
    local pos = getRandomPos(config.edges.fromPos, config.edges.toPos)
    if pos then
        print("Coordenadas selecionadas para o item: " .. ItemType(config.itemId):getName())
        print("X: " .. pos.x .. ", Y: " .. pos.y .. ", Z: " .. pos.z)
        

        local giftBag = Game.createItem(config.itemId, 1, pos)
        giftBag:setActionId(config.actionId)
        
        return giftBag
    else
        print("Nao foi possível encontrar uma posicao valida para criar a sacola de presente.")
    end
end


function bagsOnMap.onThink()
    for _ = 1, 5 do
        createGiftBag()
    end
    return true
end
bagsOnMap:interval(900000)
bagsOnMap:register()

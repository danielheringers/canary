-- Configurações do global event
local config = {
    itemId = 39546, -- ID do item criado.
    edges = {
        fromPos = {x = 1007, y = 1111, z = 7}, -- Coordenadas da posição superior esquerda.
        toPos = {x = 1157, y = 1183, z = 7} -- Coordenadas da posição inferior direita.
    },
    actionId = 60002, -- Action ID das bolsas de presente
}

-- Registra o evento de criação de sacolas de presente com um novo ID exclusivo
local bagsOnMap = GlobalEvent("bagsOnMap")

-- Gera uma posição aleatória válida
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
    return nil -- Retorne nil se não encontrar uma posição válida após várias tentativas
end

-- Função para criar uma sacola de presente com Action ID
function createGiftBag()
    local pos = getRandomPos(config.edges.fromPos, config.edges.toPos)
    if pos then
        print("Coordenadas selecionadas para o item: " .. ItemType(config.itemId):getName())
        print("X: " .. pos.x .. ", Y: " .. pos.y .. ", Z: " .. pos.z)
        
        -- Crie a sacola de presente com Action ID
        local giftBag = Game.createItem(config.itemId, 1, pos) -- Apenas 1 item por vez
        giftBag:setActionId(config.actionId)
        
        return giftBag -- Retornar a sacola criada
    else
        print("Não foi possível encontrar uma posição válida para criar a sacola de presente.")
    end
end

-- Função chamada no startup do servidor para criar sacolas de presente
function bagsOnMap.onThink()
    for _ = 1, 5 do
        createGiftBag()
    end
    return true
end
bagsOnMap:interval(900000)
bagsOnMap:register()

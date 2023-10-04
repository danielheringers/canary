local GIFT_ITEM_AID = 60002

-- Tabela de recompensas com pesos
local rewards = {
    {itemId = 3035, count = 1, weight = 5},    -- Peso 5
    {itemId = 3035, count = 2, weight = 3},    -- Peso 3
    {itemId = 3035, count = 3, weight = 2},    -- Peso 2
    {itemId = 3035, count = 4, weight = 1},    -- Peso 1
    {itemId = 3035, count = 5, weight = 1},    -- Peso 1
}

-- Função para obter uma recompensa aleatória com base nos pesos
function getRandomReward()
    local totalWeight = 0
    for _, reward in ipairs(rewards) do
        totalWeight = totalWeight + reward.weight
    end

    local randomValue = math.random(1, totalWeight)
    local currentWeight = 0

    for _, reward in ipairs(rewards) do
        currentWeight = currentWeight + reward.weight
        if randomValue <= currentWeight then
            return reward
        end
    end

    -- Se algo der errado, retorne uma recompensa vazia
    return {itemId = 0, count = 0}
end

local function giveRewardToPlayer(player, reward)
    -- Aqui, você pode adicionar o código para dar a recompensa ao jogador
    -- Por exemplo, para dar um item ao jogador:
    if player:addItem(reward.itemId, reward.count) then
        return true
    else
        player:sendTextMessage(MESSAGE_STATUS_SMALL, "Voce nao tem espaço suficiente em seu inventario para receber a recompensa.")
        return false
    end
end

local function useGift(player, item)
    local reward = getRandomReward()
    if giveRewardToPlayer(player, reward) then
        player:sendTextMessage(MESSAGE_INFO_DESCR, "Voce abriu o presente e recebeu uma recompensa!")
        item:remove(1)
        return true
    else
        player:sendTextMessage(MESSAGE_INFO_DESCR, "Voce nao tem espaco suficiente em seu inventario para receber a recompensa.")
        return false
    end
end

local giftAction = Action()

function giftAction.onUse(player, item, fromPos, target, toPos, isHotkey)
    return useGift(player, item)
end

giftAction:aid(GIFT_ITEM_AID)
giftAction:register()

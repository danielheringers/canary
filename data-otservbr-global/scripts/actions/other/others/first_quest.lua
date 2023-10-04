local classRewards = {
    Saber = {
        {itemId = 3353, count = 1},
        {itemId = 3370, count = 1},
        {itemId = 3371, count = 1},
        {itemId = 3552, count = 1},
        {itemId = 3285, count = 1},
        {itemId = 266, count = 10},
        {itemId = 268, count = 10},
        {itemId = 28552, count = 1},
    },
    Rider = {
        {itemId = 31369, count = 1},
        {itemId = 3567, count = 1},
        {itemId = 3559, count = 1},
        {itemId = 3552, count = 1},
        {itemId = 3292, count = 1},
        {itemId = 266, count = 10},
        {itemId = 268, count = 10},
        {itemId = 28552, count = 1},
    },
    Assassin = {
        {itemId = 31369, count = 1},
        {itemId = 3567, count = 1},
        {itemId = 3559, count = 1},
        {itemId = 3552, count = 1},
        {itemId = 3267, count = 1},
        {itemId = 266, count = 10},
        {itemId = 268, count = 10},
        {itemId = 28552, count = 1},
    },
    Lancer = {
        {itemId = 3400, count = 1},
        {itemId = 3386, count = 1},
        {itemId = 3363, count = 1},
        {itemId = 10201, count = 1},
        {itemId = 3346, count = 1},
        {itemId = 266, count = 10},
        {itemId = 268, count = 10},
        {itemId = 28553, count = 1},
    },
    Berserker = {
        {itemId = 3367, count = 1},
        {itemId = 3431, count = 1},
        {itemId = 7463, count = 1},
        {itemId = 7464, count = 1},
        {itemId = 7457, count = 1},
        {itemId = 3282, count = 1},
        {itemId = 266, count = 10},
        {itemId = 268, count = 10},
        {itemId = 28554, count = 1},
    },
    Caster = {
        {itemId = 12599, count = 1},
        {itemId = 3567, count = 1},
        {itemId = 645, count = 1},
        {itemId = 3550, count = 1},
        {itemId = 20088, count = 1},
        {itemId = 3074, count = 1},
        {itemId = 266, count = 10},
        {itemId = 268, count = 10},
        {itemId = 28557, count = 1},
    },
    Archer = {
        {itemId = 5917, count = 1},
        {itemId = 8044, count = 1},
        {itemId = 32097, count = 1},
        {itemId = 3552, count = 1},
        {itemId = 2902, count = 1},
        {itemId = 3066, count = 1},
        {itemId = 3447, count = 500},
        {itemId = 266, count = 10},
        {itemId = 268, count = 10},
        {itemId = 28555, count = 1},
    }
}

local function getRewardForClass(player)
    local vocation = player:getVocation()
    if vocation then
        local vocationClass = vocation:getName()
        local rewards = classRewards[vocationClass]
        if rewards then
            local rewardMessage = "Voce pegou os seguintes itens da sua classe:\n"
            for _, reward in ipairs(rewards) do
                local itemID = reward.itemId
                if itemID then
                    local itemCount = reward.count
                    player:addItem(itemID, itemCount)
                    local item = ItemType(itemID)
                    rewardMessage = rewardMessage .. item:getName() .. " x" .. itemCount .. "\n"
                end
            end

            player:sendTextMessage(MESSAGE_INFO_DESCR, rewardMessage)
            return true
        else
            player:sendTextMessage(MESSAGE_INFO_DESCR, "Nao ha itens definidos para sua classe.")
        end
    else
        player:sendTextMessage(MESSAGE_INFO_DESCR, "Sua classe nao foi definida.")
    end

    return false
end

local classRewardAction = Action()

function classRewardAction.onUse(player, item, fromPos, target, toPos, isHotkey)
    local hasReceivedReward = player:getStorageValue(storage)
    if hasReceivedReward == 1 then
        player:sendTextMessage(MESSAGE_INFO_DESCR, "Voce ja pegou seus itens.")
        return true
    end

    if getRewardForClass(player) then
        player:setStorageValue(storage, 1)
        return true
    end

    return false
end


classRewardAction:aid(9878)
classRewardAction:register()

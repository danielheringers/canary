local QUEST_WINDOW_TITLE = "Quest of God"
local QUEST_WINDOW_TEXT = "Selecione a Quest para ver os detalhes e iniciar"

function onUse(player, item, fromPosition, target, toPosition, isHotkey)
    local questWindow = ModalWindow(1000, QUEST_WINDOW_TITLE, QUEST_WINDOW_TEXT)

    for i, quest in ipairs(quests) do
        local buttonText = quest.name
        local questId = i

        local function onQuestClick(player, modalWindow, buttonId, choiceId)
            -- Aqui você pode implementar a lógica para iniciar a quest
            player:sendTextMessage(MESSAGE_INFO_DESCR, "Você iniciou a quest: " .. quest.name)
            modalWindow:sendClose()
        end

        questWindow:addChoice(questId, buttonText)
        questWindow:setChoiceCallback(questId, onQuestClick)
    end

    questWindow:addButton(1001, "Close")
    questWindow:setDefaultEnterButton(1001)

    questWindow:sendToPlayer(player)
    return true
end

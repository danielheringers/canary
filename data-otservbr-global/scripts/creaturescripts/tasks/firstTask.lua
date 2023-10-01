function onCreatureAppear(cid)
    -- Este evento é acionado quando o jogador vê o NPC.
    -- Verifique se o jogador tem a tarefa e exiba a mensagem apropriada.
    local hasTask = getPlayerStorageValue(cid, 1001) -- Use um valor de storage adequado
    if hasTask == -1 then
        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Taskmaster: Até que enfim acordou, aventureiro! precisamos eliminar 50 trolls. Eles no cercaram, você aceita a missão?")
    elseif hasTask == 1 then
        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Taskmaster: Como está indo sua missão para matar trolls? Volte quando terminar.")
    elseif hasTask == 0 then
        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Taskmaster: Você já completou sua missão! Parabéns!")
    end
end

function onCreatureSay(cid, type, msg)
    -- Este evento é acionado quando o jogador fala com o NPC.
    -- Verifique se o jogador aceita ou reporta o status da tarefa.
    if msg == "sim" then
        local hasTask = getPlayerStorageValue(cid, 1001) -- Use um valor de storage adequado
        if hasTask == -1 then
            doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Taskmaster: Ótimo! Mate 50 trolls e volte aqui para me contar.")
            setPlayerStorageValue(cid, 1001, 1) -- Defina 1 para indicar que o jogador aceitou a tarefa.
            setPlayerStorageValue(cid, 1002, 0) -- Inicialize um contador para os trolls mortos.
        end
    elseif msg == "reportar" then
        local taskProgress = getPlayerStorageValue(cid, 1002) -- Use um valor de storage adequado
        if taskProgress >= 50 then
            doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Taskmaster: Parabéns! Você completou sua missão. Aqui está sua recompensa.")
            doPlayerAddExperience(cid, 100000) -- Adicione 100,000 pontos de experiência ao jogador como recompensa.
            setPlayerStorageValue(cid, 1001, 0) -- Define 0 para indicar que a tarefa foi concluída.
            setPlayerStorageValue(cid, 1002, 0) -- Reinicializa o contador.
        else
            doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Taskmaster: Você ainda precisa matar " .. (50 - taskProgress) .. " trolls para completar sua missão.")
        end
    end
end

function onKill(cid, target)
    -- Este evento é acionado quando o jogador mata uma criatura.
    -- Verifique se a criatura morta é um troll e atualize o contador.
    if isCreature(target) and getCreatureName(target) == "Troll" then
        local taskProgress = getPlayerStorageValue(cid, 1002) -- Use um valor de storage adequado
        if taskProgress < 50 then
            setPlayerStorageValue(cid, 1002, taskProgress + 1) -- Atualize o contador de trolls mortos.
        end
    end
end

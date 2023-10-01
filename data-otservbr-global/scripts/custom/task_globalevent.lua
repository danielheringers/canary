-- Cria uma variável chamada "taskLog" que representa um evento global chamado "TaskLog"
local taskLog = GlobalEvent("TaskLog")

-- Função chamada quando o servidor inicia
function taskLog.onStartup()
    -- Cria uma tabela vazia chamada "newmissions"
    local newmissions = {}

    -- Itera sobre os dados de configuração das tarefas (presumivelmente definido em algum lugar anterior no código)
    for i, data in pairs(taskConfiguration) do
        -- Adiciona informações sobre cada tarefa à tabela "newmissions"
        newmissions[#newmissions + 1] = {
            name = "Task: " .. data.name,
            storageId = data.storage,
            missionId = #newmissions + 1,
            startValue = 0,
            endValue = os.time() * 10,
            description = function(player)
                return (player:getTaskKills(data.storagecount) == -1 and "You have completed this task." or
                        (player:getTaskKills(data.storagecount) == data.total and
                         "You have completed this task, but you still need to collect your reward use !task." or
                         "You killed [" .. player:getTaskKills(data.storagecount) .. "/" .. data.total .. "] " .. data.name))
            end,
        }
    end

    -- Adiciona informações sobre todas as tarefas à tabela "Quests"
    Quests[#Quests + 1] = {
        name = "Tasks",
        startStorageId = taskQuestLog,
        startStorageValue = 1,
        missions = newmissions,
    }

    -- Retorna verdadeiro para indicar que o evento "TaskLog" foi configurado com sucesso
    return true
end

-- Registra o evento global "taskLog"
taskLog:register()

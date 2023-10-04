-- Define a TalkAction para ativar/desativar o ataque automático
local autoAttackCommand = TalkAction("!autoattack")

-- Armazena o estado atual do ataque automático para cada jogador
local autoAttackEnabled = {}

-- Função para verificar monstros próximos em modo de combate
function checkCombatMode(player)
    if autoAttackEnabled[player:getId()] and player:isInCombat() then
        local creatures = player:getCreaturesInRange(7) -- Verifique monstros em um raio de 7 tiles

        for _, creature in ipairs(creatures) do
            if creature:isMonster() then
                -- O jogador está em combate e há um monstro nas proximidades
                -- Ataque automaticamente o monstro
                player:autoAttack(creature)
                break -- Pare de verificar após atacar um monstro
            end
        end
    end
end

-- Função para alternar o estado do ataque automático
function toggleAutoAttack(player)
    local playerId = player:getId()
    if autoAttackEnabled[playerId] then
        autoAttackEnabled[playerId] = false
        player:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "Ataque automático desativado.")
    else
        autoAttackEnabled[playerId] = true
        player:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "Ataque automático ativado.")
    end
end

-- Comando !autoattack para ativar/desativar o ataque automático
function autoAttackCommand.onSay(player, words, param)
    toggleAutoAttack(player)
    return false
end

-- Registre a TalkAction
autoAttackCommand:groupType("normal")
autoAttackCommand:register()

-- Crie uma função para verificar automaticamente a cada intervalo de tempo (por exemplo, a cada segundo)
local checkInterval = 1000 -- intervalo em milissegundos (1 segundo)
local checkEvent

function onCheckCombatMode()
    for _, player in ipairs(Game.getPlayers()) do
        checkCombatMode(player)
    end
    checkEvent = addEvent(onCheckCombatMode, checkInterval)
end

-- Inicie a verificação automática de combate
checkEvent = addEvent(onCheckCombatMode, checkInterval)

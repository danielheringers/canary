local config = {
    duration = 7, -- Altere para a duração desejada em segundos
    rotationsPerSecond = 3, -- Rotações de magia por segundo
}

local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_HITAREA)
combat:setParameter(COMBAT_PARAM_BLOCKARMOR, 1)
combat:setParameter(COMBAT_PARAM_BLOCKSHIELD, 1)
combat:setParameter(COMBAT_PARAM_USECHARGES, 1)

local combat2 = Combat()
combat2:setParameter(COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
combat2:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_HITAREA)
combat2:setParameter(COMBAT_PARAM_BLOCKARMOR, 1)
combat2:setParameter(COMBAT_PARAM_BLOCKSHIELD, 1)
combat2:setParameter(COMBAT_PARAM_USECHARGES, 1)


local combat3 = Combat()
combat3:setParameter(COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
combat3:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_HITAREA)
combat3:setParameter(COMBAT_PARAM_BLOCKARMOR, 1)
combat3:setParameter(COMBAT_PARAM_BLOCKSHIELD, 1)
combat3:setParameter(COMBAT_PARAM_USECHARGES, 1)


local combat4 = Combat()
combat4:setParameter(COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
combat4:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_HITAREA)
combat4:setParameter(COMBAT_PARAM_BLOCKARMOR, 1)
combat4:setParameter(COMBAT_PARAM_BLOCKSHIELD, 1)
combat4:setParameter(COMBAT_PARAM_USECHARGES, 1)


local combat5 = Combat()
combat5:setParameter(COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
combat5:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_HITAREA)
combat5:setParameter(COMBAT_PARAM_BLOCKARMOR, 1)
combat5:setParameter(COMBAT_PARAM_BLOCKSHIELD, 1)
combat5:setParameter(COMBAT_PARAM_USECHARGES, 1)


local combat6 = Combat()
combat6:setParameter(COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
combat6:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_HITAREA)
combat6:setParameter(COMBAT_PARAM_BLOCKARMOR, 1)
combat6:setParameter(COMBAT_PARAM_BLOCKSHIELD, 1)
combat6:setParameter(COMBAT_PARAM_USECHARGES, 1)


local combat7 = Combat()
combat7:setParameter(COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
combat7:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_HITAREA)
combat7:setParameter(COMBAT_PARAM_BLOCKARMOR, 1)
combat7:setParameter(COMBAT_PARAM_BLOCKSHIELD, 1)
combat7:setParameter(COMBAT_PARAM_USECHARGES, 1)


local combat8 = Combat()
combat8:setParameter(COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
combat8:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_HITAREA)
combat8:setParameter(COMBAT_PARAM_BLOCKARMOR, 1)
combat8:setParameter(COMBAT_PARAM_BLOCKSHIELD, 1)
combat8:setParameter(COMBAT_PARAM_USECHARGES, 1)


function onGetFormulaValues(player, skill, attack, factor)
	local level = player:getLevel()

	local min = ((level / 5) + (skill + 2 * attack) * 1.1) / 3
	local max = ((level / 5) + (skill + 2 * attack) * 3) / 3

	return -min * 1.1, -max * 1.1 -- TODO : Use New Real Formula instead of an %
end

function onGetFormulaValues2(player, skill, attack, factor)
	local level = player:getLevel()

	local min = ((level / 5) + (skill + 2 * attack) * 1.1) / 3
	local max = ((level / 5) + (skill + 2 * attack) * 3) / 3

	return -min * 1.1, -max * 1.1 -- TODO : Use New Real Formula instead of an %
end

function onGetFormulaValues3(player, skill, attack, factor)
	local level = player:getLevel()

	local min = ((level / 5) + (skill + 2 * attack) * 1.1) / 3
	local max = ((level / 5) + (skill + 2 * attack) * 3) / 3

	return -min * 1.1, -max * 1.1 -- TODO : Use New Real Formula instead of an %
end

function onGetFormulaValues4(player, skill, attack, factor)
	local level = player:getLevel()

	local min = ((level / 5) + (skill + 2 * attack) * 1.1) / 3
	local max = ((level / 5) + (skill + 2 * attack) * 3) / 3

	return -min * 1.1, -max * 1.1 -- TODO : Use New Real Formula instead of an %
end

function onGetFormulaValues5(player, skill, attack, factor)
	local level = player:getLevel()

	local min = ((level / 5) + (skill + 2 * attack) * 1.1) / 3
	local max = ((level / 5) + (skill + 2 * attack) * 3) / 3

	return -min * 1.1, -max * 1.1 -- TODO : Use New Real Formula instead of an %
end

function onGetFormulaValues6(player, skill, attack, factor)
	local level = player:getLevel()

	local min = ((level / 5) + (skill + 2 * attack) * 1.1) / 3
	local max = ((level / 5) + (skill + 2 * attack) * 3) / 3

	return -min * 1.1, -max * 1.1 -- TODO : Use New Real Formula instead of an %
end

function onGetFormulaValues7(player, skill, attack, factor)
	local level = player:getLevel()

	local min = ((level / 5) + (skill + 2 * attack) * 1.1) / 3
	local max = ((level / 5) + (skill + 2 * attack) * 3) / 3

	return -min * 1.1, -max * 1.1 -- TODO : Use New Real Formula instead of an %
end

function onGetFormulaValues8(player, skill, attack, factor)
	local level = player:getLevel()

	local min = ((level / 5) + (skill + 2 * attack) * 1.1) / 3
	local max = ((level / 5) + (skill + 2 * attack) * 3) / 3

	return -min * 1.1, -max * 1.1 -- TODO : Use New Real Formula instead of an %
end

arr = {
    {0, 1, 0},
    {0, 2, 0},
    {0, 0, 0},
}

arr2 = {
    {0, 0, 1},
    {0, 2, 0},
    {0, 0, 0},
}

arr3 = {
    {0, 0, 0},
    {0, 2, 1},
    {0, 0, 0},
}
arr4 = {
    {0, 0, 0},
    {0, 2, 0},
    {0, 0, 1},
}

arr5 = {
    {0, 0, 0},
    {0, 2, 0},
    {0, 1, 0},
}

arr6 = {
    {0, 0, 0},
    {0, 2, 0},
    {1, 0, 0},
}

arr7 = {
    {0, 0, 0},
    {1, 2, 0},
    {0, 0, 0},
}

arr8 = {
    {1, 0, 0},
    {0, 2, 0},
    {0, 0, 0},
}

local area = createCombatArea(arr)
combat:setArea(area)

local area2 = createCombatArea(arr2)
combat2:setArea(area2)

local area3 = createCombatArea(arr3)
combat3:setArea(area3)

local area4 = createCombatArea(arr4)
combat4:setArea(area4)

local area5 = createCombatArea(arr5)
combat5:setArea(area5)

local area6 = createCombatArea(arr6)
combat6:setArea(area6)

local area7 = createCombatArea(arr7)
combat7:setArea(area7)

local area8 = createCombatArea(arr8)
combat8:setArea(area8)


combat:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")
combat2:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues2")
combat3:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues3")
combat4:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues4")
combat5:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues5")
combat6:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues6")
combat7:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues7")
combat8:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues8")

local spell = Spell("instant")
local combatList = {
    combat, combat2, combat3, combat4, combat5, combat6, combat7, combat8
}


function spell.onCastSpell(creature, var)
    local totalRotations = config.rotationsPerSecond * config.duration
    local currentIndex = 1
    local rotationsRemaining = totalRotations
    local rotationInterval = 1000 / config.rotationsPerSecond -- Tempo entre cada rotação em milissegundos

    local function executeRotation()
        if rotationsRemaining > 0 then
            for _ = 1, #combatList do
                combatList[currentIndex]:execute(creature, var)
                currentIndex = currentIndex % #combatList + 1
            end
            rotationsRemaining = rotationsRemaining - 1

            if rotationsRemaining > 0 then
                addEvent(executeRotation, rotationInterval)
            end
        end
    end

    executeRotation() -- Inicia a primeira rotação

    return true
end


spell:group("attack")
spell:id()
spell:name("Valsa das Laminas")
spell:words("Valsa das Laminas")
spell:level(5)
spell:mana(75)
spell:isPremium(false)
spell:range(1)
spell:needCasterTargetOrDirection(false)
spell:isSelfTarget(true)
spell:blockWalls(true)
spell:cooldown(15 * 1000)
spell:groupCooldown(15 * 1000)
spell:needLearn(false)
spell:vocation("saber;true", "saber lord;true")
spell:register()
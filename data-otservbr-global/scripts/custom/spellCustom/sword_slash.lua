local config = {
    duration = 3, -- Altere para a duração desejada em segundos
}

local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_HITAREA)
combat:setParameter(COMBAT_PARAM_BLOCKARMOR, 1)
combat:setParameter(COMBAT_PARAM_BLOCKSHIELD, 1)
combat:setParameter(COMBAT_PARAM_USECHARGES, 1)
combat:setArea(createCombatArea(AREA_WAVE6, AREADIAGONAL_WAVE6))

function onGetFormulaValues(player, skill, attack, factor)
    local skillTotal = skill * attack
    local levelTotal = player:getLevel() / 5
    return -(((skillTotal * 0.04) + 31) + levelTotal) * 1.1, -(((skillTotal * 0.08) + 45) + levelTotal) * 1.1
end

combat:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")

local spell = Spell("instant")

local function executeCombat(creature, var)
    combat:execute(creature, var)
end

function spell.onCastSpell(creature, var)
    for i = 1, config.duration do
        addEvent(function() executeCombat(creature, var) end, 1000 * (i - 1)) -- Use uma expressão de função aqui
    end
    return true
end

spell:group("attack")
spell:id(0)
spell:name("Front Slash")
spell:words("Front Slash")
spell:castSound(SOUND_EFFECT_TYPE_SPELL_FRONT_SWEEP)
spell:level(1)
spell:mana(30)
spell:isPremium(false)
spell:needDirection(true)
spell:needWeapon(true)
spell:cooldown(4000)
spell:groupCooldown(1000)
spell:needLearn(false)
spell:vocation("saber;true", "saber lord;true")
spell:register()

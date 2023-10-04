local loginEvents = CreatureEvent("LoginEvents")
function loginEvents.onLogin(player)
	local events = {
		--Monster
	
		--Others
		"AdvanceSave",
		"BestiaryOnKill",
		"BosstiaryOnKill",
		"BossParticipation",
		"DropLoot",
		"PlayerDeath",
		-- Hazard System
		"PrimalHazardKill",
		-- Custom Events
		"TaskCreature"
	}

	for i = 1, #events do
		player:registerEvent(events[i])
	end
	return true
end

loginEvents:register()

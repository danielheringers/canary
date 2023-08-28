if not Waypoints.enalbed then
	return
end

local waypointUnlock = Action()

function waypointUnlock.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	player:getPosition():sendMagicEffect(CONST_ME_MAGIC_GREEN)
	player:addWaypointModal(function()
		item:remove()
	end)
	return true
end

waypointUnlock:id(Waypoints.unlockItemId)
waypointUnlock:register()

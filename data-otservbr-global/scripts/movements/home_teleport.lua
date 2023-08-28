if not Waypoints.enalbed then
	return
end

local homeTeleport = MoveEvent()

function homeTeleport.onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return
	end

	local window = ModalWindow {
		title = "Teleport to Waypoints",
		message = "Waypoint"
	}
	for i, info in pairs(player:getWaypoints()) do
		window:addChoice(string.format("%s", info.name), function(player, button, choice)
			if button.name ~= "Select" then
				return true
			end
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You were teleported to " .. info.name)
			player:teleportTo(info.position)
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
			return true
		end)
	end
	window:addButton("Select")
	window:addButton("Close")
	window:setDefaultEnterButton(0)
	window:setDefaultEscapeButton(1)
	window:sendToPlayer(player)
	return true
end

homeTeleport:type("stepin")
for _, id in pairs(Waypoints.teleportIds) do
	homeTeleport:id(id)
end
homeTeleport:register()

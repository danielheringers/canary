local up = TalkAction("!effect")
local config ={
    count = 120
}

function up.onSay(player, words, param)
    for i = 1, config.count do
        player:say("/effect " .. i) -- Use "i" para inserir o número do efeito atual
    end
end

up:separator(" ")
up:groupType("gamemaster") -- Use "group" em vez de "groupType"
up:register()
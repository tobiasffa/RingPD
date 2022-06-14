-- Created by Taco
-- Created by Taco
local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRPclient = Tunnel.getInterface("vRP", "tacos_ringpd") 
vRP = Proxy.getInterface("vRP")

RegisterNetEvent("pdringet")
AddEventHandler("pdringet", function(name)
    local user_id = vRP.getUserId({source})
    local source = source
    local name = GetPlayerName(source)
    local dname = "RingPD"
    local dmessage = "```ID: ".. tostring(user_id).. " | "..name.." | Ringe på MissionrowPD.```"

    if cfg.stated then
        TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'success', text = 'Du ringede på Missionrowpd', length = 2500, style = { ['background-color'] = '#4ad066', ['color'] = '#ffffff' } })
        TriggerClientEvent('chatMessage', -1, "^4[RINGPD]^3 |"..name.." | ^1" ..string.sub("000000ringede på MisisonrowPD",7))
        PerformHttpRequest('https://discord.com/api/webhooks/850059335169736724/HLYwNhQDQZdtKaKtyOf1y1jJuvVrST6mkvYSdOXpBJjyGh3LgG2bK8W4V0I4UrQJyRIk', function(err, text, headers) end, 'POST', json.encode({username = dname, content = dmessage}), { ['Content-Type'] = 'application/json' })
    end
end)
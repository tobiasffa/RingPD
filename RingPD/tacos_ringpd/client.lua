-- Created by Taco
-- Created by Taco
startet = true

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
        local Ped = GetPlayerPed(-1)
        if startet == true then
                if GetDistanceBetweenCoords(GetEntityCoords(Ped),441.12728881836,-981.14776611328,30.689315795898,true) <= 1 then
                    DrawText3D(441.12728881836,-981.14776611328,30.989315795898,"Tryk [~b~E~w~] for at ringe på PD")
                    if IsControlJustPressed(1, 38) then
                        RequestAnimDict("random@atmrobberygen@male")
            while not HasAnimDictLoaded('random@atmrobberygen@male') do
                Citizen.Wait(500)
            end
 
            TaskPlayAnim(PlayerPedId(),"random@atmrobberygen@male","idle_a",3.0,0.5,-1,31,1.0,0,0)
            exports['progressBars']:startUI(3000, "Ringer på PD!")
            Citizen.Wait(3000)
            ClearPedTasksImmediately(GetPlayerPed(-1))
                        TriggerServerEvent("pdringet")
                    end
                end
            end
        end
    end)

function DrawText3D(x, y, z, text)
    local onScreen, _x, _y = World3dToScreen2d(x, y, z)
    local px, py, pz = table.unpack(GetGameplayCamCoords())
    SetTextScale(0.38, 0.38)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x, _y)
end

    RegisterCommand("KS:getCoordsH", function(source,args)
        print(GetEntityCoords(PlayerPedId()).." "..GetEntityHeading(PlayerPedId()))
    end)
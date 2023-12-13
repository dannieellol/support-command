ESX = nil
ESX = exports["es_extended"]:getSharedObject()

Citizen.CreateThread(function()
 while ESX == nil do
  TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
  Citizen.Wait(0)
 end
end)

--/support arg1 arg2 arg3
RegisterCommand("support", function(source, args, rawCommand)

    local message = ''
    for i=1, #args, 1 do
        message = message .. '' .. args[i]
    end

    TriggerServerEvent('tox1c:callSupport', message)

end)

RegisterNetEvent('tox1c:showSupport')
AddEventHandler('tox1c:showSupport', function(playername, playerid, message)

    ESX.ShowNotification('~r~Supportfall\n~y~' .. playername .. ' ~s~(~y~' .. playerid ' ~s~) braucht Hilfe. \nNachricht:~b~' .. message)

    local blip = AddBlipForCoord(location.x, location.y)
    SetBlipSprite(blip, 280)
    SetBlipScale(blip, 1.2)
    SetBlipColour(blip, 0)
    BeginTextCommandSetBlipName("STRING");
    AddTextComponentString('SUPPORTFALL')
    EndTextCommandSetBlipName(blip)

    local time = 0
    while time < 800 do
        time = time + 1
        showInfobar('Drücke ~b~[E]~s~, um dich zu ~y~' .. playername .. ' ~s~zu Teleportieren.')
        if IsControlJustReleased(0, 38) then
            SetEntityCoords(PlayerPedId(), location.x, location.y, location.z + 1.0)
            time = 800
            RemoveBlip(blip)
        end

        Citizen.Wait(1)
    end
end)

function showInfobar(msg)

    CurrentActionMsg  = msg
    SetTextComponentFormat('STRING')
    AddTextComponentString(CurrentActionMsg)
    DisplayHelpTextFromStringLabel(0, 0, 1, -1)
   
   end
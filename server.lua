local ESX = nil
ESX = exports["es_extended"]:getSharedObject()

TriggerEvent('esx:getSharedObject', function(obj) 
    ESX = obj 
end)

RegisterServerEvent('tox1c:callSupport')
AddEventHandler('tox1c:callSupport', function(message)

    local xPlayerSender = ESX.GetPlayerFromId(source)

    for k, v in pairs(GetPlayers()) do
        local xPlayerTarget = ESX.GetPlayerFromId(v)
        local targetJob = xPlayerTarget.getJob()

        if targetGroup == 'admin' then
            TriggerClientEvent('tox1c:showSupport', xPlayerTarget.source, xPlayerSender.name, xPlayerSender.source, message)
        end
    end

end)
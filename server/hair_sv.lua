local QBCore = exports['qb-core']:GetCoreObject()


RegisterNetEvent('eraoutfits:server:SaveAltHair')
AddEventHandler('eraoutfits:server:SaveAltHair', function(drawableVariations)
    local source = source
    local playerPed = GetPlayerPed(source)
    local althair = drawableVariations

    local citizenid = QBCore.Functions.GetPlayer(source).PlayerData.citizenid

    MySQL.Async.insert('INSERT INTO `playershair` (citizenid, althair) VALUES (?, ?) ON DUPLICATE KEY UPDATE althair = ?', {citizenid, althair, althair}, function(affectedRows)
        if affectedRows > 0 then
            TriggerClientEvent('QBCore:Notify', source, "Haircut saved", 'success')
        else
        end
    end)
end)

RegisterNetEvent('eraoutfits:server:SaveBaseHair')
AddEventHandler('eraoutfits:server:SaveBaseHair', function(drawableVariations)
    local source = source
    local playerPed = GetPlayerPed(source)
    local basehair = drawableVariations 

    local citizenid = QBCore.Functions.GetPlayer(source).PlayerData.citizenid

    MySQL.Async.insert('INSERT INTO `playershair` (citizenid, basehair) VALUES (?, ?) ON DUPLICATE KEY UPDATE basehair = ?', {citizenid, basehair, basehair}, function(affectedRows)
        if affectedRows > 0 then
            TriggerClientEvent('QBCore:Notify', source, "Haircut saved", 'success')
        else
        end
    end)
end)

RegisterNetEvent('eraoutfits:server:GetHairData')
AddEventHandler('eraoutfits:server:GetHairData', function()
    local source = source
    local citizenid = QBCore.Functions.GetPlayer(source).PlayerData.citizenid

    MySQL.Async.fetchAll('SELECT althair, basehair FROM playershair WHERE citizenid = ?', { citizenid }, function(result)
        if result and #result > 0 then
            local althair = result[1].althair
            local basehair = result[1].basehair


            TriggerClientEvent('eraoutfits:client:ReceiveHairData', source, althair, basehair)
        else
            TriggerClientEvent('eraoutfits:client:ReceiveNullHairData', source)
        end
    end)
end)

RegisterNetEvent('eraoutfits:server:switchHair')
AddEventHandler('eraoutfits:server:switchHair', function(drawableVariations)
    local source = source
    local playerPed = GetPlayerPed(source)
    local citizenid = QBCore.Functions.GetPlayer(source).PlayerData.citizenid
    local actualHair = drawableVariations

    MySQL.Async.fetchAll('SELECT althair, basehair FROM playershair WHERE citizenid = ?', { citizenid }, function(result)
        if result and #result > 0 then
            local althair = result[1].althair
            local basehair = result[1].basehair

            TriggerClientEvent('eraoutfits:client:ChangeHairs', source, actualHair, althair, basehair)
        end
    end)
end)

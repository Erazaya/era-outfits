local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('eraoutfits:client:GetHairData')
AddEventHandler('eraoutfits:client:GetHairData', function()
    TriggerServerEvent('eraoutfits:server:GetHairData')
end)

local althair = nil
local basehair = nil

RegisterNetEvent('eraoutfits:client:openHairMenu')
AddEventHandler('eraoutfits:client:openHairMenu', function(data)

    TriggerServerEvent('eraoutfits:server:GetHairData')
end)

RegisterNetEvent('eraoutfits:client:ReceiveHairData')
AddEventHandler('eraoutfits:client:ReceiveHairData', function(althair, basehair)

    exports['qb-menu']:openMenu({
        {
            header = 'Manage Hairs',
            icon = 'fas fa-code',
            isMenuHeader = true 
        },
        {
            header = 'Sauvegarder Coupe 1',
            txt = 'Saved : ' .. basehair,
            icon = 'fas fa-code-merge',
            params = {
                isServer = false,
                event = 'eraoutfits:client:SaveBaseHair',
                args = {
                    hair = 'base',
                }
            }
        },  
        {
            header = 'Sauvegarder Coupe 2',
            txt = 'Saved : ' .. althair,
            icon = 'fas fa-code-merge',
            params = {
                isServer = false,
                event = 'eraoutfits:client:SaveAltHair',
                args = {
                    hair = 'alt',
                }
            }
        },
    })
end)
RegisterNetEvent('eraoutfits:client:ReceiveNullHairData')
AddEventHandler('eraoutfits:client:ReceiveNullHairData', function(althair, basehair)


    exports['qb-menu']:openMenu({
        {
            header = 'Manage Haircuts',
            icon = 'fas fa-code',
            isMenuHeader = true --
        },
        {
            header = 'Save Haircut 1',
            txt = 'Saved : None',
            icon = 'fas fa-code-merge',
            params = {
                isServer = false,
                event = 'eraoutfits:client:SaveBaseHair',
                args = {
                    hair = 'base',
                }
            }
        },  
        {
            header = 'Save Haircut 2',
            txt = 'Saved : None',
            icon = 'fas fa-code-merge',
            params = {
                isServer = false,
                event = 'eraoutfits:client:SaveAltHair',
                args = {
                    hair = 'alt',
                }
            }
        },
    })
end)



RegisterNetEvent('eraoutfits:client:SaveBaseHair')
AddEventHandler('eraoutfits:client:SaveBaseHair', function()
    QBCore.Functions.Notify(hair, 'error')
    local playerPed = GetPlayerPed(-1)
    local drawableVariations = GetPedDrawableVariation(playerPed, 2) 
         TriggerServerEvent('eraoutfits:server:SaveBaseHair', drawableVariations)
end)


RegisterNetEvent('eraoutfits:client:SaveAltHair')
AddEventHandler('eraoutfits:client:SaveAltHair', function()
    local playerPed = GetPlayerPed(-1)
    local drawableVariations = GetPedDrawableVariation(playerPed, 2) 
        TriggerServerEvent('eraoutfits:server:SaveAltHair', drawableVariations)
end)

RegisterNetEvent('eraoutfits:client:ChangeHairs')
AddEventHandler('eraoutfits:client:ChangeHairs', function(actualHair, althair, basehair)
    local playerPed = GetPlayerPed(-1)
    --QBCore.Functions.Notify("hair" .. althair .. basehair, 'error') -- Debug Notify

    if actualHair == basehair then
        SetPedComponentVariation(playerPed, 2, althair, 0, 0)
    elseif actualHair == althair then 
        SetPedComponentVariation(playerPed, 2, basehair, 0, 0 ) 
        if actualHair ~= althair and actualHair ~= basehair then
            QBCore.Functions.Notify("Save your haircuts before switching !", 'error')
        end
    end
end)


RegisterNetEvent('eraoutfits:client:switchHair')
AddEventHandler('eraoutfits:client:switchHair', function()
    local playerPed = PlayerPedId()
    local drawableVariations = GetPedDrawableVariation(playerPed, 2)

    TriggerServerEvent('eraoutfits:server:switchHair', drawableVariations)

    RequestAnimDict("anim@mp_player_intselfiethe_bird")
    TaskPlayAnim(playerPed, "anim@mp_player_intselfiethe_bird", "enter", 8.0, -8, -1, 49, 0, 0, 0, 0)

    Citizen.Wait(700)
    ClearPedTasks(playerPed)
end)

local QBCore = exports['qb-core']:GetCoreObject()



function GetPlayerGender(source)
    
    local playerPed = GetPlayerPed(source)
    local genderHash = GetEntityModel(playerPed)

if genderHash == GetHashKey("mp_f_freemode_01") then
        return "female"
    elseif genderHash == GetHashKey("mp_m_freemode_01") then
        return "male"
    else
        return "unknown" --  not working for ped models, support for our non binary friends i guess
    end
end

QBCore.Functions.CreateUseableItem("era_pants", function(source, item)
    local source = source
    local Player = QBCore.Functions.GetPlayer(source)
    local IsPed = GetPlayerGender(source)
    local progressActive = lib.callback.await('eraoutfits:IsProgressActive', source)
    if IsPed == "unknown" or progressActive then
        if IsPed == "unknown" then
            TriggerClientEvent('QBCore:Notify', source, "Ped cant use clothes !", "error")
        else
            QBCore.Functions.Notify("You are already doing something!", 'error')
        end
        return 
    end
    TriggerClientEvent('eraoutfits:client:switch', source, "pant", item)
    TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items[item.name], "remove")
    Player.Functions.RemoveItem(item.name, 1, item.slot)
end)

QBCore.Functions.CreateUseableItem("era_top", function(source, item)
    local source = source
    local Player = QBCore.Functions.GetPlayer(source)
    local IsPed = GetPlayerGender(source)
    local progressActive = lib.callback.await('eraoutfits:IsProgressActive', source)
    if IsPed == "unknown" or progressActive then
        if IsPed == "unknown" then
            TriggerClientEvent('QBCore:Notify', source, "Ped cant use clothes !", "error")
        else
            QBCore.Functions.Notify("You are already doing something!", 'error')
        end
        return 
    end
    TriggerClientEvent('eraoutfits:client:switch', source, "shirt", item)
    TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items[item.name], "remove")
    Player.Functions.RemoveItem(item.name, 1, item.slot)
end)

QBCore.Functions.CreateUseableItem("era_chains", function(source, item)
    local source = source
    local Player = QBCore.Functions.GetPlayer(source)
    local IsPed = GetPlayerGender(source)
    local progressActive = lib.callback.await('eraoutfits:IsProgressActive', source)
    if IsPed == "unknown" or progressActive then
        if IsPed == "unknown" then
            TriggerClientEvent('QBCore:Notify', source, "Ped cant use clothes !", "error")
        else
            QBCore.Functions.Notify("You are already doing something!", 'error')
        end
        return 
    end
    TriggerClientEvent('eraoutfits:client:switch', source, "chains", item)
    TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items[item.name], "remove")
    Player.Functions.RemoveItem(item.name, 1, item.slot)
end)

QBCore.Functions.CreateUseableItem("era_mask", function(source, item)
    local source = source
    local Player = QBCore.Functions.GetPlayer(source)
    local IsPed = GetPlayerGender(source)
    local progressActive = lib.callback.await('eraoutfits:IsProgressActive', source)
    if IsPed == "unknown" or progressActive then
        if IsPed == "unknown" then
            TriggerClientEvent('QBCore:Notify', source, "Ped cant use clothes !", "error")
        else
            QBCore.Functions.Notify("You are already doing something!", 'error')
        end
        return 
    end
    TriggerClientEvent('eraoutfits:client:switch', source, "mask", item)
    TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items[item.name], "remove")
    Player.Functions.RemoveItem(item.name, 1, item.slot)
end)

QBCore.Functions.CreateUseableItem("era_kevlar", function(source, item)
    local source = source
    local Player = QBCore.Functions.GetPlayer(source)
    local IsPed = GetPlayerGender(source)
    local progressActive = lib.callback.await('eraoutfits:IsProgressActive', source)
    if IsPed == "unknown" or progressActive then
        if IsPed == "unknown" then
            TriggerClientEvent('QBCore:Notify', source, "Ped cant use clothes !", "error")
        else
            QBCore.Functions.Notify("You are already doing something!", 'error')
        end
        return 
    end

    TriggerClientEvent('eraoutfits:client:switch', source, "kevlar", item)
    TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items[item.name], "remove")
    Player.Functions.RemoveItem(item.name, 1, item.slot)
end)

QBCore.Functions.CreateUseableItem("era_bracelet", function(source, item)
    local source = source
    local Player = QBCore.Functions.GetPlayer(source)
    local IsPed = GetPlayerGender(source)
    local progressActive = lib.callback.await('eraoutfits:IsProgressActive', source)
    if IsPed == "unknown" or progressActive then
        if IsPed == "unknown" then
            TriggerClientEvent('QBCore:Notify', source, "Ped cant use clothes !", "error")
        else
            QBCore.Functions.Notify("You are already doing something!", 'error')
        end
        return 
    end
    TriggerClientEvent('eraoutfits:client:switch', source, "bracelet", item)
    TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items[item.name], "remove")
    Player.Functions.RemoveItem(item.name, 1, item.slot)
end)

QBCore.Functions.CreateUseableItem("era_shoes", function(source, item)
    local source = source
    local Player = QBCore.Functions.GetPlayer(source)
    local IsPed = GetPlayerGender(source)
    local progressActive = lib.callback.await('eraoutfits:IsProgressActive', source)
    if IsPed == "unknown" or progressActive then
        if IsPed == "unknown" then
            TriggerClientEvent('QBCore:Notify', source, "Ped cant use clothes !", "error")
        else
            QBCore.Functions.Notify("You are already doing something!", 'error')
        end
        return 
    end

    TriggerClientEvent('eraoutfits:client:switch', source, "shoes", item)
    TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items[item.name], "remove")
    Player.Functions.RemoveItem(item.name, 1, item.slot)
end)

QBCore.Functions.CreateUseableItem("era_decal", function(source, item)
    local source = source
    local Player = QBCore.Functions.GetPlayer(source)
    local IsPed = GetPlayerGender(source)
    local progressActive = lib.callback.await('eraoutfits:IsProgressActive', source)
    if IsPed == "unknown" or progressActive then
        if IsPed == "unknown" then
            TriggerClientEvent('QBCore:Notify', source, "Ped cant use clothes !", "error")
        else
            QBCore.Functions.Notify("You are already doing something!", 'error')
        end
        return 
    end

    TriggerClientEvent('eraoutfits:client:switch', source, "decals", item)
    TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items[item.name], "remove")
    Player.Functions.RemoveItem(item.name, 1, item.slot)
end)

QBCore.Functions.CreateUseableItem("era_glasses", function(source, item)
    local source = source
    local Player = QBCore.Functions.GetPlayer(source)
    local IsPed = GetPlayerGender(source)
    local progressActive = lib.callback.await('eraoutfits:IsProgressActive', source)

    if IsPed == "unknown" or progressActive then
        if IsPed == "unknown" then
            TriggerClientEvent('QBCore:Notify', source, "Ped cant use clothes !", "error")
        else
            QBCore.Functions.Notify("You are already doing something!", 'error')
        end
        return 
    end

    TriggerClientEvent('eraoutfits:client:switch', source, "glasses", item)
    TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items[item.name], "remove")
    Player.Functions.RemoveItem(item.name, 1, item.slot)
end)

QBCore.Functions.CreateUseableItem("era_watch", function(source, item)
    local source = source
    local Player = QBCore.Functions.GetPlayer(source)
    local IsPed = GetPlayerGender(source)
    local progressActive = lib.callback.await('eraoutfits:IsProgressActive', source)
    if IsPed == "unknown" or progressActive then
        if IsPed == "unknown" then
            TriggerClientEvent('QBCore:Notify', source, "Ped cant use clothes !", "error")
        else
            QBCore.Functions.Notify("You are already doing something!", 'error')
        end
        return 
    end
    TriggerClientEvent('eraoutfits:client:switch', source, "watch", item)
    TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items[item.name], "remove")
    Player.Functions.RemoveItem(item.name, 1, item.slot)
end)

QBCore.Functions.CreateUseableItem("era_para", function(source, item)
    local source = source
    local Player = QBCore.Functions.GetPlayer(source)
    local IsPed = GetPlayerGender(source)
    local progressActive = lib.callback.await('eraoutfits:IsProgressActive', source)

    if IsPed == "unknown" or progressActive then
        if IsPed == "unknown" then
            TriggerClientEvent('QBCore:Notify', source, "Ped cant use clothes !", "error")
        else
            QBCore.Functions.Notify("You are already doing something!", 'error')
        end
        return 
    end
    
    TriggerClientEvent('eraoutfits:client:switch', source, "bags", item)
    TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items[item.name], "remove")
    Player.Functions.RemoveItem(item.name, 1, item.slot)
end)

QBCore.Functions.CreateUseableItem("era_hat", function(source, item)
    local source = source
    local Player = QBCore.Functions.GetPlayer(source)
    local IsPed = GetPlayerGender(source)
    local progressActive = lib.callback.await('eraoutfits:IsProgressActive', source)
    if IsPed == "unknown" or progressActive then
        if IsPed == "unknown" then
            TriggerClientEvent('QBCore:Notify', source, "Ped cant use clothes !", "error")
        else
            QBCore.Functions.Notify("You are already doing something!", 'error')
        end
        return 
    end

    TriggerClientEvent('eraoutfits:client:switch', source, "hat", item)
    TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items[item.name], "remove")
    Player.Functions.RemoveItem(item.name, 1, item.slot)
end)

QBCore.Functions.CreateUseableItem("era_ears", function(source, item)
    local source = source
    local Player = QBCore.Functions.GetPlayer(source)
    local progressActive = lib.callback.await('eraoutfits:IsProgressActive', source)

    if IsPed == "unknown" or progressActive then
        if IsPed == "unknown" then
            TriggerClientEvent('QBCore:Notify', source, "Ped cant use clothes !", "error")
        else
            QBCore.Functions.Notify("You are already doing something!", 'error')
        end
        return 
    end
    TriggerClientEvent('eraoutfits:client:switch', source, "ears", item)
    TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items[item.name], "remove")
    Player.Functions.RemoveItem(item.name, 1, item.slot)
end)

QBCore.Functions.CreateUseableItem("era_outfit", function(source, item)
    local source = source
    local Player = QBCore.Functions.GetPlayer(source)
    local progressActive = lib.callback.await('eraoutfits:IsProgressActive', source)

    if IsPed == "unknown" or progressActive then
        if IsPed == "unknown" then
            TriggerClientEvent('QBCore:Notify', source, "Ped cant use clothes !", "error")
        else
            QBCore.Functions.Notify("You are already doing something!", 'error')
        end
        return 
    end
    TriggerClientEvent('eraoutfits:client:switch', source, "outfit", item)
    TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items[item.name], "remove")
    Player.Functions.RemoveItem(item.name, 1, item.slot)
end)



RegisterNetEvent('eraoutfits:server:receiveclothes')
AddEventHandler('eraoutfits:server:receiveclothes', function(type, ID, Color)
    local Player = QBCore.Functions.GetPlayer(source)
    local info = {} 
    info.id = ID
    info.color = Color

    if type == "pant" then
        item = "era_pants"
    elseif type == "chains" then
        item = "era_chains"
    elseif type == "mask" then
        item = "era_mask"
    elseif type == "bags" then
        item = "era_para"
    elseif type == "shoes" then
        item = "era_shoes"
    elseif type == "decals" then
        item = "era_decal"
    elseif type == "kevlar" then
        item = "era_kevlar"
    elseif type == "watch" then
        item = "era_watch"
    elseif type == "bracelet" then
        item = "era_bracelet"
    elseif type == "glasses" then
        item = "era_glasses"
    elseif type == "hat" then
        item = "era_hat"
    elseif type == "ears" then
        item = "era_ears"
    end
    if item then
        Player.Functions.AddItem(item, 1, nil, info)
        TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items[item], "add")
    else 
        print("ERROR : NO ITEM FOUND")   
    end

end)
  
  
RegisterNetEvent('eraoutfits:server:receiveshirt')
AddEventHandler('eraoutfits:server:receiveshirt', function(topId, TopColor, shirtId, shirtColor, glovesId, glovesColor)
    local Player = QBCore.Functions.GetPlayer(source)
    local info = {}

    info.idtop = topId
    info.colortop = TopColor
    info.idshirt = shirtId
    info.colorshirt = shirtColor
    info.idgloves = glovesId
    info.colorgloves = glovesColor


        Player.Functions.AddItem('era_top', 1, nil, info)
        TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items["era_top"], "add")
    end)

    RegisterNetEvent('eraoutfits:server:receiveoutfit')
    AddEventHandler('eraoutfits:server:receiveoutfit', function(topDrawable, topTexture, underDrawable, underTexture, glovesDrawable, glovesTexture, kevlarDrawable, kevlarTexture, shoesDrawable, shoesTexture, chainsDrawable, chainsTexture, decalsDrawable, decalsTexture, maskDrawable, maskTexture, pantsDrawable, pantsTexture, bagsDrawable, bagsTexture)
        local Player = QBCore.Functions.GetPlayer(source)
        local info = {}
    
        info.idtop = topDrawable
        info.colortop = topTexture
        info.idshirt = underDrawable
        info.colorshirt = underTexture
        info.idgloves = glovesDrawable
        info.colorgloves = glovesTexture -- Top
        info.idkevlar = kevlarDrawable 
        info.colorkevlar = kevlarTexture --Kevlar 
        info.idshoes = shoesDrawable 
        info.colorshoes = shoesTexture --Shoes
        info.idchains = chainsDrawable 
        info.colorchains = chainsTexture --Chains
        info.iddecal = decalsDrawable 
        info.colordecal = decalsTexture --Decals
        info.idmask = maskDrawable 
        info.colormask = maskTexture --Mask
        info.idpants = pantsDrawable 
        info.colorpants = pantsTexture --Pants
        info.idbags = bagsDrawable 
        info.colorbags = bagsTexture --Bags

    
    
            Player.Functions.AddItem('era_outfit', 1, nil, info)
            TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items["era_outfit"], "add")
        end)
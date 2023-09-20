local QBCore = exports['qb-core']:GetCoreObject()
local ItemData = {}


    local clothslot = {
        "kevlar",
        "shoes",
        "chains",
        "decals",
        "mask",
        "pant",
        "bags",
    }

    function IsCloth(type)
        for clothType = 1, #clothslot do
            if clothslot[clothType] == type then
                return true
            end
        end

        return false
    end

    local propslot = {
        "hat",
        "bracelet",
        "watch",
        "glasses",
        "ears",
    }
    
    function IsProps(type)
        for propType = 1, #propslot do
            if propslot[propType] == type then
                return true
            end
        end

        return false
    end

    local ClothSlots = {
        ["kevlar"] = 9,
        ["shoes"] = 6,
        ["chains"] = 7,
        ["decals"] = 10,
        ["mask"] = 1,
        ["pant"] = 4,
        ["bags"] = 5,
        ["shirt"] = 8,
        ["top"] = 11,
        ["gloves"] = 3
    }

    function GetClothSlot(clothType)
        return ClothSlots[clothType]
    end

    local PropSlots = {
        ["hat"] = 0,
        ["bracelet"] = 7,
        ["watch"] = 6,
        ["glasses"] = 1,
        ["ears"] = 2
    }

    function GetPropSlot(clothType)
        return PropSlots[clothType]
    end

    function GetClothID(type)
        local slot = GetClothSlot(type)
        local playerPed = PlayerPedId()

        if type == "outfit" then
        return
        end
        if slot then
            local id  = GetPedDrawableVariation(playerPed, slot)
            return id
        else
            print("(Cloth) Missing id for " .. type .. " , error")
        end
    end

    function GetClothColor(type)
        local slot = GetClothSlot(type)
        local playerPed = PlayerPedId()

        if type == "outfit" then
        return
        end
        if slot then
            local color = GetPedTextureVariation(playerPed, slot)
            return color
        else
            print("(Cloth) Missing color for " .. type .. " , error")
        end
    end

    function GetPropsID(type)
        local slot = GetPropSlot(type)
        local playerPed = PlayerPedId()

        if slot then
            local id  = GetPedPropIndex(playerPed, slot)
            return id
        else
            print("(Props) Missing id for " .. type .. " , error")
        end
    end

    function GetPropsColor(type)
        local slot = GetPropSlot(type)
        local playerPed = PlayerPedId()

        if slot then
            local color = GetPedPropTextureIndex(playerPed, slot)
            return color
        else
            print("(Props) Missing color for " .. type .. " , error")
        end
    end



    function GetSwitchAnim(type) --By the type of clothing, launch a different animation
        if type == "mask" or type == "hat" then
            return {
                dict = 'misscommon@std_take_off_masks',
                clip = 'take_off_mask_ps'
            }
        elseif type == "glasses" then
            return {
                dict = 'clothingspecs',
                clip = 'take_off'
            }
         elseif type == "outfit" then
                 return {
                     dict = 'mp_safehouseshower@male@',
                     clip = 'male_shower_idle_c'
             }
        else
            return {
                dict = 'clothingtie',
                clip = 'try_tie_positive_a'
            }
        end
    end

    function GetSwitchTime(type)
        if type == "mask" or type == "chains" or type == "glasses" or type == "hat" then
            return math.random(400, 700)
        elseif type == "outfit" then
                return math.random(6000, 8000)
        else
            return math.random(500, 800)
        end
    end

    function GetPlayerGender()
    
            local playerPed = PlayerPedId()
            local genderHash = GetEntityModel(playerPed)

        if genderHash == GetHashKey("mp_f_freemode_01") then
                return "female"
            elseif genderHash == GetHashKey("mp_m_freemode_01") then
                return "male"
            else
                return "unknown" --  not working for ped models, support for our non binary friends i guess
            end
    end

    function SetPlayerInUnderwear(type)
        local playerPed = PlayerPedId()
        local playerGender = GetPlayerGender(source)
        local usedAnim = GetSwitchAnim(type)
        local SwitchTime = GetSwitchTime(type)
        local id = GetClothID(type)
        local color = GetClothColor(type)
        local slot = GetClothSlot(type)

        if lib.progressActive() then
            QBCore.Functions.Notify("You are already doing something!", 'error')
        else
            if playerGender == "unknown" then
                QBCore.Functions.Notify("Peds can't remove clothes!", 'success')
                return
            end
        

        if lib.progressCircle({
                duration = SwitchTime,
                position = 'center',
                useWhileDead = false,
                canCancel = true,
                disable = {
                    car = true,
                },
                anim = usedAnim,
            }) then
                if type == "pant" then
                    TriggerServerEvent('eraoutfits:server:receiveclothes', type, id, color)

                    if playerGender == "female" then
                        SetPedComponentVariation(playerPed, 4, 15, 0, 0)
                    elseif playerGender == "male" then
                        SetPedComponentVariation(playerPed, 4, 61, 0, 0)
                    end
                    QBCore.Functions.Notify("Removed !", 'success')
                    TriggerEvent('eraoutfits:client:syncClothes')
                elseif type == "shirt" then
                    local topDrawable = GetPedDrawableVariation(playerPed, GetClothSlot("top"))
                    local topTexture = GetPedTextureVariation(playerPed, GetClothSlot("top"))
                    local underDrawable = GetPedDrawableVariation(playerPed, GetClothSlot("shirt"))
                    local underTexture = GetPedTextureVariation(playerPed, GetClothSlot("shirt"))
                    local glovesDrawable = GetPedDrawableVariation(playerPed, GetClothSlot("gloves"))
                    local glovesTexture = GetPedTextureVariation(playerPed, GetClothSlot("gloves"))
        
    
                    TriggerServerEvent('eraoutfits:server:receiveshirt', topDrawable, topTexture, underDrawable, underTexture, glovesDrawable, glovesTexture)
    
                    if playerGender == "female" then
                        SetPedComponentVariation(playerPed, 11, 15, 0, 0)
                        SetPedComponentVariation(playerPed, 8, 10, 0, 0)
                        SetPedComponentVariation(playerPed, 3, 15, 0, 0)
                    elseif playerGender == "male" then 
                        SetPedComponentVariation(playerPed, 11, 15, 0, 0)
                        SetPedComponentVariation(playerPed, 8, 15, 0, 0)
                        SetPedComponentVariation(playerPed, 3, 15, 0, 0)
                    end
                    QBCore.Functions.Notify("Removed !", 'success')
                    TriggerEvent('eraoutfits:client:syncClothes')
                elseif type == "shoes" then
    
                    TriggerServerEvent('eraoutfits:server:receiveclothes', type, id, color)
    
                    if playerGender == "female" then
                        SetPedComponentVariation(playerPed, 6, 35, 0, 0)
                    elseif playerGender == "male" then
                        SetPedComponentVariation(playerPed, 6, 34, 0, 0)
                    end
                    QBCore.Functions.Notify("Removed !", 'success')
                    TriggerEvent('eraoutfits:client:syncClothes')
                elseif type == "chains" or type == "mask" or type == "bags" or type == "decals" or type == "kevlar" then
                    TriggerServerEvent('eraoutfits:server:receiveclothes', type, id, color)
    
                    SetPedComponentVariation(playerPed, slot, 0, 0, 0)
                    QBCore.Functions.Notify("Removed !", 'success')
                    TriggerEvent('eraoutfits:client:syncClothes')
                elseif type == "outfit" then
                    local topDrawable = GetPedDrawableVariation(playerPed, GetClothSlot("top"))
                    local topTexture = GetPedTextureVariation(playerPed, GetClothSlot("top"))
                    local underDrawable = GetPedDrawableVariation(playerPed, GetClothSlot("shirt"))
                    local underTexture = GetPedTextureVariation(playerPed, GetClothSlot("shirt"))
                    local glovesDrawable = GetPedDrawableVariation(playerPed, GetClothSlot("gloves"))
                    local glovesTexture = GetPedTextureVariation(playerPed, GetClothSlot("gloves"))

                    local pantsDrawable = GetPedDrawableVariation(playerPed, GetClothSlot("pant"))
                    local pantsTexture = GetPedTextureVariation(playerPed, GetClothSlot("pant"))
    
                    local bagsDrawable = GetPedDrawableVariation(playerPed, GetClothSlot("bags"))
                    local bagsTexture = GetPedTextureVariation(playerPed, GetClothSlot("bags"))

                    local kevlarDrawable = GetPedDrawableVariation(playerPed, GetClothSlot("kevlar"))
                    local kevlarTexture = GetPedTextureVariation(playerPed, GetClothSlot("kevlar"))

                    local shoesDrawable = GetPedDrawableVariation(playerPed, GetClothSlot("shoes"))
                    local shoesTexture = GetPedTextureVariation(playerPed, GetClothSlot("shoes"))

                    local chainsDrawable = GetPedDrawableVariation(playerPed, GetClothSlot("chains"))
                    local chainsTexture = GetPedTextureVariation(playerPed, GetClothSlot("chains"))

                    local decalsDrawable = GetPedDrawableVariation(playerPed, GetClothSlot("decals"))
                    local decalsTexture = GetPedTextureVariation(playerPed, GetClothSlot("decals"))

                    local maskDrawable = GetPedDrawableVariation(playerPed, GetClothSlot("mask"))
                    local maskTexture = GetPedTextureVariation(playerPed, GetClothSlot("mask"))


                    TriggerServerEvent('eraoutfits:server:receiveoutfit', topDrawable, topTexture, underDrawable, underTexture, glovesDrawable, glovesTexture, kevlarDrawable, kevlarTexture, shoesDrawable, shoesTexture, chainsDrawable, chainsTexture, decalsDrawable, decalsTexture, maskDrawable, maskTexture, pantsDrawable, pantsTexture, bagsDrawable, bagsTexture)
    
                    if playerGender == "female" then
                        SetPedComponentVariation(playerPed, 11, 15, 0, 0)
                        SetPedComponentVariation(playerPed, 8, 10, 0, 0)
                        SetPedComponentVariation(playerPed, 3, 15, 0, 0)

                        SetPedComponentVariation(playerPed, 4, 15, 0, 0) -- Pants
                        SetPedComponentVariation(playerPed, 6, 35, 0, 0) -- Shoes

                    elseif playerGender == "male" then 
                        SetPedComponentVariation(playerPed, 11, 15, 0, 0)
                        SetPedComponentVariation(playerPed, 8, 15, 0, 0)
                        SetPedComponentVariation(playerPed, 3, 15, 0, 0)

                        SetPedComponentVariation(playerPed, 4, 61, 0, 0) -- Pants
                        SetPedComponentVariation(playerPed, 6, 34, 0, 0) -- Shoes
                    end

                    SetPedComponentVariation(playerPed, GetClothSlot("chains"), 0, 0, 0)
                    SetPedComponentVariation(playerPed, GetClothSlot("kevlar"), 0, 0, 0)
                    SetPedComponentVariation(playerPed, GetClothSlot("bags"), 0, 0, 0)
                    SetPedComponentVariation(playerPed, GetClothSlot("decals"), 0, 0, 0)
                    SetPedComponentVariation(playerPed, GetClothSlot("mask"), 0, 0, 0)

                    QBCore.Functions.Notify("Removed !", 'success')
                    TriggerEvent('eraoutfits:client:syncClothes')
                else
                    QBCore.Functions.Notify("Cancelled.", 'error')
                end
            end
        end
    end

    function RemoveAll(class)
        local playerPed = PlayerPedId()
        local playerGender = GetPlayerGender(source)

        if lib.progressActive() then
            QBCore.Functions.Notify("You are already doing something!", 'error')
        else
            if playerGender == "unknown" then
                QBCore.Functions.Notify("Peds can't remove clothes!", 'success')
                return
            end
                if class == "all" then
                    if IsPlayerInUnderwear("pant") == false then
                        SetPlayerInUnderwear("pant")
                    end
                    if IsPlayerInUnderwear("shirt") == false then
                        SetPlayerInUnderwear("shirt")
                    end
                    if IsPlayerInUnderwear("kevlar") == false then
                        SetPlayerInUnderwear("kevlar")
                    end
                    if IsPlayerInUnderwear("shoes") == false then
                        SetPlayerInUnderwear("shoes")
                    end
                    if IsPlayerInUnderwear("chains") == false then
                        SetPlayerInUnderwear("chains")
                    end
                    if IsPlayerInUnderwear("decals") == false then
                        SetPlayerInUnderwear("decals")
                    end
                    if IsPlayerInUnderwear("mask") == false then
                        SetPlayerInUnderwear("mask")
                    end
                    if IsPlayerInUnderwear("bags") == false then
                        SetPlayerInUnderwear("bags")
                    end
                elseif class == "outfit" then
                    SetPlayerInUnderwear("outfit")
                end
            end
    end
    function IsPlayerInUnderwear(type)
        local playerPed = PlayerPedId()
        local playerGender = GetPlayerGender(source)
        local slot = GetClothSlot(type)
    
        if type == "pant" then
            local pantDrawable = GetPedDrawableVariation(playerPed, 4)
            local pantTexture = GetPedTextureVariation(playerPed, 4)
    
            if playerGender == "female" then
                if pantDrawable == 15 and pantTexture == 0 then
                    return true
                else
                    return false
                end
            elseif playerGender == "male" then
                if pantDrawable == 61 and pantTexture == 0 then
                    return true
                else
                    return false
                end
            end
        elseif type == "shoes" then
            local shoesDrawable = GetPedDrawableVariation(playerPed, 6)
            local shoesTexture = GetPedTextureVariation(playerPed, 6)
    
            if playerGender == "female" then
                if shoesDrawable == 35 and shoesTexture == 0 then
                    return true
                else
                    return false
                end
            elseif playerGender == "male" then
                if shoesDrawable == 34 and shoesTexture == 0 then
                    return true
                else
                    return false
                end
            end
        elseif type == "shirt" then
            local topDrawable = GetPedDrawableVariation(playerPed, GetClothSlot("top"))
            local topTexture = GetPedTextureVariation(playerPed, GetClothSlot("top"))
            local underDrawable = GetPedDrawableVariation(playerPed, GetClothSlot("shirt"))
            local underTexture = GetPedTextureVariation(playerPed, GetClothSlot("shirt"))
            local glovesDrawable = GetPedDrawableVariation(playerPed, GetClothSlot("gloves"))
            local glovesTexture = GetPedTextureVariation(playerPed, GetClothSlot("gloves"))
    
            if playerGender == "female" then
                if topDrawable == 15 and topTexture == 0 and underDrawable == 10 and underTexture == 0 and glovesDrawable == 15 and glovesTexture == 0 then
                    return true
                else
                    return false
                end
            elseif playerGender == "male" then
                if topDrawable == 15 and topTexture == 0 and underDrawable == 15 and underTexture == 0 and glovesDrawable == 15 and glovesTexture == 0 then
                    return true
                else
                    return false
                end
            end
        elseif type == "chains" or type == "mask" or type == "bags" or type == "decals" or type == "kevlar" then
            local clothing = GetPedDrawableVariation(playerPed, slot)
            if clothing == 0 then
                return true
            else
                return false
            end
        elseif type == "all" then
            if IsPlayerInUnderwear("pant") and IsPlayerInUnderwear("shirt") and IsPlayerInUnderwear("mask") and IsPlayerInUnderwear("chains") and IsPlayerInUnderwear("shoes") and IsPlayerInUnderwear("kevlar") and IsPlayerInUnderwear("decals") and IsPlayerInUnderwear("bags") then
                return true
            end
        end
        return false
    end
    

    function RemovePlayerProps(type)
            local source = source
            local playerPed = PlayerPedId()
            local playerGender = GetPlayerGender(source)
            local usedAnim = GetSwitchAnim(type)
            local SwitchTime = GetSwitchTime(type)
            local pslot = GetPropSlot(type)
            local Props = IsProps(type)
    
        if lib.progressActive() then
            QBCore.Functions.Notify("You are already doing something!", 'error')
        else
            if playerGender == "unknown" then
                    QBCore.Functions.Notify("Peds can't remove props!", 'success')
                    return
            end

            if lib.progressCircle({
                    duration = SwitchTime,
                    position = 'center',
                    useWhileDead = false,
                    canCancel = true,
                    disable = {
                        car = true,
                    },
                    anim = usedAnim,
                }) then

                if Props then    
                    local id = GetPedPropIndex(playerPed, pslot)
                    local color = GetPedPropTextureIndex(playerPed, pslot)
                        ClearPedProp(playerPed, pslot)
                        TriggerServerEvent('eraoutfits:server:receiveclothes', type, id, color)     
                else 
                    QBCore.Functions.Notify("You dont have : " .. type .. " on you !", 'success')
                end

                    QBCore.Functions.Notify("Removed !", 'success')
                    TriggerEvent('eraoutfits:client:syncClothes')
                end
            end
        end

    RegisterNetEvent('eraoutfits:client:switch')
    AddEventHandler('eraoutfits:client:switch', function(type, ItemData)
        local source = source
        local playerPed = PlayerPedId()
        local playerGender = GetPlayerGender(source)
        local usedAnim = GetSwitchAnim(type)
        local SwitchTime = GetSwitchTime(type)
        local Cloth = IsCloth(type)
        local Props = IsProps(type)

        if lib.progressActive() then
            QBCore.Functions.Notify("You are already doing something!", 'error')
        else
            if playerGender == "unknown" then
                QBCore.Functions.Notify("Peds can't put clothes!", 'success')
                return
            end

        if lib.progressCircle({
                duration = SwitchTime,
                position = 'center',
                useWhileDead = false,
                canCancel = true,
                disable = {
                    car = true,
                },
                anim = usedAnim,
            }) then
            
                if Cloth then
                    local slot = GetClothSlot(type)
                    local id = GetClothID(type)
                    local color = GetClothColor(type)

                    QBCore.Functions.Notify("Done !", 'success')
                    if IsPlayerInUnderwear(type) then
                        SetPedComponentVariation(playerPed, slot, ItemData.info.id, ItemData.info.color, 0)
                        TriggerEvent('eraoutfits:client:syncClothes')
                    else
                        TriggerServerEvent('eraoutfits:server:receiveclothes', type, id, color)
                        Citizen.Wait(500)
                        SetPedComponentVariation(playerPed, slot, ItemData.info.id, ItemData.info.color, 0)
                        TriggerEvent('eraoutfits:client:syncClothes')
                    end
                elseif Props then
                    local pslot = GetPropSlot(type)
                    local pid = GetPropsID(type)
                    local pcolor = GetPropsColor(type)

                    QBCore.Functions.Notify("Done !", 'success')

                if pid == -1 then
                        SetPedPropIndex(playerPed, pslot, ItemData.info.id, ItemData.info.color, true)
                        TriggerEvent('eraoutfits:client:syncClothes')
                    else
                        TriggerServerEvent('eraoutfits:server:receiveclothes', type, pid, color)
                        Citizen.Wait(500)
                        SetPedPropIndex(playerPed, pslot, ItemData.info.id, ItemData.info.color, true)
                        TriggerEvent('eraoutfits:client:syncClothes')
                end
            elseif type == "shirt" then
                local topDrawable = GetPedDrawableVariation(playerPed, GetClothSlot("top"))
                local topTexture = GetPedTextureVariation(playerPed, GetClothSlot("top"))
                local underDrawable = GetPedDrawableVariation(playerPed, GetClothSlot("shirt"))
                local underTexture = GetPedTextureVariation(playerPed, GetClothSlot("shirt"))
                local glovesDrawable = GetPedDrawableVariation(playerPed, GetClothSlot("gloves"))
                local glovesTexture = GetPedTextureVariation(playerPed, GetClothSlot("gloves"))
    
                QBCore.Functions.Notify("Done !", 'success')

                if IsPlayerInUnderwear("shirt") then
                    SetPedComponentVariation(playerPed, 11, ItemData.info.idtop, ItemData.info.colortop, 0)
                    SetPedComponentVariation(playerPed, 8, ItemData.info.idshirt, ItemData.info.colorshirt, 0)
                    SetPedComponentVariation(playerPed, 3, ItemData.info.idgloves, ItemData.info.colorgloves, 0)
                    TriggerEvent('eraoutfits:client:syncClothes')
                else
                    TriggerServerEvent('eraoutfits:server:receiveshirt', topDrawable, topTexture, underDrawable, underTexture, glovesDrawable, glovesTexture)
                    Citizen.Wait(500)
                    SetPedComponentVariation(playerPed, 11, ItemData.info.idtop, ItemData.info.colortop, 0)
                    SetPedComponentVariation(playerPed, 8, ItemData.info.idshirt, ItemData.info.colorshirt, 0)
                    SetPedComponentVariation(playerPed, 3, ItemData.info.idgloves, ItemData.info.colorgloves, 0)
                    TriggerEvent('eraoutfits:client:syncClothes')
                end
            elseif type == "outfit" then
                local topDrawable = GetPedDrawableVariation(playerPed, GetClothSlot("top"))
                local topTexture = GetPedTextureVariation(playerPed, GetClothSlot("top"))
                local underDrawable = GetPedDrawableVariation(playerPed, GetClothSlot("shirt"))
                local underTexture = GetPedTextureVariation(playerPed, GetClothSlot("shirt"))
                local glovesDrawable = GetPedDrawableVariation(playerPed, GetClothSlot("gloves"))
                local glovesTexture = GetPedTextureVariation(playerPed, GetClothSlot("gloves"))--
                local pantsDrawable = GetPedDrawableVariation(playerPed, GetClothSlot("pant"))
                local pantsTexture = GetPedTextureVariation(playerPed, GetClothSlot("pant"))
                local bagsDrawable = GetPedDrawableVariation(playerPed, GetClothSlot("bags"))
                local bagsTexture = GetPedTextureVariation(playerPed, GetClothSlot("bags"))
                local kevlarDrawable = GetPedDrawableVariation(playerPed, GetClothSlot("kevlar"))
                local kevlarTexture = GetPedTextureVariation(playerPed, GetClothSlot("kevlar"))
                local shoesDrawable = GetPedDrawableVariation(playerPed, GetClothSlot("shoes"))
                local shoesTexture = GetPedTextureVariation(playerPed, GetClothSlot("shoes"))
                local chainsDrawable = GetPedDrawableVariation(playerPed, GetClothSlot("chains"))
                local chainsTexture = GetPedTextureVariation(playerPed, GetClothSlot("chains"))
                local decalsDrawable = GetPedDrawableVariation(playerPed, GetClothSlot("decals"))
                local decalsTexture = GetPedTextureVariation(playerPed, GetClothSlot("decals"))
                local maskDrawable = GetPedDrawableVariation(playerPed, GetClothSlot("mask"))
                local maskTexture = GetPedTextureVariation(playerPed, GetClothSlot("mask"))
        
                    QBCore.Functions.Notify("Done !", 'success')
    
                    if IsPlayerInUnderwear("all") then
                        SetPedComponentVariation(playerPed, GetClothSlot("top"), ItemData.info.idtop, ItemData.info.colortop, 0)
                        SetPedComponentVariation(playerPed, GetClothSlot("shirt"), ItemData.info.idshirt, ItemData.info.colorshirt, 0)
                        SetPedComponentVariation(playerPed, GetClothSlot("gloves"), ItemData.info.idgloves, ItemData.info.colorgloves, 0)
                        SetPedComponentVariation(playerPed, GetClothSlot("pant"), ItemData.info.idpants, ItemData.info.colorpants, 0)
                        SetPedComponentVariation(playerPed, GetClothSlot("bags"), ItemData.info.idbags, ItemData.info.colorbags, 0)
                        SetPedComponentVariation(playerPed, GetClothSlot("kevlar"), ItemData.info.idkevlar, ItemData.info.colorkevlar, 0)
                        SetPedComponentVariation(playerPed, GetClothSlot("shoes"), ItemData.info.idshoes, ItemData.info.colorshoes, 0)
                        SetPedComponentVariation(playerPed, GetClothSlot("chains"), ItemData.info.idchains, ItemData.info.colorchains, 0)
                        SetPedComponentVariation(playerPed, GetClothSlot("decals"), ItemData.info.iddecal, ItemData.info.colordecal, 0)
                        SetPedComponentVariation(playerPed, GetClothSlot("mask"), ItemData.info.idmask, ItemData.info.colormask, 0)
                        TriggerEvent('eraoutfits:client:syncClothes')
                    else
                        TriggerServerEvent('eraoutfits:server:receiveoutfit', topDrawable, topTexture, underDrawable, underTexture, glovesDrawable, glovesTexture, kevlarDrawable, kevlarTexture, shoesDrawable, shoesTexture, chainsDrawable, chainsTexture, decalsDrawable, decalsTexture, maskDrawable, maskTexture, pantsDrawable, pantsTexture, bagsDrawable, bagsTexture)
                        Citizen.Wait(500)
                        SetPedComponentVariation(playerPed, GetClothSlot("top"), ItemData.info.idtop, ItemData.info.colortop, 0)
                        SetPedComponentVariation(playerPed, GetClothSlot("shirt"), ItemData.info.idshirt, ItemData.info.colorshirt, 0)
                        SetPedComponentVariation(playerPed, GetClothSlot("gloves"), ItemData.info.idgloves, ItemData.info.colorgloves, 0)
                        SetPedComponentVariation(playerPed, GetClothSlot("pant"), ItemData.info.idpants, ItemData.info.colorpants, 0)
                        SetPedComponentVariation(playerPed, GetClothSlot("bags"), ItemData.info.idbags, ItemData.info.colorbags, 0)
                        SetPedComponentVariation(playerPed, GetClothSlot("kevlar"), ItemData.info.idkevlar, ItemData.info.colorkevlar, 0)
                        SetPedComponentVariation(playerPed, GetClothSlot("shoes"), ItemData.info.idshoes, ItemData.info.colorshoes, 0)
                        SetPedComponentVariation(playerPed, GetClothSlot("chains"), ItemData.info.idchains, ItemData.info.colorchains, 0)
                        SetPedComponentVariation(playerPed, GetClothSlot("decals"), ItemData.info.iddecal, ItemData.info.colordecal, 0)
                        SetPedComponentVariation(playerPed, GetClothSlot("mask"), ItemData.info.idmask, ItemData.info.colormask, 0)
                        TriggerEvent('eraoutfits:client:syncClothes')
                    end
                else
                    QBCore.Functions.Notify("Cancelled.", 'error')
                end
            end
        end
    end)




--Removing Clothes events (Use with qb-radialmenu or any menu of your choice)

    RegisterNetEvent('eraoutfits:client:pant')
    AddEventHandler('eraoutfits:client:pant', function()
        local playerGender = GetPlayerGender()
    
        if lib.progressActive() then
            QBCore.Functions.Notify("You are already doing something!", 'error')
        elseif playerGender == "unknown" then
            QBCore.Functions.Notify("Peds can't remove clothes!", 'success')
        elseif IsPlayerInUnderwear("pant") then
            QBCore.Functions.Notify("You've already removed it.", 'error')
        else
            SetPlayerInUnderwear("pant")
        end
    end)

    RegisterNetEvent('eraoutfits:client:shirt')
    AddEventHandler('eraoutfits:client:shirt', function()
        local playerGender = GetPlayerGender()
    
        if lib.progressActive() then
            QBCore.Functions.Notify("You are already doing something!", 'error')
        elseif playerGender == "unknown" then
            QBCore.Functions.Notify("Peds can't remove clothes!", 'success')
        elseif IsPlayerInUnderwear("shirt") then
            QBCore.Functions.Notify("You've already removed it.", 'error')
        else
            SetPlayerInUnderwear("shirt")
        end
    end)

    RegisterNetEvent('eraoutfits:client:chains')
    AddEventHandler('eraoutfits:client:chains', function()
        local playerGender = GetPlayerGender()
    
        if lib.progressActive() then
            QBCore.Functions.Notify("You are already doing something!", 'error')
        elseif playerGender == "unknown" then
            QBCore.Functions.Notify("Peds can't remove clothes!", 'success')
        elseif IsPlayerInUnderwear("chains") then
            QBCore.Functions.Notify("You've already removed it.", 'error')
        else
            SetPlayerInUnderwear("chains")
        end
    end)

    RegisterNetEvent('eraoutfits:client:shoes')
    AddEventHandler('eraoutfits:client:shoes', function()
        local playerGender = GetPlayerGender()
    
        if lib.progressActive() then
            QBCore.Functions.Notify("You are already doing something!", 'error')
        elseif playerGender == "unknown" then
            QBCore.Functions.Notify("Peds can't remove clothes!", 'success')
        elseif IsPlayerInUnderwear("shoes") then
            QBCore.Functions.Notify("You've already removed it.", 'error')
        else
            SetPlayerInUnderwear("shoes")
        end
    end)

    RegisterNetEvent('eraoutfits:client:mask')
    AddEventHandler('eraoutfits:client:mask', function()
        local playerGender = GetPlayerGender()
    
        if lib.progressActive() then
            QBCore.Functions.Notify("You are already doing something!", 'error')
        elseif playerGender == "unknown" then
            QBCore.Functions.Notify("Peds can't remove clothes!", 'success')
        elseif IsPlayerInUnderwear("mask") then
            QBCore.Functions.Notify("You've already removed it.", 'error')
        else
            SetPlayerInUnderwear("mask")
        end
    end)

    RegisterNetEvent('eraoutfits:client:decals')
    AddEventHandler('eraoutfits:client:decals', function()
        local playerGender = GetPlayerGender()
    
        if lib.progressActive() then
            QBCore.Functions.Notify("You are already doing something!", 'error')
        elseif playerGender == "unknown" then
            QBCore.Functions.Notify("Peds can't remove clothes!", 'success')
        elseif IsPlayerInUnderwear("decals") then
            QBCore.Functions.Notify("You've already removed it.", 'error')
        else
            SetPlayerInUnderwear("decals")
        end
    end)

 
    RegisterNetEvent('eraoutfits:client:bags')
    AddEventHandler('eraoutfits:client:bags', function()
        local playerGender = GetPlayerGender()
    
        if lib.progressActive() then
            QBCore.Functions.Notify("You are already doing something!", 'error')
        elseif playerGender == "unknown" then
            QBCore.Functions.Notify("Peds can't remove clothes!", 'success')
        elseif IsPlayerInUnderwear("bags") then
            QBCore.Functions.Notify("You've already removed it.", 'error')
        else
            SetPlayerInUnderwear("bags")
        end
    end)   

    RegisterNetEvent('eraoutfits:client:kevlar')
    AddEventHandler('eraoutfits:client:kevlar', function()
        local playerGender = GetPlayerGender()
    
        if lib.progressActive() then
            QBCore.Functions.Notify("You are already doing something!", 'error')
        elseif playerGender == "unknown" then
            QBCore.Functions.Notify("Peds can't remove clothes!", 'success')
        elseif IsPlayerInUnderwear("kevlar") then
            QBCore.Functions.Notify("You've already removed it.", 'error')
        else
            SetPlayerInUnderwear("kevlar")
        end
    end)

    RegisterNetEvent('eraoutfits:client:glasses')
    AddEventHandler('eraoutfits:client:glasses', function()
        local playerPed = PlayerPedId()
        local glassesID = GetPedPropIndex(playerPed, 1)
        local playerGender = GetPlayerGender()
    
        if lib.progressActive() then
            QBCore.Functions.Notify("You are already doing something!", 'error')
        elseif playerGender == "unknown" then
            QBCore.Functions.Notify("Peds can't remove clothes!", 'success')
        elseif glassesID == -1  then
            QBCore.Functions.Notify("You're not wearing glasses !", 'error')
        else
            RemovePlayerProps("glasses")
        end
    end)

    RegisterNetEvent('eraoutfits:client:watch')
    AddEventHandler('eraoutfits:client:watch', function()
        local playerPed = PlayerPedId()
        local watchID = GetPedPropIndex(playerPed, 6)
 
        local playerGender = GetPlayerGender()
    
        if lib.progressActive() then
            QBCore.Functions.Notify("You are already doing something!", 'error')
        elseif playerGender == "unknown" then
            QBCore.Functions.Notify("Peds can't remove clothes!", 'success')
        elseif watchID == -1  then
            QBCore.Functions.Notify("You're not wearing any watch !", 'error')
        else
            RemovePlayerProps("watch")
        end
    end)

    RegisterNetEvent('eraoutfits:client:bracelet')
    AddEventHandler('eraoutfits:client:bracelet', function()
        local playerPed = PlayerPedId()
        local braceletID = GetPedPropIndex(playerPed, 7) 
        local playerGender = GetPlayerGender()
    
        if lib.progressActive() then
            QBCore.Functions.Notify("You are already doing something!", 'error')
        elseif playerGender == "unknown" then
            QBCore.Functions.Notify("Peds can't remove clothes!", 'success')
        elseif braceletID == -1  then
            QBCore.Functions.Notify("You're not wearing any bracelet !", 'error')
        else
            RemovePlayerProps("bracelet")
        end
    end)

    RegisterNetEvent('eraoutfits:client:hat')
    AddEventHandler('eraoutfits:client:hat', function()
        local playerPed = PlayerPedId()
        local hatID = GetPedPropIndex(playerPed, 1) 
        local playerGender = GetPlayerGender()
    
        if lib.progressActive() then
            QBCore.Functions.Notify("You are already doing something!", 'error')
        elseif playerGender == "unknown" then
            QBCore.Functions.Notify("Peds can't remove clothes!", 'success')
        elseif hatID == -1  then
            QBCore.Functions.Notify("You're not wearing any hat !", 'error')
        else
            RemovePlayerProps("hat")
        end
    end)
    

    RegisterNetEvent('eraoutfits:client:ears')
    AddEventHandler('eraoutfits:client:ears', function()
        local playerPed = PlayerPedId()
        local playerGender = GetPlayerGender() 
        local earsID = GetPedPropIndex(playerPed, 2) 

        if lib.progressActive() then
            QBCore.Functions.Notify("You are already doing something!", 'error')
        elseif playerGender == "unknown" then
            QBCore.Functions.Notify("Peds can't remove clothes!", 'success')
        elseif earsID == -1  then
            QBCore.Functions.Notify("You're not wearing any ears accessories !", 'error')
        else
            RemovePlayerProps("ears")
        end
    end)
    
    RegisterNetEvent('eraoutfits:client:makeoutfit')
    AddEventHandler('eraoutfits:client:makeoutfit', function()
        RemoveAll("outfit")
    end)

    RegisterNetEvent('eraoutfits:client:removeall')
    AddEventHandler('eraoutfits:client:removeall', function()
        RemoveAll("all")
    end)

    lib.callback.register('eraoutfits:IsProgressActive', function()
        local progressActive = lib.progressActive()        
        return progressActive
    end)

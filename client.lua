local weapons = {}
local playerWeapons = {}
local NewWeapons = {}

function onWeaponGive(playerPed, weaponHash,name)
    NewWeapons[name] = true
end

function onWeaponRemoved(playerPed, weaponHash)
end

Citizen.CreateThread(function()
    esxweapons = ESX.GetConfig().Weapons
    for _, weapon in ipairs(esxweapons) do
        table.insert(weapons,weapon)
    end
end)

Citizen.CreateThread(function()
    while true do
        local playerPed = PlayerPedId()
        for k, v in ipairs(weapons) do
            local weaponHash = GetHashKey(v.name)
            if HasPedGotWeapon(playerPed, weaponHash, false) then
                if not playerWeapons[weaponHash] then
                    onWeaponGive(playerPed, weaponHash,v.name)
                    playerWeapons[weaponHash] = true  
                end
            else
                if playerWeapons[weaponHash] then
                    onWeaponRemoved(playerPed, weaponHash)
                    playerWeapons[weaponHash] = nil  
                end
            end
        end
        Citizen.Wait(60000) 
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(5000) 
        if next(NewWeapons) then
            TriggerServerEvent("Saq:CheckWeapons",NewWeapons)
            NewWeapons = {}
        end
        Citizen.Wait(60000) 
    end
end)
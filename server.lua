RegisterServerEvent("Saq:CheckWeapons")
AddEventHandler("Saq:CheckWeapons", function(newWeapons)
    local playerId = source  
    local xPlayer = ESX.GetPlayerFromId(playerId)  

    if xPlayer then
        for weaponName, _ in pairs(newWeapons) do
            xPlayer.hasWeapon(weaponName, function(hasWeapon) -- checks if have the weapon
                if not hasWeapon then -- if he does not have one of them he will get kicked
                    xPlayer.kick("Stop Hacking Little Bitch 💦")
                    return  
                end
            end)
        end
    end
end)

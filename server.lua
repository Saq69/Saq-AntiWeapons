RegisterServerEvent("Saq:CheckWeapons")
AddEventHandler("Saq:CheckWeapons", function(newWeapons)
    local playerId = source  
    local xPlayer = ESX.GetPlayerFromId(playerId)  

    if xPlayer then
        for weaponName, _ in pairs(newWeapons) do
            xPlayer.hasWeapon(weaponName, function(hasWeapon)
                if not hasWeapon then
                    print(playerId .. " does NOT have the weapon: " .. weaponName .. " - Kicking for hacking.")
                    return  
                else
                end
            end)
        end
    else
        print("Player not found with ID: " .. playerId)
    end
end)

RegisterServerEvent("Saq:CheckWeapons")
AddEventHandler("Saq:CheckWeapons", function(newWeapons)
    local playerId = source  
    local xPlayer = ESX.GetPlayerFromId(playerId)  

    if xPlayer then
        for weaponName, _ in pairs(newWeapons) do
            if not xPlayer.hasWeapon(weaponName) then
                xPlayer.kick("Get lost, you pathetic little hacking rat 💦💩")
                local discordEmbed = {
                    {
                        ["title"] = "رسبنة اسلحة",
                        ["type"] = "rich",
                        ["color"] = 16766720,
                        ["fields"] = {
                            { ["name"] = "اسم اللاعب", ["value"] = xPlayer.getName(), ["inline"] = true },
                            { ["name"] = "id", ["value"] = xPlayer.identifier, ["inline"] = true }
                        }
                    }
                }
            
                local webhookURL = ""
                local data = json.encode({ embeds = discordEmbed })
            
                PerformHttpRequest(webhookURL, function(statusCode)
                end, "POST", data, headers)
                return  
            end
        end
    end
end)

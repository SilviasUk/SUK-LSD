local QBCore = exports['qb-core']:GetCoreObject()

QBCore.Functions.CreateUseableItem("lsd1", function(source, _)
    TriggerClientEvent("consumables:client:lsdtab1", source)
end)

RegisterNetEvent('consumables:server:useLSD1', function()
    local Player = QBCore.Functions.GetPlayer(source)

    if not Player then return end

    Player.Functions.RemoveItem('lsd1', 1)
end)

QBCore.Functions.CreateUseableItem("lsd2", function(source, _)
    TriggerClientEvent("consumables:client:lsdtab2", source)
end)

RegisterNetEvent('consumables:server:useLSD2', function()
    local Player = QBCore.Functions.GetPlayer(source)

    if not Player then return end

    Player.Functions.RemoveItem('lsd2', 1)
end)

QBCore.Functions.CreateUseableItem("lsd3", function(source, _)
    TriggerClientEvent("consumables:client:lsdtab3", source)
end)

RegisterNetEvent('consumables:server:useLSD3', function()
    local Player = QBCore.Functions.GetPlayer(source)

    if not Player then return end

    Player.Functions.RemoveItem('lsd3', 1)
end)
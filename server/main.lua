local BJCore = exports['core']:GetCoreObject()
local MoneyType = Config.MoneyType
local src = source
local xPlayer = BJCore.Functions.GetPlayer(src)


RegisterNetEvent('kuf-carheist:getPetReward', function()
    local src = source
    local Player = BJCore.Functions.GetPlayer(src)
    local payment = Config.TierPetReward
    Player.Functions.AddMoney(MoneyType, payment)
end)

RegisterNetEvent('kuf-carheist:GiveTierAPrice', function()
    local src = source
    local Player = BJCore.Functions.GetPlayer(src)
    local payment = Config.TierAPrice

    Player.Functions.AddMoney(MoneyType, payment)
end)

RegisterNetEvent('kuf-carheist:GiveTierBPrice', function()
    local src = source
    local Player = BJCore.Functions.GetPlayer(src)
    local payment = Config.TierBPrice

    Player.Functions.AddMoney(MoneyType, payment)
end)

RegisterNetEvent('kuf-carheist:GiveTierCPrice', function()
    local src = source
    local Player = BJCore.Functions.GetPlayer(src)
    local payment = Config.TierCPrice

    Player.Functions.AddMoney(MoneyType, payment)
end)

RegisterNetEvent("kuf-carheist:getRewardA", function()
    local amount = Config.TierAReward
    local src = source
    local Player = BJCore.Functions.GetPlayer(src)
    Player.Functions.AddMoney(MoneyType, amount)
end)

RegisterNetEvent("kuf-carheist:getRewardB", function()
    local amount = Config.TierBReward
    local src = source
    local Player = BJCore.Functions.GetPlayer(src)
    Player.Functions.AddMoney(MoneyType, amount)
end)

RegisterNetEvent("kuf-carheist:getRewardC", function()
    local amount = Config.TierCReward
    local src = source
    local Player = BJCore.Functions.GetPlayer(src)
    Player.Functions.AddMoney(MoneyType, amount)
end)

RegisterNetEvent("kuf-carheist:GetScrapReward", function()
    local src = source
    local Player = BJCore.Functions.GetPlayer(src)
    local amount = Config.ScrapItemAmount
    local item = Config.ScrapItems[math.random(1, #Config.ScrapItems)]
    Player.Functions.AddItem(item, amount)
    TriggerClientEvent('inventory:client:ItemBox', src, BJCore.Shared.Items[item], 'add')
    if Config.GiveScrapMoney then
        local moneyamount = math.random(Config.ScrapMoneyLow, Config.ScrapMoneyMax)
        Player.Functions.AddMoney('cash', moneyamount)
    end
end)
local QBCore = exports['qb-core']:GetCoreObject()

QBCore.Functions.CreateCallback('ggwpx-aimedic:checkDoctorAvailability', function(source, cb)
    local src = source
    local player = QBCore.Functions.GetPlayer(src)
    local onlinePlayers = QBCore.Functions.GetPlayers()
    local medicCount = 0
    local hasFunds = player.PlayerData.money["cash"] >= Config.ServiceFee or player.PlayerData.money["bank"] >= Config.ServiceFee

    for _, id in ipairs(onlinePlayers) do
        local currentPlayer = QBCore.Functions.GetPlayer(id)
        if currentPlayer.PlayerData.job.name == 'ambulance' then
            medicCount = medicCount + 1
        end
    end

    cb(medicCount, hasFunds)
end)

RegisterServerEvent('ggwpx-aimedic:chargeFee')
AddEventHandler('ggwpx-aimedic:chargeFee', function()
    local src = source
    local player = QBCore.Functions.GetPlayer(src)
    local chargeAmount = Config.ServiceFee

    if player.PlayerData.money["cash"] >= chargeAmount then
        player.Functions.RemoveMoney("cash", chargeAmount)
    else
        player.Functions.RemoveMoney("bank", chargeAmount)
    end

    TriggerEvent("qb-bossmenu:server:addAccountMoney", 'ambulance', chargeAmount)
    TriggerEvent("ggwpx-aimedic:logPayment", src, chargeAmount)
end)

RegisterServerEvent('ggwpx-aimedic:logPayment')
AddEventHandler('ggwpx-aimedic:logPayment', function(playerId, amount)
    local playerName = QBCore.Functions.GetPlayer(playerId).PlayerData.charinfo.firstname
    local message = string.format(Config.LogMessages["paymentReceived"], amount, playerName)
    PerformHttpRequest(Config.DiscordWebhook, function(err, text, headers) end, 'POST', json.encode({content = message}), {['Content-Type'] = 'application/json'})
end)

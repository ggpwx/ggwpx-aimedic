local QBCore = exports['qb-core']:GetCoreObject()

local isActive = false
local vehicle, medicPed = nil, nil
local currentPlayerPed = PlayerPedId()

RegisterCommand(Config.MedicCommand, function(source, args, raw)
    if (QBCore.Functions.GetPlayerData().metadata["isdead"] or QBCore.Functions.GetPlayerData().metadata["inlaststand"]) and not isActive then
        QBCore.Functions.TriggerCallback('ggwpx-aimedic:checkDoctorAvailability', function(medicsAvailable, canPay)
            if medicsAvailable >= Config.MinEMSOnline and canPay then
                SpawnAmbulance(GetEntityCoords(currentPlayerPed))
                Notify(Config.Notifications["onTheWay"])
            elseif medicsAvailable < Config.MinEMSOnline then
                Notify(Config.Notifications["tooManyEMTs"], "error")
            elseif not canPay then
                Notify(Config.Notifications["insufficientFunds"], "error")
            else
                Notify(Config.Notifications["waitingForMedics"], "primary")
            end
        end)
    else
        Notify(Config.Notifications["canOnlyUse"], "error")
    end
end)

function SpawnAmbulance(position)
    isActive = true
    local vehicleModel = GetHashKey("ambulance")
    RequestModel(vehicleModel)
    while not HasModelLoaded(vehicleModel) do
        Wait(500)
    end

    local pedModel = GetHashKey('s_m_m_doctor_01')
    RequestModel(pedModel)
    while not HasModelLoaded(pedModel) do
        Wait(500)
    end

    local spawnPos = GetRandomVehicleNode(position)
    vehicle = CreateVehicle(vehicleModel, spawnPos, GetEntityHeading(currentPlayerPed), true, false)
    SetVehicleOnGroundProperly(vehicle)
    SetVehicleNumberPlateText(vehicle, "AIMEDIC")
    SetVehicleEngineOn(vehicle, true, true, false)

    medicPed = CreatePedInsideVehicle(vehicle, 26, pedModel, -1, true, false)
    AddBlipForEntity(vehicle)

    TaskVehicleDriveToCoord(medicPed, vehicle, position.x, position.y, position.z, 40.0, 0, vehicleModel, 524863, 2.0)
end

function GetRandomVehicleNode(position)
    local spawnRadius = Config.SpawnDistance
    local spawnX = position.x + math.random(-spawnRadius, spawnRadius)
    local spawnY = position.y + math.random(-spawnRadius, spawnRadius)
    local spawnZ = position.z
    return GetClosestVehicleNodeWithHeading(spawnX, spawnY, spawnZ, 0, 3, 0)
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(5000)
        if isActive then
            local playerCoords = GetEntityCoords(currentPlayerPed)
            local vehicleCoords = GetEntityCoords(vehicle)
            local pedCoords = GetEntityCoords(medicPed)
            local distToVehicle = Vdist(playerCoords, vehicleCoords)
            local distToPed = Vdist(playerCoords, pedCoords)

            if distToVehicle > Config.SpawnDistance then
                Notify(Config.Notifications["onTheWay"])
            elseif distToPed > Config.SpawnDistance then
                Notify(Config.Notifications["waitingForMedics"])
            elseif distToPed <= Config.SpawnDistance then
                TaskGoToCoordAnyMeans(medicPed, playerCoords.x, playerCoords.y, playerCoords.z, 1.0, 0, 0, 786603, 0xbf800000)
                if distToPed <= 1 then
                    isActive = false
                    ClearPedTasksImmediately(medicPed)
                    PerformMedicalTreatment()
                end
            end
        end
    end
end)

function PerformMedicalTreatment()
    RequestAnimDict("mini@cpr@char_a@cpr_str")
    while not HasAnimDictLoaded("mini@cpr@char_a@cpr_str") do
        Citizen.Wait(500)
    end

    TaskPlayAnim(medicPed, "mini@cpr@char_a@cpr_str", "cpr_pumpchest", 1.0, -1, -1, 9, 1.0, false, false, false)
    QBCore.Functions.Progressbar("revive_medical", "Administering treatment...", Config.ReviveDuration, false, false, {
        disableMovement = false,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true
    }, {}, {}, {}, function()
        ClearPedTasks(medicPed)
        Citizen.Wait(500)
        TriggerEvent("hospital:client:Revive")
        Notify(Config.Notifications["reviveComplete"] .. Config.ServiceFee, "success")
        TriggerServerEvent('ggwpx-aimedic:chargeFee')  
        DeleteEntity(medicPed)
        DeleteEntity(vehicle)
    end)
end

function Notify(msg, state)
    QBCore.Functions.Notify(msg, state)
end

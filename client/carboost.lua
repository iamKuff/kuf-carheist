local BJCore = exports['core']:GetCoreObject()
local GotJob = false
local Finished = true
local GotJobA = false
local GotJobB = false
local GotJobC = false
local carmodel = nil
local location = nil
local npcspawned = false

Citizen.CreateThread(function()
    exports['qb-target']:SpawnPed({
        model = Config.CarBossModel,
        coords = Config.CarBossLocation,
        minusOne = true, 
        freeze = true,
        invincible = true,
        blockevents = true,
        scenario = Config.CarBossScenario,
        target = {
            options = {
                { type = "client", event = "kuf-carheist:getJobA", icon = "fas fa-car", label = "Start Entry-Level Job" },
                { type = "client", event = "kuf-carheist:getJobB", icon = "fas fa-car-on", label = "Start Intermediate-Level Job" },
                { type = "client", event = "kuf-carheist:getJobC", icon = "fas fa-car-burst", label = "Start Senior-Level Job" },
            },
            distance = 2.5,
        },
    })
end)
Citizen.CreateThread(function()
exports['qb-target']:SpawnPed({
    model = Config.CarDogModel,
    coords = Config.CarDogLocation,
   -- minusOne = true, 
    freeze = false,
    invincible = true,
    blockevents = true,
    scenario = 'WORLD_DOG_SITTING',
    target = {
        options = {
            { type = "client", event = "kuf-carheist:pet", icon = "fas fa-otter", label = "Pet" },
        },        distance = 1.5,
    },
})
end)
--Dog STUFF --
RegisterNetEvent("kuf-carheist:pet", function()
    exports['mythic_progbar']:Progress({
        name = "delv",
        duration = Config.LoadingTime * 500,
        label = "Stroking Dog",
        useWhileDead = false,
        canCancel = false, -- Can change true if you want but people might go on and off,
        controlDisables = {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
        },
        animation = {
            animDict = "anim@amb@business@weed@weed_inspecting_lo_med_hi@",
            anim = "weed_crouch_checkingleaves_idle_01_inspector",
        },
        prop = {
            model = "p_cs_comb_01",
        }
    }, function()
        BJCore.Functions.Notify('Thanks for stroking him!', 'success', 7500)
        TriggerServerEvent("kuf-carheist:getPetReward")
    end, function()
        BJCore.Functionss.Notify('How dare you stop stroking my Dog! Get lost and do your job...', 'error', 7500)
    end)
end)
-- Car heist Stuff -------------------------------------------------------------------------------------------------

local jobBlip = nil

RegisterNetEvent("kuf-carheist:getJobA", function()
    if not GotJob then
            carmodel = Config.VehicleTierA.BoostVehicles[math.random(1, #Config.VehicleTierA.BoostVehicles)]
            location = Config.CarHeistLocations.CarSpawn[math.random(1, #Config.CarHeistLocations.CarSpawn)]
            TriggerServerEvent('kuf-carheist:GiveTierAPrice')
            print("server event done")
            BJCore.Functions.Notify('You will recive an email shortly! Pet My Dog Before You Leave.', 'success', 7500)
            if Config.PhoneScript == 'bj' then
                Citizen.Wait(30000)
                TriggerServerEvent('phone:server:sendNewMail', {
                    sender = "Chevy Davis",
                    subject = "Small Devious Car Pickup",
                    message = "Right. I've got a small job for you. You will find the car at " .. location.name .. ", and the car model is a " .. carmodel.name .. ". Bring it back opposite to me. You can also scrap the vehicle if you want to just round the corner where I was.",
                })
            end

            GotJob = true
            GotJobA = true
            Finished = false
            BJCore.Functions.SpawnVehicle(carmodel.model, function(veh) end, location.coords, true)

            local carHeistLocation = Config.CarHeistLocations["Deliver"]
            jobBlip = AddBlipForCoord(carHeistLocation.x, carHeistLocation.y, carHeistLocation.z)
            SetBlipSprite(jobBlip, 225)
            SetBlipDisplay(jobBlip, 2)
            SetBlipScale(jobBlip, 0.7)
            SetBlipColour(jobBlip, 3)
            SetBlipAsShortRange(jobBlip, true)
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentString("Car Heist Location")
            EndTextCommandSetBlipName(jobBlip)
    else
        BJCore.Functions.Notify('You already have a Job', 'error', 7500)
        if jobBlip ~= nil then
            RemoveBlip(jobBlip)
            jobBlip = nil
        end
    end
end)

RegisterNetEvent("kuf-carheist:getJobB", function()
    if not GotJob then
            carmodel = Config.VehicleTierB.BoostVehicles[math.random(1, #Config.VehicleTierB.BoostVehicles)]
            location = Config.CarHeistLocations.CarSpawn[math.random(1, #Config.CarHeistLocations.CarSpawn)]
            TriggerServerEvent('kuf-carheist:GiveTierBPrice')
            BJCore.Functions.Notify('You will recive an email shortly! Pet My Dog Before You Leave.', 'success', 7500)
            if Config.PhoneScript == 'bj' then
                Citizen.Wait(30000)
                TriggerServerEvent('phone:server:sendNewMail', {
                    sender = "Chevy Davis",
                    subject = "Sexy Devious Car Pickup",
                    message = "Right. I've got a sexy motor for your to pickup. You will find the car at " .. location.name .. ", and the car model is a " .. carmodel.name .. ". Bring it back opposite to me. You can also scrap the vehicle if you want to just round the corner where I was.",
                })
            else
            end
            GotJob = true
            GotJobB = true
            Finished = false
            BJCore.Functions.SpawnVehicle(carmodel.model, function(veh) end, location.coords, true)
    else
        BJCore.Functions.Notify('You already have a Job', 'error', 7500)
    end
end)

RegisterNetEvent("kuf-carheist:getJobC", function()
    if not GotJob then
            carmodel = Config.VehicleTierC.BoostVehicles[math.random(1, #Config.VehicleTierC.BoostVehicles)]
            location = Config.CarHeistLocations.CarSpawn[math.random(1, #Config.CarHeistLocations.CarSpawn)]
            TriggerServerEvent('kuf-carheist:GiveTierCPrice')
            BJCore.Functions.Notify('You will recive an email shortly! Pet My Dog Before You Leave.', 'success', 7500)
            if Config.PhoneScript == 'bj' then
                Citizen.Wait(30000)
                TriggerServerEvent('phone:server:sendNewMail', {
                    sender = "Chevy Davis",
                    subject = "Beasty Devious Car Pickup",
                    message = "Right. Big things here..this car is a beast, all you got to do is pick...it...up. You will find the car at " .. location.name .. ", and the car model is a " .. carmodel.name .. ". Bring it back opposite to me. You can also scrap the vehicle if you want to just round the corner where I was.",
                })
            else
            end
            GotJob = true
            GotJobC = true
            Finished = false
            BJCore.Functions.SpawnVehicle(carmodel.model, function(veh) end, location.coords, true)
    else
        BJCore.Functions.Notify('You already have a job', 'error', 7500)
    end
end)

RegisterNetEvent("kuf-carheist:DeliverVehicleA", function()
    local vehicle = GetVehiclePedIsIn(PlayerPedId(), true)
    if not Finished and GotJob and GotJobA then
        exports['mythic_progbar']:Progress({
            name = "delv",
            duration = Config.LoadingTime * 1000,
            label = "Dropping Off Car",
            useWhileDead = false,
            canCancel = true,
            controlDisables = {
                disableMovement = true,
                disableCarMovement = true,
                disableMouse = false,
                disableCombat = true,
            },
        }, function()
            TriggerServerEvent("kuf-carheist:getRewardA")
            print("Success")
            Wait(0)
            DeleteVehicle(vehicle)
            BJCore.Functions.Notify('You Delivered The Vehicle', 'primary', 7500)
            GotJob = false
            GotJobA = false
            Finished = true
        end, function()
            BJCore.Functions.Notify('Cancelled', 'error', 7500)
            GotJob = false
            GotJobA = false
            Finished = true
        end)
    end
end)

RegisterNetEvent("kuf-carheist:DeliverVehicleB", function()
    local vehicle = GetVehiclePedIsIn(PlayerPedId(), true)
    if not Finished and GotJob and GotJobB then
        exports['mythic_progbar']:Progress({
            name = "delv",
            duration = Config.LoadingTime * 1000,
            label = "Dropping Off Car",
            useWhileDead = false,
            canCancel = true,
            controlDisables = {
                disableMovement = true,
                disableCarMovement = true,
                disableMouse = false,
                disableCombat = true,
            },
        }, function()
            TriggerServerEvent("kuf-carheist:getRewardB")
            print("Success")
            Wait(0)
            DeleteVehicle(vehicle)
            BJCore.Functions.Notify('You Delivered The Vehicle', 'primary', 7500)
            GotJob = false
            GotJobB = false
            Finished = true
        end, function()
            BJCore.Functions.Notify('Cancelled', 'error', 7500)
            GotJob = false
            GotJobB = false
            Finished = true
        end)
    end
end)

RegisterNetEvent("kuf-carheist:DeliverVehicleC", function()
    local vehicle = GetVehiclePedIsIn(PlayerPedId(), true)
    if not Finished and GotJob and GotJobC then
        exports['mythic_progbar']:Progress({
            name = "delv",
            duration = Config.LoadingTime * 1000,
            label = "Dropping Off Car",
            useWhileDead = false,
            canCancel = true,
            controlDisables = {
                disableMovement = true,
                disableCarMovement = true,
                disableMouse = false,
                disableCombat = true,
            },
        }, function()
            TriggerServerEvent("kuf-carheist:getRewardC")
            print("Success")
            Wait(0)
            DeleteVehicle(vehicle)
            BJCore.Functions.Notify('You Delivered The Vehicle', 'primary', 7500)
            GotJob = false
            GotJobC = false
            Finished = true
        end, function()
            BJCore.Functions.Notify('Cancelled', 'error', 7500)
            GotJob = false
            GotJobC = false
            Finished = true
        end)
    end
end)

RegisterNetEvent("kuf-carheist:ScrapVehicle", function()
    local vehicle = GetVehiclePedIsIn(PlayerPedId(), true)
    if not Finished and GotJob then
        print("scrapcheck")
        exports['mythic_progbar']:Progress({
            name = "delv",
            duration = Config.LoadingTime * 1000,
            label = "Scrapping Vehicle",
            useWhileDead = false,
            canCancel = true,
            controlDisables = {
                disableMovement = true,
                disableCarMovement = true,
                disableMouse = false,
                disableCombat = true,
            },
        }, function()
            TriggerServerEvent("kuf-carheist:GetScrapReward")
            print("Success")
            Wait(0)
            DeleteVehicle(vehicle)
            BJCore.Functions.Notify('You Scrapped The Vehicle', 'primary', 7500)
            GotJob = false
            GotJobA = false
            GotJobB = false
            GotJobC = false
            Finished = true
        end, function()
            BJCore.Functions.Notify('Cancelled', 'error', 7500)
            GotJob = false
            GotJobA = false
            GotJobB = false
            GotJobC = false
            Finished = true
        end)
    end
end)

RegisterNetEvent('kuf-carheist:TierCheck', function()
    if not Finished and GotJobA then
        TriggerEvent('kuf-carheist:DeliverVehicleA')
    elseif not Finished and GotJobB then
        TriggerEvent('kuf-carheist:DeliverVehicleB')
    elseif not Finished and GotJobC then
        TriggerEvent('kuf-carheist:DeliverVehicleC')
    end
end)

Citizen.CreateThread(function()
    local inRange = false
    while true do
        Wait(0)
        local pos = GetEntityCoords(PlayerPedId())
        if #(pos - vector3(Config.CarHeistLocations["Deliver"].x, Config.CarHeistLocations["Deliver"].y, Config.CarHeistLocations["Deliver"].z)) < 10 then
            inRange = true
            if IsPedInAnyVehicle(PlayerPedId()) then
                DrawMarker(2, Config.CarHeistLocations["Deliver"].x, Config.CarHeistLocations["Deliver"].y, Config.CarHeistLocations["Deliver"].z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.2, 0.15, 200, 200, 200, 222, false, false, false, true, false, false, false)
                if #(pos - vector3(Config.CarHeistLocations["Deliver"].x, Config.CarHeistLocations["Deliver"].y, Config.CarHeistLocations["Deliver"].z)) < 5 then
                    DrawText3D(Config.CarHeistLocations["Deliver"].x, Config.CarHeistLocations["Deliver"].y, Config.CarHeistLocations["Deliver"].z, "~g~E~w~ - Deliver Vehicle")
                    if IsControlJustPressed(0, 38) then
                        if GetPedInVehicleSeat(GetVehiclePedIsIn(PlayerPedId()), -1) == PlayerPedId() then
                            if IsVehicleValid(GetEntityModel(GetVehiclePedIsIn(PlayerPedId(), true))) then
                                TriggerEvent("kuf-carheist:TierCheck")
                            else
                                BJCore.Functions.Notify('This is not the right vehicle', 'error', 7500)
                            end
                        else
                            BJCore.Functions.Notify('You must be the driver of the vehicle', 'error', 7500)
                        end
                    end
                end
            end
            if not inRange then
                Wait(1000)
            end
        end
    end
end)

Citizen.CreateThread(function()
    local inRange = false
    while true do
        Wait(0)
        local pos = GetEntityCoords(PlayerPedId())
        if #(pos - vector3(Config.CarHeistLocations["Scrap"].x, Config.CarHeistLocations["Scrap"].y, Config.CarHeistLocations["Scrap"].z)) < 10 then
            inRange = true
            if IsPedInAnyVehicle(PlayerPedId()) then
                DrawMarker(2, Config.CarHeistLocations["Scrap"].x, Config.CarHeistLocations["Scrap"].y, Config.CarHeistLocations["Scrap"].z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.2, 0.15, 200, 200, 200, 222, false, false, false, true, false, false, false)
                if #(pos - vector3(Config.CarHeistLocations["Scrap"].x, Config.CarHeistLocations["Scrap"].y, Config.CarHeistLocations["Scrap"].z)) < 5 then
                    DrawText3D(Config.CarHeistLocations["Scrap"].x, Config.CarHeistLocations["Scrap"].y, Config.CarHeistLocations["Scrap"].z, "~g~E~w~ - Scrap Vehicle")
                    if IsControlJustPressed(0, 38) then
                        if GetPedInVehicleSeat(GetVehiclePedIsIn(PlayerPedId()), -1) == PlayerPedId() then
                            if IsVehicleValid(GetEntityModel(GetVehiclePedIsIn(PlayerPedId(), true))) then
                                TriggerEvent("kuf-carheist:ScrapVehicle")
                            else
                                BJCore.Functions.Notify('This is not the right vehicle', 'error', 7500)
                            end
                        else
                            BJCore.Functions.Notify('You must be the driver of the vehicle', 'error', 7500)
                        end
                    end
                end
            end
            if not inRange then
                Wait(1000)
            end
        end
    end
end)

function IsVehicleValid(vehicleModel)
    local retval = false
    if carmodel ~= nil then
        if carmodel ~= nil and GetHashKey(carmodel.model) == vehicleModel then
            retval = true
        end
    end
    return retval
end

function DrawText3D(x, y, z, text)
    SetTextScale(0.3, 0.3)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x, y, z, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 400
    DrawRect(0.0, 0.0 + 0.0110, 0.017 + factor, 0.03, 0, 0, 0, 75)
    ClearDrawOrigin()
end

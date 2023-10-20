Config = {}

--===PHONE SETTINGS===--
Config.PhoneScript = 'bj'

Config.DebugHeists = false
Config.DebugPoly = true
Config.MoneyType = 'cash'  -- cash/bank

Config.CarBossModel = 'ig_djgeneric_01'
Config.CarBossLocation = vector4(983.9778, -1531.5123, 30.8072, 176.1588)
Config.CarBossScenario = 'WORLD_HUMAN_DRUG_DEALER'

--//DogREWARD//--
Config.CarDogModel = 'A_C_Chop_02'
Config.CarDogLocation = vector4(984.4749, -1531.9059, 30.7940, 183.3338)
Config.TierPetReward = math.random(1, 2)

--//COSTS//--
Config.TierAPrice = math.random(200, 400)  
Config.TierBPrice = math.random(400, 600) 
Config.TierCPrice = math.random(600, 800)

--//REWARDS//--
Config.TierAReward = math.random(1300, 1800) 
Config.TierBReward = math.random(800, 1200) 
Config.TierCReward = math.random(400, 700) 

Config.LoadingTime = 25
Config.ScrapTime = 25

Config.ScrapItems = { 
    'lockpick',
    'electronickit',
    'tunerlaptop',
    'nitrous',
    'metalscrap',
}
Config.NumberOfScrapItems = 4 
Config.ScrapItemAmount = 2 
Config.GiveScrapMoney = true 
Config.ScrapMoneyLow = 20
Config.ScrapMoneyMax = 40

-- Tier A: Entry-Level Cars --
Config.VehicleTierA = { 
    BoostVehicles = {
        {model = 'brioso', name = "Brioso - Compact Car"},
        {model = 'rhapsody', name = "Rhapsody - Compact Car"},
        {model = 'futo', name = "Futo - Compact Car"},
        {model = 'dominator', name = "Dominator - Muscle Car"},
        {model = 'buccaneer', name = "Buccaneer - Muscle Car"},
        {model = 'asea', name = "Asea - Compact Car"},
        {model = 'issi2', name = "Issi Classic - Compact Car"},
        {model = 'mesa', name = "Mesa - Off-Road Vehicle"},
    }, 
}

-- Tier B: Mid-Range Cars --
Config.VehicleTierB = {  
    BoostVehicles = {
        {model = 'kuruma', name = "Kuruma - Compact Car"},
        {model = 'elegy', name = "Elegy RH8 - Sports Car"},
        {model = 'comet2', name = "Comet Retro Custom - Sports Car"},
        {model = 'ninef', name = "9F - Sports Car"},
        {model = 'schwarzer', name = "Schwarzer - Sports Car"},
        {model = 'penumbra', name = "Penumbra - Sports Car"},
    }, 
}

-- Tier C: High-End Sports Cars --
Config.VehicleTierC = {  
    BoostVehicles = {
        {model = 'bullet', name = "Bullet - Supercar"},
        {model = 'entity2', name = "Entity XF - Supercar"},
        {model = 'cheetah', name = "Cheetah - Supercar"},
        {model = 'adder', name = "Adder - Supercar"},
        {model = 'turismor', name = "Turismo R - Supercar"},
        {model = 'vacca', name = "Vacca - Supercar"},
    }, 
}

--//LOCATIONS//--
Config.CarHeistLocations = {
    ["Deliver"] = vector4(983.8721, -1536.2428, 30.6752, 89.2074), 
    ["Scrap"] = vector4(1001.5980, -1562.1442, 30.7628, 184.2852), 
    CarSpawn = {
        {name = "Mirror Park Shop Block Parking", coords = vector4(1155.3336, -490.8790, 65.3602, 11.6709)},
        {name = "Mirror Park Horny's", coords = vector4(1245.9363, -334.9505, 69.0822, 175.7640)},
        {name = "Diamond Casino Parking", coords = vector4(867.9543, -55.1992, 78.7641, 239.8671)},
        {name = "Behind Vinewood Plaza", coords = vector4(578.2662, 130.8514, 98.0414, 251.7875)},
        {name = "Behind Up-n-Atom Parking", coords = vector4(115.2103, 300.2231, 109.9742, 151.9503)},
        {name = "LifeInvader Building", coords = vector4(-1053.3, -222.55, 37.7, 67.2)},
        {name = "West Vinewood Behind Hardcore Comic Store", coords = vector4(-136.1785, 196.9519, 90.1809, 337.5029)},
        {name = "La Puerta Outside Yacht Club", coords = vector4(-722.6465, -1296.2827, 5.0004, 54.1133)},
        {name = "Outside Grove Mega Mall", coords = vector4(26.8600, -1737.6073, 29.3031, 49.7734)},
        {name = "Sandy Shores Gas Station", coords = vector4(1979.38, 3784.78, 31.82, 28.73)},
        {name = "Vineyard", coords = vector4(-1906.35, 2004.55, 141.47, 271.08)},
        {name = "Paleto Skylift Parking", coords = vector4(-755.86, 5548.87, 33.12, 178.38)},
        {name = "Paleto Bay Parking Outside The Toilets", coords = vector4(187.98, 6632.77, 31.19, 182.01)},
        {name = "Grapeseed Gas Station", coords = vector4(1704.33, 4947.59, 42.17, 58.25)},
        {name = "YouTool Parking", coords = vector4(2795.52, 3486.15, 54.69, 63.82)},
    },
}

BJCore = nil
TriggerEvent('BJCore:GetObject', function(obj) BJCore = obj end)
Citizen.CreateThread(function(...) while BJCore == nil do TriggerEvent("BJCore:GetObject", function(obj) BJCore = obj end); Citizen.Wait(1000); end; end)
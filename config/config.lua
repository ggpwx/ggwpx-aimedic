--  _______   ______ ____    __    ____  ______   ___   ___ 
-- /  _____| /  ____|\   \  /  \  /   / |   _  \  \  \ /  / 
--|  |  __  |  |  __  \   \/    \/   /  |  |_)  |  \  V  /  
--|  | |_ | |  | |_ |  \            /   |   ___/    >   <   
--|  |__| | |  |__| |   \    /\    /    |  |       /  .  \  
-- \______|  \______|    \__/  \__/     |__|      /__/ \__\ 
--=========================================================
--      JOIN DISCORD : discord.gg/fsyxppyr8W6
--=========================================================   

-------------------
-- CONFIGURATION --
-------------------
Config = {}

-- Minimum number of EMS required to respond to a call
Config.MinEMSOnline = 0

-- Cost of medical services
Config.ServiceFee = 500

-- Time required for revive (in milliseconds)
Config.ReviveDuration = 15000 

-- Distance settings
Config.SpawnDistance = 30.0 

-- Command settings
Config.MedicCommand = "callmedic"

-- Use vehicle or not
Config.UseVehicle = false  -- Set to false if you want to spawn ped directly

-- Notification messages
Config.Notifications = {
    ["onTheWay"] = "🚑 Your medic is en route and should arrive soon!",
    ["tooManyEMTs"] = "🚨 Too many medics are currently online. Please wait a moment.",
    ["insufficientFunds"] = "💸 You don't have enough funds to cover the service fee.",
    ["waitingForMedics"] = "⏳ A medic will be with you shortly. Please be patient.",
    ["reviveComplete"] = "✅ Your treatment is complete. You have been charged: $",
    ["canOnlyUse"] = "❗ This command can only be used when you're down or in last stand.",
}



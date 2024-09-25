-------------------
-- CONFIGURATION --
-------------------
Config = {}

-- Minimum number of EMS required to respond to a call
Config.MinEMSOnline = 0

-- Cost of medical services
Config.ServiceFee = 500

-- Time required for revive (in milliseconds)
Config.ReviveDuration = 15000  -- 15 seconds

-- Distance settings
Config.MinDistance = 20.0  -- Minimum distance between player and ambulance

-- Command settings
Config.MedicCommand = "medic"  -- Command name for calling the ambulance

-- Notification messages
Config.Notifications = {
    ["onTheWay"] = "🚑 Your medic is en route and should arrive soon!",
    ["tooManyEMTs"] = "🚨 Too many medics are currently online. Please wait a moment.",
    ["insufficientFunds"] = "💸 You don't have enough funds to cover the service fee.",
    ["waitingForMedics"] = "⏳ A medic will be with you shortly. Please be patient.",
    ["reviveComplete"] = "✅ Your treatment is complete. You have been charged: $",
    ["canOnlyUse"] = "❗ This command can only be used when you're down or in last stand.",
}

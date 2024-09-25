-------------------
-- CONFIGURATION --
-------------------
Config = {}

-- Minimum number of EMS required to respond to a call
Config.MinEMSOnline = 0

-- Cost of medical services
Config.ServiceFee = 150

-- Time required for revive (in milliseconds)
Config.ReviveDuration = 15000  -- 15 seconds

-- Notification messages
Config.Notifications = {
    ["onTheWay"] = "🚑 Your medic is en route and should arrive soon!",
    ["tooManyEMTs"] = "🚨 Too many medics are currently online. Please wait a moment.",
    ["insufficientFunds"] = "💸 You don't have enough funds to cover the service fee.",
    ["waitingForMedics"] = "⏳ A medic will be with you shortly. Please be patient.",
    ["reviveComplete"] = "✅ Your treatment is complete. You have been charged: $",
    ["canOnlyUse"] = "❗ This command can only be used when you're down or in last stand.",
}

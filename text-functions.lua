-- functions to call notifications

-- Notification // Help Notify Style
function helpNotify(msg)
	BeginTextCommandDisplayHelp('STRING')
	AddTextComponentSubstringPlayerName(msg)
	EndTextCommandDisplayHelp(0, false, true, -1)
end

-- Notification // Subtitle Style
function subtitleText(msg, duration)
	BeginTextCommandPrint("STRING")
	AddTextComponentSubstringPlayerName(msg)
	EndTextCommandPrint(duration, true)
end

-- Notification // Native Notify Style
function Notify(msg)
    SetNotificationTextEntry('STRING')
	AddTextComponentString(msg)
	DrawNotification(0,1)
end

-- Notification // Floating Notify Style
function floatNotify(msg, coords)
    AddTextEntry('floatNotify', msg)
	SetFloatingHelpTextWorldPosition(1, coords)
	SetFloatingHelpTextStyle(1, 1, 2, -1, 3, 0)
	BeginTextCommandDisplayHelp('floatNotify')
	EndTextCommandDisplayHelp(2, false, false, -1)
end

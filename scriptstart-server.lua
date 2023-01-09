local ogResourceName = 'ax_jagen'

AddEventHandler('onResourceStart', function(resource)
	if GetCurrentResourceName() ~= ogResourceName then
        print('^5[Scriptname] ^1Please rename the Script to^3 '..ogResourceName..^1, some functions may not work properly! Right now this resource is named: ^7'..GetCurrentResourceName()..'^0')
    end
end)

function GetCurrentVersion()
	return GetResourceMetadata( GetCurrentResourceName(), "version" )
end

local CheckVersion = true -- if true, don't forget to add a version into fxmanifest/resource.lua, otherwise shit will get fucked up
local CurrentVersion = GetCurrentVersion()

if CheckVersion then
	PerformHttpRequest('https://raw.githubusercontent.com/MSK-Scripts/msk_webhook/main/VERSION', function(Error, NewestVersion, Header)
		print("###############################")
    	if CurrentVersion == NewestVersion then
	    	print(GetCurrentResourceName() .. '^2 ✓ Resource is Up to Date^0 - ^5Current Version: ^2' .. CurrentVersion .. '^0')
    	elseif CurrentVersion ~= NewestVersion then
        	print(GetCurrentResourceName() .. '^1 ✗ Resource Outdated. Please Update!^0 - ^5Current Version: ^1' .. CurrentVersion .. '^0')
	    	print('^5Newest Version: ^2' .. NewestVersion .. '^0 - ^6Download here: ^9https://github.com/MSK-Scripts/msk_webhook/releases/tag/v'.. NewestVersion .. '^0')
    	end
		print("###############################")
	end)
else
	print("###############################")
	print(GetCurrentResourceName() .. '^2 ✓ Resource loaded^0')
	print("###############################")
end

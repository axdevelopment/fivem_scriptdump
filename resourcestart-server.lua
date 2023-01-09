local CheckVersion = true

AddEventHandler('onResourceStart', function(resource)
	if GetCurrentResourceName() ~= 'ax_jagen' then
        print('^5[Scriptname] ^1Please rename the Script to^3 "ax_jagen"^1, some functions may not work properly! Right now this resource is named: ^7'..GetCurrentResourceName()..'^0')
    end
end)

function GetCurrentVersion()
	return GetResourceMetadata( GetCurrentResourceName(), "version" )
end

-- add a version in fxmanifest/resource, otherwise shit will get fucked up amk

local CurrentVersion = GetCurrentVersion()
local resourceName = "^4["..GetCurrentResourceName().."]^0"

if CheckVersion then
	PerformHttpRequest('https://raw.githubusercontent.com/axdevelopment/fivem_scriptdump/main/VERSION', function(Error, NewestVersion, Header)
		print("###############################")
    	if CurrentVersion == NewestVersion then
	    	print(GetCurrentResourceName() .. '^2 ✓ Resource is Up to Date^0 - ^5Current Version: ^2' .. CurrentVersion .. '^0')
    	elseif CurrentVersion ~= NewestVersion then
        	print(GetCurrentResourceName() .. '^1 ✗ Resource Outdated. Please Update!^0 - ^5Current Version: ^1' .. CurrentVersion .. '^0')
	    	print('^5Newest Version: ^2' .. NewestVersion .. '^0 - ^6Download here: there is no download link atm lol^0')
    	end
		print("###############################")
	end)
else
	print("###############################")
	print(GetCurrentResourceName() .. '^2 ✓ Resource loaded^0')
	print("###############################")
end

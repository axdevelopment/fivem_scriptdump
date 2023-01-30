-- optimized way of drawing blips

config = {																
	Locations = {                                                          
	vector3(2787.3596, 3515.3413, 54.8345),
	vector3(2790.9263, 3513.1270, 54.8114)
	},
	Name				= "Lager",                             
	--MarkerType			= 20,	
	--MarkerColor 			= {r = 155, g = 0, b = 0},	
	--MarkerSize			= {x = 0.5, y = 0.5, z = 0.5},
	--MarkerDrawDistance		= 3.0,
	Blips = {
		Enabled			= true,
		Name 			= "Lager",                            
		Size 			= 0.7,                               
		Sprite 			= 525,                              
		Color			= 32    
	}
}

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function()
	if Config.Lager.Blips.Enabled then
		showBlips()
	end
end)

function showBlips()
	for _, info in pairs(config) do
	local blipLocation = config.Locations[1]
	blip = AddBlipForCoord(blipLocation)
	SetBlipSprite(blip, config.Blips.Sprite)
	SetBlipScale(blip, config.Blips.Size)
	SetBlipColour(blip, config.Blips.Color)
	SetBlipAlpha(blip, 255)
	SetBlipAsShortRange(blip, true)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString(config.Blips.Name)
	EndTextCommandSetBlipName(blip)
	end
end

-- optimized way of drawing blips

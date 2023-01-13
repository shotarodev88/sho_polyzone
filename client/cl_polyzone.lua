local entered = false
local currentZone = nil
local debugEnabled = false
local Zones = nil
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(500)
		local playerPed = PlayerPedId()
		local coords = GetEntityCoords(playerPed)
		local zoneNow = nil
		for k, v in pairs(Config.PolyZones) do
			local inpoly = Config.PolyZones[k]:isPointInside(coords)
			zoneNow = v.name
			Zones = v 
			if inpoly then
				if not entered then
					if currentZone == nil then
						currentZone = v.name
						print("^0[^4Polyzone^0]: ^2Entered Zone^0: [^3"..k.."^0]")
						TriggerEvent('sho_polyzone:EnteredZone:' .. v.data.event, currentZone, v.data)
						entered = true
					end
				end
			else
				if entered and currentZone == zoneNow then
					print("^0[^4Polyzone^0]: ^1Left Zone^0: [^3"..k.."^0]")			
					TriggerEvent('sho_polyzone:LeftZone:' .. v.data.event, currentZone)
					currentZone = nil
					entered = false
				end
			end
		end

	end
end)

local function DebugPolyZone(state)
	if state == debugEnabled then return end
	debugEnabled = state
	if debugEnabled then
		while debugEnabled do 
			for k,v in pairs(Config.PolyZones) do
				v:draw()
			end
			Citizen.Wait(0)
		end
	end
end

RegisterCommand('+poly', function()
	DebugPolyZone(true)
end)

RegisterCommand('-poly', function()
	DebugPolyZone(false)
end)

-- RegisterKeyMapping('+poly', 'Toggle Polyzone', 'keyboard', 'G')


local CurrentTargetEntity = nil

function RotationToDirection(rotation)
    local x = rotation.x * math.pi / 180.0
    local z = rotation.z * math.pi / 180.0
    local num = math.abs(math.cos(x))
    return vector3((-math.sin(z) * num), (math.cos(z) * num), math.sin(x))
end

function GetCurrentRaycastTarget(distance, radius, ped) -- Camera Rotation
    local startingCoords = GetPedBoneCoords(ped, 31086)
    local rotationDirection = RotationToDirection(GetGameplayCamRot(2))
    local targetCoords = startingCoords + (rotationDirection * distance)
    if not rotationDirection then return end
    local rayHandle = StartShapeTestSweptSphere(startingCoords.x, startingCoords.y, startingCoords.z, targetCoords.x, targetCoords.y, targetCoords.z, radius, 286, ped, 0)
    local _, hit, targetCoords, surfaceNormal, entityHit = GetShapeTestResult(rayHandle)
    if not hit and targetEntity == 0 then return end
    local entityType = GetEntityType(entityHit)
    return entityHit, entityType, targetCoords	
end

CreateThread(function()
	while true do
		local playerPed = PlayerPedId()
		local entity, entityType, entityCoords = GetCurrentRaycastTarget(1.5, 0.2, playerPed)
		if entity ~= 0 then
			if entity ~= CurrentTargetEntity then
				CurrentTargetEntity = entity
				TriggerEvent('sho_polyzone:raycast:update', entity, entityType, entityCoords)
			end
		else
			if CurrentTargetEntity then
				CurrentTargetEntity = nil
				TriggerEvent('sho_polyzone:raycast:update', CurrentTargetEntity)
			end
		end
		Wait(300)
	end
end)

local isInSafeZone = false
AddEventHandler('sho_polyzone:EnteredZone:SafeZone', function(zone, data)
	-- local player = PlayerPedId()
	isInSafeZone = true
	if not isInSafeZone then return end
	NetworkSetFriendlyFireOption(false)
	-- if IsPedInAnyVehicle(player) then 
	-- 	SetLocalPlayerAsGhost(true)
	-- end
	-- SetLocalPlayerAsGhost(true)
	exports['col_notify']:Custom({style = 'warning', duration = 15000, title = 'SAFE ZONE', message = 'You\'re inside of a safe zone.', sound = false})
	Citizen.CreateThread(function()
		while isInSafeZone do
			Citizen.Wait(5)
			DisableControlAction(0, 106, true)
			DisableControlAction(0, 37, true)
			DisableControlAction(0, 25, true)
			DisableControlAction(0, 24, true)
			if IsDisabledControlJustPressed(2, 37) then
				TriggerEvent('ox_inventory:disarm')
			end
			if IsDisabledControlJustPressed(0, 106) then
				TriggerEvent('ox_inventory:disarm')
			end
			if IsDisabledControlJustPressed(0, 25) then
				TriggerEvent('ox_inventory:disarm')
			end
			if IsDisabledControlJustPressed(0, 24) then
				TriggerEvent('ox_inventory:disarm')
			end
		end
	end)
end)

AddEventHandler('sho_polyzone:LeftZone:SafeZone', function(zone)
	isInSafeZone = false
	NetworkSetFriendlyFireOption(true)
	-- local player = PlayerPedId()
	-- if IsPedInAnyVehicle(player) then 
	-- 	SetLocalPlayerAsGhost(false)
	-- 	return
	-- end
	-- SetLocalPlayerAsGhost(false)
end)
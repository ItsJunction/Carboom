function ShowNotification(text)
    SetNotificationTextEntry("STRING")
    AddTextComponentSubstringPlayerName(text)
    DrawNotification(false, false)
end

RegisterCommand('createbomb', function(source, args, rawCommand)
    if  GetLastDrivenVehicle() == -1 then
        ShowNotification("~w~You were ~r~not in~w~ a vehicle currently in the world, no ~r~bomb~w~ was created.")
    elseif GetLastDrivenVehicle() ~= -1 then
        AddVehiclePhoneExplosiveDevice(GetLastDrivenVehicle())
        ShowNotification("~r~Bomb~w~ was created! Run ~b~/explode~w~ to explode.")
    end
end)

RegisterCommand('explode', function(source, args, rawCommand)
    Citizen.CreateThread(function()
        DetonateVehiclePhoneExplosiveDevice()
        ShowNotification("~r~Obliterated!")
      end)
end)
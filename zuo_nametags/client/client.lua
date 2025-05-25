CreateThread(function()
    while true do
        local myPed = PlayerPedId()
        local myCoords = GetEntityCoords(myPed)

        for _, player in ipairs(GetActivePlayers()) do
            local ped = GetPlayerPed(player)
            if DoesEntityExist(ped) then
                local coords = GetEntityCoords(ped)
                local dist = #(myCoords - coords)
                if dist < 25.0 then
                    local serverId = GetPlayerServerId(player)
                    local height = 1.1
                    DrawText3D(coords.x, coords.y, coords.z + height, "[ ID: " .. serverId .. " ]")
                end
            end
        end

        Wait(0)
    end
end)

function DrawText3D(x,y,z, text)
    local onScreen,_x,_y = World3dToScreen2d(x,y,z)
    local camCoords = GetGameplayCamCoords()
    local dist = #(camCoords - vector3(x,y,z))
    local scale = 200 / (GetGameplayCamFov() * dist)

    if onScreen then
        SetTextScale(0.45, 0.45)
        SetTextFont(4)
        SetTextProportional(1)
        SetTextColour(255, 255, 255, 215)
        SetTextEdge(2, 0, 0, 0, 150)
        SetTextOutline()
        SetTextCentre(true)
        BeginTextCommandDisplayText("STRING")
        AddTextComponentSubstringPlayerName(text)
        EndTextCommandDisplayText(_x,_y)
    end
end

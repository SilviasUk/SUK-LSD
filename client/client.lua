QBCore = exports['qb-core']:GetCoreObject()

-- Functions
RegisterNetEvent('QBCore:Client:UpdateObject', function()
    QBCore = exports['qb-core']:GetCoreObject()
end)

local function loadAnimDict(dict)
    if HasAnimDictLoaded(dict) then return end
    RequestAnimDict(dict)
    while not HasAnimDictLoaded(dict) do
        Wait(10)
    end
end

local function Lsd1()
    local startStamina = 30
    while startStamina > 0 do
        Wait(1000)
        startStamina -= 1
        RestorePlayerStamina(PlayerId(), 1.0)
        if math.random(1, 100) < 51 then
            SetFlash(0, 0, 500, 7000, 500)
            ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.08)
            SetFlash(0, 0, 500, 7000, 500)
            SetFlash(0, 0, 500, 7000, 500)
            ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.08)
            SetTimecycleModifier("spectator3")	
            SetTimecycleModifier("spectator5")
        end
    end
    if IsPedRunning(PlayerPedId()) then
        SetPedToRagdoll(PlayerPedId(), math.random(1000, 3000), math.random(1000, 3000), 3, false, false, false)
    end
end

local function Lsd2()
    local startStamina = 30
    while startStamina > 0 do
        Wait(1000)
        startStamina -= 1
        RestorePlayerStamina(PlayerId(), 1.0)
        if math.random(1, 100) < 51 then
            SetFlash(0, 0, 500, 7000, 500)
            ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.08)
            SetFlash(0, 0, 500, 7000, 500)
            SetFlash(0, 0, 500, 7000, 500)
            ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.08)
            SetTimecycleModifier("spectator3")	
            SetTimecycleModifier("spectator5")
            SetTimecycleModifier("BikerFilter")
            SetTimecycleModifier("PPFilter")
            SetPedMotionBlur(GetPlayerPed(-1), true)
            ForcePedMotionState(GetPlayerPed(-1), -1115154469, 1, 1, 0)
            if not HasAnimSetLoaded("MOVE_M@DRUNK@SLIGHTLYDRUNK") then
                RequestAnimSet("MOVE_M@DRUNK@SLIGHTLYDRUNK")
                while not HasAnimSetLoaded("MOVE_M@DRUNK@SLIGHTLYDRUNK") do
                    Citizen.Wait(0)
                end
            end
        
            SetPedIsDrunk(GetPlayerPed(-1), true)
            ShakeGameplayCam("DRUNK_SHAKE", 1.0)
            SetPedConfigFlag(GetPlayerPed(-1), 100, true)
            SetPedMovementClipset(GetPlayerPed(-1), "MOVE_M@DRUNK@SLIGHTLYDRUNK", 1.0)
        end
    end
    if IsPedRunning(PlayerPedId()) then
        SetPedToRagdoll(PlayerPedId(), math.random(1000, 3000), math.random(1000, 3000), 3, false, false, false)
    end
end

local function Lsd3()
    local startStamina = 30
    while startStamina > 0 do
        Wait(1000)
        startStamina -= 1
        RestorePlayerStamina(PlayerId(), 1.0)
        if math.random(1, 100) < 51 then
            SetFlash(0, 0, 500, 7000, 500)
            ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.08)
            SetFlash(0, 0, 500, 7000, 500)
            SetFlash(0, 0, 500, 7000, 500)
            ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.08)
            SetWeatherTypePersist("HALLOWEEN")
            SetWeatherTypeNowPersist("HALLOWEEN")
            SetWeatherTypeOvertimePersist("HALLOWEEN", 1000000)
            SetWeatherTypeNow("HALLOWEEN")
            SetOverrideWeather("HALLOWEEN")
            SetTimecycleModifier("spectator3")	
            SetTimecycleModifier("spectator5")
            SetTimecycleModifier("BikerFilter")
            SetTimecycleModifier("PPFilter")
            SetPedMotionBlur(GetPlayerPed(-1), true)
            ForcePedMotionState(GetPlayerPed(-1), -1115154469, 1, 1, 0)
            if not HasAnimSetLoaded("MOVE_M@DRUNK@VERYDRUNK") then
                RequestAnimSet("MOVE_M@DRUNK@VERYDRUNK")
                while not HasAnimSetLoaded("MOVE_M@DRUNK@VERYDRUNK") do
                    Citizen.Wait(0)
                end
            end
        
            SetPedIsDrunk(GetPlayerPed(-1), true)
            ShakeGameplayCam("DRUNK_SHAKE", 1.0)
            SetPedConfigFlag(GetPlayerPed(-1), 100, true)
            SetPedMovementClipset(GetPlayerPed(-1), "MOVE_M@DRUNK@VERYDRUNK", 1.0)
        end
    end
    if IsPedRunning(PlayerPedId()) then
        SetPedToRagdoll(PlayerPedId(), math.random(1000, 3000), math.random(1000, 3000), 3, false, false, false)
    end
end

local function EndEffect()
    ResetPlayerStamina(PlayerId(), 1.0)
    SetCamEffect(0)
    ClearTimecycleModifier()
    ClearWeatherTypePersist()
    ClearPedTasks(GetPlayerPed(-1))
    SetPedIsDrunk(GetPlayerPed(-1), false)
    ResetPedMovementClipset(GetPlayerPed(-1))
    SetPedMotionBlur(GetPlayerPed(-1), false)
    ShakeGameplayCam("DRUNK_SHAKE", 0.0)
    SetPedConfigFlag(GetPlayerPed(-1), 100, false)
end



RegisterNetEvent('consumables:client:lsdtab1', function()
    QBCore.Functions.Progressbar("use_lsd", Lang:t('consumables.lsd_progress'), 3000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = "mp_suicide",
        anim = "pill",
        flags = 49,
    }, {}, {}, function() -- Done
        StopAnimTask(PlayerPedId(), "mp_suicide", "pill", 1.0)
        TriggerServerEvent("consumables:server:useLSD1")
        TriggerEvent("evidence:client:SetStatus", "widepupils", Config.Time)
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["lsd1"], "remove")
        Lsd1()
        Citizen.Wait(Config.Time)
        EndEffect()
    end, function() -- Cancel
        StopAnimTask(PlayerPedId(), "mp_suicide", "pill", 1.0)
        QBCore.Functions.Notify(Lang:t('consumables.canceled'), "error")
    end)
end)

RegisterNetEvent('consumables:client:lsdtab2', function()
    QBCore.Functions.Progressbar("use_lsd", Lang:t('consumables.lsd_progress'), 3000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = "mp_suicide",
        anim = "pill",
        flags = 49,
    }, {}, {}, function() -- Done
        StopAnimTask(PlayerPedId(), "mp_suicide", "pill", 1.0)
        TriggerServerEvent("consumables:server:useLSD2")
        TriggerEvent("evidence:client:SetStatus", "widepupils", Config.Time)
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["lsd2"], "remove")
        Lsd2()
        Citizen.Wait(Config.Time)
        EndEffect()
    end, function() -- Cancel
        StopAnimTask(PlayerPedId(), "mp_suicide", "pill", 1.0)
        QBCore.Functions.Notify(Lang:t('consumables.canceled'), "error")
    end)
end)

RegisterNetEvent('consumables:client:lsdtab3', function()
    QBCore.Functions.Progressbar("use_lsd", Lang:t('consumables.lsd_progress'), 3000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = "mp_suicide",
        anim = "pill",
        flags = 49,
    }, {}, {}, function() -- Done
        StopAnimTask(PlayerPedId(), "mp_suicide", "pill", 1.0)
        TriggerServerEvent("consumables:server:useLSD3")
        TriggerEvent("evidence:client:SetStatus", "widepupils", Config.Time)
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["lsd3"], "remove")
        Lsd3()
        Citizen.Wait(Config.Time)
        EndEffect()
    end, function() -- Cancel
        StopAnimTask(PlayerPedId(), "mp_suicide", "pill", 1.0)
        QBCore.Functions.Notify(Lang:t('consumables.canceled'), "error")
    end)
end)
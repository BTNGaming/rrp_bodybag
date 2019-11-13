--[[

RRP_BODYBAG
Version: 0.1.1

By: BTNGaming
Special Thanks to: Deviljin112 ( https://github.com/Deviljin112 ) Helping fix the bodybag delete issues, and optimization.
And also to: bzndk ( https://github.com/benzon ) Helping fix the original code to create the bodybag upon /command

Github: https://github.com/BTNGaming

Demo Video: https://streamable.com/2krfp

Instructions: POLICE or EMS use /bodybag to place a bodybag on the dead player.
If there are MULTIPLE dead players close to you, You can use /bodybag ID to bag the proper player.

FEEL FREE TO EDIT THE CODE FOR PERSONAL USE!
PLEASE DO NOT SHARE AS OWN WORK
DO NOT SELL THIS WORK

-= PERSONAL USE ONLY =-

]]--

ESX = nil

local PlayerData = {}

local bodyBag = nil

local attached = false

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj)ESX = obj end)
        Citizen.Wait(0)
    end
    
    while ESX.GetPlayerData().job == nil do
        Citizen.Wait(10)
    end
    
    PlayerData = ESX.GetPlayerData()
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
    PlayerData = xPlayer
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
    PlayerData.job = job
end)

RegisterCommand("bodybag", function(source, args, rawCommand)
    
    PlayerData = ESX.GetPlayerData()

    -- Job Check = You can change to whatever you like or use or take out everything in ( ) if you dont want it to be job specific.
    if PlayerData.job ~= nil and (PlayerData.job.name == 'police' or PlayerData.job.name == 'ambulance') then

        local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
        local targetPed = GetPlayerPed(closestPlayer)

        if closestPlayer ~= -1 and closestDistance <= 3.0 and IsEntityDead(targetPed) then

            TriggerServerEvent('DRP_BODYBAG:Trigger', GetPlayerServerId(closestPlayer))
        end
    end
end, false)

function PutInBodybag()

    local playerPed = PlayerPedId()
    local playerCoords = GetEntityCoords(playerPed)
    local playerPed = PlayerPedId()
    
    deadCheck = IsEntityDead(playerPed)

    if deadCheck and not attached then
        SetEntityVisible(playerPed, false, false)
        
        -- Requesting Model to be loaded = Change to another if you want a different bag model.
        RequestModel("xm_prop_body_bag")

        -- Remember to change this one to the same as above.
        while not HasModelLoaded("xm_prop_body_bag") do
            Citizen.Wait(1)
        end

        -- And here lol.
        bodyBag = CreateObject(`xm_prop_body_bag`, playerCoords.x, playerCoords.y, playerCoords.z, true, true, true)

        -- You can always alter the positioning of the bag so its flush and clean when spawned.
        AttachEntityToEntity(bodyBag, playerPed, 0, -0.2, 0.75, -0.2, 0.0, 0.0, 0.0, false, false, false, false, 20, false)
        attached = true

        -- Here you can add a client sided notification when player is put in a bag
    end
end

RegisterNetEvent('DRP_BODYBAG:PutInBag')
AddEventHandler('DRP_BODYBAG:PutInBag', PutInBodybag)


Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
        local playerPed = PlayerPedId()
        
        deadCheck = IsEntityDead(playerPed)

        if not deadCheck and attached then

            DetachEntity(playerPed, true, false)
            SetEntityVisible(playerPed, true, true)

            SetEntityAsMissionEntity(bodyBag, false, false)
            SetEntityVisible(bodybag, false)
            SetModelAsNoLongerNeeded(bodyBag)
            
            DeleteObject(bodyBag)
            DeleteEntity(bodyBag)

            bodyBag = nil
            attached = false

            -- Here you can add a client sided notification when player is removed from a bag
        end

        -- 1,000 tick delay = How often the script checks if player is alive, change to your liking
        -- Higher value = Less often (Lighter on PC)
        -- Lower value = More often (Tougher on PC)
        Citizen.Wait(1000)

    end
end)
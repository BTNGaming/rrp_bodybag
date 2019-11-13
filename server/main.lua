RegisterServerEvent('RRP_BODYBAG:Trigger')
AddEventHandler('RRP_BODYBAG:Trigger', function(target)
    TriggerClientEvent('RRP_BODYBAG:PutInBag', target)
    -- Trigger a notification if you wish to have one
end)
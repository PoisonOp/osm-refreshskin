QBCore = nil

Citizen.CreateThread(function() 
  while true do
    Citizen.Wait(1)
    if QBCore == nil then
      TriggerEvent('QBCore:GetObject', function(obj) QBCore = obj end) 
      Citizen.Wait(200)
    end
  end
end)
----------------------------------------------------------------------------------------------------

-- Command /reloadskin
RegisterCommand("reloadskin", function(source, args, rawCommand)
  reloadSkin()
end)

-- Command /rskin
RegisterCommand("rskin", function(source, args, rawCommand)
  reloadSkin()
end)

function reloadSkin()
  local model = nil
       
  model = GetHashKey("mp_m_freemode_01")

  RequestModel(model)

  SetPlayerModel(PlayerId(), model)
  SetModelAsNoLongerNeeded(model)

  TriggerServerEvent("qb-clothes:loadPlayerSkin")
end

Citizen.CreateThread(function()
    for _, script in pairs(Config.ScriptsToRestart) do
        Citizen.CreateThread(function()
            while true do
                Citizen.Wait(script.interval * 60000) -- Convert minutes to milliseconds

                if Config.Debug then
                    print("^3[Script Restarter]^0 Restarting script: " .. script.name)
                end

                ExecuteCommand("stop " .. script.name)
                Citizen.Wait(2000) -- Wait 2 seconds before restarting
                ExecuteCommand("start " .. script.name)
            end
        end)
    end
end)

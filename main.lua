-- only load everything from github

Config.Map = "nanskip.wm_room"

Client.OnStart = function()
    githubScriptsCount = 0
    loadGitHub()

    Camera:SetParent(nil)
end

Client.Tick = function(dt)
    deltaTime = 62/(1/dt)
    if githubScriptsCount == 2 then
        githubScriptsCount = nil

        start()
    elseif githubScriptsCount == nil then
        tick()
    end
end

-- load everything
loadGitHub = function()
    loadFromGitHub("https://raw.githubusercontent.com/Nanskipp/work-more/main/scripts/start.lua",
    function(obj)
        start = obj -- set this as start function
        Camera:SetParent(World)
        start()
    end)
    loadFromGitHub("https://raw.githubusercontent.com/Nanskipp/work-more/main/scripts/tick.lua",
    function(obj)
        tick = obj -- set this as tick function
    end)
    loadFromGitHub("https://raw.githubusercontent.com/Nanskipp/work-more/main/scripts/workers.lua",
    function(obj)
        workers = obj()
    end)
end

-- loading function
loadFromGitHub = function(url, callback)
    HTTP:Get(url, function(res)
        if res.StatusCode ~= 200 then
            print("Error on github loading. Code: " .. res.StatusCode)
            return
        end
        if Player.Username == "nanskip" then 
            print("Loaded: " .. url)
        end
        local obj = load(res.Body:ToString(), nil, "bt", _ENV)

        githubScriptsCount = githubScriptsCount + 1
        callback(obj)
        end)
end
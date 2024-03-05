
local workers = {}

workers.create = function(config)
    local defaultConfig = {
        name = "nanskip",
        room = 1,
        position = {2, 2},
        table = "kooow.cardboard_box_long"
    }

    local worker = Object()
    worker:SetParent(World)
    Object:Load("kooow.cardboard_box_long", function(obj)
        worker:AddChild(obj)
        worker.table = worker:GetChild(1)
        worker.table.Position = worker.Position + Number3(10, 0, 0)
    end)

    worker.Position.X = Map.Scale.X * (Map.Width/2 + (config.position[1] or defaultConfig.position[1]))
    worker.Position.Y = Map.Scale.Y * (Map.Height/2)
    worker.Position.Z = Map.Scale.Z * (Map.Depth/2 + (config.position[2] or defaultConfig.position[2]))
    
    return worker
end

return workers
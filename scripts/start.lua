
-- This is start function, better set everything that must be started once only here.

-- camera config
Screen.DidResize = function()
    Camera:SetModeFree()
    Camera.Position = Number3(Map.Width*Map.Scale.X/2, Map.Height*Map.Scale.Y/2, Map.Depth*Map.Scale.Z/2)
    Camera.Rotation = Rotation(1, 3.14, 0)
    Camera.Far = 10000
    Camera.FOV = 5 - (Screen.Height/Screen.Width)
    Camera.Position = Camera.Position + Camera.Backward*1000
end

-- AMBIENCE SETUP (begin) --

require("ambience"):set({
	sky = {
		skyColor = Color(0,168,255),
		horizonColor = Color(137,222,229),
		abyssColor = Color(76,144,255),
		lightColor = Color(142,180,204),
		lightIntensity = 0.600000,
	},
	fog = {
		color = Color(19,159,204),
		near = 6000,
		far = 7000,
		lightAbsorbtion = 0.400000,
	},
	sun = {
		color = Color(255,247,204),
		intensity = 1.000000,
		rotation = Number3(1.061161, 3.089219, 0.000000),
	},
	ambient = {
		skyLightFactor = 0.100000,
		dirLightFactor = 0.200000,
	}
})

-- AMBIENCE SETUP (end) --

Config = {}

Config.PolyZones = {
	--Name: tuner_1 | 2022-10-19T11:50:35Z
	[1] = BoxZone:Create(vector3(-313.2, -124.8, 38.96), 8, 4, {
	  name="tuner_1",
	  heading= 250.01,
	  minZ = 37.96,
	  maxZ = 40.96,
	  data = { event = "TunerShop", ZoneName = 'Zone1' },
	  debugPoly=false
	}),
--[[
	--Name: tuner_2 | 2022-10-19T11:50:56Z
	[2] = BoxZone:Create(vector3(-333.16, -132.76, 39.08), 5, 6, {
	  name="tuner_2",
	  heading= 160.01,
	  minZ = 28.56,
	  maxZ = 34.17,
	  data = { event = "TunerShop", ZoneName = 'Zone2' },
	  debugPoly=false
	}),


	--Name: tuner_3 | 2022-10-19T11:51:16Z
	[3] = BoxZone:Create(vector3(897.88, -2126.75, 29.89), 5, 6, {
	  name="tuner_3",
	  heading= 175.01,
	  minZ = 28.56,
	  maxZ = 34.17,
	  data = { event = "TunerShop", ZoneName = 'Zone3' },
	  debugPoly=false
	}),

	--Name: tuner_4 | 2022-10-19T11:51:35Z
	[4] = BoxZone:Create(vector3(909.14, -2127.82, 29.89), 5, 6, {
	  name="tuner_4",
	  heading= 175.01,
	  minZ = 28.56,
	  maxZ = 34.17,
	  data = { event = "TunerShop", ZoneName = 'Zone4' },
	  debugPoly=false
	})
	--]]

--[[
	-- Tuner Shop --
	[1] = BoxZone:Create(vector3(976.95, -2125.0, 29.89), 5.8, 7.4, {
		name = "tuner_1",
		heading = 0,
		minZ = 29.89,
		maxZ = 36.17,
		data = { event = "TunerShop", ZoneName = 'Zone1' }
	}),
	[2] = BoxZone:Create(vector3(953.51, -952.55, 39.0), 5.8, 7.4, {
		name = "tuner_2",
		heading = 0,
		minZ = 29.89,
		maxZ = 36.17,
		data = { event = "TunerShop", ZoneName = 'Zone2' }
	}),
	[3] = BoxZone:Create(vector3(952.79, -944.33, 39.0), 5.8, 7.8, {
		name = "tuner_3",
		heading = 0,
		minZ = 29.89,
		maxZ = 36.17,
		data = { event = "TunerShop", ZoneName = 'Zone3' }
	}),
	[4] = BoxZone:Create(vector3(916.25, -952.51, 39.0), 6.6, 3.6, {
		name = "tuner_4",
		heading = 0,
		minZ = 29.89,
		maxZ = 36.17,
		data = { event = "TunerShop", ZoneName = 'Zone4' }
	})

	-- [13] = PolyZone:Create({
	-- 	vector2(1982.4438476562, 2843.5192871094),
	-- 	vector2(1970.4560546875, 2800.2409667969),
	-- 	vector2(1970.7430419922, 2765.8562011719),
	-- 	vector2(2014.3454589844, 2700.1000976562),
	-- 	vector2(2025.9434814453, 2708.3820800781),
	-- 	vector2(2044.3101806641, 2721.7595214844),
	-- 	vector2(2061.2722167969, 2734.6748046875),
	-- 	vector2(2067.4304199219, 2743.8498535156),
	-- 	vector2(2068.3508300781, 2754.7739257812),
	-- 	vector2(2048.193359375, 2819.291015625),
	-- 	vector2(2041.1141357422, 2840.4123535156),
	-- 	vector2(2038.0430908203, 2850.6799316406),
	-- 	vector2(2034.2271728516, 2862.3193359375),
	-- 	vector2(2021.8316650391, 2862.7185058594),
	-- 	vector2(2011.8032226562, 2858.9311523438),
	-- 	vector2(2001.0737304688, 2855.380859375),
	-- 	vector2(1990.4056396484, 2851.6157226562)
	-- }, {
	-- 	name = "paintball",
	-- 	minZ = 45.249996185303,
	-- 	maxZ = 100.617336273193,
	-- 	data = { event = "PaintballZone"}
	-- }),
	--]]
}
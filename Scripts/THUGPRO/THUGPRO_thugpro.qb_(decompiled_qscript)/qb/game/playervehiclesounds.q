
PlayerVehicleSoundGlobalParameters = { 
	idle_engine_effective_speed_factor = 0.50000000000 
	effective_speed_lerp_rate = 3 
	effective_speed_adjust_up_rate = 12 
	effective_speed_adjust_down_rate = 6 
	gear_shift_min_vol_factor = 0.30000001192 
	gear_shift_vol_adjustment_duration = 200 
	engine_rpm_lerp_rate = 12 
	engine_airborne_delay = 0.03999999911 
	tire_slip_lerp_rate = 10 
	collision_cutoff_factor = 0.10000000149 
	collision_mute_delay = 800 
	CAGEngineSound = CarLoop 
	CAGTireSound = Vehicle_Tire_Loop 
	CAGCollideSound = { BonkMetal_11 minVol = 100 maxVel = 300 minPitch = 80 maxPitch = 120 } 
} 
PlayerVehicleSounds = { 
	Default = { 
		EngineSound = CarLoop 
		MinEngineVol = 150 
		MaxEngineVol = 180 
		MinEnginePitch = 60 
		MaxEnginePitch = 120 
		MinEngineRPM = 0 
		MaxEngineRPM = 100 
		Gears = [ 
			{ 
				DownshiftPoint = 0 
				UpshiftPoint = 50 
				BottomRPM = 60 
				TopRPM = 100 
			} 
			{ 
				DownshiftPoint = 10 
				UpshiftPoint = 75 
				BottomRPM = 40 
				TopRPM = 100 
			} 
			{ 
				DownshiftPoint = 50 
				UpshiftPoint = 100 
				BottomRPM = 20 
				TopRPM = 100 
			} 
		] 
		TireSound = Vehicle_Tire_Loop 
		FullTireSlipVelocity = 1500 
		MinTireVol = 0 
		MaxTireVol = 300 
		MinTirePitch = 80 
		MaxTirePitch = 100 
		CollideSound = { BonkMetal_11 minVol = 100 maxVel = 300 minPitch = 80 maxPitch = 120 } 
		FullCollision = 5000 
	} 
	SE_ATV = { 
		EngineSound = CarLoop 
		MinEngineVol = 150 
		MaxEngineVol = 180 
		MinEnginePitch = 60 
		MaxEnginePitch = 120 
		MinEngineRPM = 0 
		MaxEngineRPM = 100 
		Gears = [ 
			{ 
				DownshiftPoint = 0 
				UpshiftPoint = 50 
				BottomRPM = 60 
				TopRPM = 100 
			} 
			{ 
				DownshiftPoint = 10 
				UpshiftPoint = 75 
				BottomRPM = 40 
				TopRPM = 100 
			} 
			{ 
				DownshiftPoint = 50 
				UpshiftPoint = 100 
				BottomRPM = 20 
				TopRPM = 100 
			} 
		] 
		TireSound = Vehicle_Tire_Loop 
		FullTireSlipVelocity = 1500 
		MinTireVol = 0 
		MaxTireVol = 300 
		MinTirePitch = 80 
		MaxTirePitch = 100 
		CollideSound = { BonkMetal_11 minVol = 100 maxVel = 300 minPitch = 80 maxPitch = 120 } 
		FullCollision = 5000 
	} 
	NY_JunkCar = { 
		EngineSound = CarLoop 
		MinEngineVol = 150 
		MaxEngineVol = 180 
		MinEnginePitch = 60 
		MaxEnginePitch = 120 
		MinEngineRPM = 0 
		MaxEngineRPM = 100 
		Gears = [ 
			{ 
				DownshiftPoint = 0 
				UpshiftPoint = 50 
				BottomRPM = 60 
				TopRPM = 100 
			} 
			{ 
				DownshiftPoint = 10 
				UpshiftPoint = 75 
				BottomRPM = 40 
				TopRPM = 100 
			} 
			{ 
				DownshiftPoint = 50 
				UpshiftPoint = 100 
				BottomRPM = 20 
				TopRPM = 100 
			} 
		] 
		TireSound = Vehicle_Tire_Loop 
		FullTireSlipVelocity = 1500 
		MinTireVol = 0 
		MaxTireVol = 300 
		MinTirePitch = 80 
		MaxTirePitch = 100 
		CollideSound = { BonkMetal_11 minVol = 100 maxVel = 300 minPitch = 80 maxPitch = 120 } 
		FullCollision = 5000 
	} 
	BO_Gurney = { 
		EngineSound = ShoppingCartLoop 
		MinEngineVol = 0 
		MaxEngineVol = 80 
		MinEnginePitch = 80 
		MaxEnginePitch = 120 
		MinEngineRPM = 0 
		MaxEngineRPM = 100 
		Gears = [ 
			{ 
				DownshiftPoint = 0 
				UpshiftPoint = 35 
				BottomRPM = 0 
				TopRPM = 100 
			} 
		] 
		TireSound = Silent_Vehicle_Tire_Loop 
		FullTireSlipVelocity = 1500 
		MinTireVol = 0 
		MaxTireVol = 1 
		MinTirePitch = 80 
		MaxTirePitch = 100 
		CollideSound = { BonkMetal_11 minVol = 100 maxVel = 300 minPitch = 80 maxPitch = 120 } 
		FullCollision = 200 
	} 
	BO_Segway = { 
		EngineSound = SK6_BO_JesseRide_Loop 
		MinEngineVol = 150 
		MaxEngineVol = 180 
		MinEnginePitch = 60 
		MaxEnginePitch = 120 
		MinEngineRPM = 0 
		MaxEngineRPM = 100 
		Gears = [ 
			{ 
				DownshiftPoint = 0 
				UpshiftPoint = 100 
				BottomRPM = 0 
				TopRPM = 100 
			} 
		] 
		TireSound = Silent_Vehicle_Tire_Loop 
		FullTireSlipVelocity = 1500 
		MinTireVol = 0 
		MaxTireVol = 300 
		MinTirePitch = 80 
		MaxTirePitch = 100 
		CollideSound = { BonkMetal_11 minVol = 100 maxVel = 300 minPitch = 80 maxPitch = 120 } 
		FullCollision = 5000 
	} 
	BA_SteveOBull = { 
		EngineSound = SK6_BA_SteveOElecLoop 
		MinEngineVol = 0 
		MaxEngineVol = 70 
		MinEnginePitch = 50 
		MaxEnginePitch = 120 
		MinEngineRPM = 0 
		MaxEngineRPM = 100 
		Gears = [ 
			{ 
				DownshiftPoint = 0 
				UpshiftPoint = 100 
				BottomRPM = 0 
				TopRPM = 100 
			} 
		] 
		TireSound = Silent_Vehicle_Tire_Loop 
		FullTireSlipVelocity = 1500 
		MinTireVol = 0 
		MaxTireVol = 300 
		MinTirePitch = 80 
		MaxTirePitch = 100 
		CollideSound = { BonkMetal_11 minVol = 100 maxVel = 300 minPitch = 80 maxPitch = 120 } 
		FullCollision = 5000 
	} 
	BE_PaulieWheelchair = { 
		EngineSound = SK6_BE_Paulie_Loop 
		MinEngineVol = 0 
		MaxEngineVol = 70 
		MinEnginePitch = 50 
		MaxEnginePitch = 120 
		MinEngineRPM = 0 
		MaxEngineRPM = 100 
		Gears = [ 
			{ 
				DownshiftPoint = 0 
				UpshiftPoint = 100 
				BottomRPM = 0 
				TopRPM = 100 
			} 
		] 
		TireSound = Silent_Vehicle_Tire_Loop 
		FullTireSlipVelocity = 1500 
		MinTireVol = 0 
		MaxTireVol = 300 
		MinTirePitch = 80 
		MaxTirePitch = 100 
		CollideSound = { BonkMetal_11 minVol = 100 maxVel = 300 minPitch = 80 maxPitch = 120 } 
		FullCollision = 5000 
	} 
	AU_AborigineCart = { 
		EngineSound = AU_KartLoop 
		MinEngineVol = 90 
		MaxEngineVol = 120 
		MinEnginePitch = 60 
		MaxEnginePitch = 120 
		MinEngineRPM = 0 
		MaxEngineRPM = 100 
		Gears = [ 
			{ 
				DownshiftPoint = 0 
				UpshiftPoint = 100 
				BottomRPM = 0 
				TopRPM = 100 
			} 
		] 
		TireSound = Silent_Vehicle_Tire_Loop 
		FullTireSlipVelocity = 1500 
		MinTireVol = 0 
		MaxTireVol = 300 
		MinTirePitch = 80 
		MaxTirePitch = 100 
		CollideSound = { BonkMetal_11 minVol = 100 maxVel = 300 minPitch = 80 maxPitch = 120 } 
		FullCollision = 5000 
	} 
	NO_Trike = { 
		EngineSound = SK6_NO_TrikeSqueak 
		MinEngineVol = 0 
		MaxEngineVol = 70 
		MinEnginePitch = 50 
		MaxEnginePitch = 120 
		MinEngineRPM = 0 
		MaxEngineRPM = 100 
		Gears = [ 
			{ 
				DownshiftPoint = 0 
				UpshiftPoint = 100 
				BottomRPM = 0 
				TopRPM = 100 
			} 
		] 
		TireSound = Silent_Vehicle_Tire_Loop 
		FullTireSlipVelocity = 1500 
		MinTireVol = 0 
		MaxTireVol = 300 
		MinTirePitch = 80 
		MaxTirePitch = 100 
		CollideSound = { BonkMetal_11 minVol = 100 maxVel = 300 minPitch = 80 maxPitch = 120 } 
		FullCollision = 5000 
	} 
} 

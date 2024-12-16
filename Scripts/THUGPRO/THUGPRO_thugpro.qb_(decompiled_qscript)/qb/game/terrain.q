
SCRIPT SetTerrainParticleProperties 
ENDSCRIPT

Terrain_Types = [ 
	{ checksum = TERRAIN_DEFAULT desc = "Default" } 
	{ checksum = TERRAIN_CONCSMOOTH desc = "ConcSmooth" } 
	{ checksum = TERRAIN_CONCROUGH desc = "ConcRough" } 
	{ checksum = TERRAIN_METALSMOOTH desc = "MetalSmooth" } 
	{ checksum = TERRAIN_METALROUGH desc = "MetalRough" } 
	{ checksum = TERRAIN_METALCORRUGATED desc = "MetalCorrugated" } 
	{ checksum = TERRAIN_METALGRATING desc = "MetalGrating" } 
	{ checksum = TERRAIN_METALTIN desc = "MetalTin" } 
	{ checksum = TERRAIN_WOOD desc = "Wood" } 
	{ checksum = TERRAIN_WOODMASONITE desc = "WoodMasonite" } 
	{ checksum = TERRAIN_WOODPLYWOOD desc = "WoodPlywood" } 
	{ checksum = TERRAIN_WOODFLIMSY desc = "WoodFlimsy" } 
	{ checksum = TERRAIN_WOODSHINGLE desc = "WoodShingle" } 
	{ checksum = TERRAIN_WOODPIER desc = "WoodPier" } 
	{ checksum = TERRAIN_BRICK desc = "Brick" } 
	{ checksum = TERRAIN_TILE desc = "Tile" } 
	{ checksum = TERRAIN_ASPHALT desc = "Asphalt" } 
	{ checksum = TERRAIN_ROCK desc = "Rock" } 
	{ checksum = TERRAIN_GRAVEL desc = "Gravel" } 
	{ checksum = TERRAIN_SIDEWALK desc = "Sidewalk" } 
	{ checksum = TERRAIN_GRASS desc = "Grass" } 
	{ checksum = TERRAIN_GRASSDRIED desc = "GrassDried" } 
	{ checksum = TERRAIN_DIRT desc = "Dirt" } 
	{ checksum = TERRAIN_DIRTPACKED desc = "DirtPacked" } 
	{ checksum = TERRAIN_WATER desc = "Water" } 
	{ checksum = TERRAIN_ICE desc = "Ice" } 
	{ checksum = TERRAIN_SNOW desc = "Snow" } 
	{ checksum = TERRAIN_SAND desc = "Sand" } 
	{ checksum = TERRAIN_PLEXIGLASS desc = "Plexiglass" } 
	{ checksum = TERRAIN_FIBERGLASS desc = "Fiberglass" } 
	{ checksum = TERRAIN_CARPET desc = "Carpet" } 
	{ checksum = TERRAIN_CONVEYOR desc = "Conveyor" } 
	{ checksum = TERRAIN_CHAINLINK desc = "Chainlink" } 
	{ checksum = TERRAIN_METALFUTURE desc = "MetalFuture" } 
	{ checksum = TERRAIN_GENERIC1 desc = "Generic1" } 
	{ checksum = TERRAIN_GENERIC2 desc = "Generic2" } 
	{ checksum = TERRAIN_WHEELS desc = "Wheels" } 
	{ checksum = TERRAIN_WETCONC desc = "WetConc" } 
	{ checksum = TERRAIN_METALFENCE desc = "MetalFence" } 
	{ checksum = TERRAIN_GRINDTRAIN desc = "GrindTrain" } 
	{ checksum = TERRAIN_GRINDROPE desc = "GrindRope" } 
	{ checksum = TERRAIN_GRINDWIRE desc = "Grindwire" } 
	{ checksum = TERRAIN_GRINDCONC desc = "GrindConc" } 
	{ checksum = TERRAIN_GRINDROUNDMETALPOLE desc = "GrindRoundMetalPole" } 
	{ checksum = TERRAIN_GRINDCHAINLINK desc = "GrindChainLink" } 
	{ checksum = TERRAIN_GRINDMETAL desc = "GrindMetal" } 
	{ checksum = TERRAIN_GRINDWOODRAILING desc = "GrindWoodRailing" } 
	{ checksum = TERRAIN_GRINDWOODLOG desc = "GrindWoodLog" } 
	{ checksum = TERRAIN_GRINDWOOD desc = "GrindWood" } 
	{ checksum = TERRAIN_GRINDPLASTIC desc = "GrindPlastic" } 
	{ checksum = TERRAIN_GRINDELECTRICWIRE desc = "GrindElectricWire" } 
	{ checksum = TERRAIN_GRINDCABLE desc = "GrindCable" } 
	{ checksum = TERRAIN_GRINDCHAIN desc = "GrindChain" } 
	{ checksum = TERRAIN_GRINDPLASTICBARRIER desc = "GrindPlasticBarrier" } 
	{ checksum = TERRAIN_GRINDNEONLIGHT desc = "GrindNeonLight" } 
	{ checksum = TERRAIN_GRINDGLASSMONSTER desc = "GrindGlassMonster" } 
	{ checksum = TERRAIN_GRINDBANYONTREE desc = "GrindBAnyOnTree" } 
	{ checksum = TERRAIN_GRINDBRASSRAIL desc = "GrindBrassRail" } 
	{ checksum = TERRAIN_GRINDRUSTYRAIL desc = "GrindRustyRail" } 
	{ checksum = TERRAIN_GRINDCATWALK desc = "GrindCatwalk" } 
	{ checksum = TERRAIN_GRINDTANKTURRET desc = "GrindTankTurret" } 
] 
Terrain_Actions = [ 
	{ type = TABLE_WHEELROLL action = TA_ROLL } 
	{ type = TABLE_GRIND action = TA_GRIND } 
	{ type = TABLE_JUMP action = TA_OLLIE } 
	{ type = TABLE_LAND action = TA_LAND } 
	{ type = TABLE_BONK action = TA_BONK } 
	{ type = TABLE_GRINDJUMP action = TA_GRINDJUMP } 
	{ type = TABLE_GRINDLAND action = TA_GRINDLAND } 
	{ type = TABLE_SLIDE action = TA_SLIDE } 
	{ type = TABLE_SLIDEJUMP action = TA_SLIDEJUMP } 
	{ type = TABLE_SLIDELAND action = TA_SLIDELAND } 
	{ type = TABLE_CESS action = TA_REVERT } 
] 
RollConcSmoothValues = { maxPitch = 120 minPitch = 30 } 
RollConcRoughValues = { maxPitch = 120 minPitch = 10 } 
OllieConcValues = { maxPitch = 105 minPitch = 98 maxVol = 175 minVol = 120 } 
SlideConcValues = { maxPitch = 135 minPitch = 100 maxVol = 130 minVol = 80 } 
LandConcValues = { maxVol = 135 minVol = 70 } 
BonkConcValues = { maxVol = 140 minVol = 70 } 
RollMetalSmoothValues = { maxPitch = 120 minPitch = 30 } 
RollMetalRoughValues = { maxPitch = 120 minPitch = 30 maxVol = 100 minVol = 20 } 
RollMetalCorrugatedValues = { maxPitch = 250 minPitch = 150 } 
OllieMetalValues = { maxVol = 140 minVol = 70 } 
LandMetalValues = { maxPitch = 100 minPitch = 100 maxVol = 100 minVol = 40 } 
BonkMetalValues = { maxVol = 100 minVol = 30 } 
RollWoodValues = { maxPitch = 120 minPitch = 30 maxVol = 100 minVol = 20 } 
RollWoodShingleValues = { maxPitch = 80 minPitch = 20 maxVol = 100 minVol = 20 } 
OllieWoodValues = { maxVol = 120 minVol = 60 } 
LandWoodValues = { maxVol = 120 minVol = 60 } 
BonkWoodValues = { maxVol = 90 minVol = 30 } 
SCRIPT SetTerrainDefault 
	LoadTerrainSounds terrain = TERRAIN_DEFAULT 
ENDSCRIPT

SCRIPT SetTerrainConcSmooth 
	LoadTerrainSounds terrain = TERRAIN_CONCSMOOTH 
ENDSCRIPT

SCRIPT SetTerrainMetalSmooth 
	LoadTerrainSounds terrain = TERRAIN_METALSMOOTH 
ENDSCRIPT

SCRIPT SetTerrainWood 
	LoadTerrainSounds terrain = TERRAIN_WOOD 
ENDSCRIPT

SCRIPT SetTerrainGrindWire 
	LoadTerrainSounds terrain = TERRAIN_GRINDWIRE 
ENDSCRIPT

SCRIPT SetTerrainConcRough 
	LoadTerrainSounds terrain = TERRAIN_CONCROUGH 
ENDSCRIPT

SCRIPT SetTerrainMetalRough 
	LoadTerrainSounds terrain = TERRAIN_METALROUGH 
ENDSCRIPT

SCRIPT SetTerrainMetalCorrugated 
	LoadTerrainSounds terrain = TERRAIN_METALCORRUGATED 
ENDSCRIPT

SCRIPT SetTerrainMetalGrating 
	LoadTerrainSounds terrain = TERRAIN_METALGRATING 
ENDSCRIPT

SCRIPT SetTerrainMetalTin 
	LoadTerrainSounds terrain = TERRAIN_METALTIN 
ENDSCRIPT

SCRIPT SetTerrainWoodMasonite 
	LoadTerrainSounds terrain = TERRAIN_WOODMASONITE 
ENDSCRIPT

SCRIPT SetTerrainWoodPlywood 
	LoadTerrainSounds terrain = TERRAIN_WOODPLYWOOD 
ENDSCRIPT

SCRIPT SetTerrainWoodFlimsy 
	LoadTerrainSounds terrain = TERRAIN_WOODFLIMSY 
ENDSCRIPT

SCRIPT SetTerrainWoodShingle 
	LoadTerrainSounds terrain = TERRAIN_WOODSHINGLE 
ENDSCRIPT

SCRIPT SetTerrainWoodPier 
	LoadTerrainSounds terrain = TERRAIN_WOODPIER 
ENDSCRIPT

SCRIPT SetTerrainBrick 
	LoadTerrainSounds terrain = TERRAIN_BRICK 
ENDSCRIPT

SCRIPT SetTerrainTile 
	LoadTerrainSounds terrain = TERRAIN_TILE 
ENDSCRIPT

SCRIPT SetTerrainAsphalt 
	LoadTerrainSounds terrain = TERRAIN_ASPHALT 
ENDSCRIPT

SCRIPT SetTerrainRock 
	LoadTerrainSounds terrain = TERRAIN_ROCK 
ENDSCRIPT

SCRIPT SetTerrainGravel 
	LoadTerrainSounds terrain = TERRAIN_GRAVEL 
ENDSCRIPT

SCRIPT SetTerrainSidewalk 
	LoadTerrainSounds terrain = TERRAIN_SIDEWALK 
ENDSCRIPT

SCRIPT SetTerrainGrass 
	LoadTerrainSounds terrain = TERRAIN_GRASS 
ENDSCRIPT

SCRIPT SetTerrainGrassDried 
	LoadTerrainSounds terrain = TERRAIN_GRASSDRIED 
ENDSCRIPT

SCRIPT SetTerrainDirt 
	LoadTerrainSounds terrain = TERRAIN_DIRT 
ENDSCRIPT

SCRIPT SetTerrainDirtPacked 
	LoadTerrainSounds terrain = TERRAIN_DIRTPACKED 
ENDSCRIPT

SCRIPT SetTerrainWater 
	LoadTerrainSounds terrain = TERRAIN_WATER 
ENDSCRIPT

SCRIPT SetTerrainIce 
	LoadTerrainSounds terrain = TERRAIN_ICE 
ENDSCRIPT

SCRIPT SetTerrainSnow 
	LoadTerrainSounds terrain = TERRAIN_SNOW 
ENDSCRIPT

SCRIPT SetTerrainSand 
	LoadTerrainSounds terrain = TERRAIN_SAND 
ENDSCRIPT

SCRIPT SetTerrainPlexiglass 
	LoadTerrainSounds terrain = TERRAIN_PLEXIGLASS 
ENDSCRIPT

SCRIPT SetTerrainFiberglass 
	LoadTerrainSounds terrain = TERRAIN_FIBERGLASS 
ENDSCRIPT

SCRIPT SetTerrainCarpet 
	LoadTerrainSounds terrain = TERRAIN_CARPET 
ENDSCRIPT

SCRIPT SetTerrainConveyor 
	LoadTerrainSounds terrain = TERRAIN_CONVEYOR 
ENDSCRIPT

SCRIPT SetTerrainChainlink 
	LoadTerrainSounds terrain = TERRAIN_CHAINLINK 
ENDSCRIPT

SCRIPT SetTerrainMetalFuture 
	LoadTerrainSounds terrain = TERRAIN_METALFUTURE 
ENDSCRIPT

SCRIPT SetTerrainGeneric1 
	LoadTerrainSounds terrain = TERRAIN_GENERIC1 
ENDSCRIPT

SCRIPT SetTerrainGeneric2 
	LoadTerrainSounds terrain = TERRAIN_GENERIC2 
ENDSCRIPT

SCRIPT SetTerrainWetConc 
	LoadTerrainSounds terrain = TERRAIN_WETCONC 
ENDSCRIPT

SCRIPT SetTerrainMetalFence 
	LoadTerrainSounds terrain = TERRAIN_METALFENCE 
ENDSCRIPT

SCRIPT SetTerrainGarbage 
	LoadTerrainSounds terrain = TERRAIN_DIRT 
ENDSCRIPT

SCRIPT SetTerrainGlass 
	LoadTerrainSounds terrain = TERRAIN_PLEXIGLASS 
ENDSCRIPT

SCRIPT SetTerrainBrickLarge 
	LoadTerrainSounds terrain = TERRAIN_BRICK 
ENDSCRIPT

SCRIPT SetTerrainGrindTrain 
	LoadTerrainSounds terrain = TERRAIN_GRINDTRAIN 
ENDSCRIPT

SCRIPT SetTerrainGrindRope 
	LoadTerrainSounds terrain = TERRAIN_GRINDROPE 
ENDSCRIPT

SCRIPT SetTerrainGrindConc 
	LoadTerrainSounds terrain = TERRAIN_GRINDCONC 
ENDSCRIPT

SCRIPT SetTerrainGrindRoundMetalPole 
	LoadTerrainSounds terrain = TERRAIN_GRINDROUNDMETALPOLE 
ENDSCRIPT

SCRIPT SetTerrainGrindChainLink 
	LoadTerrainSounds terrain = TERRAIN_GRINDCHAINLINK 
ENDSCRIPT

SCRIPT SetTerrainGrindMetal 
	LoadTerrainSounds terrain = TERRAIN_GRINDMETAL 
ENDSCRIPT

SCRIPT SetTerrainGrindWoodRailing 
	LoadTerrainSounds terrain = TERRAIN_GRINDWOODRAILING 
ENDSCRIPT

SCRIPT SetTerrainGrindWoodLog 
	LoadTerrainSounds terrain = TERRAIN_GRINDWOODLOG 
ENDSCRIPT

SCRIPT SetTerrainGrindWood 
	LoadTerrainSounds terrain = TERRAIN_GRINDWOOD 
ENDSCRIPT

SCRIPT SetTerrainGrindPlastic 
	LoadTerrainSounds terrain = TERRAIN_GRINDPLASTIC 
ENDSCRIPT

SCRIPT SetTerrainGrindElectricWire 
	LoadTerrainSounds terrain = TERRAIN_GRINDELECTRICWIRE 
ENDSCRIPT

SCRIPT SetTerrainGrindCable 
	LoadTerrainSounds terrain = TERRAIN_GRINDCABLE 
ENDSCRIPT

SCRIPT SetTerrainGrindChain 
	LoadTerrainSounds terrain = TERRAIN_GRINDCHAIN 
ENDSCRIPT

SCRIPT SetTerrainGrindPlasticBarrier 
	LoadTerrainSounds terrain = TERRAIN_GRINDPLASTICBARRIER 
ENDSCRIPT

SCRIPT SetTerrainGrindNeonLight 
	LoadTerrainSounds terrain = TERRAIN_GRINDNEONLIGHT 
ENDSCRIPT

SCRIPT SetTerrainGrindGlassMonster 
	LoadTerrainSounds terrain = TERRAIN_GRINDGLASSMONSTER 
ENDSCRIPT

SCRIPT SetTerrainGrindBanyonTree 
	LoadTerrainSounds terrain = TERRAIN_GRINDBANYONTREE 
ENDSCRIPT

SCRIPT SetTerrainGrindBrassRail 
	LoadTerrainSounds terrain = TERRAIN_GRINDBRASSRAIL 
ENDSCRIPT

SCRIPT SetTerrainGrindRustyRail 
	LoadTerrainSounds terrain = TERRAIN_GRINDRUSTYRAIL 
ENDSCRIPT

SCRIPT SetTerrainGrindCatwalk 
	LoadTerrainSounds terrain = TERRAIN_GRINDCATWALK 
ENDSCRIPT

SCRIPT SetTerrainGrindTankTurret 
	LoadTerrainSounds terrain = TERRAIN_GRINDTANKTURRET 
ENDSCRIPT

TA_REVERT_CONC_UG2_CHANCE = 1 
TA_REVERT_CONC_AW_CHANCE = 0 
TA_LAND_CONC_UG2_CHANCE = 1 
TA_LAND_CONC_AW_CHANCE = 0 
TA_OLLIE_CONC_UG2_CHANCE = 8 
TA_OLLIE_CONC19_UG2_CHANCE = 1 
TA_OLLIE_CONC_AW_CHANCE = 0 
TA_OLLIE_CONC19_AW_CHANCE = 0 
TA_GRIND_SFX_THUG_CHANCE = 1 
TA_GRIND_SFX_CLASSIC_CHANCE = 0 
STANDARD_TERRAIN_DEFAULT = { 
	SoundActions = { 
		TA_ROLL = { sound = "Terrains\\RollConcSmooth02" maxPitch = 120 minPitch = 80 loadVol = 100 } 
		TA_GRIND = [ 
			{ 
				soundAction = [ 
					{ chance = TA_GRIND_SFX_THUG_CHANCE sound = "Terrains\\GrindMetal02" maxPitch = 115 minPitch = 100 maxVol = 120 minVol = 20 } 
					{ chance = TA_GRIND_SFX_CLASSIC_CHANCE sound = "Terrains\\GrindMetal" } 
				] 
			} 
		] 
		TA_OLLIE = [ 
			{ 
				soundAction = [ 
					{ chance = TA_OLLIE_CONC_UG2_CHANCE sound = "Terrains\\OllieConc" OllieConcValues } 
					{ chance = TA_OLLIE_CONC19_UG2_CHANCE sound = "Terrains\\OllieConc19" OllieConcValues } 
					{ chance = TA_OLLIE_CONC_AW_CHANCE sound = "Terrains\\OllieConc_THAW" OllieConcValues } 
					{ chance = TA_OLLIE_CONC19_AW_CHANCE sound = "Terrains\\OllieConc19_THAW" OllieConcValues } 
				] 
			} 
		] 
		TA_LAND = [ { 
				soundAction = [ 
					{ chance = TA_LAND_CONC_UG2_CHANCE sound = "Terrains\\LandConc" LandConcValues } 
					{ chance = TA_LAND_CONC_AW_CHANCE sound = "Terrains\\LandConc_THAW" LandConcValues } 
				] 
		} ] 
		TA_BONK = [ { 
				soundAction = [ 
					{ chance = TA_LAND_CONC_UG2_CHANCE sound = "Terrains\\LandConc" LandConcValues } 
					{ chance = TA_LAND_CONC_AW_CHANCE sound = "Terrains\\LandConc_THAW" LandConcValues } 
				] 
		} ] 
		TA_GRINDJUMP = [ 
			{ 
				soundAction = [ 
					{ chance = TA_GRIND_SFX_THUG_CHANCE sound = "Terrains\\GrindMetalOff02" maxVol = 90 minVol = 70 } 
					{ chance = TA_GRIND_SFX_CLASSIC_CHANCE sound = "Terrains\\GrindMetalOff" } 
				] 
			} 
		] 
		TA_GRINDLAND = [ 
			{ 
				useUpTo = 30 
				soundAction = [ 
					{ chance = TA_GRIND_SFX_THUG_CHANCE sound = "Terrains\\GrindMetalOn08" maxVol = 150 minVol = 100 maxPitch = 120 minPitch = 100 } 
					{ chance = TA_GRIND_SFX_CLASSIC_CHANCE sound = "Terrains\\GrindMetalOn" } 
				] 
			} 
			{ 
				soundAction = [ 
					{ chance = TA_GRIND_SFX_THUG_CHANCE sound = "Terrains\\GrindMetalOn02" maxVol = 150 minVol = 100 maxPitch = 120 minPitch = 100 } 
					{ chance = TA_GRIND_SFX_CLASSIC_CHANCE sound = "Terrains\\GrindMetalOn" } 
				] 
			} 
		] 
		TA_SLIDE = [ 
			{ 
				soundAction = [ 
					{ chance = TA_GRIND_SFX_THUG_CHANCE sound = "Terrains\\SlideMetal02" maxPitch = 140 minPitch = 100 maxVol = 100 minVol = 20 } 
					{ chance = TA_GRIND_SFX_CLASSIC_CHANCE sound = "Terrains\\SlideMetal" } 
				] 
			} 
		] 
		TA_NATAS = { sound = "Terrains\\SlideMetal02" maxPitch = 140 minPitch = 100 maxVol = 100 minVol = 20 } 
		TA_SLIDEJUMP = [ 
			{ 
				soundAction = [ 
					{ chance = TA_GRIND_SFX_THUG_CHANCE sound = "Terrains\\GrindMetalOff02" maxVol = 90 minVol = 70 } 
					{ chance = TA_GRIND_SFX_CLASSIC_CHANCE sound = "Terrains\\GrindMetalOff" } 
				] 
			} 
		] 
		TA_SLIDELAND = [ 
			{ 
				useUpTo = 30 
				soundAction = [ 
					{ chance = TA_GRIND_SFX_THUG_CHANCE sound = "Terrains\\GrindMetalOn08" maxVol = 150 minVol = 100 maxPitch = 120 minPitch = 100 } 
					{ chance = TA_GRIND_SFX_CLASSIC_CHANCE sound = "Terrains\\GrindMetalOn" } 
				] 
			} 
			{ 
				soundAction = [ 
					{ chance = TA_GRIND_SFX_THUG_CHANCE sound = "Terrains\\GrindMetalOn02" maxVol = 150 minVol = 100 maxPitch = 120 minPitch = 100 } 
					{ chance = TA_GRIND_SFX_CLASSIC_CHANCE sound = "Terrains\\GrindMetalOn" } 
				] 
			} 
		] 
		TA_REVERT = [ { 
				soundAction = [ 
					{ chance = TA_REVERT_CONC_UG2_CHANCE sound = "Skater\\RevertConc" loadVol = 180 } 
					{ chance = TA_REVERT_CONC_AW_CHANCE sound = "Terrains\\RevertConc_THAW" loadVol = 180 } 
				] 
		} ] 
	} 
	TreadActions = { 
		SkaterGrindParticleParms = [ 
			{ skater_sparks_params } 
		] 
	} 
} 
STANDARD_TERRAIN_CONCSMOOTH = { 
	SoundActions = { 
		TA_ROLL = { sound = "Terrains\\RollConcSmooth02" maxPitch = 120 minPitch = 80 loadVol = 100 } 
		TA_GRIND = [ 
			{ 
				soundAction = [ 
					{ chance = TA_GRIND_SFX_THUG_CHANCE sound = "Terrains\\GrindConc04" maxPitch = 90 minPitch = 60 maxVol = 100 minVol = 20 } 
					{ chance = TA_GRIND_SFX_CLASSIC_CHANCE sound = "Terrains\\GrindConc" } 
				] 
			} 
		] 
		TA_LAND = [ { 
				soundAction = [ 
					{ chance = TA_LAND_CONC_UG2_CHANCE sound = "Terrains\\LandConc" LandConcValues } 
					{ chance = TA_LAND_CONC_AW_CHANCE sound = "Terrains\\LandConc_THAW" LandConcValues } 
				] 
		} ] 
		TA_BONK = [ { 
				soundAction = [ 
					{ chance = TA_LAND_CONC_UG2_CHANCE sound = "Terrains\\LandConc" LandConcValues } 
					{ chance = TA_LAND_CONC_AW_CHANCE sound = "Terrains\\LandConc_THAW" LandConcValues } 
				] 
		} ] 
		TA_GRINDJUMP = [ 
			{ 
				soundAction = [ 
					{ chance = TA_OLLIE_CONC_UG2_CHANCE sound = "Terrains\\OllieConc" OllieConcValues } 
					{ chance = TA_OLLIE_CONC19_UG2_CHANCE sound = "Terrains\\OllieConc19" OllieConcValues } 
					{ chance = TA_OLLIE_CONC_AW_CHANCE sound = "Terrains\\OllieConc_THAW" OllieConcValues } 
					{ chance = TA_OLLIE_CONC19_AW_CHANCE sound = "Terrains\\OllieConc19_THAW" OllieConcValues } 
				] 
			} 
		] 
		TA_GRINDLAND = [ { 
				soundAction = [ 
					{ chance = TA_LAND_CONC_UG2_CHANCE sound = "Terrains\\LandConc" LandConcValues } 
					{ chance = TA_LAND_CONC_AW_CHANCE sound = "Terrains\\LandConc_THAW" LandConcValues } 
				] 
		} ] 
		TA_SLIDE = [ 
			{ 
				soundAction = [ 
					{ chance = TA_GRIND_SFX_THUG_CHANCE sound = "Terrains\\SlideConc14" SlideConcValues } 
					{ chance = TA_GRIND_SFX_CLASSIC_CHANCE sound = "Terrains\\SlideConc" } 
				] 
			} 
		] 
		TA_SLIDEJUMP = [ 
			{ 
				soundAction = [ 
					{ chance = TA_OLLIE_CONC_UG2_CHANCE sound = "Terrains\\OllieConc" OllieConcValues } 
					{ chance = TA_OLLIE_CONC19_UG2_CHANCE sound = "Terrains\\OllieConc19" OllieConcValues } 
					{ chance = TA_OLLIE_CONC_AW_CHANCE sound = "Terrains\\OllieConc_THAW" OllieConcValues } 
					{ chance = TA_OLLIE_CONC19_AW_CHANCE sound = "Terrains\\OllieConc19_THAW" OllieConcValues } 
				] 
			} 
		] 
		TA_SLIDELAND = [ { 
				soundAction = [ 
					{ chance = TA_LAND_CONC_UG2_CHANCE sound = "Terrains\\LandConc" LandConcValues } 
					{ chance = TA_LAND_CONC_AW_CHANCE sound = "Terrains\\LandConc_THAW" LandConcValues } 
				] 
		} ] 
		TA_REVERT = [ { 
				soundAction = [ 
					{ chance = TA_REVERT_CONC_UG2_CHANCE sound = "Skater\\RevertConc" loadVol = 180 } 
					{ chance = TA_REVERT_CONC_AW_CHANCE sound = "Terrains\\RevertConc_THAW" loadVol = 180 } 
				] 
		} ] 
	} 
	TreadActions = { 
		SkaterGrindParticleParms = [ 
			{ skater_sparks_params } 
			{ APM_Debris01_particle_params } 
		] 
		SkaterSlideParticleParms = [ 
		] 
	} 
} 
STANDARD_TERRAIN_CONCROUGH = { 
	SoundActions = { 
		TA_ROLL = { sound = "Terrains\\RollConcRough" maxPitch = 120 minPitch = 50 loadVol = 70 } 
		TA_GRIND = [ 
			{ 
				soundAction = [ 
					{ chance = TA_GRIND_SFX_THUG_CHANCE sound = "Terrains\\GrindConc04" maxPitch = 90 minPitch = 60 maxVol = 100 minVol = 20 } 
					{ chance = TA_GRIND_SFX_CLASSIC_CHANCE sound = "Terrains\\GrindConc" } 
				] 
			} 
		] 
		TA_LAND = [ { 
				soundAction = [ 
					{ chance = TA_LAND_CONC_UG2_CHANCE sound = "Terrains\\LandConc" LandConcValues } 
					{ chance = TA_LAND_CONC_AW_CHANCE sound = "Terrains\\LandConc_THAW" LandConcValues } 
				] 
		} ] 
		TA_BONK = [ { 
				soundAction = [ 
					{ chance = TA_LAND_CONC_UG2_CHANCE sound = "Terrains\\LandConc" LandConcValues } 
					{ chance = TA_LAND_CONC_AW_CHANCE sound = "Terrains\\LandConc_THAW" LandConcValues } 
				] 
		} ] 
		TA_GRINDJUMP = [ 
			{ 
				soundAction = [ 
					{ chance = TA_OLLIE_CONC_UG2_CHANCE sound = "Terrains\\OllieConc" OllieConcValues } 
					{ chance = TA_OLLIE_CONC19_UG2_CHANCE sound = "Terrains\\OllieConc19" OllieConcValues } 
					{ chance = TA_OLLIE_CONC_AW_CHANCE sound = "Terrains\\OllieConc_THAW" OllieConcValues } 
					{ chance = TA_OLLIE_CONC19_AW_CHANCE sound = "Terrains\\OllieConc19_THAW" OllieConcValues } 
				] 
			} 
		] 
		TA_GRINDLAND = [ { 
				soundAction = [ 
					{ chance = TA_LAND_CONC_UG2_CHANCE sound = "Terrains\\LandConc" LandConcValues } 
					{ chance = TA_LAND_CONC_AW_CHANCE sound = "Terrains\\LandConc_THAW" LandConcValues } 
				] 
		} ] 
		TA_SLIDE = [ 
			{ 
				soundAction = [ 
					{ chance = TA_GRIND_SFX_THUG_CHANCE sound = "Terrains\\SlideConc14" SlideConcValues } 
					{ chance = TA_GRIND_SFX_CLASSIC_CHANCE sound = "Terrains\\SlideConc" } 
				] 
			} 
		] 
		TA_SLIDEJUMP = [ 
			{ 
				soundAction = [ 
					{ chance = TA_OLLIE_CONC_UG2_CHANCE sound = "Terrains\\OllieConc" OllieConcValues } 
					{ chance = TA_OLLIE_CONC19_UG2_CHANCE sound = "Terrains\\OllieConc19" OllieConcValues } 
					{ chance = TA_OLLIE_CONC_AW_CHANCE sound = "Terrains\\OllieConc_THAW" OllieConcValues } 
					{ chance = TA_OLLIE_CONC19_AW_CHANCE sound = "Terrains\\OllieConc19_THAW" OllieConcValues } 
				] 
			} 
		] 
		TA_SLIDELAND = [ { 
				soundAction = [ 
					{ chance = TA_LAND_CONC_UG2_CHANCE sound = "Terrains\\LandConc" LandConcValues } 
					{ chance = TA_LAND_CONC_AW_CHANCE sound = "Terrains\\LandConc_THAW" LandConcValues } 
				] 
		} ] 
		TA_REVERT = [ { 
				soundAction = [ 
					{ chance = TA_REVERT_CONC_UG2_CHANCE sound = "Skater\\RevertConc" loadVol = 180 } 
					{ chance = TA_REVERT_CONC_AW_CHANCE sound = "Terrains\\RevertConc_THAW" loadVol = 180 } 
				] 
		} ] 
	} 
	TreadActions = { 
		SkaterGrindParticleParms = [ 
			{ skater_sparks_params } 
			{ APM_Debris01_particle_params } 
		] 
		SkaterSlideParticleParms = [ 
		] 
	} 
} 
STANDARD_TERRAIN_BRICK = { 
	SoundActions = { 
		TA_ROLL = { sound = "Terrains\\RollBrick" loadVol = 80 maxPitch = 120 minPitch = 80 maxVol = 100 minVol = 20 } 
		TA_GRIND = [ 
			{ 
				soundAction = [ 
					{ chance = TA_GRIND_SFX_THUG_CHANCE sound = "Terrains\\GrindConc04" maxPitch = 90 minPitch = 60 maxVol = 100 minVol = 20 } 
					{ chance = TA_GRIND_SFX_CLASSIC_CHANCE sound = "Terrains\\GrindConc" } 
				] 
			} 
		] 
		TA_LAND = [ { 
				soundAction = [ 
					{ chance = TA_LAND_CONC_UG2_CHANCE sound = "Terrains\\LandConc" LandConcValues } 
					{ chance = TA_LAND_CONC_AW_CHANCE sound = "Terrains\\LandConc_THAW" LandConcValues } 
				] 
		} ] 
		TA_BONK = [ { 
				soundAction = [ 
					{ chance = TA_LAND_CONC_UG2_CHANCE sound = "Terrains\\LandConc" LandConcValues } 
					{ chance = TA_LAND_CONC_AW_CHANCE sound = "Terrains\\LandConc_THAW" LandConcValues } 
				] 
		} ] 
		TA_GRINDJUMP = [ 
			{ 
				soundAction = [ 
					{ chance = TA_OLLIE_CONC_UG2_CHANCE sound = "Terrains\\OllieConc" OllieConcValues } 
					{ chance = TA_OLLIE_CONC19_UG2_CHANCE sound = "Terrains\\OllieConc19" OllieConcValues } 
					{ chance = TA_OLLIE_CONC_AW_CHANCE sound = "Terrains\\OllieConc_THAW" OllieConcValues } 
					{ chance = TA_OLLIE_CONC19_AW_CHANCE sound = "Terrains\\OllieConc19_THAW" OllieConcValues } 
				] 
			} 
		] 
		TA_GRINDLAND = [ { 
				soundAction = [ 
					{ chance = TA_LAND_CONC_UG2_CHANCE sound = "Terrains\\LandConc" LandConcValues } 
					{ chance = TA_LAND_CONC_AW_CHANCE sound = "Terrains\\LandConc_THAW" LandConcValues } 
				] 
		} ] 
		TA_SLIDE = [ 
			{ 
				soundAction = [ 
					{ chance = TA_GRIND_SFX_THUG_CHANCE sound = "Terrains\\SlideConc14" SlideConcValues } 
					{ chance = TA_GRIND_SFX_CLASSIC_CHANCE sound = "Terrains\\SlideConc" } 
				] 
			} 
		] 
		TA_SLIDEJUMP = [ 
			{ 
				soundAction = [ 
					{ chance = TA_OLLIE_CONC_UG2_CHANCE sound = "Terrains\\OllieConc" OllieConcValues } 
					{ chance = TA_OLLIE_CONC19_UG2_CHANCE sound = "Terrains\\OllieConc19" OllieConcValues } 
					{ chance = TA_OLLIE_CONC_AW_CHANCE sound = "Terrains\\OllieConc_THAW" OllieConcValues } 
					{ chance = TA_OLLIE_CONC19_AW_CHANCE sound = "Terrains\\OllieConc19_THAW" OllieConcValues } 
				] 
			} 
		] 
		TA_SLIDELAND = [ { 
				soundAction = [ 
					{ chance = TA_LAND_CONC_UG2_CHANCE sound = "Terrains\\LandConc" LandConcValues } 
					{ chance = TA_LAND_CONC_AW_CHANCE sound = "Terrains\\LandConc_THAW" LandConcValues } 
				] 
		} ] 
		TA_REVERT = [ { 
				soundAction = [ 
					{ chance = TA_REVERT_CONC_UG2_CHANCE sound = "Skater\\RevertConc" loadVol = 180 } 
					{ chance = TA_REVERT_CONC_AW_CHANCE sound = "Terrains\\RevertConc_THAW" loadVol = 180 } 
				] 
		} ] 
	} 
} 
STANDARD_TERRAIN_ASPHALT = { 
	SoundActions = { 
		TA_ROLL = { sound = "Terrains\\RollAsphalt" maxPitch = 120 minPitch = 80 } 
		TA_GRIND = [ 
			{ 
				soundAction = [ 
					{ chance = TA_GRIND_SFX_THUG_CHANCE sound = "Terrains\\GrindConc04" maxPitch = 90 minPitch = 60 maxVol = 100 minVol = 20 } 
					{ chance = TA_GRIND_SFX_CLASSIC_CHANCE sound = "Terrains\\GrindConc" } 
				] 
			} 
		] 
		TA_LAND = [ { 
				soundAction = [ 
					{ chance = TA_LAND_CONC_UG2_CHANCE sound = "Terrains\\LandConc" LandConcValues } 
					{ chance = TA_LAND_CONC_AW_CHANCE sound = "Terrains\\LandConc_THAW" LandConcValues } 
				] 
		} ] 
		TA_BONK = [ { 
				soundAction = [ 
					{ chance = TA_LAND_CONC_UG2_CHANCE sound = "Terrains\\LandConc" LandConcValues } 
					{ chance = TA_LAND_CONC_AW_CHANCE sound = "Terrains\\LandConc_THAW" LandConcValues } 
				] 
		} ] 
		TA_GRINDJUMP = [ 
			{ 
				soundAction = [ 
					{ chance = TA_OLLIE_CONC_UG2_CHANCE sound = "Terrains\\OllieConc" OllieConcValues } 
					{ chance = TA_OLLIE_CONC19_UG2_CHANCE sound = "Terrains\\OllieConc19" OllieConcValues } 
					{ chance = TA_OLLIE_CONC_AW_CHANCE sound = "Terrains\\OllieConc_THAW" OllieConcValues } 
					{ chance = TA_OLLIE_CONC19_AW_CHANCE sound = "Terrains\\OllieConc19_THAW" OllieConcValues } 
				] 
			} 
		] 
		TA_GRINDLAND = [ { 
				soundAction = [ 
					{ chance = TA_LAND_CONC_UG2_CHANCE sound = "Terrains\\LandConc" LandConcValues } 
					{ chance = TA_LAND_CONC_AW_CHANCE sound = "Terrains\\LandConc_THAW" LandConcValues } 
				] 
		} ] 
		TA_SLIDE = [ 
			{ 
				soundAction = [ 
					{ chance = TA_GRIND_SFX_THUG_CHANCE sound = "Terrains\\SlideConc14" SlideConcValues } 
					{ chance = TA_GRIND_SFX_CLASSIC_CHANCE sound = "Terrains\\SlideConc" } 
				] 
			} 
		] 
		TA_SLIDEJUMP = [ 
			{ 
				soundAction = [ 
					{ chance = TA_OLLIE_CONC_UG2_CHANCE sound = "Terrains\\OllieConc" OllieConcValues } 
					{ chance = TA_OLLIE_CONC19_UG2_CHANCE sound = "Terrains\\OllieConc19" OllieConcValues } 
					{ chance = TA_OLLIE_CONC_AW_CHANCE sound = "Terrains\\OllieConc_THAW" OllieConcValues } 
					{ chance = TA_OLLIE_CONC19_AW_CHANCE sound = "Terrains\\OllieConc19_THAW" OllieConcValues } 
				] 
			} 
		] 
		TA_SLIDELAND = [ { 
				soundAction = [ 
					{ chance = TA_LAND_CONC_UG2_CHANCE sound = "Terrains\\LandConc" LandConcValues } 
					{ chance = TA_LAND_CONC_AW_CHANCE sound = "Terrains\\LandConc_THAW" LandConcValues } 
				] 
		} ] 
		TA_REVERT = [ { 
				soundAction = [ 
					{ chance = TA_REVERT_CONC_UG2_CHANCE sound = "Skater\\RevertConc" loadVol = 180 } 
					{ chance = TA_REVERT_CONC_AW_CHANCE sound = "Terrains\\RevertConc_THAW" loadVol = 180 } 
				] 
		} ] 
	} 
} 
STANDARD_TERRAIN_SIDEWALK = { 
	SoundActions = { 
		TA_ROLL = { sound = "Terrains\\RollSidewalk" loadVol = 100 maxPitch = 90 minPitch = 50 maxVol = 100 minVol = 20 } 
		TA_GRIND = [ 
			{ 
				soundAction = [ 
					{ chance = TA_GRIND_SFX_THUG_CHANCE sound = "Terrains\\GrindConc04" maxPitch = 90 minPitch = 60 maxVol = 100 minVol = 20 } 
					{ chance = TA_GRIND_SFX_CLASSIC_CHANCE sound = "Terrains\\GrindConc" } 
				] 
			} 
		] 
		TA_LAND = [ { 
				soundAction = [ 
					{ chance = TA_LAND_CONC_UG2_CHANCE sound = "Terrains\\LandConc" LandConcValues } 
					{ chance = TA_LAND_CONC_AW_CHANCE sound = "Terrains\\LandConc_THAW" LandConcValues } 
				] 
		} ] 
		TA_BONK = [ { 
				soundAction = [ 
					{ chance = TA_LAND_CONC_UG2_CHANCE sound = "Terrains\\LandConc" LandConcValues } 
					{ chance = TA_LAND_CONC_AW_CHANCE sound = "Terrains\\LandConc_THAW" LandConcValues } 
				] 
		} ] 
		TA_GRINDJUMP = [ 
			{ 
				soundAction = [ 
					{ chance = TA_OLLIE_CONC_UG2_CHANCE sound = "Terrains\\OllieConc" OllieConcValues } 
					{ chance = TA_OLLIE_CONC19_UG2_CHANCE sound = "Terrains\\OllieConc19" OllieConcValues } 
					{ chance = TA_OLLIE_CONC_AW_CHANCE sound = "Terrains\\OllieConc_THAW" OllieConcValues } 
					{ chance = TA_OLLIE_CONC19_AW_CHANCE sound = "Terrains\\OllieConc19_THAW" OllieConcValues } 
				] 
			} 
		] 
		TA_GRINDLAND = [ { 
				soundAction = [ 
					{ chance = TA_LAND_CONC_UG2_CHANCE sound = "Terrains\\LandConc" LandConcValues } 
					{ chance = TA_LAND_CONC_AW_CHANCE sound = "Terrains\\LandConc_THAW" LandConcValues } 
				] 
		} ] 
		TA_SLIDE = [ 
			{ 
				soundAction = [ 
					{ chance = TA_GRIND_SFX_THUG_CHANCE sound = "Terrains\\SlideConc14" SlideConcValues } 
					{ chance = TA_GRIND_SFX_CLASSIC_CHANCE sound = "Terrains\\SlideConc" } 
				] 
			} 
		] 
		TA_SLIDEJUMP = [ 
			{ 
				soundAction = [ 
					{ chance = TA_OLLIE_CONC_UG2_CHANCE sound = "Terrains\\OllieConc" OllieConcValues } 
					{ chance = TA_OLLIE_CONC19_UG2_CHANCE sound = "Terrains\\OllieConc19" OllieConcValues } 
					{ chance = TA_OLLIE_CONC_AW_CHANCE sound = "Terrains\\OllieConc_THAW" OllieConcValues } 
					{ chance = TA_OLLIE_CONC19_AW_CHANCE sound = "Terrains\\OllieConc19_THAW" OllieConcValues } 
				] 
			} 
		] 
		TA_SLIDELAND = [ { 
				soundAction = [ 
					{ chance = TA_LAND_CONC_UG2_CHANCE sound = "Terrains\\LandConc" LandConcValues } 
					{ chance = TA_LAND_CONC_AW_CHANCE sound = "Terrains\\LandConc_THAW" LandConcValues } 
				] 
		} ] 
		TA_REVERT = [ { 
				soundAction = [ 
					{ chance = TA_REVERT_CONC_UG2_CHANCE sound = "Skater\\RevertConc" loadVol = 180 } 
					{ chance = TA_REVERT_CONC_AW_CHANCE sound = "Terrains\\RevertConc_THAW" loadVol = 180 } 
				] 
		} ] 
	} 
} 
STANDARD_TERRAIN_WETCONC = { 
	SoundActions = { 
		TA_ROLL = { sound = "Terrains\\RollWetConc_11" loadVol = 70 maxPitch = 120 minPitch = 50 } 
		TA_GRIND = [ 
			{ 
				soundAction = [ 
					{ chance = TA_GRIND_SFX_THUG_CHANCE sound = "Terrains\\GrindConc04" maxPitch = 90 minPitch = 60 maxVol = 100 minVol = 20 } 
					{ chance = TA_GRIND_SFX_CLASSIC_CHANCE sound = "Terrains\\GrindConc" } 
				] 
			} 
		] 
		TA_LAND = { sound = "Terrains\\LandWater" LandConcValues loadVol = 100 } 
		TA_BONK = [ { 
				soundAction = [ 
					{ chance = TA_LAND_CONC_UG2_CHANCE sound = "Terrains\\LandConc" LandConcValues } 
					{ chance = TA_LAND_CONC_AW_CHANCE sound = "Terrains\\LandConc_THAW" LandConcValues } 
				] 
		} ] 
		TA_GRINDJUMP = [ 
			{ 
				soundAction = [ 
					{ chance = TA_OLLIE_CONC_UG2_CHANCE sound = "Terrains\\OllieConc" OllieConcValues } 
					{ chance = TA_OLLIE_CONC19_UG2_CHANCE sound = "Terrains\\OllieConc19" OllieConcValues } 
					{ chance = TA_OLLIE_CONC_AW_CHANCE sound = "Terrains\\OllieConc_THAW" OllieConcValues } 
					{ chance = TA_OLLIE_CONC19_AW_CHANCE sound = "Terrains\\OllieConc19_THAW" OllieConcValues } 
				] 
			} 
		] 
		TA_GRINDLAND = [ { 
				soundAction = [ 
					{ chance = TA_LAND_CONC_UG2_CHANCE sound = "Terrains\\LandConc" LandConcValues } 
					{ chance = TA_LAND_CONC_AW_CHANCE sound = "Terrains\\LandConc_THAW" LandConcValues } 
				] 
		} ] 
		TA_SLIDE = [ 
			{ 
				soundAction = [ 
					{ chance = TA_GRIND_SFX_THUG_CHANCE sound = "Terrains\\SlideConc14" SlideConcValues } 
					{ chance = TA_GRIND_SFX_CLASSIC_CHANCE sound = "Terrains\\SlideConc" } 
				] 
			} 
		] 
		TA_SLIDEJUMP = [ 
			{ 
				soundAction = [ 
					{ chance = TA_OLLIE_CONC_UG2_CHANCE sound = "Terrains\\OllieConc" OllieConcValues } 
					{ chance = TA_OLLIE_CONC19_UG2_CHANCE sound = "Terrains\\OllieConc19" OllieConcValues } 
					{ chance = TA_OLLIE_CONC_AW_CHANCE sound = "Terrains\\OllieConc_THAW" OllieConcValues } 
					{ chance = TA_OLLIE_CONC19_AW_CHANCE sound = "Terrains\\OllieConc19_THAW" OllieConcValues } 
				] 
			} 
		] 
		TA_SLIDELAND = [ { 
				soundAction = [ 
					{ chance = TA_LAND_CONC_UG2_CHANCE sound = "Terrains\\LandConc" LandConcValues } 
					{ chance = TA_LAND_CONC_AW_CHANCE sound = "Terrains\\LandConc_THAW" LandConcValues } 
				] 
		} ] 
		TA_REVERT = [ { 
				soundAction = [ 
					{ chance = TA_REVERT_CONC_UG2_CHANCE sound = "Skater\\RevertConc" loadVol = 180 } 
					{ chance = TA_REVERT_CONC_AW_CHANCE sound = "Terrains\\RevertConc_THAW" loadVol = 180 } 
				] 
		} ] 
	} 
} 
STANDARD_TERRAIN_METALSMOOTH = { 
	SoundActions = { 
		TA_ROLL = { sound = "Terrains\\RollMetalSmooth_11" maxPitch = 120 minPitch = 50 maxVol = 100 minVol = 20 } 
		TA_OLLIE = { sound = "Terrains\\OllieMetal" loadVol = 120 OllieMetalValues } 
		TA_LAND = { sound = "Terrains\\LandMetal" LandMetalValues } 
		TA_BONK = { sound = "Terrains\\BonkMetal_11" BonkMetalValues } 
		TA_REVERT = { sound = "Skater\\RevertMetal" loadVol = 200 } 
	} 
} 
STANDARD_TERRAIN_METALROUGH = { 
	SoundActions = { 
		TA_ROLL = { sound = "Terrains\\RollMetalRough_11" maxPitch = 120 minPitch = 50 maxVol = 100 minVol = 20 } 
		TA_OLLIE = { sound = "Terrains\\OllieMetal" loadVol = 120 OllieMetalValues } 
		TA_LAND = { sound = "Terrains\\LandMetal" LandMetalValues } 
		TA_BONK = { sound = "Terrains\\BonkMetal_11" BonkMetalValues } 
		TA_REVERT = { sound = "Skater\\RevertMetal" loadVol = 200 } 
	} 
} 
STANDARD_TERRAIN_METALCORRUGATED = { 
	SoundActions = { 
		TA_ROLL = { sound = "Terrains\\RollMetalCorrugated_11" maxPitch = 120 minPitch = 50 maxVol = 100 minVol = 20 } 
		TA_OLLIE = { sound = "Terrains\\OllieMetal" loadVol = 120 OllieMetalValues } 
		TA_LAND = { sound = "Terrains\\LandMetal" LandMetalValues } 
		TA_BONK = { sound = "Terrains\\BonkMetal_11" BonkMetalValues } 
		TA_REVERT = { sound = "Skater\\RevertMetal" loadVol = 200 } 
	} 
} 
STANDARD_TERRAIN_METALGRATING = { 
	SoundActions = { 
		TA_ROLL = { sound = "Terrains\\RollMetalGrating_11" maxPitch = 120 minPitch = 50 maxVol = 100 minVol = 20 } 
		TA_OLLIE = { sound = "Terrains\\OllieMetal" loadVol = 120 OllieMetalValues } 
		TA_LAND = { sound = "Terrains\\LandMetal" LandMetalValues } 
		TA_BONK = { sound = "Terrains\\BonkMetal_11" BonkMetalValues } 
		TA_REVERT = { sound = "Skater\\RevertMetal" loadVol = 200 } 
	} 
} 
STANDARD_TERRAIN_METALTIN = { 
	SoundActions = { 
		TA_ROLL = { sound = "Terrains\\RollMetalTin" maxPitch = 120 minPitch = 50 maxVol = 100 minVol = 20 } 
		TA_OLLIE = { sound = "Terrains\\OllieMetal" loadVol = 120 OllieMetalValues } 
		TA_LAND = { sound = "Terrains\\LandMetal" LandMetalValues } 
		TA_BONK = { sound = "Terrains\\BonkMetal_11" BonkMetalValues } 
		TA_REVERT = { sound = "Skater\\RevertMetal" loadVol = 200 } 
	} 
} 
STANDARD_TERRAIN_WOOD = { 
	SoundActions = { 
		TA_ROLL = { sound = "Terrains\\RollWood" loadVol = 50 maxPitch = 120 minPitch = 50 maxVol = 100 minVol = 20 } 
		TA_GRIND = { sound = "Terrains\\GrindWood" maxPitch = 100 minPitch = 60 maxVol = 100 minVol = 20 } 
		TA_OLLIE = { sound = "Terrains\\OllieWood" OllieWoodValues } 
		TA_LAND = { sound = "Terrains\\LandWood" LandWoodValues loadVol = 100 } 
		TA_BONK = { sound = "Terrains\\BonkWood" BonkWoodValues loadVol = 100 } 
		TA_GRINDJUMP = { sound = "Terrains\\OllieWood" OllieWoodValues } 
		TA_GRINDLAND = { sound = "Terrains\\LandWood" LandWoodValues loadVol = 100 } 
		TA_SLIDE = { sound = "Terrains\\SlideWood" pitch = 110 loadVol = 100 maxPitch = 100 minPitch = 60 maxVol = 100 minVol = 20 } 
		TA_SLIDEJUMP = { sound = "Terrains\\OllieWood" OllieWoodValues } 
		TA_SLIDELAND = { sound = "Terrains\\LandWood" LandWoodValues loadVol = 100 } 
		TA_REVERT = { sound = "Skater\\RevertWood" loadVol = 150 } 
	} 
	TreadActions = { 
		SkaterGrindParticleParms = [ 
			{ apm_splinter01_particle_params } 
		] 
		SkaterSlideParticleParms = [ 
			{ apm_splinter01_particle_params } 
		] 
	} 
} 
STANDARD_TERRAIN_WOODMASONITE = { 
	SoundActions = { 
		TA_ROLL = { sound = "Terrains\\RollWoodMasonite" loadVol = 50 maxPitch = 120 minPitch = 50 maxVol = 100 minVol = 20 } 
		TA_OLLIE = { sound = "Terrains\\OllieWood" OllieWoodValues } 
		TA_LAND = { sound = "Terrains\\LandWood" LandWoodValues loadVol = 100 } 
		TA_BONK = { sound = "Terrains\\BonkWood" BonkWoodValues loadVol = 100 } 
		TA_REVERT = { sound = "Skater\\RevertWood" loadVol = 150 } 
	} 
} 
STANDARD_TERRAIN_WOODPLYWOOD = { 
	SoundActions = { 
		TA_ROLL = { sound = "Terrains\\RollWoodPlywood_11" loadVol = 80 maxPitch = 120 minPitch = 80 maxVol = 100 minVol = 20 } 
		TA_OLLIE = { sound = "Terrains\\OllieWood" OllieWoodValues } 
		TA_LAND = { sound = "Terrains\\LandWood" LandWoodValues loadVol = 100 } 
		TA_BONK = { sound = "Terrains\\BonkWood" BonkWoodValues loadVol = 100 } 
		TA_REVERT = { sound = "Skater\\RevertWood" loadVol = 150 } 
	} 
} 
STANDARD_TERRAIN_WOODFLIMSY = { 
	SoundActions = { 
		TA_ROLL = { sound = "Terrains\\RollWoodFlimsy" loadVol = 80 maxPitch = 120 minPitch = 80 maxVol = 100 minVol = 20 } 
		TA_OLLIE = { sound = "Terrains\\OllieWood" OllieWoodValues } 
		TA_LAND = { sound = "Terrains\\LandWood" LandWoodValues loadVol = 100 } 
		TA_BONK = { sound = "Terrains\\BonkWood" BonkWoodValues loadVol = 100 } 
		TA_REVERT = { sound = "Skater\\RevertWood" loadVol = 150 } 
	} 
} 
STANDARD_TERRAIN_WOODSHINGLE = { 
	SoundActions = { 
		TA_ROLL = { sound = "Terrains\\RollWoodShingle" loadVol = 80 maxPitch = 80 minPitch = 50 maxVol = 100 minVol = 20 } 
		TA_OLLIE = { sound = "Terrains\\OllieWood" OllieWoodValues } 
		TA_LAND = { sound = "Terrains\\LandWood" LandWoodValues loadVol = 100 } 
		TA_BONK = { sound = "Terrains\\BonkWood" BonkWoodValues loadVol = 100 } 
		TA_REVERT = { sound = "Skater\\RevertWood" loadVol = 150 } 
	} 
} 
STANDARD_TERRAIN_WOODPIER = { 
	SoundActions = { 
		TA_ROLL = { sound = "Terrains\\RollWoodPier" loadVol = 80 maxPitch = 120 minPitch = 80 maxVol = 100 minVol = 20 } 
		TA_OLLIE = { sound = "Terrains\\OllieWood" OllieWoodValues } 
		TA_LAND = { sound = "Terrains\\LandWood" LandWoodValues loadVol = 100 } 
		TA_BONK = { sound = "Terrains\\BonkWood" BonkWoodValues loadVol = 100 } 
		TA_REVERT = { sound = "Skater\\RevertWood" loadVol = 150 } 
	} 
} 
STANDARD_TERRAIN_ROCK = { 
	SoundActions = { 
		TA_ROLL = { sound = "Terrains\\RollRock" loadVol = 200 maxPitch = 120 minPitch = 80 } 
		TA_OLLIE = [ { 
				soundAction = [ 
					{ chance = TA_OLLIE_CONC_UG2_CHANCE sound = "Terrains\\OllieConc" maxPitch = 100 minPitch = 100 maxVol = 100 minVol = 20 } 
					{ chance = TA_OLLIE_CONC_AW_CHANCE sound = "Terrains\\OllieConc_THAW" maxPitch = 100 minPitch = 100 maxVol = 100 minVol = 20 } 
				] 
		} ] 
		TA_LAND = [ { 
				soundAction = [ 
					{ chance = TA_LAND_CONC_UG2_CHANCE sound = "Terrains\\LandConc" LandConcValues } 
					{ chance = TA_LAND_CONC_AW_CHANCE sound = "Terrains\\LandConc_THAW" LandConcValues } 
				] 
		} ] 
		TA_REVERT = [ { 
				soundAction = [ 
					{ chance = TA_REVERT_CONC_UG2_CHANCE sound = "Skater\\RevertConc" loadVol = 180 } 
					{ chance = TA_REVERT_CONC_AW_CHANCE sound = "Terrains\\RevertConc_THAW" loadVol = 180 } 
				] 
		} ] 
	} 
} 
STANDARD_TERRAIN_GRAVEL = { 
	SoundActions = { 
		TA_ROLL = { sound = "Terrains\\RollGravel" loadVol = 200 maxPitch = 120 minPitch = 80 } 
		TA_OLLIE = [ 
			{ 
				soundAction = [ 
					{ chance = TA_OLLIE_CONC_UG2_CHANCE sound = "Terrains\\OllieConc" OllieConcValues } 
					{ chance = TA_OLLIE_CONC19_UG2_CHANCE sound = "Terrains\\OllieConc19" OllieConcValues } 
					{ chance = TA_OLLIE_CONC_AW_CHANCE sound = "Terrains\\OllieConc_THAW" OllieConcValues } 
					{ chance = TA_OLLIE_CONC19_AW_CHANCE sound = "Terrains\\OllieConc19_THAW" OllieConcValues } 
				] 
			} 
		] 
		TA_LAND = [ { 
				soundAction = [ 
					{ chance = TA_LAND_CONC_UG2_CHANCE sound = "Terrains\\LandConc" LandConcValues } 
					{ chance = TA_LAND_CONC_AW_CHANCE sound = "Terrains\\LandConc_THAW" LandConcValues } 
				] 
		} ] 
		TA_REVERT = [ { 
				soundAction = [ 
					{ chance = TA_REVERT_CONC_UG2_CHANCE sound = "Skater\\RevertConc" loadVol = 180 } 
					{ chance = TA_REVERT_CONC_AW_CHANCE sound = "Terrains\\RevertConc_THAW" loadVol = 180 } 
				] 
		} ] 
	} 
} 
STANDARD_TERRAIN_GRASS = { 
	SoundActions = { 
		TA_ROLL = { sound = "Terrains\\RollGrass" maxPitch = 90 minPitch = 60 maxVol = 100 minVol = 20 } 
		TA_OLLIE = { sound = "Terrains\\LandDirt" maxPitch = 100 minPitch = 100 maxVol = 100 minVol = 20 } 
		TA_LAND = { sound = "Terrains\\LandDirt" maxPitch = 100 minPitch = 100 maxVol = 100 minVol = 20 } 
		TA_REVERT = { sound = "Skater\\RevertGrass" loadVol = 180 } 
	} 
	TreadActions = { 
		SkaterSkatingParticleParms = [ 
			{ apm_grass01_particle_params } 
		] 
	} 
} 
STANDARD_TERRAIN_GRASSDRIED = { 
	SoundActions = { 
		TA_ROLL = { sound = "Terrains\\RollGrassDried" maxPitch = 50 minPitch = 30 maxVol = 100 minVol = 20 } 
		TA_OLLIE = { sound = "Terrains\\LandDirt" maxPitch = 100 minPitch = 100 maxVol = 100 minVol = 20 } 
		TA_LAND = { sound = "Terrains\\LandDirt" maxPitch = 100 minPitch = 100 maxVol = 100 minVol = 20 } 
		TA_REVERT = { sound = "Skater\\RevertGrass" loadVol = 180 } 
	} 
} 
STANDARD_TERRAIN_DIRT = { 
	SoundActions = { 
		TA_ROLL = { sound = "Terrains\\RollDirt" maxPitch = 100 minPitch = 60 maxVol = 100 minVol = 20 } 
		TA_OLLIE = { sound = "Terrains\\LandDirt" maxPitch = 100 minPitch = 100 maxVol = 100 minVol = 20 } 
		TA_LAND = { sound = "Terrains\\LandDirt" maxPitch = 100 minPitch = 100 maxVol = 100 minVol = 20 } 
		TA_REVERT = { sound = "Skater\\RevertDirt" loadVol = 180 } 
	} 
	TreadActions = { 
		SkaterSkatingParticleParms = [ 
			{ apm_dirt_puff01_particle_params } 
		] 
		SkaterStepParticleParms = [ 
			{ apm_dirt_puff02_particle_params } 
		] 
	} 
} 
STANDARD_TERRAIN_DIRTPACKED = { 
	SoundActions = { 
		TA_ROLL = { sound = "Terrains\\RollDirtPacked" loadVol = 75 maxPitch = 100 minPitch = 60 maxVol = 100 minVol = 20 } 
		TA_OLLIE = { sound = "Terrains\\OllieWood" } 
		TA_LAND = { sound = "Terrains\\LandDirt" maxPitch = 100 minPitch = 100 maxVol = 100 minVol = 20 } 
		TA_REVERT = { sound = "Skater\\RevertDirt" loadVol = 180 } 
	} 
} 
STANDARD_TERRAIN_WATER = { 
	SoundActions = { 
		TA_ROLL = { sound = "Terrains\\RollWater_11" loadVol = 150 maxPitch = 120 minPitch = 50 } 
		TA_OLLIE = { sound = "Terrains\\OllieWater" OllieConcValues } 
		TA_LAND = { sound = "Terrains\\LandWater" LandConcValues } 
	} 
	TreadActions = { 
		SkaterSkatingParticleParms = [ 
			{ apm_water_wake02_particle_params } 
			{ apm_water_wake03_particle_params } 
		] 
		SkaterStepParticleParms = [ 
			{ apm_Skater_splash03_fast_particle_params } 
			{ apm_water_wake01_particle_params } 
		] 
	} 
} 
STANDARD_TERRAIN_ICE = { 
	SoundActions = { 
		TA_ROLL = { sound = "Terrains\\RollIce" loadVol = 70 maxPitch = 100 minPitch = 60 maxVol = 100 minVol = 20 } 
		TA_OLLIE = { sound = "Terrains\\LandDirt" maxPitch = 100 minPitch = 100 maxVol = 100 minVol = 20 } 
		TA_LAND = { sound = "Terrains\\LandDirt" maxPitch = 100 minPitch = 100 maxVol = 100 minVol = 20 } 
		TA_REVERT = { sound = "Skater\\RevertWood" loadVol = 150 } 
	} 
} 
STANDARD_TERRAIN_SNOW = { 
	SoundActions = { 
		TA_ROLL = { sound = "Terrains\\RollSnow" loadVol = 70 maxPitch = 120 minPitch = 80 maxVol = 100 minVol = 20 } 
		TA_OLLIE = { sound = "Terrains\\LandDirt" maxPitch = 100 minPitch = 100 maxVol = 100 minVol = 20 } 
		TA_LAND = { sound = "Terrains\\LandDirt" maxPitch = 100 minPitch = 100 maxVol = 100 minVol = 20 } 
		TA_REVERT = [ { 
				soundAction = [ 
					{ chance = TA_REVERT_CONC_UG2_CHANCE sound = "Skater\\RevertConc" loadVol = 180 } 
					{ chance = TA_REVERT_CONC_AW_CHANCE sound = "Terrains\\RevertConc_THAW" loadVol = 180 } 
				] 
		} ] 
	} 
} 
STANDARD_TERRAIN_SAND = { 
	SoundActions = { 
		TA_ROLL = { sound = "Terrains\\RollSand" loadVol = 80 maxPitch = 120 minPitch = 80 maxVol = 100 minVol = 20 } 
		TA_OLLIE = { sound = "Terrains\\LandDirt" maxPitch = 100 minPitch = 100 maxVol = 100 minVol = 20 } 
		TA_LAND = { sound = "Terrains\\LandDirt" maxPitch = 100 minPitch = 100 maxVol = 100 minVol = 20 } 
		TA_REVERT = [ { 
				soundAction = [ 
					{ chance = TA_REVERT_CONC_UG2_CHANCE sound = "Skater\\RevertConc" loadVol = 180 } 
					{ chance = TA_REVERT_CONC_AW_CHANCE sound = "Terrains\\RevertConc_THAW" loadVol = 180 } 
				] 
		} ] 
	} 
	TreadActions = { 
		SkaterSkatingParticleParms = [ 
			{ apm_sand_puff01_particle_params } 
		] 
		SkaterStepParticleParms = [ 
			{ apm_sand_puff02_particle_params } 
		] 
	} 
} 
STANDARD_TERRAIN_TILE = { 
	SoundActions = { 
		TA_ROLL = { sound = "Terrains\\RollTile" loadVol = 80 maxPitch = 120 minPitch = 80 maxVol = 100 minVol = 20 } 
		TA_OLLIE = [ 
			{ 
				soundAction = [ 
					{ chance = TA_OLLIE_CONC_UG2_CHANCE sound = "Terrains\\OllieConc" OllieConcValues } 
					{ chance = TA_OLLIE_CONC19_UG2_CHANCE sound = "Terrains\\OllieConc19" OllieConcValues } 
					{ chance = TA_OLLIE_CONC_AW_CHANCE sound = "Terrains\\OllieConc_THAW" OllieConcValues } 
					{ chance = TA_OLLIE_CONC19_AW_CHANCE sound = "Terrains\\OllieConc19_THAW" OllieConcValues } 
				] 
			} 
		] 
		TA_LAND = [ { 
				soundAction = [ 
					{ chance = TA_LAND_CONC_UG2_CHANCE sound = "Terrains\\LandConc" loadVol = 100 } 
					{ chance = TA_LAND_CONC_AW_CHANCE sound = "Terrains\\LandConc_THAW" loadVol = 100 } 
				] 
		} ] 
		TA_REVERT = { sound = "Skater\\RevertWood" loadVol = 150 } 
	} 
} 
STANDARD_TERRAIN_PLEXIGLASS = { 
	SoundActions = { 
		TA_ROLL = { sound = "Terrains\\RollPlexiglass" loadVol = 50 maxPitch = 120 minPitch = 80 maxVol = 100 minVol = 20 } 
		TA_OLLIE = [ 
			{ 
				soundAction = [ 
					{ chance = TA_OLLIE_CONC_UG2_CHANCE sound = "Terrains\\OllieConc" OllieConcValues } 
					{ chance = TA_OLLIE_CONC19_UG2_CHANCE sound = "Terrains\\OllieConc19" OllieConcValues } 
					{ chance = TA_OLLIE_CONC_AW_CHANCE sound = "Terrains\\OllieConc_THAW" OllieConcValues } 
					{ chance = TA_OLLIE_CONC19_AW_CHANCE sound = "Terrains\\OllieConc19_THAW" OllieConcValues } 
				] 
			} 
		] 
		TA_LAND = [ { 
				soundAction = [ 
					{ chance = TA_LAND_CONC_UG2_CHANCE sound = "Terrains\\LandConc" LandConcValues } 
					{ chance = TA_LAND_CONC_AW_CHANCE sound = "Terrains\\LandConc_THAW" LandConcValues } 
				] 
		} ] 
		TA_REVERT = { sound = "Skater\\RevertGlass" loadVol = 180 } 
	} 
} 
STANDARD_TERRAIN_FIBERGLASS = { 
	SoundActions = { 
		TA_ROLL = { sound = "Terrains\\RollFiberglass" loadVol = 50 maxPitch = 120 minPitch = 80 maxVol = 100 minVol = 20 } 
		TA_OLLIE = [ 
			{ 
				soundAction = [ 
					{ chance = TA_OLLIE_CONC_UG2_CHANCE sound = "Terrains\\OllieConc" OllieConcValues } 
					{ chance = TA_OLLIE_CONC19_UG2_CHANCE sound = "Terrains\\OllieConc19" OllieConcValues } 
					{ chance = TA_OLLIE_CONC_AW_CHANCE sound = "Terrains\\OllieConc_THAW" OllieConcValues } 
					{ chance = TA_OLLIE_CONC19_AW_CHANCE sound = "Terrains\\OllieConc19_THAW" OllieConcValues } 
				] 
			} 
		] 
		TA_LAND = [ { 
				soundAction = [ 
					{ chance = TA_LAND_CONC_UG2_CHANCE sound = "Terrains\\LandConc" LandConcValues } 
					{ chance = TA_LAND_CONC_AW_CHANCE sound = "Terrains\\LandConc_THAW" LandConcValues } 
				] 
		} ] 
		TA_REVERT = { sound = "Skater\\RevertGlass" loadVol = 180 } 
	} 
} 
STANDARD_TERRAIN_CARPET = { 
	SoundActions = { 
		TA_ROLL = { sound = "Terrains\\RollCarpet" loadVol = 100 RollConcSmoothValues } 
		TA_OLLIE = [ 
			{ 
				soundAction = [ 
					{ chance = TA_OLLIE_CONC_UG2_CHANCE sound = "Terrains\\OllieConc" OllieConcValues } 
					{ chance = TA_OLLIE_CONC19_UG2_CHANCE sound = "Terrains\\OllieConc19" OllieConcValues } 
					{ chance = TA_OLLIE_CONC_AW_CHANCE sound = "Terrains\\OllieConc_THAW" OllieConcValues } 
					{ chance = TA_OLLIE_CONC19_AW_CHANCE sound = "Terrains\\OllieConc19_THAW" OllieConcValues } 
				] 
			} 
		] 
		TA_LAND = [ { 
				soundAction = [ 
					{ chance = TA_LAND_CONC_UG2_CHANCE sound = "Terrains\\LandConc" LandConcValues } 
					{ chance = TA_LAND_CONC_AW_CHANCE sound = "Terrains\\LandConc_THAW" LandConcValues } 
				] 
		} ] 
		TA_REVERT = { sound = "Skater\\RevertWood" loadVol = 150 } 
	} 
} 
STANDARD_TERRAIN_CONVEYOR = { 
	SoundActions = { 
		TA_ROLL = { sound = "Terrains\\RollConveyor" loadVol = 70 RollConcSmoothValues } 
		TA_OLLIE = [ 
			{ 
				soundAction = [ 
					{ chance = TA_OLLIE_CONC_UG2_CHANCE sound = "Terrains\\OllieConc" OllieConcValues } 
					{ chance = TA_OLLIE_CONC19_UG2_CHANCE sound = "Terrains\\OllieConc19" OllieConcValues } 
					{ chance = TA_OLLIE_CONC_AW_CHANCE sound = "Terrains\\OllieConc_THAW" OllieConcValues } 
					{ chance = TA_OLLIE_CONC19_AW_CHANCE sound = "Terrains\\OllieConc19_THAW" OllieConcValues } 
				] 
			} 
		] 
		TA_LAND = [ { 
				soundAction = [ 
					{ chance = TA_LAND_CONC_UG2_CHANCE sound = "Terrains\\LandConc" LandConcValues } 
					{ chance = TA_LAND_CONC_AW_CHANCE sound = "Terrains\\LandConc_THAW" LandConcValues } 
				] 
		} ] 
		TA_REVERT = [ { 
				soundAction = [ 
					{ chance = TA_REVERT_CONC_UG2_CHANCE sound = "Skater\\RevertConc" loadVol = 180 } 
					{ chance = TA_REVERT_CONC_AW_CHANCE sound = "Terrains\\RevertConc_THAW" loadVol = 180 } 
				] 
		} ] 
	} 
} 
STANDARD_TERRAIN_CHAINLINK = { 
	SoundActions = { 
		TA_BONK = { sound = "Terrains\\BonkChainlink" loadVol = 100 maxPitch = 100 minPitch = 100 maxVol = 100 minVol = 20 } 
		TA_GRIND = [ 
			{ 
				soundAction = [ 
					{ chance = TA_GRIND_SFX_THUG_CHANCE sound = "Terrains\\GrindMetalPole22" maxPitch = 108 minPitch = 90 maxVol = 120 minVol = 20 } 
					{ chance = TA_GRIND_SFX_CLASSIC_CHANCE sound = "Terrains\\GrindMetal" } 
				] 
			} 
		] 
		TA_GRINDJUMP = [ 
			{ 
				soundAction = [ 
					{ chance = TA_GRIND_SFX_THUG_CHANCE sound = "Terrains\\GrindMetalPoleOff21" maxVol = 90 minVol = 70 } 
					{ chance = TA_GRIND_SFX_CLASSIC_CHANCE sound = "Terrains\\GrindMetalOff" } 
				] 
			} 
		] 
		TA_GRINDLAND = [ 
			{ 
				useUpTo = 30 
				soundAction = [ 
					{ chance = TA_GRIND_SFX_THUG_CHANCE sound = "Terrains\\GrindMetalOn08" maxVol = 150 minVol = 100 maxPitch = 120 minPitch = 100 } 
					{ chance = TA_GRIND_SFX_CLASSIC_CHANCE sound = "Terrains\\GrindMetalOn" } 
				] 
			} 
			{ 
				soundAction = [ 
					{ chance = TA_GRIND_SFX_THUG_CHANCE sound = "Terrains\\GrindChainLinkOn22" maxVol = 150 minVol = 100 maxPitch = 120 minPitch = 100 } 
					{ chance = TA_GRIND_SFX_CLASSIC_CHANCE sound = "Terrains\\GrindMetalOn" } 
				] 
			} 
		] 
		TA_SLIDE = [ 
			{ 
				soundAction = [ 
					{ chance = TA_GRIND_SFX_THUG_CHANCE sound = "Terrains\\SlideMetalPole22" maxPitch = 140 minPitch = 100 maxVol = 100 minVol = 20 } 
					{ chance = TA_GRIND_SFX_CLASSIC_CHANCE sound = "Terrains\\SlideMetal" } 
				] 
			} 
		] 
		TA_SLIDEJUMP = [ 
			{ 
				soundAction = [ 
					{ chance = TA_GRIND_SFX_THUG_CHANCE sound = "Terrains\\GrindMetalPoleOff21" maxVol = 90 minVol = 70 } 
					{ chance = TA_GRIND_SFX_CLASSIC_CHANCE sound = "Terrains\\GrindMetalOff" } 
				] 
			} 
		] 
		TA_SLIDELAND = [ 
			{ 
				useUpTo = 30 
				soundAction = [ 
					{ chance = TA_GRIND_SFX_THUG_CHANCE sound = "Terrains\\GrindMetalOn08" maxVol = 150 minVol = 100 maxPitch = 120 minPitch = 100 } 
					{ chance = TA_GRIND_SFX_CLASSIC_CHANCE sound = "Terrains\\GrindMetalOn" } 
				] 
			} 
			{ 
				soundAction = [ 
					{ chance = TA_GRIND_SFX_THUG_CHANCE sound = "Terrains\\GrindChainLinkOn22" maxVol = 150 minVol = 100 maxPitch = 120 minPitch = 100 } 
					{ chance = TA_GRIND_SFX_CLASSIC_CHANCE sound = "Terrains\\GrindMetalOn" } 
				] 
			} 
		] 
	} 
} 
STANDARD_TERRAIN_METALFUTURE = { 
	SoundActions = { 
		TA_ROLL = { sound = "Terrains\\RollMetalFuture" loadVol = 700 RollMetalSmoothValues } 
		TA_OLLIE = { sound = "Terrains\\OllieMetalFuture" OllieMetalValues } 
		TA_LAND = { sound = "Terrains\\LandMetalFuture" LandMetalValues } 
		TA_REVERT = { sound = "Skater\\RevertMetal" loadVol = 200 } 
	} 
} 
STANDARD_TERRAIN_GENERIC1 = { 
	SoundActions = { 
		TA_BONK = { sound = "Terrains\\BonkMetalOutdoor_11" loadVol = 100 BonkMetalValues } 
	} 
} 
STANDARD_TERRAIN_GENERIC2 = { 
	SoundActions = { 
	} 
} 
STANDARD_TERRAIN_METALFENCE = { 
	SoundActions = { 
		TA_BONK = { sound = "Terrains\\BonkMetalFence" loadVol = 400 BonkMetalValues } 
	} 
} 
STANDARD_TERRAIN_GRINDCONC = { 
	SoundActions = { 
		TA_GRIND = [ 
			{ 
				soundAction = [ 
					{ chance = TA_GRIND_SFX_THUG_CHANCE sound = "Terrains\\GrindConc04" maxPitch = 90 minPitch = 60 maxVol = 100 minVol = 20 } 
					{ chance = TA_GRIND_SFX_CLASSIC_CHANCE sound = "Terrains\\GrindConc" } 
				] 
			} 
		] 
		TA_GRINDJUMP = [ 
			{ 
				soundAction = [ 
					{ chance = TA_OLLIE_CONC_UG2_CHANCE sound = "Terrains\\OllieConc" OllieConcValues } 
					{ chance = TA_OLLIE_CONC19_UG2_CHANCE sound = "Terrains\\OllieConc19" OllieConcValues } 
					{ chance = TA_OLLIE_CONC_AW_CHANCE sound = "Terrains\\OllieConc_THAW" OllieConcValues } 
					{ chance = TA_OLLIE_CONC19_AW_CHANCE sound = "Terrains\\OllieConc19_THAW" OllieConcValues } 
				] 
			} 
		] 
		TA_GRINDLAND = [ { 
				soundAction = [ 
					{ chance = TA_LAND_CONC_UG2_CHANCE sound = "Terrains\\LandConc" LandConcValues } 
					{ chance = TA_LAND_CONC_AW_CHANCE sound = "Terrains\\LandConc_THAW" LandConcValues } 
				] 
		} ] 
		TA_SLIDE = [ 
			{ 
				soundAction = [ 
					{ chance = TA_GRIND_SFX_THUG_CHANCE sound = "Terrains\\SlideConc14" SlideConcValues } 
					{ chance = TA_GRIND_SFX_CLASSIC_CHANCE sound = "Terrains\\SlideConc" } 
				] 
			} 
		] 
		TA_SLIDEJUMP = [ 
			{ 
				soundAction = [ 
					{ chance = TA_OLLIE_CONC_UG2_CHANCE sound = "Terrains\\OllieConc" OllieConcValues } 
					{ chance = TA_OLLIE_CONC19_UG2_CHANCE sound = "Terrains\\OllieConc19" OllieConcValues } 
					{ chance = TA_OLLIE_CONC_AW_CHANCE sound = "Terrains\\OllieConc_THAW" OllieConcValues } 
					{ chance = TA_OLLIE_CONC19_AW_CHANCE sound = "Terrains\\OllieConc19_THAW" OllieConcValues } 
				] 
			} 
		] 
		TA_SLIDELAND = [ { 
				soundAction = [ 
					{ chance = TA_LAND_CONC_UG2_CHANCE sound = "Terrains\\LandConc" LandConcValues } 
					{ chance = TA_LAND_CONC_AW_CHANCE sound = "Terrains\\LandConc_THAW" LandConcValues } 
				] 
		} ] 
	} 
	TreadActions = { 
		SkaterGrindParticleParms = [ 
			{ skater_sparks_params } 
			{ APM_Debris01_particle_params } 
		] 
		SkaterSlideParticleParms = [ 
		] 
	} 
} 
STANDARD_TERRAIN_GRINDROUNDMETALPOLE = { 
	SoundActions = { 
		TA_GRIND = [ 
			{ 
				soundAction = [ 
					{ chance = TA_GRIND_SFX_THUG_CHANCE sound = "Terrains\\GrindMetalPole22" maxVol = 90 minVol = 70 } 
					{ chance = TA_GRIND_SFX_CLASSIC_CHANCE sound = "Terrains\\GrindMetal" } 
				] 
			} 
		] 
		TA_GRINDJUMP = [ 
			{ 
				soundAction = [ 
					{ chance = TA_GRIND_SFX_THUG_CHANCE sound = "Terrains\\GrindMetalPoleOff21" maxVol = 90 minVol = 70 } 
					{ chance = TA_GRIND_SFX_CLASSIC_CHANCE sound = "Terrains\\GrindMetalOff" } 
				] 
			} 
		] 
		TA_GRINDLAND = [ 
			{ 
				useUpTo = 30 
				soundAction = [ 
					{ chance = TA_GRIND_SFX_THUG_CHANCE sound = "Terrains\\GrindMetalOn08" maxVol = 150 minVol = 100 maxPitch = 120 minPitch = 100 } 
					{ chance = TA_GRIND_SFX_CLASSIC_CHANCE sound = "Terrains\\GrindMetalOn" } 
				] 
			} 
			{ 
				soundAction = [ 
					{ chance = TA_GRIND_SFX_THUG_CHANCE sound = "Terrains\\GrindMetalPoleOn21" maxVol = 150 minVol = 100 maxPitch = 120 minPitch = 100 } 
					{ chance = TA_GRIND_SFX_CLASSIC_CHANCE sound = "Terrains\\GrindMetalOn" } 
				] 
			} 
		] 
		TA_SLIDE = [ 
			{ 
				soundAction = [ 
					{ chance = TA_GRIND_SFX_THUG_CHANCE sound = "Terrains\\SlideMetalPole22" maxPitch = 115 minPitch = 95 maxVol = 100 minVol = 20 } 
					{ chance = TA_GRIND_SFX_CLASSIC_CHANCE sound = "Terrains\\SlideMetal" } 
				] 
			} 
		] 
		TA_SLIDEJUMP = [ 
			{ 
				soundAction = [ 
					{ chance = TA_GRIND_SFX_THUG_CHANCE sound = "Terrains\\GrindMetalPoleOff21" maxVol = 90 minVol = 70 } 
					{ chance = TA_GRIND_SFX_CLASSIC_CHANCE sound = "Terrains\\GrindMetalOff" } 
				] 
			} 
		] 
		TA_SLIDELAND = [ 
			{ 
				useUpTo = 30 
				soundAction = [ 
					{ chance = TA_GRIND_SFX_THUG_CHANCE sound = "Terrains\\GrindMetalOn08" maxVol = 150 minVol = 100 maxPitch = 120 minPitch = 100 } 
					{ chance = TA_GRIND_SFX_CLASSIC_CHANCE sound = "Terrains\\GrindMetalOn" } 
				] 
			} 
			{ 
				soundAction = [ 
					{ chance = TA_GRIND_SFX_THUG_CHANCE sound = "Terrains\\GrindMetalPoleOn21" maxVol = 150 minVol = 100 maxPitch = 120 minPitch = 100 } 
					{ chance = TA_GRIND_SFX_CLASSIC_CHANCE sound = "Terrains\\GrindMetalOn" } 
				] 
			} 
		] 
	} 
} 
STANDARD_TERRAIN_GRINDCHAINLINK = { 
	SoundActions = { 
		TA_GRIND = [ 
			{ 
				soundAction = [ 
					{ chance = TA_GRIND_SFX_THUG_CHANCE sound = "Terrains\\GrindMetalPole22" maxVol = 90 minVol = 70 } 
					{ chance = TA_GRIND_SFX_CLASSIC_CHANCE sound = "Terrains\\GrindMetal" } 
				] 
			} 
		] 
		TA_GRINDJUMP = [ 
			{ 
				soundAction = [ 
					{ chance = TA_GRIND_SFX_THUG_CHANCE sound = "Terrains\\GrindMetalPoleOff21" maxVol = 90 minVol = 70 } 
					{ chance = TA_GRIND_SFX_CLASSIC_CHANCE sound = "Terrains\\GrindMetalOff" } 
				] 
			} 
		] 
		TA_GRINDLAND = [ 
			{ 
				useUpTo = 30 
				soundAction = [ 
					{ chance = TA_GRIND_SFX_THUG_CHANCE sound = "Terrains\\GrindMetalOn08" maxVol = 150 minVol = 100 maxPitch = 120 minPitch = 100 } 
					{ chance = TA_GRIND_SFX_CLASSIC_CHANCE sound = "Terrains\\GrindMetalOn" } 
				] 
			} 
			{ 
				soundAction = [ 
					{ chance = TA_GRIND_SFX_THUG_CHANCE sound = "Terrains\\GrindChainLinkOn22" maxVol = 150 minVol = 100 maxPitch = 120 minPitch = 100 } 
					{ chance = TA_GRIND_SFX_CLASSIC_CHANCE sound = "Terrains\\GrindMetalOn" } 
				] 
			} 
		] 
		TA_SLIDE = [ 
			{ 
				soundAction = [ 
					{ chance = TA_GRIND_SFX_THUG_CHANCE sound = "Terrains\\SlideMetalPole22" maxPitch = 115 minPitch = 95 maxVol = 100 minVol = 20 } 
					{ chance = TA_GRIND_SFX_CLASSIC_CHANCE sound = "Terrains\\SlideMetal" } 
				] 
			} 
		] 
		TA_SLIDEJUMP = [ 
			{ 
				soundAction = [ 
					{ chance = TA_GRIND_SFX_THUG_CHANCE sound = "Terrains\\GrindMetalPoleOff21" maxVol = 90 minVol = 70 } 
					{ chance = TA_GRIND_SFX_CLASSIC_CHANCE sound = "Terrains\\GrindMetalOff" } 
				] 
			} 
		] 
		TA_SLIDELAND = [ 
			{ 
				useUpTo = 30 
				soundAction = [ 
					{ chance = TA_GRIND_SFX_THUG_CHANCE sound = "Terrains\\GrindMetalOn08" maxVol = 150 minVol = 100 maxPitch = 120 minPitch = 100 } 
					{ chance = TA_GRIND_SFX_CLASSIC_CHANCE sound = "Terrains\\GrindMetalOn" } 
				] 
			} 
			{ 
				soundAction = [ 
					{ chance = TA_GRIND_SFX_THUG_CHANCE sound = "Terrains\\GrindChainLinkOn22" maxVol = 150 minVol = 100 maxPitch = 120 minPitch = 100 } 
					{ chance = TA_GRIND_SFX_CLASSIC_CHANCE sound = "Terrains\\GrindMetalOn" } 
				] 
			} 
		] 
	} 
} 
STANDARD_TERRAIN_GRINDMETAL = { 
	SoundActions = { 
		TA_GRIND = [ 
			{ 
				soundAction = [ 
					{ chance = TA_GRIND_SFX_THUG_CHANCE sound = "Terrains\\GrindMetal02" maxPitch = 115 minPitch = 100 maxVol = 120 minVol = 20 } 
					{ chance = TA_GRIND_SFX_CLASSIC_CHANCE sound = "Terrains\\GrindMetal" maxPitch = 120 minPitch = 80 maxVol = 80 minVol = 50 } 
				] 
			} 
		] 
		TA_GRINDJUMP = [ 
			{ 
				soundAction = [ 
					{ chance = TA_GRIND_SFX_THUG_CHANCE sound = "Terrains\\GrindMetalOff02" maxVol = 90 minVol = 70 } 
					{ chance = TA_GRIND_SFX_CLASSIC_CHANCE sound = "Terrains\\GrindMetalOff" } 
				] 
			} 
		] 
		TA_GRINDLAND = [ 
			{ 
				useUpTo = 30 
				soundAction = [ 
					{ chance = TA_GRIND_SFX_THUG_CHANCE sound = "Terrains\\GrindMetalOn08" maxVol = 150 minVol = 100 maxPitch = 120 minPitch = 100 } 
					{ chance = TA_GRIND_SFX_CLASSIC_CHANCE sound = "Terrains\\GrindMetalOn" } 
				] 
			} 
			{ 
				soundAction = [ 
					{ chance = TA_GRIND_SFX_THUG_CHANCE sound = "Terrains\\GrindMetalOn02" maxVol = 150 minVol = 100 maxPitch = 120 minPitch = 100 } 
					{ chance = TA_GRIND_SFX_CLASSIC_CHANCE sound = "Terrains\\GrindMetalOn" } 
				] 
			} 
		] 
		TA_SLIDE = [ 
			{ 
				soundAction = [ 
					{ chance = TA_GRIND_SFX_THUG_CHANCE sound = "Terrains\\SlideMetal02" maxPitch = 140 minPitch = 100 maxVol = 100 minVol = 20 } 
					{ chance = TA_GRIND_SFX_CLASSIC_CHANCE sound = "Terrains\\SlideMetal" } 
				] 
			} 
		] 
		TA_NATAS = { sound = "Terrains\\SlideMetal02" maxPitch = 140 minPitch = 100 maxVol = 100 minVol = 20 } 
		TA_SLIDEJUMP = [ 
			{ 
				soundAction = [ 
					{ chance = TA_GRIND_SFX_THUG_CHANCE sound = "Terrains\\GrindMetalOff02" maxVol = 90 minVol = 70 } 
					{ chance = TA_GRIND_SFX_CLASSIC_CHANCE sound = "Terrains\\GrindMetalOff" } 
				] 
			} 
		] 
		TA_SLIDELAND = [ 
			{ 
				useUpTo = 30 
				soundAction = [ 
					{ chance = TA_GRIND_SFX_THUG_CHANCE sound = "Terrains\\GrindMetalOn08" maxVol = 150 minVol = 100 maxPitch = 120 minPitch = 100 } 
					{ chance = TA_GRIND_SFX_CLASSIC_CHANCE sound = "Terrains\\GrindMetalOn" } 
				] 
			} 
			{ 
				soundAction = [ 
					{ chance = TA_GRIND_SFX_THUG_CHANCE sound = "Terrains\\GrindMetalOn02" maxVol = 150 minVol = 100 maxPitch = 120 minPitch = 100 } 
					{ chance = TA_GRIND_SFX_CLASSIC_CHANCE sound = "Terrains\\GrindMetalOn" } 
				] 
			} 
		] 
	} 
} 
STANDARD_TERRAIN_GRINDWOODRAILING = { 
	SoundActions = { 
		TA_GRIND = { sound = "Terrains\\GrindWoodRailing" maxPitch = 150 minPitch = 120 maxVol = 100 minVol = 50 } 
		TA_GRINDJUMP = { sound = "Terrains\\OllieWood" OllieWoodValues maxPitch = 140 minPitch = 130 } 
		TA_GRINDLAND = { sound = "Terrains\\LandWood" LandWoodValues loadVol = 100 maxPitch = 150 minPitch = 149 } 
		TA_SLIDE = { sound = "Terrains\\SlideWood" loadVol = 100 maxPitch = 120 minPitch = 90 maxVol = 100 minVol = 20 } 
		TA_SLIDEJUMP = { sound = "Terrains\\OllieWood" OllieWoodValues maxPitch = 140 minPitch = 130 } 
		TA_SLIDELAND = { sound = "Terrains\\LandWood" LandWoodValues loadVol = 100 maxPitch = 150 minPitch = 149 } 
	} 
	TreadActions = { 
		SkaterGrindParticleParms = [ 
			{ apm_splinter01_particle_params } 
		] 
		SkaterSlideParticleParms = [ 
			{ apm_splinter01_particle_params } 
		] 
	} 
} 
STANDARD_TERRAIN_GRINDWOODLOG = { 
	SoundActions = { 
		TA_GRIND = { sound = "Terrains\\GrindWood" maxPitch = 100 minPitch = 60 maxVol = 100 minVol = 20 } 
		TA_GRINDJUMP = { sound = "Terrains\\OllieWood" OllieWoodValues } 
		TA_GRINDLAND = { sound = "Terrains\\LandWood" LandWoodValues loadVol = 100 } 
		TA_SLIDE = { sound = "Terrains\\SlideWoodLog" loadVol = 100 maxPitch = 120 minPitch = 70 maxVol = 100 minVol = 20 } 
		TA_SLIDEJUMP = { sound = "Terrains\\OllieWood" OllieWoodValues } 
		TA_SLIDELAND = { sound = "Terrains\\LandWood" LandWoodValues loadVol = 100 } 
	} 
	TreadActions = { 
		SkaterGrindParticleParms = [ 
			{ apm_splinter01_particle_params } 
		] 
		SkaterSlideParticleParms = [ 
			{ apm_splinter01_particle_params } 
		] 
	} 
} 
STANDARD_TERRAIN_GRINDWOOD = { 
	SoundActions = { 
		TA_GRIND = { sound = "Terrains\\GrindWood" maxPitch = 100 minPitch = 60 maxVol = 100 minVol = 20 } 
		TA_GRINDJUMP = { sound = "Terrains\\OllieWood" OllieWoodValues } 
		TA_GRINDLAND = { sound = "Terrains\\LandWood" LandWoodValues loadVol = 100 } 
		TA_SLIDE = { sound = "Terrains\\SlideWood" pitch = 110 loadVol = 100 maxPitch = 100 minPitch = 60 maxVol = 100 minVol = 20 } 
		TA_SLIDEJUMP = { sound = "Terrains\\OllieWood" OllieWoodValues } 
		TA_SLIDELAND = { sound = "Terrains\\LandWood" LandWoodValues loadVol = 100 } 
	} 
	TreadActions = { 
		SkaterGrindParticleParms = [ 
			{ apm_splinter01_particle_params } 
		] 
		SkaterSlideParticleParms = [ 
			{ apm_splinter01_particle_params } 
		] 
	} 
} 
STANDARD_TERRAIN_GRINDPLASTIC = { 
	SoundActions = { 
		TA_GRIND = { sound = "Terrains\\GrindPlastic" maxPitch = 120 minPitch = 90 maxVol = 100 minVol = 20 } 
		TA_GRINDJUMP = { sound = "Terrains\\OllieWood" OllieWoodValues maxPitch = 130 minPitch = 120 } 
		TA_GRINDLAND = { sound = "Terrains\\LandWood" LandWoodValues loadVol = 100 maxPitch = 140 minPitch = 139 } 
		TA_SLIDE = { sound = "Terrains\\GrindPlastic" loadVol = 100 maxPitch = 120 minPitch = 70 maxVol = 100 minVol = 20 } 
		TA_SLIDEJUMP = { sound = "Terrains\\OllieWood" OllieWoodValues maxPitch = 130 minPitch = 120 } 
		TA_SLIDELAND = { sound = "Terrains\\LandWood" LandWoodValues loadVol = 100 maxPitch = 140 minPitch = 139 } 
	} 
} 
STANDARD_TERRAIN_GRINDCHAIN = { 
	SoundActions = { 
		TA_GRIND = { sound = "Terrains\\GrindChain" maxPitch = 115 minPitch = 100 maxVol = 120 minVol = 20 } 
		TA_GRINDJUMP = [ 
			{ 
				soundAction = [ 
					{ chance = TA_GRIND_SFX_THUG_CHANCE sound = "Terrains\\GrindMetalOff02" maxVol = 90 minVol = 70 } 
					{ chance = TA_GRIND_SFX_CLASSIC_CHANCE sound = "Terrains\\GrindMetalOff" } 
				] 
			} 
		] 
		TA_GRINDLAND = [ 
			{ 
				useUpTo = 30 
				soundAction = [ 
					{ chance = TA_GRIND_SFX_THUG_CHANCE sound = "Terrains\\GrindMetalOn08" maxVol = 150 minVol = 100 maxPitch = 120 minPitch = 100 } 
					{ chance = TA_GRIND_SFX_CLASSIC_CHANCE sound = "Terrains\\GrindMetalOn" } 
				] 
			} 
			{ 
				soundAction = [ 
					{ chance = TA_GRIND_SFX_THUG_CHANCE sound = "Terrains\\GrindMetalOn02" maxVol = 150 minVol = 100 maxPitch = 120 minPitch = 100 } 
					{ chance = TA_GRIND_SFX_CLASSIC_CHANCE sound = "Terrains\\GrindMetalOn" } 
				] 
			} 
		] 
		TA_SLIDE = [ 
			{ 
				soundAction = [ 
					{ chance = TA_GRIND_SFX_THUG_CHANCE sound = "Terrains\\SlideMetal02" maxPitch = 140 minPitch = 100 maxVol = 100 minVol = 20 } 
					{ chance = TA_GRIND_SFX_CLASSIC_CHANCE sound = "Terrains\\SlideMetal" } 
				] 
			} 
		] 
		TA_NATAS = { sound = "Terrains\\SlideMetal02" maxPitch = 140 minPitch = 100 maxVol = 100 minVol = 20 } 
		TA_SLIDEJUMP = [ 
			{ 
				soundAction = [ 
					{ chance = TA_GRIND_SFX_THUG_CHANCE sound = "Terrains\\GrindMetalOff02" maxVol = 90 minVol = 70 } 
					{ chance = TA_GRIND_SFX_CLASSIC_CHANCE sound = "Terrains\\GrindMetalOff" } 
				] 
			} 
		] 
		TA_SLIDELAND = [ 
			{ 
				useUpTo = 30 
				soundAction = [ 
					{ chance = TA_GRIND_SFX_THUG_CHANCE sound = "Terrains\\GrindMetalOn08" maxVol = 150 minVol = 100 maxPitch = 120 minPitch = 100 } 
					{ chance = TA_GRIND_SFX_CLASSIC_CHANCE sound = "Terrains\\GrindMetalOn" } 
				] 
			} 
			{ 
				soundAction = [ 
					{ chance = TA_GRIND_SFX_THUG_CHANCE sound = "Terrains\\GrindMetalOn02" maxVol = 150 minVol = 100 maxPitch = 120 minPitch = 100 } 
					{ chance = TA_GRIND_SFX_CLASSIC_CHANCE sound = "Terrains\\GrindMetalOn" } 
				] 
			} 
		] 
	} 
} 
STANDARD_TERRAIN_GRINDELECTRICWIRE = { 
	SoundActions = { 
		TA_GRIND = { sound = "Terrains\\GrindWireSpark" maxPitch = 110 minPitch = 75 maxVol = 180 minVol = 80 } 
		TA_GRINDJUMP = { sound = "Terrains\\OllieWireSpark" maxVol = 180 minVol = 60 } 
		TA_GRINDLAND = { sound = "Terrains\\LandWireSpark" maxVol = 200 minVol = 100 } 
		TA_SLIDE = { sound = "Terrains\\GrindWireSpark" maxPitch = 120 minPitch = 80 maxVol = 150 minVol = 80 } 
		TA_SLIDEJUMP = { sound = "Terrains\\OllieWireSpark" maxVol = 180 minVol = 60 } 
		TA_SLIDELAND = { sound = "Terrains\\LandWireSpark" maxVol = 150 minVol = 100 } 
	} 
	TreadActions = { 
		SkaterGrindParticleParms = [ 
			{ skater_elec_sparks_params } 
		] 
		SkaterSlideParticleParms = [ 
		] 
	} 
} 
STANDARD_TERRAIN_GRINDCABLE = { 
	SoundActions = { 
		TA_GRIND = { sound = "Terrains\\GrindCable" maxPitch = 110 minPitch = 75 maxVol = 180 minVol = 80 } 
		TA_GRINDJUMP = { sound = "Terrains\\OllieMetal" maxVol = 180 minVol = 60 } 
		TA_GRINDLAND = { sound = "Terrains\\LandWire" maxVol = 200 minVol = 100 } 
		TA_SLIDE = { sound = "Terrains\\GrindCable" maxPitch = 120 minPitch = 80 maxVol = 150 minVol = 80 } 
		TA_SLIDEJUMP = { sound = "Terrains\\OllieMetal" maxVol = 180 minVol = 60 } 
		TA_SLIDELAND = { sound = "Terrains\\LandWire" maxVol = 150 minVol = 100 } 
	} 
} 
STANDARD_TERRAIN_GRINDPLASTICBARRIER = { 
	SoundActions = { 
		TA_GRIND = { sound = "Terrains\\GrindPlastic" maxPitch = 120 minPitch = 90 maxVol = 100 minVol = 20 } 
		TA_GRINDJUMP = { sound = "Terrains\\OllieWood" OllieWoodValues maxPitch = 130 minPitch = 120 } 
		TA_GRINDLAND = { sound = "Terrains\\LandWood" LandWoodValues loadVol = 100 maxPitch = 140 minPitch = 139 } 
		TA_SLIDE = { sound = "Terrains\\SlidePlastic" loadVol = 100 maxPitch = 120 minPitch = 70 maxVol = 100 minVol = 20 } 
		TA_SLIDEJUMP = { sound = "Terrains\\OllieWood" OllieWoodValues maxPitch = 130 minPitch = 120 } 
		TA_SLIDELAND = { sound = "Terrains\\LandWood" LandWoodValues loadVol = 100 maxPitch = 140 minPitch = 139 } 
	} 
} 
STANDARD_TERRAIN_GRINDNEONLIGHT = { 
	SoundActions = { 
		TA_GRIND = { sound = "Terrains\\GrindWireSpark" maxPitch = 110 minPitch = 75 maxVol = 180 minVol = 80 } 
		TA_GRINDJUMP = { sound = "Terrains\\OllieWireSpark" maxVol = 180 minVol = 60 } 
		TA_GRINDLAND = { sound = "Terrains\\LandWireSpark" maxVol = 200 minVol = 100 } 
		TA_SLIDE = { sound = "Terrains\\GrindWireSpark" maxPitch = 120 minPitch = 80 maxVol = 150 minVol = 80 } 
		TA_SLIDEJUMP = { sound = "Terrains\\OllieWireSpark" maxVol = 180 minVol = 60 } 
		TA_SLIDELAND = { sound = "Terrains\\LandWireSpark" maxVol = 150 minVol = 100 } 
	} 
	TreadActions = { 
		SkaterGrindParticleParms = [ 
			{ skater_elec_sparks_params } 
		] 
		SkaterSlideParticleParms = [ 
		] 
	} 
} 
STANDARD_TERRAIN_GRINDGLASSMONSTER = { 
	SoundActions = { 
		TA_GRIND = { sound = "Terrains\\GrindGlassMonster" maxPitch = 120 minPitch = 90 maxVol = 100 minVol = 20 } 
		TA_GRINDJUMP = { sound = "Terrains\\OllieWood" OllieWoodValues maxPitch = 130 minPitch = 120 } 
		TA_GRINDLAND = { sound = "Terrains\\LandWood" LandWoodValues loadVol = 100 maxPitch = 140 minPitch = 139 } 
		TA_SLIDE = { sound = "Terrains\\GrindGlassMonster" loadVol = 100 maxPitch = 120 minPitch = 70 maxVol = 100 minVol = 20 } 
		TA_SLIDEJUMP = { sound = "Terrains\\OllieWood" OllieWoodValues maxPitch = 130 minPitch = 120 } 
		TA_SLIDELAND = { sound = "Terrains\\LandWood" LandWoodValues loadVol = 100 maxPitch = 140 minPitch = 139 } 
	} 
} 
STANDARD_TERRAIN_GRINDBANYONTREE = { 
	SoundActions = { 
		TA_GRIND = { sound = "Terrains\\GrindBanyonTree" maxPitch = 100 minPitch = 60 maxVol = 100 minVol = 20 } 
		TA_GRINDJUMP = { sound = "Terrains\\OllieWood" OllieWoodValues } 
		TA_GRINDLAND = { sound = "Terrains\\LandWood" LandWoodValues loadVol = 100 } 
		TA_SLIDE = { sound = "Terrains\\GrindBanyonTree" loadVol = 100 maxPitch = 120 minPitch = 70 maxVol = 100 minVol = 20 } 
		TA_SLIDEJUMP = { sound = "Terrains\\OllieWood" OllieWoodValues } 
		TA_SLIDELAND = { sound = "Terrains\\LandWood" LandWoodValues loadVol = 100 } 
	} 
} 
STANDARD_TERRAIN_GRINDBRASSRAIL = { 
	SoundActions = { 
		TA_GRIND = [ 
			{ 
				soundAction = [ 
					{ chance = TA_GRIND_SFX_THUG_CHANCE sound = "Terrains\\GrindMetalPole22" maxVol = 90 minVol = 70 } 
					{ chance = TA_GRIND_SFX_CLASSIC_CHANCE sound = "Terrains\\GrindMetal" } 
				] 
			} 
		] 
		TA_GRINDJUMP = [ 
			{ 
				soundAction = [ 
					{ chance = TA_GRIND_SFX_THUG_CHANCE sound = "Terrains\\GrindMetalPoleOff21" maxVol = 90 minVol = 70 } 
					{ chance = TA_GRIND_SFX_CLASSIC_CHANCE sound = "Terrains\\GrindMetalOff" } 
				] 
			} 
		] 
		TA_GRINDLAND = [ 
			{ 
				useUpTo = 30 
				soundAction = [ 
					{ chance = TA_GRIND_SFX_THUG_CHANCE sound = "Terrains\\GrindMetalOn08" maxVol = 150 minVol = 100 maxPitch = 120 minPitch = 100 } 
					{ chance = TA_GRIND_SFX_CLASSIC_CHANCE sound = "Terrains\\GrindMetalOn" } 
				] 
			} 
			{ 
				soundAction = [ 
					{ chance = TA_GRIND_SFX_THUG_CHANCE sound = "Terrains\\GrindMetalPoleOn21" maxVol = 150 minVol = 100 maxPitch = 120 minPitch = 100 } 
					{ chance = TA_GRIND_SFX_CLASSIC_CHANCE sound = "Terrains\\GrindMetalOn" } 
				] 
			} 
		] 
		TA_SLIDE = [ 
			{ 
				soundAction = [ 
					{ chance = TA_GRIND_SFX_THUG_CHANCE sound = "Terrains\\SlideMetalPole22" maxPitch = 115 minPitch = 95 maxVol = 100 minVol = 20 } 
					{ chance = TA_GRIND_SFX_CLASSIC_CHANCE sound = "Terrains\\SlideMetal" } 
				] 
			} 
		] 
		TA_SLIDEJUMP = [ 
			{ 
				soundAction = [ 
					{ chance = TA_GRIND_SFX_THUG_CHANCE sound = "Terrains\\GrindMetalPoleOff21" maxVol = 90 minVol = 70 } 
					{ chance = TA_GRIND_SFX_CLASSIC_CHANCE sound = "Terrains\\GrindMetalOff" } 
				] 
			} 
		] 
		TA_SLIDELAND = [ 
			{ 
				useUpTo = 30 
				soundAction = [ 
					{ chance = TA_GRIND_SFX_THUG_CHANCE sound = "Terrains\\GrindMetalOn08" maxVol = 150 minVol = 100 maxPitch = 120 minPitch = 100 } 
					{ chance = TA_GRIND_SFX_CLASSIC_CHANCE sound = "Terrains\\GrindMetalOn" } 
				] 
			} 
			{ 
				soundAction = [ 
					{ chance = TA_GRIND_SFX_THUG_CHANCE sound = "Terrains\\GrindMetalPoleOn21" maxVol = 150 minVol = 100 maxPitch = 120 minPitch = 100 } 
					{ chance = TA_GRIND_SFX_CLASSIC_CHANCE sound = "Terrains\\GrindMetalOn" } 
				] 
			} 
		] 
	} 
} 
STANDARD_TERRAIN_GRINDRUSTYRAIL = { 
	SoundActions = { 
		TA_GRIND = { sound = "Terrains\\SK6_GrindMetal0217b" maxPitch = 115 minPitch = 100 maxVol = 120 minVol = 20 } 
		TA_GRINDJUMP = { sound = "Terrains\\SK6_GrindMetaloff0217b" maxVol = 90 minVol = 70 } 
		TA_GRINDLAND = { sound = "Terrains\\SK6_GrindMetalon0217b" maxVol = 150 minVol = 100 maxPitch = 120 minPitch = 100 loadVol = 100 } 
		TA_SLIDE = { sound = "Terrains\\SK6_slideMetal0217b" loadVol = 100 maxPitch = 120 minPitch = 70 maxVol = 100 minVol = 20 } 
		TA_SLIDEJUMP = { sound = "Terrains\\SK6_GrindMetaloff0217b" maxVol = 90 minVol = 70 } 
		TA_SLIDELAND = { sound = "Terrains\\SK6_GrindMetalon0217b" maxVol = 150 minVol = 100 maxPitch = 120 minPitch = 100 loadVol = 100 } 
	} 
} 
STANDARD_TERRAIN_GRINDCATWALK = { 
	SoundActions = { 
		TA_GRIND = [ 
			{ 
				soundAction = [ 
					{ chance = TA_GRIND_SFX_THUG_CHANCE sound = "Terrains\\GrindMetal02" maxPitch = 115 minPitch = 100 maxVol = 120 minVol = 20 } 
					{ chance = TA_GRIND_SFX_CLASSIC_CHANCE sound = "Terrains\\GrindMetal" maxPitch = 120 minPitch = 80 maxVol = 80 minVol = 50 } 
				] 
			} 
		] 
		TA_GRINDJUMP = [ 
			{ 
				soundAction = [ 
					{ chance = TA_GRIND_SFX_THUG_CHANCE sound = "Terrains\\GrindMetalOff02" maxVol = 90 minVol = 70 } 
					{ chance = TA_GRIND_SFX_CLASSIC_CHANCE sound = "Terrains\\GrindMetalOff" } 
				] 
			} 
		] 
		TA_GRINDLAND = [ 
			{ 
				useUpTo = 30 
				soundAction = [ 
					{ chance = TA_GRIND_SFX_THUG_CHANCE sound = "Terrains\\GrindMetalOn08" maxVol = 150 minVol = 100 maxPitch = 120 minPitch = 100 } 
					{ chance = TA_GRIND_SFX_CLASSIC_CHANCE sound = "Terrains\\GrindMetalOn" } 
				] 
			} 
			{ 
				soundAction = [ 
					{ chance = TA_GRIND_SFX_THUG_CHANCE sound = "Terrains\\GrindMetalOn02" maxVol = 150 minVol = 100 maxPitch = 120 minPitch = 100 } 
					{ chance = TA_GRIND_SFX_CLASSIC_CHANCE sound = "Terrains\\GrindMetalOn" } 
				] 
			} 
		] 
		TA_SLIDE = [ 
			{ 
				soundAction = [ 
					{ chance = TA_GRIND_SFX_THUG_CHANCE sound = "Terrains\\SlideMetal02" maxPitch = 140 minPitch = 100 maxVol = 100 minVol = 20 } 
					{ chance = TA_GRIND_SFX_CLASSIC_CHANCE sound = "Terrains\\SlideMetal" } 
				] 
			} 
		] 
		TA_GRINDJUMP = [ 
			{ 
				soundAction = [ 
					{ chance = TA_GRIND_SFX_THUG_CHANCE sound = "Terrains\\GrindMetalOff02" maxVol = 90 minVol = 70 } 
					{ chance = TA_GRIND_SFX_CLASSIC_CHANCE sound = "Terrains\\GrindMetalOff" } 
				] 
			} 
		] 
		TA_SLIDELAND = [ 
			{ 
				useUpTo = 30 
				soundAction = [ 
					{ chance = TA_GRIND_SFX_THUG_CHANCE sound = "Terrains\\GrindMetalOn08" maxVol = 150 minVol = 100 maxPitch = 120 minPitch = 100 } 
					{ chance = TA_GRIND_SFX_CLASSIC_CHANCE sound = "Terrains\\GrindMetalOn" } 
				] 
			} 
			{ 
				soundAction = [ 
					{ chance = TA_GRIND_SFX_THUG_CHANCE sound = "Terrains\\GrindMetalOn02" maxVol = 150 minVol = 100 maxPitch = 120 minPitch = 100 } 
					{ chance = TA_GRIND_SFX_CLASSIC_CHANCE sound = "Terrains\\GrindMetalOn" } 
				] 
			} 
		] 
	} 
} 
STANDARD_TERRAIN_GRINDTANKTURRET = { 
	SoundActions = { 
		TA_GRIND = { sound = "Terrains\\GrindTankTurret" maxPitch = 115 minPitch = 100 maxVol = 120 minVol = 20 } 
		TA_GRINDJUMP = [ 
			{ 
				soundAction = [ 
					{ chance = TA_GRIND_SFX_THUG_CHANCE sound = "Terrains\\GrindMetalOff02" maxVol = 90 minVol = 70 } 
					{ chance = TA_GRIND_SFX_CLASSIC_CHANCE sound = "Terrains\\GrindMetalOff" } 
				] 
			} 
		] 
		TA_GRINDLAND = { sound = "Terrains\\LandTankTurret" LandWoodValues loadVol = 100 } 
		TA_SLIDE = [ 
			{ 
				soundAction = [ 
					{ chance = TA_GRIND_SFX_THUG_CHANCE sound = "Terrains\\SlideMetal02" maxPitch = 140 minPitch = 100 maxVol = 100 minVol = 20 } 
					{ chance = TA_GRIND_SFX_CLASSIC_CHANCE sound = "Terrains\\SlideMetal" } 
				] 
			} 
		] 
		TA_GRINDJUMP = [ 
			{ 
				soundAction = [ 
					{ chance = TA_GRIND_SFX_THUG_CHANCE sound = "Terrains\\GrindMetalOff02" maxVol = 90 minVol = 70 } 
					{ chance = TA_GRIND_SFX_CLASSIC_CHANCE sound = "Terrains\\GrindMetalOff" } 
				] 
			} 
		] 
		TA_SLIDELAND = { sound = "Terrains\\LandTankTurret" LandWoodValues loadVol = 100 } 
	} 
} 
STANDARD_TERRAIN_GRINDTRAIN = { 
	SoundActions = { 
		TA_GRIND = { sound = "Terrains\\GrindTrain" loadVol = 100 maxPitch = 100 minPitch = 60 maxVol = 200 minVol = 80 } 
	} 
} 
STANDARD_TERRAIN_GRINDROPE = { 
	SoundActions = { 
		TA_GRIND = { sound = "Terrains\\GrindWireBench" loadVol = 50 pitch = 70 maxPitch = 100 minPitch = 60 maxVol = 200 minVol = 80 } 
		TA_GRINDJUMP = { sound = "Terrains\\OllieWood" OllieWoodValues } 
		TA_GRINDLAND = { sound = "Terrains\\LandWood" loadVol = 80 maxVol = 100 minVol = 60 } 
		TA_SLIDE = { sound = "Terrains\\SlideWoodRailing" loadVol = 50 maxPitch = 100 minPitch = 60 maxVol = 100 minVol = 20 } 
		TA_SLIDEJUMP = { sound = "Terrains\\OllieWood" loadVol = 80 OllieWoodValues } 
		TA_SLIDELAND = { sound = "Terrains\\LandWood" loadVol = 80 maxVol = 120 minVol = 80 } 
	} 
	TreadActions = { 
		SkaterGrindParticleParms = [ 
		] 
		SkaterSlideParticleParms = [ 
		] 
	} 
} 
STANDARD_TERRAIN_GRINDWIRE = { 
	SoundActions = { 
		TA_GRIND = { sound = "Terrains\\GrindWireSpark" maxPitch = 110 minPitch = 75 maxVol = 150 minVol = 80 } 
		TA_GRINDJUMP = { sound = "Terrains\\OllieWireSpark" maxVol = 150 minVol = 60 } 
		TA_GRINDLAND = { sound = "Terrains\\LandWireSpark" maxVol = 175 minVol = 100 } 
		TA_SLIDE = { sound = "Terrains\\GrindWireSpark" maxPitch = 120 minPitch = 80 maxVol = 130 minVol = 80 } 
		TA_SLIDEJUMP = { sound = "Terrains\\OllieWireSpark" maxVol = 150 minVol = 60 } 
		TA_SLIDELAND = { sound = "Terrains\\LandWireSpark" maxVol = 130 minVol = 100 } 
	} 
	TreadActions = { 
		SkaterGrindParticleParms = [ 
			{ skater_elec_sparks_params } 
		] 
		SkaterSlideParticleParms = [ 
		] 
	} 
} 
TERRAIN_DEFAULT = STANDARD_TERRAIN_DEFAULT 
TERRAIN_CONCSMOOTH = STANDARD_TERRAIN_CONCSMOOTH 
TERRAIN_CONCROUGH = STANDARD_TERRAIN_CONCROUGH 
TERRAIN_METALSMOOTH = STANDARD_TERRAIN_METALSMOOTH 
TERRAIN_METALROUGH = STANDARD_TERRAIN_METALROUGH 
TERRAIN_METALCORRUGATED = STANDARD_TERRAIN_METALCORRUGATED 
TERRAIN_METALGRATING = STANDARD_TERRAIN_METALGRATING 
TERRAIN_METALTIN = STANDARD_TERRAIN_METALTIN 
TERRAIN_WOOD = STANDARD_TERRAIN_WOOD 
TERRAIN_WOODMASONITE = STANDARD_TERRAIN_WOODMASONITE 
TERRAIN_WOODPLYWOOD = STANDARD_TERRAIN_WOODPLYWOOD 
TERRAIN_WOODFLIMSY = STANDARD_TERRAIN_WOODFLIMSY 
TERRAIN_WOODSHINGLE = STANDARD_TERRAIN_WOODSHINGLE 
TERRAIN_WOODPIER = STANDARD_TERRAIN_WOODPIER 
TERRAIN_BRICK = STANDARD_TERRAIN_BRICK 
TERRAIN_TILE = STANDARD_TERRAIN_TILE 
TERRAIN_ASPHALT = STANDARD_TERRAIN_ASPHALT 
TERRAIN_ROCK = STANDARD_TERRAIN_ROCK 
TERRAIN_GRAVEL = STANDARD_TERRAIN_GRAVEL 
TERRAIN_SIDEWALK = STANDARD_TERRAIN_SIDEWALK 
TERRAIN_GRASS = STANDARD_TERRAIN_GRASS 
TERRAIN_GRASSDRIED = STANDARD_TERRAIN_GRASSDRIED 
TERRAIN_DIRT = STANDARD_TERRAIN_DIRT 
TERRAIN_DIRTPACKED = STANDARD_TERRAIN_DIRTPACKED 
TERRAIN_WATER = STANDARD_TERRAIN_WATER 
TERRAIN_ICE = STANDARD_TERRAIN_ICE 
TERRAIN_SNOW = STANDARD_TERRAIN_SNOW 
TERRAIN_SAND = STANDARD_TERRAIN_SAND 
TERRAIN_PLEXIGLASS = STANDARD_TERRAIN_PLEXIGLASS 
TERRAIN_FIBERGLASS = STANDARD_TERRAIN_FIBERGLASS 
TERRAIN_CARPET = STANDARD_TERRAIN_CARPET 
TERRAIN_CONVEYOR = STANDARD_TERRAIN_CONVEYOR 
TERRAIN_CHAINLINK = STANDARD_TERRAIN_CHAINLINK 
TERRAIN_METALFUTURE = STANDARD_TERRAIN_METALFUTURE 
TERRAIN_GENERIC1 = STANDARD_TERRAIN_GENERIC1 
TERRAIN_GENERIC2 = STANDARD_TERRAIN_GENERIC2 
TERRAIN_WHEELS = STANDARD_TERRAIN_WHEELS 
TERRAIN_WETCONC = STANDARD_TERRAIN_WETCONC 
TERRAIN_METALFENCE = STANDARD_TERRAIN_METALFENCE 
TERRAIN_GRINDTRAIN = STANDARD_TERRAIN_GRINDTRAIN 
TERRAIN_GRINDROPE = STANDARD_TERRAIN_GRINDROPE 
TERRAIN_GRINDWIRE = STANDARD_TERRAIN_GRINDWIRE 
TERRAIN_GRINDCONC = STANDARD_TERRAIN_GRINDCONC 
TERRAIN_GRINDROUNDMETALPOLE = STANDARD_TERRAIN_GRINDROUNDMETALPOLE 
TERRAIN_GRINDCHAINLINK = STANDARD_TERRAIN_GRINDCHAINLINK 
TERRAIN_GRINDMETAL = STANDARD_TERRAIN_GRINDMETAL 
TERRAIN_GRINDWOODRAILING = STANDARD_TERRAIN_GRINDWOODRAILING 
TERRAIN_GRINDWOODLOG = STANDARD_TERRAIN_GRINDWOODLOG 
TERRAIN_GRINDWOOD = STANDARD_TERRAIN_GRINDWOOD 
TERRAIN_GRINDPLASTIC = STANDARD_TERRAIN_GRINDPLASTIC 
TERRAIN_GRINDELECTRICWIRE = STANDARD_TERRAIN_GRINDELECTRICWIRE 
TERRAIN_GRINDCABLE = STANDARD_TERRAIN_GRINDCABLE 
TERRAIN_GRINDCHAIN = STANDARD_TERRAIN_GRINDCHAIN 
TERRAIN_GRINDPLASTICBARRIER = STANDARD_TERRAIN_GRINDPLASTICBARRIER 
TERRAIN_GRINDNEONLIGHT = STANDARD_TERRAIN_GRINDNEONLIGHT 
TERRAIN_GRINDGLASSMONSTER = STANDARD_TERRAIN_GRINDGLASSMONSTER 
TERRAIN_GRINDBANYONTREE = STANDARD_TERRAIN_GRINDBANYONTREE 
TERRAIN_GRINDBRASSRAIL = STANDARD_TERRAIN_GRINDBRASSRAIL 
TERRAIN_GRINDRUSTYRAIL = STANDARD_TERRAIN_GRINDRUSTYRAIL 
TERRAIN_GRINDCATWALK = STANDARD_TERRAIN_GRINDCATWALK 
TERRAIN_GRINDTANKTURRET = STANDARD_TERRAIN_GRINDTANKTURRET 

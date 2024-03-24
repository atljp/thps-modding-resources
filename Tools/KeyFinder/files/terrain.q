

script SetTerrainParticleProperties 
    
endscript

terrain_types = [
    {checksum = terrain_default desc = 'Default'}
    {checksum = TERRAIN_CONCSMOOTH desc = 'ConcSmooth'}
    {checksum = TERRAIN_CONCROUGH desc = 'ConcRough'}
    {checksum = terrain_metalsmooth desc = 'MetalSmooth'}
    {checksum = TERRAIN_METALROUGH desc = 'MetalRough'}
    {checksum = TERRAIN_METALCORRUGATED desc = 'MetalCorrugated'}
    {checksum = TERRAIN_METALGRATING desc = 'MetalGrating'}
    {checksum = TERRAIN_METALTIN desc = 'MetalTin'}
    {checksum = TERRAIN_WOOD desc = 'Wood'}
    {checksum = terrain_woodmasonite desc = 'WoodMasonite'}
    {checksum = TERRAIN_WOODPLYWOOD desc = 'WoodPlywood'}
    {checksum = TERRAIN_WOODFLIMSY desc = 'WoodFlimsy'}
    {checksum = TERRAIN_WOODSHINGLE desc = 'WoodShingle'}
    {checksum = TERRAIN_WOODPIER desc = 'WoodPier'}
    {checksum = TERRAIN_BRICK desc = 'Brick'}
    {checksum = TERRAIN_TILE desc = 'Tile'}
    {checksum = TERRAIN_ASPHALT desc = 'Asphalt'}
    {checksum = TERRAIN_ROCK desc = 'Rock'}
    {checksum = TERRAIN_GRAVEL desc = 'Gravel'}
    {checksum = TERRAIN_SIDEWALK desc = 'Sidewalk'}
    {checksum = TERRAIN_GRASS desc = 'Grass'}
    {checksum = TERRAIN_GRASSDRIED desc = 'GrassDried'}
    {checksum = TERRAIN_DIRT desc = 'Dirt'}
    {checksum = TERRAIN_DIRTPACKED desc = 'DirtPacked'}
    {checksum = TERRAIN_WATER desc = 'Water'}
    {checksum = TERRAIN_ICE desc = 'Ice'}
    {checksum = TERRAIN_SNOW desc = 'Snow'}
    {checksum = TERRAIN_SAND desc = 'Sand'}
    {checksum = TERRAIN_PLEXIGLASS desc = 'Plexiglass'}
    {checksum = TERRAIN_FIBERGLASS desc = 'Fiberglass'}
    {checksum = TERRAIN_CARPET desc = 'Carpet'}
    {checksum = TERRAIN_CONVEYOR desc = 'Conveyor'}
    {checksum = TERRAIN_CHAINLINK desc = 'Chainlink'}
    {checksum = TERRAIN_METALFUTURE desc = 'MetalFuture'}
    {checksum = TERRAIN_GENERIC1 desc = 'Generic1'}
    {checksum = TERRAIN_GENERIC2 desc = 'Generic2'}
    {checksum = TERRAIN_WHEELS desc = 'Wheels'}
    {checksum = TERRAIN_WETCONC desc = 'WetConc'}
    {checksum = TERRAIN_METALFENCE desc = 'MetalFence'}
    {checksum = TERRAIN_GRINDTRAIN desc = 'GrindTrain'}
    {checksum = TERRAIN_GRINDROPE desc = 'GrindRope'}
    {checksum = TERRAIN_GRINDWIRE desc = 'Grindwire'}
    {checksum = TERRAIN_GRINDCONC desc = 'GrindConc'}
    {checksum = TERRAIN_GRINDROUNDMETALPOLE desc = 'GrindRoundMetalPole'}
    {checksum = TERRAIN_GRINDCHAINLINK desc = 'GrindChainLink'}
    {checksum = TERRAIN_GRINDMETAL desc = 'GrindMetal'}
    {checksum = TERRAIN_GRINDWOODRAILING desc = 'GrindWoodRailing'}
    {checksum = TERRAIN_GRINDWOODLOG desc = 'GrindWoodLog'}
    {checksum = TERRAIN_GRINDWOOD desc = 'GrindWood'}
    {checksum = TERRAIN_GRINDPLASTIC desc = 'GrindPlastic'}
    {checksum = TERRAIN_GRINDELECTRICWIRE desc = 'GrindElectricWire'}
    {checksum = TERRAIN_GRINDCABLE desc = 'GrindCable'}
    {checksum = TERRAIN_GRINDCHAIN desc = 'GrindChain'}
    {checksum = TERRAIN_GRINDPLASTICBARRIER desc = 'GrindPlasticBarrier'}
    {checksum = TERRAIN_GRINDNEONLIGHT desc = 'GrindNeonLight'}
    {checksum = TERRAIN_GRINDGLASSMONSTER desc = 'GrindGlassMonster'}
    {checksum = TERRAIN_GRINDBANYONTREE desc = 'GrindBAnyOnTree'}
    {checksum = TERRAIN_GRINDBRASSRAIL desc = 'GrindBrassRail'}
    {checksum = TERRAIN_GRINDCATWALK desc = 'GrindCatwalk'}
    {checksum = TERRAIN_GRINDTANKTURRET desc = 'GrindTankTurret'}
]
terrain_actions = [
    {type = TABLE_WHEELROLL action = TA_ROLL}
    {type = table_grind action = TA_GRIND}
    {type = TABLE_JUMP action = TA_OLLIE}
    {type = TABLE_LAND action = TA_LAND}
    {type = TABLE_BONK action = TA_BONK}
    {type = TABLE_GRINDJUMP action = TA_GRINDJUMP}
    {type = TABLE_GRINDLAND action = TA_GRINDLAND}
    {type = TABLE_SLIDE action = TA_SLIDE}
    {type = TABLE_SLIDEJUMP action = TA_SLIDEJUMP}
    {type = TABLE_SLIDELAND action = TA_SLIDELAND}
    {type = TABLE_CESS action = TA_REVERT}
]
RollConcSmoothValues = {maxpitch = 120 minpitch = 30}
RollConcRoughValues = {maxpitch = 120 minpitch = 10}
OllieConcValues = {maxpitch = 105 minpitch = 98 maxvol = 175 minvol = 120}
SlideConcValues = {maxpitch = 135 minpitch = 100 maxvol = 130 minvol = 80}
LandConcValues = {maxvol = 135 minvol = 70}
BonkConcValues = {maxvol = 140 minvol = 70}
RollMetalSmoothValues = {maxpitch = 120 minpitch = 30}
RollMetalRoughValues = {maxpitch = 120 minpitch = 30 maxvol = 100 minvol = 20}
RollMetalCorrugatedValues = {maxpitch = 250 minpitch = 150}
OllieMetalValues = {maxvol = 140 minvol = 70}
LandMetalValues = {maxpitch = 100 minpitch = 100 maxvol = 100 minvol = 40}
BonkMetalValues = {maxvol = 100 minvol = 30}
RollWoodValues = {maxpitch = 120 minpitch = 30 maxvol = 100 minvol = 20}
RollWoodShingleValues = {maxpitch = 80 minpitch = 20 maxvol = 100 minvol = 20}
OllieWoodValues = {maxvol = 120 minvol = 60}
LandWoodValues = {maxvol = 120 minvol = 60}
BonkWoodValues = {maxvol = 90 minvol = 30}

script SetTerrainDefault 
    LoadTerrainSounds terrain = terrain_default
endscript


script SetTerrainConcSmooth 
    LoadTerrainSounds terrain = TERRAIN_CONCSMOOTH
endscript


script SetTerrainMetalSmooth 
    LoadTerrainSounds terrain = terrain_metalsmooth
endscript


script SetTerrainWood 
    LoadTerrainSounds terrain = TERRAIN_WOOD
endscript


script SetTerrainGrindWire 
    LoadTerrainSounds terrain = TERRAIN_GRINDWIRE
endscript

standard_terrain_default = {
    soundactions = {
        TA_ROLL = {sound = 'Terrains\RollConcSmooth02' maxpitch = 120 minpitch = 80 loadvol = 100}
        TA_GRIND = {sound = 'Terrains\GrindMetal02' maxpitch = 115 minpitch = 100 maxvol = 120 minvol = 20}
        TA_OLLIE = [
            {
                soundAction = [
                    {chance = 1 sound = 'Terrains\OllieConc19' OllieConcValues}
                    {chance = 8 sound = 'Terrains\OllieConc' OllieConcValues}
                ]
            }
        ]
        TA_LAND = {sound = 'Terrains\LandConc' LandConcValues loadvol = 100}
        TA_BONK = {sound = 'Terrains\LandConc' LandConcValues loadvol = 100}
        TA_GRINDJUMP = {sound = 'Terrains\GrindMetalOff02' maxvol = 90 minvol = 70}
        TA_GRINDLAND = [
            {
                useupto = 30
                soundAction = {sound = 'Terrains\GrindMetalOn08' maxvol = 150 minvol = 100 maxpitch = 120 minpitch = 100}
            }
            {
                soundAction = {sound = 'Terrains\GrindMetalOn02' maxvol = 150 minvol = 100 maxpitch = 120 minpitch = 100}
            }
        ]
        TA_SLIDE = {sound = 'Terrains\SlideMetal02' maxpitch = 140 minpitch = 100 maxvol = 100 minvol = 20}
        TA_SLIDEJUMP = {sound = 'Terrains\GrindMetalOff02' maxvol = 90 minvol = 70}
        TA_SLIDELAND = [
            {
                useupto = 30
                soundAction = {sound = 'Terrains\GrindMetalOn08' maxvol = 150 minvol = 100 maxpitch = 120 minpitch = 100}
            }
            {
                soundAction = {sound = 'Terrains\GrindMetalOn02' maxvol = 150 minvol = 100 maxpitch = 120 minpitch = 100}
            }
        ]
        TA_REVERT = {sound = 'Skater\RevertConc' loadvol = 180}
    }
    treadActions = {
        SkaterGrindParticleParms = [
            { skater_sparks_params }
        ]
    }
}
STANDARD_TERRAIN_CONCSMOOTH = {
    soundactions = {
        TA_ROLL = {sound = 'Terrains\RollConcSmooth02' maxpitch = 120 minpitch = 80 loadvol = 100}
        TA_GRIND = {sound = 'Terrains\GrindConc04' maxpitch = 90 minpitch = 60 maxvol = 100 minvol = 20}
        TA_LAND = {sound = 'Terrains\LandConc' LandConcValues loadvol = 100}
        TA_BONK = {sound = 'Terrains\LandConc' LandConcValues loadvol = 70}
        TA_GRINDJUMP = { sound = 'Terrains\OllieConc' OllieConcValues }
        TA_GRINDLAND = {sound = 'Terrains\LandConc' maxvol = 150 minvol = 100 loadvol = 100}
        TA_SLIDE = { sound = 'Terrains\SlideConc14' SlideConcValues }
        TA_SLIDEJUMP = { sound = 'Terrains\OllieConc' OllieConcValues }
        TA_SLIDELAND = {sound = 'Terrains\LandConc' maxvol = 120 minvol = 80 loadvol = 100}
        TA_REVERT = {sound = 'Skater\RevertConc' loadvol = 180}
    }
}
STANDARD_TERRAIN_CONCROUGH = {
    soundactions = {
        TA_ROLL = {sound = 'Terrains\RollConcRough' maxpitch = 120 minpitch = 50 loadvol = 70}
        TA_GRIND = {sound = 'Terrains\GrindConc04' maxpitch = 90 minpitch = 60 maxvol = 100 minvol = 20}
        TA_LAND = {sound = 'Terrains\LandConc' LandConcValues loadvol = 100}
        TA_BONK = {sound = 'Terrains\LandConc' LandConcValues loadvol = 70}
        TA_GRINDJUMP = { sound = 'Terrains\OllieConc' OllieConcValues }
        TA_GRINDLAND = {sound = 'Terrains\LandConc' maxvol = 150 minvol = 100 loadvol = 100}
        TA_SLIDE = { sound = 'Terrains\SlideConc14' SlideConcValues }
        TA_SLIDEJUMP = { sound = 'Terrains\OllieConc' OllieConcValues }
        TA_SLIDELAND = {sound = 'Terrains\LandConc' maxvol = 120 minvol = 80 loadvol = 100}
        TA_REVERT = {sound = 'Skater\RevertConc' loadvol = 180}
    }
}
STANDARD_TERRAIN_BRICK = {
    soundactions = {
        TA_ROLL = {sound = 'Terrains\RollBrick' loadvol = 80 maxpitch = 120 minpitch = 80 maxvol = 100 minvol = 20}
        TA_GRIND = {sound = 'Terrains\GrindConc04' maxpitch = 90 minpitch = 60 maxvol = 100 minvol = 20}
        TA_LAND = {sound = 'Terrains\LandConc' LandConcValues loadvol = 100}
        TA_BONK = {sound = 'Terrains\LandConc' LandConcValues loadvol = 70}
        TA_GRINDJUMP = { sound = 'Terrains\OllieConc' OllieConcValues }
        TA_GRINDLAND = {sound = 'Terrains\LandConc' maxvol = 150 minvol = 100 loadvol = 100}
        TA_SLIDE = { sound = 'Terrains\SlideConc14' SlideConcValues }
        TA_SLIDEJUMP = { sound = 'Terrains\OllieConc' OllieConcValues }
        TA_SLIDELAND = {sound = 'Terrains\LandConc' maxvol = 120 minvol = 80 loadvol = 100}
        TA_REVERT = {sound = 'Skater\RevertConc' loadvol = 180}
    }
}
STANDARD_TERRAIN_ASPHALT = {
    soundactions = {
        TA_ROLL = {sound = 'Terrains\RollAsphalt' maxpitch = 120 minpitch = 80}
        TA_GRIND = {sound = 'Terrains\GrindConc04' maxpitch = 90 minpitch = 60 maxvol = 100 minvol = 20}
        TA_LAND = {sound = 'Terrains\LandConc' LandConcValues loadvol = 100}
        TA_BONK = {sound = 'Terrains\LandConc' LandConcValues loadvol = 70}
        TA_GRINDJUMP = { sound = 'Terrains\OllieConc' OllieConcValues }
        TA_GRINDLAND = {sound = 'Terrains\LandConc' maxvol = 150 minvol = 100 loadvol = 100}
        TA_SLIDE = { sound = 'Terrains\SlideConc14' SlideConcValues }
        TA_SLIDEJUMP = { sound = 'Terrains\OllieConc' OllieConcValues }
        TA_SLIDELAND = {sound = 'Terrains\LandConc' maxvol = 120 minvol = 80 loadvol = 100}
        TA_REVERT = {sound = 'Skater\RevertConc' loadvol = 180}
    }
}
STANDARD_TERRAIN_SIDEWALK = {
    soundactions = {
        TA_ROLL = {sound = 'Terrains\RollSidewalk' loadvol = 100 maxpitch = 90 minpitch = 50 maxvol = 100 minvol = 20}
        TA_GRIND = {sound = 'Terrains\GrindConc04' maxpitch = 90 minpitch = 60 maxvol = 100 minvol = 20}
        TA_LAND = {sound = 'Terrains\LandConc' LandConcValues loadvol = 100}
        TA_BONK = {sound = 'Terrains\LandConc' LandConcValues loadvol = 70}
        TA_GRINDJUMP = { sound = 'Terrains\OllieConc' OllieConcValues }
        TA_GRINDLAND = {sound = 'Terrains\LandConc' maxvol = 150 minvol = 100 loadvol = 100}
        TA_SLIDE = { sound = 'Terrains\SlideConc14' SlideConcValues }
        TA_SLIDEJUMP = { sound = 'Terrains\OllieConc' OllieConcValues }
        TA_SLIDELAND = {sound = 'Terrains\LandConc' maxvol = 120 minvol = 80 loadvol = 100}
        TA_REVERT = {sound = 'Skater\RevertConc' loadvol = 180}
    }
}
STANDARD_TERRAIN_WETCONC = {
    soundactions = {
        TA_ROLL = {sound = 'Terrains\RollWetConc_11' loadvol = 70 maxpitch = 120 minpitch = 50}
        TA_GRIND = {sound = 'Terrains\GrindConc04' maxpitch = 90 minpitch = 60 maxvol = 100 minvol = 20}
        TA_LAND = {sound = 'Terrains\LandWater' LandConcValues loadvol = 100}
        TA_BONK = {sound = 'Terrains\LandConc' LandConcValues loadvol = 70}
        TA_GRINDJUMP = { sound = 'Terrains\OllieConc' OllieConcValues }
        TA_GRINDLAND = {sound = 'Terrains\LandConc' maxvol = 150 minvol = 100 loadvol = 100}
        TA_SLIDE = { sound = 'Terrains\SlideConc14' SlideConcValues }
        TA_SLIDEJUMP = { sound = 'Terrains\OllieConc' OllieConcValues }
        TA_SLIDELAND = {sound = 'Terrains\LandConc' maxvol = 120 minvol = 80 loadvol = 100}
        TA_REVERT = {sound = 'Skater\RevertConc' loadvol = 180}
    }
}
STANDARD_TERRAIN_METALSMOOTH = {
    soundactions = {
        TA_ROLL = {sound = 'Terrains\RollMetalSmooth_11' maxpitch = 120 minpitch = 50 maxvol = 100 minvol = 20}
        TA_OLLIE = {sound = 'Terrains\OllieMetal' loadvol = 120 OllieMetalValues}
        TA_LAND = { sound = 'Terrains\LandMetal' LandMetalValues }
        TA_BONK = { sound = 'Terrains\BonkMetal_11' BonkMetalValues }
        TA_REVERT = {sound = 'Skater\RevertMetal' loadvol = 200}
    }
}
STANDARD_TERRAIN_METALROUGH = {
    soundactions = {
        TA_ROLL = {sound = 'Terrains\RollMetalRough_11' maxpitch = 120 minpitch = 50 maxvol = 100 minvol = 20}
        TA_OLLIE = {sound = 'Terrains\OllieMetal' loadvol = 120 OllieMetalValues}
        TA_LAND = { sound = 'Terrains\LandMetal' LandMetalValues }
        TA_BONK = { sound = 'Terrains\BonkMetal_11' BonkMetalValues }
        TA_REVERT = {sound = 'Skater\RevertMetal' loadvol = 200}
    }
}
STANDARD_TERRAIN_METALCORRUGATED = {
    soundactions = {
        TA_ROLL = {sound = 'Terrains\RollMetalCorrugated_11' maxpitch = 120 minpitch = 50 maxvol = 100 minvol = 20}
        TA_OLLIE = {sound = 'Terrains\OllieMetal' loadvol = 120 OllieMetalValues}
        TA_LAND = { sound = 'Terrains\LandMetal' LandMetalValues }
        TA_BONK = { sound = 'Terrains\BonkMetal_11' BonkMetalValues }
        TA_REVERT = {sound = 'Skater\RevertMetal' loadvol = 200}
    }
}
STANDARD_TERRAIN_METALGRATING = {
    soundactions = {
        TA_ROLL = {sound = 'Terrains\RollMetalGrating_11' maxpitch = 120 minpitch = 50 maxvol = 100 minvol = 20}
        TA_OLLIE = {sound = 'Terrains\OllieMetal' loadvol = 120 OllieMetalValues}
        TA_LAND = { sound = 'Terrains\LandMetal' LandMetalValues }
        TA_BONK = { sound = 'Terrains\BonkMetal_11' BonkMetalValues }
        TA_REVERT = {sound = 'Skater\RevertMetal' loadvol = 200}
    }
}
STANDARD_TERRAIN_METALTIN = {
    soundactions = {
        TA_ROLL = {sound = 'Terrains\RollMetalTin' maxpitch = 120 minpitch = 50 maxvol = 100 minvol = 20}
        TA_OLLIE = {sound = 'Terrains\OllieMetal' loadvol = 120 OllieMetalValues}
        TA_LAND = { sound = 'Terrains\LandMetal' LandMetalValues }
        TA_BONK = { sound = 'Terrains\BonkMetal_11' BonkMetalValues }
        TA_REVERT = {sound = 'Skater\RevertMetal' loadvol = 200}
    }
}
STANDARD_TERRAIN_WOOD = {
    soundactions = {
        TA_ROLL = {sound = 'Terrains\RollWood' loadvol = 50 maxpitch = 120 minpitch = 50 maxvol = 100 minvol = 20}
        TA_GRIND = {sound = 'Terrains\GrindWood' maxpitch = 100 minpitch = 60 maxvol = 100 minvol = 20}
        TA_OLLIE = { sound = 'Terrains\OllieWood' OllieWoodValues }
        TA_LAND = {sound = 'Terrains\LandWood' LandWoodValues loadvol = 100}
        TA_BONK = {sound = 'Terrains\BonkWood' BonkWoodValues loadvol = 100}
        TA_GRINDJUMP = { sound = 'Terrains\OllieWood' OllieWoodValues }
        TA_GRINDLAND = {sound = 'Terrains\LandWood' LandWoodValues loadvol = 100}
        TA_SLIDE = {sound = 'Terrains\SlideWood' pitch = 110 loadvol = 100 maxpitch = 100 minpitch = 60 maxvol = 100 minvol = 20}
        TA_SLIDEJUMP = { sound = 'Terrains\OllieWood' OllieWoodValues }
        TA_SLIDELAND = {sound = 'Terrains\LandWood' LandWoodValues loadvol = 100}
        TA_REVERT = {sound = 'Skater\RevertWood' loadvol = 150}
    }
}
STANDARD_TERRAIN_WOODMASONITE = {
    soundactions = {
        TA_ROLL = {sound = 'Terrains\RollWoodMasonite' loadvol = 50 maxpitch = 120 minpitch = 50 maxvol = 100 minvol = 20}
        TA_OLLIE = { sound = 'Terrains\OllieWood' OllieWoodValues }
        TA_LAND = {sound = 'Terrains\LandWood' LandWoodValues loadvol = 100}
        TA_BONK = {sound = 'Terrains\BonkWood' BonkWoodValues loadvol = 100}
        TA_REVERT = {sound = 'Skater\RevertWood' loadvol = 150}
    }
}
STANDARD_TERRAIN_WOODPLYWOOD = {
    soundactions = {
        TA_ROLL = {sound = 'Terrains\RollWoodPlywood_11' loadvol = 80 maxpitch = 120 minpitch = 80 maxvol = 100 minvol = 20}
        TA_OLLIE = { sound = 'Terrains\OllieWood' OllieWoodValues }
        TA_LAND = {sound = 'Terrains\LandWood' LandWoodValues loadvol = 100}
        TA_BONK = {sound = 'Terrains\BonkWood' BonkWoodValues loadvol = 100}
        TA_REVERT = {sound = 'Skater\RevertWood' loadvol = 150}
    }
}
STANDARD_TERRAIN_WOODFLIMSY = {
    soundactions = {
        TA_ROLL = {sound = 'Terrains\RollWoodFlimsy' loadvol = 80 maxpitch = 120 minpitch = 80 maxvol = 100 minvol = 20}
        TA_OLLIE = { sound = 'Terrains\OllieWood' OllieWoodValues }
        TA_LAND = {sound = 'Terrains\LandWood' LandWoodValues loadvol = 100}
        TA_BONK = {sound = 'Terrains\BonkWood' BonkWoodValues loadvol = 100}
        TA_REVERT = {sound = 'Skater\RevertWood' loadvol = 150}
    }
}
STANDARD_TERRAIN_WOODSHINGLE = {
    soundactions = {
        TA_ROLL = {sound = 'Terrains\RollWoodShingle' loadvol = 80 maxpitch = 80 minpitch = 50 maxvol = 100 minvol = 20}
        TA_OLLIE = { sound = 'Terrains\OllieWood' OllieWoodValues }
        TA_LAND = {sound = 'Terrains\LandWood' LandWoodValues loadvol = 100}
        TA_BONK = {sound = 'Terrains\BonkWood' BonkWoodValues loadvol = 100}
        TA_REVERT = {sound = 'Skater\RevertWood' loadvol = 150}
    }
}
STANDARD_TERRAIN_WOODPIER = {
    soundactions = {
        TA_ROLL = {sound = 'Terrains\RollWoodPier' loadvol = 80 maxpitch = 120 minpitch = 80 maxvol = 100 minvol = 20}
        TA_OLLIE = { sound = 'Terrains\OllieWood' OllieWoodValues }
        TA_LAND = {sound = 'Terrains\LandWood' LandWoodValues loadvol = 100}
        TA_BONK = {sound = 'Terrains\BonkWood' BonkWoodValues loadvol = 100}
        TA_REVERT = {sound = 'Skater\RevertWood' loadvol = 150}
    }
}
STANDARD_TERRAIN_ROCK = {
    soundactions = {
        TA_ROLL = {sound = 'Terrains\RollRock' loadvol = 200 maxpitch = 120 minpitch = 80}
        TA_OLLIE = {sound = 'Terrains\OllieConc' maxpitch = 100 minpitch = 100 maxvol = 100 minvol = 20}
        TA_LAND = { sound = 'Terrains\LandConc' LandConcValues }
        TA_REVERT = {sound = 'Skater\RevertConc' loadvol = 180}
    }
}
STANDARD_TERRAIN_GRAVEL = {
    soundactions = {
        TA_ROLL = {sound = 'Terrains\RollGravel' loadvol = 200 maxpitch = 120 minpitch = 80}
        TA_OLLIE = { sound = 'Terrains\OllieConc' OllieConcValues }
        TA_LAND = { sound = 'Terrains\LandConc' LandConcValues }
        TA_REVERT = {sound = 'Skater\RevertConc' loadvol = 180}
    }
    treadActions = {
        SkaterSkatingParticleParms = [
            { APM_Gravel01_particle_params }
        ]
        SkaterStepParticleParms = [
            { apm_Skater_gravel01_fast_particle_params }
        ]
    }
}
STANDARD_TERRAIN_GRASS = {
    soundactions = {
        TA_ROLL = {sound = 'Terrains\RollGrass' maxpitch = 90 minpitch = 60 maxvol = 100 minvol = 20}
        TA_OLLIE = {sound = 'Terrains\LandDirt' maxpitch = 100 minpitch = 100 maxvol = 100 minvol = 20}
        TA_LAND = {sound = 'Terrains\LandDirt' maxpitch = 100 minpitch = 100 maxvol = 100 minvol = 20}
        TA_REVERT = {sound = 'Skater\RevertConc' loadvol = 180}
    }
    treadActions = {
        SkaterSkatingParticleParms = [
            { apm_Grass01_particle_params }
        ]
    }
}
STANDARD_TERRAIN_GRASSDRIED = {
    soundactions = {
        TA_ROLL = {sound = 'Terrains\RollGrassDried' maxpitch = 50 minpitch = 30 maxvol = 100 minvol = 20}
        TA_OLLIE = {sound = 'Terrains\LandDirt' maxpitch = 100 minpitch = 100 maxvol = 100 minvol = 20}
        TA_LAND = {sound = 'Terrains\LandDirt' maxpitch = 100 minpitch = 100 maxvol = 100 minvol = 20}
        TA_REVERT = {sound = 'Skater\RevertConc' loadvol = 180}
    }
}
STANDARD_TERRAIN_DIRT = {
    soundactions = {
        TA_ROLL = {sound = 'Terrains\RollDirt' maxpitch = 100 minpitch = 60 maxvol = 100 minvol = 20}
        TA_OLLIE = {sound = 'Terrains\LandDirt' maxpitch = 100 minpitch = 100 maxvol = 100 minvol = 20}
        TA_LAND = {sound = 'Terrains\LandDirt' maxpitch = 100 minpitch = 100 maxvol = 100 minvol = 20}
        TA_REVERT = {sound = 'Skater\RevertConc' loadvol = 180}
    }
    treadActions = {
        SkaterSkatingParticleParms = [
            { apm_dirt_puff01_particle_params }
        ]
        SkaterStepParticleParms = [
            { apm_dirt_puff02_particle_params }
        ]
    }
}
STANDARD_TERRAIN_DIRTPACKED = {
    soundactions = {
        TA_ROLL = {sound = 'Terrains\RollDirtPacked' loadvol = 75 maxpitch = 100 minpitch = 60 maxvol = 100 minvol = 20}
        TA_OLLIE = { sound = 'Terrains\OllieWood' }
        TA_LAND = {sound = 'Terrains\LandDirt' maxpitch = 100 minpitch = 100 maxvol = 100 minvol = 20}
        TA_REVERT = {sound = 'Skater\RevertConc' loadvol = 180}
    }
}
STANDARD_TERRAIN_WATER = {
    soundactions = {
        TA_ROLL = {sound = 'Terrains\RollWater_11' loadvol = 150 maxpitch = 120 minpitch = 50}
        TA_OLLIE = { sound = 'Terrains\OllieWater' OllieConcValues }
        TA_LAND = { sound = 'Terrains\LandWater' LandConcValues }
    }
    treadActions = {
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
    soundactions = {
        TA_ROLL = {sound = 'Terrains\RollIce' loadvol = 70 maxpitch = 100 minpitch = 60 maxvol = 100 minvol = 20}
        TA_OLLIE = {sound = 'Terrains\LandDirt' maxpitch = 100 minpitch = 100 maxvol = 100 minvol = 20}
        TA_LAND = {sound = 'Terrains\LandDirt' maxpitch = 100 minpitch = 100 maxvol = 100 minvol = 20}
        TA_REVERT = {sound = 'Skater\RevertWood' loadvol = 150}
    }
}
STANDARD_TERRAIN_SNOW = {
    soundactions = {
        TA_ROLL = {sound = 'Terrains\RollSnow' loadvol = 70 maxpitch = 120 minpitch = 80 maxvol = 100 minvol = 20}
        TA_OLLIE = {sound = 'Terrains\LandDirt' maxpitch = 100 minpitch = 100 maxvol = 100 minvol = 20}
        TA_LAND = {sound = 'Terrains\LandDirt' maxpitch = 100 minpitch = 100 maxvol = 100 minvol = 20}
        TA_REVERT = {sound = 'Skater\RevertConc' loadvol = 180}
    }
}
STANDARD_TERRAIN_SAND = {
    soundactions = {
        TA_ROLL = {sound = 'Terrains\RollSand' loadvol = 80 maxpitch = 120 minpitch = 80 maxvol = 100 minvol = 20}
        TA_OLLIE = {sound = 'Terrains\LandDirt' maxpitch = 100 minpitch = 100 maxvol = 100 minvol = 20}
        TA_LAND = {sound = 'Terrains\LandDirt' maxpitch = 100 minpitch = 100 maxvol = 100 minvol = 20}
        TA_REVERT = {sound = 'Skater\RevertConc' loadvol = 180}
    }
    treadActions = {
        SkaterSkatingParticleParms = [
            { apm_sand_puff01_particle_params }
        ]
        SkaterStepParticleParms = [
            { apm_sand_puff02_particle_params }
        ]
    }
}
STANDARD_TERRAIN_TILE = {
    soundactions = {
        TA_ROLL = {sound = 'Terrains\RollTile' loadvol = 80 maxpitch = 120 minpitch = 80 maxvol = 100 minvol = 20}
        TA_OLLIE = { sound = 'Terrains\OllieConc' OllieConcValues }
        TA_LAND = {sound = 'Terrains\LandConc' LandConcValues loadvol = 100}
        TA_REVERT = {sound = 'Skater\RevertWood' loadvol = 150}
    }
}
STANDARD_TERRAIN_PLEXIGLASS = {
    soundactions = {
        TA_ROLL = {sound = 'Terrains\RollPlexiglass' loadvol = 50 maxpitch = 120 minpitch = 80 maxvol = 100 minvol = 20}
        TA_OLLIE = { sound = 'Terrains\OllieConc' OllieConcValues }
        TA_LAND = { sound = 'Terrains\LandConc' LandConcValues }
        TA_REVERT = {sound = 'Skater\RevertGlass' loadvol = 180}
    }
}
STANDARD_TERRAIN_FIBERGLASS = {
    soundactions = {
        TA_ROLL = {sound = 'Terrains\RollFiberglass' loadvol = 50 maxpitch = 120 minpitch = 80 maxvol = 100 minvol = 20}
        TA_OLLIE = { sound = 'Terrains\OllieConc' OllieConcValues }
        TA_LAND = { sound = 'Terrains\LandConc' LandConcValues }
        TA_REVERT = {sound = 'Skater\RevertGlass' loadvol = 180}
    }
}
STANDARD_TERRAIN_CARPET = {
    soundactions = {
        TA_ROLL = {sound = 'Terrains\RollCarpet' loadvol = 100 RollConcSmoothValues}
        TA_OLLIE = { sound = 'Terrains\OllieConc' OllieConcValues }
        TA_LAND = { sound = 'Terrains\LandConc' LandConcValues }
        TA_REVERT = {sound = 'Skater\RevertWood' loadvol = 150}
    }
}
STANDARD_TERRAIN_CONVEYOR = {
    soundactions = {
        TA_ROLL = {sound = 'Terrains\RollConveyor' loadvol = 70 RollConcSmoothValues}
        TA_OLLIE = { sound = 'Terrains\OllieConc' OllieConcValues }
        TA_LAND = { sound = 'Terrains\LandConc' LandConcValues }
        TA_REVERT = {sound = 'Skater\RevertConc' loadvol = 180}
    }
}
STANDARD_TERRAIN_CHAINLINK = {
    soundactions = {
        TA_BONK = {sound = 'Terrains\BonkChainlink' loadvol = 100 maxpitch = 100 minpitch = 100 maxvol = 100 minvol = 20}
        TA_GRIND = {sound = 'Terrains\GrindMetalPole22' maxpitch = 108 minpitch = 90 maxvol = 120 minvol = 20}
        TA_GRINDJUMP = {sound = 'Terrains\GrindMetalPoleOff21' maxvol = 90 minvol = 70}
        TA_GRINDLAND = [
            {
                useupto = 30
                soundAction = {sound = 'Terrains\GrindMetalOn08' maxvol = 150 minvol = 100 maxpitch = 120 minpitch = 100}
            }
            {
                soundAction = {sound = 'Terrains\GrindChainLinkOn22' maxvol = 150 minvol = 100 maxpitch = 120 minpitch = 100}
            }
        ]
        TA_SLIDE = {sound = 'Terrains\SlideMetalPole22' maxpitch = 140 minpitch = 100 maxvol = 100 minvol = 20}
        TA_SLIDEJUMP = {sound = 'Terrains\GrindMetalPoleOff21' maxvol = 90 minvol = 70}
        TA_SLIDELAND = [
            {
                useupto = 30
                soundAction = {sound = 'Terrains\GrindMetalOn08' maxvol = 150 minvol = 100 maxpitch = 120 minpitch = 100}
            }
            {
                soundAction = {sound = 'Terrains\GrindChainLinkOn22' maxvol = 150 minvol = 100 maxpitch = 120 minpitch = 100}
            }
        ]
    }
}
STANDARD_TERRAIN_METALFUTURE = {
    soundactions = {
        TA_ROLL = {sound = 'Terrains\RollMetalFuture' loadvol = 700 RollMetalSmoothValues}
        TA_OLLIE = { sound = 'Terrains\OllieMetalFuture' OllieMetalValues }
        TA_LAND = { sound = 'Terrains\LandMetalFuture' LandMetalValues }
        TA_REVERT = {sound = 'Skater\RevertMetal' loadvol = 200}
    }
}
STANDARD_TERRAIN_GENERIC1 = {
    soundactions = {
        TA_BONK = {sound = 'Terrains\BonkMetalOutdoor_11' loadvol = 100 BonkMetalValues}
    }
}
STANDARD_TERRAIN_GENERIC2 = {
    soundactions = { 
     }
}
STANDARD_TERRAIN_METALFENCE = {
    soundactions = {
        TA_BONK = {sound = 'Terrains\BonkMetalFence' loadvol = 400 BonkMetalValues}
    }
}
STANDARD_TERRAIN_GRINDCONC = {
    soundactions = {
        TA_GRIND = {sound = 'Terrains\GrindConc04' maxpitch = 90 minpitch = 60 maxvol = 100 minvol = 20}
        TA_GRINDJUMP = { sound = 'Terrains\OllieConc' OllieConcValues }
        TA_GRINDLAND = {sound = 'Terrains\LandConc' maxvol = 150 minvol = 100 loadvol = 100}
        TA_SLIDE = { sound = 'Terrains\SlideConc14' SlideConcValues }
        TA_SLIDEJUMP = { sound = 'Terrains\OllieConc' OllieConcValues }
        TA_SLIDELAND = {sound = 'Terrains\LandConc' maxvol = 120 minvol = 80 loadvol = 100}
    }
    treadActions = {
        SkaterGrindParticleParms = [
            { skater_sparks_params }
            { APM_Debris01_particle_params }
        ]
        SkaterSlideParticleParms = [ 
         ]
    }
}
STANDARD_TERRAIN_GRINDROUNDMETALPOLE = {
    soundactions = {
        TA_GRIND = {sound = 'Terrains\GrindMetalPole22' maxpitch = 105 minpitch = 85 maxvol = 120 minvol = 50}
        TA_GRINDJUMP = {sound = 'Terrains\GrindMetalPoleOff21' maxvol = 90 minvol = 70}
        TA_GRINDLAND = [
            {
                useupto = 30
                soundAction = {sound = 'Terrains\GrindMetalOn08' maxvol = 150 minvol = 100 maxpitch = 120 minpitch = 100}
            }
            {
                soundAction = {sound = 'Terrains\GrindMetalPoleOn21' maxvol = 150 minvol = 100 maxpitch = 120 minpitch = 100}
            }
        ]
        TA_SLIDE = {sound = 'Terrains\SlideMetalPole22' maxpitch = 115 minpitch = 95 maxvol = 100 minvol = 20}
        TA_SLIDEJUMP = {sound = 'Terrains\GrindMetalPoleOff21' maxvol = 90 minvol = 70}
        TA_SLIDELAND = [
            {
                useupto = 30
                soundAction = {sound = 'Terrains\GrindMetalOn08' maxvol = 150 minvol = 100 maxpitch = 120 minpitch = 100}
            }
            {
                soundAction = {sound = 'Terrains\GrindMetalPoleOn21' maxvol = 150 minvol = 100 maxpitch = 120 minpitch = 100}
            }
        ]
    }
}
STANDARD_TERRAIN_GRINDCHAINLINK = {
    soundactions = {
        TA_GRIND = {sound = 'Terrains\GrindMetalPole22' maxpitch = 105 minpitch = 85 maxvol = 120 minvol = 50}
        TA_GRINDJUMP = {sound = 'Terrains\GrindMetalPoleOff21' maxvol = 90 minvol = 70}
        TA_GRINDLAND = [
            {
                useupto = 30
                soundAction = {sound = 'Terrains\GrindMetalOn08' maxvol = 150 minvol = 100 maxpitch = 120 minpitch = 100}
            }
            {
                soundAction = {sound = 'Terrains\GrindChainLinkOn22' maxvol = 150 minvol = 100 maxpitch = 120 minpitch = 100}
            }
        ]
        TA_SLIDE = {sound = 'Terrains\SlideMetalPole22' maxpitch = 115 minpitch = 95 maxvol = 100 minvol = 20}
        TA_SLIDEJUMP = {sound = 'Terrains\GrindMetalPoleOff21' maxvol = 90 minvol = 70}
        TA_SLIDELAND = [
            {
                useupto = 30
                soundAction = {sound = 'Terrains\GrindMetalOn08' maxvol = 150 minvol = 100 maxpitch = 120 minpitch = 100}
            }
            {
                soundAction = {sound = 'Terrains\GrindChainLinkOn22' maxvol = 150 minvol = 100 maxpitch = 120 minpitch = 100}
            }
        ]
    }
}
STANDARD_TERRAIN_GRINDMETAL = {
    soundactions = {
        TA_GRIND = {sound = 'Terrains\GrindMetal02' maxpitch = 115 minpitch = 100 maxvol = 120 minvol = 20}
        TA_GRINDJUMP = {sound = 'Terrains\GrindMetalOff02' maxvol = 90 minvol = 70}
        TA_GRINDLAND = [
            {
                useupto = 30
                soundAction = {sound = 'Terrains\GrindMetalOn08' maxvol = 150 minvol = 100 maxpitch = 120 minpitch = 100}
            }
            {
                soundAction = {sound = 'Terrains\GrindMetalOn02' maxvol = 150 minvol = 100 maxpitch = 120 minpitch = 100}
            }
        ]
        TA_SLIDE = {sound = 'Terrains\SlideMetal02' maxpitch = 140 minpitch = 100 maxvol = 100 minvol = 20}
        TA_SLIDEJUMP = {sound = 'Terrains\GrindMetalOff02' maxvol = 90 minvol = 70}
        TA_SLIDELAND = [
            {
                useupto = 30
                soundAction = {sound = 'Terrains\GrindMetalOn08' maxvol = 150 minvol = 100 maxpitch = 120 minpitch = 100}
            }
            {
                soundAction = {sound = 'Terrains\GrindMetalOn02' maxvol = 150 minvol = 100 maxpitch = 120 minpitch = 100}
            }
        ]
    }
}
STANDARD_TERRAIN_GRINDWOODRAILING = {
    soundactions = {
        TA_GRIND = {sound = 'Terrains\GrindWoodRailing' maxpitch = 150 minpitch = 120 maxvol = 100 minvol = 50}
        TA_GRINDJUMP = {sound = 'Terrains\OllieWood' OllieWoodValues maxpitch = 140 minpitch = 130}
        TA_GRINDLAND = {sound = 'Terrains\LandWood' LandWoodValues loadvol = 100 maxpitch = 150 minpitch = 149}
        TA_SLIDE = {sound = 'Terrains\SlideWood' loadvol = 100 maxpitch = 120 minpitch = 90 maxvol = 100 minvol = 20}
        TA_SLIDEJUMP = {sound = 'Terrains\OllieWood' OllieWoodValues maxpitch = 140 minpitch = 130}
        TA_SLIDELAND = {sound = 'Terrains\LandWood' LandWoodValues loadvol = 100 maxpitch = 150 minpitch = 149}
    }
    treadActions = {
        SkaterGrindParticleParms = [
            { apm_splinter01_particle_params }
        ]
        SkaterSlideParticleParms = [
            { apm_splinter01_particle_params }
        ]
    }
}
STANDARD_TERRAIN_GRINDWOODLOG = {
    soundactions = {
        TA_GRIND = {sound = 'Terrains\GrindWood' maxpitch = 100 minpitch = 60 maxvol = 100 minvol = 20}
        TA_GRINDJUMP = { sound = 'Terrains\OllieWood' OllieWoodValues }
        TA_GRINDLAND = {sound = 'Terrains\LandWood' LandWoodValues loadvol = 100}
        TA_SLIDE = {sound = 'Terrains\SlideWoodLog' loadvol = 100 maxpitch = 120 minpitch = 70 maxvol = 100 minvol = 20}
        TA_SLIDEJUMP = { sound = 'Terrains\OllieWood' OllieWoodValues }
        TA_SLIDELAND = {sound = 'Terrains\LandWood' LandWoodValues loadvol = 100}
    }
    treadActions = {
        SkaterGrindParticleParms = [
            { apm_splinter01_particle_params }
        ]
        SkaterSlideParticleParms = [
            { apm_splinter01_particle_params }
        ]
    }
}
STANDARD_TERRAIN_GRINDWOOD = {
    soundactions = {
        TA_GRIND = {sound = 'Terrains\GrindWood' maxpitch = 100 minpitch = 60 maxvol = 100 minvol = 20}
        TA_GRINDJUMP = { sound = 'Terrains\OllieWood' OllieWoodValues }
        TA_GRINDLAND = {sound = 'Terrains\LandWood' LandWoodValues loadvol = 100}
        TA_SLIDE = {sound = 'Terrains\SlideWood' pitch = 110 loadvol = 100 maxpitch = 100 minpitch = 60 maxvol = 100 minvol = 20}
        TA_SLIDEJUMP = { sound = 'Terrains\OllieWood' OllieWoodValues }
        TA_SLIDELAND = {sound = 'Terrains\LandWood' LandWoodValues loadvol = 100}
    }
    treadActions = {
        SkaterGrindParticleParms = [
            { apm_splinter01_particle_params }
        ]
        SkaterSlideParticleParms = [
            { apm_splinter01_particle_params }
        ]
    }
}
STANDARD_TERRAIN_GRINDPLASTIC = {
    soundactions = {
        TA_GRIND = {sound = 'Terrains\GrindPlastic' maxpitch = 120 minpitch = 90 maxvol = 100 minvol = 20}
        TA_GRINDJUMP = {sound = 'Terrains\OllieWood' OllieWoodValues maxpitch = 130 minpitch = 120}
        TA_GRINDLAND = {sound = 'Terrains\LandWood' LandWoodValues loadvol = 100 maxpitch = 140 minpitch = 139}
        TA_SLIDE = {sound = 'Terrains\GrindPlastic' loadvol = 100 maxpitch = 120 minpitch = 70 maxvol = 100 minvol = 20}
        TA_SLIDEJUMP = {sound = 'Terrains\OllieWood' OllieWoodValues maxpitch = 130 minpitch = 120}
        TA_SLIDELAND = {sound = 'Terrains\LandWood' LandWoodValues loadvol = 100 maxpitch = 140 minpitch = 139}
    }
}
STANDARD_TERRAIN_GRINDCHAIN = {
    soundactions = {
        TA_GRIND = {sound = 'Terrains\GrindChain' maxpitch = 115 minpitch = 100 maxvol = 120 minvol = 20}
        TA_GRINDJUMP = {sound = 'Terrains\GrindMetalOff02' maxvol = 90 minvol = 70}
        TA_GRINDLAND = [
            {
                useupto = 30
                soundAction = {sound = 'Terrains\GrindMetalOn08' maxvol = 150 minvol = 100 maxpitch = 120 minpitch = 100}
            }
            {
                soundAction = {sound = 'Terrains\GrindMetalOn02' maxvol = 150 minvol = 100 maxpitch = 120 minpitch = 100}
            }
        ]
        TA_SLIDE = {sound = 'Terrains\SlideMetal02' maxpitch = 140 minpitch = 100 maxvol = 100 minvol = 20}
        TA_SLIDEJUMP = {sound = 'Terrains\GrindMetalOff02' maxvol = 90 minvol = 70}
        TA_SLIDELAND = [
            {
                useupto = 30
                soundAction = {sound = 'Terrains\GrindMetalOn08' maxvol = 150 minvol = 100 maxpitch = 120 minpitch = 100}
            }
            {
                soundAction = {sound = 'Terrains\GrindMetalOn02' maxvol = 150 minvol = 100 maxpitch = 120 minpitch = 100}
            }
        ]
    }
}
STANDARD_TERRAIN_GRINDELECTRICWIRE = {
    soundactions = {
        TA_GRIND = {sound = 'Terrains\GrindWireSpark' maxpitch = 110 minpitch = 75 maxvol = 180 minvol = 80}
        TA_GRINDJUMP = {sound = 'Terrains\OllieWireSpark' maxvol = 180 minvol = 60}
        TA_GRINDLAND = {sound = 'Terrains\LandWireSpark' maxvol = 200 minvol = 100}
        TA_SLIDE = {sound = 'Terrains\GrindWireSpark' maxpitch = 120 minpitch = 80 maxvol = 150 minvol = 80}
        TA_SLIDEJUMP = {sound = 'Terrains\OllieWireSpark' maxvol = 180 minvol = 60}
        TA_SLIDELAND = {sound = 'Terrains\LandWireSpark' maxvol = 150 minvol = 100}
    }
    treadActions = {
        SkaterGrindParticleParms = [
            { skater_elec_sparks_params }
        ]
        SkaterSlideParticleParms = [ 
         ]
    }
}
STANDARD_TERRAIN_GRINDCABLE = {
    soundactions = {
        TA_GRIND = {sound = 'Terrains\GrindCable' maxpitch = 110 minpitch = 75 maxvol = 180 minvol = 80}
        TA_GRINDJUMP = {sound = 'Terrains\OllieMetal' maxvol = 180 minvol = 60}
        TA_GRINDLAND = {sound = 'Terrains\LandWire' maxvol = 200 minvol = 100}
        TA_SLIDE = {sound = 'Terrains\GrindCable' maxpitch = 120 minpitch = 80 maxvol = 150 minvol = 80}
        TA_SLIDEJUMP = {sound = 'Terrains\OllieMetal' maxvol = 180 minvol = 60}
        TA_SLIDELAND = {sound = 'Terrains\LandWire' maxvol = 150 minvol = 100}
    }
}
STANDARD_TERRAIN_GRINDPLASTICBARRIER = {
    soundactions = {
        TA_GRIND = {sound = 'Terrains\GrindPlastic' maxpitch = 120 minpitch = 90 maxvol = 100 minvol = 20}
        TA_GRINDJUMP = {sound = 'Terrains\OllieWood' OllieWoodValues maxpitch = 130 minpitch = 120}
        TA_GRINDLAND = {sound = 'Terrains\LandWood' LandWoodValues loadvol = 100 maxpitch = 140 minpitch = 139}
        TA_SLIDE = {sound = 'Terrains\SlidePlastic' loadvol = 100 maxpitch = 120 minpitch = 70 maxvol = 100 minvol = 20}
        TA_SLIDEJUMP = {sound = 'Terrains\OllieWood' OllieWoodValues maxpitch = 130 minpitch = 120}
        TA_SLIDELAND = {sound = 'Terrains\LandWood' LandWoodValues loadvol = 100 maxpitch = 140 minpitch = 139}
    }
}
STANDARD_TERRAIN_GRINDNEONLIGHT = {
    soundactions = {
        TA_GRIND = {sound = 'Terrains\GrindWireSpark' maxpitch = 110 minpitch = 75 maxvol = 180 minvol = 80}
        TA_GRINDJUMP = {sound = 'Terrains\OllieWireSpark' maxvol = 180 minvol = 60}
        TA_GRINDLAND = {sound = 'Terrains\LandWireSpark' maxvol = 200 minvol = 100}
        TA_SLIDE = {sound = 'Terrains\GrindWireSpark' maxpitch = 120 minpitch = 80 maxvol = 150 minvol = 80}
        TA_SLIDEJUMP = {sound = 'Terrains\OllieWireSpark' maxvol = 180 minvol = 60}
        TA_SLIDELAND = {sound = 'Terrains\LandWireSpark' maxvol = 150 minvol = 100}
    }
    treadActions = {
        SkaterGrindParticleParms = [
            { skater_elec_sparks_params }
        ]
        SkaterSlideParticleParms = [ 
         ]
    }
}
STANDARD_TERRAIN_GRINDGLASSMONSTER = {
    soundactions = {
        TA_GRIND = {sound = 'Terrains\GrindGlassMonster' maxpitch = 120 minpitch = 90 maxvol = 100 minvol = 20}
        TA_GRINDJUMP = {sound = 'Terrains\OllieWood' OllieWoodValues maxpitch = 130 minpitch = 120}
        TA_GRINDLAND = {sound = 'Terrains\LandWood' LandWoodValues loadvol = 100 maxpitch = 140 minpitch = 139}
        TA_SLIDE = {sound = 'Terrains\GrindGlassMonster' loadvol = 100 maxpitch = 120 minpitch = 70 maxvol = 100 minvol = 20}
        TA_SLIDEJUMP = {sound = 'Terrains\OllieWood' OllieWoodValues maxpitch = 130 minpitch = 120}
        TA_SLIDELAND = {sound = 'Terrains\LandWood' LandWoodValues loadvol = 100 maxpitch = 140 minpitch = 139}
    }
}
STANDARD_TERRAIN_GRINDBANYONTREE = {
    soundactions = {
        TA_GRIND = {sound = 'Terrains\GrindBanyonTree' maxpitch = 100 minpitch = 60 maxvol = 100 minvol = 20}
        TA_GRINDJUMP = { sound = 'Terrains\OllieWood' OllieWoodValues }
        TA_GRINDLAND = {sound = 'Terrains\LandWood' LandWoodValues loadvol = 100}
        TA_SLIDE = {sound = 'Terrains\GrindBanyonTree' loadvol = 100 maxpitch = 120 minpitch = 70 maxvol = 100 minvol = 20}
        TA_SLIDEJUMP = { sound = 'Terrains\OllieWood' OllieWoodValues }
        TA_SLIDELAND = {sound = 'Terrains\LandWood' LandWoodValues loadvol = 100}
    }
}
STANDARD_TERRAIN_GRINDBRASSRAIL = {
    soundactions = {
        TA_GRIND = {sound = 'Terrains\GrindMetalPole22' maxpitch = 105 minpitch = 85 maxvol = 120 minvol = 50}
        TA_GRINDJUMP = {sound = 'Terrains\GrindMetalPoleOff21' maxvol = 90 minvol = 70}
        TA_GRINDLAND = [
            {
                useupto = 30
                soundAction = {sound = 'Terrains\GrindMetalOn08' maxvol = 150 minvol = 100 maxpitch = 120 minpitch = 100}
            }
            {
                soundAction = {sound = 'Terrains\GrindMetalPoleOn21' maxvol = 150 minvol = 100 maxpitch = 120 minpitch = 100}
            }
        ]
        TA_SLIDE = {sound = 'Terrains\SlideMetalPole22' maxpitch = 115 minpitch = 95 maxvol = 100 minvol = 20}
        TA_SLIDEJUMP = {sound = 'Terrains\GrindMetalPoleOff21' maxvol = 90 minvol = 70}
        TA_SLIDELAND = [
            {
                useupto = 30
                soundAction = {sound = 'Terrains\GrindMetalOn08' maxvol = 150 minvol = 100 maxpitch = 120 minpitch = 100}
            }
            {
                soundAction = {sound = 'Terrains\GrindMetalPoleOn21' maxvol = 150 minvol = 100 maxpitch = 120 minpitch = 100}
            }
        ]
    }
}
STANDARD_TERRAIN_GRINDCATWALK = {
    soundactions = {
        TA_GRIND = {sound = 'Terrains\GrindMetal02' maxpitch = 115 minpitch = 100 maxvol = 120 minvol = 20}
        TA_GRINDJUMP = {sound = 'Terrains\GrindMetalOff02' maxvol = 90 minvol = 70}
        TA_GRINDLAND = [
            {
                useupto = 30
                soundAction = {sound = 'Terrains\GrindMetalOn08' maxvol = 150 minvol = 100 maxpitch = 120 minpitch = 100}
            }
            {
                soundAction = {sound = 'Terrains\GrindMetalOn02' maxvol = 150 minvol = 100 maxpitch = 120 minpitch = 100}
            }
        ]
        TA_SLIDE = {sound = 'Terrains\SlideMetal02' maxpitch = 140 minpitch = 100 maxvol = 100 minvol = 20}
        TA_SLIDEJUMP = {sound = 'Terrains\GrindMetalOff02' maxvol = 90 minvol = 70}
        TA_SLIDELAND = [
            {
                useupto = 30
                soundAction = {sound = 'Terrains\GrindMetalOn08' maxvol = 150 minvol = 100 maxpitch = 120 minpitch = 100}
            }
            {
                soundAction = {sound = 'Terrains\GrindMetalOn02' maxvol = 150 minvol = 100 maxpitch = 120 minpitch = 100}
            }
        ]
    }
}
STANDARD_TERRAIN_GRINDTANKTURRET = {
    soundactions = {
        TA_GRIND = {sound = 'Terrains\GrindTankTurret' maxpitch = 115 minpitch = 100 maxvol = 120 minvol = 20}
        TA_GRINDJUMP = {sound = 'Terrains\GrindMetalOff02' maxvol = 90 minvol = 70}
        TA_GRINDLAND = {sound = 'Terrains\LandTankTurret' LandWoodValues loadvol = 100}
        TA_SLIDE = {sound = 'Terrains\SlideMetal02' maxpitch = 140 minpitch = 100 maxvol = 100 minvol = 20}
        TA_SLIDEJUMP = {sound = 'Terrains\GrindMetalOff02' maxvol = 90 minvol = 70}
        TA_SLIDELAND = {sound = 'Terrains\LandTankTurret' LandWoodValues loadvol = 100}
    }
}
STANDARD_TERRAIN_GRINDTRAIN = {
    soundactions = {
        TA_GRIND = {sound = 'Terrains\GrindTrain' loadvol = 100 maxpitch = 100 minpitch = 60 maxvol = 200 minvol = 80}
    }
}
STANDARD_TERRAIN_GRINDROPE = {
    soundactions = {
        TA_GRIND = {sound = 'Terrains\GrindRope' loadvol = 50 pitch = 70 maxpitch = 100 minpitch = 60 maxvol = 200 minvol = 80}
        TA_GRINDJUMP = { sound = 'Terrains\OllieWood' OllieWoodValues }
        TA_GRINDLAND = {sound = 'Terrains\LandWood' loadvol = 80 maxvol = 100 minvol = 60}
        TA_SLIDE = {sound = 'Terrains\GrindRope' loadvol = 50 maxpitch = 100 minpitch = 60 maxvol = 100 minvol = 20}
        TA_SLIDEJUMP = {sound = 'Terrains\OllieWood' loadvol = 80 OllieWoodValues}
        TA_SLIDELAND = {sound = 'Terrains\LandWood' loadvol = 80 maxvol = 120 minvol = 80}
    }
}
STANDARD_TERRAIN_GRINDWIRE = {
    soundactions = {
        TA_GRIND = {sound = 'Terrains\GrindWireSpark' maxpitch = 110 minpitch = 75 maxvol = 150 minvol = 80}
        TA_GRINDJUMP = {sound = 'Terrains\OllieWireSpark' maxvol = 150 minvol = 60}
        TA_GRINDLAND = {sound = 'Terrains\LandWireSpark' maxvol = 175 minvol = 100}
        TA_SLIDE = {sound = 'Terrains\GrindWireSpark' maxpitch = 120 minpitch = 80 maxvol = 130 minvol = 80}
        TA_SLIDEJUMP = {sound = 'Terrains\OllieWireSpark' maxvol = 150 minvol = 60}
        TA_SLIDELAND = {sound = 'Terrains\LandWireSpark' maxvol = 130 minvol = 100}
    }
    treadActions = {
        SkaterGrindParticleParms = [
            { skater_elec_sparks_params }
        ]
        SkaterSlideParticleParms = [ 
         ]
    }
}
terrain_default = standard_terrain_default
TERRAIN_CONCSMOOTH = STANDARD_TERRAIN_CONCSMOOTH
TERRAIN_CONCROUGH = STANDARD_TERRAIN_CONCROUGH
terrain_metalsmooth = STANDARD_TERRAIN_METALSMOOTH
TERRAIN_METALROUGH = STANDARD_TERRAIN_METALROUGH
TERRAIN_METALCORRUGATED = STANDARD_TERRAIN_METALCORRUGATED
TERRAIN_METALGRATING = STANDARD_TERRAIN_METALGRATING
TERRAIN_METALTIN = STANDARD_TERRAIN_METALTIN
TERRAIN_WOOD = STANDARD_TERRAIN_WOOD
terrain_woodmasonite = STANDARD_TERRAIN_WOODMASONITE
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
TERRAIN_GRINDCATWALK = STANDARD_TERRAIN_GRINDCATWALK
TERRAIN_GRINDTANKTURRET = STANDARD_TERRAIN_GRINDTANKTURRET


script PLACEHOLDER_SFX_SCRIPT 
endscript
RollConcSmoothValues = { maxpitch = 120 minpitch = 30 }
RollConcRoughValues = { maxpitch = 120 minpitch = 10 }
OllieConcValues = { maxpitch = 115 minpitch = 80 maxvol = 175 minvol = 120 }
SlideConcValues = { maxpitch = 135 minpitch = 100 maxvol = 130 minvol = 80 }
LandConcValues = { maxvol = 135 minvol = 70 }
BonkConcValues = { maxvol = 140 minvol = 70 }
RollMetalSmoothValues = { maxpitch = 120 minpitch = 30 }
RollMetalRoughValues = { maxpitch = 120 minpitch = 30 maxvol = 100 minvol = 20 }
RollMetalCorrugatedValues = { maxpitch = 250 minpitch = 150 }
OllieMetalValues = { maxvol = 140 minvol = 70 }
LandMetalValues = { maxpitch = 100 minpitch = 100 maxvol = 100 minvol = 40 }
BonkMetalValues = { maxvol = 100 minvol = 30 }
RollWoodValues = { maxpitch = 120 minpitch = 30 maxvol = 100 minvol = 20 }
RollWoodShingleValues = { maxpitch = 80 minpitch = 20 maxvol = 100 minvol = 20 }
OllieWoodValues = { maxvol = 120 minvol = 60 }
LandWoodValues = { maxvol = 120 minvol = 60 }
BonkWoodValues = { maxvol = 90 minvol = 30 }
TERRAIN_DEFAULT_SoundAssets = [
]
TERRAIN_SKATE_DEFAULT_AIR = [
    {}
]
TERRAIN_SKATE_DEFAULT_ROLL = [
    { sound = RollConcSmooth02 maxpitch = 120 minpitch = 80 loadvol = 60 }
]
TERRAIN_SKATE_DEFAULT_OLLIE = [
    { sound = OllieConc19 OllieConcValues }
    { sound = ollieconc OllieConcValues }
]
TERRAIN_SKATE_DEFAULT_LAND = [
    { sound = LandConc LandConcValues loadvol = 100 }
]
TERRAIN_SKATE_DEFAULT_BONK = [
    { sound = LandConc LandConcValues loadvol = 100 }
]
TERRAIN_SKATE_DEFAULT_GRIND = [
    {
        sound = GrindMetal02
        maxpitch = 115
        minpitch = 100
        maxvol = 120
        minvol = 20
    }
]
TERRAIN_SKATE_DEFAULT_GRINDJUMP = [
    { sound = GrindMetalOff02 maxvol = 90 minvol = 70 }
]
TERRAIN_SKATE_DEFAULT_GRINDLAND = [
    {
        sound = GrindMetalOn08
        useupto = 30
        maxvol = 150
        minvol = 100
        maxpitch = 120
        minpitch = 100
    }
    {
        sound = GrindMetalOn02
        maxvol = 150
        minvol = 100
        maxpitch = 120
        minpitch = 100
    }
]
TERRAIN_SKATE_DEFAULT_SLIDE = [
    {
        sound = SlideMetal02
        maxpitch = 140
        minpitch = 100
        maxvol = 100
        minvol = 20
    }
]
TERRAIN_SKATE_DEFAULT_SLIDEJUMP = [
    { sound = GrindMetalOff02 maxvol = 90 minvol = 70 }
]
TERRAIN_SKATE_DEFAULT_SLIDELAND = [
    {
        sound = GrindMetalOn08
        useupto = 30
        maxvol = 150
        minvol = 100
        maxpitch = 120
        minpitch = 100
    }
    {
        sound = GrindMetalOn02
        maxvol = 150
        minvol = 100
        maxpitch = 120
        minpitch = 100
    }
]
TERRAIN_SKATE_DEFAULT_REVERT = [
    { sound = RevertConc loadvol = 180 }
]
TERRAIN_BIKE_DEFAULT_AIR = [
    { sound = bmx_conc_freewheel maxpitch = 120 minpitch = 80 loadvol = 100 }
]
TERRAIN_BIKE_DEFAULT_ROLL = [
    { sound = bmx_conc_freewheel maxpitch = 120 minpitch = 80 loadvol = 100 }
]
TERRAIN_BIKE_DEFAULT_OLLIE = [
    { sound = Bmx_default_ollie maxpitch = 120 minpitch = 80 loadvol = 100 }
]
TERRAIN_BIKE_DEFAULT_LAND = [
    { sound = Bmx_land_default maxpitch = 120 minpitch = 80 loadvol = 100 }
]
TERRAIN_BIKE_DEFAULT_BONK = [
    { sound = Bmx_Default_bonk maxvol = 90 minvol = 70 }
]
TERRAIN_BIKE_DEFAULT_GRIND = [
    { sound = Bmx_Metal_Grindloop maxvol = 90 minvol = 70 }
]
TERRAIN_BIKE_DEFAULT_GRINDJUMP = [
    { sound = GrindMetalOff02 maxvol = 90 minvol = 70 }
]
TERRAIN_BIKE_DEFAULT_GRINDLAND = [
    { sound = GrindMetalOn02 maxvol = 90 minvol = 70 }
]
TERRAIN_CONCSMOOTH_SoundAssets = [
]
TERRAIN_SKATE_CONCSMOOTH_ROLL = [
    { sound = RollConcSmooth02 maxpitch = 120 minpitch = 80 loadvol = 60 }
]
TERRAIN_SKATE_CONCSMOOTH_GRIND = [
]
TERRAIN_SKATE_CONCSMOOTH_LAND = [
    { sound = LandConc LandConcValues loadvol = 100 }
]
TERRAIN_SKATE_CONCSMOOTH_BONK = [
    { sound = LandConc LandConcValues loadvol = 70 }
]
TERRAIN_SKATE_CONCSMOOTH_GRINDJUMP = [
    { sound = ollieconc OllieConcValues }
]
TERRAIN_SKATE_CONCSMOOTH_GRINDLAND = [
    { sound = LandConc maxvol = 150 minvol = 100 loadvol = 100 }
]
TERRAIN_SKATE_CONCSMOOTH_SLIDE = [
    { sound = SlideConc14 SlideConcValues }
]
TERRAIN_SKATE_CONCSMOOTH_SLIDEJUMP = [
    { sound = ollieconc OllieConcValues }
]
TERRAIN_SKATE_CONCSMOOTH_SLIDELAND = [
    { sound = LandConc maxvol = 120 minvol = 80 loadvol = 100 }
]
TERRAIN_SKATE_CONCSMOOTH_REVERT = [
    { sound = ReverConc loadvol = 180 }
]
TERRAIN_CONCROUGH_SoundAssets = [ 'Terrains\RollConcRough' ]
TERRAIN_SKATE_CONCROUGH_ROLL = [
    { sound = RollConcRough maxpitch = 120 minpitch = 50 loadvol = 55 }
]
TERRAIN_SKATE_CONCROUGH_GRIND = [
    {
        sound = GrindConc04
        maxpitch = 90
        minpitch = 60
        maxvol = 100
        minvol = 20
    }
]
TERRAIN_SKATE_CONCROUGH_LAND = [
    { sound = LandConc LandConcValues loadvol = 100 }
]
TERRAIN_SKATE_CONCROUGH_BONK = [
    { sound = LandConc LandConcValues loadvol = 70 }
]
TERRAIN_SKATE_CONCROUGH_GRINDJUMP = [
    { sound = ollieconc OllieConcValues }
]
TERRAIN_SKATE_CONCROUGH_GRINDLAND = [
    { sound = LandConc maxvol = 150 minvol = 100 loadvol = 100 }
]
TERRAIN_SKATE_CONCROUGH_SLIDE = [
    { sound = SlideConc14 SlideConcValues }
]
TERRAIN_SKATE_CONCROUGH_SLIDEJUMP = [
    { sound = ollieconc OllieConcValues }
]
TERRAIN_SKATE_CONCROUGH_SLIDELAND = [
    { sound = LandConc maxvol = 120 minvol = 80 loadvol = 100 }
]
TERRAIN_SKATE_CONCROUGH_REVERT = [
    { sound = ReverConc loadvol = 180 }
]
TERRAIN_BRICK_SoundAssets = [ 'Terrains\RollBrick' ]
TERRAIN_SKATE_BRICK_ROLL = [
    {
        sound = RollBrick
        loadvol = 80
        maxpitch = 120
        minpitch = 80
        maxvol = 100
        minvol = 20
    }
]
TERRAIN_SKATE_BRICK_GRIND = [
    {
        sound = GrindConc04
        maxpitch = 90
        minpitch = 60
        maxvol = 100
        minvol = 20
    }
]
TERRAIN_SKATE_BRICK_LAND = [
    { sound = LandConc LandConcValues loadvol = 100 }
]
TERRAIN_SKATE_BRICK_BONK = [
    { sound = LandConc LandConcValues loadvol = 70 }
]
TERRAIN_SKATE_BRICK_GRINDJUMP = [
    { sound = ollieconc OllieConcValues }
]
TERRAIN_SKATE_BRICK_GRINDLAND = [
    { sound = LandConc maxvol = 150 minvol = 100 loadvol = 100 }
]
TERRAIN_SKATE_BRICK_SLIDE = [
    { sound = SlideConc14 SlideConcValues }
]
TERRAIN_SKATE_BRICK_SLIDEJUMP = [
    { sound = ollieconc OllieConcValues }
]
TERRAIN_SKATE_BRICK_SLIDELAND = [
    { sound = LandConc maxvol = 120 minvol = 80 loadvol = 100 }
]
TERRAIN_SKATE_BRICK_REVERT = [
    { sound = ReverConc loadvol = 180 }
]
TERRAIN_ASPHALT_SoundAssets = [ 'Terrains\RollAsphalt' ]
TERRAIN_SKATE_ASPHALT_ROLL = [
    { sound = RollAsphalt maxpitch = 120 minpitch = 60 }
]
TERRAIN_SKATE_ASPHALT_GRIND = [
    {
        sound = GrindConc04
        maxpitch = 90
        minpitch = 60
        maxvol = 100
        minvol = 20
    }
]
TERRAIN_SKATE_ASPHALT_LAND = [
    { sound = LandConc LandConcValues loadvol = 100 }
]
TERRAIN_SKATE_ASPHALT_BONK = [
    { sound = LandConc LandConcValues loadvol = 70 }
]
TERRAIN_SKATE_ASPHALT_GRINDJUMP = [
    { sound = ollieconc OllieConcValues }
]
TERRAIN_SKATE_ASPHALT_GRINDLAND = [
    { sound = LandConc maxvol = 150 minvol = 100 loadvol = 100 }
]
TERRAIN_SKATE_ASPHALT_SLIDE = [
    { sound = SlideConc14 SlideConcValues }
]
TERRAIN_SKATE_ASPHALT_SLIDEJUMP = [
    { sound = ollieconc OllieConcValues }
]
TERRAIN_SKATE_ASPHALT_SLIDELAND = [
    { sound = LandConc maxvol = 120 minvol = 80 loadvol = 100 }
]
TERRAIN_SKATE_ASPHALT_REVERT = [
    { sound = ReverConc loadvol = 180 }
]
TERRAIN_SIDEWALK_SoundAssets = [ 'Terrains\RollSidewalk' ]
TERRAIN_SKATE_SIDEWALK_ROLL = [
    {
        sound = RollSidewalk
        loadvol = 100
        maxpitch = 90
        minpitch = 50
        maxvol = 100
        minvol = 20
    }
]
TERRAIN_SKATE_SIDEWALK_GRIND = [
    {
        sound = GrindConc04
        maxpitch = 90
        minpitch = 60
        maxvol = 100
        minvol = 20
    }
]
TERRAIN_SKATE_SIDEWALK_LAND = [
    { sound = LandConc LandConcValues loadvol = 100 }
]
TERRAIN_SKATE_SIDEWALK_BONK = [
    { sound = LandConc LandConcValues loadvol = 70 }
]
TERRAIN_SKATE_SIDEWALK_GRINDJUMP = [
    { sound = ollieconc OllieConcValues }
]
TERRAIN_SKATE_SIDEWALK_GRINDLAND = [
    { sound = LandConc maxvol = 150 minvol = 100 loadvol = 100 }
]
TERRAIN_SKATE_SIDEWALK_SLIDE = [
    { sound = SlideConc14 SlideConcValues }
]
TERRAIN_SKATE_SIDEWALK_SLIDEJUMP = [
    { sound = ollieconc OllieConcValues }
]
TERRAIN_SKATE_SIDEWALK_SLIDELAND = [
    { sound = LandConc maxvol = 120 minvol = 80 loadvol = 100 }
]
TERRAIN_SKATE_SIDEWALK_REVERT = [
    { sound = ReverConc loadvol = 180 }
]
TERRAIN_WETCONC_SoundAssets = [ 'Terrains\RollWetConc_11' ]
TERRAIN_SKATE_WETCONC_ROLL = [
    { sound = RollWetConc_11 loadvol = 70 maxpitch = 120 minpitch = 50 }
]
TERRAIN_SKATE_WETCONC_GRIND = [
    {
        sound = GrindConc04
        maxpitch = 90
        minpitch = 60
        maxvol = 100
        minvol = 20
    }
]
TERRAIN_SKATE_WETCONC_LAND = [
    { sound = LandConc LandConcValues loadvol = 100 }
]
TERRAIN_SKATE_WETCONC_BONK = [
    { sound = LandConc LandConcValues loadvol = 70 }
]
TERRAIN_SKATE_WETCONC_GRINDJUMP = [
    { sound = ollieconc OllieConcValues }
]
TERRAIN_SKATE_WETCONC_GRINDLAND = [
    { sound = LandConc maxvol = 150 minvol = 100 loadvol = 100 }
]
TERRAIN_SKATE_WETCONC_SLIDE = [
    { sound = SlideConc14 SlideConcValues }
]
TERRAIN_SKATE_WETCONC_SLIDEJUMP = [
    { sound = ollieconc OllieConcValues }
]
TERRAIN_SKATE_WETCONC_SLIDELAND = [
    { sound = LandConc maxvol = 120 minvol = 80 loadvol = 100 }
]
TERRAIN_SKATE_WETCONC_REVERT = [
    { sound = ReverConc loadvol = 180 }
]
TERRAIN_METALSMOOTH_SoundAssets = [ 'Terrains\RollMetalSmooth_11' 'Terrains\OllieMetal' 'Terrains\LandMetal' 'Skater\RevertMetal' ]
TERRAIN_SKATE_METALSMOOTH_ROLL = [
    {
        sound = RollMetalSmooth_11
        maxpitch = 120
        minpitch = 50
        maxvol = 100
        minvol = 20
    }
]
TERRAIN_SKATE_METALSMOOTH_OLLIE = [
    { sound = OllieMetal loadvol = 120 OllieMetalValues }
]
TERRAIN_SKATE_METALSMOOTH_LAND = [
    { sound = LandMetal LandMetalValues }
]
TERRAIN_SKATE_METALSMOOTH_BONK = [
    { sound = BonkMetal_11 BonkMetalValues }
]
TERRAIN_SKATE_METALSMOOTH_REVERT = [
    { sound = RevertMetal loadvol = 200 }
]
TERRAIN_METALROUGH_SoundAssets = [ 'Terrains\RollMetalRough_11' 'Terrains\OllieMetal' 'Terrains\LandMetal' 'Skater\RevertMetal' ]
TERRAIN_SKATE_METALROUGH_ROLL = [
    {
        sound = RollMetalRough_11
        maxpitch = 120
        minpitch = 50
        maxvol = 100
        minvol = 20
    }
]
TERRAIN_SKATE_METALROUGH_OLLIE = [
    { sound = OllieMetal loadvol = 120 OllieMetalValues }
]
TERRAIN_SKATE_METALROUGH_LAND = [
    { sound = LandMetal LandMetalValues }
]
TERRAIN_SKATE_METALROUGH_BONK = [
    { sound = BonkMetal_11 BonkMetalValues }
]
TERRAIN_SKATE_METALROUGH_REVERT = [
    { sound = RevertMetal loadvol = 200 }
]
TERRAIN_METALCORRUGATED_SoundAssets = [ 'Terrains\RollMetalCorrugated_11' 'Terrains\OllieMetal' 'Terrains\LandMetal' 'Skater\RevertMetal' ]
TERRAIN_SKATE_METALCORRUGATED_ROLL = [
    {
        sound = RollMetalCorrugated_11
        maxpitch = 120
        minpitch = 50
        maxvol = 100
        minvol = 20
    }
]
TERRAIN_SKATE_METALCORRUGATED_OLLIE = [
    { sound = OllieMetal loadvol = 120 OllieMetalValues }
]
TERRAIN_SKATE_METALCORRUGATED_LAND = [
    { sound = LandMetal LandMetalValues }
]
TERRAIN_SKATE_METALCORRUGATED_BONK = [
    { sound = BonkMetal_11 BonkMetalValues }
]
TERRAIN_SKATE_METALCORRUGATED_REVERT = [
    { sound = RevertMetal loadvol = 200 }
]
TERRAIN_METALGRATING_SoundAssets = [ 'Terrains\RollMetalGrating_11' 'Terrains\OllieMetal' 'Terrains\LandMetal' 'Skater\RevertMetal' ]
TERRAIN_SKATE_METALGRATING_ROLL = [
    {
        sound = RollMetalGrating_11
        maxpitch = 120
        minpitch = 50
        maxvol = 100
        minvol = 20
    }
]
TERRAIN_SKATE_METALGRATING_OLLIE = [
    { sound = OllieMetal loadvol = 120 OllieMetalValues }
]
TERRAIN_SKATE_METALGRATING_LAND = [
    { sound = LandMetal LandMetalValues }
]
TERRAIN_SKATE_METALGRATING_BONK = [
    { sound = BonkMetal_11 BonkMetalValues }
]
TERRAIN_SKATE_METALGRATING_REVERT = [
    { sound = RevertMetal loadvol = 200 }
]
TERRAIN_METALTIN_SoundAssets = [ 'Terrains\RollMetalTin' 'Terrains\OllieMetal' 'Terrains\LandMetal' 'Skater\RevertMetal' ]
TERRAIN_SKATE_METALTIN_ROLL = [
    {
        sound = RollMetalTin
        maxpitch = 120
        minpitch = 50
        maxvol = 100
        minvol = 20
    }
]
TERRAIN_SKATE_METALTIN_OLLIE = [
    { sound = OllieMetal loadvol = 120 OllieMetalValues }
]
TERRAIN_SKATE_METALTIN_LAND = [
    { sound = LandMetal LandMetalValues }
]
TERRAIN_SKATE_METALTIN_BONK = [
    { sound = BonkMetal_11 BonkMetalValues }
]
TERRAIN_SKATE_METALTIN_REVERT = [
    { sound = RevertMetal loadvol = 200 }
]
TERRAIN_WOOD_SoundAssets = [
    'Terrains\RollWood'
    'Terrains\GrindWood'
    'Terrains\OllieWood'
    'Terrains\LandWood'
    'Terrains\BonkWood'
    'Terrains\OllieWood'
    'Terrains\LandWood'
    'Terrains\SlideWood'
    'Terrains\OllieWood'
    'Terrains\LandWood'
    'Skater\RevertWood'
]
TERRAIN_SKATE_WOOD_ROLL = [
    {
        sound = RollWood
        loadvol = 50
        maxpitch = 120
        minpitch = 50
        maxvol = 100
        minvol = 20
    }
]
TERRAIN_SKATE_WOOD_GRIND = [
    {
        sound = GrindWood
        maxpitch = 100
        minpitch = 60
        maxvol = 100
        minvol = 20
    }
]
TERRAIN_SKATE_WOOD_OLLIE = [
    { sound = OllieWood OllieWoodValues }
]
TERRAIN_SKATE_WOOD_LAND = [
    { sound = LandWood LandWoodValues loadvol = 100 }
]
TERRAIN_SKATE_WOOD_BONK = [
    { sound = BonkWood BonkWoodValues loadvol = 100 }
]
TERRAIN_SKATE_WOOD_GRINDJUMP = [
    { sound = OllieWood OllieWoodValues }
]
TERRAIN_SKATE_WOOD_GRINDLAND = [
    { sound = LandWood LandWoodValues loadvol = 100 }
]
TERRAIN_SKATE_WOOD_SLIDE = [
    {
        sound = SlideWood
        pitch = 110
        loadvol = 100
        maxpitch = 100
        minpitch = 60
        maxvol = 100
        minvol = 20
    }
]
TERRAIN_SKATE_WOOD_SLIDEJUMP = [
    { sound = OllieWood OllieWoodValues }
]
TERRAIN_SKATE_WOOD_SLIDELAND = [
    { sound = LandWood LandWoodValues loadvol = 100 }
]
TERRAIN_SKATE_WOOD_REVERT = [
    { sound = RevertWood loadvol = 150 }
]
TERRAIN_WOODMASONITE_SoundAssets = [
    'Terrains\RollWoodMasonite'
    'Terrains\OllieWood'
    'Terrains\LandWood'
    'Terrains\BonkWood'
    'Skater\RevertWood'
]
TERRAIN_SKATE_WOODMASONITE_ROLL = [
    {
        sound = RollWoodMasonite
        loadvol = 50
        maxpitch = 120
        minpitch = 50
        maxvol = 100
        minvol = 20
    }
]
TERRAIN_SKATE_WOODMASONITE_OLLIE = [
    { sound = OllieWood OllieWoodValues }
]
TERRAIN_SKATE_WOODMASONITE_LAND = [
    { sound = LandWood LandWoodValues loadvol = 100 }
]
TERRAIN_SKATE_WOODMASONITE_BONK = [
    { sound = BonkWood BonkWoodValues loadvol = 100 }
]
TERRAIN_SKATE_WOODMASONITE_REVERT = [
    { sound = RevertWood loadvol = 150 }
]
TERRAIN_WOODPLYWOOD_SoundAssets = [
    'Terrains\RollWoodPlywood_11'
    'Terrains\OllieWood'
    'Terrains\LandWood'
    'Terrains\BonkWood'
    'Skater\RevertWood'
]
TERRAIN_SKATE_WOODPLYWOOD_ROLL = [
    {
        sound = RollWoodPlywood_11
        loadvol = 80
        maxpitch = 120
        minpitch = 80
        maxvol = 100
        minvol = 20
    }
]
TERRAIN_SKATE_WOODPLYWOOD_OLLIE = [
    { sound = OllieWood OllieWoodValues }
]
TERRAIN_SKATE_WOODPLYWOOD_LAND = [
    { sound = LandWood LandWoodValues loadvol = 100 }
]
TERRAIN_SKATE_WOODPLYWOOD_BONK = [
    { sound = BonkWood BonkWoodValues loadvol = 100 }
]
TERRAIN_SKATE_WOODPLYWOOD_REVERT = [
    { sound = RevertWood loadvol = 150 }
]
TERRAIN_WOODFLIMSY_SoundAssets = [
    'Terrains\RollWoodFlimsy'
    'Terrains\OllieWood'
    'Terrains\LandWood'
    'Terrains\BonkWood'
    'Skater\RevertWood'
]
TERRAIN_SKATE_WOODFLIMSY_ROLL = [
    {
        sound = RollWoodFlimsy
        loadvol = 80
        maxpitch = 120
        minpitch = 80
        maxvol = 100
        minvol = 20
    }
]
TERRAIN_SKATE_WOODFLIMSY_OLLIE = [
    { sound = OllieWood OllieWoodValues }
]
TERRAIN_SKATE_WOODFLIMSY_LAND = [
    { sound = LandWood LandWoodValues loadvol = 100 }
]
TERRAIN_SKATE_WOODFLIMSY_BONK = [
    { sound = BonkWood BonkWoodValues loadvol = 100 }
]
TERRAIN_SKATE_WOODFLIMSY_REVERT = [
    { sound = RevertWood loadvol = 150 }
]
TERRAIN_WOODSHINGLE_SoundAssets = [
    'Terrains\RollWoodShingle'
    'Terrains\OllieWood'
    'Terrains\LandWood'
    'Terrains\BonkWood'
    'Skater\RevertWood'
]
TERRAIN_SKATE_WOODSHINGLE_ROLL = [
    {
        sound = RollWoodShingle
        loadvol = 80
        maxpitch = 80
        minpitch = 50
        maxvol = 100
        minvol = 20
    }
]
TERRAIN_SKATE_WOODSHINGLE_OLLIE = [
    { sound = OllieWood OllieWoodValues }
]
TERRAIN_SKATE_WOODSHINGLE_LAND = [
    { sound = LandWood LandWoodValues loadvol = 100 }
]
TERRAIN_SKATE_WOODSHINGLE_BONK = [
    { sound = BonkWood BonkWoodValues loadvol = 100 }
]
TERRAIN_SKATE_WOODSHINGLE_REVERT = [
    { sound = RevertWood loadvol = 150 }
]
TERRAIN_WOODPIER_SoundAssets = [
    'Terrains\RollWoodPier'
    'Terrains\OllieWood'
    'Terrains\LandWood'
    'Terrains\BonkWood'
    'Skater\RevertWood'
]
TERRAIN_SKATE_WOODPIER_ROLL = [
    {
        sound = RollWoodPier
        loadvol = 80
        maxpitch = 120
        minpitch = 80
        maxvol = 100
        minvol = 20
    }
]
TERRAIN_SKATE_WOODPIER_OLLIE = [
    { sound = OllieWood OllieWoodValues }
]
TERRAIN_SKATE_WOODPIER_LAND = [
    { sound = LandWood LandWoodValues loadvol = 100 }
]
TERRAIN_SKATE_WOODPIER_BONK = [
    { sound = BonkWood BonkWoodValues loadvol = 100 }
]
TERRAIN_SKATE_WOODPIER_REVERT = [
    { sound = RevertWood loadvol = 150 }
]
TERRAIN_ROCK_SoundAssets = [ 'Terrains\RollRock' ]
TERRAIN_SKATE_ROCK_ROLL = [
    { sound = RollRock loadvol = 200 maxpitch = 120 minpitch = 80 }
]
TERRAIN_SKATE_ROCK_OLLIE = [
    {
        sound = ollieconc
        maxpitch = 100
        minpitch = 100
        maxvol = 100
        minvol = 20
    }
]
TERRAIN_SKATE_ROCK_LAND = [
    { sound = LandConc LandConcValues }
]
TERRAIN_SKATE_ROCK_REVERT = [
    { sound = RevertConc loadvol = 180 }
]
TERRAIN_GRAVEL_SoundAssets = [ 'Terrains\RollGravel' ]
TERRAIN_SKATE_GRAVEL_ROLL = [
    { sound = RollGravel loadvol = 200 maxpitch = 120 minpitch = 80 }
]
TERRAIN_SKATE_GRAVEL_OLLIE = [
    { sound = ollieconc OllieConcValues }
]
TERRAIN_SKATE_GRAVEL_LAND = [
    { sound = LandConc LandConcValues }
]
TERRAIN_SKATE_GRAVEL_REVERT = [
    { sound = RevertConc loadvol = 180 }
]
TERRAIN_GRASS_SoundAssets = [ 'Terrains\RollGrass' 'Terrains\LandDirt' 'Terrains\LandDirt' ]
TERRAIN_SKATE_GRASS_ROLL = [
    {
        sound = RollGrass
        maxpitch = 90
        minpitch = 60
        maxvol = 100
        minvol = 20
    }
]
TERRAIN_SKATE_GRASS_OLLIE = [
    {
        sound = LandDirt
        maxpitch = 100
        minpitch = 100
        maxvol = 100
        minvol = 20
    }
]
TERRAIN_SKATE_GRASS_LAND = [
    {
        sound = LandDirt
        maxpitch = 100
        minpitch = 100
        maxvol = 100
        minvol = 20
    }
]
TERRAIN_SKATE_GRASS_REVERT = [
    { sound = RevertConc loadvol = 180 }
]
TERRAIN_GRASSDRIED_SoundAssets = [ 'Terrains\RollGrassDried' 'Terrains\LandDirt' 'Terrains\LandDirt' ]
TERRAIN_SKATE_GRASSDRIED_ROLL = [
    {
        sound = RollGrassDried
        maxpitch = 50
        minpitch = 30
        maxvol = 100
        minvol = 20
    }
]
TERRAIN_SKATE_GRASSDRIED_OLLIE = [
    {
        sound = LandDirt
        maxpitch = 100
        minpitch = 100
        maxvol = 100
        minvol = 20
    }
]
TERRAIN_SKATE_GRASSDRIED_LAND = [
    {
        sound = LandDirt
        maxpitch = 100
        minpitch = 100
        maxvol = 100
        minvol = 20
    }
]
TERRAIN_SKATE_GRASSDRIED_REVERT = [
    { sound = RevertConc loadvol = 180 }
]
TERRAIN_DIRT_SoundAssets = [ 'Terrains\RollDirt' 'Terrains\LandDirt' 'Terrains\LandDirt' ]
TERRAIN_SKATE_DIRT_ROLL = [
    {
        sound = RollDirt
        maxpitch = 100
        minpitch = 60
        maxvol = 100
        minvol = 20
    }
]
TERRAIN_SKATE_DIRT_OLLIE = [
    {
        sound = LandDirt
        maxpitch = 100
        minpitch = 100
        maxvol = 100
        minvol = 20
    }
]
TERRAIN_SKATE_DIRT_LAND = [
    {
        sound = LandDirt
        maxpitch = 100
        minpitch = 100
        maxvol = 100
        minvol = 20
    }
]
TERRAIN_SKATE_DIRT_REVERT = [
    { sound = RevertConc loadvol = 180 }
]
TERRAIN_DIRTPACKED_SoundAssets = [ 'Terrains\RollDirtPacked' 'Terrains\OllieWood' 'Terrains\LandDirt' ]
TERRAIN_SKATE_DIRTPACKED_ROLL = [
    {
        sound = RollDirtPacked
        loadvol = 75
        maxpitch = 100
        minpitch = 60
        maxvol = 100
        minvol = 20
    }
]
TERRAIN_SKATE_DIRTPACKED_OLLIE = [
    { sound = OllieWood }
]
TERRAIN_SKATE_DIRTPACKED_LAND = [
    {
        sound = LandDirt
        maxpitch = 100
        minpitch = 100
        maxvol = 100
        minvol = 20
    }
]
TERRAIN_SKATE_DIRTPACKED_REVERT = [
    { sound = RevertConc loadvol = 180 }
]
TERRAIN_WATER_SoundAssets = [ 'Terrains\RollWater_11' 'Terrains\OllieWater' 'Terrains\LandWater' ]
TERRAIN_SKATE_WATER_ROLL = [
    { sound = RollWater_11 loadvol = 150 maxpitch = 120 minpitch = 50 }
]
TERRAIN_SKATE_WATER_OLLIE = [
    { sound = OllieWater OllieConcValues }
]
TERRAIN_SKATE_WATER_LAND = [
    { sound = LandWater LandConcValues }
]
TERRAIN_ICE_SoundAssets = [ 'Terrains\RollIce' 'Terrains\LandDirt' 'Terrains\LandDirt' 'Skater\RevertWood' ]
TERRAIN_SKATE_ICE_ROLL = [
    {
        sound = RollIce
        loadvol = 70
        maxpitch = 100
        minpitch = 60
        maxvol = 100
        minvol = 20
    }
]
TERRAIN_SKATE_ICE_OLLIE = [
    {
        sound = LandDirt
        maxpitch = 100
        minpitch = 100
        maxvol = 100
        minvol = 20
    }
]
TERRAIN_SKATE_ICE_LAND = [
    {
        sound = LandDirt
        maxpitch = 100
        minpitch = 100
        maxvol = 100
        minvol = 20
    }
]
TERRAIN_SKATE_ICE_REVERT = [
    { sound = RevertWood loadvol = 150 }
]
TERRAIN_SNOW_SoundAssets = [ 'Terrains\RollSnow' 'Terrains\LandDirt' 'Terrains\LandDirt' ]
TERRAIN_SKATE_SNOW_ROLL = [
    {
        sound = RollSnow
        loadvol = 70
        maxpitch = 120
        minpitch = 80
        maxvol = 100
        minvol = 20
    }
]
TERRAIN_SKATE_SNOW_OLLIE = [
    {
        sound = LandDirt
        maxpitch = 100
        minpitch = 100
        maxvol = 100
        minvol = 20
    }
]
TERRAIN_SKATE_SNOW_LAND = [
    {
        sound = LandDirt
        maxpitch = 100
        minpitch = 100
        maxvol = 100
        minvol = 20
    }
]
TERRAIN_SKATE_SNOW_REVERT = [
    { sound = RevertConc loadvol = 180 }
]
TERRAIN_SAND_SoundAssets = [ 'Terrains\RollSand' 'Terrains\LandDirt' 'Terrains\LandDirt' ]
TERRAIN_SKATE_SAND_ROLL = [
    {
        sound = RollSand
        loadvol = 80
        maxpitch = 120
        minpitch = 80
        maxvol = 100
        minvol = 20
    }
]
TERRAIN_SKATE_SAND_OLLIE = [
    {
        sound = LandDirt
        maxpitch = 100
        minpitch = 100
        maxvol = 100
        minvol = 20
    }
]
TERRAIN_SKATE_SAND_LAND = [
    {
        sound = LandDirt
        maxpitch = 100
        minpitch = 100
        maxvol = 100
        minvol = 20
    }
]
TERRAIN_SKATE_SAND_REVERT = [
    { sound = RevertConc loadvol = 180 }
]
TERRAIN_TILE_SoundAssets = [ 'Terrains\RollTile' 'Skater\RevertWood' ]
TERRAIN_SKATE_TILE_ROLL = [
    {
        sound = RollTile
        loadvol = 80
        maxpitch = 120
        minpitch = 80
        maxvol = 100
        minvol = 20
    }
]
TERRAIN_SKATE_TILE_OLLIE = [
    { sound = ollieconc OllieConcValues }
]
TERRAIN_SKATE_TILE_LAND = [
    { sound = LandConc LandConcValues loadvol = 100 }
]
TERRAIN_SKATE_TILE_REVERT = [
    { sound = RevertWood loadvol = 150 }
]
TERRAIN_PLEXIGLASS_SoundAssets = [ 'Terrains\RollPlexiglass' 'Skater\RevertGlass' ]
TERRAIN_SKATE_PLEXIGLASS_ROLL = [
    {
        sound = RollPlexiglass
        loadvol = 50
        maxpitch = 120
        minpitch = 80
        maxvol = 100
        minvol = 20
    }
]
TERRAIN_SKATE_PLEXIGLASS_OLLIE = [
    { sound = ollieconc OllieConcValues }
]
TERRAIN_SKATE_PLEXIGLASS_LAND = [
    { sound = LandConc LandConcValues }
]
TERRAIN_SKATE_PLEXIGLASS_REVERT = [
    { sound = RevertGlass loadvol = 180 }
]
TERRAIN_FIBERGLASS_SoundAssets = [ 'Terrains\RollFiberglass' 'Skater\RevertGlass' ]
TERRAIN_SKATE_FIBERGLASS_ROLL = [
    {
        sound = RollFiberglass
        loadvol = 50
        maxpitch = 120
        minpitch = 80
        maxvol = 100
        minvol = 20
    }
]
TERRAIN_SKATE_FIBERGLASS_OLLIE = [
    { sound = ollieconc OllieConcValues }
]
TERRAIN_SKATE_FIBERGLASS_LAND = [
    { sound = LandConc LandConcValues }
]
TERRAIN_SKATE_FIBERGLASS_REVERT = [
    { sound = RevertGlass loadvol = 180 }
]
TERRAIN_CARPET_SoundAssets = [ 'Terrains\RollCarpet' 'Skater\RevertWood' ]
TERRAIN_SKATE_CARPET_ROLL = [
    { sound = RollCarpet loadvol = 100 RollConcSmoothValues }
]
TERRAIN_SKATE_CARPET_OLLIE = [
    { sound = ollieconc OllieConcValues }
]
TERRAIN_SKATE_CARPET_LAND = [
    { sound = LandConc LandConcValues }
]
TERRAIN_SKATE_CARPET_REVERT = [
    { sound = RevertWood loadvol = 150 }
]
TERRAIN_CONVEYOR_SoundAssets = [ 'Terrains\RollConveyor' ]
TERRAIN_SKATE_CONVEYOR_ROLL = [
    { sound = RollConveyor loadvol = 70 RollConcSmoothValues }
]
TERRAIN_SKATE_CONVEYOR_OLLIE = [
    { sound = ollieconc OllieConcValues }
]
TERRAIN_SKATE_CONVEYOR_LAND = [
    { sound = LandConc LandConcValues }
]
TERRAIN_SKATE_CONVEYOR_REVERT = [
    { sound = RevertConc loadvol = 180 }
]
TERRAIN_CHAINLINK_SoundAssets = [
    'Terrains\BonkChainlink'
    'Terrains\GrindMetalPole22'
    'Terrains\GrindMetalPoleOff21'
    'Terrains\GrindChainLinkOn22'
    'Terrains\SlideMetalPole22'
    'Terrains\GrindMetalPoleOff21'
    'Terrains\GrindChainLinkOn22'
]
TERRAIN_SKATE_CHAINLINK_BONK = [
    {
        sound = BonkChainlink
        loadvol = 100
        maxpitch = 100
        minpitch = 100
        maxvol = 100
        minvol = 20
    }
]
TERRAIN_SKATE_CHAINLINK_GRIND = [
    {
        sound = GrindMetalPole22
        maxpitch = 108
        minpitch = 90
        maxvol = 120
        minvol = 20
    }
]
TERRAIN_SKATE_CHAINLINK_GRINDJUMP = [
    { sound = GrindMetalPoleOff21 maxvol = 90 minvol = 70 }
]
TERRAIN_SKATE_CHAINLINK_GRINDLAND = [
    {
        sound = GrindMetalOn08
        useupto = 30
        maxvol = 150
        minvol = 100
        maxpitch = 120
        minpitch = 100
    }
    {
        sound = GrindChainLinkOn22
        maxvol = 150
        minvol = 100
        maxpitch = 120
        minpitch = 100
    }
]
TERRAIN_SKATE_CHAINLINK_SLIDE = [
    {
        sound = SlideMetalPole22
        maxpitch = 140
        minpitch = 100
        maxvol = 100
        minvol = 20
    }
]
TERRAIN_SKATE_CHAINLINK_SLIDEJUMP = [
    { sound = GrindMetalPoleOff21 maxvol = 90 minvol = 70 }
]
TERRAIN_SKATE_CHAINLINK_SLIDELAND = [
    {
        sound = GrindMetalOn08
        useupto = 30
        maxvol = 150
        minvol = 100
        maxpitch = 120
        minpitch = 100
    }
    {
        sound = GrindChainLinkOn22
        maxvol = 150
        minvol = 100
        maxpitch = 120
        minpitch = 100
    }
]
TERRAIN_METALFUTURE_SoundAssets = [ 'Terrains\RollMetalFuture' 'Terrains\OllieMetalFuture' 'Terrains\LandMetalFuture' 'Skater\RevertMetal' ]
TERRAIN_SKATE_METALFUTURE_ROLL = [
    { sound = RollMetalFuture loadvol = 700 RollMetalSmoothValues }
]
TERRAIN_SKATE_METALFUTURE_OLLIE = [
    { sound = OllieMetalFuture OllieMetalValues }
]
TERRAIN_SKATE_METALFUTURE_LAND = [
    { sound = LandMetalFuture LandMetalValues }
]
TERRAIN_SKATE_METALFUTURE_REVERT = [
    { sound = RevertMetal loadvol = 200 }
]
TERRAIN_GENERIC1_SoundAssets = [ 'Terrains\BonkMetalOutdoor_11' ]
TERRAIN_SKATE_GENERIC1_BONK = [
    { sound = BonkMetalOutdoor_11 loadvol = 100 BonkMetalValues }
]
TERRAIN_METALFENCE_SoundAssets = [ 'Terrains\BonkMetalFence' ]
TERRAIN_SKATE_METALFENCE_BONK = [
    { sound = BonkMetalFence loadvol = 400 BonkMetalValues }
]
TERRAIN_GRINDCONC_SoundAssets = [
]
TERRAIN_SKATE_GRINDCONC_GRIND = [
    {
        sound = GrindConc04
        maxpitch = 90
        minpitch = 60
        maxvol = 100
        minvol = 20
    }
]
TERRAIN_SKATE_GRINDCONC_GRINDJUMP = [
    { sound = ollieconc OllieConcValues }
]
TERRAIN_SKATE_GRINDCONC_GRINDLAND = [
    { sound = LandConc maxvol = 150 minvol = 100 loadvol = 100 }
]
TERRAIN_SKATE_GRINDCONC_SLIDE = [
    { sound = SlideConc14 SlideConcValues }
]
TERRAIN_SKATE_GRINDCONC_SLIDEJUMP = [
    { sound = ollieconc OllieConcValues }
]
TERRAIN_SKATE_GRINDCONC_SLIDELAND = [
    { sound = LandConc maxvol = 120 minvol = 80 loadvol = 100 }
]
TERRAIN_GRINDROUNDMETALPOLE_SoundAssets = [
    'Terrains\GrindMetalPole22'
    'Terrains\GrindMetalPoleOff21'
    'Terrains\GrindMetalPoleOn21'
    'Terrains\SlideMetalPole22'
    'Terrains\GrindMetalPoleOff21'
]
TERRAIN_SKATE_GRINDROUNDMETALPOLE_GRIND = [
    {
        sound = GrindMetalPole22
        maxpitch = 105
        minpitch = 85
        maxvol = 120
        minvol = 50
    }
]
TERRAIN_SKATE_GRINDROUNDMETALPOLE_GRINDJUMP = [
    { sound = GrindMetalPoleOff21 maxvol = 90 minvol = 70 }
]
TERRAIN_SKATE_GRINDROUNDMETALPOLE_GRINDLAND = [
    {
        sound = GrindMetalOn08
        useupto = 30
        maxvol = 150
        minvol = 100
        maxpitch = 120
        minpitch = 100
    }
    {
        sound = GrindMetalPoleOn21
        maxvol = 150
        minvol = 100
        maxpitch = 120
        minpitch = 100
    }
]
TERRAIN_SKATE_GRINDROUNDMETALPOLE_SLIDE = [
    {
        sound = SlideMetalPole22
        maxpitch = 115
        minpitch = 95
        maxvol = 100
        minvol = 20
    }
]
TERRAIN_SKATE_GRINDROUNDMETALPOLE_SLIDEJUMP = [
    { sound = GrindMetalPoleOff21 maxvol = 90 minvol = 70 }
]
TERRAIN_SKATE_GRINDROUNDMETALPOLE_SLIDELAND = [
    {
        sound = GrindMetalOn08
        useupto = 30
        maxvol = 150
        minvol = 100
        maxpitch = 120
        minpitch = 100
    }
    {
        sound = GrindMetalPoleOn21
        maxvol = 150
        minvol = 100
        maxpitch = 120
        minpitch = 100
    }
]
TERRAIN_GRINDCHAINLINK_SoundAssets = [
    'Terrains\GrindMetalPole22'
    'Terrains\GrindMetalPoleOff21'
    'Terrains\GrindChainLinkOn22'
    'Terrains\SlideMetalPole22'
    'Terrains\GrindChainLinkOn22'
]
TERRAIN_SKATE_GRINDCHAINLINK_GRIND = [
    {
        sound = GrindMetalPole22
        maxpitch = 105
        minpitch = 85
        maxvol = 120
        minvol = 50
    }
]
TERRAIN_SKATE_GRINDCHAINLINK_GRINDJUMP = [
    { sound = GrindMetalPoleOff21 maxvol = 90 minvol = 70 }
]
TERRAIN_SKATE_GRINDCHAINLINK_GRINDLAND = [
    {
        sound = GrindMetalOn08
        useupto = 30
        maxvol = 150
        minvol = 100
        maxpitch = 120
        minpitch = 100
    }
    {
        sound = GrindChainLinkOn22
        maxvol = 150
        minvol = 100
        maxpitch = 120
        minpitch = 100
    }
]
TERRAIN_SKATE_GRINDCHAINLINK_SLIDE = [
    {
        sound = SlideMetalPole22
        maxpitch = 115
        minpitch = 95
        maxvol = 100
        minvol = 20
    }
]
TERRAIN_SKATE_GRINDCHAINLINK_SLIDEJUMP = [
    { sound = GrindMetalPoleOff21 maxvol = 90 minvol = 70 }
]
TERRAIN_SKATE_GRINDCHAINLINK_SLIDELAND = [
    {
        sound = GrindMetalOn08
        useupto = 30
        maxvol = 150
        minvol = 100
        maxpitch = 120
        minpitch = 100
    }
    {
        sound = GrindChainLinkOn22
        maxvol = 150
        minvol = 100
        maxpitch = 120
        minpitch = 100
    }
]
TERRAIN_GRINDMETAL_SoundAssets = [
]
TERRAIN_SKATE_GRINDMETAL_GRIND = [
    {
        sound = GrindMetal02
        maxpitch = 115
        minpitch = 100
        maxvol = 120
        minvol = 20
    }
]
TERRAIN_SKATE_GRINDMETAL_GRINDJUMP = [
    { sound = GrindMetalOff02 maxvol = 90 minvol = 70 }
]
TERRAIN_SKATE_GRINDMETAL_GRINDLAND = [
    {
        sound = GrindMetalOn08
        useupto = 30
        maxvol = 150
        minvol = 100
        maxpitch = 120
        minpitch = 100
    }
    {
        sound = GrindMetalOn02
        maxvol = 150
        minvol = 100
        maxpitch = 120
        minpitch = 100
    }
]
TERRAIN_SKATE_GRINDMETAL_SLIDE = [
    {
        sound = SlideMetal02
        maxpitch = 140
        minpitch = 100
        maxvol = 100
        minvol = 20
    }
]
TERRAIN_SKATE_GRINDMETAL_SLIDEJUMP = [
    { sound = GrindMetalOff02 maxvol = 90 minvol = 70 }
]
TERRAIN_SKATE_GRINDMETAL_SLIDELAND = [
    {
        sound = GrindMetalOn08
        useupto = 30
        maxvol = 150
        minvol = 100
        maxpitch = 120
        minpitch = 100
    }
    {
        sound = GrindMetalOn02
        maxvol = 150
        minvol = 100
        maxpitch = 120
        minpitch = 100
    }
]
TERRAIN_GRINDWOODRAILING_SoundAssets = [
    'Terrains\GrindWoodRailing'
    'Terrains\OllieWood'
    'Terrains\LandWood'
    'Terrains\SlideWood'
    'Terrains\OllieWood'
    'Terrains\LandWood'
]
TERRAIN_SKATE_GRINDWOODRAILING_GRIND = [
    {
        sound = GrindWoodRailing
        maxpitch = 150
        minpitch = 120
        maxvol = 100
        minvol = 50
    }
]
TERRAIN_SKATE_GRINDWOODRAILING_GRINDJUMP = [
    { sound = OllieWood OllieWoodValues maxpitch = 140 minpitch = 130 }
]
TERRAIN_SKATE_GRINDWOODRAILING_GRINDLAND = [
    {
        sound = LandWood
        LandWoodValues
        loadvol = 100
        maxpitch = 150
        minpitch = 149
    }
]
TERRAIN_SKATE_GRINDWOODRAILING_SLIDE = [
    {
        sound = SlideWood
        loadvol = 100
        maxpitch = 120
        minpitch = 90
        maxvol = 100
        minvol = 20
    }
]
TERRAIN_SKATE_GRINDWOODRAILING_SLIDEJUMP = [
    { sound = OllieWood OllieWoodValues maxpitch = 140 minpitch = 130 }
]
TERRAIN_SKATE_GRINDWOODRAILING_SLIDELAND = [
    {
        sound = LandWood
        LandWoodValues
        loadvol = 100
        maxpitch = 150
        minpitch = 149
    }
]
TERRAIN_GRINDWOODLOG_SoundAssets = [
    'Terrains\GrindWood'
    'Terrains\OllieWood'
    'Terrains\LandWood'
    'Terrains\SlideWoodLog'
    'Terrains\OllieWood'
    'Terrains\LandWood'
]
TERRAIN_SKATE_GRINDWOODLOG_GRIND = [
    {
        sound = GrindWood
        maxpitch = 100
        minpitch = 60
        maxvol = 100
        minvol = 20
    }
]
TERRAIN_SKATE_GRINDWOODLOG_GRINDJUMP = [
    { sound = OllieWood OllieWoodValues }
]
TERRAIN_SKATE_GRINDWOODLOG_GRINDLAND = [
    { sound = LandWood LandWoodValues loadvol = 100 }
]
TERRAIN_SKATE_GRINDWOODLOG_SLIDE = [
    {
        sound = SlideWoodLog
        loadvol = 100
        maxpitch = 120
        minpitch = 70
        maxvol = 100
        minvol = 20
    }
]
TERRAIN_SKATE_GRINDWOODLOG_SLIDEJUMP = [
    { sound = OllieWood OllieWoodValues }
]
TERRAIN_SKATE_GRINDWOODLOG_SLIDELAND = [
    { sound = LandWood LandWoodValues loadvol = 100 }
]
TERRAIN_GRINDWOOD_SoundAssets = [
    'Terrains\GrindWood'
    'Terrains\OllieWood'
    'Terrains\LandWood'
    'Terrains\SlideWood'
    'Terrains\OllieWood'
    'Terrains\LandWood'
]
TERRAIN_SKATE_GRINDWOOD_GRIND = [
    {
        sound = GrindWood
        maxpitch = 100
        minpitch = 60
        maxvol = 100
        minvol = 20
    }
]
TERRAIN_SKATE_GRINDWOOD_GRINDJUMP = [
    { sound = OllieWood OllieWoodValues }
]
TERRAIN_SKATE_GRINDWOOD_GRINDLAND = [
    { sound = LandWood LandWoodValues loadvol = 100 }
]
TERRAIN_SKATE_GRINDWOOD_SLIDE = [
    {
        sound = SlideWood
        pitch = 110
        loadvol = 100
        maxpitch = 100
        minpitch = 60
        maxvol = 100
        minvol = 20
    }
]
TERRAIN_SKATE_GRINDWOOD_SLIDEJUMP = [
    { sound = OllieWood OllieWoodValues }
]
TERRAIN_SKATE_GRINDWOOD_SLIDELAND = [
    { sound = LandWood LandWoodValues loadvol = 100 }
]
TERRAIN_GRINDPLASTIC_SoundAssets = [
    'Terrains\GrindPlastic'
    'Terrains\OllieWood'
    'Terrains\LandWood'
    'Terrains\GrindPlastic'
    'Terrains\OllieWood'
    'Terrains\LandWood'
]
TERRAIN_SKATE_GRINDPLASTIC_GRIND = [
    {
        sound = GrindPlastic
        maxpitch = 120
        minpitch = 90
        maxvol = 100
        minvol = 20
    }
]
TERRAIN_SKATE_GRINDPLASTIC_GRINDJUMP = [
    { sound = OllieWood OllieWoodValues maxpitch = 130 minpitch = 120 }
]
TERRAIN_SKATE_GRINDPLASTIC_GRINDLAND = [
    {
        sound = LandWood
        LandWoodValues
        loadvol = 100
        maxpitch = 140
        minpitch = 139
    }
]
TERRAIN_SKATE_GRINDPLASTIC_SLIDE = [
    {
        sound = GrindPlastic
        loadvol = 100
        maxpitch = 120
        minpitch = 70
        maxvol = 100
        minvol = 20
    }
]
TERRAIN_SKATE_GRINDPLASTIC_SLIDEJUMP = [
    { sound = OllieWood OllieWoodValues maxpitch = 130 minpitch = 120 }
]
TERRAIN_SKATE_GRINDPLASTIC_SLIDELAND = [
    {
        sound = LandWood
        LandWoodValues
        loadvol = 100
        maxpitch = 140
        minpitch = 139
    }
]
TERRAIN_GRINDCHAIN_SoundAssets = [ 'Terrains\GrindChain' ]
TERRAIN_SKATE_GRINDCHAIN_GRIND = [
    {
        sound = GrindChain
        maxpitch = 115
        minpitch = 100
        maxvol = 120
        minvol = 20
    }
]
TERRAIN_SKATE_GRINDCHAIN_GRINDJUMP = [
    { sound = GrindMetalOff02 maxvol = 90 minvol = 70 }
]
TERRAIN_SKATE_GRINDCHAIN_GRINDLAND = [
    {
        sound = GrindMetalOn08
        useupto = 30
        maxvol = 150
        minvol = 100
        maxpitch = 120
        minpitch = 100
    }
    {
        sound = GrindMetalOn02
        maxvol = 150
        minvol = 100
        maxpitch = 120
        minpitch = 100
    }
]
TERRAIN_SKATE_GRINDCHAIN_SLIDE = [
    {
        sound = SlideMetal02
        maxpitch = 140
        minpitch = 100
        maxvol = 100
        minvol = 20
    }
]
TERRAIN_SKATE_GRINDCHAIN_SLIDEJUMP = [
    { sound = GrindMetalOff02 maxvol = 90 minvol = 70 }
]
TERRAIN_SKATE_GRINDCHAIN_SLIDELAND = [
    {
        sound = GrindMetalOn08
        useupto = 30
        maxvol = 150
        minvol = 100
        maxpitch = 120
        minpitch = 100
    }
    {
        sound = GrindMetalOn02
        maxvol = 150
        minvol = 100
        maxpitch = 120
        minpitch = 100
    }
]
TERRAIN_GRINDELECTRICWIRE_SoundAssets = [
    'Terrains\GrindWireSpark'
    'Terrains\OllieWireSpark'
    'Terrains\LandWireSpark'
    'Terrains\GrindWireSpark'
    'Terrains\OllieWireSpark'
    'Terrains\LandWireSpark'
]
TERRAIN_SKATE_GRINDELECTRICWIRE_GRIND = [
    {
        sound = GrindWireSpark
        maxpitch = 110
        minpitch = 75
        maxvol = 180
        minvol = 80
    }
]
TERRAIN_SKATE_GRINDELECTRICWIRE_GRINDJUMP = [
    { sound = OllieWireSpark maxvol = 180 minvol = 60 }
]
TERRAIN_SKATE_GRINDELECTRICWIRE_GRINDLAND = [
    { sound = LandWireSpark maxvol = 200 minvol = 100 }
]
TERRAIN_SKATE_GRINDELECTRICWIRE_SLIDE = [
    {
        sound = GrindWireSpark
        maxpitch = 120
        minpitch = 80
        maxvol = 150
        minvol = 80
    }
]
TERRAIN_SKATE_GRINDELECTRICWIRE_SLIDEJUMP = [
    { sound = OllieWireSpark maxvol = 180 minvol = 60 }
]
TERRAIN_SKATE_GRINDELECTRICWIRE_SLIDELAND = [
    { sound = LandWireSpark maxvol = 150 minvol = 100 }
]
TERRAIN_GRINDCABLE_SoundAssets = [
    'Terrains\GrindCable'
    'Terrains\OllieMetal'
    'Terrains\LandWire'
    'Terrains\GrindCable'
    'Terrains\OllieMetal'
    'Terrains\LandWire'
]
TERRAIN_SKATE_GRINDCABLE_GRIND = [
    {
        sound = GrindCable
        maxpitch = 110
        minpitch = 75
        maxvol = 180
        minvol = 80
    }
]
TERRAIN_SKATE_GRINDCABLE_GRINDJUMP = [
    { sound = OllieMetal maxvol = 180 minvol = 60 }
]
TERRAIN_SKATE_GRINDCABLE_GRINDLAND = [
    { sound = LandWire maxvol = 200 minvol = 100 }
]
TERRAIN_SKATE_GRINDCABLE_SLIDE = [
    {
        sound = GrindCable
        maxpitch = 120
        minpitch = 80
        maxvol = 150
        minvol = 80
    }
]
TERRAIN_SKATE_GRINDCABLE_SLIDEJUMP = [
    { sound = OllieMetal maxvol = 180 minvol = 60 }
]
TERRAIN_SKATE_GRINDCABLE_SLIDELAND = [
    { sound = LandWire maxvol = 150 minvol = 100 }
]
TERRAIN_GRINDPLASTICBARRIER_SoundAssets = [
    'Terrains\GrindPlastic'
    'Terrains\OllieWood'
    'Terrains\LandWood'
    'Terrains\SlidePlastic'
    'Terrains\OllieWood'
    'Terrains\LandWood'
]
TERRAIN_SKATE_GRINDPLASTICBARRIER_GRIND = [
    {
        sound = GrindPlastic
        maxpitch = 120
        minpitch = 90
        maxvol = 100
        minvol = 20
    }
]
TERRAIN_SKATE_GRINDPLASTICBARRIER_GRINDJUMP = [
    { sound = OllieWood OllieWoodValues maxpitch = 130 minpitch = 120 }
]
TERRAIN_SKATE_GRINDPLASTICBARRIER_GRINDLAND = [
    {
        sound = LandWood
        LandWoodValues
        loadvol = 100
        maxpitch = 140
        minpitch = 139
    }
]
TERRAIN_SKATE_GRINDPLASTICBARRIER_SLIDE = [
    {
        sound = SlidePlastic
        loadvol = 100
        maxpitch = 120
        minpitch = 70
        maxvol = 100
        minvol = 20
    }
]
TERRAIN_SKATE_GRINDPLASTICBARRIER_SLIDEJUMP = [
    { sound = OllieWood OllieWoodValues maxpitch = 130 minpitch = 120 }
]
TERRAIN_SKATE_GRINDPLASTICBARRIER_SLIDELAND = [
    {
        sound = LandWood
        LandWoodValues
        loadvol = 100
        maxpitch = 140
        minpitch = 139
    }
]
TERRAIN_GRINDNEONLIGHT_SoundAssets = [
    'Terrains\GrindWireSpark'
    'Terrains\OllieWireSpark'
    'Terrains\LandWireSpark'
    'Terrains\GrindWireSpark'
    'Terrains\OllieWireSpark'
    'Terrains\LandWireSpark'
]
TERRAIN_SKATE_GRINDNEONLIGHT_GRIND = [
    {
        sound = GrindWireSpark
        maxpitch = 110
        minpitch = 75
        maxvol = 180
        minvol = 80
    }
]
TERRAIN_SKATE_GRINDNEONLIGHT_GRINDJUMP = [
    { sound = OllieWireSpark maxvol = 180 minvol = 60 }
]
TERRAIN_SKATE_GRINDNEONLIGHT_GRINDLAND = [
    { sound = LandWireSpark maxvol = 200 minvol = 100 }
]
TERRAIN_SKATE_GRINDNEONLIGHT_SLIDE = [
    {
        sound = GrindWireSpark
        maxpitch = 120
        minpitch = 80
        maxvol = 150
        minvol = 80
    }
]
TERRAIN_SKATE_GRINDNEONLIGHT_SLIDEJUMP = [
    { sound = OllieWireSpark maxvol = 180 minvol = 60 }
]
TERRAIN_SKATE_GRINDNEONLIGHT_SLIDELAND = [
    { sound = LandWireSpark maxvol = 150 minvol = 100 }
]
TERRAIN_GRINDGLASSMONSTER_SoundAssets = [
    'Terrains\GrindGlassMonster'
    'Terrains\OllieWood'
    'Terrains\LandWood'
    'Terrains\GrindGlassMonster'
    'Terrains\OllieWood'
    'Terrains\LandWood'
]
TERRAIN_SKATE_GRINDGLASSMONSTER_GRIND = [
    {
        sound = GrindGlassMonster
        maxpitch = 120
        minpitch = 90
        maxvol = 100
        minvol = 20
    }
]
TERRAIN_SKATE_GRINDGLASSMONSTER_GRINDJUMP = [
    { sound = OllieWood OllieWoodValues maxpitch = 130 minpitch = 120 }
]
TERRAIN_SKATE_GRINDGLASSMONSTER_GRINDLAND = [
    {
        sound = LandWood
        LandWoodValues
        loadvol = 100
        maxpitch = 140
        minpitch = 139
    }
]
TERRAIN_SKATE_GRINDGLASSMONSTER_SLIDE = [
    {
        sound = GrindGlassMonster
        loadvol = 100
        maxpitch = 120
        minpitch = 70
        maxvol = 100
        minvol = 20
    }
]
TERRAIN_SKATE_GRINDGLASSMONSTER_SLIDEJUMP = [
    { sound = OllieWood OllieWoodValues maxpitch = 130 minpitch = 120 }
]
TERRAIN_SKATE_GRINDGLASSMONSTER_SLIDELAND = [
    {
        sound = LandWood
        LandWoodValues
        loadvol = 100
        maxpitch = 140
        minpitch = 139
    }
]
TERRAIN_GRINDBANYONTREE_SoundAssets = [
    'Terrains\GrindBanyonTree'
    'Terrains\OllieWood'
    'Terrains\LandWood'
    'Terrains\GrindBanyonTree'
    'Terrains\OllieWood'
    'Terrains\LandWood'
]
TERRAIN_SKATE_GRINDBANYONTREE_GRIND = [
    {
        sound = GrindBanyonTree
        maxpitch = 100
        minpitch = 60
        maxvol = 100
        minvol = 20
    }
]
TERRAIN_SKATE_GRINDBANYONTREE_GRINDJUMP = [
    { sound = OllieWood OllieWoodValues }
]
TERRAIN_SKATE_GRINDBANYONTREE_GRINDLAND = [
    { sound = LandWood LandWoodValues loadvol = 100 }
]
TERRAIN_SKATE_GRINDBANYONTREE_SLIDE = [
    {
        sound = GrindBanyonTree
        loadvol = 100
        maxpitch = 120
        minpitch = 70
        maxvol = 100
        minvol = 20
    }
]
TERRAIN_SKATE_GRINDBANYONTREE_SLIDEJUMP = [
    { sound = OllieWood OllieWoodValues }
]
TERRAIN_SKATE_GRINDBANYONTREE_SLIDELAND = [
    { sound = LandWood LandWoodValues loadvol = 100 }
]
TERRAIN_GRINDBRASSRAIL_SoundAssets = [ 'Terrains\GrindMetalPole22' 'Terrains\GrindMetalPoleOff21' 'Terrains\GrindMetalPoleOn21' 'Terrains\SlideMetalPole22' ]
TERRAIN_SKATE_GRINDBRASSRAIL_GRIND = [
    {
        sound = GrindMetalPole22
        maxpitch = 105
        minpitch = 85
        maxvol = 120
        minvol = 50
    }
]
TERRAIN_SKATE_GRINDBRASSRAIL_GRINDJUMP = [
    { sound = GrindMetalPoleOff21 maxvol = 90 minvol = 70 }
]
TERRAIN_SKATE_GRINDBRASSRAIL_GRINDLAND = [
    {
        sound = GrindMetalOn08
        useupto = 30
        maxvol = 150
        minvol = 100
        maxpitch = 120
        minpitch = 100
    }
    {
        sound = GrindMetalPoleOn21
        maxvol = 150
        minvol = 100
        maxpitch = 120
        minpitch = 100
    }
]
TERRAIN_SKATE_GRINDBRASSRAIL_SLIDE = [
    {
        sound = SlideMetalPole22
        maxpitch = 115
        minpitch = 95
        maxvol = 100
        minvol = 20
    }
]
TERRAIN_SKATE_GRINDBRASSRAIL_SLIDEJUMP = [
    { sound = GrindMetalPoleOff21 maxvol = 90 minvol = 70 }
]
TERRAIN_SKATE_GRINDBRASSRAIL_SLIDELAND = [
    {
        sound = GrindMetalOn08
        useupto = 30
        maxvol = 150
        minvol = 100
        maxpitch = 120
        minpitch = 100
    }
    {
        sound = GrindMetalPoleOn21
        maxvol = 150
        minvol = 100
        maxpitch = 120
        minpitch = 100
    }
]
TERRAIN_GRINDCATWALK_SoundAssets = [
]
TERRAIN_SKATE_GRINDCATWALK_GRIND = [
    {
        sound = GrindMetal02
        maxpitch = 115
        minpitch = 100
        maxvol = 120
        minvol = 20
    }
]
TERRAIN_SKATE_GRINDCATWALK_GRINDJUMP = [
    { sound = GrindMetalOff02 maxvol = 90 minvol = 70 }
]
TERRAIN_SKATE_GRINDCATWALK_GRINDLAND = [
    {
        sound = GrindMetalOn08
        useupto = 30
        maxvol = 150
        minvol = 100
        maxpitch = 120
        minpitch = 100
    }
    {
        sound = GrindMetalOn02
        maxvol = 150
        minvol = 100
        maxpitch = 120
        minpitch = 100
    }
]
TERRAIN_SKATE_GRINDCATWALK_SLIDE = [
    {
        sound = SlideMetal02
        maxpitch = 140
        minpitch = 100
        maxvol = 100
        minvol = 20
    }
]
TERRAIN_SKATE_GRINDCATWALK_SLIDEJUMP = [
    { sound = GrindMetalOff02 maxvol = 90 minvol = 70 }
]
TERRAIN_SKATE_GRINDCATWALK_SLIDELAND = [
    {
        sound = GrindMetalOn08
        useupto = 30
        maxvol = 150
        minvol = 100
        maxpitch = 120
        minpitch = 100
    }
    {
        sound = GrindMetalOn02
        maxvol = 150
        minvol = 100
        maxpitch = 120
        minpitch = 100
    }
]
TERRAIN_GRINDTANKTURRET_SoundAssets = [
    'Terrains\GrindTankTurret'
    'Terrains\GrindMetalOff02'
    'Terrains\LandTankTurret'
    'Terrains\SlideMetal02'
    'Terrains\LandTankTurret'
]
TERRAIN_SKATE_GRINDTANKTURRET_GRIND = [
    {
        sound = GrindTankTurret
        maxpitch = 115
        minpitch = 100
        maxvol = 120
        minvol = 20
    }
]
TERRAIN_SKATE_GRINDTANKTURRET_GRINDJUMP = [
    { sound = GrindMetalOff02 maxvol = 90 minvol = 70 }
]
TERRAIN_SKATE_GRINDTANKTURRET_GRINDLAND = [
    { sound = LandTankTurret LandWoodValues loadvol = 100 }
]
TERRAIN_SKATE_GRINDTANKTURRET_SLIDE = [
    {
        sound = SlideMetal02
        maxpitch = 140
        minpitch = 100
        maxvol = 100
        minvol = 20
    }
]
TERRAIN_SKATE_GRINDTANKTURRET_SLIDEJUMP = [
    { sound = GrindMetalOff02 maxvol = 90 minvol = 70 }
]
TERRAIN_SKATE_GRINDTANKTURRET_SLIDELAND = [
    { sound = LandTankTurret LandWoodValues loadvol = 100 }
]
TERRAIN_GRINDTRAIN_SoundAssets = [ 'Terrains\GrindTrain' ]
TERRAIN_SKATE_GRINDTRAIN_GRIND = [
    {
        sound = GrindTrain
        loadvol = 100
        maxpitch = 100
        minpitch = 60
        maxvol = 200
        minvol = 80
    }
]
TERRAIN_GRINDROPE_SoundAssets = [
    'Terrains\GrindRope'
    'Terrains\OllieWood'
    'Terrains\LandWood'
    'Terrains\GrindRope'
    'Terrains\OllieWood'
    'Terrains\LandWood'
]
TERRAIN_SKATE_GRINDROPE_GRIND = [
    {
        sound = GrindRope
        loadvol = 50
        pitch = 70
        maxpitch = 100
        minpitch = 60
        maxvol = 200
        minvol = 80
    }
]
TERRAIN_SKATE_GRINDROPE_GRINDJUMP = [
    { sound = OllieWood OllieWoodValues }
]
TERRAIN_SKATE_GRINDROPE_GRINDLAND = [
    { sound = LandWood loadvol = 80 maxvol = 100 minvol = 60 }
]
TERRAIN_SKATE_GRINDROPE_SLIDE = [
    {
        sound = GrindRope
        loadvol = 50
        maxpitch = 100
        minpitch = 60
        maxvol = 100
        minvol = 20
    }
]
TERRAIN_SKATE_GRINDROPE_SLIDEJUMP = [
    { sound = OllieWood loadvol = 80 OllieWoodValues }
]
TERRAIN_SKATE_GRINDROPE_SLIDELAND = [
    { sound = LandWood loadvol = 80 maxvol = 120 minvol = 80 }
]
TERRAIN_GRINDWIRE_SoundAssets = [
    'Terrains\GrindWireSpark'
    'Terrains\OllieWireSpark'
    'Terrains\LandWireSpark'
    'Terrains\GrindWireSpark'
    'Terrains\OllieWireSpark'
    'Terrains\LandWireSpark'
]
TERRAIN_SKATE_GRINDWIRE_GRIND = [
    {
        sound = GrindWireSpark
        maxpitch = 110
        minpitch = 75
        maxvol = 150
        minvol = 80
    }
]
TERRAIN_SKATE_GRINDWIRE_GRINDJUMP = [
    { sound = OllieWireSpark maxvol = 150 minvol = 60 }
]
TERRAIN_SKATE_GRINDWIRE_GRINDLAND = [
    { sound = LandWireSpark maxvol = 175 minvol = 100 }
]
TERRAIN_SKATE_GRINDWIRE_SLIDE = [
    {
        sound = GrindWireSpark
        maxpitch = 120
        minpitch = 80
        maxvol = 130
        minvol = 80
    }
]
TERRAIN_SKATE_GRINDWIRE_SLIDEJUMP = [
    { sound = OllieWireSpark maxvol = 150 minvol = 60 }
]
TERRAIN_SKATE_GRINDWIRE_SLIDELAND = [
    { sound = LandWireSpark maxvol = 130 minvol = 100 }
]



script SC_LoadingSounds 
    LoadSound 'Shared\Hits\HitGlassPane2x'
    LoadSound 'Shared\Hits\SmashCake'
    LoadSound 'Shared\Auto\LA_Skid_11' vol = 100 dropoff = 150
    LoadSound 'Shared\Auto\CarBrakeSqueal' vol = 100 dropoff = 150
    LoadSound 'Shared\Auto\CarLoop' vol = 100 dropoff = 150 PosUpdateWithDoppler
    LoadSound 'Shared\Auto\CarHorn_11' vol = 100 dropoff = 150
    LoadSound 'Shared\Hits\HitMetalCan' vol = 100 dropoff = 150 PosUpdateWithDoppler
    LoadSound 'Shared\Hits\BonkBush' vol = 100 dropoff = 0
    LoadSound 'Shared\Hits\HitVideoGame1' vol = 100 dropoff = 50
    LoadSound 'BouncyObjects\Bouncy_PlasticChairHit01' vol = 100 dropoff = 50
    LoadSound 'Vehicles\Vehicle_Tire_Loop'
    LoadSound 'Terrains\BonkMetal_11'
    SetTerrainGrindWire
    SetTerrainWood
    SetTerrainConcSmooth
    SetTerrainMetalSmooth
    LoadSound 'Shared\Hits\HitGlassPane2x'
    LoadSound 'Shared\Auto\LA_Skid_11' vol = 100 dropoff = 150
    LoadSound 'Shared\Auto\CarBrakeSqueal' vol = 100 dropoff = 150
    LoadSound 'Shared\Auto\CarHorn_11' vol = 100 dropoff = 150
    LoadSound 'Shared\Hits\HitMetalCan' vol = 100 dropoff = 150 PosUpdateWithDoppler
    LoadSound 'Shared\Hits\BonkBush' vol = 100 dropoff = 0
    LoadSound 'Shared\Water\FallWater'
    LoadSound 'Shared\Hits\FallPungee_11'
    LoadSound 'NJ\NJ_NasalRacer04'
    LoadSound 'Shared\Auto\CarLoop' vol = 100 dropoff = 150 PosUpdateWithDoppler
    LoadSound 'Vehicles\Vehicle_Tire_Loop'
    LoadSound 'Terrains\BonkMetal_11'
    LoadSound 'BouncyObjects\Bouncy_AluminumCanHit01'
    LoadSound 'BouncyObjects\Bouncy_AluminumCanHit02'
    LoadSound 'BouncyObjects\Bouncy_BottleNonBreakHit01'
    LoadSound 'BouncyObjects\Bouncy_BottleNonBreakHit02'
    LoadSound 'BouncyObjects\Bouncy_BasketballHit01'
    LoadSound 'BouncyObjects\Bouncy_CardboardBoxHit01'
    LoadSound 'BouncyObjects\Bouncy_CardboardBoxHit02'
    LoadSound 'BouncyObjects\Bouncy_OrangeConeHit01'
    LoadSound 'BouncyObjects\Bouncy_MetalTrashHit02'
    LoadSound 'BouncyObjects\Bouncy_PlasticChairHit01'
    LoadSound 'BouncyObjects\Bouncy_PlasticChairHit02'
    LoadSound 'BA\SK6_TrashCanHitSpin02'
    LoadSound 'BouncyObjects\Bouncy_MetalHit01'
    LoadSound 'BA\SK6_BA_Tram_Overhead_11' PosUpdateWithDoppler
    LoadSound 'BA\SK6_BA_BullGallop01' PosUpdateWithDoppler
    LoadSound 'BA\SK6_BA_BullGallop02' PosUpdateWithDoppler
    LoadSound 'BA\SK6_BA_BullGallop03' PosUpdateWithDoppler
    LoadSound 'BA\SK6_BA_BullGallop04' PosUpdateWithDoppler
    LoadSound 'BO\SK6_BO_RiverLoop01_11'
    LoadSound 'BouncyObjects\Bouncy_MetalTableHit01'
    LoadSound 'BouncyObjects\Bouncy_MetalTableHit02'
    LoadSound 'BouncyObjects\Bouncy_PlasticGarbageHit01'
    if (debugsoundfx = 1)
        DumpHeaps
    endif
endscript


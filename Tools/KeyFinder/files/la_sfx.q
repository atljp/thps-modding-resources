

script LA_LoadingSounds 
    LoadSound 'Shared\Hits\HitPotty' vol = 100 dropoff = 0
    LoadSound 'Shared\Misc\Fire01' vol = 100 dropoff = 0
    LoadSound 'Shared\Misc\FryingSausage' vol = 100 dropoff = 0
    LoadSound 'Shared\Hits\Fencebreak' vol = 100 dropoff = 0
    LoadSound 'Shared\Hits\HitLeaveWall' vol = 100 dropoff = 0
    LoadSound 'Shared\Hits\Smashcake' vol = 100 dropoff = 0
    LoadSound 'Terrains\RollAwning2' vol = 100 dropoff = 0
    LoadSound 'Shared\Hits\FallSand_11' vol = 100 dropoff = 0
    LoadSound 'Shared\Hits\HitBucket' vol = 100 dropoff = 0
    LoadSound 'Shared\Human\KenHelp1' vol = 100 dropoff = 80
    LoadSound 'Shared\Human\KenHelp2' vol = 100 dropoff = 80
    LoadSound 'Terrains\BonkBush' vol = 100 dropoff = 0
    LoadSound 'Shared\Hits\HitVideogame1' vol = 100 dropoff = 0
    LoadSound 'Shared\Hits\HitVideogame1' vol = 100 dropoff = 0
    LoadSound 'Shared\Human\Pcrowd16' vol = 100 dropoff = 0
    LoadSound 'Shared\Human\Pcrowd11' vol = 100 dropoff = 0
    LoadSound 'Shared\Hits\HitGlassPane2x'
    LoadSound 'Shared\Auto\LA_Skid_11' vol = 100 dropoff = 150
    LoadSound 'Shared\Auto\CarBrakeSqueal' vol = 100 dropoff = 150
    LoadSound 'Shared\Hits\HitMetalCan' vol = 100 dropoff = 150 PosUpdateWithDoppler
    LoadSound 'Shared\Hits\BonkBush' vol = 100 dropoff = 0
    LoadSound 'Shared\Water\FallWater'
    LoadSound 'Shared\Auto\CarLoop' vol = 100 dropoff = 150 PosUpdateWithDoppler
    LoadSound 'Terrains\BonkMetal_11'
    if (debugsoundfx = 1)
        DumpHeaps
    endif
endscript


script BO_SFX_Skater_Ignite 
    PlayStream SK6_BO_SkaterIgnite vol = 300
    skater ::obj_playsound SK6_BO_FireLoop vol = 110 pitch = 120
endscript


script LA_SFX_TrashFire 
endscript


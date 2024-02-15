DrumPartialNumber = 1

script set_skater_anim_handlers 
    ResetEventHandlersFromTable \{ ActualSkaterAnimHandlerExceptionTable group = anim }
endscript

script set_ped_anim_handlers 
    ResetEventHandlersFromTable \{ ActualPedAnimHandlerExceptionTable group = anim }
endscript

script set_viewerobj_anim_handlers 
    set_skater_anim_handlers
    set_ped_anim_handlers
endscript

script HandlePedHitBassDrumBeats 
    wait \{ 0.2820 seconds }
    obj_playsound SK6_BO_RevolutionaryDrum01 dropoff = 100 vol = (60 + randomrange (0.10000000149011612, 4.0))pitch = (30 + randomrange (0.10000000149011612, 3.0))
    wait \{ 0.5640 seconds }
    obj_playsound SK6_BO_RevolutionaryDrum01 dropoff = 100 vol = (60 + randomrange (0.10000000149011612, 4.0))pitch = (30 + randomrange (0.10000000149011612, 3.0))
endscript

script HandlePedHitSnareDrumBeats 
endscript

script HandlePedHitDrum \{ DefVol = 75 DefPitch = 100 AccentVol = 150 AccentPitch = 102 }
    SpawnSound \{ HandlePedHitBassDrumBeats }
    SpawnSound HandlePedHitSnareDrumBeats params = {DefaultVol = <DefVol> DefaultPitch = <DefPitch> AccentV = <AccentVol> AccentP = <AccentPitch>}
endscript

script HandlePrintEvent 
    printf 'Handling %s event' s = <string>
endscript

script HandlePedObjPlayStream 
    printf <name>
endscript

script HandleDogBarkStream 
    if obj_visible
        SpawnSound \{ DogBarkStreamsWaiting }
    endif
endscript

script HandleDogBarkSFX 
    if NOT issoundplaying \{ Dog_Bark_Sfx_ID }
        RandomNoRepeat (
            @ obj_playsound Pitbull_Bark_01 pitch = randomrange (90.0, 110.0) vol = randomrange (60.0, 90.0) id = Dog_Bark_Sfx_ID
            @ obj_playsound Pitbull_Bark_02 pitch = randomrange (90.0, 110.0) vol = randomrange (60.0, 90.0) id = Dog_Bark_Sfx_ID
            @ obj_playsound Pitbull_Bark_03 pitch = randomrange (90.0, 110.0) vol = randomrange (60.0, 90.0) id = Dog_Bark_Sfx_ID
        )
    endif
endscript

script HandleDogGrowlSFX 
endscript

script HandleDogFootstepSFX 
    RandomNoRepeat (
        @ obj_playsound Pitbull_Footstep_01 pitch = randomrange (50.0, 80.0) vol = randomrange (2.0, 5.0)
        @ obj_playsound Pitbull_Footstep_02 pitch = randomrange (50.0, 80.0) vol = randomrange (2.0, 5.0)
        @ obj_playsound Pitbull_Footstep_03 pitch = randomrange (50.0, 80.0) vol = randomrange (2.0, 5.0)
        @ obj_playsound Pitbull_Footstep_04 pitch = randomrange (50.0, 80.0) vol = randomrange (2.0, 5.0)
    )
endscript

script DogBarkStreamsWaiting 
endscript

script HandleTurnOnSkaterLoopingSound 
    if skating
        SkaterLoopingSound_TurnOn
    endif
endscript

script HandleTurnOffSkaterLoopingSound 
    OnExitRun \{ HandleTurnOffSkaterLoopingSound_exit }
    SkaterLoopingSound_TurnOff
    Skater_WaitAnimFinished
endscript

script HandleTurnOffSkaterLoopingSound_exit 
    SkaterLoopingSound_TurnOn
endscript

script HandleBoardFlyInSound 
    obj_spawnscriptlater \{ HandleBoardFlyInSound2 }
endscript

script HandleBoardFlyInSound2 
    SpawnSound \{ BoardFlyInWaiting }
endscript

script BoardFlyInWaiting 
    Obj_GetAnimSpeed
    if Flipped
        BoardRightVol = -12
        begin 
        if issoundplaying SkaterBoardFlyInSound01
            setsoundparams SkaterBoardFlyInSound01 volL = 60 volR = <BoardRightVol> pitch = (100 * <Speed>)
        endif
        BoardRightVol = (<BoardRightVol> + 2.057)
        Obj_GetAnimSpeed
        wait 1 gameframe
        repeat 35
    else
        BoardLeftVol = -12
        begin 
        if issoundplaying SkaterBoardFlyInSound02
            setsoundparams SkaterBoardFlyInSound02 volR = 60 volL = <BoardLeftVol> pitch = (100 * <Speed>)
        endif
        BoardLeftVol = (<BoardLeftVol> + 2.057)
        Obj_GetAnimSpeed
        wait 1 gameframe
        repeat 35
    endif
endscript

script HandleCatchBoardSound 
    obj_playsound SK6_BoardGrab01 vol = randomrange (60.0, 80.0) pitch = randomrange (90.0, 115.0)
endscript

script HandleBoardKickupSoundEffect \{ DefVol = 200 }
    obj_playsound BoardBounce01 vol = <DefVol> pitch = randomrange (90.0, 115.0)
endscript

script HandleBoardDropSoundEffect 
    obj_playsound BoardBounce01 vol = randomrange (50.0, 70.0) pitch = randomrange (90.0, 115.0)
endscript

script HandleKickBoardSound 
    obj_playsound SK6_BoardGrab01 vol = randomrange (60.0, 80.0) pitch = randomrange (90.0, 115.0)
    RandomNoRepeat (
        @ obj_playsound BailBodyPunch01_11 pitch = randomrange (80.0, 102.0) vol = randomrange (50.0, 60.0)
        @ obj_playsound BailBodyPunch02_11 pitch = randomrange (80.0, 102.0) vol = randomrange (50.0, 60.0)
        @ obj_playsound BailBodyPunch03_11 pitch = randomrange (80.0, 102.0) vol = randomrange (50.0, 60.0)
        @ obj_playsound BailBodyPunch04_11 pitch = randomrange (80.0, 102.0) vol = randomrange (50.0, 60.0)
        @ obj_playsound BailBodyPunch05_11 pitch = randomrange (80.0, 102.0) vol = randomrange (50.0, 60.0)
    )
    obj_playsound SK6_BoardSplit01 pitch = 180 vol = 15
endscript

script HandleBoardScrapeSound 
    printf \{ 'HandleBoardScrapeSound' }
    obj_spawnscriptlater \{ HandleBoardScrapeSound2 }
endscript

script HandleBoardScrapeSound2 
    SpawnSound \{ BoardScrapeWaiting }
endscript

script BoardScrapeWaiting 
    Obj_GetAnimSpeed
    if NOT Flipped
        playsound SK6_BoardScrapeLong02_11 volL = 75 volR = -15 pitch = (120 * <Speed>)id = SkaterBoardScrapeIn01
        BoardRightVol = -15
        begin 
        if issoundplaying SkaterBoardScrapeIn01
            setsoundparams SkaterBoardScrapeIn01 volL = 75 volR = <BoardRightVol> pitch = (120 * <Speed>)
        endif
        BoardRightVol = (<BoardRightVol> + 2.571)
        Obj_GetAnimSpeed
        wait 1 gameframe
        repeat 35
    else
        playsound SK6_BoardScrapeLong02_11 volR = 75 volL = -15 pitch = (120 * <Speed>)id = SkaterBoardScrapeIn02
        BoardLeftVol = -15
        begin 
        if issoundplaying SkaterBoardScrapeIn02
            setsoundparams SkaterBoardScrapeIn02 volR = 75 volL = <BoardLeftVol> pitch = (120 * <Speed>)
        endif
        BoardLeftVol = (<BoardLeftVol> + 2.571)
        Obj_GetAnimSpeed
        wait 1 gameframe
        repeat 35
    endif
endscript

script HandleBoardRollingSound 
    printf \{ 'HandleBoardRollingSound' }
    obj_spawnscriptlater \{ HandleBoardRollingSound2 }
endscript

script HandleBoardRollingSound2 
    SpawnSound \{ BoardRollingInWaiting }
endscript

script BoardRollingInWaiting 
    Obj_GetAnimSpeed
    if Flipped
        playsound SK6_BoardRollIn01_11 volL = 75 volR = -15 pitch = (80 * <Speed>)id = SkaterBoardRollIn
        BoardRightVol = -15
        begin 
        if issoundplaying SkaterBoardRollIn
            setsoundparams SkaterBoardRollIn volL = 75 volR = <BoardRightVol> pitch = (80 * <Speed>)
        endif
        BoardRightVol = (<BoardRightVol> + 2.571)
        Obj_GetAnimSpeed
        wait 1 gameframe
        repeat 35
    else
        playsound SK6_BoardRollIn01_11 volR = 75 volL = -15 pitch = (80 * <Speed>)id = SkaterBoardRollIn02
        BoardLeftVol = -15
        begin 
        if issoundplaying SkaterBoardRollIn02
            setsoundparams SkaterBoardRollIn02 volR = 75 volL = <BoardLeftVol> pitch = (80 * <Speed>)
        endif
        BoardLeftVol = (<BoardLeftVol> + 2.571)
        Obj_GetAnimSpeed
        wait 1 gameframe
        repeat 35
    endif
endscript

script HandleStoppingAStream 
    StopStream <name>
endscript

script HandleDiscusWhooshSound \{ DefPitch = 60 }
    SpawnSound \{ DiscusWhooshWaiting }
endscript

script DiscusWhooshWaiting 
    playsound DE_PauseFlyIn pitch = <DefPitch>
endscript

script HandleBoardSplitSound 
    SpawnSound \{ BoardSplittingWaiting }
endscript

script BoardSplittingWaiting 
    obj_playsound SK6_BoardSplit01 vol = 220
    wait 0.05000 seconds
    RandomNoRepeat (
        @ obj_playsound BailBodyPunch01_11 pitch = randomrange (80.0, 102.0) vol = randomrange (70.0, 80.0)
        @ obj_playsound BailBodyPunch02_11 pitch = randomrange (80.0, 102.0) vol = randomrange (70.0, 80.0)
        @ obj_playsound BailBodyPunch03_11 pitch = randomrange (80.0, 102.0) vol = randomrange (70.0, 80.0)
        @ obj_playsound BailBodyPunch04_11 pitch = randomrange (80.0, 102.0) vol = randomrange (70.0, 80.0)
        @ obj_playsound BailBodyPunch05_11 pitch = randomrange (80.0, 102.0) vol = randomrange (70.0, 80.0)
    )
endscript

script HandleTerrainLandSound 
    playlandsound
endscript

script HandleTerrainBonkSound 
    playbonksound
endscript

script HandleSoundEffectEvent \{ DefVol = 100 DefPitch = 100 }
    obj_playsound <name> vol = <DefVol> pitch = <DefPitch>
endscript

script HandleHitGroundSoundEffect 
endscript

script HandleFootstepWalkSoundEffectEvent 
    RandomNoRepeat (
        @ obj_playsound (SFX_FootStepWalk01)pitch = randomrange (97.0, 102.0) vol = randomrange (105.0, 120.0)
        @ obj_playsound (SFX_FootStepWalk02)pitch = randomrange (97.0, 102.0) vol = randomrange (105.0, 120.0)
        @ obj_playsound (SFX_FootStepWalk03)pitch = randomrange (97.0, 102.0) vol = randomrange (105.0, 120.0)
    )
endscript

script HandlePedFootstepWalkSoundEffectEvent 
    RandomNoRepeat (
        @ obj_playsound (SFX_FootStepWalk01)pitch = randomrange (97.0, 102.0) vol = randomrange (105.0, 120.0)
        @ obj_playsound (SFX_FootStepWalk02)pitch = randomrange (97.0, 102.0) vol = randomrange (105.0, 120.0)
        @ obj_playsound (SFX_FootStepWalk03)pitch = randomrange (97.0, 102.0) vol = randomrange (105.0, 120.0)
    )
endscript

script HandleFootstepRunSoundEffectEvent 
    RandomNoRepeat (
        @ obj_playsound (SFX_FootStepRun01)pitch = randomrange (97.0, 102.0) vol = randomrange (105.0, 120.0)
        @ obj_playsound (SFX_FootStepRun02)pitch = randomrange (97.0, 102.0) vol = randomrange (105.0, 120.0)
        @ obj_playsound (SFX_FootStepRun03)pitch = randomrange (97.0, 102.0) vol = randomrange (105.0, 120.0)
        @ obj_playsound (SFX_FootStepRun04)pitch = randomrange (97.0, 102.0) vol = randomrange (105.0, 120.0)
        @ obj_playsound (SFX_FootStepRun05)pitch = randomrange (97.0, 102.0) vol = randomrange (105.0, 120.0)
    )
    SkaterParticles_CreateStepGfx
endscript

script HandlePedFootstepRunSoundEffectEvent 
    RandomNoRepeat (
        @ obj_playsound (SFX_FootStepRun01)pitch = randomrange (97.0, 102.0) vol = randomrange (30.0, 40.0)
        @ obj_playsound (SFX_FootStepRun02)pitch = randomrange (97.0, 102.0) vol = randomrange (30.0, 40.0)
        @ obj_playsound (SFX_FootStepRun03)pitch = randomrange (97.0, 102.0) vol = randomrange (30.0, 40.0)
        @ obj_playsound (SFX_FootStepRun04)pitch = randomrange (97.0, 102.0) vol = randomrange (30.0, 40.0)
        @ obj_playsound (SFX_FootStepRun05)pitch = randomrange (97.0, 102.0) vol = randomrange (30.0, 40.0)
    )
endscript

script HandleFootstepScuffSoundEffect 
    RandomNoRepeat (
        @ obj_playsound ScuffStepConc01 pitch = randomrange (85.0, 102.0) vol = randomrange (105.0, 120.0)
        @ obj_playsound ScuffStepConc02 pitch = randomrange (85.0, 102.0) vol = randomrange (105.0, 120.0)
    )
endscript

script HandlePedFootstepScuffSoundEffect 
    RandomNoRepeat (
        @ obj_playsound ScuffStepConc01 pitch = randomrange (85.0, 102.0) vol = randomrange (30.0, 40.0)
        @ obj_playsound ScuffStepConc02 pitch = randomrange (85.0, 102.0) vol = randomrange (30.0, 40.0)
    )
endscript

script HandleFootstepJumpSoundEffect 
endscript

script HandlePedFootstepJumpSoundEffect 
endscript

script HandleFootstepLandSoundEffect 
    obj_playsound LandStepConc02_11 pitch = randomrange (97.0, 102.0) vol = randomrange (105.0, 120.0)
    SkaterParticles_CreateStepGfx
endscript

script HandlePedFootstepLandSoundEffect 
    obj_playsound LandStepConc02_11 pitch = randomrange (97.0, 102.0) vol = randomrange (30.0, 40.0)
endscript

script HandleVaultRollSoundEffect 
    obj_playstream Vault_Roll priority = StreamPriorityHigh pitch = randomrange (90.0, 115.0) vol = randomrange (50.0, 80.0)
endscript

script HandleGruntSoundEffect 
endscript

script HandleJumpSoundEffect 
endscript

script HandleRageVoxSoundEffect 
endscript

script HandleWhooshSoundEffect 
    obj_playsound whoosh pitch = randomrange (100.0, 150.0) vol = randomrange (40.0, 70.0)
endscript

script HandleFastWhooshSoundEffect 
    obj_playsound whoosh pitch = randomrange (150.0, 200.0) vol = randomrange (30.0, 50.0)
endscript

script HandleBMXPedalSoundEffect 
endscript

script HandleBailBodyFallSoundEffect 
    RandomNoRepeat (
        @ obj_playsound BailBodyFall01 pitch = randomrange (95.0, 105.0) vol = randomrange (90.0, 100.0)
        @ obj_playsound BailBodyFall02 pitch = randomrange (95.0, 105.0) vol = randomrange (90.0, 100.0)
        @ obj_playsound BailBodyFall03 pitch = randomrange (95.0, 105.0) vol = randomrange (90.0, 100.0)
        @ obj_playsound BailBodyFall04 pitch = randomrange (95.0, 105.0) vol = randomrange (90.0, 100.0)
        @ obj_playsound BailBodyFall05 pitch = randomrange (95.0, 105.0) vol = randomrange (90.0, 100.0)
    )
endscript

script HandlePedBailBodyFallSoundEffect 
    RandomNoRepeat (
        @ obj_playsound BailBodyFall01 pitch = randomrange (95.0, 105.0) vol = randomrange (40.0, 50.0)
        @ obj_playsound BailBodyFall02 pitch = randomrange (95.0, 105.0) vol = randomrange (40.0, 50.0)
        @ obj_playsound BailBodyFall03 pitch = randomrange (95.0, 105.0) vol = randomrange (40.0, 50.0)
        @ obj_playsound BailBodyFall04 pitch = randomrange (95.0, 105.0) vol = randomrange (40.0, 50.0)
        @ obj_playsound BailBodyFall05 pitch = randomrange (95.0, 105.0) vol = randomrange (40.0, 50.0)
    )
endscript

script HandleBailBodyPunchSoundEffect 
    RandomNoRepeat (
        @ obj_playsound BailBodyPunch01_11 pitch = randomrange (80.0, 102.0) vol = randomrange (140.0, 150.0)
        @ obj_playsound BailBodyPunch02_11 pitch = randomrange (80.0, 102.0) vol = randomrange (140.0, 150.0)
        @ obj_playsound BailBodyPunch03_11 pitch = randomrange (80.0, 102.0) vol = randomrange (140.0, 150.0)
        @ obj_playsound BailBodyPunch04_11 pitch = randomrange (80.0, 102.0) vol = randomrange (140.0, 150.0)
        @ obj_playsound BailBodyPunch05_11 pitch = randomrange (80.0, 102.0) vol = randomrange (140.0, 150.0)
    )
endscript

script HandlePedBailBodyPunchSoundEffect 
    RandomNoRepeat (
        @ obj_playsound BailBodyPunch01_11 pitch = randomrange (80.0, 102.0) vol = randomrange (40.0, 50.0)
        @ obj_playsound BailBodyPunch02_11 pitch = randomrange (80.0, 102.0) vol = randomrange (40.0, 50.0)
        @ obj_playsound BailBodyPunch03_11 pitch = randomrange (80.0, 102.0) vol = randomrange (40.0, 50.0)
        @ obj_playsound BailBodyPunch04_11 pitch = randomrange (80.0, 102.0) vol = randomrange (40.0, 50.0)
        @ obj_playsound BailBodyPunch05_11 pitch = randomrange (80.0, 102.0) vol = randomrange (40.0, 50.0)
    )
endscript

script HandleBailCrackSoundEffect 
    obj_playsound BailCrack01 pitch = randomrange (100.0, 110.0) vol = randomrange (120.0, 130.0)
endscript

script HandlePedBailCrackSoundEffect 
    obj_playsound BailCrack01 pitch = randomrange (100.0, 110.0) vol = randomrange (40.0, 50.0)
endscript

script HandleBailSlapSoundEffect 
    RandomNoRepeat (
        @ obj_playsound BailSlap01 pitch = randomrange (95.0, 115.0) vol = randomrange (90.0, 110.0)
        @ obj_playsound BailSlap02 pitch = randomrange (95.0, 115.0) vol = randomrange (90.0, 110.0)
        @ obj_playsound BailSlap03 pitch = randomrange (95.0, 115.0) vol = randomrange (90.0, 110.0)
    )
endscript

script HandlePedBailSlapSoundEffect 
    RandomNoRepeat (
        @ obj_playsound BailSlap01 pitch = randomrange (95.0, 115.0) vol = randomrange (40.0, 50.0)
        @ obj_playsound BailSlap02 pitch = randomrange (95.0, 115.0) vol = randomrange (40.0, 50.0)
        @ obj_playsound BailSlap03 pitch = randomrange (95.0, 115.0) vol = randomrange (40.0, 50.0)
    )
endscript

script HandleBailScrapeSoundEffect 
endscript

script HandlePedBailScrapeSoundEffect 
endscript

script HandleBailBoardSoundEffect 
    if NOT IsSkaterOnBike
        RandomNoRepeat (
            @ obj_playsound BailBoard01 pitch = randomrange (100.0, 102.0) vol = randomrange (115.0, 125.0)
            @ obj_playsound BailBoard02 pitch = randomrange (100.0, 102.0) vol = randomrange (115.0, 125.0)
            @ obj_playsound BailBoard03 pitch = randomrange (100.0, 102.0) vol = randomrange (115.0, 125.0)
            @ obj_playsound BailBoard04 pitch = randomrange (100.0, 102.0) vol = randomrange (115.0, 125.0)
            @ obj_playsound BailBoard05 pitch = randomrange (100.0, 102.0) vol = randomrange (115.0, 125.0)
        )
    endif
endscript

script HandlePedBailBoardSoundEffect 
    RandomNoRepeat (
        @ obj_playsound BailBoard01 pitch = randomrange (100.0, 102.0) vol = randomrange (40.0, 50.0)
        @ obj_playsound BailBoard02 pitch = randomrange (100.0, 102.0) vol = randomrange (40.0, 50.0)
        @ obj_playsound BailBoard03 pitch = randomrange (100.0, 102.0) vol = randomrange (40.0, 50.0)
        @ obj_playsound BailBoard04 pitch = randomrange (100.0, 102.0) vol = randomrange (40.0, 50.0)
        @ obj_playsound BailBoard05 pitch = randomrange (100.0, 102.0) vol = randomrange (40.0, 50.0)
    )
endscript

script HandleSkaterSprayPaint 
    if GotParam \{ on }
        if Flipped
            SprayPaintOn \{ bone = Bone_Palm_L }
        else
            SprayPaintOn \{ bone = Bone_Palm_R }
        endif
    endif
    if GotParam \{ Off }
        SprayPaintOff
    endif
    if GotParam \{ splat }
        TagNow
    endif
endscript

script HandleVertSticker 
    VertStickerSlap
endscript

script HandlePedSprayPaint 
    if GotParam \{ on }
        SprayPaintOn \{ bone = Bone_Palm_R }
    endif
    if GotParam \{ Off }
        SprayPaintOff
    endif
endscript

script HandleLightning r = 200 g = 200 b = 255
    printf '!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!LIGHTNING!!!!!!!!!!!!!!!!!!!!!!!!!!!!!1!!!'
    ShakeCamera {
        duration = 1.0
        vert_amp = 2.500
        horiz_amp = 2.500
        vert_vel = 20
        horiz_vel = 20
    }
    if NOT InSplitScreenGame
        DoFlash {duration = 0.6500
            additive
            start_r = <r> start_g = <g> start_b = <b> start_a = 100
            end_r = <r> end_g = <g> end_b = <b> end_a = 0}
    endif
    Vibrate_Controller_Safe actuator = 1 percent = 95
    obj_spawnscriptlater HandleLightning_cleanup
endscript

script HandleLightning_cleanup 
    wait \{ 1 seconds }
    Vibrate_Controller_Safe \{ actuator = 1 percent = 0 }
endscript

script HandleShrekBurp 
    obj_stopstream \{ ShrekBurpStream }
    obj_playstream \{ Burp01 vol = 150 priority = StreamPriorityHigh id = ShrekBurpStream }
    DestroyFlexibleParticleSystem \{ name = ShrekBurpPart }
    CreateFlexibleParticleSystem \{ name = ShrekBurpPart params_script = JEG_ShrekBurp_particle_params }
    ShakeCamera \{duration = 1.0 vert_amp = 2.500 horiz_amp = 1.0 vert_vel = 7 horiz_vel = 5}
    obj_spawnscriptlater \{ HandleShrekBurp_cleanup }
    Vibrate_Controller_Safe \{ actuator = 1 percent = 55 }
endscript

script HandleShrekBurp_cleanup 
    wait \{ 0.2000 seconds }
    Vibrate_Controller_Safe \{ actuator = 1 percent = 0 }
endscript

script handleVehiclegrind 
    printf \{ 'Sparks!!' }
    CreateFlexibleParticleSystem \{ name = VehSparks01 params_script = APM_VEH_SPARKS01_particle_params }
    obj_spawnscriptlater \{ handleVehiclegrind_cleanup }
endscript

script handleVehiclegrind_cleanup 
    gettags
    begin 
    if NOT Skater_AnimEquals <grind_init_anim>
        if NOT Skater_AnimEquals <grind_idle_anim>
            break 
        endif
    endif
    wait \{ 1 gameframe }
    repeat 
    DestroyFlexibleParticleSystem \{ name = VehSparks01 }
endscript

script HandleFartBurst 
    printf \{ 'FART!!' }
    playsound \{ FlamingFireBall01 vol = 150 }
    obj_spawnscriptlater \{ HandleFartBurst_cleanup }
    Vibrate_Controller_Safe \{ actuator = 0 percent = 65 }
    DestroyFlexibleParticleSystem \{ name = FartBurstParticle }
    CreateFlexibleParticleSystem \{ name = FartBurstParticle params_script = JEG_FartBurst_particle_params }
    broadcastevent \{ type = AU_Beaver_Blast }
endscript

script HandleFartBurst_cleanup 
    begin 
    if NOT InAir
        break 
    endif
    wait \{ 1 gameframe }
    repeat 30
    Vibrate_Controller_Safe \{ actuator = 0 percent = 0 }
endscript

script HandleCanFlameOn 
    printf \{ 'FLAMEON!!' }
    if Flipped
        params_script = JEG_CanFlame_particle_params
    else
        params_script = JEG_CanFlame_particle_params2
    endif
    DestroyFlexibleParticleSystem \{ name = CanFlameParticle }
    CreateFlexibleParticleSystem name = CanFlameParticle params_script = <params_script>
    obj_spawnscriptlater \{ handleCanFlame_cleanup }
endscript

script HandleCanFlameOff 
    printf \{ 'FLAMEOFF!!' }
    if Flipped
        params_script = JEG_CanFlameDur_particle_params
    else
        params_script = JEG_CanFlameDur_particle_params2
    endif
    CreateFlexibleParticleSystem name = CanFlameParticle2 params_script = <params_script>
endscript

script handleCanFlame_cleanup 
    gettags
    begin 
    if NOT Skater_AnimEquals \{ Special_Muska_Burn_init }
        if NOT Skater_AnimEquals \{ Special_Muska_Burn_Range }
            break 
        endif
    endif
    wait \{ 1 gameframe }
    repeat 
    DestroyFlexibleParticleSystem \{ name = CanFlameParticle }
endscript

script HandleDoubleCanOn 
    DestroyFlexibleParticleSystem \{ name = Can1Particle }
    DestroyFlexibleParticleSystem \{ name = Can2Particle }
    printf \{ 'DOUBLE CAN ON!!' }
    CreateFlexibleParticleSystem \{ name = Can1Particle params_script = JEG_SprayBlue_particle_params }
    CreateFlexibleParticleSystem \{ name = Can2Particle params_script = JEG_SprayRed_particle_params }
endscript

script HandleDoubleCanOff 
    printf \{ 'DOUBLE CAN OFF!!' }
    DestroyFlexibleParticleSystem \{ name = Can1Particle }
    DestroyFlexibleParticleSystem \{ name = Can2Particle }
endscript

script HandleHoagieOn 
    printf \{ 'Hoagie ON!!' }
    DestroyFlexibleParticleSystem \{ name = HoagieParticle }
    CreateFlexibleParticleSystem \{ name = HoagieParticle params_script = JEG_Hoagie_particle_params }
endscript

script HandleHoagieOff 
    printf \{ 'HOagie OFF!!' }
    DestroyFlexibleParticleSystem \{ name = HoagieParticle }
endscript

script HandleTiresOn 
    printf \{ 'Tires ON!!' }
    DestroyFlexibleParticleSystem \{ name = TiresParticle }
    CreateFlexibleParticleSystem \{ name = TiresParticle params_script = JEG_TireSmoke_particle_params }
endscript

script HandleVortex 
    DestroyFlexibleParticleSystem \{ name = KostonVortex }
    CreateFlexibleParticleSystem \{ name = KostonVortex params_script = JEG_Spin_particle_params }
endscript

script ThrowObjectScript 
    LaunchDirtyProjectile
endscript

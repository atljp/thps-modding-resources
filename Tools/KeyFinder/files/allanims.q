

script animload_AnchorMan_HEAD LoadFunction = LoadAnim
    SetReferenceChecksum AnchorMan_HEAD
    if <LoadFunction> <...> name = 'anims\AnchorMan_HEAD\default.ska' descchecksum = default
        <LoadFunction> <...> name = 'anims\AnchorMan_HEAD\idle.ska' descchecksum = idle
    endif
    SetReferenceChecksum 0
endscript


script animload_anl_bat LoadFunction = LoadAnim
    SetReferenceChecksum anl_pigeon
    if <LoadFunction> <...> name = 'anims\anl_bat\default.ska' descchecksum = default
        <LoadFunction> <...> name = 'anims\anl_bat\Idle.ska' descchecksum = idle
    endif
    SetReferenceChecksum 0
endscript


script animload_anl_bull LoadFunction = LoadAnim
    SetReferenceChecksum Anl_Bull
    if <LoadFunction> <...> name = 'anims\anl_bull\default.ska' descchecksum = default
        <LoadFunction> <...> name = 'anims\anl_bull\Idle.ska' descchecksum = idle
        <LoadFunction> <...> name = 'anims\anl_bull\Bull_Run.ska' descchecksum = bull_run
    endif
    SetReferenceChecksum 0
endscript


script animload_Anl_cat LoadFunction = LoadAnim
    SetReferenceChecksum Anl_Cat
    if <LoadFunction> <...> name = 'anims\anl_Cat\Idle.ska' descchecksum = idle
        <LoadFunction> <...> name = 'anims\anl_Cat\WalkFromIdle.ska' descchecksum = WalkFromIdle
        <LoadFunction> <...> name = 'anims\anl_Cat\Walk.ska' descchecksum = walk
        <LoadFunction> <...> name = 'anims\anl_Cat\WalkToIdle.ska' descchecksum = WalkToIdle
        <LoadFunction> <...> name = 'anims\anl_Cat\LayIdle.ska' descchecksum = LayIdle
        <LoadFunction> <...> name = 'anims\anl_Cat\LayIdleToIdle.ska' descchecksum = LayIdleToIdle
        <LoadFunction> <...> name = 'anims\anl_Cat\RunFromWalk.ska' descchecksum = RunFromWalk
        <LoadFunction> <...> name = 'anims\anl_Cat\Run.ska' descchecksum = run
        <LoadFunction> <...> name = 'anims\anl_Cat\RunToWalk.ska' descchecksum = RunToWalk
        <LoadFunction> <...> name = 'anims\anl_Cat\RunFromIdle.ska' descchecksum = RunFromIdle
        <LoadFunction> <...> name = 'anims\anl_Cat\RunToIdle.ska' descchecksum = RunToIdle
        <LoadFunction> <...> name = 'anims\anl_Cat\Pounce.ska' descchecksum = Pounce
        <LoadFunction> <...> name = 'anims\anl_Cat\default.ska' descchecksum = default
        <LoadFunction> <...> name = 'anims\anl_Cat\Attack.ska' descchecksum = attack
        <LoadFunction> <...> name = 'anims\anl_Cat\SitIdle1.ska' descchecksum = SitIdle1
        <LoadFunction> <...> name = 'anims\anl_Cat\SitIdle2.ska' descchecksum = SitIdle2
        <LoadFunction> <...> name = 'anims\anl_Cat\SitIdle3.ska' descchecksum = SitIdle3
        <LoadFunction> <...> name = 'anims\anl_Cat\SitFromIdle.ska' descchecksum = SitFromIdle
    endif
    SetReferenceChecksum 0
endscript


script animload_anl_dog LoadFunction = LoadAnim
    SetReferenceChecksum Anl_dog
    if <LoadFunction> <...> name = 'anims\anl_dog\BarkIdle.ska' descchecksum = BarkIdle
        <LoadFunction> <...> name = 'anims\anl_dog\WalkFromIdle.ska' descchecksum = WalkFromIdle
        <LoadFunction> <...> name = 'anims\anl_dog\Walk.ska' descchecksum = walk
        <LoadFunction> <...> name = 'anims\anl_dog\WalkToIdle.ska' descchecksum = WalkToIdle
        <LoadFunction> <...> name = 'anims\anl_dog\RunFromIdle.ska' descchecksum = RunFromIdle
        <LoadFunction> <...> name = 'anims\anl_dog\Run.ska' descchecksum = run
        <LoadFunction> <...> name = 'anims\anl_dog\RunToIdle.ska' descchecksum = RunToIdle
        <LoadFunction> <...> name = 'anims\anl_dog\LiftLeg.ska' descchecksum = LiftLeg
        <LoadFunction> <...> name = 'anims\anl_dog\default.ska' descchecksum = default
        <LoadFunction> <...> name = 'anims\anl_dog\Idle.ska' descchecksum = idle
        <LoadFunction> <...> name = 'anims\anl_dog\Idle2.ska' descchecksum = Idle2
    endif
    SetReferenceChecksum 0
endscript


script animload_anl_pigeon LoadFunction = LoadAnim
    SetReferenceChecksum anl_pigeon
    if <LoadFunction> <...> name = 'anims\anl_pigeon\Idle.ska' descchecksum = idle
        <LoadFunction> <...> name = 'anims\anl_pigeon\PeckFromIdle.ska' descchecksum = PeckFromIdle
        <LoadFunction> <...> name = 'anims\anl_pigeon\Peck.ska' descchecksum = Peck
        <LoadFunction> <...> name = 'anims\anl_pigeon\PeckToIdle.ska' descchecksum = PeckToIdle
        <LoadFunction> <...> name = 'anims\anl_pigeon\WalkFromIdle.ska' descchecksum = WalkFromIdle
        <LoadFunction> <...> name = 'anims\anl_pigeon\Walk.ska' descchecksum = walk
        <LoadFunction> <...> name = 'anims\anl_pigeon\WalkToIdle.ska' descchecksum = WalkToIdle
        <LoadFunction> <...> name = 'anims\anl_pigeon\RunFromIdle.ska' descchecksum = RunFromIdle
        <LoadFunction> <...> name = 'anims\anl_pigeon\Run.ska' descchecksum = run
        <LoadFunction> <...> name = 'anims\anl_pigeon\RunToIdle.ska' descchecksum = RunToIdle
        <LoadFunction> <...> name = 'anims\anl_pigeon\Flyhop.ska' descchecksum = Flyhop
        <LoadFunction> <...> name = 'anims\anl_pigeon\Preen.ska' descchecksum = Preen
        <LoadFunction> <...> name = 'anims\anl_pigeon\FlyFromIdle.ska' descchecksum = FlyFromIdle
        <LoadFunction> <...> name = 'anims\anl_pigeon\Fly.ska' descchecksum = Fly
        <LoadFunction> <...> name = 'anims\anl_pigeon\FlyToIdle.ska' descchecksum = FlyToIdle
        <LoadFunction> <...> name = 'anims\anl_pigeon\default.ska' descchecksum = default
    endif
    SetReferenceChecksum 0
endscript


script animload_anl_seagull LoadFunction = LoadAnim
    SetReferenceChecksum anl_seagull
    if <LoadFunction> <...> name = 'anims\anl_seagull\Idle.ska' descchecksum = idle
        <LoadFunction> <...> name = 'anims\anl_seagull\FlyFromIdle.ska' descchecksum = FlyFromIdle
        <LoadFunction> <...> name = 'anims\anl_seagull\Fly.ska' descchecksum = Fly
        <LoadFunction> <...> name = 'anims\anl_seagull\FlyToIdle.ska' descchecksum = FlyToIdle
        <LoadFunction> <...> name = 'anims\anl_seagull\Glide.ska' descchecksum = Glide
        <LoadFunction> <...> name = 'anims\anl_seagull\GlideToIdle.ska' descchecksum = GlideToIdle
        <LoadFunction> <...> name = 'anims\anl_seagull\FlyHop.ska' descchecksum = Flyhop
        <LoadFunction> <...> name = 'anims\anl_seagull\default.ska' descchecksum = default
    endif
    SetReferenceChecksum 0
endscript


script animload_anl_shark LoadFunction = LoadAnim
    SetReferenceChecksum anl_shark
    if <LoadFunction> <...> name = 'anims\anl_shark\Swim.ska' descchecksum = Swim
        <LoadFunction> <...> name = 'anims\anl_shark\Chomp.ska' descchecksum = Chomp
        <LoadFunction> <...> name = 'anims\anl_shark\Hit.ska' descchecksum = hit
        <LoadFunction> <...> name = 'anims\anl_shark\default.ska' descchecksum = default
    endif
    SetReferenceChecksum 0
endscript


script animload_anl_w_gorilla LoadFunction = LoadAnim
    SetReferenceChecksum anl_w_gorilla
    if <LoadFunction> <...> name = 'anims\anl_w_gorilla\default.ska' descchecksum = default
        <LoadFunction> <...> name = 'anims\anl_w_gorilla\idle.ska' descchecksum = idle
    endif
    SetReferenceChecksum 0
endscript


script animload_BostonGuy_HEAD LoadFunction = LoadAnim
    SetReferenceChecksum BostonGuy_HEAD
    if <LoadFunction> <...> name = 'anims\BostonGuy_HEAD\default.ska' descchecksum = default
        <LoadFunction> <...> name = 'anims\BostonGuy_HEAD\idle.ska' descchecksum = idle
    endif
    SetReferenceChecksum 0
endscript


script animload_Burnquist_Head LoadFunction = LoadAnim
    SetReferenceChecksum Burnquist_Head
    if <LoadFunction> <...> name = 'anims\Burnquist_Head\default.ska' descchecksum = default
        <LoadFunction> <...> name = 'anims\Burnquist_Head\idle.ska' descchecksum = idle
    endif
    SetReferenceChecksum 0
endscript


script animload_Hawk_Head LoadFunction = LoadAnim
    SetReferenceChecksum Hawk_Head
    if <LoadFunction> <...> name = 'anims\Hawk_Head\default.ska' descchecksum = default
        <LoadFunction> <...> name = 'anims\Hawk_Head\idle.ska' descchecksum = idle
    endif
    SetReferenceChecksum 0
endscript


script animload_Head_CAS_Female01 LoadFunction = LoadAnim
    SetReferenceChecksum Head_CAS_Female01
    if <LoadFunction> <...> name = 'anims\Head_CAS_Female01\default.ska' descchecksum = default
        <LoadFunction> <...> name = 'anims\Head_CAS_Female01\idle.ska' descchecksum = idle
    endif
    SetReferenceChecksum 0
endscript


script animload_Head_Cas_Male01 LoadFunction = LoadAnim
    SetReferenceChecksum head_cas_male01
    if <LoadFunction> <...> name = 'anims\Head_Cas_Male01\default.ska' descchecksum = default
        <LoadFunction> <...> name = 'anims\Head_Cas_Male01\idle.ska' descchecksum = idle
    endif
    SetReferenceChecksum 0
endscript


script animload_Koston_Head LoadFunction = LoadAnim
    SetReferenceChecksum Koston_Head
    if <LoadFunction> <...> name = 'anims\Koston_Head\default.ska' descchecksum = default
        <LoadFunction> <...> name = 'anims\Koston_Head\idle.ska' descchecksum = idle
    endif
    SetReferenceChecksum 0
endscript


script animload_Margera_Head LoadFunction = LoadAnim
    SetReferenceChecksum Margera_Head
    if <LoadFunction> <...> name = 'anims\Margera_Head\default.ska' descchecksum = default
        <LoadFunction> <...> name = 'anims\Margera_Head\idle.ska' descchecksum = idle
    endif
    SetReferenceChecksum 0
endscript


script animload_Mullen_Head LoadFunction = LoadAnim
    SetReferenceChecksum Mullen_Head
    if <LoadFunction> <...> name = 'anims\Mullen_Head\default.ska' descchecksum = default
        <LoadFunction> <...> name = 'anims\Mullen_Head\idle.ska' descchecksum = idle
    endif
    SetReferenceChecksum 0
endscript


script animload_Muska_Head LoadFunction = LoadAnim
    SetReferenceChecksum Muska_Head
    if <LoadFunction> <...> name = 'anims\Muska_Head\default.ska' descchecksum = default
        <LoadFunction> <...> name = 'anims\Muska_Head\idle.ska' descchecksum = idle
    endif
    SetReferenceChecksum 0
endscript


script animload_Nigel_Head LoadFunction = LoadAnim
    SetReferenceChecksum Nigel_Head
    if <LoadFunction> <...> name = 'anims\Nigel_Head\default.ska' descchecksum = default
        <LoadFunction> <...> name = 'anims\Nigel_Head\idle.ska' descchecksum = idle
    endif
    SetReferenceChecksum 0
endscript


script animload_NODrunk1_HEAD LoadFunction = LoadAnim
    SetReferenceChecksum NODrunk1_HEAD
    if <LoadFunction> <...> name = 'anims\NODrunk1_HEAD\default.ska' descchecksum = default
        <LoadFunction> <...> name = 'anims\NODrunk1_HEAD\idle.ska' descchecksum = idle
    endif
    SetReferenceChecksum 0
endscript


script animload_NODrunk2_HEAD LoadFunction = LoadAnim
    SetReferenceChecksum NODrunk2_HEAD
    if <LoadFunction> <...> name = 'anims\NODrunk2_HEAD\default.ska' descchecksum = default
        <LoadFunction> <...> name = 'anims\NODrunk2_HEAD\idle.ska' descchecksum = idle
    endif
    SetReferenceChecksum 0
endscript


script animload_Ped_Alien LoadFunction = LoadAnim
    SetReferenceChecksum THPS6_human
    if <LoadFunction> <...> name = 'anims\Ped_Alien\Ped_Alien_Idle.ska' descchecksum = Ped_Alien_Idle
        <LoadFunction> <...> name = 'anims\Ped_Alien\Ped_Alien_Avoid.ska' descchecksum = Ped_Alien_Avoid
        <LoadFunction> <...> name = 'anims\Ped_Alien\Ped_Alien_Avoid_Idle.ska' descchecksum = Ped_Alien_Avoid_Idle
    endif
    SetReferenceChecksum 0
endscript


script animload_ped_baha LoadFunction = LoadAnim
    SetReferenceChecksum THPS6_human
    if <LoadFunction> <...> name = 'anims\Ped_Baha\Ped_Baha_Drive.ska' descchecksum = Ped_Baha_Drive
    endif
    SetReferenceChecksum 0
endscript


script animload_Ped_Bikini LoadFunction = LoadAnim
    SetReferenceChecksum ped_female
    if <LoadFunction> <...> name = 'anims\Ped_Bikini\Ped_Bikini_LyingFront.ska' descchecksum = Ped_Bikini_LyingFront
        <LoadFunction> <...> name = 'anims\Ped_Bikini\Ped_Bikini_LyingBack.ska' descchecksum = Ped_Bikini_LyingBack
        <LoadFunction> <...> name = 'anims\Ped_Bikini\Ped_Bikini_Sit1.ska' descchecksum = Ped_Bikini_Sit1
        <LoadFunction> <...> name = 'anims\Ped_Bikini\Ped_Bikini_Sit2.ska' descchecksum = Ped_Bikini_Sit2
        <LoadFunction> <...> name = 'anims\Ped_Bikini\Ped_Bikini_Sit3.ska' descchecksum = Ped_Bikini_Sit3
        <LoadFunction> <...> name = 'anims\Ped_Bikini\Ped_Bikini_LyingFrontToBack.ska' descchecksum = Ped_Bikini_LyingFrontToBack
        <LoadFunction> <...> name = 'anims\Ped_Bikini\Ped_Bikini_LyingFrontFromBack.ska' descchecksum = Ped_Bikini_LyingFrontFromBack
        <LoadFunction> <...> name = 'anims\Ped_Bikini\Ped_Bikini_Sit1ToSunblock.ska' descchecksum = Ped_Bikini_Sit1ToSunblock
        <LoadFunction> <...> name = 'anims\Ped_Bikini\Ped_Bikini_Sunblock.ska' descchecksum = Ped_Bikini_Sunblock
        <LoadFunction> <...> name = 'anims\Ped_Bikini\Ped_Bikini_Sit1FromSunblock.ska' descchecksum = Ped_Bikini_Sit1FromSunblock
        <LoadFunction> <...> name = 'anims\Ped_Bikini\Ped_Bikini_Sit1ToSit2.ska' descchecksum = Ped_Bikini_Sit1ToSit2
        <LoadFunction> <...> name = 'anims\Ped_Bikini\Ped_Bikini_Sit1FromSit2.ska' descchecksum = Ped_Bikini_Sit1FromSit2
        <LoadFunction> <...> name = 'anims\Ped_Bikini\Ped_Bikini_Sit2ToSit3.ska' descchecksum = Ped_Bikini_Sit2ToSit3
        <LoadFunction> <...> name = 'anims\Ped_Bikini\Ped_Bikini_Sit1ToSit3.ska' descchecksum = Ped_Bikini_Sit1ToSit3
        <LoadFunction> <...> name = 'anims\Ped_Bikini\Ped_Bikini_Sit1FromSit3.ska' descchecksum = Ped_Bikini_Sit1FromSit3
        <LoadFunction> <...> name = 'anims\Ped_Bikini\Ped_Bikini_LyingBackToSit1.ska' descchecksum = Ped_Bikini_LyingBackToSit1
        <LoadFunction> <...> name = 'anims\Ped_Bikini\Ped_Bikini_LyingBackFromSit1.ska' descchecksum = Ped_Bikini_LyingBackFromSit1
        <LoadFunction> <...> name = 'anims\Ped_Bikini\Ped_Bikini_ChairToSit1.ska' descchecksum = Ped_Bikini_ChairToSit1
        <LoadFunction> <...> name = 'anims\Ped_Bikini\Ped_Bikini_ChairFromSit1.ska' descchecksum = Ped_Bikini_ChairFromSit1
        <LoadFunction> <...> name = 'anims\Ped_Bikini\Ped_Bikini_Chair.ska' descchecksum = Ped_Bikini_Chair
    endif
    SetReferenceChecksum 0
endscript


script animload_ped_female LoadFunction = LoadAnim
    SetReferenceChecksum ped_female
    if <LoadFunction> <...> name = 'anims\Ped_Bitches\Ped_Bitches_Knockdown.ska' descchecksum = Ped_Bitches_Knockdown
        <LoadFunction> <...> name = 'anims\Ped_Bitches\Ped_Bitches_GetUp.ska' descchecksum = Ped_Bitches_GetUp
        <LoadFunction> <...> name = 'anims\Ped_Bitches\Ped_Bitches_LyingIdle.ska' descchecksum = Ped_Bitches_LyingIdle
        <LoadFunction> <...> name = 'anims\Ped_Female\Ped_F_Angry.ska' descchecksum = Ped_F_Angry
        <LoadFunction> <...> name = 'anims\Ped_Female\Ped_F_Idle1.ska' descchecksum = Ped_F_Idle1
        <LoadFunction> <...> name = 'anims\Ped_Female\Ped_F_Idle1ToIdle2.ska' descchecksum = Ped_F_Idle1ToIdle2
        <LoadFunction> <...> name = 'anims\Ped_Female\Ped_F_Idle2.ska' descchecksum = Ped_F_Idle2
        <LoadFunction> <...> name = 'anims\Ped_Female\Ped_F_Idle2ToIdle1.ska' descchecksum = Ped_F_Idle2ToIdle1
        <LoadFunction> <...> name = 'anims\Ped_Female\Ped_F_Idle1ToIdle3.ska' descchecksum = Ped_F_Idle1ToIdle3
        <LoadFunction> <...> name = 'anims\Ped_Female\Ped_F_Idle3.ska' descchecksum = Ped_F_Idle3
        <LoadFunction> <...> name = 'anims\Ped_Female\Ped_F_Idle4.ska' descchecksum = Ped_F_Idle4
        <LoadFunction> <...> name = 'anims\Ped_Female\default.ska' descchecksum = default
        <LoadFunction> <...> name = 'anims\Ped_Female\Ped_F_Idle5.ska' descchecksum = Ped_F_Idle5
        <LoadFunction> <...> name = 'anims\Ped_Female\Ped_F_Idle6.ska' descchecksum = Ped_F_Idle6
        <LoadFunction> <...> name = 'anims\Ped_Female\Ped_F_Idle7.ska' descchecksum = Ped_F_Idle7
        <LoadFunction> <...> name = 'anims\Ped_Female\Ped_F_Idle8.ska' descchecksum = Ped_F_Idle8
        <LoadFunction> <...> name = 'anims\Ped_Female\Ped_F_RotateLFromIdle1.ska' descchecksum = Ped_F_RotateLFromIdle1
        <LoadFunction> <...> name = 'anims\Ped_Female\Ped_F_RotateLFromIdle2.ska' descchecksum = Ped_F_RotateLFromIdle2
        <LoadFunction> <...> name = 'anims\Ped_Female\Ped_F_RotateLFromIdle3.ska' descchecksum = Ped_F_RotateLFromIdle3
        <LoadFunction> <...> name = 'anims\Ped_Female\Ped_F_JumpBack.ska' descchecksum = Ped_F_JumpBack
        <LoadFunction> <...> name = 'anims\Ped_Female\Ped_F_JumpForward.ska' descchecksum = Ped_F_JumpForward
        <LoadFunction> <...> name = 'anims\Ped_Female\Ped_F_JumpRight.ska' descchecksum = Ped_F_JumpRight
        <LoadFunction> <...> name = 'anims\Ped_Female\Ped_F_Push.ska' descchecksum = Ped_F_Push
        <LoadFunction> <...> name = 'anims\Ped_Female\Ped_F_Run.ska' descchecksum = Ped_f_Run
        <LoadFunction> <...> name = 'anims\Ped_Female\Ped_F_RunToIdle1.ska' descchecksum = Ped_F_RunToIdle1
        <LoadFunction> <...> name = 'anims\Ped_Female\Ped_F_RunToIdle2.ska' descchecksum = Ped_F_RunToIdle2
        <LoadFunction> <...> name = 'anims\Ped_Female\Ped_F_Talk1.ska' descchecksum = Ped_F_Talk1
        <LoadFunction> <...> name = 'anims\Ped_Female\Ped_F_Talk2.ska' descchecksum = Ped_F_Talk2
        <LoadFunction> <...> name = 'anims\Ped_Female\Ped_F_Talk3.ska' descchecksum = Ped_F_Talk3
        <LoadFunction> <...> name = 'anims\Ped_Female\Ped_F_Talk4.ska' descchecksum = Ped_F_Talk4
        <LoadFunction> <...> name = 'anims\Ped_Female\Ped_F_Talk5.ska' descchecksum = Ped_F_Talk5
        <LoadFunction> <...> name = 'anims\Ped_Female\Ped_F_Talk6.ska' descchecksum = Ped_F_Talk6
        <LoadFunction> <...> name = 'anims\Ped_Female\Ped_F_WalkFromIdle1.ska' descchecksum = Ped_F_WalkFromIdle1
        <LoadFunction> <...> name = 'anims\Ped_Female\Ped_F_Walk.ska' descchecksum = Ped_F_Walk
        <LoadFunction> <...> name = 'anims\Ped_Female\Ped_F_WalkToIdle1.ska' descchecksum = Ped_F_WalkToIdle1
        <LoadFunction> <...> name = 'anims\Ped_Female\Ped_F_WalkingWave.ska' descchecksum = Ped_F_WalkingWave
        <LoadFunction> <...> name = 'anims\Ped_Female\Ped_F_Wave.ska' descchecksum = Ped_F_Wave
    endif
    SetReferenceChecksum 0
endscript


script animload_Ped_Blocker LoadFunction = LoadAnim
    SetReferenceChecksum THPS6_human
    if <LoadFunction> <...> name = 'anims\Ped_Blocker\Ped_Blocker_idle.ska' descchecksum = Ped_Blocker_idle
        <LoadFunction> <...> name = 'anims\Ped_Blocker\Ped_Blocker_idle02.ska' descchecksum = Ped_Blocker_idle02
        <LoadFunction> <...> name = 'anims\Ped_Blocker\Ped_Blocker_idletoBlockA.ska' descchecksum = Ped_Blocker_idletoBlockA
        <LoadFunction> <...> name = 'anims\Ped_Blocker\Ped_Blocker_BlockA_idle.ska' descchecksum = Ped_Blocker_BlockA_idle
        <LoadFunction> <...> name = 'anims\Ped_Blocker\Ped_Blocker_BlockA2BlockB.ska' descchecksum = Ped_Blocker_BlockA2BlockB
        <LoadFunction> <...> name = 'anims\Ped_Blocker\Ped_Blocker_BlockB_idle.ska' descchecksum = Ped_Blocker_BlockB_idle
        <LoadFunction> <...> name = 'anims\Ped_Blocker\Ped_Blocker_BllockB2BlockA.ska' descchecksum = Ped_Blocker_BllockB2BlockA
        <LoadFunction> <...> name = 'anims\Ped_Blocker\Ped_Blocker_BlockA2idle.ska' descchecksum = Ped_Blocker_BlockA2idle
        <LoadFunction> <...> name = 'anims\Ped_Blocker\Ped_Blocker_idletoBlockB.ska' descchecksum = Ped_Blocker_idletoBlockB
        <LoadFunction> <...> name = 'anims\Ped_Blocker\Ped_Blocker_BlockB2idle.ska' descchecksum = Ped_Blocker_BlockB2idle
        <LoadFunction> <...> name = 'anims\Ped_Blocker\Ped_Blocker_ShuffleBlockLeft.ska' descchecksum = Ped_Blocker_ShuffleBlockLeft
        <LoadFunction> <...> name = 'anims\Ped_Blocker\Ped_Blocker_ShuffleBlockRight.ska' descchecksum = Ped_Blocker_ShuffleBlockRight
    endif
    SetReferenceChecksum 0
endscript


script animload_PED_M_Pissed LoadFunction = LoadAnim
    SetReferenceChecksum THPS6_human
    if <LoadFunction> <...> name = 'anims\Ped_CopClipboard\Ped_CopClipboard_Stand.ska' descchecksum = Ped_CopClipboard_Stand
        <LoadFunction> <...> name = 'anims\Ped_CopClipboard\Ped_CopClipboard_Stand2Idle.ska' descchecksum = Ped_CopClipboard_Stand2Idle
        <LoadFunction> <...> name = 'anims\Ped_CopClipboard\Ped_CopClipboard1.ska' descchecksum = Ped_CopClipboard1
        <LoadFunction> <...> name = 'anims\Ped_CopClipboard\Ped_CopClipboard2.ska' descchecksum = Ped_CopClipboard2
        <LoadFunction> <...> name = 'anims\Ped_CopClipboard\Ped_CopClipboard3.ska' descchecksum = Ped_CopClipboard3
        <LoadFunction> <...> name = 'anims\Ped_CopClipboard\Ped_CopClipboard4.ska' descchecksum = Ped_CopClipboard4
        <LoadFunction> <...> name = 'anims\PED_M_Pissed\PED_M_Pissed01.ska' descchecksum = PED_M_Pissed01
        <LoadFunction> <...> name = 'anims\PED_M_Pissed\PED_M_Pissed02.ska' descchecksum = PED_M_Pissed02
        <LoadFunction> <...> name = 'anims\PED_M_Pissed\PED_M_Pissed03.ska' descchecksum = PED_M_Pissed03
        <LoadFunction> <...> name = 'anims\PED_M_Pissed\PED_M_Pissed04.ska' descchecksum = PED_M_Pissed04
    endif
    SetReferenceChecksum 0
endscript


script animload_Ped_CraneOperator LoadFunction = LoadAnim
    SetReferenceChecksum THPS6_human
    if <LoadFunction> <...> name = 'anims\Ped_CraneOperator\Ped_CraneOperator.ska' descchecksum = Ped_CraneOperator
    endif
    SetReferenceChecksum 0
endscript


script animload_PED_DJQBert LoadFunction = LoadAnim
    SetReferenceChecksum THPS6_human
    if <LoadFunction> <...> name = 'anims\Ped_DJQBert\Ped_DJQBert_Scratch1.ska' descchecksum = Ped_DJQBert_Scratch1
        <LoadFunction> <...> name = 'anims\Ped_DJQBert\Ped_DJQBert_Scratch2.ska' descchecksum = Ped_DJQBert_Scratch2
        <LoadFunction> <...> name = 'anims\Ped_DJQBert\Ped_DJQBert_Scratch6.ska' descchecksum = Ped_DJQBert_Scratch6
    endif
    SetReferenceChecksum 0
endscript


script animload_Ped_Driver LoadFunction = LoadAnim
    SetReferenceChecksum THPS6_human
    if <LoadFunction> <...> name = 'anims\Ped_Driver\Ped_Driver_Turn_Range.ska' descchecksum = Ped_Driver_Turn_Range
        <LoadFunction> <...> name = 'anims\Ped_Driver\Ped_Driver_Forklift.ska' descchecksum = Ped_Driver_Forklift
    endif
    SetReferenceChecksum 0
endscript


script animload_THPS6_human LoadFunction = LoadAnim
    animload_THPS6_human_0 <...> 
    animload_THPS6_human_1 <...> 
endscript


script animload_THPS6_human_0 LoadFunction = LoadAnim
    SetReferenceChecksum THPS6_human
    if <LoadFunction> <...> name = 'anims\Ped_M\Ped_M_CheerIdle6.ska' descchecksum = Ped_M_CheerIdle6
        <LoadFunction> <...> name = 'anims\Ped_M\Ped_M_CheerIdle5.ska' descchecksum = Ped_M_CheerIdle5
        <LoadFunction> <...> name = 'anims\Ped_M\Ped_M_CheerIdle2.ska' descchecksum = Ped_M_CheerIdle2
        <LoadFunction> <...> name = 'anims\Ped_M\Ped_M_CheerIdle3.ska' descchecksum = Ped_M_CheerIdle3
        <LoadFunction> <...> name = 'anims\Ped_M\Ped_M_CheerIdle4.ska' descchecksum = Ped_M_CheerIdle4
        <LoadFunction> <...> name = 'anims\Ped_M\Ped_M_CheerIdle1.ska' descchecksum = Ped_M_CheerIdle1
        <LoadFunction> <...> name = 'anims\Ped_M\Ped_M_CheerIdleFlip.ska' descchecksum = Ped_M_CheerIdleFlip
        <LoadFunction> <...> name = 'anims\Ped_M\Ped_M_Cheering.ska' descchecksum = Ped_M_Cheering
        <LoadFunction> <...> name = 'anims\Ped_M\Ped_M_Cheer1.ska' descchecksum = Ped_M_Cheer1
        <LoadFunction> <...> name = 'anims\Ped_M\Ped_M_Cheer5.ska' descchecksum = Ped_M_Cheer5
        <LoadFunction> <...> name = 'anims\Ped_M\Ped_M_Cheer6.ska' descchecksum = Ped_M_Cheer6
        <LoadFunction> <...> name = 'anims\Ped_M\Ped_M_Cheer7.ska' descchecksum = Ped_M_Cheer7
        <LoadFunction> <...> name = 'anims\Ped_M\Ped_M_Cheer_KneelingIdle.ska' descchecksum = Ped_M_Cheer_KneelingIdle
        <LoadFunction> <...> name = 'anims\Ped_M\Ped_M_Cheer_Kneeling1.ska' descchecksum = Ped_M_Cheer_Kneeling1
        <LoadFunction> <...> name = 'anims\Ped_M\Ped_M_Cheer_Kneeling2.ska' descchecksum = Ped_M_Cheer_Kneeling2
        <LoadFunction> <...> name = 'anims\Ped_M\Ped_M_Cheer_Kneeling3.ska' descchecksum = Ped_M_Cheer_Kneeling3
        <LoadFunction> <...> name = 'anims\Ped_M\Ped_M_Cheer_KneelingIdle2.ska' descchecksum = Ped_M_Cheer_KneelingIdle2
        <LoadFunction> <...> name = 'anims\Ped_M\Ped_M_Cheer_Sitting1.ska' descchecksum = Ped_M_Cheer_Sitting1
        <LoadFunction> <...> name = 'anims\Ped_M\Ped_M_Cheer_Sitting2.ska' descchecksum = Ped_M_Cheer_Sitting2
        <LoadFunction> <...> name = 'anims\Ped_M\Ped_M_Cheer_Sitting3.ska' descchecksum = Ped_M_Cheer_Sitting3
        <LoadFunction> <...> name = 'anims\Ped_M\Ped_M_Cheer_Sitting4.ska' descchecksum = Ped_M_Cheer_Sitting4
        <LoadFunction> <...> name = 'anims\Ped_M\Ped_M_Cheer_Sitting5.ska' descchecksum = Ped_M_Cheer_Sitting5
        <LoadFunction> <...> name = 'anims\Ped_M\Ped_M_Cheer_SittingFlip.ska' descchecksum = Ped_M_Cheer_SittingFlip
        <LoadFunction> <...> name = 'anims\Ped_M\Ped_M_Cheer_SittingIdle.ska' descchecksum = Ped_M_Cheer_SittingIdle
        <LoadFunction> <...> name = 'anims\Ped_M\Ped_M_Cheer_SittingIdle2.ska' descchecksum = Ped_M_Cheer_SittingIdle2
        <LoadFunction> <...> name = 'anims\Ped_M\Ped_M_Cheer_SittingIdle3.ska' descchecksum = Ped_M_Cheer_SittingIdle3
        <LoadFunction> <...> name = 'anims\Ped_M\Ped_M_Cheer_SittingLeft.ska' descchecksum = Ped_M_Cheer_SittingLeft
        <LoadFunction> <...> name = 'anims\Ped_M\Ped_M_Clap.ska' descchecksum = Ped_M_Clap
        <LoadFunction> <...> name = 'anims\Ped_M_Idles\Ped_M_Idle1.ska' descchecksum = Ped_M_Idle1
        <LoadFunction> <...> name = 'anims\Ped_M\Ped_M_SkateIdle1.ska' descchecksum = Ped_M_SkateIdle1
        <LoadFunction> <...> name = 'anims\Ped_M\Ped_M_SkateIdle2.ska' descchecksum = Ped_M_SkateIdle2
        <LoadFunction> <...> name = 'anims\Ped_M\Ped_M_SkateIdle3.ska' descchecksum = Ped_M_SkateIdle3
        <LoadFunction> <...> name = 'anims\Ped_M\Ped_M_SkateIdle4.ska' descchecksum = Ped_M_SkateIdle4
        <LoadFunction> <...> name = 'anims\Ped_M\Ped_M_SkateIdle5.ska' descchecksum = Ped_M_SkateIdle5
        <LoadFunction> <...> name = 'anims\Ped_M\Ped_M_SkateIdle6.ska' descchecksum = Ped_M_SkateIdle6
        <LoadFunction> <...> name = 'anims\Ped_M\Ped_M_SkateIdle7.ska' descchecksum = Ped_M_SkateIdle7
        <LoadFunction> <...> name = 'anims\Ped_M\Ped_M_SkateIdleA.ska' descchecksum = Ped_M_SkateIdleA
        <LoadFunction> <...> name = 'anims\Ped_M\Ped_M_SkateIdleB.ska' descchecksum = Ped_M_SkateIdleB
        <LoadFunction> <...> name = 'anims\Ped_M\Ped_M_SkateIdleC.ska' descchecksum = Ped_M_SkateIdleC
        <LoadFunction> <...> name = 'anims\Ped_M\Ped_M_SkateIdleD.ska' descchecksum = Ped_M_SkateIdleD
        <LoadFunction> <...> name = 'anims\Ped_M\Ped_M_Talk2_Idle.ska' descchecksum = Ped_M_Talk2_Idle
        <LoadFunction> <...> name = 'anims\Ped_M\Ped_M_Talk2_Idle2.ska' descchecksum = Ped_M_Talk2_Idle2
        <LoadFunction> <...> name = 'anims\Ped_M\Ped_M_Talk2_RightHere.ska' descchecksum = Ped_M_Talk2_RightHere
        <LoadFunction> <...> name = 'anims\Ped_M\Ped_M_Talk2_MixIt.ska' descchecksum = Ped_M_Talk2_MixIt
        <LoadFunction> <...> name = 'anims\Ped_M\Ped_M_Talk2_SureThing.ska' descchecksum = Ped_M_Talk2_SureThing
        <LoadFunction> <...> name = 'anims\Ped_M\Ped_M_Talk2_Maybe.ska' descchecksum = Ped_M_Talk2_Maybe
        <LoadFunction> <...> name = 'anims\Ped_M\Ped_M_Talk2_WhatDoYouThink.ska' descchecksum = Ped_M_Talk2_WhatDoYouThink
        <LoadFunction> <...> name = 'anims\Ped_M\Ped_M_Talk2_OfCourse.ska' descchecksum = Ped_M_Talk2_OfCourse
        <LoadFunction> <...> name = 'anims\Ped_M\Ped_M_Talk2_BackThere.ska' descchecksum = Ped_M_Talk2_BackThere
        <LoadFunction> <...> name = 'anims\Ped_M\Ped_M_Talk2_RoundAndRound.ska' descchecksum = Ped_M_Talk2_RoundAndRound
    endif
    SetReferenceChecksum 0
endscript


script animload_THPS6_human_1 LoadFunction = LoadAnim
    SetReferenceChecksum THPS6_human
    if <LoadFunction> <...> name = 'anims\Ped_M\Ped_M_Talk2_UpAbove.ska' descchecksum = Ped_M_Talk2_UpAbove
        <LoadFunction> <...> name = 'anims\Ped_M\Ped_M_Talk2_KnowWhatIMean.ska' descchecksum = Ped_M_Talk2_KnowWhatIMean
        <LoadFunction> <...> name = 'anims\Ped_M\Ped_M_Talk2_GoAhead.ska' descchecksum = Ped_M_Talk2_GoAhead
        <LoadFunction> <...> name = 'anims\Ped_M\Ped_M_Talk2_TheyllTellYou.ska' descchecksum = Ped_M_Talk2_TheyllTellYou
        <LoadFunction> <...> name = 'anims\Ped_M\Ped_M_ThumbUp.ska' descchecksum = Ped_M_ThumbUp
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\Cheer1.ska' descchecksum = Cheer1
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\Cheer2.ska' descchecksum = Cheer2
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\Idle.ska' descchecksum = idle
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\Prop.ska' descchecksum = prop
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\Taunt1.ska' descchecksum = Taunt1
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\Taunt2.ska' descchecksum = Taunt2
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\Taunt3.ska' descchecksum = Taunt3
        <LoadFunction> <...> name = 'anims\THPS6_Basics\Default.ska' descchecksum = default
        <LoadFunction> <...> name = 'anims\thps6_skater_OnFoot_partial\WStandIdle1_Partial.ska' descchecksum = WStandIdle1_Partial
        <LoadFunction> <...> name = 'anims\thps6_skater_OnFoot_partial\WStandIdle2_Partial.ska' descchecksum = WStandIdle2_Partial
        <LoadFunction> <...> name = 'anims\thps6_skater_OnFoot_partial\WStandIdle3_Partial.ska' descchecksum = WStandIdle3_Partial
        <LoadFunction> <...> name = 'anims\thps6_skater_OnFoot_partial\WStandIdle4_Partial.ska' descchecksum = WStandIdle4_Partial
        <LoadFunction> <...> name = 'anims\thps6_skater_OnFoot_partial\WStandIdle5_Partial.ska' descchecksum = WStandIdle5_Partial
        <LoadFunction> <...> name = 'anims\thps6_skater_OnFoot_partial\WStandIdle6_Partial.ska' descchecksum = WStandIdle6_Partial
        <LoadFunction> <...> name = 'anims\thps6_skater_OnFoot_partial\LadderFastClimb_Partial.ska' descchecksum = LadderFastClimb_Partial
        <LoadFunction> <...> name = 'anims\thps6_skater_OnFoot_partial\JumpLandToWalk_Partial.ska' descchecksum = JumpLandToWalk_Partial
        <LoadFunction> <...> name = 'anims\THPS6_Skater_Basics\Throw_Sidearm.ska' descchecksum = Throw_Sidearm
        <LoadFunction> <...> name = 'anims\thps6_skater_OnFoot\WalkingSlap.ska' descchecksum = WalkingSlap
        <LoadFunction> <...> name = 'anims\thps6_skater_OnFoot\WStandIdle1.ska' descchecksum = WStandIdle1
        <LoadFunction> <...> name = 'anims\thps6_skater_OnFoot\WStandIdle2.ska' descchecksum = WStandIdle2
        <LoadFunction> <...> name = 'anims\thps6_skater_OnFoot\WStandIdle3.ska' descchecksum = WStandIdle3
        <LoadFunction> <...> name = 'anims\thps6_skater_OnFoot\WStandIdle4.ska' descchecksum = WStandIdle4
        <LoadFunction> <...> name = 'anims\thps6_skater_OnFoot\WStandIdle5.ska' descchecksum = WStandIdle5
        <LoadFunction> <...> name = 'anims\thps6_skater_OnFoot\WStandIdle6.ska' descchecksum = WStandIdle6
    endif
    SetReferenceChecksum 0
endscript


script animload_THPS6_human_unloadable LoadFunction = LoadAnim
    animload_THPS6_human_unloadable_0 <...> 
    animload_THPS6_human_unloadable_1 <...> 
    animload_THPS6_human_unloadable_2 <...> 
    animload_THPS6_human_unloadable_3 <...> 
    animload_THPS6_human_unloadable_4 <...> 
    animload_THPS6_human_unloadable_5 <...> 
    animload_THPS6_human_unloadable_6 <...> 
    animload_THPS6_human_unloadable_7 <...> 
    animload_THPS6_human_unloadable_8 <...> 
    animload_THPS6_human_unloadable_9 <...> 
    animload_THPS6_human_unloadable_10 <...> 
    animload_THPS6_human_unloadable_11 <...> 
    animload_THPS6_human_unloadable_12 <...> 
    animload_THPS6_human_unloadable_13 <...> 
    animload_THPS6_human_unloadable_14 <...> 
    animload_THPS6_human_unloadable_15 <...> 
    animload_THPS6_human_unloadable_16 <...> 
    animload_THPS6_human_unloadable_17 <...> 
    animload_THPS6_human_unloadable_18 <...> 
    animload_THPS6_human_unloadable_19 <...> 
    animload_THPS6_human_unloadable_20 <...> 
endscript


script animload_THPS6_human_unloadable_0 LoadFunction = LoadAnim
    SetReferenceChecksum THPS6_human
    if <LoadFunction> <...> name = 'anims\Ped_FatGuy\Ped_FatGuy_idle1.ska' descchecksum = Ped_FatGuy_idle1
        <LoadFunction> <...> name = 'anims\Ped_FatGuy\Ped_FatGuy_Idle1toHandsWaist.ska' descchecksum = Ped_FatGuy_Idle1toHandsWaist
        <LoadFunction> <...> name = 'anims\Ped_FatGuy\Ped_FatGuy_HandsWaistIdle.ska' descchecksum = Ped_FatGuy_HandsWaistIdle
        <LoadFunction> <...> name = 'anims\Ped_FatGuy\Ped_FatGuy_HandsWaist2Idle.ska' descchecksum = Ped_FatGuy_HandsWaist2Idle
        <LoadFunction> <...> name = 'anims\Ped_FatGuy\Ped_FatGuy_Idle1toWipeHead.ska' descchecksum = Ped_FatGuy_Idle1toWipeHead
        <LoadFunction> <...> name = 'anims\Ped_FatGuy\Ped_FatGuy_Run.ska' descchecksum = Ped_FatGuy_Run
        <LoadFunction> <...> name = 'anims\Ped_FatGuy\Ped_FatGuy_IdletoWalk.ska' descchecksum = Ped_FatGuy_IdletoWalk
        <LoadFunction> <...> name = 'anims\Ped_FatGuy\Ped_FatGuy_Walk.ska' descchecksum = Ped_FatGuy_Walk
        <LoadFunction> <...> name = 'anims\Ped_FatGuy\Ped_FatGuy_WalktoIdle.ska' descchecksum = Ped_FatGuy_WalktoIdle
        <LoadFunction> <...> name = 'anims\Ped_FatGuy\Ped_FatGuy_Push.ska' descchecksum = Ped_FatGuy_Push
        <LoadFunction> <...> name = 'anims\Ped_FatGuy\Ped_FatGuy_Avoid.ska' descchecksum = Ped_FatGuy_Avoid
        <LoadFunction> <...> name = 'anims\Ped_FatGuy\Ped_FatGuy_IdletoKnockdown.ska' descchecksum = Ped_FatGuy_IdletoKnockdown
        <LoadFunction> <...> name = 'anims\Ped_FatGuy\Ped_FatGuy_KnockdownIdle.ska' descchecksum = Ped_FatGuy_KnockdownIdle
        <LoadFunction> <...> name = 'anims\Ped_FatGuy\Ped_FatGuy_KnockdowntoIdle.ska' descchecksum = Ped_FatGuy_KnockdowntoIdle
        <LoadFunction> <...> name = 'anims\Ped_FatGuy\Ped_FatGuy_ScratchButt.ska' descchecksum = Ped_FatGuy_ScratchButt
        <LoadFunction> <...> name = 'anims\Ped_FatGuy\Ped_FatGuy_GetAttention01.ska' descchecksum = Ped_FatGuy_GetAttention01
        <LoadFunction> <...> name = 'anims\Ped_FatGuy\Ped_FatGuy_GetAttention02.ska' descchecksum = Ped_FatGuy_GetAttention02
        <LoadFunction> <...> name = 'anims\Ped_M\Ped_Guide_Idle1.ska' descchecksum = Ped_Guide_Idle1
        <LoadFunction> <...> name = 'anims\Ped_M\Ped_Guide_Idle2.ska' descchecksum = Ped_Guide_Idle2
        <LoadFunction> <...> name = 'anims\Ped_M\Ped_M_Cheer_KneelingLeft.ska' descchecksum = Ped_M_Cheer_KneelingLeft
        <LoadFunction> <...> name = 'anims\Ped_M\Ped_M_Cheer_KneelingFlip.ska' descchecksum = Ped_M_Cheer_KneelingFlip
        <LoadFunction> <...> name = 'anims\Ped_M\Ped_M_Disgust.ska' descchecksum = Ped_M_Disgust
        <LoadFunction> <...> name = 'anims\Ped_M_Idles_02\Ped_M_Idle1toArcade.ska' descchecksum = Ped_M_Idle1toArcade
        <LoadFunction> <...> name = 'anims\Ped_M_Idles_02\Ped_M_ArcadeIdle.ska' descchecksum = Ped_M_ArcadeIdle
        <LoadFunction> <...> name = 'anims\Ped_M_Idles_02\Ped_M_Arcade1.ska' descchecksum = Ped_M_Arcade1
        <LoadFunction> <...> name = 'anims\Ped_M_Idles_02\Ped_M_Arcade2.ska' descchecksum = Ped_M_Arcade2
        <LoadFunction> <...> name = 'anims\Ped_M_Idles_02\Ped_M_ArcadetoIdle.ska' descchecksum = Ped_M_ArcadetoIdle
        <LoadFunction> <...> name = 'anims\Ped_M_Idles_02\Ped_M_IdletoATM.ska' descchecksum = Ped_M_IdletoATM
        <LoadFunction> <...> name = 'anims\Ped_M_Idles_02\Ped_M_ATM1.ska' descchecksum = Ped_M_ATM1
        <LoadFunction> <...> name = 'anims\Ped_M_Idles_02\Ped_M_ATM2.ska' descchecksum = Ped_M_ATM2
        <LoadFunction> <...> name = 'anims\Ped_M_Idles_02\Ped_M_ATMtoIdle.ska' descchecksum = Ped_M_ATMtoIdle
        <LoadFunction> <...> name = 'anims\Ped_M_Idles_02\Ped_M_IdletoObserve.ska' descchecksum = Ped_M_IdletoObserve
        <LoadFunction> <...> name = 'anims\Ped_M_Idles_02\Ped_M_ObserveIdle.ska' descchecksum = Ped_M_ObserveIdle
        <LoadFunction> <...> name = 'anims\Ped_M_Idles_02\Ped_M_ObserveScratch.ska' descchecksum = Ped_M_ObserveScratch
        <LoadFunction> <...> name = 'anims\Ped_M_Idles_02\Ped_M_ObservetoIdle.ska' descchecksum = Ped_M_ObservetoIdle
        <LoadFunction> <...> name = 'anims\Ped_M_Idles_02\Ped_M_ArcadeFistAir.ska' descchecksum = Ped_M_ArcadeFistAir
        <LoadFunction> <...> name = 'anims\Ped_M_Idles_02\Ped_M_ObserveWipe.ska' descchecksum = Ped_M_ObserveWipe
        <LoadFunction> <...> name = 'anims\Ped_M_Idles_02\Ped_M_Observe02.ska' descchecksum = Ped_M_Observe02
        <LoadFunction> <...> name = 'anims\Ped_M\Ped_M_JumpBack.ska' descchecksum = Ped_M_JumpBack
        <LoadFunction> <...> name = 'anims\Ped_M\Ped_M_JumpForward.ska' descchecksum = Ped_M_JumpForward
        <LoadFunction> <...> name = 'anims\Ped_M\Ped_M_JumpLeft.ska' descchecksum = Ped_M_JumpLeft
        <LoadFunction> <...> name = 'anims\Ped_M\Ped_M_FalldownA.ska' descchecksum = Ped_M_FalldownA
        <LoadFunction> <...> name = 'anims\Ped_M\Ped_M_GetUpA.ska' descchecksum = Ped_M_GetUpA
        <LoadFunction> <...> name = 'anims\Ped_M\Ped_M_FalldownB.ska' descchecksum = Ped_M_FalldownB
        <LoadFunction> <...> name = 'anims\Ped_M\Ped_M_GetUpB.ska' descchecksum = Ped_M_GetUpB
        <LoadFunction> <...> name = 'anims\Ped_M\Ped_M_FalldownC.ska' descchecksum = Ped_M_FalldownC
        <LoadFunction> <...> name = 'anims\Ped_M\Ped_M_GetUpC.ska' descchecksum = Ped_M_GetUpC
        <LoadFunction> <...> name = 'anims\Ped_M\Ped_M_FalldownD.ska' descchecksum = Ped_M_FalldownD
        <LoadFunction> <...> name = 'anims\Ped_M\Ped_M_GetUpD.ska' descchecksum = Ped_M_GetUpD
        <LoadFunction> <...> name = 'anims\Ped_M\Ped_M_FalldownE.ska' descchecksum = Ped_M_FalldownE
    endif
    SetReferenceChecksum 0
endscript


script animload_THPS6_human_unloadable_1 LoadFunction = LoadAnim
    SetReferenceChecksum THPS6_human
    if <LoadFunction> <...> name = 'anims\Ped_M\Ped_M_GetUpE.ska' descchecksum = Ped_M_GetUpE
        <LoadFunction> <...> name = 'anims\Ped_M\Ped_M_LayIdleA.ska' descchecksum = Ped_M_LayIdleA
        <LoadFunction> <...> name = 'anims\Ped_M\Ped_M_LayIdleB.ska' descchecksum = Ped_M_LayIdleB
        <LoadFunction> <...> name = 'anims\Ped_M\Ped_M_LayIdleC.ska' descchecksum = Ped_M_LayIdleC
        <LoadFunction> <...> name = 'anims\Ped_M\Ped_M_LayIdleD.ska' descchecksum = Ped_M_LayIdleD
        <LoadFunction> <...> name = 'anims\Ped_M\Ped_M_LayIdleE.ska' descchecksum = Ped_M_LayIdleE
        <LoadFunction> <...> name = 'anims\Ped_M\Ped_M_LookAround.ska' descchecksum = Ped_M_LookAround
        <LoadFunction> <...> name = 'anims\Ped_M\Ped_M_LookAtWatch.ska' descchecksum = Ped_M_LookAtWatch
        <LoadFunction> <...> name = 'anims\Ped_M\Ped_M_LookAtWatch2.ska' descchecksum = Ped_M_LookAtWatch2
        <LoadFunction> <...> name = 'anims\Ped_M\Ped_M_LookLeftDown.ska' descchecksum = Ped_M_LookLeftDown
        <LoadFunction> <...> name = 'anims\Ped_M\Ped_M_LookLeftRight.ska' descchecksum = Ped_M_LookLeftRight
        <LoadFunction> <...> name = 'anims\Ped_M\Ped_M_Lookright.ska' descchecksum = Ped_M_Lookright
        <LoadFunction> <...> name = 'anims\Ped_M\Ped_M_PlayerWave.ska' descchecksum = Ped_M_PlayerWave
        <LoadFunction> <...> name = 'anims\Ped_M\Ped_M_Punch.ska' descchecksum = Ped_M_Punch
        <LoadFunction> <...> name = 'anims\Ped_M\Ped_M_Push.ska' descchecksum = Ped_M_Push
        <LoadFunction> <...> name = 'anims\Ped_M\Ped_M_RunFromIdle.ska' descchecksum = Ped_M_RunFromIdle
        <LoadFunction> <...> name = 'anims\Ped_M\Ped_M_Run.ska' descchecksum = Ped_M_Run
        <LoadFunction> <...> name = 'anims\Ped_M\Ped_M_RunToIdle.ska' descchecksum = Ped_M_RunToIdle
        <LoadFunction> <...> name = 'anims\Ped_M\Ped_M_Run1.ska' descchecksum = Ped_M_Run1
        <LoadFunction> <...> name = 'anims\Ped_M\Ped_M_ScratchChin.ska' descchecksum = Ped_M_ScratchChin
        <LoadFunction> <...> name = 'anims\Ped_M\Ped_M_ShakeFist.ska' descchecksum = Ped_M_ShakeFist
        <LoadFunction> <...> name = 'anims\Ped_M\Ped_M_Talk_Dull.ska' descchecksum = Ped_M_Talk_Dull
        <LoadFunction> <...> name = 'anims\Ped_M\Ped_M_Talk_ISupposeSo.ska' descchecksum = Ped_M_Talk_ISupposeSo
        <LoadFunction> <...> name = 'anims\Ped_M\Ped_M_Talk_RaiseArn.ska' descchecksum = Ped_M_Talk_RaiseArn
        <LoadFunction> <...> name = 'anims\Ped_M\Ped_M_Talk_Shrug.ska' descchecksum = Ped_M_Talk_Shrug
        <LoadFunction> <...> name = 'anims\Ped_M\Ped_M_Talk_WhoKnows.ska' descchecksum = Ped_M_Talk_WhoKnows
        <LoadFunction> <...> name = 'anims\Ped_M\Ped_M_RotateLFromIdle1.ska' descchecksum = Ped_M_RotateLFromIdle1
        <LoadFunction> <...> name = 'anims\Ped_M\Ped_M_Idle1TurnL.ska' descchecksum = Ped_M_Idle1TurnL
        <LoadFunction> <...> name = 'anims\Ped_M\Ped_M_Walk1FromIdle.ska' descchecksum = Ped_M_Walk1FromIdle
        <LoadFunction> <...> name = 'anims\Ped_M\Ped_M_Walk1.ska' descchecksum = Ped_M_Walk1
        <LoadFunction> <...> name = 'anims\Ped_M\Ped_M_Walk1ToIdle.ska' descchecksum = Ped_M_Walk1ToIdle
        <LoadFunction> <...> name = 'anims\Ped_M\Ped_M_WalkingWave.ska' descchecksum = Ped_M_WalkingWave
        <LoadFunction> <...> name = 'anims\Ped_M\Ped_M_Walk2.ska' descchecksum = Ped_M_Walk2
        <LoadFunction> <...> name = 'anims\Ped_M\Ped_M_Walk2ToIdle.ska' descchecksum = Ped_M_Walk2ToIdle
        <LoadFunction> <...> name = 'anims\Ped_M\Ped_M_Run1.ska' descchecksum = Ped_M_Run1
        <LoadFunction> <...> name = 'anims\Ped_M\Ped_M_Run1ToIdle.ska' descchecksum = Ped_M_Run1ToIdle
        <LoadFunction> <...> name = 'anims\Ped_M\Ped_M_Run2.ska' descchecksum = Ped_M_Run2
        <LoadFunction> <...> name = 'anims\Ped_M\Ped_M_Walk3.ska' descchecksum = Ped_M_Walk3
        <LoadFunction> <...> name = 'anims\Ped_M\Ped_M_Walk4.ska' descchecksum = Ped_M_Walk4
        <LoadFunction> <...> name = 'anims\Ped_M\Ped_M_WalkCool.ska' descchecksum = Ped_M_WalkCool
        <LoadFunction> <...> name = 'anims\Ped_M\Ped_M_WalkTired.ska' descchecksum = Ped_M_WalkTired
        <LoadFunction> <...> name = 'anims\Ped_M\Ped_M_Wave.ska' descchecksum = Ped_M_Wave
        <LoadFunction> <...> name = 'anims\Ped_Sitting\PED_STND2SIT.ska' descchecksum = PED_STND2SIT
        <LoadFunction> <...> name = 'anims\Ped_Sitting\PED_SIT_Tap.ska' descchecksum = PED_SIT_Tap
        <LoadFunction> <...> name = 'anims\Ped_Sitting\PED_SIT_LookR.ska' descchecksum = PED_SIT_LookR
        <LoadFunction> <...> name = 'anims\Ped_Sitting\PED_SIT_Idle.ska' descchecksum = PED_SIT_Idle
        <LoadFunction> <...> name = 'anims\Ped_Sitting\PED_SIT2STND.ska' descchecksum = PED_SIT2STND
        <LoadFunction> <...> name = 'anims\Ped_Sitting\PED_SIT_LookL.ska' descchecksum = PED_SIT_LookL
        <LoadFunction> <...> name = 'anims\Ped_Sitting\PED_SIT2SITB.ska' descchecksum = PED_SIT2SITB
        <LoadFunction> <...> name = 'anims\Ped_Sitting\PED_SITB_Idle.ska' descchecksum = PED_SITB_Idle
    endif
    SetReferenceChecksum 0
endscript


script animload_THPS6_human_unloadable_2 LoadFunction = LoadAnim
    SetReferenceChecksum THPS6_human
    if <LoadFunction> <...> name = 'anims\Ped_Sitting\PED_SITB_LookR.ska' descchecksum = PED_SITB_LookR
        <LoadFunction> <...> name = 'anims\Ped_Sitting\PED_SITB_LookL.ska' descchecksum = PED_SITB_LookL
        <LoadFunction> <...> name = 'anims\Ped_Sitting\PED_SITB2SITBL.ska' descchecksum = PED_SITB2SITBL
        <LoadFunction> <...> name = 'anims\Ped_Sitting\PED_SITBL_Idle.ska' descchecksum = PED_SITBL_Idle
        <LoadFunction> <...> name = 'anims\Ped_Sitting\PED_SITBL_Tap.ska' descchecksum = PED_SITBL_Tap
        <LoadFunction> <...> name = 'anims\Ped_Sitting\PED_SITBL_LookL.ska' descchecksum = PED_SITBL_LookL
        <LoadFunction> <...> name = 'anims\Ped_Sitting\PED_SITBL_Shake.ska' descchecksum = PED_SITBL_Shake
        <LoadFunction> <...> name = 'anims\Ped_Sitting\PED_SITBL2SIT.ska' descchecksum = PED_SITBL2SIT
        <LoadFunction> <...> name = 'anims\THPS6_skater_bails\RunOutQuick.ska' descchecksum = RunOutQuick
        <LoadFunction> <...> name = 'anims\THPS6_skater_bails\Bail_Falling_BCK.ska' descchecksum = Bail_Falling_BCK
        <LoadFunction> <...> name = 'anims\THPS6_skater_bails\Bail_Falling_FWD.ska' descchecksum = Bail_Falling_FWD
        <LoadFunction> <...> name = 'anims\THPS6_skater_bails\Bail_Falling_Hit_Hard_BCK.ska' descchecksum = Bail_Falling_Hit_Hard_BCK
        <LoadFunction> <...> name = 'anims\THPS6_skater_bails\Bail_Falling_Hit_Hard_FWD.ska' descchecksum = Bail_Falling_Hit_Hard_FWD
        <LoadFunction> <...> name = 'anims\THPS6_skater_bails\Bail_Falling_Hit_Med_BCK.ska' descchecksum = Bail_Falling_Hit_Med_BCK
        <LoadFunction> <...> name = 'anims\THPS6_skater_bails\Bail_Falling_Hit_Med_FWD.ska' descchecksum = Bail_Falling_Hit_Med_FWD
        <LoadFunction> <...> name = 'anims\THPS6_skater_bails\Bail_Falling_Idle_BCK.ska' descchecksum = Bail_Falling_Idle_BCK
        <LoadFunction> <...> name = 'anims\THPS6_skater_bails\Bail_Falling_Idle_FWD.ska' descchecksum = Bail_Falling_Idle_FWD
        <LoadFunction> <...> name = 'anims\THPS6_skater_bails\Bail_Falling_Idle_RT.ska' descchecksum = Bail_Falling_Idle_RT
        <LoadFunction> <...> name = 'anims\THPS6_skater_bails\Bail_Falling_RT.ska' descchecksum = Bail_Falling_RT
        <LoadFunction> <...> name = 'anims\THPS6_skater_bails\Bail_Falling_Slide_HitH_LTb.ska' descchecksum = Bail_Falling_Slide_HitH_LTb
        <LoadFunction> <...> name = 'anims\THPS6_skater_bails\Bail_Falling_Slide_HitH_LTf.ska' descchecksum = Bail_Falling_Slide_HitH_LTf
        <LoadFunction> <...> name = 'anims\THPS6_skater_bails\Bail_Falling_Slide_HitH_RTb.ska' descchecksum = Bail_Falling_Slide_HitH_RTb
        <LoadFunction> <...> name = 'anims\THPS6_skater_bails\Bail_Falling_Slide_HitH_RTf.ska' descchecksum = Bail_Falling_Slide_HitH_RTf
        <LoadFunction> <...> name = 'anims\THPS6_skater_bails\Bail_Falling_Slide_HitM_LTb.ska' descchecksum = Bail_Falling_Slide_HitM_LTb
        <LoadFunction> <...> name = 'anims\THPS6_skater_bails\Bail_Falling_Slide_HitM_LTf.ska' descchecksum = Bail_Falling_Slide_HitM_LTf
        <LoadFunction> <...> name = 'anims\THPS6_skater_bails\Bail_Falling_Slide_HitM_RTb.ska' descchecksum = Bail_Falling_Slide_HitM_RTb
        <LoadFunction> <...> name = 'anims\THPS6_skater_bails\Bail_Falling_Slide_HitM_RTf.ska' descchecksum = Bail_Falling_Slide_HitM_RTf
        <LoadFunction> <...> name = 'anims\THPS6_skater_bails\Bail_Falling_Slide_Idle_LTb.ska' descchecksum = Bail_Falling_Slide_Idle_LTb
        <LoadFunction> <...> name = 'anims\THPS6_skater_bails\Bail_Falling_Slide_Idle_LTf.ska' descchecksum = Bail_Falling_Slide_Idle_LTf
        <LoadFunction> <...> name = 'anims\THPS6_skater_bails\Bail_Falling_Slide_Idle_RTb.ska' descchecksum = Bail_Falling_Slide_Idle_RTb
        <LoadFunction> <...> name = 'anims\THPS6_skater_bails\Bail_Falling_Slide_Idle_RTf.ska' descchecksum = Bail_Falling_Slide_Idle_RTf
        <LoadFunction> <...> name = 'anims\THPS6_skater_bails\Bail_Falling_Slide_LTb.ska' descchecksum = Bail_Falling_Slide_LTb
        <LoadFunction> <...> name = 'anims\THPS6_skater_bails\Bail_Falling_Slide_LTf.ska' descchecksum = Bail_Falling_Slide_LTf
        <LoadFunction> <...> name = 'anims\THPS6_skater_bails\Bail_Falling_Slide_RTb.ska' descchecksum = Bail_Falling_Slide_RTb
        <LoadFunction> <...> name = 'anims\THPS6_skater_bails\Bail_Falling_Slide_RTf.ska' descchecksum = Bail_Falling_Slide_RTf
        <LoadFunction> <...> name = 'anims\THPS6_skater_bails\Bail_Falling_Slide_BCK.ska' descchecksum = Bail_Falling_Slide_BCK
        <LoadFunction> <...> name = 'anims\THPS6_skater_bails\Bail_Falling_Slide_Idle_BCK.ska' descchecksum = Bail_Falling_Slide_Idle_BCK
        <LoadFunction> <...> name = 'anims\THPS6_skater_bails\Bail_Falling_Slide_HitM_BCK.ska' descchecksum = Bail_Falling_Slide_HitM_BCK
        <LoadFunction> <...> name = 'anims\THPS6_skater_bails\Bail_Falling_Slide_HitH_BCK.ska' descchecksum = Bail_Falling_Slide_HitH_BCK
        <LoadFunction> <...> name = 'anims\THPS6_skater_bails\Bail_Falling_LT.ska' descchecksum = Bail_Falling_LT
        <LoadFunction> <...> name = 'anims\THPS6_skater_bails\Bail_Falling_Idle_LT.ska' descchecksum = Bail_Falling_Idle_LT
        <LoadFunction> <...> name = 'anims\THPS6_skater_bails\Bail_Falling_Hit_Hard.ska' descchecksum = Bail_Falling_Hit_Hard
        <LoadFunction> <...> name = 'anims\THPS6_skater_bails\Bail_Falling_Hit_Med.ska' descchecksum = Bail_Falling_Hit_Med
        <LoadFunction> <...> name = 'anims\THPS6_Bail_GetUp\GetUp_HK_Ft.ska' descchecksum = GetUp_HK_Ft
        <LoadFunction> <...> name = 'anims\THPS6_Bail_GetUp\GetUp_S_BoardCatch1.ska' descchecksum = GetUp_S_BoardCatch1
        <LoadFunction> <...> name = 'anims\THPS6_Bail_GetUp\GetUp_S_RunJump.ska' descchecksum = GetUp_S_RunJump
        <LoadFunction> <...> name = 'anims\THPS6_Bail_GetUp\GetUp_S_BoardFlip1.ska' descchecksum = GetUp_S_BoardFlip1
        <LoadFunction> <...> name = 'anims\THPS6_Bail_GetUp\GetUp_HK_Ft_Q.ska' descchecksum = GetUp_HK_Ft_Q
        <LoadFunction> <...> name = 'anims\THPS6_Bail_GetUp\GetUp_Sit_Ft.ska' descchecksum = GetUp_Sit_Ft
        <LoadFunction> <...> name = 'anims\THPS6_Bail_GetUp\GetUp_Sit_Ft_T.ska' descchecksum = GetUp_Sit_Ft_T
    endif
    SetReferenceChecksum 0
endscript


script animload_THPS6_human_unloadable_3 LoadFunction = LoadAnim
    SetReferenceChecksum THPS6_human
    if <LoadFunction> <...> name = 'anims\THPS6_Bail_GetUp\GetUp_Sit_Ft_Q.ska' descchecksum = GetUp_Sit_Ft_Q
        <LoadFunction> <...> name = 'anims\THPS6_Bail_GetUp\GetUp_HK_Lt.ska' descchecksum = GetUp_HK_Lt
        <LoadFunction> <...> name = 'anims\THPS6_Bail_GetUp\GetUp_HK_Lt_T.ska' descchecksum = GetUp_HK_Lt_T
        <LoadFunction> <...> name = 'anims\THPS6_Bail_GetUp\GetUp_HK_Lt_Q.ska' descchecksum = GetUp_HK_Lt_Q
        <LoadFunction> <...> name = 'anims\THPS6_Bail_GetUp\GetUp_HK_Bk.ska' descchecksum = GetUp_HK_Bk
        <LoadFunction> <...> name = 'anims\THPS6_Bail_GetUp\GetUp_HK_Bk_T.ska' descchecksum = GetUp_HK_Bk_T
        <LoadFunction> <...> name = 'anims\THPS6_Bail_GetUp\GetUp_HK_Bk_Q.ska' descchecksum = GetUp_HK_Bk_Q
        <LoadFunction> <...> name = 'anims\THPS6_Bail_GetUp\GetUp_HK_Rt_T.ska' descchecksum = GetUp_HK_Rt_T
        <LoadFunction> <...> name = 'anims\THPS6_Bail_GetUp\GetUp_HK_Rt_Q.ska' descchecksum = GetUp_HK_Rt_Q
        <LoadFunction> <...> name = 'anims\THPS6_Bail_GetUp\GetUp_HK_Rt.ska' descchecksum = GetUp_HK_Rt
        <LoadFunction> <...> name = 'anims\THPS6_Bail_GetUp\GetUp_S_Turn180.ska' descchecksum = GetUp_S_Turn180
        <LoadFunction> <...> name = 'anims\THPS6_Bail_GetUp\GetUp_S_NoPushOff.ska' descchecksum = GetUp_S_NoPushOff
        <LoadFunction> <...> name = 'anims\THPS6_skater_bails\Bail_Manual_BK.ska' descchecksum = Bail_Manual_BK
        <LoadFunction> <...> name = 'anims\THPS6_skater_bails\Bail_Manual_BK_fast.ska' descchecksum = Bail_Manual_BK_fast
        <LoadFunction> <...> name = 'anims\THPS6_skater_bails\Bail_Manual_FT.ska' descchecksum = Bail_Manual_FT
        <LoadFunction> <...> name = 'anims\THPS6_skater_bails\Bail_Manual_FT_fast.ska' descchecksum = Bail_Manual_FT_fast
        <LoadFunction> <...> name = 'anims\THPS6_skater_bails\Nutsac.ska' descchecksum = Nutsac
        <LoadFunction> <...> name = 'anims\THPS6_skater_bails\Bail_Nutter_FWD.ska' descchecksum = Bail_Nutter_FWD
        <LoadFunction> <...> name = 'anims\THPS6_skater_bails\Bail_Nutter_BCK.ska' descchecksum = Bail_Nutter_BCK
        <LoadFunction> <...> name = 'anims\THPS6_skater_bails\Bail_Pitch_Nose.ska' descchecksum = Bail_Pitch_Nose
        <LoadFunction> <...> name = 'anims\THPS6_skater_bails\Bail_Pitch_Back.ska' descchecksum = Bail_Pitch_Back
        <LoadFunction> <...> name = 'anims\THPS6_skater_bails\Bail_Pitch_Face.ska' descchecksum = Bail_Pitch_Face
        <LoadFunction> <...> name = 'anims\THPS6_skater_bails\Bail_Pitch_Tail.ska' descchecksum = Bail_Pitch_Tail
        <LoadFunction> <...> name = 'anims\THPS6_skater_bails\Bail_Ramp_Lt.ska' descchecksum = Bail_Ramp_Lt
        <LoadFunction> <...> name = 'anims\THPS6_skater_bails\Bail_Ramp_Rt.ska' descchecksum = Bail_Ramp_Rt
        <LoadFunction> <...> name = 'anims\THPS6_skater_bails\Bail_Ramp_Bk_Hd.ska' descchecksum = Bail_Ramp_Bk_Hd
        <LoadFunction> <...> name = 'anims\THPS6_skater_bails\Bail_Ramp_Rt_Med.ska' descchecksum = Bail_Ramp_Rt_Med
        <LoadFunction> <...> name = 'anims\THPS6_skater_bails\Bail_Ramp_Lt_Med.ska' descchecksum = Bail_Ramp_Lt_Med
        <LoadFunction> <...> name = 'anims\THPS6_skater_bails\Bail_Ramp_Bk.ska' descchecksum = Bail_Ramp_Bk
        <LoadFunction> <...> name = 'anims\THPS6_skater_bails\Bail_Ramp_Ft_Hd.ska' descchecksum = Bail_Ramp_Ft_Hd
        <LoadFunction> <...> name = 'anims\THPS6_skater_bails\Bail_Ramp_Ft_Med.ska' descchecksum = Bail_Ramp_Ft_Med
        <LoadFunction> <...> name = 'anims\THPS6_skater_bails\Bail_Ramp_Ft.ska' descchecksum = Bail_Ramp_Ft
        <LoadFunction> <...> name = 'anims\THPS6_Skater_bails\Bail_Ramp_Lt_Hd.ska' descchecksum = Bail_Ramp_Lt_Hd
        <LoadFunction> <...> name = 'anims\THPS6_skater_bails\Bail_Ramp_Rt_Hd.ska' descchecksum = Bail_Ramp_Rt_Hd
        <LoadFunction> <...> name = 'anims\THPS6_skater_bails\Bail_RunOut_Old.ska' descchecksum = Bail_RunOut_Old
        <LoadFunction> <...> name = 'anims\THPS6_skater_bails\Bail_RunOut_New_A.ska' descchecksum = Bail_RunOut_New_A
        <LoadFunction> <...> name = 'anims\THPS6_skater_bails\RunOut_Drop_Idle.ska' descchecksum = RunOut_Drop_Idle
        <LoadFunction> <...> name = 'anims\THPS6_skater_bails\RunOut_Drop_Land_Med.ska' descchecksum = RunOut_Drop_Land_Med
        <LoadFunction> <...> name = 'anims\THPS6_skater_bails\Bail_Spin_CCW_Hard.ska' descchecksum = Bail_Spin_CCW_Hard
        <LoadFunction> <...> name = 'anims\THPS6_skater_bails\Bail_Spin_CW_Hard.ska' descchecksum = Bail_Spin_CW_Hard
        <LoadFunction> <...> name = 'anims\THPS6_skater_bails\Bail_Spin_CCW_Hard_B.ska' descchecksum = Bail_Spin_CCW_Hard_B
        <LoadFunction> <...> name = 'anims\THPS6_skater_bails\Bail_Spin_CCW_Hard_C.ska' descchecksum = Bail_Spin_CCW_Hard_C
        <LoadFunction> <...> name = 'anims\THPS6_skater_bails\Bail_Spin_CW_Hard_B.ska' descchecksum = Bail_Spin_CW_Hard_B
        <LoadFunction> <...> name = 'anims\THPS6_skater_bails\Bail_Spin_CW_Hard_A.ska' descchecksum = Bail_Spin_CW_Hard_A
        <LoadFunction> <...> name = 'anims\THPS6_skater_bails\Bail_Spin_FWD_Regular.ska' descchecksum = Bail_Spin_FWD_Regular
        <LoadFunction> <...> name = 'anims\THPS6_skater_bails\Bail_Spin_FWD_Hard.ska' descchecksum = Bail_Spin_FWD_Hard
        <LoadFunction> <...> name = 'anims\THPS6_skater_bails\Bail_Spin_FWD_Fast.ska' descchecksum = Bail_Spin_FWD_Fast
        <LoadFunction> <...> name = 'anims\THPS6_skater_bails\Bail_Spin_BCK_Regular.ska' descchecksum = Bail_Spin_BCK_Regular
        <LoadFunction> <...> name = 'anims\THPS6_skater_bails\Bail_Spin_BCK_Fast.ska' descchecksum = Bail_Spin_BCK_Fast
        <LoadFunction> <...> name = 'anims\THPS6_skater_bails\Bail_Spin_BCK_Hard.ska' descchecksum = Bail_Spin_BCK_Hard
    endif
    SetReferenceChecksum 0
endscript


script animload_THPS6_human_unloadable_4 LoadFunction = LoadAnim
    SetReferenceChecksum THPS6_human
    if <LoadFunction> <...> name = 'anims\THPS6_skater_tantrums\Tantrum_DiscusStart.ska' descchecksum = Tantrum_DiscusStart
        <LoadFunction> <...> name = 'anims\THPS6_skater_tantrums\Tantrum_DiscusFinish.ska' descchecksum = Tantrum_DiscusFinish
        <LoadFunction> <...> name = 'anims\THPS6_skater_tantrums\Tantrum_KickBoard.ska' descchecksum = Tantrum_KickBoard
        <LoadFunction> <...> name = 'anims\THPS6_skater_tantrums\Tantrum_HeadButt.ska' descchecksum = Tantrum_HeadButt
        <LoadFunction> <...> name = 'anims\THPS6_skater_tantrums\Tantrum_SlingShot.ska' descchecksum = Tantrum_SlingShot
        <LoadFunction> <...> name = 'anims\THPS6_skater_tantrums\Tantrum_PileDriver.ska' descchecksum = Tantrum_PileDriver
        <LoadFunction> <...> name = 'anims\THPS6_skater_tantrums\Tantrum_BoardFocus.ska' descchecksum = Tantrum_BoardFocus
        <LoadFunction> <...> name = 'anims\thps6_skater_OnFoot\WalkingBail.ska' descchecksum = WalkingBail
        <LoadFunction> <...> name = 'anims\thps6_skater_OnFoot\WalkingBailGetUp.ska' descchecksum = WalkingBailGetUp
        <LoadFunction> <...> name = 'anims\THPS6_Skater_Bails\Bail_Wall_FWD_Regular.ska' descchecksum = Bail_Wall_FWD_Regular
        <LoadFunction> <...> name = 'anims\THPS6_Skater_Bails\Bail_Wall_FWD_Low.ska' descchecksum = Bail_Wall_FWD_Low
        <LoadFunction> <...> name = 'anims\THPS6_Skater_Bails\Bail_Wall_BCK_Regular.ska' descchecksum = Bail_Wall_BCK_Regular
        <LoadFunction> <...> name = 'anims\THPS6_Skater_Bails\Bail_Wall_BCK_Low.ska' descchecksum = Bail_Wall_BCK_Low
        <LoadFunction> <...> name = 'anims\THPS6_Skater_Bails\Bail_Wall_LT_Low.ska' descchecksum = Bail_Wall_LT_Low
        <LoadFunction> <...> name = 'anims\THPS6_Skater_Bails\Bail_Wall_RT_Low.ska' descchecksum = Bail_Wall_RT_Low
        <LoadFunction> <...> name = 'anims\THPS6_skater_misc\GrabBar_accel_Fwd.ska' descchecksum = GrabBar_accel_Fwd
        <LoadFunction> <...> name = 'anims\THPS6_skater_misc\GrabBar_idle_Fwd.ska' descchecksum = GrabBar_idle_Fwd
        <LoadFunction> <...> name = 'anims\THPS6_skater_misc\GrabBar_Release_Fwd.ska' descchecksum = GrabBar_Release_Fwd
        <LoadFunction> <...> name = 'anims\THPS6_skater_misc\GrabBar_accel_Up.ska' descchecksum = GrabBar_accel_Up
        <LoadFunction> <...> name = 'anims\THPS6_skater_misc\GrabBar_Idle_up.ska' descchecksum = GrabBar_idle_Up
        <LoadFunction> <...> name = 'anims\THPS6_skater_misc\GrabBar_Release_Up.ska' descchecksum = GrabBar_Release_Up
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\AirIdle.ska' descchecksum = AirIdle
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\AirTurnLeft.ska' descchecksum = AirTurnLeft
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\AirTurnRight.ska' descchecksum = AirTurnRight
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\Beanplant.ska' descchecksum = Beanplant
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\Boneless.ska' descchecksum = Boneless
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\Brake.ska' descchecksum = Brake
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\BrakeDefeat.ska' descchecksum = BrakeDefeat
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\BrakeIdle.ska' descchecksum = BrakeIdle
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\BSPowerslide.ska' descchecksum = BSPowerslide
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\CessSlide180_BS.ska' descchecksum = CessSlide180_BS
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\CessSlide180_FS.ska' descchecksum = CessSlide180_FS
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\CessSlide180_FS2.ska' descchecksum = CessSlide180_FS2
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\Crouch.ska' descchecksum = crouch
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\Crouch2InAir.ska' descchecksum = Crouch2InAir
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\CrouchBumpDown.ska' descchecksum = CrouchBumpDown
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\CrouchBumpUp.ska' descchecksum = CrouchBumpUp
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\CrouchCessSlide180_BS.ska' descchecksum = CrouchCessSlide180_BS
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\CrouchCessSlide180_FS.ska' descchecksum = CrouchCessSlide180_FS
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\CrouchedLand.ska' descchecksum = CrouchedLand
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\CrouchIdle.ska' descchecksum = CrouchIdle
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\CrouchIdle2.ska' descchecksum = CrouchIdle2
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\CrouchIdle4.ska' descchecksum = CrouchIdle4
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\CrouchIdleAdjustFeet.ska' descchecksum = CrouchIdleAdjustFeet
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\CrouchIdleFromIdle.ska' descchecksum = CrouchIdleFromIdle
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\CrouchIdleToIdle.ska' descchecksum = CrouchIdleToIdle
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\CrouchLookDown.ska' descchecksum = CrouchLookDown
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\CrouchLookLeft.ska' descchecksum = CrouchLookLeft
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\CrouchLookRight.ska' descchecksum = CrouchLookRight
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\CrouchPush1.ska' descchecksum = CrouchPush1
    endif
    SetReferenceChecksum 0
endscript


script animload_THPS6_human_unloadable_5 LoadFunction = LoadAnim
    SetReferenceChecksum THPS6_human
    if <LoadFunction> <...> name = 'anims\THPS6_skater_basics\CrouchShiftFoot.ska' descchecksum = CrouchShiftFoot
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\CrouchToNollie.ska' descchecksum = CrouchToNollie
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\CrouchTurnLeft.ska' descchecksum = CrouchTurnLeft
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\CrouchTurnLeft2.ska' descchecksum = CrouchTurnLeft2
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\CrouchTurnLeftIdle.ska' descchecksum = CrouchTurnLeftIdle
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\CrouchTurnLeftIdle2.ska' descchecksum = CrouchTurnLeftIdle2
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\CrouchTurnRight.ska' descchecksum = CrouchTurnRight
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\CrouchTurnRight2.ska' descchecksum = CrouchTurnRight2
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\CrouchTurnRightIdle.ska' descchecksum = CrouchTurnRightIdle
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\CrouchTurnRightIdle2.ska' descchecksum = CrouchTurnRightIdle2
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\DropIn.ska' descchecksum = DropIn
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\Fastplant.ska' descchecksum = Fastplant
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\FlailLeft.ska' descchecksum = FlailLeft
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\FlailLeft2.ska' descchecksum = FlailLeft2
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\FlailLeftCrouched2.ska' descchecksum = FlailLeftCrouched2
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\FlailLeftCrouched3.ska' descchecksum = FlailLeftCrouched3
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\FlailLeftCrouched_Small.ska' descchecksum = FlailLeftCrouched_Small
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\FlailRight.ska' descchecksum = FlailRight
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\FlailRight2.ska' descchecksum = FlailRight2
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\FlailRightCrouched2.ska' descchecksum = FlailRightCrouched2
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\FlailRightCrouched3.ska' descchecksum = FlailRightCrouched3
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\FlailRightCrouched_Small.ska' descchecksum = FlailRightCrouched_Small
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\FSPowerslide.ska' descchecksum = FSPowerslide
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\Idle2InAir.ska' descchecksum = Idle2InAir
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\Land.ska' descchecksum = land
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\Land2.ska' descchecksum = Land2
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\Land3.ska' descchecksum = Land3
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\Manual.ska' descchecksum = Manual
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\Manual_Range.ska' descchecksum = Manual_Range
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\Manual_Range2.ska' descchecksum = Manual_Range2
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\Manual_Range3.ska' descchecksum = Manual_Range3
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\ManualFromAir.ska' descchecksum = ManualFromAir
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\MongoBrakeIdle.ska' descchecksum = MongoBrakeIdle
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\MongoPush.ska' descchecksum = MongoPush
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\MongoPushCycle.ska' descchecksum = MongoPushCycle
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\MullenStart.ska' descchecksum = MullenStart
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\NewBrake.ska' descchecksum = NewBrake
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\NewBrake_Mongo.ska' descchecksum = NewBrake_Mongo
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\NewBrakeIdle.ska' descchecksum = NewBrakeIdle
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\NewBrakeIdle2.ska' descchecksum = NewBrakeIdle2
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\NewBrakeIdle3.ska' descchecksum = NewBrakeIdle3
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\NewBrakeIdle4.ska' descchecksum = NewBrakeIdle4
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\NewBrakeIdle6.ska' descchecksum = NewBrakeIdle6
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\NewBrakeIdle7.ska' descchecksum = NewBrakeIdle7
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\NewBrakeIdle8.ska' descchecksum = NewBrakeIdle8
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\NewBrakeIdleToIdle.ska' descchecksum = NewBrakeIdleToIdle
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\NewBrakeTurnLeft.ska' descchecksum = NewBrakeTurnLeft
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\NewBrakeTurnRight.ska' descchecksum = NewBrakeTurnRight
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\NoComply.ska' descchecksum = NoComply
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\Nollie.ska' descchecksum = Nollie
    endif
    SetReferenceChecksum 0
endscript


script animload_THPS6_human_unloadable_6 LoadFunction = LoadAnim
    SetReferenceChecksum THPS6_human
    if <LoadFunction> <...> name = 'anims\THPS6_skater_basics\NollieCrouchIdle.ska' descchecksum = NollieCrouchIdle
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\NollieCrouchTurnLeft.ska' descchecksum = NollieCrouchTurnLeft
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\NollieCrouchTurnRight.ska' descchecksum = NollieCrouchTurnRight
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\NollieSkatingIdle.ska' descchecksum = NollieSkatingIdle
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\NollieSkatingTurnLeft.ska' descchecksum = NollieSkatingTurnLeft
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\NollieSkatingTurnRight.ska' descchecksum = NollieSkatingTurnRight
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\NoseManual.ska' descchecksum = NoseManual
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\NoseManual_range.ska' descchecksum = NoseManual_range
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\NoseManual_Range2.ska' descchecksum = NoseManual_Range2
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\NoseManualFromAir.ska' descchecksum = NoseManualFromAir
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\Ollie.ska' descchecksum = ollie
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\Push.ska' descchecksum = push
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\PushCycle.ska' descchecksum = PushCycle
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\PushCycleArms1.ska' descchecksum = PushCycleArms1
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\PushCycleArms2.ska' descchecksum = PushCycleArms2
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\PushCycleArms3.ska' descchecksum = PushCycleArms3
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\PushCycleArms4.ska' descchecksum = PushCycleArms4
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\PushCycleArms5.ska' descchecksum = PushCycleArms5
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\PushIdle.ska' descchecksum = PushIdle
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\PutDownManual.ska' descchecksum = PutDownManual
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\PutDownNoseManual.ska' descchecksum = PutDownNoseManual
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\RevertBS.ska' descchecksum = RevertBS
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\RevertFS.ska' descchecksum = RevertFS
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\SkatingToNollie.ska' descchecksum = SkatingToNollie
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\SketchyCrouchLand.ska' descchecksum = SketchyCrouchLand
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\SketchyLand.ska' descchecksum = SketchyLand
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\SketchyLand1.ska' descchecksum = SketchyLand1
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\SkitchInit.ska' descchecksum = SkitchInit
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\SkitchRange.ska' descchecksum = SkitchRange
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\SlapAir.ska' descchecksum = SlapAir
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\SlapRight.ska' descchecksum = SlapRight
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\SlowDownBrake.ska' descchecksum = SlowDownBrake
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\SlowDownBrake_Mongo.ska' descchecksum = SlowDownBrake_Mongo
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\SpineTransfer.ska' descchecksum = SpineTransfer
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\StandingLandTurn.ska' descchecksum = StandingLandTurn
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\StartSkating1.ska' descchecksum = StartSkating1
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\StretchLegsInit.ska' descchecksum = StretchLegsInit
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\TurnLeft.ska' descchecksum = TurnLeft
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\TurnLeftIdle.ska' descchecksum = TurnLeftIdle
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\TurnRight.ska' descchecksum = TurnRight
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\TurnRightIdle.ska' descchecksum = TurnRightIdle
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\WallRideBackLoop.ska' descchecksum = WallRideBackLoop
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\WallRideBackTrans.ska' descchecksum = WallRideBackTrans
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\WallRideFrontLoop.ska' descchecksum = WallRideFrontLoop
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\WallRideFrontTrans.ska' descchecksum = WallRideFrontTrans
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\ToTail_In.ska' descchecksum = ToTail_In
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\ToTail_Out.ska' descchecksum = ToTail_Out
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\ToTail_Idle.ska' descchecksum = ToTail_Idle
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\WallPlant_Crouched.ska' descchecksum = WallPlant_Crouched
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\WallPlant_Standing.ska' descchecksum = WallPlant_Standing
    endif
    SetReferenceChecksum 0
endscript


script animload_THPS6_human_unloadable_7 LoadFunction = LoadAnim
    SetReferenceChecksum THPS6_human
    if <LoadFunction> <...> name = 'anims\THPS6_skater_basics\WallPlant_Manual.ska' descchecksum = WallPlant_Manual
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\WallPlant_NoseManual.ska' descchecksum = WallPlant_NoseManual
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\CrouchToPressure.ska' descchecksum = CrouchToPressure
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\SkateToPressure.ska' descchecksum = SkateToPressure
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\AirIdleCAT.ska' descchecksum = AirIdleCAT
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\BrakeIdle_Start.ska' descchecksum = BrakeIdle_Start
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\BrakeIdle_Start_Mongo.ska' descchecksum = BrakeIdle_Start_Mongo
        <LoadFunction> <...> name = 'anims\Cloth\Cloth_Land_Partial.ska' descchecksum = Cloth_Land_Partial
        <LoadFunction> <...> name = 'anims\Cloth\Cloth_AIrFlow_Partial.ska' descchecksum = Cloth_AIrFlow_Partial
        <LoadFunction> <...> name = 'anims\PED_CrappySkate\CrouchIdle_Crappy.ska' descchecksum = CrouchIdle_Crappy
        <LoadFunction> <...> name = 'anims\PED_CrappySkate\CrouchTurnLeft_Crappy.ska' descchecksum = CrouchTurnLeft_Crappy
        <LoadFunction> <...> name = 'anims\PED_CrappySkate\CrouchTurnLeftIdle_Crappy.ska' descchecksum = CrouchTurnLeftIdle_Crappy
        <LoadFunction> <...> name = 'anims\PED_CrappySkate\CrouchTurnRight_Crappy.ska' descchecksum = CrouchTurnRight_Crappy
        <LoadFunction> <...> name = 'anims\PED_CrappySkate\CrouchTurnRightIdle_Crappy.ska' descchecksum = CrouchTurnRightIdle_Crappy
        <LoadFunction> <...> name = 'anims\PED_CrappySkate\TurnLeft_Crappy.ska' descchecksum = TurnLeft_Crappy
        <LoadFunction> <...> name = 'anims\PED_CrappySkate\TurnLeftIdle_Crappy.ska' descchecksum = TurnLeftIdle_Crappy
        <LoadFunction> <...> name = 'anims\PED_CrappySkate\TurnRight_Crappy.ska' descchecksum = TurnRight_Crappy
        <LoadFunction> <...> name = 'anims\PED_CrappySkate\TurnRightIdle_Crappy.ska' descchecksum = TurnRightIdle_Crappy
        <LoadFunction> <...> name = 'anims\PED_CrappySkate\CrouchBumpDown_Crappy.ska' descchecksum = CrouchBumpDown_Crappy
        <LoadFunction> <...> name = 'anims\PED_CrappySkate\CrouchBumpUp_Crappy.ska' descchecksum = CrouchBumpUp_Crappy
        <LoadFunction> <...> name = 'anims\THPS6_skater_flatland\_360FlipNoseManual.ska' descchecksum = _360FlipNoseManual
        <LoadFunction> <...> name = 'anims\THPS6_skater_flatland\AntiCasper_Init.ska' descchecksum = AntiCasper_Init
        <LoadFunction> <...> name = 'anims\THPS6_skater_flatland\AntiCasper_Out.ska' descchecksum = AntiCasper_Out
        <LoadFunction> <...> name = 'anims\THPS6_skater_flatland\AntiCasper_Range.ska' descchecksum = AntiCasper_Range
        <LoadFunction> <...> name = 'anims\THPS6_skater_flatland\AntiCasperFlip.ska' descchecksum = AntiCasperFlip
        <LoadFunction> <...> name = 'anims\THPS6_skater_flatland\Casper_Init.ska' descchecksum = Casper_Init
        <LoadFunction> <...> name = 'anims\THPS6_skater_flatland\Casper_Out.ska' descchecksum = Casper_Out
        <LoadFunction> <...> name = 'anims\THPS6_skater_flatland\Casper_Range.ska' descchecksum = Casper_Range
        <LoadFunction> <...> name = 'anims\THPS6_skater_flatland\CasperFlip.ska' descchecksum = CasperFlip
        <LoadFunction> <...> name = 'anims\THPS6_skater_flatland\GTurn.ska' descchecksum = GTurn
        <LoadFunction> <...> name = 'anims\THPS6_skater_flatland\GTurn2.ska' descchecksum = GTurn2
        <LoadFunction> <...> name = 'anims\THPS6_skater_flatland\HalfCabImpossible.ska' descchecksum = HalfCabImpossible
        <LoadFunction> <...> name = 'anims\THPS6_skater_flatland\HandstandHandFlip_Init.ska' descchecksum = HandstandHandFlip_Init
        <LoadFunction> <...> name = 'anims\THPS6_skater_flatland\HandstandHandFlip_Out.ska' descchecksum = HandstandHandFlip_Out
        <LoadFunction> <...> name = 'anims\THPS6_skater_flatland\HandstandHandFlip_Range.ska' descchecksum = HandstandHandFlip_Range
        <LoadFunction> <...> name = 'anims\THPS6_skater_flatland\HStandFliptoHstand.ska' descchecksum = HStandFliptoHstand
        <LoadFunction> <...> name = 'anims\THPS6_skater_flatland\OneFootManual_Init.ska' descchecksum = OneFootManual_Init
        <LoadFunction> <...> name = 'anims\THPS6_skater_flatland\OneFootManual_Range.ska' descchecksum = OneFootManual_Range
        <LoadFunction> <...> name = 'anims\THPS6_skater_flatland\OneFootNoseManual_Init.ska' descchecksum = OneFootNoseManual_Init
        <LoadFunction> <...> name = 'anims\THPS6_skater_flatland\OneFootNoseManual_Range.ska' descchecksum = OneFootNoseManual_Range
        <LoadFunction> <...> name = 'anims\THPS6_skater_flatland\Pogo_Bounce.ska' descchecksum = Pogo_Bounce
        <LoadFunction> <...> name = 'anims\THPS6_skater_flatland\Pogo_Init.ska' descchecksum = Pogo_Init
        <LoadFunction> <...> name = 'anims\THPS6_skater_flatland\Pogo_Kickfoot.ska' descchecksum = Pogo_Kickfoot
        <LoadFunction> <...> name = 'anims\THPS6_skater_flatland\Pogo_Out.ska' descchecksum = Pogo_Out
        <LoadFunction> <...> name = 'anims\THPS6_skater_flatland\RailFlip.ska' descchecksum = RailFlip
        <LoadFunction> <...> name = 'anims\THPS6_skater_flatland\TruckRun.ska' descchecksum = TruckRun
        <LoadFunction> <...> name = 'anims\THPS6_skater_flatland\TruckRun_Init.ska' descchecksum = TruckRun_Init
        <LoadFunction> <...> name = 'anims\THPS6_skater_flatland\TruckRun_Out.ska' descchecksum = TruckRun_Out
        <LoadFunction> <...> name = 'anims\THPS6_skater_flatland\TruckRunFlip.ska' descchecksum = TruckRunFlip
        <LoadFunction> <...> name = 'anims\THPS6_skater_flatland\Truckstand_Flip.ska' descchecksum = Truckstand_Flip
    endif
    SetReferenceChecksum 0
endscript


script animload_THPS6_human_unloadable_8 LoadFunction = LoadAnim
    SetReferenceChecksum THPS6_human
    if <LoadFunction> <...> name = 'anims\THPS6_skater_flatland\Truckstand_Init.ska' descchecksum = Truckstand_Init
        <LoadFunction> <...> name = 'anims\THPS6_skater_flatland\Truckstand_Out.ska' descchecksum = Truckstand_Out
        <LoadFunction> <...> name = 'anims\THPS6_skater_flatland\Truckstand_Range.ska' descchecksum = Truckstand_Range
        <LoadFunction> <...> name = 'anims\THPS6_skater_flipgrab\KickFlipBlendFS.ska' descchecksum = KickFlipBlendFS
        <LoadFunction> <...> name = 'anims\THPS6_skater_flipgrab\KickFlipBlendBS.ska' descchecksum = KickFlipBlendBS
        <LoadFunction> <...> name = 'anims\THPS6_skater_flipgrab\HeelFlipVarialLien.ska' descchecksum = HeelFlipVarialLien
        <LoadFunction> <...> name = 'anims\THPS6_skater_flipgrab\_180Varial.ska' descchecksum = _180Varial
        <LoadFunction> <...> name = 'anims\THPS6_skater_flipgrab\_360Varial.ska' descchecksum = _360Varial
        <LoadFunction> <...> name = 'anims\THPS6_skater_flipgrab\FingerFlipVert.ska' descchecksum = FingerFlipVert
        <LoadFunction> <...> name = 'anims\THPS6_skater_flipgrab\SalFlip.ska' descchecksum = SalFlip
        <LoadFunction> <...> name = 'anims\THPS6_skater_flipgrab\BenihanaFingerFlip.ska' descchecksum = BenihanaFingerFlip
        <LoadFunction> <...> name = 'anims\THPS6_skater_flipgrab\DoubleFingerFlipVert.ska' descchecksum = DoubleFingerFlipVert
        <LoadFunction> <...> name = 'anims\THPS6_skater_flipgrab\DoubleSalFlip.ska' descchecksum = DoubleSalFlip
        <LoadFunction> <...> name = 'anims\THPS6_skater_fliptricks\_360Flip.ska' descchecksum = _360Flip
        <LoadFunction> <...> name = 'anims\THPS6_skater_fliptricks\_360HardFlip.ska' descchecksum = _360HardFlip
        <LoadFunction> <...> name = 'anims\THPS6_skater_fliptricks\_360InwardHeelFlip.ska' descchecksum = _360InwardHeelflip
        <LoadFunction> <...> name = 'anims\THPS6_skater_fliptricks\_360ShoveIt.ska' descchecksum = _360ShoveIt
        <LoadFunction> <...> name = 'anims\THPS6_skater_fliptricks\_540ShoveIt.ska' descchecksum = _540ShoveIt
        <LoadFunction> <...> name = 'anims\THPS6_skater_fliptricks\BigSpinFlip.ska' descchecksum = BigSpinFlip
        <LoadFunction> <...> name = 'anims\THPS6_skater_fliptricks\BSBigSpin.ska' descchecksum = BSBigSpin
        <LoadFunction> <...> name = 'anims\THPS6_skater_fliptricks\BSFlip.ska' descchecksum = BSFlip
        <LoadFunction> <...> name = 'anims\THPS6_skater_fliptricks\DoubleFrontFootImposs.ska' descchecksum = DoubleFrontFootImposs
        <LoadFunction> <...> name = 'anims\THPS6_skater_fliptricks\DoubleHeelFlip.ska' descchecksum = DoubleHeelFlip
        <LoadFunction> <...> name = 'anims\THPS6_skater_fliptricks\DoubleImpossible.ska' descchecksum = DoubleImpossible
        <LoadFunction> <...> name = 'anims\THPS6_skater_fliptricks\DoubleKickFlip.ska' descchecksum = DoubleKickFlip
        <LoadFunction> <...> name = 'anims\THPS6_skater_fliptricks\DoubleNollieHeelflip.ska' descchecksum = DoubleNollieHeelflip
        <LoadFunction> <...> name = 'anims\THPS6_skater_fliptricks\DoubleNollieKickflip.ska' descchecksum = DoubleNollieKickflip
        <LoadFunction> <...> name = 'anims\THPS6_skater_fliptricks\FrontFootImposs.ska' descchecksum = FrontFootImposs
        <LoadFunction> <...> name = 'anims\THPS6_skater_fliptricks\FS360ShoveIt.ska' descchecksum = FS360ShoveIt
        <LoadFunction> <...> name = 'anims\THPS6_skater_fliptricks\FS540ShoveIt.ska' descchecksum = FS540ShoveIt
        <LoadFunction> <...> name = 'anims\THPS6_skater_fliptricks\FSBigSpin.ska' descchecksum = FSBigSpin
        <LoadFunction> <...> name = 'anims\THPS6_skater_fliptricks\FSFlip.ska' descchecksum = FSFlip
        <LoadFunction> <...> name = 'anims\THPS6_skater_fliptricks\HardFlip.ska' descchecksum = HardFlip
        <LoadFunction> <...> name = 'anims\THPS6_skater_fliptricks\HeelFlip.ska' descchecksum = HeelFlip
        <LoadFunction> <...> name = 'anims\THPS6_skater_fliptricks\Impossible.ska' descchecksum = Impossible
        <LoadFunction> <...> name = 'anims\THPS6_skater_fliptricks\InwardHeelFlip.ska' descchecksum = InwardHeelflip
        <LoadFunction> <...> name = 'anims\THPS6_skater_fliptricks\KickFlip.ska' descchecksum = KickFlip
        <LoadFunction> <...> name = 'anims\THPS6_skater_fliptricks\Nollie360Flip.ska' descchecksum = Nollie360Flip
        <LoadFunction> <...> name = 'anims\THPS6_skater_fliptricks\Nollie360ShoveIt.ska' descchecksum = Nollie360ShoveIt
        <LoadFunction> <...> name = 'anims\THPS6_skater_fliptricks\NollieBS360ShoveIt.ska' descchecksum = NollieBS360ShoveIt
        <LoadFunction> <...> name = 'anims\THPS6_skater_fliptricks\NollieBSShoveIt.ska' descchecksum = NollieBSShoveIt
        <LoadFunction> <...> name = 'anims\THPS6_skater_fliptricks\NollieFSShoveIt.ska' descchecksum = NollieFSShoveIt
        <LoadFunction> <...> name = 'anims\THPS6_skater_fliptricks\NollieHardFlip.ska' descchecksum = NollieHardFlip
        <LoadFunction> <...> name = 'anims\THPS6_skater_fliptricks\NollieHeelFlip.ska' descchecksum = NollieHeelflip
        <LoadFunction> <...> name = 'anims\THPS6_skater_fliptricks\NollieImpossible.ska' descchecksum = NollieImpossible
        <LoadFunction> <...> name = 'anims\THPS6_skater_fliptricks\NollieInwardFlip.ska' descchecksum = NollieInwardFlip
        <LoadFunction> <...> name = 'anims\THPS6_skater_fliptricks\NollieKickFlip.ska' descchecksum = NollieKickflip
        <LoadFunction> <...> name = 'anims\THPS6_skater_fliptricks\NollieVarialHeelflip.ska' descchecksum = NollieVarialHeelflip
        <LoadFunction> <...> name = 'anims\THPS6_skater_fliptricks\NollieVarialKickFlip.ska' descchecksum = NollieVarialKickFlip
        <LoadFunction> <...> name = 'anims\THPS6_skater_fliptricks\OllieAirWalk.ska' descchecksum = OllieAirWalk
    endif
    SetReferenceChecksum 0
endscript


script animload_THPS6_human_unloadable_9 LoadFunction = LoadAnim
    SetReferenceChecksum THPS6_human
    if <LoadFunction> <...> name = 'anims\THPS6_skater_fliptricks\OllieAirwalkShoveIt.ska' descchecksum = OllieAirwalkShoveIt
        <LoadFunction> <...> name = 'anims\THPS6_skater_fliptricks\OllieNorth.ska' descchecksum = OllieNorth
        <LoadFunction> <...> name = 'anims\THPS6_skater_fliptricks\OllieNorthBackFootFlip.ska' descchecksum = OllieNorthBackFootFlip
        <LoadFunction> <...> name = 'anims\THPS6_skater_fliptricks\PopShoveIt.ska' descchecksum = PopShoveIt
        <LoadFunction> <...> name = 'anims\THPS6_skater_fliptricks\PopShoveitBS.ska' descchecksum = PopShoveitBS
        <LoadFunction> <...> name = 'anims\THPS6_skater_fliptricks\QuadrupleHeelFlip.ska' descchecksum = QuadrupleHeelFlip
        <LoadFunction> <...> name = 'anims\THPS6_skater_fliptricks\TripleHeelFlip.ska' descchecksum = TripleHeelFlip
        <LoadFunction> <...> name = 'anims\THPS6_skater_fliptricks\TripleImpossible.ska' descchecksum = TripleImpossible
        <LoadFunction> <...> name = 'anims\THPS6_skater_fliptricks\TripleKickFlip.ska' descchecksum = TripleKickFlip
        <LoadFunction> <...> name = 'anims\THPS6_skater_fliptricks\VarialHeelFlip.ska' descchecksum = VarialHeelFlip
        <LoadFunction> <...> name = 'anims\THPS6_skater_fliptricks\VarialKickFlip.ska' descchecksum = VarialKickFlip
        <LoadFunction> <...> name = 'anims\THPS6_skater_fliptricks\KickFlipOldSkool.ska' descchecksum = KickFlipOldSkool
        <LoadFunction> <...> name = 'anims\THPS6_skater_freestyle\Spacewalk.ska' descchecksum = Spacewalk
        <LoadFunction> <...> name = 'anims\THPS6_skater_freestyle\SkitchMoveRight.ska' descchecksum = SkitchMoveRight
        <LoadFunction> <...> name = 'anims\THPS6_skater_freestyle\SkitchMoveLeft.ska' descchecksum = SkitchMoveLeft
        <LoadFunction> <...> name = 'anims\THPS6_skater_grabtricks\AirWalk.ska' descchecksum = AirWalk
        <LoadFunction> <...> name = 'anims\THPS6_skater_grabtricks\AirWalk_Idle2.ska' descchecksum = AirWalk_Idle2
        <LoadFunction> <...> name = 'anims\THPS6_skater_grabtricks\BSShifty.ska' descchecksum = BSShifty
        <LoadFunction> <...> name = 'anims\THPS6_skater_grabtricks\BSShifty_Idle.ska' descchecksum = BSShifty_Idle
        <LoadFunction> <...> name = 'anims\THPS6_skater_grabtricks\Benihana.ska' descchecksum = Benihana
        <LoadFunction> <...> name = 'anims\THPS6_skater_grabtricks\Benihana_Idle.ska' descchecksum = Benihana_Idle
        <LoadFunction> <...> name = 'anims\THPS6_skater_grabtricks\Benihana_Out.ska' descchecksum = Benihana_Out
        <LoadFunction> <...> name = 'anims\THPS6_skater_grabtricks\BetweenTheLegs_Idle.ska' descchecksum = BetweenTheLegs_Idle
        <LoadFunction> <...> name = 'anims\THPS6_skater_grabtricks\BetweenTheLegs_In.ska' descchecksum = BetweenTheLegs_In
        <LoadFunction> <...> name = 'anims\THPS6_skater_grabtricks\BetweenTheLegs_Out.ska' descchecksum = BetweenTheLegs_Out
        <LoadFunction> <...> name = 'anims\THPS6_skater_grabtricks\CannonBall.ska' descchecksum = CannonBall
        <LoadFunction> <...> name = 'anims\THPS6_skater_grabtricks\CannonBall_Idle.ska' descchecksum = CannonBall_Idle
        <LoadFunction> <...> name = 'anims\THPS6_skater_grabtricks\CannonballFingerFlip.ska' descchecksum = CannonballFingerFlip
        <LoadFunction> <...> name = 'anims\THPS6_skater_grabtricks\ChristAir_Idle.ska' descchecksum = ChristAir_Idle
        <LoadFunction> <...> name = 'anims\THPS6_skater_grabtricks\ChristAir_Init.ska' descchecksum = ChristAir_Init
        <LoadFunction> <...> name = 'anims\THPS6_skater_grabtricks\ChristAir_Out.ska' descchecksum = ChristAir_Out
        <LoadFunction> <...> name = 'anims\THPS6_skater_grabtricks\Crail.ska' descchecksum = Crail
        <LoadFunction> <...> name = 'anims\THPS6_skater_grabtricks\Crail_Idle.ska' descchecksum = Crail_Idle
        <LoadFunction> <...> name = 'anims\THPS6_skater_grabtricks\CrookedCop.ska' descchecksum = CrookedCop
        <LoadFunction> <...> name = 'anims\THPS6_skater_grabtricks\CrookedCop_Idle.ska' descchecksum = CrookedCop_Idle
        <LoadFunction> <...> name = 'anims\THPS6_skater_grabtricks\CrossBone.ska' descchecksum = CrossBone
        <LoadFunction> <...> name = 'anims\THPS6_skater_grabtricks\CrossBone_Idle.ska' descchecksum = CrossBone_Idle
        <LoadFunction> <...> name = 'anims\THPS6_skater_grabtricks\Indy.ska' descchecksum = Indy
        <LoadFunction> <...> name = 'anims\THPS6_skater_grabtricks\IndyDelMar.ska' descchecksum = IndyDelMar
        <LoadFunction> <...> name = 'anims\THPS6_skater_grabtricks\IndyDelMar_Idle.ska' descchecksum = IndyDelMar_Idle
        <LoadFunction> <...> name = 'anims\THPS6_skater_grabtricks\Indy_Idle.ska' descchecksum = Indy_Idle
        <LoadFunction> <...> name = 'anims\THPS6_skater_grabtricks\JapanAir.ska' descchecksum = JapanAir
        <LoadFunction> <...> name = 'anims\THPS6_skater_grabtricks\JapanAir_Idle.ska' descchecksum = JapanAir_Idle
        <LoadFunction> <...> name = 'anims\THPS6_skater_grabtricks\JudoGrab.ska' descchecksum = JudoGrab
        <LoadFunction> <...> name = 'anims\THPS6_skater_grabtricks\JudoGrab_Idle.ska' descchecksum = JudoGrab_Idle
        <LoadFunction> <...> name = 'anims\THPS6_skater_grabtricks\Madonna.ska' descchecksum = Madonna
        <LoadFunction> <...> name = 'anims\THPS6_skater_grabtricks\Madonna_Idle.ska' descchecksum = Madonna_Idle
        <LoadFunction> <...> name = 'anims\THPS6_skater_grabtricks\MelonGrab.ska' descchecksum = MelonGrab
        <LoadFunction> <...> name = 'anims\THPS6_skater_grabtricks\MelonGrab_Idle.ska' descchecksum = MelonGrab_Idle
        <LoadFunction> <...> name = 'anims\THPS6_skater_grabtricks\Method.ska' descchecksum = method
    endif
    SetReferenceChecksum 0
endscript


script animload_THPS6_human_unloadable_10 LoadFunction = LoadAnim
    SetReferenceChecksum THPS6_human
    if <LoadFunction> <...> name = 'anims\THPS6_skater_grabtricks\Method_Idle.ska' descchecksum = Method_Idle
        <LoadFunction> <...> name = 'anims\THPS6_skater_grabtricks\MuteGrab.ska' descchecksum = MuteGrab
        <LoadFunction> <...> name = 'anims\THPS6_skater_grabtricks\MuteGrab_Idle.ska' descchecksum = MuteGrab_Idle
        <LoadFunction> <...> name = 'anims\THPS6_skater_grabtricks\NoseGrab.ska' descchecksum = NoseGrab
        <LoadFunction> <...> name = 'anims\THPS6_skater_grabtricks\NoseGrab_Idle.ska' descchecksum = NoseGrab_Idle
        <LoadFunction> <...> name = 'anims\THPS6_skater_grabtricks\Nosebone.ska' descchecksum = Nosebone
        <LoadFunction> <...> name = 'anims\THPS6_skater_grabtricks\Nosebone_Idle.ska' descchecksum = Nosebone_Idle
        <LoadFunction> <...> name = 'anims\THPS6_skater_grabtricks\OneFootJapan.ska' descchecksum = OneFootJapan
        <LoadFunction> <...> name = 'anims\THPS6_skater_grabtricks\OneFootJapan_Idle.ska' descchecksum = OneFootJapan_Idle
        <LoadFunction> <...> name = 'anims\THPS6_skater_grabtricks\OneFootTailGrab.ska' descchecksum = OneFootTailGrab
        <LoadFunction> <...> name = 'anims\THPS6_skater_grabtricks\OneFootTailGrab_Idle.ska' descchecksum = OneFootTailGrab_Idle
        <LoadFunction> <...> name = 'anims\THPS6_skater_grabtricks\RocketAir.ska' descchecksum = RocketAir
        <LoadFunction> <...> name = 'anims\THPS6_skater_grabtricks\RocketAir_Idle.ska' descchecksum = RocketAir_Idle
        <LoadFunction> <...> name = 'anims\THPS6_skater_grabtricks\SackTap.ska' descchecksum = SackTap
        <LoadFunction> <...> name = 'anims\THPS6_skater_grabtricks\SaranWrap.ska' descchecksum = SaranWrap
        <LoadFunction> <...> name = 'anims\THPS6_skater_grabtricks\SaranWrap_Idle.ska' descchecksum = SaranWrap_Idle
        <LoadFunction> <...> name = 'anims\THPS6_skater_grabtricks\SaranWrap_Out.ska' descchecksum = SaranWrap_Out
        <LoadFunction> <...> name = 'anims\THPS6_skater_grabtricks\SeatBelt.ska' descchecksum = SeatBelt
        <LoadFunction> <...> name = 'anims\THPS6_skater_grabtricks\SeatBelt_Idle.ska' descchecksum = SeatBelt_Idle
        <LoadFunction> <...> name = 'anims\THPS6_skater_grabtricks\Shifty.ska' descchecksum = Shifty
        <LoadFunction> <...> name = 'anims\THPS6_skater_grabtricks\Shifty_Idle.ska' descchecksum = Shifty_Idle
        <LoadFunction> <...> name = 'anims\THPS6_skater_grabtricks\Stalefish.ska' descchecksum = Stalefish
        <LoadFunction> <...> name = 'anims\THPS6_skater_grabtricks\Stalefish_Idle.ska' descchecksum = Stalefish_Idle
        <LoadFunction> <...> name = 'anims\THPS6_skater_grabtricks\Stalefish_Layback.ska' descchecksum = Stalefish_Layback
        <LoadFunction> <...> name = 'anims\THPS6_skater_grabtricks\Stalefish_Layback_Idle.ska' descchecksum = Stalefish_Layback_Idle
        <LoadFunction> <...> name = 'anims\THPS6_skater_grabtricks\Stiffy.ska' descchecksum = Stiffy
        <LoadFunction> <...> name = 'anims\THPS6_skater_grabtricks\Stiffy_Idle.ska' descchecksum = Stiffy_Idle
        <LoadFunction> <...> name = 'anims\THPS6_skater_grabtricks\TailGrab.ska' descchecksum = TailGrab
        <LoadFunction> <...> name = 'anims\THPS6_skater_grabtricks\TailGrab_Idle.ska' descchecksum = TailGrab_Idle
        <LoadFunction> <...> name = 'anims\THPS6_skater_grabtricks\TuckKnee.ska' descchecksum = TuckKnee
        <LoadFunction> <...> name = 'anims\THPS6_skater_grabtricks\TuckKnee_Idle.ska' descchecksum = TuckKnee_Idle
        <LoadFunction> <...> name = 'anims\THPS6_skater_grind\BSBluntSlide_Range.ska' descchecksum = BSBluntSlide_Range
        <LoadFunction> <...> name = 'anims\THPS6_skater_grind\BSBoardSlide_Range.ska' descchecksum = BSBoardSlide_Range
        <LoadFunction> <...> name = 'anims\THPS6_skater_grind\BSBoardslide_Out.ska' descchecksum = BSBoardslide_Out
        <LoadFunction> <...> name = 'anims\THPS6_skater_grind\BSCrooked_Range.ska' descchecksum = BSCrooked_Range
        <LoadFunction> <...> name = 'anims\THPS6_skater_grind\BSFeeble_Range.ska' descchecksum = BSFeeble_Range
        <LoadFunction> <...> name = 'anims\THPS6_skater_grind\BSHurricaneGrind_Init.ska' descchecksum = BSHurricaneGrind_Init
        <LoadFunction> <...> name = 'anims\THPS6_skater_grind\BSHurricaneGrind_Range.ska' descchecksum = BSHurricaneGrind_Range
        <LoadFunction> <...> name = 'anims\THPS6_skater_grind\BSNoseBlunt_Range.ska' descchecksum = BSNoseBlunt_Range
        <LoadFunction> <...> name = 'anims\THPS6_skater_grind\BSNoseSlide_Out.ska' descchecksum = BSNoseSlide_Out
        <LoadFunction> <...> name = 'anims\THPS6_skater_grind\BSOverCrook_Range.ska' descchecksum = BSOverCrook_Range
        <LoadFunction> <...> name = 'anims\THPS6_skater_grind\BSSaladGrind_Init.ska' descchecksum = BSSaladGrind_Init
        <LoadFunction> <...> name = 'anims\THPS6_skater_grind\BSSaladGrind_Range.ska' descchecksum = BSSaladGrind_Range
        <LoadFunction> <...> name = 'anims\THPS6_skater_grind\BSSmith_Range.ska' descchecksum = BSSmith_Range
        <LoadFunction> <...> name = 'anims\THPS6_skater_grind\BSTailSlide_Out.ska' descchecksum = BSTailSlide_Out
        <LoadFunction> <...> name = 'anims\THPS6_skater_grind\FSBluntSlide_Range.ska' descchecksum = FSBluntSlide_Range
        <LoadFunction> <...> name = 'anims\THPS6_skater_grind\FSBoardSlide_Out.ska' descchecksum = FSBoardSlide_Out
        <LoadFunction> <...> name = 'anims\THPS6_skater_grind\FSBoardSlide_Range.ska' descchecksum = FSBoardSlide_Range
        <LoadFunction> <...> name = 'anims\THPS6_skater_grind\FSCrooked_Range.ska' descchecksum = FSCrooked_Range
        <LoadFunction> <...> name = 'anims\THPS6_skater_grind\FSFeeble_Range.ska' descchecksum = FSFeeble_Range
    endif
    SetReferenceChecksum 0
endscript


script animload_THPS6_human_unloadable_11 LoadFunction = LoadAnim
    SetReferenceChecksum THPS6_human
    if <LoadFunction> <...> name = 'anims\THPS6_skater_grind\FSHurricaneGrind_Init.ska' descchecksum = FSHurricaneGrind_Init
        <LoadFunction> <...> name = 'anims\THPS6_skater_grind\FSHurricaneGrind_Range.ska' descchecksum = FSHurricaneGrind_Range
        <LoadFunction> <...> name = 'anims\THPS6_skater_grind\FSNoseBlunt_Range.ska' descchecksum = FSNoseBlunt_Range
        <LoadFunction> <...> name = 'anims\THPS6_skater_grind\FSNoseSlide_Out.ska' descchecksum = FSNoseSlide_Out
        <LoadFunction> <...> name = 'anims\THPS6_skater_grind\FSNoseSlide_Range.ska' descchecksum = FSNoseSlide_Range
        <LoadFunction> <...> name = 'anims\THPS6_skater_grind\FSOverCrook_Range.ska' descchecksum = FSOverCrook_Range
        <LoadFunction> <...> name = 'anims\THPS6_skater_grind\FSSaladGrind_Init.ska' descchecksum = FSSaladGrind_Init
        <LoadFunction> <...> name = 'anims\THPS6_skater_grind\FSSaladGrind_Range.ska' descchecksum = FSSaladGrind_Range
        <LoadFunction> <...> name = 'anims\THPS6_skater_grind\FSSmith_Range.ska' descchecksum = FSSmith_Range
        <LoadFunction> <...> name = 'anims\THPS6_skater_grind\FSTailSlide_Out.ska' descchecksum = FSTailSlide_Out
        <LoadFunction> <...> name = 'anims\THPS6_skater_grind\FSTailSlide_Range.ska' descchecksum = FSTailSlide_Range
        <LoadFunction> <...> name = 'anims\THPS6_skater_grind\FiftyFifty2_Range.ska' descchecksum = FiftyFifty2_Range
        <LoadFunction> <...> name = 'anims\THPS6_skater_grind\FiftyFifty3_Range.ska' descchecksum = FiftyFifty3_Range
        <LoadFunction> <...> name = 'anims\THPS6_skater_grind\FiftyFifty_Range.ska' descchecksum = FiftyFifty_Range
        <LoadFunction> <...> name = 'anims\THPS6_skater_grind\Init_BSBluntSlide.ska' descchecksum = Init_BSBluntSlide
        <LoadFunction> <...> name = 'anims\THPS6_skater_grind\Init_BSBoardSlide.ska' descchecksum = Init_BSBoardSlide
        <LoadFunction> <...> name = 'anims\THPS6_skater_grind\Init_BSCrooked.ska' descchecksum = Init_BSCrooked
        <LoadFunction> <...> name = 'anims\THPS6_skater_grind\Init_BSFeeble.ska' descchecksum = Init_BSFeeble
        <LoadFunction> <...> name = 'anims\THPS6_skater_grind\Init_BSLipSlide.ska' descchecksum = Init_BSLipSlide
        <LoadFunction> <...> name = 'anims\THPS6_skater_grind\Init_BSNoseBlunt.ska' descchecksum = Init_BSNoseBlunt
        <LoadFunction> <...> name = 'anims\THPS6_skater_grind\Init_BSOverCrook.ska' descchecksum = Init_BSOverCrook
        <LoadFunction> <...> name = 'anims\THPS6_skater_grind\Init_BSSmith.ska' descchecksum = Init_BSSmith
        <LoadFunction> <...> name = 'anims\THPS6_skater_grind\Init_FSBluntSlide.ska' descchecksum = Init_FSBluntSlide
        <LoadFunction> <...> name = 'anims\THPS6_skater_grind\Init_FSBoardSlide.ska' descchecksum = Init_FSBoardSlide
        <LoadFunction> <...> name = 'anims\THPS6_skater_grind\Init_FSCrooked.ska' descchecksum = Init_FSCrooked
        <LoadFunction> <...> name = 'anims\THPS6_skater_grind\Init_FSFeeble.ska' descchecksum = Init_FSFeeble
        <LoadFunction> <...> name = 'anims\THPS6_skater_grind\Init_FSLipSlide.ska' descchecksum = Init_FSLipSlide
        <LoadFunction> <...> name = 'anims\THPS6_skater_grind\Init_FSNoseBlunt.ska' descchecksum = Init_FSNoseBlunt
        <LoadFunction> <...> name = 'anims\THPS6_skater_grind\Init_FSNoseSlide.ska' descchecksum = Init_FSNoseSlide
        <LoadFunction> <...> name = 'anims\THPS6_skater_grind\Init_FSOverCrook.ska' descchecksum = Init_FSOverCrook
        <LoadFunction> <...> name = 'anims\THPS6_skater_grind\Init_FSSmith.ska' descchecksum = Init_FSSmith
        <LoadFunction> <...> name = 'anims\THPS6_skater_grind\Init_FSTailSlide.ska' descchecksum = Init_FSTailSlide
        <LoadFunction> <...> name = 'anims\THPS6_skater_grind\Init_FiftyFifty.ska' descchecksum = Init_FiftyFifty
        <LoadFunction> <...> name = 'anims\THPS6_skater_grind\Init_NoseGrind.ska' descchecksum = Init_NoseGrind
        <LoadFunction> <...> name = 'anims\THPS6_skater_grind\Init_NoseSlide.ska' descchecksum = Init_NoseSlide
        <LoadFunction> <...> name = 'anims\THPS6_skater_grind\Init_TailGrind.ska' descchecksum = Init_TailGrind
        <LoadFunction> <...> name = 'anims\THPS6_skater_grind\Init_TailSlide.ska' descchecksum = Init_TailSlide
        <LoadFunction> <...> name = 'anims\THPS6_skater_grind\NoseGrind_Range.ska' descchecksum = NoseGrind_Range
        <LoadFunction> <...> name = 'anims\THPS6_skater_grind\NoseSlide_Range.ska' descchecksum = NoseSlide_Range
        <LoadFunction> <...> name = 'anims\THPS6_skater_grind\TailGrind_Range.ska' descchecksum = TailGrind_Range
        <LoadFunction> <...> name = 'anims\THPS6_skater_grind\TailSlide_Range.ska' descchecksum = TailSlide_Range
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\CrouchedLand4.ska' descchecksum = CrouchedLand4
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\CrouchedLand4_Small.ska' descchecksum = CrouchedLand4_Small
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\CrouchedLand_Tiny.ska' descchecksum = CrouchedLand_Tiny
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\StandingLand_Tiny.ska' descchecksum = StandingLand_Tiny
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\CrouchedLand5_Small.ska' descchecksum = CrouchedLand5_Small
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\CrouchedLand5.ska' descchecksum = CrouchedLand5
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\CrouchedLand6.ska' descchecksum = CrouchedLand6
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\CrouchedLandTurn4.ska' descchecksum = CrouchedLandTurn4
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\CrouchedLandTurn5.ska' descchecksum = CrouchedLandTurn5
    endif
    SetReferenceChecksum 0
endscript


script animload_THPS6_human_unloadable_12 LoadFunction = LoadAnim
    SetReferenceChecksum THPS6_human
    if <LoadFunction> <...> name = 'anims\THPS6_skater_basics\StandingLandTurn1.ska' descchecksum = StandingLandTurn1
        <LoadFunction> <...> name = 'anims\THPS6_skater_lip\MuteInvert_Init.ska' descchecksum = MuteInvert_Init
        <LoadFunction> <...> name = 'anims\THPS6_skater_lip\MuteInvert_Range.ska' descchecksum = MuteInvert_Range
        <LoadFunction> <...> name = 'anims\THPS6_skater_lip\MuteInvert_Out.ska' descchecksum = MuteInvert_Out
        <LoadFunction> <...> name = 'anims\THPS6_skater_lip\EggPlant_Init.ska' descchecksum = EggPlant_Init
        <LoadFunction> <...> name = 'anims\THPS6_skater_lip\EggPlant_Range.ska' descchecksum = EggPlant_Range
        <LoadFunction> <...> name = 'anims\THPS6_skater_lip\EggPlant_Out.ska' descchecksum = EggPlant_Out
        <LoadFunction> <...> name = 'anims\THPS6_skater_lip\GymnastPlant_Init.ska' descchecksum = GymnastPlant_Init
        <LoadFunction> <...> name = 'anims\THPS6_skater_lip\GymnastPlant_Range.ska' descchecksum = GymnastPlant_Range
        <LoadFunction> <...> name = 'anims\THPS6_skater_lip\GymnastPlant_Out.ska' descchecksum = GymnastPlant_Out
        <LoadFunction> <...> name = 'anims\THPS6_skater_lip\FakieRockAndRoll_Init.ska' descchecksum = FakieRockAndRoll_Init
        <LoadFunction> <...> name = 'anims\THPS6_skater_lip\FakieRockAndRoll_Range.ska' descchecksum = FakieRockAndRoll_Range
        <LoadFunction> <...> name = 'anims\THPS6_skater_lip\FakieRockAndRoll_Out.ska' descchecksum = FakieRockAndRoll_Out
        <LoadFunction> <...> name = 'anims\THPS6_skater_lip\NoseTailStall_Init.ska' descchecksum = NoseTailStall_Init
        <LoadFunction> <...> name = 'anims\THPS6_skater_lip\NoseTailStall_Range.ska' descchecksum = NoseTailStall_Range
        <LoadFunction> <...> name = 'anims\THPS6_skater_lip\NoseTailStall_Out.ska' descchecksum = NoseTailStall_Out
        <LoadFunction> <...> name = 'anims\THPS6_skater_lip\BluntToFakie_Init.ska' descchecksum = BluntToFakie_Init
        <LoadFunction> <...> name = 'anims\THPS6_skater_lip\BluntToFakie_Range.ska' descchecksum = BluntToFakie_Range
        <LoadFunction> <...> name = 'anims\THPS6_skater_lip\BluntToFakie_Out.ska' descchecksum = BluntToFakie_Out
        <LoadFunction> <...> name = 'anims\THPS6_skater_lip\Disaster_Init.ska' descchecksum = Disaster_Init
        <LoadFunction> <...> name = 'anims\THPS6_skater_lip\Disaster_Range.ska' descchecksum = Disaster_Range
        <LoadFunction> <...> name = 'anims\THPS6_skater_lip\Disaster_Out.ska' descchecksum = Disaster_Out
        <LoadFunction> <...> name = 'anims\THPS6_skater_lip\AxleStall_Init.ska' descchecksum = AxleStall_Init
        <LoadFunction> <...> name = 'anims\THPS6_skater_lip\AxleStall_Range.ska' descchecksum = AxleStall_Range
        <LoadFunction> <...> name = 'anims\THPS6_skater_lip\AxleStall_Out.ska' descchecksum = AxleStall_Out
        <LoadFunction> <...> name = 'anims\THPS6_skater_lip\Invert_Init.ska' descchecksum = Invert_Init
        <LoadFunction> <...> name = 'anims\THPS6_skater_lip\Invert_Range.ska' descchecksum = Invert_Range
        <LoadFunction> <...> name = 'anims\THPS6_skater_lip\Invert_Out.ska' descchecksum = Invert_Out
        <LoadFunction> <...> name = 'anims\THPS6_skater_lip\OneFootInvert_Init.ska' descchecksum = OneFootInvert_Init
        <LoadFunction> <...> name = 'anims\THPS6_skater_lip\OneFootInvert_Range.ska' descchecksum = OneFootInvert_Range
        <LoadFunction> <...> name = 'anims\THPS6_skater_lip\OneFootInvert_Out.ska' descchecksum = OneFootInvert_Out
        <LoadFunction> <...> name = 'anims\THPS6_skater_lip\BSFootplant_Init.ska' descchecksum = BSFootplant_Init
        <LoadFunction> <...> name = 'anims\THPS6_skater_lip\BSFootplant_Range.ska' descchecksum = BSFootplant_Range
        <LoadFunction> <...> name = 'anims\THPS6_skater_lip\BSFootplant_Out.ska' descchecksum = BSFootplant_Out
        <LoadFunction> <...> name = 'anims\THPS6_skater_lip\BSFootplant_OllieOut.ska' descchecksum = BSFootplant_OllieOut
        <LoadFunction> <...> name = 'anims\THPS6_skater_lip\AxleStall_OllieOut.ska' descchecksum = AxleStall_OllieOut
        <LoadFunction> <...> name = 'anims\THPS6_skater_lip\FS180Noseblunt_Init.ska' descchecksum = FS180Noseblunt_Init
        <LoadFunction> <...> name = 'anims\THPS6_skater_lip\FS180Noseblunt_Range.ska' descchecksum = FS180Noseblunt_Range
        <LoadFunction> <...> name = 'anims\THPS6_skater_lip\FS180Noseblunt_Out.ska' descchecksum = FS180Noseblunt_Out
        <LoadFunction> <...> name = 'anims\THPS6_skater_lip\FSIndyNosePick_Init.ska' descchecksum = FSIndyNosePick_Init
        <LoadFunction> <...> name = 'anims\THPS6_skater_lip\FSIndyNosePick_Range.ska' descchecksum = FSIndyNosePick_Range
        <LoadFunction> <...> name = 'anims\THPS6_skater_lip\FSIndyNosePick_Out.ska' descchecksum = FSIndyNosePick_Out
        <LoadFunction> <...> name = 'anims\THPS6_skater_lip\AndrectInvert_Init.ska' descchecksum = AndrectInvert_Init
        <LoadFunction> <...> name = 'anims\THPS6_skater_lip\AndrectInvert_Out.ska' descchecksum = AndrectInvert_Out
        <LoadFunction> <...> name = 'anims\THPS6_skater_lip\AndrectInvert_Range.ska' descchecksum = AndrectInvert_Range
        <LoadFunction> <...> name = 'anims\THPS6_skater_lip\Switcheroo_Out.ska' descchecksum = Switcheroo_Out
        <LoadFunction> <...> name = 'anims\THPS6_skater_lip\Switcheroo_Init.ska' descchecksum = Switcheroo_Init
        <LoadFunction> <...> name = 'anims\THPS6_skater_lip\Switcheroo_Range.ska' descchecksum = Switcheroo_Range
        <LoadFunction> <...> name = 'anims\THPS6_Skater_Basics\Natas_Spin_Init.ska' descchecksum = Natas_Spin_Init
        <LoadFunction> <...> name = 'anims\THPS6_Skater_Basics\Natas_Spin_Range.ska' descchecksum = Natas_Spin_Range
    endif
    SetReferenceChecksum 0
endscript


script animload_THPS6_human_unloadable_13 LoadFunction = LoadAnim
    SetReferenceChecksum THPS6_human
    if <LoadFunction> <...> name = 'anims\THPS6_Skater_Basics\Natas_Spin_Out.ska' descchecksum = Natas_Spin_Out
        <LoadFunction> <...> name = 'anims\THPS6_Skater_Basics\FS_PowerSlide_Init.ska' descchecksum = FS_PowerSlide_Init
        <LoadFunction> <...> name = 'anims\THPS6_Skater_Basics\FS_PowerSlide_Idle.ska' descchecksum = FS_PowerSlide_Idle
        <LoadFunction> <...> name = 'anims\THPS6_Skater_Basics\FS_PowerSlide_Out.ska' descchecksum = FS_PowerSlide_Out
        <LoadFunction> <...> name = 'anims\THPS6_Skater_Basics\FS_PowerSlide_180_Out.ska' descchecksum = FS_PowerSlide_180_Out
        <LoadFunction> <...> name = 'anims\THPS6_Skater_Basics\BS_PowerSlide_Init.ska' descchecksum = BS_PowerSlide_Init
        <LoadFunction> <...> name = 'anims\THPS6_Skater_Basics\BS_PowerSlide_Idle.ska' descchecksum = BS_PowerSlide_Idle
        <LoadFunction> <...> name = 'anims\THPS6_Skater_Basics\BS_PowerSlide_180_Out.ska' descchecksum = BS_PowerSlide_180_Out
        <LoadFunction> <...> name = 'anims\THPS6_Skater_Basics\BS_PowerSlide_Out.ska' descchecksum = BS_PowerSlide_Out
        <LoadFunction> <...> name = 'anims\THPS6_Skater_PressureFlip\BS180PressureFlip.ska' descchecksum = BS180PressureFlip
        <LoadFunction> <...> name = 'anims\THPS6_Skater_PressureFlip\BSToeFlip.ska' descchecksum = BSToeFlip
        <LoadFunction> <...> name = 'anims\THPS6_Skater_PressureFlip\BS360PressureFlip.ska' descchecksum = BS360PressureFlip
        <LoadFunction> <...> name = 'anims\THPS6_Skater_PressureFlip\FS360PressureFlip.ska' descchecksum = FS360PressureFlip
        <LoadFunction> <...> name = 'anims\THPS6_skater_misc\RunFromIdle.ska' descchecksum = RunFromIdle
        <LoadFunction> <...> name = 'anims\THPS6_skater_misc\Run.ska' descchecksum = run
        <LoadFunction> <...> name = 'anims\THPS6_skater_misc\RunToIdle.ska' descchecksum = RunToIdle
        <LoadFunction> <...> name = 'anims\THPS6_skater_misc\RunJump.ska' descchecksum = RunJump
        <LoadFunction> <...> name = 'anims\THPS6_skater_misc\RunJumpIdle.ska' descchecksum = runjumpidle
        <LoadFunction> <...> name = 'anims\THPS6_skater_misc\RunJumpLand.ska' descchecksum = runjumpland
        <LoadFunction> <...> name = 'anims\THPS6_Skater_Female\NewBrake_Female.ska' descchecksum = NewBrake_Female
        <LoadFunction> <...> name = 'anims\THPS6_Skater_Female\NewBrakeIdle_Female.ska' descchecksum = NewBrakeIdle_Female
        <LoadFunction> <...> name = 'anims\THPS6_Skater_Female\NewBrakeIdle2_Female.ska' descchecksum = NewBrakeIdle2_Female
        <LoadFunction> <...> name = 'anims\THPS6_Skater_Female\NewBrakeIdle3_Female.ska' descchecksum = NewBrakeIdle3_Female
        <LoadFunction> <...> name = 'anims\THPS6_Skater_Female\NewBrakeIdle4_Female.ska' descchecksum = NewBrakeIdle4_Female
        <LoadFunction> <...> name = 'anims\THPS6_Skater_Female\NewBrakeIdle6_Female.ska' descchecksum = NewBrakeIdle6_Female
        <LoadFunction> <...> name = 'anims\THPS6_Skater_Female\NewBrakeIdle7_Female.ska' descchecksum = NewBrakeIdle7_Female
        <LoadFunction> <...> name = 'anims\THPS6_Skater_Female\NewBrakeIdle8_Female.ska' descchecksum = NewBrakeIdle8_Female
        <LoadFunction> <...> name = 'anims\thps6_skater_OnFoot_partial\HangLeft10_Partial.ska' descchecksum = HangLeft10_Partial
        <LoadFunction> <...> name = 'anims\thps6_skater_OnFoot_partial\HangRight10_Partial.ska' descchecksum = HangRight10_Partial
        <LoadFunction> <...> name = 'anims\thps6_skater_OnFoot_partial\HangLeft10_PartialUp.ska' descchecksum = HangLeft10_PartialUp
        <LoadFunction> <...> name = 'anims\thps6_skater_OnFoot_partial\HangRight10_PartialUp.ska' descchecksum = HangRight10_PartialUp
        <LoadFunction> <...> name = 'anims\thps6_skater_OnFoot_partial\HangLeft20_Partial.ska' descchecksum = HangLeft20_Partial
        <LoadFunction> <...> name = 'anims\thps6_skater_OnFoot_partial\HangRight20_Partial.ska' descchecksum = HangRight20_Partial
        <LoadFunction> <...> name = 'anims\thps6_skater_OnFoot_partial\HangLeft20_PartialUp.ska' descchecksum = HangLeft20_PartialUp
        <LoadFunction> <...> name = 'anims\thps6_skater_OnFoot_partial\HangRight20_PartialUp.ska' descchecksum = HangRight20_PartialUp
        <LoadFunction> <...> name = 'anims\thps6_skater_OnFoot_partial\HangLeft30_Partial.ska' descchecksum = HangLeft30_Partial
        <LoadFunction> <...> name = 'anims\thps6_skater_OnFoot_partial\HangRight30_Partial.ska' descchecksum = HangRight30_Partial
        <LoadFunction> <...> name = 'anims\thps6_skater_OnFoot_partial\HangLeft30_PartialUp.ska' descchecksum = HangLeft30_PartialUp
        <LoadFunction> <...> name = 'anims\thps6_skater_OnFoot_partial\HangRight30_PartialUp.ska' descchecksum = HangRight30_PartialUp
        <LoadFunction> <...> name = 'anims\thps6_skater_OnFoot_partial\HangLeft40_Partial.ska' descchecksum = HangLeft40_Partial
        <LoadFunction> <...> name = 'anims\thps6_skater_OnFoot_partial\HangRight40_Partial.ska' descchecksum = HangRight40_Partial
        <LoadFunction> <...> name = 'anims\thps6_skater_OnFoot_partial\HangLeft40_PartialUp.ska' descchecksum = HangLeft40_PartialUp
        <LoadFunction> <...> name = 'anims\thps6_skater_OnFoot_partial\HangRight40_PartialUp.ska' descchecksum = HangRight40_PartialUp
        <LoadFunction> <...> name = 'anims\thps6_skater_OnFoot_partial\WalkingSlap_Partial.ska' descchecksum = WalkingSlap_Partial
        <LoadFunction> <...> name = 'anims\thps6_skater_OnFoot_partial\FastRun_Partial.ska' descchecksum = FastRun_Partial
        <LoadFunction> <...> name = 'anims\thps6_skater_OnFoot_partial\HangIdleToDrop_Partial.ska' descchecksum = HangIdleToDrop_Partial
        <LoadFunction> <...> name = 'anims\thps6_skater_OnFoot_partial\HangOntoTheTop_Partial.ska' descchecksum = HangOntoTheTop_Partial
        <LoadFunction> <...> name = 'anims\thps6_skater_OnFoot_partial\JumpAir_Partial.ska' descchecksum = JumpAir_Partial
        <LoadFunction> <...> name = 'anims\thps6_skater_OnFoot_partial\JumpLandToRun_Partial.ska' descchecksum = JumpLandToRun_Partial
        <LoadFunction> <...> name = 'anims\thps6_skater_OnFoot_partial\JumpLandToStand_Partial.ska' descchecksum = JumpLandToStand_Partial
    endif
    SetReferenceChecksum 0
endscript


script animload_THPS6_human_unloadable_14 LoadFunction = LoadAnim
    SetReferenceChecksum THPS6_human
    if <LoadFunction> <...> name = 'anims\thps6_skater_OnFoot_partial\LadderClimb_Partial.ska' descchecksum = LadderClimb_Partial
        <LoadFunction> <...> name = 'anims\thps6_skater_OnFoot_partial\LadderClimbFromStandIdle_Partial.ska' descchecksum = LadderClimbFromStandIdle_Partial
        <LoadFunction> <...> name = 'anims\thps6_skater_OnFoot_partial\LadderOntoTheTop_Partial.ska' descchecksum = LadderOntoTheTop_Partial
        <LoadFunction> <...> name = 'anims\thps6_skater_OnFoot_partial\RunToJump_Partial.ska' descchecksum = RunToJump_Partial
        <LoadFunction> <...> name = 'anims\thps6_skater_OnFoot_partial\StandToHang_Partial.ska' descchecksum = StandToHang_Partial
        <LoadFunction> <...> name = 'anims\thps6_skater_OnFoot_partial\StandToJump_Partial.ska' descchecksum = StandToJump_Partial
        <LoadFunction> <...> name = 'anims\thps6_skater_OnFoot_partial\WRun_Partial.ska' descchecksum = WRun_Partial
        <LoadFunction> <...> name = 'anims\thps6_skater_OnFoot_partial\WStand_Partial.ska' descchecksum = WStand_Partial
        <LoadFunction> <...> name = 'anims\thps6_skater_OnFoot_partial\WStandToRun_Partial.ska' descchecksum = WStandToRun_Partial
        <LoadFunction> <...> name = 'anims\thps6_skater_OnFoot_partial\WStandToWalk_Partial.ska' descchecksum = WStandToWalk_Partial
        <LoadFunction> <...> name = 'anims\thps6_skater_OnFoot_partial\WWalk_Partial.ska' descchecksum = WWalk_Partial
        <LoadFunction> <...> name = 'anims\thps6_skater_OnFoot_partial\WalkFast_Partial.ska' descchecksum = WalkFast_Partial
        <LoadFunction> <...> name = 'anims\thps6_skater_OnFoot_partial\WalkSlow_Partial.ska' descchecksum = WalkSlow_Partial
        <LoadFunction> <...> name = 'anims\thps6_skater_OnFoot_partial\_180RunSkid_Partial.ska' descchecksum = _180RunSkid_Partial
        <LoadFunction> <...> name = 'anims\thps6_skater_OnFoot_partial\JumpToSwingHang_Partial.ska' descchecksum = JumpToSwingHang_Partial
        <LoadFunction> <...> name = 'anims\thps6_skater_OnFoot_partial\JumpToWallHang_Partial.ska' descchecksum = JumpToWallHang_Partial
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\AirCasperFlip_Idle.ska' descchecksum = AirCasperFlip_Idle
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\AirCasperFlip_Init.ska' descchecksum = AirCasperFlip_Init
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\AirCasperFlip_Out.ska' descchecksum = AirCasperFlip_Out
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\BSNoseSlideLipSlide.ska' descchecksum = BSNoseSlideLipSlide
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\BarrelRoll.ska' descchecksum = BarrelRoll
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\BigHitter_Init.ska' descchecksum = BigHitter_Init
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\BigHitter_Out.ska' descchecksum = BigHitter_Out
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\BigHitter_Range.ska' descchecksum = BigHitter_Range
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\CoffinGrind_Init.ska' descchecksum = CoffinGrind_Init
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\CoffinGrind_Out.ska' descchecksum = CoffinGrind_Out
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\CoffinGrind_Range.ska' descchecksum = CoffinGrind_Range
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\CrailSlide_Init.ska' descchecksum = CrailSlide_Init
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\CrailSlide_Out.ska' descchecksum = CrailSlide_Out
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\CrailSlide_Range.ska' descchecksum = CrailSlide_Range
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\CrookBigSpinFlipCrook.ska' descchecksum = CrookBigSpinFlipCrook
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\DaffyBroken_Init.ska' descchecksum = DaffyBroken_Init
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\DaffyBroken_Range.ska' descchecksum = DaffyBroken_Range
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\DanceParty_Idle.ska' descchecksum = DanceParty_Idle
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\DanceParty_Init.ska' descchecksum = DanceParty_Init
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\DarkSlide_Init.ska' descchecksum = DarkSlide_Init
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\DarkSlide_Out.ska' descchecksum = DarkSlide_Out
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\DarkSlide_Range.ska' descchecksum = DarkSlide_Range
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\DoubleBlunt_Idle.ska' descchecksum = DoubleBlunt_Idle
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\DoubleBlunt_Init.ska' descchecksum = DoubleBlunt_Init
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\DoubleKFVarialIndy.ska' descchecksum = DoubleKFVarialIndy
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\ElbowSmash_Idle.ska' descchecksum = ElbowSmash_Idle
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\ElbowSmash_Init.ska' descchecksum = ElbowSmash_Init
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\ElbowSmash_Out.ska' descchecksum = ElbowSmash_Out
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\FS540.ska' descchecksum = FS540
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\FSBigSpinShifty_Idle.ska' descchecksum = FSBigSpinShifty_Idle
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\FSBigSpinShifty_Init.ska' descchecksum = FSBigSpinShifty_Init
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\FSBigSpinShifty_Out.ska' descchecksum = FSBigSpinShifty_Out
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\FSNoseSlideLipSlide.ska' descchecksum = FSNoseSlideLipSlide
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\Fandangle_Init.ska' descchecksum = Fandangle_Init
    endif
    SetReferenceChecksum 0
endscript


script animload_THPS6_human_unloadable_15 LoadFunction = LoadAnim
    SetReferenceChecksum THPS6_human
    if <LoadFunction> <...> name = 'anims\THPS6_skater_special\Fandangle_Out.ska' descchecksum = Fandangle_Out
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\Fandangle_Range.ska' descchecksum = Fandangle_Range
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\FingerFlipAirWalk.ska' descchecksum = FingerFlipAirWalk
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\Flamingo_Idle.ska' descchecksum = Flamingo_Idle
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\Flamingo_Init.ska' descchecksum = Flamingo_Init
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\Flamingo_Out.ska' descchecksum = Flamingo_Out
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\GazelleUnderflip.ska' descchecksum = GazelleUnderflip
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\Ghettobird2.ska' descchecksum = Ghettobird2
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\GrindOverturn_Init.ska' descchecksum = GrindOverturn_Init
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\GrindOverturn_Range.ska' descchecksum = GrindOverturn_Range
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\HangTenNoseGrind_Init.ska' descchecksum = HangTenNoseGrind_Init
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\HangTenNoseGrind_Out.ska' descchecksum = HangTenNoseGrind_Out
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\HangTenNoseGrind_Range.ska' descchecksum = HangTenNoseGrind_Range
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\HardFlipBackFootFlip.ska' descchecksum = HardFlipBackFootFlip
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\HeelflipFSInvert_Init.ska' descchecksum = HeelflipFSInvert_Init
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\HeelflipFSInvert_Out.ska' descchecksum = HeelflipFSInvert_Out
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\HeelflipFSInvert_Range.ska' descchecksum = HeelflipFSInvert_Range
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\HoHoSadPlant_Idle.ska' descchecksum = HoHoSadPlant_Idle
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\HoHoSadPlant_Init.ska' descchecksum = HoHoSadPlant_Init
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\HoHoSadPlant_Out.ska' descchecksum = HoHoSadPlant_Out
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\HoHoStreetPlant_Idle.ska' descchecksum = HoHoStreetPlant_Idle
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\HoHoStreetPlant_Init.ska' descchecksum = HoHoStreetPlant_Init
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\HoHoStreetPlant_Out.ska' descchecksum = HoHoStreetPlant_Out
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\KickFlipBodyBackFlip.ska' descchecksum = KickFlipBodyBackFlip
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\KickFlipUnderFlip.ska' descchecksum = KickFlipUnderFlip
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\LaserFlip.ska' descchecksum = LaserFlip
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\McTwist.ska' descchecksum = McTwist
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\NoComplyLate360.ska' descchecksum = NoComplyLate360
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\NosegrindPivot_Init.ska' descchecksum = NosegrindPivot_Init
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\NosegrindPivot_Range.ska' descchecksum = NosegrindPivot_Range
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\OneFootOneWheel_Init.ska' descchecksum = OneFootOneWheel_Init
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\OneFootOneWheel_Range.ska' descchecksum = OneFootOneWheel_Range
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\Primo_Init.ska' descchecksum = Primo_Init
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\Primo_Out.ska' descchecksum = Primo_Out
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\Primo_Range.ska' descchecksum = Primo_Range
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\PutDownOneWheel.ska' descchecksum = PutDownOneWheel
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\Russian_Idle.ska' descchecksum = Russian_Idle
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\Russian_OllieOut.ska' descchecksum = Russian_OllieOut
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\Russian_Out.ska' descchecksum = Russian_Out
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\RustySlide_Init.ska' descchecksum = RustySlide_Init
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\RustySlide_Out.ska' descchecksum = RustySlide_Out
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\SackTap_Init.ska' descchecksum = SackTap_Init
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\SackTap_Out.ska' descchecksum = SackTap_Out
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\SackTap_Range.ska' descchecksum = SackTap_Range
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\SambaFlip.ska' descchecksum = SambaFlip
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\SemiFlip.ska' descchecksum = SemiFlip
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\SitDownAir_Idle.ska' descchecksum = SitDownAir_Idle
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\SitDownAir_Init.ska' descchecksum = SitDownAir_Init
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\SmithFS_Init.ska' descchecksum = SmithFS_Init
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\SmithFS_Range.ska' descchecksum = SmithFS_Range
    endif
    SetReferenceChecksum 0
endscript


script animload_THPS6_human_unloadable_16 LoadFunction = LoadAnim
    SetReferenceChecksum THPS6_human
    if <LoadFunction> <...> name = 'anims\THPS6_skater_special\Smith_Init.ska' descchecksum = Smith_Init
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\Smith_Range.ska' descchecksum = Smith_Range
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\Sproing.ska' descchecksum = Sproing
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\Sweet.ska' descchecksum = Sweet
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\TailGrindFingerFlip.ska' descchecksum = TailGrindFingerFlip
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\TailblockSlide_Init.ska' descchecksum = TailblockSlide_Init
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\TailblockSlide_Range.ska' descchecksum = TailblockSlide_Range
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\_2KickMadonnaFlip_Init.ska' descchecksum = _2KickMadonnaFlip_Init
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\_2KickMadonnaFlip_Out.ska' descchecksum = _2KickMadonnaFlip_Out
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\_360VarialMcTwist.ska' descchecksum = _360VarialMcTwist
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\_540Boneless.ska' descchecksum = _540Boneless
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\_540Flip.ska' descchecksum = _540Flip
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\_540TailWhip.ska' descchecksum = _540TailWhip
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\BamBendAir_Idle.ska' descchecksum = BamBendAir_Idle
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\BamBendAir_Init.ska' descchecksum = BamBendAir_Init
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\FiftyFiftySwitcheroo_Idle.ska' descchecksum = FiftyFiftySwitcheroo_Idle
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\FiftyFiftySwitcheroo_Init.ska' descchecksum = FiftyFiftySwitcheroo_Init
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\GrindNBarf_Init.ska' descchecksum = GrindNBarf_Init
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\GrindNBarf_Out.ska' descchecksum = GrindNBarf_Out
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\GrindNBarf_Range.ska' descchecksum = GrindNBarf_Range
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\RodneyGrind_Init.ska' descchecksum = RodneyGrind_Init
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\RodneyGrind_Out.ska' descchecksum = RodneyGrind_Out
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\RodneyGrind_Range.ska' descchecksum = RodneyGrind_Range
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\Shortbus_Idle.ska' descchecksum = Shortbus_Idle
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\Shortbus_Init.ska' descchecksum = Shortbus_Init
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\Shortbus_Out.ska' descchecksum = Shortbus_Out
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\SlamSpinner.ska' descchecksum = SlamSpinner
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\YeahRight_Idle.ska' descchecksum = YeahRight_Idle
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\YeahRight_Init.ska' descchecksum = YeahRight_Init
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\YeahRight_Out.ska' descchecksum = YeahRight_Out
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\_360ShovItNoseGrind_Init.ska' descchecksum = _360ShovItNoseGrind_Init
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\_360ShovItNoseGrind_Out.ska' descchecksum = _360ShovItNoseGrind_Out
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\_360ShovItNoseGrind_Range.ska' descchecksum = _360ShovItNoseGrind_Range
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\BreakIn_Init.ska' descchecksum = BreakIn_Init
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\FSDarkSlide_Init.ska' descchecksum = FSDarkSlide_Init
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\FSDarkSlide_Out.ska' descchecksum = FSDarkSlide_Out
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\FSDarkSlide_Range.ska' descchecksum = FSDarkSlide_Range
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\FSFlipOneFootTailGrab_Idle.ska' descchecksum = FSFlipOneFootTailGrab_Idle
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\FSFlipOneFootTailGrab_Init.ska' descchecksum = FSFlipOneFootTailGrab_Init
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\FSFlipOneFootTailGrab_Out.ska' descchecksum = FSFlipOneFootTailGrab_Out
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\FSNollie360FlipCrook_Init.ska' descchecksum = FSNollie360FlipCrook_Init
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\FSNollie360FlipCrook_Out.ska' descchecksum = FSNollie360FlipCrook_Out
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\FSNollie360FlipCrook_Range.ska' descchecksum = FSNollie360FlipCrook_Range
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\HandStandCasper_Init.ska' descchecksum = HandStandCasper_Init
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\HandStandCasper_Out.ska' descchecksum = HandStandCasper_Out
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\HandStandCasper_Range.ska' descchecksum = HandStandCasper_Range
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\HCNHDF_Init.ska' descchecksum = HCNHDF_Init
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\HCNHDF_Out.ska' descchecksum = HCNHDF_Out
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\HCNHDF_Range.ska' descchecksum = HCNHDF_Range
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\KickFlipSwitchOneFootManual_Init.ska' descchecksum = KickFlipSwitchOneFootManual_Init
    endif
    SetReferenceChecksum 0
endscript


script animload_THPS6_human_unloadable_17 LoadFunction = LoadAnim
    SetReferenceChecksum THPS6_human
    if <LoadFunction> <...> name = 'anims\THPS6_skater_special\KickFlipSwitchOneFootManual_Out.ska' descchecksum = KickFlipSwitchOneFootManual_Out
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\KickFlipSwitchOneFootManual_Range.ska' descchecksum = KickFlipSwitchOneFootManual_Range
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\MixItUp_Idle.ska' descchecksum = MixItUp_Idle
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\MixItUp_Init.ska' descchecksum = MixItUp_Init
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\MixItUp_Out.ska' descchecksum = MixItUp_Out
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\MoonwalkGrind_Idle.ska' descchecksum = MoonwalkGrind_Idle
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\MoonwalkGrind_Init.ska' descchecksum = MoonwalkGrind_Init
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\MoonwalkGrind_Out.ska' descchecksum = MoonwalkGrind_Out
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\OneFootDarkslide_Init.ska' descchecksum = OneFootDarkslide_Init
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\OneFootDarkslide_Out.ska' descchecksum = OneFootDarkslide_Out
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\OneFootDarkslide_Range.ska' descchecksum = OneFootDarkslide_Range
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\PrimoHandStand_Init.ska' descchecksum = PrimoHandStand_Init
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\PrimoHandStand_Out.ska' descchecksum = PrimoHandStand_Out
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\PrimoHandStand_Range.ska' descchecksum = PrimoHandStand_Range
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\RowleyDarkSlideHandStand_Init.ska' descchecksum = RowleyDarkSlideHandStand_Init
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\RowleyDarkSlideHandStand_Out.ska' descchecksum = RowleyDarkSlideHandStand_Out
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\RowleyDarkSlideHandStand_Range.ska' descchecksum = RowleyDarkSlideHandStand_Range
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\Shifty360ShovItBSShifty_Idle.ska' descchecksum = Shifty360ShovItBSShifty_Idle
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\Shifty360ShovItBSShifty_Init.ska' descchecksum = Shifty360ShovItBSShifty_Init
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\Shifty360ShovItBSShifty_Out.ska' descchecksum = Shifty360ShovItBSShifty_Out
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\_540VarielHeelflipLien.ska' descchecksum = _540VarielHeelflipLien
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\The900.ska' descchecksum = The900
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\Indy900.ska' descchecksum = Indy900
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\_1234.ska' descchecksum = _1234
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\Special_Bam_Chainsaw_Init.ska' descchecksum = Special_Bam_Chainsaw_Init
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\Special_Bam_Chainsaw_Idle.ska' descchecksum = Special_Bam_Chainsaw_Idle
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\Special_Bam_Chainsaw_Out.ska' descchecksum = Special_Bam_Chainsaw_Out
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\Special_Bam_Lip_Init.ska' descchecksum = Special_Bam_Lip_Init
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\Special_Bam_Lip_Idle.ska' descchecksum = Special_Bam_Lip_Idle
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\Special_Bam_Lip_Out.ska' descchecksum = Special_Bam_Lip_Out
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\BeaverBlast.ska' descchecksum = BeaverBlast
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\Special_FranklinGrind_Init.ska' descchecksum = Special_FranklinGrind_Init
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\Special_FranklinGrind_Range.ska' descchecksum = Special_FranklinGrind_Range
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\Special_FranklinGrind_Out.ska' descchecksum = Special_FranklinGrind_Out
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\Special_FranklinGrind_Idle.ska' descchecksum = Special_FranklinGrind_Idle
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\Special_Bob_DrksldJapan_Init.ska' descchecksum = Special_Bob_DrksldJapan_Init
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\Special_Bob_DrksldJapan_Idle.ska' descchecksum = Special_Bob_DrksldJapan_Idle
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\Special_Bob_DrksldJapan_Out.ska' descchecksum = Special_Bob_DrksldJapan_Out
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\Special_Bob_RockNRollswitch_Init.ska' descchecksum = Special_Bob_RockNRollswitch_Init
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\Special_Bob_RockNRollswitch_Idle.ska' descchecksum = Special_Bob_RockNRollswitch_Idle
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\Special_Bob_RockNRollswitch_Out.ska' descchecksum = Special_Bob_RockNRollswitch_Out
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\Special_BullF_Sword_Init.ska' descchecksum = Special_BullF_Sword_Init
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\Special_BullF_Sword_Idle.ska' descchecksum = Special_BullF_Sword_Idle
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\Special_BullF_Sword_Out.ska' descchecksum = Special_BullF_Sword_Out
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\Special_Eric_RnngMan_Init.ska' descchecksum = Special_Eric_RnngMan_Init
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\Special_Eric_RnngMan_Idle.ska' descchecksum = Special_Eric_RnngMan_Idle
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\Special_GrafPunk_Init.ska' descchecksum = Special_GrafPunk_Init
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\Special_GrafPunk_Idle.ska' descchecksum = Special_GrafPunk_Idle
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\Special_GrafPunk_Out.ska' descchecksum = Special_GrafPunk_Out
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\Special_Hand_Thebird_Init.ska' descchecksum = Special_Hand_Thebird_Init
    endif
    SetReferenceChecksum 0
endscript


script animload_THPS6_human_unloadable_18 LoadFunction = LoadAnim
    SetReferenceChecksum THPS6_human
    if <LoadFunction> <...> name = 'anims\THPS6_skater_special\Special_Hand_Thebird_Range.ska' descchecksum = Special_Hand_Thebird_Range
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\Special_Hand_Thebird_Out.ska' descchecksum = Special_Hand_Thebird_Out
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\Special_Jesse_HotRod_Init.ska' descchecksum = Special_Jesse_HotRod_Init
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\Special_Jesse_HotRod_Range.ska' descchecksum = Special_Jesse_HotRod_Range
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\Special_Jesse_HotRod_Out.ska' descchecksum = Special_Jesse_HotRod_Out
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\Special_Jester_Juggle_init.ska' descchecksum = Special_Jester_Juggle_init
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\Special_Jester_Juggle_Idle.ska' descchecksum = Special_Jester_Juggle_Idle
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\Special_Jester_Juggle_Out.ska' descchecksum = Special_Jester_Juggle_Out
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\Special_Koston_900.ska' descchecksum = Special_Koston_900
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\Special_Koston_EndlessFlip_Init.ska' descchecksum = Special_Koston_EndlessFlip_Init
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\Special_Koston_EndlessFlip_Idle.ska' descchecksum = Special_Koston_EndlessFlip_Idle
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\Special_Koston_EndlessFlip_Out.ska' descchecksum = Special_Koston_EndlessFlip_Out
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\Special_MikeV_Around_Int.ska' descchecksum = Special_MikeV_Around_Int
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\Special_MikeV_Around_Range.ska' descchecksum = Special_MikeV_Around_Range
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\Special_MikeV_Around_Out.ska' descchecksum = Special_MikeV_Around_Out
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\Special_MikeV_Boomerang.ska' descchecksum = Special_MikeV_Boomerang
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\Special_Muska_Burn_init.ska' descchecksum = Special_Muska_Burn_init
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\Special_Muska_Burn_Range.ska' descchecksum = Special_Muska_Burn_Range
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\Special_Muska_Burn_Out.ska' descchecksum = Special_Muska_Burn_Out
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\Special_Muska_Worm_Init.ska' descchecksum = Special_Muska_Worm_Init
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\Special_Muska_Worm_Idle.ska' descchecksum = Special_Muska_Worm_Idle
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\Special_Muska_Worm_Out.ska' descchecksum = Special_Muska_Worm_Out
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\Special_Natas_spin_init.ska' descchecksum = Special_Natas_spin_init
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\Special_Natas_Spin_Range.ska' descchecksum = Special_Natas_Spin_Range
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\Special_Paulie_ButtMan_Init.ska' descchecksum = Special_Paulie_ButtMan_Init
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\Special_Paulie_ButtMan_Range.ska' descchecksum = Special_Paulie_ButtMan_Range
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\Special_Paulie_ButtMan_Out.ska' descchecksum = Special_Paulie_ButtMan_Out
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\Special_Phil_Hoagie_Init.ska' descchecksum = Special_Phil_Hoagie_Init
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\Special_Phil_Hoagie_Idle.ska' descchecksum = Special_Phil_Hoagie_Idle
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\Special_Phil_Hoagie_Out.ska' descchecksum = Special_Phil_hoagie_Out
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\Special_Rodney_PrimoSpin_Init.ska' descchecksum = Special_Rodney_PrimoSpin_Init
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\Special_Rodney_PrimoSpin_Idle.ska' descchecksum = Special_Rodney_PrimoSpin_Idle
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\Special_Rodney_PrimoSpin_Out.ska' descchecksum = Special_Rodney_PrimoSpin_Out
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\Special_Rodney_HlfcabUndrFlip.ska' descchecksum = Special_Rodney_HlfcabUndrFlip
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\Special_Sheckler_Primo_Init.ska' descchecksum = Special_Sheckler_Primo_Init
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\Special_Sheckler_Primo_Range.ska' descchecksum = Special_Sheckler_Primo_Range
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\Special_Sheckler_Primo_Out.ska' descchecksum = Special_Sheckler_Primo_Out
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\Special_Sheckler_Grab_Init.ska' descchecksum = Special_Sheckler_Grab_Init
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\Special_Sheckler_Grab_Idle.ska' descchecksum = Special_Sheckler_Grab_Idle
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\Special_Sheckler_Grab_Out.ska' descchecksum = Special_Sheckler_Grab_Out
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\Special_Shrek_WaxSlide_Init.ska' descchecksum = Special_Shrek_WaxSlide_Init
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\Special_Shrek_WaxSlide_Range.ska' descchecksum = Special_Shrek_WaxSlide_Range
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\Special_Shrek_WaxSlide_Out.ska' descchecksum = Special_Shrek_WaxSlide_Out
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\Special_Shrek_BoardSnap.ska' descchecksum = Special_Shrek_BoardSnap
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\Shrek_BurpTag.ska' descchecksum = Shrek_BurpTag
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\Shrek_BurpHangingTag.ska' descchecksum = Shrek_BurpHangingTag
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\Special_Shrimp_Rotisserie.ska' descchecksum = Special_Shrimp_Rotisserie
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\Special_Soldier_Solute.ska' descchecksum = Special_Soldier_Solute
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\Special_Soldier_AmerHero2_init.ska' descchecksum = Special_Soldier_AmerHero2_Init
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\Special_Soldier_AmerHero2_Idle.ska' descchecksum = Special_Soldier_AmerHero2_Idle
    endif
    SetReferenceChecksum 0
endscript


script animload_THPS6_human_unloadable_19 LoadFunction = LoadAnim
    SetReferenceChecksum THPS6_human
    if <LoadFunction> <...> name = 'anims\THPS6_skater_special\Special_Soldier_AmerHero2_Out.ska' descchecksum = Special_Soldier_AmerHero2_Out
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\Special_SteveO_BiteBoard.ska' descchecksum = Special_SteveO_BiteBoard
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\Special_Tony_Surfer_init.ska' descchecksum = Special_Tony_Surfer_init
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\Special_Tony_Surfer_Idle.ska' descchecksum = Special_Tony_Surfer_Idle
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\Special_Tony_Windmill_Init.ska' descchecksum = Special_Tony_Windmill_Init
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\Special_Tony_Windmill_Idle.ska' descchecksum = Special_Tony_Windmill_Idle
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\Special_Tony_Windmill_Out.ska' descchecksum = Special_Tony_Windmill_Out
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\Special_Weeman_KickHead.ska' descchecksum = Special_Weeman_KickHead
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\Wallplant_Sticker.ska' descchecksum = Wallplant_Sticker
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\Standing_Tag2.ska' descchecksum = Standing_Tag2
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\Hanging_Tag.ska' descchecksum = Hanging_Tag
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\VertPlant.ska' descchecksum = VertPlant
        <LoadFunction> <...> name = 'anims\THPS6_Bail_GetUp\GetUp_HK_Ft_T.ska' descchecksum = GetUp_HK_Ft_T
        <LoadFunction> <...> name = 'anims\THPS6_Skater_Basics\Standing_Throw.ska' descchecksum = Standing_Throw
        <LoadFunction> <...> name = 'anims\THPS6_Skater_Basics\Throw_Sidearm_Partial.ska' descchecksum = Throw_Sidearm_Partial
        <LoadFunction> <...> name = 'anims\THPS6_Skater_Basics\Walking_Throw_Partial.ska' descchecksum = Walking_Throw_Partial
        <LoadFunction> <...> name = 'anims\thps6_skater_OnFoot\Jump_DoubleJump.ska' descchecksum = Jump_DoubleJump
        <LoadFunction> <...> name = 'anims\thps6_skater_OnFoot\AirIdleToJumpAir.ska' descchecksum = AirIdleToJumpAir
        <LoadFunction> <...> name = 'anims\thps6_skater_OnFoot\FastRun.ska' descchecksum = FastRun
        <LoadFunction> <...> name = 'anims\thps6_skater_OnFoot\HangIdle.ska' descchecksum = HangIdle
        <LoadFunction> <...> name = 'anims\thps6_skater_OnFoot\HangIdleToDrop.ska' descchecksum = HangIdleToDrop
        <LoadFunction> <...> name = 'anims\thps6_skater_OnFoot\HangLeft.ska' descchecksum = hangleft
        <LoadFunction> <...> name = 'anims\thps6_skater_OnFoot\HangOntoTheTop.ska' descchecksum = HangOntoTheTop
        <LoadFunction> <...> name = 'anims\thps6_skater_OnFoot\HangRight.ska' descchecksum = hangright
        <LoadFunction> <...> name = 'anims\thps6_skater_OnFoot\JumpAir.ska' descchecksum = JumpAir
        <LoadFunction> <...> name = 'anims\thps6_skater_OnFoot\JumpAirTo5050.ska' descchecksum = JumpAirTo5050
        <LoadFunction> <...> name = 'anims\thps6_skater_OnFoot\JumpAirToAirIdle.ska' descchecksum = JumpAirToAirIdle
        <LoadFunction> <...> name = 'anims\thps6_skater_OnFoot\JumpAirToManual.ska' descchecksum = JumpAirToManual
        <LoadFunction> <...> name = 'anims\thps6_skater_OnFoot\JumpLandToRun.ska' descchecksum = JumpLandToRun
        <LoadFunction> <...> name = 'anims\thps6_skater_OnFoot\JumpLandToStand.ska' descchecksum = JumpLandToStand
        <LoadFunction> <...> name = 'anims\thps6_skater_OnFoot\LadderClimb.ska' descchecksum = LadderClimb
        <LoadFunction> <...> name = 'anims\thps6_skater_OnFoot\LadderClimbFromStandIdle.ska' descchecksum = LadderClimbFromStandIdle
        <LoadFunction> <...> name = 'anims\thps6_skater_OnFoot\LadderOntoTheTop.ska' descchecksum = LadderOntoTheTop
        <LoadFunction> <...> name = 'anims\thps6_skater_OnFoot\RunToJump.ska' descchecksum = runtojump
        <LoadFunction> <...> name = 'anims\thps6_skater_OnFoot\StandToHang.ska' descchecksum = StandToHang
        <LoadFunction> <...> name = 'anims\thps6_skater_OnFoot\StandToJump.ska' descchecksum = StandToJump
        <LoadFunction> <...> name = 'anims\thps6_skater_OnFoot\WRun.ska' descchecksum = Wrun
        <LoadFunction> <...> name = 'anims\thps6_skater_OnFoot\WRunToSkate.ska' descchecksum = WRunToSkate
        <LoadFunction> <...> name = 'anims\thps6_skater_OnFoot\WSkateToRun.ska' descchecksum = WSkateToRun
        <LoadFunction> <...> name = 'anims\thps6_skater_OnFoot\WStand.ska' descchecksum = WStand
        <LoadFunction> <...> name = 'anims\thps6_skater_OnFoot\WStandToRun.ska' descchecksum = WStandToRun
        <LoadFunction> <...> name = 'anims\thps6_skater_OnFoot\WStandToWalk.ska' descchecksum = WStandToWalk
        <LoadFunction> <...> name = 'anims\thps6_skater_OnFoot\WWalk.ska' descchecksum = WWalk
        <LoadFunction> <...> name = 'anims\thps6_skater_OnFoot\WWalkToStand.ska' descchecksum = WWalkToStand
        <LoadFunction> <...> name = 'anims\thps6_skater_OnFoot\WalkFast.ska' descchecksum = WalkFast
        <LoadFunction> <...> name = 'anims\thps6_skater_OnFoot\WalkSlow.ska' descchecksum = WalkSlow
        <LoadFunction> <...> name = 'anims\thps6_skater_OnFoot\_180RunSkid.ska' descchecksum = _180RunSkid
        <LoadFunction> <...> name = 'anims\thps6_skater_OnFoot\SkateToStand.ska' descchecksum = SkateToStand
        <LoadFunction> <...> name = 'anims\thps6_skater_OnFoot\SkateToWalk.ska' descchecksum = SkateToWalk
        <LoadFunction> <...> name = 'anims\thps6_skater_OnFoot\BrakeToStand.ska' descchecksum = BrakeToStand
    endif
    SetReferenceChecksum 0
endscript


script animload_THPS6_human_unloadable_20 LoadFunction = LoadAnim
    SetReferenceChecksum THPS6_human
    if <LoadFunction> <...> name = 'anims\thps6_skater_OnFoot\SlowSkateToStand.ska' descchecksum = SlowSkateToStand
        <LoadFunction> <...> name = 'anims\thps6_skater_OnFoot\JumpToSwingHang.ska' descchecksum = JumpToSwingHang
        <LoadFunction> <...> name = 'anims\thps6_skater_OnFoot\JumpToWallHang.ska' descchecksum = JumpToWallHang
        <LoadFunction> <...> name = 'anims\thps6_skater_OnFoot\LadderFastClimb.ska' descchecksum = LadderFastClimb
        <LoadFunction> <...> name = 'anims\thps6_skater_OnFoot\JumpAirToNoseManual.ska' descchecksum = JumpAirToNoseManual
        <LoadFunction> <...> name = 'anims\thps6_skater_OnFoot\JumpLandToWalk.ska' descchecksum = JumpLandToWalk
        <LoadFunction> <...> name = 'anims\thps6_skater_OnFoot\SkateToSkid.ska' descchecksum = SkateToSkid
    endif
    SetReferenceChecksum 0
endscript


script animload_THPS6_human_net LoadFunction = LoadAnim
    animload_THPS6_human_net_0 <...> 
    animload_THPS6_human_net_1 <...> 
    animload_THPS6_human_net_2 <...> 
    animload_THPS6_human_net_3 <...> 
    animload_THPS6_human_net_4 <...> 
    animload_THPS6_human_net_5 <...> 
    animload_THPS6_human_net_6 <...> 
    animload_THPS6_human_net_7 <...> 
    animload_THPS6_human_net_8 <...> 
    animload_THPS6_human_net_9 <...> 
    animload_THPS6_human_net_10 <...> 
    animload_THPS6_human_net_11 <...> 
    animload_THPS6_human_net_12 <...> 
    animload_THPS6_human_net_13 <...> 
    animload_THPS6_human_net_14 <...> 
    animload_THPS6_human_net_15 <...> 
    animload_THPS6_human_net_16 <...> 
    animload_THPS6_human_net_17 <...> 
    animload_THPS6_human_net_18 <...> 
endscript


script animload_THPS6_human_net_0 LoadFunction = LoadAnim
    SetReferenceChecksum THPS6_human
    if <LoadFunction> <...> name = 'anims\Ped_M_Idles\Ped_M_Idle1.ska' descchecksum = Ped_M_Idle1
        <LoadFunction> <...> name = 'anims\THPS6_skater_bails\RunOutQuick.ska' descchecksum = RunOutQuick
        <LoadFunction> <...> name = 'anims\THPS6_skater_bails\Bail_Falling_BCK.ska' descchecksum = Bail_Falling_BCK
        <LoadFunction> <...> name = 'anims\THPS6_skater_bails\Bail_Falling_FWD.ska' descchecksum = Bail_Falling_FWD
        <LoadFunction> <...> name = 'anims\THPS6_skater_bails\Bail_Falling_Hit_Hard_BCK.ska' descchecksum = Bail_Falling_Hit_Hard_BCK
        <LoadFunction> <...> name = 'anims\THPS6_skater_bails\Bail_Falling_Hit_Hard_FWD.ska' descchecksum = Bail_Falling_Hit_Hard_FWD
        <LoadFunction> <...> name = 'anims\THPS6_skater_bails\Bail_Falling_Hit_Med_BCK.ska' descchecksum = Bail_Falling_Hit_Med_BCK
        <LoadFunction> <...> name = 'anims\THPS6_skater_bails\Bail_Falling_Hit_Med_FWD.ska' descchecksum = Bail_Falling_Hit_Med_FWD
        <LoadFunction> <...> name = 'anims\THPS6_skater_bails\Bail_Falling_Idle_BCK.ska' descchecksum = Bail_Falling_Idle_BCK
        <LoadFunction> <...> name = 'anims\THPS6_skater_bails\Bail_Falling_Idle_FWD.ska' descchecksum = Bail_Falling_Idle_FWD
        <LoadFunction> <...> name = 'anims\THPS6_skater_bails\Bail_Falling_Idle_RT.ska' descchecksum = Bail_Falling_Idle_RT
        <LoadFunction> <...> name = 'anims\THPS6_skater_bails\Bail_Falling_RT.ska' descchecksum = Bail_Falling_RT
        <LoadFunction> <...> name = 'anims\THPS6_skater_bails\Bail_Falling_Slide_HitH_LTb.ska' descchecksum = Bail_Falling_Slide_HitH_LTb
        <LoadFunction> <...> name = 'anims\THPS6_skater_bails\Bail_Falling_Slide_HitH_LTf.ska' descchecksum = Bail_Falling_Slide_HitH_LTf
        <LoadFunction> <...> name = 'anims\THPS6_skater_bails\Bail_Falling_Slide_HitH_RTb.ska' descchecksum = Bail_Falling_Slide_HitH_RTb
        <LoadFunction> <...> name = 'anims\THPS6_skater_bails\Bail_Falling_Slide_HitH_RTf.ska' descchecksum = Bail_Falling_Slide_HitH_RTf
        <LoadFunction> <...> name = 'anims\THPS6_skater_bails\Bail_Falling_Slide_HitM_LTb.ska' descchecksum = Bail_Falling_Slide_HitM_LTb
        <LoadFunction> <...> name = 'anims\THPS6_skater_bails\Bail_Falling_Slide_HitM_LTf.ska' descchecksum = Bail_Falling_Slide_HitM_LTf
        <LoadFunction> <...> name = 'anims\THPS6_skater_bails\Bail_Falling_Slide_HitM_RTb.ska' descchecksum = Bail_Falling_Slide_HitM_RTb
        <LoadFunction> <...> name = 'anims\THPS6_skater_bails\Bail_Falling_Slide_HitM_RTf.ska' descchecksum = Bail_Falling_Slide_HitM_RTf
        <LoadFunction> <...> name = 'anims\THPS6_skater_bails\Bail_Falling_Slide_Idle_LTb.ska' descchecksum = Bail_Falling_Slide_Idle_LTb
        <LoadFunction> <...> name = 'anims\THPS6_skater_bails\Bail_Falling_Slide_Idle_LTf.ska' descchecksum = Bail_Falling_Slide_Idle_LTf
        <LoadFunction> <...> name = 'anims\THPS6_skater_bails\Bail_Falling_Slide_Idle_RTb.ska' descchecksum = Bail_Falling_Slide_Idle_RTb
        <LoadFunction> <...> name = 'anims\THPS6_skater_bails\Bail_Falling_Slide_Idle_RTf.ska' descchecksum = Bail_Falling_Slide_Idle_RTf
        <LoadFunction> <...> name = 'anims\THPS6_skater_bails\Bail_Falling_Slide_LTb.ska' descchecksum = Bail_Falling_Slide_LTb
        <LoadFunction> <...> name = 'anims\THPS6_skater_bails\Bail_Falling_Slide_LTf.ska' descchecksum = Bail_Falling_Slide_LTf
        <LoadFunction> <...> name = 'anims\THPS6_skater_bails\Bail_Falling_Slide_RTb.ska' descchecksum = Bail_Falling_Slide_RTb
        <LoadFunction> <...> name = 'anims\THPS6_skater_bails\Bail_Falling_Slide_RTf.ska' descchecksum = Bail_Falling_Slide_RTf
        <LoadFunction> <...> name = 'anims\THPS6_skater_bails\Bail_Falling_Slide_BCK.ska' descchecksum = Bail_Falling_Slide_BCK
        <LoadFunction> <...> name = 'anims\THPS6_skater_bails\Bail_Falling_Slide_Idle_BCK.ska' descchecksum = Bail_Falling_Slide_Idle_BCK
        <LoadFunction> <...> name = 'anims\THPS6_skater_bails\Bail_Falling_Slide_HitM_BCK.ska' descchecksum = Bail_Falling_Slide_HitM_BCK
        <LoadFunction> <...> name = 'anims\THPS6_skater_bails\Bail_Falling_Slide_HitH_BCK.ska' descchecksum = Bail_Falling_Slide_HitH_BCK
        <LoadFunction> <...> name = 'anims\THPS6_skater_bails\Bail_Falling_LT.ska' descchecksum = Bail_Falling_LT
        <LoadFunction> <...> name = 'anims\THPS6_skater_bails\Bail_Falling_Idle_LT.ska' descchecksum = Bail_Falling_Idle_LT
        <LoadFunction> <...> name = 'anims\THPS6_skater_bails\Bail_Falling_Hit_Hard.ska' descchecksum = Bail_Falling_Hit_Hard
        <LoadFunction> <...> name = 'anims\THPS6_skater_bails\Bail_Falling_Hit_Med.ska' descchecksum = Bail_Falling_Hit_Med
        <LoadFunction> <...> name = 'anims\THPS6_Bail_GetUp\GetUp_HK_Ft.ska' descchecksum = GetUp_HK_Ft
        <LoadFunction> <...> name = 'anims\THPS6_Bail_GetUp\GetUp_S_BoardCatch1.ska' descchecksum = GetUp_S_BoardCatch1
        <LoadFunction> <...> name = 'anims\THPS6_Bail_GetUp\GetUp_S_RunJump.ska' descchecksum = GetUp_S_RunJump
        <LoadFunction> <...> name = 'anims\THPS6_Bail_GetUp\GetUp_S_BoardFlip1.ska' descchecksum = GetUp_S_BoardFlip1
        <LoadFunction> <...> name = 'anims\THPS6_Bail_GetUp\GetUp_HK_Ft_Q.ska' descchecksum = GetUp_HK_Ft_Q
        <LoadFunction> <...> name = 'anims\THPS6_Bail_GetUp\GetUp_Sit_Ft.ska' descchecksum = GetUp_Sit_Ft
        <LoadFunction> <...> name = 'anims\THPS6_Bail_GetUp\GetUp_Sit_Ft_T.ska' descchecksum = GetUp_Sit_Ft_T
        <LoadFunction> <...> name = 'anims\THPS6_Bail_GetUp\GetUp_Sit_Ft_Q.ska' descchecksum = GetUp_Sit_Ft_Q
        <LoadFunction> <...> name = 'anims\THPS6_Bail_GetUp\GetUp_HK_Lt.ska' descchecksum = GetUp_HK_Lt
        <LoadFunction> <...> name = 'anims\THPS6_Bail_GetUp\GetUp_HK_Lt_T.ska' descchecksum = GetUp_HK_Lt_T
        <LoadFunction> <...> name = 'anims\THPS6_Bail_GetUp\GetUp_HK_Lt_Q.ska' descchecksum = GetUp_HK_Lt_Q
        <LoadFunction> <...> name = 'anims\THPS6_Bail_GetUp\GetUp_HK_Bk.ska' descchecksum = GetUp_HK_Bk
        <LoadFunction> <...> name = 'anims\THPS6_Bail_GetUp\GetUp_HK_Bk_T.ska' descchecksum = GetUp_HK_Bk_T
        <LoadFunction> <...> name = 'anims\THPS6_Bail_GetUp\GetUp_HK_Bk_Q.ska' descchecksum = GetUp_HK_Bk_Q
    endif
    SetReferenceChecksum 0
endscript


script animload_THPS6_human_net_1 LoadFunction = LoadAnim
    SetReferenceChecksum THPS6_human
    if <LoadFunction> <...> name = 'anims\THPS6_Bail_GetUp\GetUp_HK_Rt_T.ska' descchecksum = GetUp_HK_Rt_T
        <LoadFunction> <...> name = 'anims\THPS6_Bail_GetUp\GetUp_HK_Rt_Q.ska' descchecksum = GetUp_HK_Rt_Q
        <LoadFunction> <...> name = 'anims\THPS6_Bail_GetUp\GetUp_HK_Rt.ska' descchecksum = GetUp_HK_Rt
        <LoadFunction> <...> name = 'anims\THPS6_Bail_GetUp\GetUp_S_Turn180.ska' descchecksum = GetUp_S_Turn180
        <LoadFunction> <...> name = 'anims\THPS6_Bail_GetUp\GetUp_S_NoPushOff.ska' descchecksum = GetUp_S_NoPushOff
        <LoadFunction> <...> name = 'anims\THPS6_skater_bails\Bail_Manual_BK.ska' descchecksum = Bail_Manual_BK
        <LoadFunction> <...> name = 'anims\THPS6_skater_bails\Bail_Manual_BK_fast.ska' descchecksum = Bail_Manual_BK_fast
        <LoadFunction> <...> name = 'anims\THPS6_skater_bails\Bail_Manual_FT.ska' descchecksum = Bail_Manual_FT
        <LoadFunction> <...> name = 'anims\THPS6_skater_bails\Bail_Manual_FT_fast.ska' descchecksum = Bail_Manual_FT_fast
        <LoadFunction> <...> name = 'anims\THPS6_skater_bails\Nutsac.ska' descchecksum = Nutsac
        <LoadFunction> <...> name = 'anims\THPS6_skater_bails\Bail_Nutter_FWD.ska' descchecksum = Bail_Nutter_FWD
        <LoadFunction> <...> name = 'anims\THPS6_skater_bails\Bail_Nutter_BCK.ska' descchecksum = Bail_Nutter_BCK
        <LoadFunction> <...> name = 'anims\THPS6_skater_bails\Bail_Pitch_Nose.ska' descchecksum = Bail_Pitch_Nose
        <LoadFunction> <...> name = 'anims\THPS6_skater_bails\Bail_Pitch_Back.ska' descchecksum = Bail_Pitch_Back
        <LoadFunction> <...> name = 'anims\THPS6_skater_bails\Bail_Pitch_Face.ska' descchecksum = Bail_Pitch_Face
        <LoadFunction> <...> name = 'anims\THPS6_skater_bails\Bail_Pitch_Tail.ska' descchecksum = Bail_Pitch_Tail
        <LoadFunction> <...> name = 'anims\THPS6_skater_bails\Bail_Ramp_Lt.ska' descchecksum = Bail_Ramp_Lt
        <LoadFunction> <...> name = 'anims\THPS6_skater_bails\Bail_Ramp_Rt.ska' descchecksum = Bail_Ramp_Rt
        <LoadFunction> <...> name = 'anims\THPS6_skater_bails\Bail_Ramp_Bk_Hd.ska' descchecksum = Bail_Ramp_Bk_Hd
        <LoadFunction> <...> name = 'anims\THPS6_skater_bails\Bail_Ramp_Rt_Med.ska' descchecksum = Bail_Ramp_Rt_Med
        <LoadFunction> <...> name = 'anims\THPS6_skater_bails\Bail_Ramp_Lt_Med.ska' descchecksum = Bail_Ramp_Lt_Med
        <LoadFunction> <...> name = 'anims\THPS6_skater_bails\Bail_Ramp_Bk.ska' descchecksum = Bail_Ramp_Bk
        <LoadFunction> <...> name = 'anims\THPS6_skater_bails\Bail_Ramp_Ft_Hd.ska' descchecksum = Bail_Ramp_Ft_Hd
        <LoadFunction> <...> name = 'anims\THPS6_skater_bails\Bail_Ramp_Ft_Med.ska' descchecksum = Bail_Ramp_Ft_Med
        <LoadFunction> <...> name = 'anims\THPS6_skater_bails\Bail_Ramp_Ft.ska' descchecksum = Bail_Ramp_Ft
        <LoadFunction> <...> name = 'anims\THPS6_Skater_bails\Bail_Ramp_Lt_Hd.ska' descchecksum = Bail_Ramp_Lt_Hd
        <LoadFunction> <...> name = 'anims\THPS6_skater_bails\Bail_Ramp_Rt_Hd.ska' descchecksum = Bail_Ramp_Rt_Hd
        <LoadFunction> <...> name = 'anims\THPS6_skater_bails\Bail_RunOut_Old.ska' descchecksum = Bail_RunOut_Old
        <LoadFunction> <...> name = 'anims\THPS6_skater_bails\Bail_RunOut_New_A.ska' descchecksum = Bail_RunOut_New_A
        <LoadFunction> <...> name = 'anims\THPS6_skater_bails\RunOut_Drop_Idle.ska' descchecksum = RunOut_Drop_Idle
        <LoadFunction> <...> name = 'anims\THPS6_skater_bails\RunOut_Drop_Land_Med.ska' descchecksum = RunOut_Drop_Land_Med
        <LoadFunction> <...> name = 'anims\THPS6_skater_bails\Bail_Spin_CCW_Hard.ska' descchecksum = Bail_Spin_CCW_Hard
        <LoadFunction> <...> name = 'anims\THPS6_skater_bails\Bail_Spin_CW_Hard.ska' descchecksum = Bail_Spin_CW_Hard
        <LoadFunction> <...> name = 'anims\THPS6_skater_bails\Bail_Spin_CCW_Hard_B.ska' descchecksum = Bail_Spin_CCW_Hard_B
        <LoadFunction> <...> name = 'anims\THPS6_skater_bails\Bail_Spin_CCW_Hard_C.ska' descchecksum = Bail_Spin_CCW_Hard_C
        <LoadFunction> <...> name = 'anims\THPS6_skater_bails\Bail_Spin_CW_Hard_B.ska' descchecksum = Bail_Spin_CW_Hard_B
        <LoadFunction> <...> name = 'anims\THPS6_skater_bails\Bail_Spin_CW_Hard_A.ska' descchecksum = Bail_Spin_CW_Hard_A
        <LoadFunction> <...> name = 'anims\THPS6_skater_bails\Bail_Spin_FWD_Regular.ska' descchecksum = Bail_Spin_FWD_Regular
        <LoadFunction> <...> name = 'anims\THPS6_skater_bails\Bail_Spin_FWD_Hard.ska' descchecksum = Bail_Spin_FWD_Hard
        <LoadFunction> <...> name = 'anims\THPS6_skater_bails\Bail_Spin_FWD_Fast.ska' descchecksum = Bail_Spin_FWD_Fast
        <LoadFunction> <...> name = 'anims\THPS6_skater_bails\Bail_Spin_BCK_Regular.ska' descchecksum = Bail_Spin_BCK_Regular
        <LoadFunction> <...> name = 'anims\THPS6_skater_bails\Bail_Spin_BCK_Fast.ska' descchecksum = Bail_Spin_BCK_Fast
        <LoadFunction> <...> name = 'anims\THPS6_skater_bails\Bail_Spin_BCK_Hard.ska' descchecksum = Bail_Spin_BCK_Hard
        <LoadFunction> <...> name = 'anims\THPS6_skater_tantrums\Tantrum_DiscusStart.ska' descchecksum = Tantrum_DiscusStart
        <LoadFunction> <...> name = 'anims\THPS6_skater_tantrums\Tantrum_DiscusFinish.ska' descchecksum = Tantrum_DiscusFinish
        <LoadFunction> <...> name = 'anims\THPS6_skater_tantrums\Tantrum_KickBoard.ska' descchecksum = Tantrum_KickBoard
        <LoadFunction> <...> name = 'anims\THPS6_skater_tantrums\Tantrum_HeadButt.ska' descchecksum = Tantrum_HeadButt
        <LoadFunction> <...> name = 'anims\THPS6_skater_tantrums\Tantrum_SlingShot.ska' descchecksum = Tantrum_SlingShot
        <LoadFunction> <...> name = 'anims\THPS6_skater_tantrums\Tantrum_PileDriver.ska' descchecksum = Tantrum_PileDriver
        <LoadFunction> <...> name = 'anims\THPS6_skater_tantrums\Tantrum_BoardFocus.ska' descchecksum = Tantrum_BoardFocus
    endif
    SetReferenceChecksum 0
endscript


script animload_THPS6_human_net_2 LoadFunction = LoadAnim
    SetReferenceChecksum THPS6_human
    if <LoadFunction> <...> name = 'anims\thps6_skater_OnFoot\WalkingBail.ska' descchecksum = WalkingBail
        <LoadFunction> <...> name = 'anims\thps6_skater_OnFoot\WalkingBailGetUp.ska' descchecksum = WalkingBailGetUp
        <LoadFunction> <...> name = 'anims\THPS6_Skater_Bails\Bail_Wall_FWD_Regular.ska' descchecksum = Bail_Wall_FWD_Regular
        <LoadFunction> <...> name = 'anims\THPS6_Skater_Bails\Bail_Wall_FWD_Low.ska' descchecksum = Bail_Wall_FWD_Low
        <LoadFunction> <...> name = 'anims\THPS6_Skater_Bails\Bail_Wall_BCK_Regular.ska' descchecksum = Bail_Wall_BCK_Regular
        <LoadFunction> <...> name = 'anims\THPS6_Skater_Bails\Bail_Wall_BCK_Low.ska' descchecksum = Bail_Wall_BCK_Low
        <LoadFunction> <...> name = 'anims\THPS6_Skater_Bails\Bail_Wall_LT_Low.ska' descchecksum = Bail_Wall_LT_Low
        <LoadFunction> <...> name = 'anims\THPS6_Skater_Bails\Bail_Wall_RT_Low.ska' descchecksum = Bail_Wall_RT_Low
        <LoadFunction> <...> name = 'anims\THPS6_skater_misc\GrabBar_accel_Fwd.ska' descchecksum = GrabBar_accel_Fwd
        <LoadFunction> <...> name = 'anims\THPS6_skater_misc\GrabBar_idle_Fwd.ska' descchecksum = GrabBar_idle_Fwd
        <LoadFunction> <...> name = 'anims\THPS6_skater_misc\GrabBar_Release_Fwd.ska' descchecksum = GrabBar_Release_Fwd
        <LoadFunction> <...> name = 'anims\THPS6_skater_misc\GrabBar_accel_Up.ska' descchecksum = GrabBar_accel_Up
        <LoadFunction> <...> name = 'anims\THPS6_skater_misc\GrabBar_Idle_up.ska' descchecksum = GrabBar_idle_Up
        <LoadFunction> <...> name = 'anims\THPS6_skater_misc\GrabBar_Release_Up.ska' descchecksum = GrabBar_Release_Up
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\AirIdle.ska' descchecksum = AirIdle
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\AirTurnLeft.ska' descchecksum = AirTurnLeft
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\AirTurnRight.ska' descchecksum = AirTurnRight
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\Beanplant.ska' descchecksum = Beanplant
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\Boneless.ska' descchecksum = Boneless
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\Brake.ska' descchecksum = Brake
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\BrakeDefeat.ska' descchecksum = BrakeDefeat
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\BrakeIdle.ska' descchecksum = BrakeIdle
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\BSPowerslide.ska' descchecksum = BSPowerslide
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\CessSlide180_BS.ska' descchecksum = CessSlide180_BS
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\CessSlide180_FS.ska' descchecksum = CessSlide180_FS
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\CessSlide180_FS2.ska' descchecksum = CessSlide180_FS2
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\Cheer1.ska' descchecksum = Cheer1
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\Cheer2.ska' descchecksum = Cheer2
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\Crouch.ska' descchecksum = crouch
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\Crouch2InAir.ska' descchecksum = Crouch2InAir
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\CrouchBumpDown.ska' descchecksum = CrouchBumpDown
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\CrouchBumpUp.ska' descchecksum = CrouchBumpUp
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\CrouchCessSlide180_BS.ska' descchecksum = CrouchCessSlide180_BS
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\CrouchCessSlide180_FS.ska' descchecksum = CrouchCessSlide180_FS
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\CrouchedLand.ska' descchecksum = CrouchedLand
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\CrouchIdle.ska' descchecksum = CrouchIdle
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\CrouchIdle2.ska' descchecksum = CrouchIdle2
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\CrouchIdle4.ska' descchecksum = CrouchIdle4
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\CrouchIdleAdjustFeet.ska' descchecksum = CrouchIdleAdjustFeet
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\CrouchIdleFromIdle.ska' descchecksum = CrouchIdleFromIdle
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\CrouchIdleToIdle.ska' descchecksum = CrouchIdleToIdle
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\CrouchLookDown.ska' descchecksum = CrouchLookDown
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\CrouchLookLeft.ska' descchecksum = CrouchLookLeft
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\CrouchLookRight.ska' descchecksum = CrouchLookRight
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\CrouchPush1.ska' descchecksum = CrouchPush1
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\CrouchShiftFoot.ska' descchecksum = CrouchShiftFoot
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\CrouchToNollie.ska' descchecksum = CrouchToNollie
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\CrouchTurnLeft.ska' descchecksum = CrouchTurnLeft
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\CrouchTurnLeft2.ska' descchecksum = CrouchTurnLeft2
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\CrouchTurnLeftIdle.ska' descchecksum = CrouchTurnLeftIdle
    endif
    SetReferenceChecksum 0
endscript


script animload_THPS6_human_net_3 LoadFunction = LoadAnim
    SetReferenceChecksum THPS6_human
    if <LoadFunction> <...> name = 'anims\THPS6_skater_basics\CrouchTurnLeftIdle2.ska' descchecksum = CrouchTurnLeftIdle2
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\CrouchTurnRight.ska' descchecksum = CrouchTurnRight
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\CrouchTurnRight2.ska' descchecksum = CrouchTurnRight2
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\CrouchTurnRightIdle.ska' descchecksum = CrouchTurnRightIdle
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\CrouchTurnRightIdle2.ska' descchecksum = CrouchTurnRightIdle2
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\DropIn.ska' descchecksum = DropIn
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\Fastplant.ska' descchecksum = Fastplant
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\FlailLeft.ska' descchecksum = FlailLeft
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\FlailLeft2.ska' descchecksum = FlailLeft2
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\FlailLeftCrouched2.ska' descchecksum = FlailLeftCrouched2
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\FlailLeftCrouched3.ska' descchecksum = FlailLeftCrouched3
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\FlailLeftCrouched_Small.ska' descchecksum = FlailLeftCrouched_Small
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\FlailRight.ska' descchecksum = FlailRight
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\FlailRight2.ska' descchecksum = FlailRight2
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\FlailRightCrouched2.ska' descchecksum = FlailRightCrouched2
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\FlailRightCrouched3.ska' descchecksum = FlailRightCrouched3
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\FlailRightCrouched_Small.ska' descchecksum = FlailRightCrouched_Small
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\FSPowerslide.ska' descchecksum = FSPowerslide
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\Idle.ska' descchecksum = idle
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\Idle2InAir.ska' descchecksum = Idle2InAir
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\Land.ska' descchecksum = land
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\Land2.ska' descchecksum = Land2
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\Land3.ska' descchecksum = Land3
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\Manual.ska' descchecksum = Manual
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\Manual_Range.ska' descchecksum = Manual_Range
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\Manual_Range2.ska' descchecksum = Manual_Range2
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\Manual_Range3.ska' descchecksum = Manual_Range3
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\ManualFromAir.ska' descchecksum = ManualFromAir
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\MongoBrakeIdle.ska' descchecksum = MongoBrakeIdle
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\MongoPush.ska' descchecksum = MongoPush
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\MongoPushCycle.ska' descchecksum = MongoPushCycle
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\MullenStart.ska' descchecksum = MullenStart
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\NewBrake.ska' descchecksum = NewBrake
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\NewBrake_Mongo.ska' descchecksum = NewBrake_Mongo
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\NewBrakeIdle.ska' descchecksum = NewBrakeIdle
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\NewBrakeIdle2.ska' descchecksum = NewBrakeIdle2
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\NewBrakeIdle3.ska' descchecksum = NewBrakeIdle3
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\NewBrakeIdle4.ska' descchecksum = NewBrakeIdle4
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\NewBrakeIdle6.ska' descchecksum = NewBrakeIdle6
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\NewBrakeIdle7.ska' descchecksum = NewBrakeIdle7
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\NewBrakeIdle8.ska' descchecksum = NewBrakeIdle8
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\NewBrakeIdleToIdle.ska' descchecksum = NewBrakeIdleToIdle
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\NewBrakeTurnLeft.ska' descchecksum = NewBrakeTurnLeft
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\NewBrakeTurnRight.ska' descchecksum = NewBrakeTurnRight
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\NoComply.ska' descchecksum = NoComply
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\Nollie.ska' descchecksum = Nollie
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\NollieCrouchIdle.ska' descchecksum = NollieCrouchIdle
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\NollieCrouchTurnLeft.ska' descchecksum = NollieCrouchTurnLeft
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\NollieCrouchTurnRight.ska' descchecksum = NollieCrouchTurnRight
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\NollieSkatingIdle.ska' descchecksum = NollieSkatingIdle
    endif
    SetReferenceChecksum 0
endscript


script animload_THPS6_human_net_4 LoadFunction = LoadAnim
    SetReferenceChecksum THPS6_human
    if <LoadFunction> <...> name = 'anims\THPS6_skater_basics\NollieSkatingTurnLeft.ska' descchecksum = NollieSkatingTurnLeft
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\NollieSkatingTurnRight.ska' descchecksum = NollieSkatingTurnRight
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\NoseManual.ska' descchecksum = NoseManual
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\NoseManual_range.ska' descchecksum = NoseManual_range
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\NoseManual_Range2.ska' descchecksum = NoseManual_Range2
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\NoseManualFromAir.ska' descchecksum = NoseManualFromAir
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\Ollie.ska' descchecksum = ollie
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\Prop.ska' descchecksum = prop
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\Push.ska' descchecksum = push
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\PushCycle.ska' descchecksum = PushCycle
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\PushCycleArms1.ska' descchecksum = PushCycleArms1
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\PushCycleArms2.ska' descchecksum = PushCycleArms2
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\PushCycleArms3.ska' descchecksum = PushCycleArms3
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\PushCycleArms4.ska' descchecksum = PushCycleArms4
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\PushCycleArms5.ska' descchecksum = PushCycleArms5
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\PushIdle.ska' descchecksum = PushIdle
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\PutDownManual.ska' descchecksum = PutDownManual
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\PutDownNoseManual.ska' descchecksum = PutDownNoseManual
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\RevertBS.ska' descchecksum = RevertBS
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\RevertFS.ska' descchecksum = RevertFS
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\SkatingToNollie.ska' descchecksum = SkatingToNollie
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\SketchyCrouchLand.ska' descchecksum = SketchyCrouchLand
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\SketchyLand.ska' descchecksum = SketchyLand
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\SketchyLand1.ska' descchecksum = SketchyLand1
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\SkitchInit.ska' descchecksum = SkitchInit
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\SkitchRange.ska' descchecksum = SkitchRange
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\SlapAir.ska' descchecksum = SlapAir
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\SlapRight.ska' descchecksum = SlapRight
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\SlowDownBrake.ska' descchecksum = SlowDownBrake
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\SlowDownBrake_Mongo.ska' descchecksum = SlowDownBrake_Mongo
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\SpineTransfer.ska' descchecksum = SpineTransfer
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\StandingLandTurn.ska' descchecksum = StandingLandTurn
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\StartSkating1.ska' descchecksum = StartSkating1
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\StretchLegsInit.ska' descchecksum = StretchLegsInit
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\Taunt1.ska' descchecksum = Taunt1
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\Taunt2.ska' descchecksum = Taunt2
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\Taunt3.ska' descchecksum = Taunt3
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\TurnLeft.ska' descchecksum = TurnLeft
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\TurnLeftIdle.ska' descchecksum = TurnLeftIdle
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\TurnRight.ska' descchecksum = TurnRight
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\TurnRightIdle.ska' descchecksum = TurnRightIdle
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\WallRideBackLoop.ska' descchecksum = WallRideBackLoop
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\WallRideBackTrans.ska' descchecksum = WallRideBackTrans
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\WallRideFrontLoop.ska' descchecksum = WallRideFrontLoop
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\WallRideFrontTrans.ska' descchecksum = WallRideFrontTrans
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\ToTail_In.ska' descchecksum = ToTail_In
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\ToTail_Out.ska' descchecksum = ToTail_Out
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\ToTail_Idle.ska' descchecksum = ToTail_Idle
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\WallPlant_Crouched.ska' descchecksum = WallPlant_Crouched
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\WallPlant_Standing.ska' descchecksum = WallPlant_Standing
    endif
    SetReferenceChecksum 0
endscript


script animload_THPS6_human_net_5 LoadFunction = LoadAnim
    SetReferenceChecksum THPS6_human
    if <LoadFunction> <...> name = 'anims\THPS6_skater_basics\WallPlant_Manual.ska' descchecksum = WallPlant_Manual
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\WallPlant_NoseManual.ska' descchecksum = WallPlant_NoseManual
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\CrouchToPressure.ska' descchecksum = CrouchToPressure
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\SkateToPressure.ska' descchecksum = SkateToPressure
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\AirIdleCAT.ska' descchecksum = AirIdleCAT
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\BrakeIdle_Start.ska' descchecksum = BrakeIdle_Start
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\BrakeIdle_Start_Mongo.ska' descchecksum = BrakeIdle_Start_Mongo
        <LoadFunction> <...> name = 'anims\Cloth\Cloth_Land_Partial.ska' descchecksum = Cloth_Land_Partial
        <LoadFunction> <...> name = 'anims\Cloth\Cloth_AIrFlow_Partial.ska' descchecksum = Cloth_AIrFlow_Partial
        <LoadFunction> <...> name = 'anims\PED_CrappySkate\CrouchIdle_Crappy.ska' descchecksum = CrouchIdle_Crappy
        <LoadFunction> <...> name = 'anims\PED_CrappySkate\CrouchTurnLeft_Crappy.ska' descchecksum = CrouchTurnLeft_Crappy
        <LoadFunction> <...> name = 'anims\PED_CrappySkate\CrouchTurnLeftIdle_Crappy.ska' descchecksum = CrouchTurnLeftIdle_Crappy
        <LoadFunction> <...> name = 'anims\PED_CrappySkate\CrouchTurnRight_Crappy.ska' descchecksum = CrouchTurnRight_Crappy
        <LoadFunction> <...> name = 'anims\PED_CrappySkate\CrouchTurnRightIdle_Crappy.ska' descchecksum = CrouchTurnRightIdle_Crappy
        <LoadFunction> <...> name = 'anims\PED_CrappySkate\TurnLeft_Crappy.ska' descchecksum = TurnLeft_Crappy
        <LoadFunction> <...> name = 'anims\PED_CrappySkate\TurnLeftIdle_Crappy.ska' descchecksum = TurnLeftIdle_Crappy
        <LoadFunction> <...> name = 'anims\PED_CrappySkate\TurnRight_Crappy.ska' descchecksum = TurnRight_Crappy
        <LoadFunction> <...> name = 'anims\PED_CrappySkate\TurnRightIdle_Crappy.ska' descchecksum = TurnRightIdle_Crappy
        <LoadFunction> <...> name = 'anims\PED_CrappySkate\CrouchBumpDown_Crappy.ska' descchecksum = CrouchBumpDown_Crappy
        <LoadFunction> <...> name = 'anims\PED_CrappySkate\CrouchBumpUp_Crappy.ska' descchecksum = CrouchBumpUp_Crappy
        <LoadFunction> <...> name = 'anims\THPS6_Basics\Default.ska' descchecksum = default
        <LoadFunction> <...> name = 'anims\THPS6_skater_flatland\_360FlipNoseManual.ska' descchecksum = _360FlipNoseManual
        <LoadFunction> <...> name = 'anims\THPS6_skater_flatland\AntiCasper_Init.ska' descchecksum = AntiCasper_Init
        <LoadFunction> <...> name = 'anims\THPS6_skater_flatland\AntiCasper_Out.ska' descchecksum = AntiCasper_Out
        <LoadFunction> <...> name = 'anims\THPS6_skater_flatland\AntiCasper_Range.ska' descchecksum = AntiCasper_Range
        <LoadFunction> <...> name = 'anims\THPS6_skater_flatland\AntiCasperFlip.ska' descchecksum = AntiCasperFlip
        <LoadFunction> <...> name = 'anims\THPS6_skater_flatland\Casper_Init.ska' descchecksum = Casper_Init
        <LoadFunction> <...> name = 'anims\THPS6_skater_flatland\Casper_Out.ska' descchecksum = Casper_Out
        <LoadFunction> <...> name = 'anims\THPS6_skater_flatland\Casper_Range.ska' descchecksum = Casper_Range
        <LoadFunction> <...> name = 'anims\THPS6_skater_flatland\CasperFlip.ska' descchecksum = CasperFlip
        <LoadFunction> <...> name = 'anims\THPS6_skater_flatland\GTurn.ska' descchecksum = GTurn
        <LoadFunction> <...> name = 'anims\THPS6_skater_flatland\GTurn2.ska' descchecksum = GTurn2
        <LoadFunction> <...> name = 'anims\THPS6_skater_flatland\HalfCabImpossible.ska' descchecksum = HalfCabImpossible
        <LoadFunction> <...> name = 'anims\THPS6_skater_flatland\HandstandHandFlip_Init.ska' descchecksum = HandstandHandFlip_Init
        <LoadFunction> <...> name = 'anims\THPS6_skater_flatland\HandstandHandFlip_Out.ska' descchecksum = HandstandHandFlip_Out
        <LoadFunction> <...> name = 'anims\THPS6_skater_flatland\HandstandHandFlip_Range.ska' descchecksum = HandstandHandFlip_Range
        <LoadFunction> <...> name = 'anims\THPS6_skater_flatland\HStandFliptoHstand.ska' descchecksum = HStandFliptoHstand
        <LoadFunction> <...> name = 'anims\THPS6_skater_flatland\OneFootManual_Init.ska' descchecksum = OneFootManual_Init
        <LoadFunction> <...> name = 'anims\THPS6_skater_flatland\OneFootManual_Range.ska' descchecksum = OneFootManual_Range
        <LoadFunction> <...> name = 'anims\THPS6_skater_flatland\OneFootNoseManual_Init.ska' descchecksum = OneFootNoseManual_Init
        <LoadFunction> <...> name = 'anims\THPS6_skater_flatland\OneFootNoseManual_Range.ska' descchecksum = OneFootNoseManual_Range
        <LoadFunction> <...> name = 'anims\THPS6_skater_flatland\Pogo_Bounce.ska' descchecksum = Pogo_Bounce
        <LoadFunction> <...> name = 'anims\THPS6_skater_flatland\Pogo_Init.ska' descchecksum = Pogo_Init
        <LoadFunction> <...> name = 'anims\THPS6_skater_flatland\Pogo_Kickfoot.ska' descchecksum = Pogo_Kickfoot
        <LoadFunction> <...> name = 'anims\THPS6_skater_flatland\Pogo_Out.ska' descchecksum = Pogo_Out
        <LoadFunction> <...> name = 'anims\THPS6_skater_flatland\RailFlip.ska' descchecksum = RailFlip
        <LoadFunction> <...> name = 'anims\THPS6_skater_flatland\TruckRun.ska' descchecksum = TruckRun
        <LoadFunction> <...> name = 'anims\THPS6_skater_flatland\TruckRun_Init.ska' descchecksum = TruckRun_Init
        <LoadFunction> <...> name = 'anims\THPS6_skater_flatland\TruckRun_Out.ska' descchecksum = TruckRun_Out
        <LoadFunction> <...> name = 'anims\THPS6_skater_flatland\TruckRunFlip.ska' descchecksum = TruckRunFlip
    endif
    SetReferenceChecksum 0
endscript


script animload_THPS6_human_net_6 LoadFunction = LoadAnim
    SetReferenceChecksum THPS6_human
    if <LoadFunction> <...> name = 'anims\THPS6_skater_flatland\Truckstand_Flip.ska' descchecksum = Truckstand_Flip
        <LoadFunction> <...> name = 'anims\THPS6_skater_flatland\Truckstand_Init.ska' descchecksum = Truckstand_Init
        <LoadFunction> <...> name = 'anims\THPS6_skater_flatland\Truckstand_Out.ska' descchecksum = Truckstand_Out
        <LoadFunction> <...> name = 'anims\THPS6_skater_flatland\Truckstand_Range.ska' descchecksum = Truckstand_Range
        <LoadFunction> <...> name = 'anims\THPS6_skater_flipgrab\KickFlipBlendFS.ska' descchecksum = KickFlipBlendFS
        <LoadFunction> <...> name = 'anims\THPS6_skater_flipgrab\KickFlipBlendBS.ska' descchecksum = KickFlipBlendBS
        <LoadFunction> <...> name = 'anims\THPS6_skater_flipgrab\HeelFlipVarialLien.ska' descchecksum = HeelFlipVarialLien
        <LoadFunction> <...> name = 'anims\THPS6_skater_flipgrab\_180Varial.ska' descchecksum = _180Varial
        <LoadFunction> <...> name = 'anims\THPS6_skater_flipgrab\_360Varial.ska' descchecksum = _360Varial
        <LoadFunction> <...> name = 'anims\THPS6_skater_flipgrab\FingerFlipVert.ska' descchecksum = FingerFlipVert
        <LoadFunction> <...> name = 'anims\THPS6_skater_flipgrab\SalFlip.ska' descchecksum = SalFlip
        <LoadFunction> <...> name = 'anims\THPS6_skater_flipgrab\BenihanaFingerFlip.ska' descchecksum = BenihanaFingerFlip
        <LoadFunction> <...> name = 'anims\THPS6_skater_flipgrab\DoubleFingerFlipVert.ska' descchecksum = DoubleFingerFlipVert
        <LoadFunction> <...> name = 'anims\THPS6_skater_flipgrab\DoubleSalFlip.ska' descchecksum = DoubleSalFlip
        <LoadFunction> <...> name = 'anims\THPS6_skater_fliptricks\_360Flip.ska' descchecksum = _360Flip
        <LoadFunction> <...> name = 'anims\THPS6_skater_fliptricks\_360HardFlip.ska' descchecksum = _360HardFlip
        <LoadFunction> <...> name = 'anims\THPS6_skater_fliptricks\_360InwardHeelFlip.ska' descchecksum = _360InwardHeelflip
        <LoadFunction> <...> name = 'anims\THPS6_skater_fliptricks\_360ShoveIt.ska' descchecksum = _360ShoveIt
        <LoadFunction> <...> name = 'anims\THPS6_skater_fliptricks\_540ShoveIt.ska' descchecksum = _540ShoveIt
        <LoadFunction> <...> name = 'anims\THPS6_skater_fliptricks\BigSpinFlip.ska' descchecksum = BigSpinFlip
        <LoadFunction> <...> name = 'anims\THPS6_skater_fliptricks\BSBigSpin.ska' descchecksum = BSBigSpin
        <LoadFunction> <...> name = 'anims\THPS6_skater_fliptricks\BSFlip.ska' descchecksum = BSFlip
        <LoadFunction> <...> name = 'anims\THPS6_skater_fliptricks\DoubleFrontFootImposs.ska' descchecksum = DoubleFrontFootImposs
        <LoadFunction> <...> name = 'anims\THPS6_skater_fliptricks\DoubleHeelFlip.ska' descchecksum = DoubleHeelFlip
        <LoadFunction> <...> name = 'anims\THPS6_skater_fliptricks\DoubleImpossible.ska' descchecksum = DoubleImpossible
        <LoadFunction> <...> name = 'anims\THPS6_skater_fliptricks\DoubleKickFlip.ska' descchecksum = DoubleKickFlip
        <LoadFunction> <...> name = 'anims\THPS6_skater_fliptricks\DoubleNollieHeelflip.ska' descchecksum = DoubleNollieHeelflip
        <LoadFunction> <...> name = 'anims\THPS6_skater_fliptricks\DoubleNollieKickflip.ska' descchecksum = DoubleNollieKickflip
        <LoadFunction> <...> name = 'anims\THPS6_skater_fliptricks\FrontFootImposs.ska' descchecksum = FrontFootImposs
        <LoadFunction> <...> name = 'anims\THPS6_skater_fliptricks\FS360ShoveIt.ska' descchecksum = FS360ShoveIt
        <LoadFunction> <...> name = 'anims\THPS6_skater_fliptricks\FS540ShoveIt.ska' descchecksum = FS540ShoveIt
        <LoadFunction> <...> name = 'anims\THPS6_skater_fliptricks\FSBigSpin.ska' descchecksum = FSBigSpin
        <LoadFunction> <...> name = 'anims\THPS6_skater_fliptricks\FSFlip.ska' descchecksum = FSFlip
        <LoadFunction> <...> name = 'anims\THPS6_skater_fliptricks\HardFlip.ska' descchecksum = HardFlip
        <LoadFunction> <...> name = 'anims\THPS6_skater_fliptricks\HeelFlip.ska' descchecksum = HeelFlip
        <LoadFunction> <...> name = 'anims\THPS6_skater_fliptricks\Impossible.ska' descchecksum = Impossible
        <LoadFunction> <...> name = 'anims\THPS6_skater_fliptricks\InwardHeelFlip.ska' descchecksum = InwardHeelflip
        <LoadFunction> <...> name = 'anims\THPS6_skater_fliptricks\KickFlip.ska' descchecksum = KickFlip
        <LoadFunction> <...> name = 'anims\THPS6_skater_fliptricks\Nollie360Flip.ska' descchecksum = Nollie360Flip
        <LoadFunction> <...> name = 'anims\THPS6_skater_fliptricks\Nollie360ShoveIt.ska' descchecksum = Nollie360ShoveIt
        <LoadFunction> <...> name = 'anims\THPS6_skater_fliptricks\NollieBS360ShoveIt.ska' descchecksum = NollieBS360ShoveIt
        <LoadFunction> <...> name = 'anims\THPS6_skater_fliptricks\NollieBSShoveIt.ska' descchecksum = NollieBSShoveIt
        <LoadFunction> <...> name = 'anims\THPS6_skater_fliptricks\NollieFSShoveIt.ska' descchecksum = NollieFSShoveIt
        <LoadFunction> <...> name = 'anims\THPS6_skater_fliptricks\NollieHardFlip.ska' descchecksum = NollieHardFlip
        <LoadFunction> <...> name = 'anims\THPS6_skater_fliptricks\NollieHeelFlip.ska' descchecksum = NollieHeelflip
        <LoadFunction> <...> name = 'anims\THPS6_skater_fliptricks\NollieImpossible.ska' descchecksum = NollieImpossible
        <LoadFunction> <...> name = 'anims\THPS6_skater_fliptricks\NollieInwardFlip.ska' descchecksum = NollieInwardFlip
        <LoadFunction> <...> name = 'anims\THPS6_skater_fliptricks\NollieKickFlip.ska' descchecksum = NollieKickflip
        <LoadFunction> <...> name = 'anims\THPS6_skater_fliptricks\NollieVarialHeelflip.ska' descchecksum = NollieVarialHeelflip
        <LoadFunction> <...> name = 'anims\THPS6_skater_fliptricks\NollieVarialKickFlip.ska' descchecksum = NollieVarialKickFlip
    endif
    SetReferenceChecksum 0
endscript


script animload_THPS6_human_net_7 LoadFunction = LoadAnim
    SetReferenceChecksum THPS6_human
    if <LoadFunction> <...> name = 'anims\THPS6_skater_fliptricks\OllieAirWalk.ska' descchecksum = OllieAirWalk
        <LoadFunction> <...> name = 'anims\THPS6_skater_fliptricks\OllieAirwalkShoveIt.ska' descchecksum = OllieAirwalkShoveIt
        <LoadFunction> <...> name = 'anims\THPS6_skater_fliptricks\OllieNorth.ska' descchecksum = OllieNorth
        <LoadFunction> <...> name = 'anims\THPS6_skater_fliptricks\OllieNorthBackFootFlip.ska' descchecksum = OllieNorthBackFootFlip
        <LoadFunction> <...> name = 'anims\THPS6_skater_fliptricks\PopShoveIt.ska' descchecksum = PopShoveIt
        <LoadFunction> <...> name = 'anims\THPS6_skater_fliptricks\PopShoveitBS.ska' descchecksum = PopShoveitBS
        <LoadFunction> <...> name = 'anims\THPS6_skater_fliptricks\QuadrupleHeelFlip.ska' descchecksum = QuadrupleHeelFlip
        <LoadFunction> <...> name = 'anims\THPS6_skater_fliptricks\TripleHeelFlip.ska' descchecksum = TripleHeelFlip
        <LoadFunction> <...> name = 'anims\THPS6_skater_fliptricks\TripleImpossible.ska' descchecksum = TripleImpossible
        <LoadFunction> <...> name = 'anims\THPS6_skater_fliptricks\TripleKickFlip.ska' descchecksum = TripleKickFlip
        <LoadFunction> <...> name = 'anims\THPS6_skater_fliptricks\VarialHeelFlip.ska' descchecksum = VarialHeelFlip
        <LoadFunction> <...> name = 'anims\THPS6_skater_fliptricks\VarialKickFlip.ska' descchecksum = VarialKickFlip
        <LoadFunction> <...> name = 'anims\THPS6_skater_fliptricks\KickFlipOldSkool.ska' descchecksum = KickFlipOldSkool
        <LoadFunction> <...> name = 'anims\THPS6_skater_freestyle\Spacewalk.ska' descchecksum = Spacewalk
        <LoadFunction> <...> name = 'anims\THPS6_skater_freestyle\SkitchMoveRight.ska' descchecksum = SkitchMoveRight
        <LoadFunction> <...> name = 'anims\THPS6_skater_freestyle\SkitchMoveLeft.ska' descchecksum = SkitchMoveLeft
        <LoadFunction> <...> name = 'anims\THPS6_skater_grabtricks\AirWalk.ska' descchecksum = AirWalk
        <LoadFunction> <...> name = 'anims\THPS6_skater_grabtricks\AirWalk_Idle2.ska' descchecksum = AirWalk_Idle2
        <LoadFunction> <...> name = 'anims\THPS6_skater_grabtricks\BSShifty.ska' descchecksum = BSShifty
        <LoadFunction> <...> name = 'anims\THPS6_skater_grabtricks\BSShifty_Idle.ska' descchecksum = BSShifty_Idle
        <LoadFunction> <...> name = 'anims\THPS6_skater_grabtricks\Benihana.ska' descchecksum = Benihana
        <LoadFunction> <...> name = 'anims\THPS6_skater_grabtricks\Benihana_Idle.ska' descchecksum = Benihana_Idle
        <LoadFunction> <...> name = 'anims\THPS6_skater_grabtricks\Benihana_Out.ska' descchecksum = Benihana_Out
        <LoadFunction> <...> name = 'anims\THPS6_skater_grabtricks\BetweenTheLegs_Idle.ska' descchecksum = BetweenTheLegs_Idle
        <LoadFunction> <...> name = 'anims\THPS6_skater_grabtricks\BetweenTheLegs_In.ska' descchecksum = BetweenTheLegs_In
        <LoadFunction> <...> name = 'anims\THPS6_skater_grabtricks\BetweenTheLegs_Out.ska' descchecksum = BetweenTheLegs_Out
        <LoadFunction> <...> name = 'anims\THPS6_skater_grabtricks\CannonBall.ska' descchecksum = CannonBall
        <LoadFunction> <...> name = 'anims\THPS6_skater_grabtricks\CannonBall_Idle.ska' descchecksum = CannonBall_Idle
        <LoadFunction> <...> name = 'anims\THPS6_skater_grabtricks\CannonballFingerFlip.ska' descchecksum = CannonballFingerFlip
        <LoadFunction> <...> name = 'anims\THPS6_skater_grabtricks\ChristAir_Idle.ska' descchecksum = ChristAir_Idle
        <LoadFunction> <...> name = 'anims\THPS6_skater_grabtricks\ChristAir_Init.ska' descchecksum = ChristAir_Init
        <LoadFunction> <...> name = 'anims\THPS6_skater_grabtricks\ChristAir_Out.ska' descchecksum = ChristAir_Out
        <LoadFunction> <...> name = 'anims\THPS6_skater_grabtricks\Crail.ska' descchecksum = Crail
        <LoadFunction> <...> name = 'anims\THPS6_skater_grabtricks\Crail_Idle.ska' descchecksum = Crail_Idle
        <LoadFunction> <...> name = 'anims\THPS6_skater_grabtricks\CrookedCop.ska' descchecksum = CrookedCop
        <LoadFunction> <...> name = 'anims\THPS6_skater_grabtricks\CrookedCop_Idle.ska' descchecksum = CrookedCop_Idle
        <LoadFunction> <...> name = 'anims\THPS6_skater_grabtricks\CrossBone.ska' descchecksum = CrossBone
        <LoadFunction> <...> name = 'anims\THPS6_skater_grabtricks\CrossBone_Idle.ska' descchecksum = CrossBone_Idle
        <LoadFunction> <...> name = 'anims\THPS6_skater_grabtricks\Indy.ska' descchecksum = Indy
        <LoadFunction> <...> name = 'anims\THPS6_skater_grabtricks\IndyDelMar.ska' descchecksum = IndyDelMar
        <LoadFunction> <...> name = 'anims\THPS6_skater_grabtricks\IndyDelMar_Idle.ska' descchecksum = IndyDelMar_Idle
        <LoadFunction> <...> name = 'anims\THPS6_skater_grabtricks\Indy_Idle.ska' descchecksum = Indy_Idle
        <LoadFunction> <...> name = 'anims\THPS6_skater_grabtricks\JapanAir.ska' descchecksum = JapanAir
        <LoadFunction> <...> name = 'anims\THPS6_skater_grabtricks\JapanAir_Idle.ska' descchecksum = JapanAir_Idle
        <LoadFunction> <...> name = 'anims\THPS6_skater_grabtricks\JudoGrab.ska' descchecksum = JudoGrab
        <LoadFunction> <...> name = 'anims\THPS6_skater_grabtricks\JudoGrab_Idle.ska' descchecksum = JudoGrab_Idle
        <LoadFunction> <...> name = 'anims\THPS6_skater_grabtricks\Madonna.ska' descchecksum = Madonna
        <LoadFunction> <...> name = 'anims\THPS6_skater_grabtricks\Madonna_Idle.ska' descchecksum = Madonna_Idle
        <LoadFunction> <...> name = 'anims\THPS6_skater_grabtricks\MelonGrab.ska' descchecksum = MelonGrab
        <LoadFunction> <...> name = 'anims\THPS6_skater_grabtricks\MelonGrab_Idle.ska' descchecksum = MelonGrab_Idle
    endif
    SetReferenceChecksum 0
endscript


script animload_THPS6_human_net_8 LoadFunction = LoadAnim
    SetReferenceChecksum THPS6_human
    if <LoadFunction> <...> name = 'anims\THPS6_skater_grabtricks\Method.ska' descchecksum = method
        <LoadFunction> <...> name = 'anims\THPS6_skater_grabtricks\Method_Idle.ska' descchecksum = Method_Idle
        <LoadFunction> <...> name = 'anims\THPS6_skater_grabtricks\MuteGrab.ska' descchecksum = MuteGrab
        <LoadFunction> <...> name = 'anims\THPS6_skater_grabtricks\MuteGrab_Idle.ska' descchecksum = MuteGrab_Idle
        <LoadFunction> <...> name = 'anims\THPS6_skater_grabtricks\NoseGrab.ska' descchecksum = NoseGrab
        <LoadFunction> <...> name = 'anims\THPS6_skater_grabtricks\NoseGrab_Idle.ska' descchecksum = NoseGrab_Idle
        <LoadFunction> <...> name = 'anims\THPS6_skater_grabtricks\Nosebone.ska' descchecksum = Nosebone
        <LoadFunction> <...> name = 'anims\THPS6_skater_grabtricks\Nosebone_Idle.ska' descchecksum = Nosebone_Idle
        <LoadFunction> <...> name = 'anims\THPS6_skater_grabtricks\OneFootJapan.ska' descchecksum = OneFootJapan
        <LoadFunction> <...> name = 'anims\THPS6_skater_grabtricks\OneFootJapan_Idle.ska' descchecksum = OneFootJapan_Idle
        <LoadFunction> <...> name = 'anims\THPS6_skater_grabtricks\OneFootTailGrab.ska' descchecksum = OneFootTailGrab
        <LoadFunction> <...> name = 'anims\THPS6_skater_grabtricks\OneFootTailGrab_Idle.ska' descchecksum = OneFootTailGrab_Idle
        <LoadFunction> <...> name = 'anims\THPS6_skater_grabtricks\RocketAir.ska' descchecksum = RocketAir
        <LoadFunction> <...> name = 'anims\THPS6_skater_grabtricks\RocketAir_Idle.ska' descchecksum = RocketAir_Idle
        <LoadFunction> <...> name = 'anims\THPS6_skater_grabtricks\SackTap.ska' descchecksum = SackTap
        <LoadFunction> <...> name = 'anims\THPS6_skater_grabtricks\SaranWrap.ska' descchecksum = SaranWrap
        <LoadFunction> <...> name = 'anims\THPS6_skater_grabtricks\SaranWrap_Idle.ska' descchecksum = SaranWrap_Idle
        <LoadFunction> <...> name = 'anims\THPS6_skater_grabtricks\SaranWrap_Out.ska' descchecksum = SaranWrap_Out
        <LoadFunction> <...> name = 'anims\THPS6_skater_grabtricks\SeatBelt.ska' descchecksum = SeatBelt
        <LoadFunction> <...> name = 'anims\THPS6_skater_grabtricks\SeatBelt_Idle.ska' descchecksum = SeatBelt_Idle
        <LoadFunction> <...> name = 'anims\THPS6_skater_grabtricks\Shifty.ska' descchecksum = Shifty
        <LoadFunction> <...> name = 'anims\THPS6_skater_grabtricks\Shifty_Idle.ska' descchecksum = Shifty_Idle
        <LoadFunction> <...> name = 'anims\THPS6_skater_grabtricks\Stalefish.ska' descchecksum = Stalefish
        <LoadFunction> <...> name = 'anims\THPS6_skater_grabtricks\Stalefish_Idle.ska' descchecksum = Stalefish_Idle
        <LoadFunction> <...> name = 'anims\THPS6_skater_grabtricks\Stalefish_Layback.ska' descchecksum = Stalefish_Layback
        <LoadFunction> <...> name = 'anims\THPS6_skater_grabtricks\Stalefish_Layback_Idle.ska' descchecksum = Stalefish_Layback_Idle
        <LoadFunction> <...> name = 'anims\THPS6_skater_grabtricks\Stiffy.ska' descchecksum = Stiffy
        <LoadFunction> <...> name = 'anims\THPS6_skater_grabtricks\Stiffy_Idle.ska' descchecksum = Stiffy_Idle
        <LoadFunction> <...> name = 'anims\THPS6_skater_grabtricks\TailGrab.ska' descchecksum = TailGrab
        <LoadFunction> <...> name = 'anims\THPS6_skater_grabtricks\TailGrab_Idle.ska' descchecksum = TailGrab_Idle
        <LoadFunction> <...> name = 'anims\THPS6_skater_grabtricks\TuckKnee.ska' descchecksum = TuckKnee
        <LoadFunction> <...> name = 'anims\THPS6_skater_grabtricks\TuckKnee_Idle.ska' descchecksum = TuckKnee_Idle
        <LoadFunction> <...> name = 'anims\THPS6_skater_grind\BSBluntSlide_Range.ska' descchecksum = BSBluntSlide_Range
        <LoadFunction> <...> name = 'anims\THPS6_skater_grind\BSBoardSlide_Range.ska' descchecksum = BSBoardSlide_Range
        <LoadFunction> <...> name = 'anims\THPS6_skater_grind\BSBoardslide_Out.ska' descchecksum = BSBoardslide_Out
        <LoadFunction> <...> name = 'anims\THPS6_skater_grind\BSCrooked_Range.ska' descchecksum = BSCrooked_Range
        <LoadFunction> <...> name = 'anims\THPS6_skater_grind\BSFeeble_Range.ska' descchecksum = BSFeeble_Range
        <LoadFunction> <...> name = 'anims\THPS6_skater_grind\BSHurricaneGrind_Init.ska' descchecksum = BSHurricaneGrind_Init
        <LoadFunction> <...> name = 'anims\THPS6_skater_grind\BSHurricaneGrind_Range.ska' descchecksum = BSHurricaneGrind_Range
        <LoadFunction> <...> name = 'anims\THPS6_skater_grind\BSNoseBlunt_Range.ska' descchecksum = BSNoseBlunt_Range
        <LoadFunction> <...> name = 'anims\THPS6_skater_grind\BSNoseSlide_Out.ska' descchecksum = BSNoseSlide_Out
        <LoadFunction> <...> name = 'anims\THPS6_skater_grind\BSOverCrook_Range.ska' descchecksum = BSOverCrook_Range
        <LoadFunction> <...> name = 'anims\THPS6_skater_grind\BSSaladGrind_Init.ska' descchecksum = BSSaladGrind_Init
        <LoadFunction> <...> name = 'anims\THPS6_skater_grind\BSSaladGrind_Range.ska' descchecksum = BSSaladGrind_Range
        <LoadFunction> <...> name = 'anims\THPS6_skater_grind\BSSmith_Range.ska' descchecksum = BSSmith_Range
        <LoadFunction> <...> name = 'anims\THPS6_skater_grind\BSTailSlide_Out.ska' descchecksum = BSTailSlide_Out
        <LoadFunction> <...> name = 'anims\THPS6_skater_grind\FSBluntSlide_Range.ska' descchecksum = FSBluntSlide_Range
        <LoadFunction> <...> name = 'anims\THPS6_skater_grind\FSBoardSlide_Out.ska' descchecksum = FSBoardSlide_Out
        <LoadFunction> <...> name = 'anims\THPS6_skater_grind\FSBoardSlide_Range.ska' descchecksum = FSBoardSlide_Range
        <LoadFunction> <...> name = 'anims\THPS6_skater_grind\FSCrooked_Range.ska' descchecksum = FSCrooked_Range
    endif
    SetReferenceChecksum 0
endscript


script animload_THPS6_human_net_9 LoadFunction = LoadAnim
    SetReferenceChecksum THPS6_human
    if <LoadFunction> <...> name = 'anims\THPS6_skater_grind\FSFeeble_Range.ska' descchecksum = FSFeeble_Range
        <LoadFunction> <...> name = 'anims\THPS6_skater_grind\FSHurricaneGrind_Init.ska' descchecksum = FSHurricaneGrind_Init
        <LoadFunction> <...> name = 'anims\THPS6_skater_grind\FSHurricaneGrind_Range.ska' descchecksum = FSHurricaneGrind_Range
        <LoadFunction> <...> name = 'anims\THPS6_skater_grind\FSNoseBlunt_Range.ska' descchecksum = FSNoseBlunt_Range
        <LoadFunction> <...> name = 'anims\THPS6_skater_grind\FSNoseSlide_Out.ska' descchecksum = FSNoseSlide_Out
        <LoadFunction> <...> name = 'anims\THPS6_skater_grind\FSNoseSlide_Range.ska' descchecksum = FSNoseSlide_Range
        <LoadFunction> <...> name = 'anims\THPS6_skater_grind\FSOverCrook_Range.ska' descchecksum = FSOverCrook_Range
        <LoadFunction> <...> name = 'anims\THPS6_skater_grind\FSSaladGrind_Init.ska' descchecksum = FSSaladGrind_Init
        <LoadFunction> <...> name = 'anims\THPS6_skater_grind\FSSaladGrind_Range.ska' descchecksum = FSSaladGrind_Range
        <LoadFunction> <...> name = 'anims\THPS6_skater_grind\FSSmith_Range.ska' descchecksum = FSSmith_Range
        <LoadFunction> <...> name = 'anims\THPS6_skater_grind\FSTailSlide_Out.ska' descchecksum = FSTailSlide_Out
        <LoadFunction> <...> name = 'anims\THPS6_skater_grind\FSTailSlide_Range.ska' descchecksum = FSTailSlide_Range
        <LoadFunction> <...> name = 'anims\THPS6_skater_grind\FiftyFifty2_Range.ska' descchecksum = FiftyFifty2_Range
        <LoadFunction> <...> name = 'anims\THPS6_skater_grind\FiftyFifty3_Range.ska' descchecksum = FiftyFifty3_Range
        <LoadFunction> <...> name = 'anims\THPS6_skater_grind\FiftyFifty_Range.ska' descchecksum = FiftyFifty_Range
        <LoadFunction> <...> name = 'anims\THPS6_skater_grind\Init_BSBluntSlide.ska' descchecksum = Init_BSBluntSlide
        <LoadFunction> <...> name = 'anims\THPS6_skater_grind\Init_BSBoardSlide.ska' descchecksum = Init_BSBoardSlide
        <LoadFunction> <...> name = 'anims\THPS6_skater_grind\Init_BSCrooked.ska' descchecksum = Init_BSCrooked
        <LoadFunction> <...> name = 'anims\THPS6_skater_grind\Init_BSFeeble.ska' descchecksum = Init_BSFeeble
        <LoadFunction> <...> name = 'anims\THPS6_skater_grind\Init_BSLipSlide.ska' descchecksum = Init_BSLipSlide
        <LoadFunction> <...> name = 'anims\THPS6_skater_grind\Init_BSNoseBlunt.ska' descchecksum = Init_BSNoseBlunt
        <LoadFunction> <...> name = 'anims\THPS6_skater_grind\Init_BSOverCrook.ska' descchecksum = Init_BSOverCrook
        <LoadFunction> <...> name = 'anims\THPS6_skater_grind\Init_BSSmith.ska' descchecksum = Init_BSSmith
        <LoadFunction> <...> name = 'anims\THPS6_skater_grind\Init_FSBluntSlide.ska' descchecksum = Init_FSBluntSlide
        <LoadFunction> <...> name = 'anims\THPS6_skater_grind\Init_FSBoardSlide.ska' descchecksum = Init_FSBoardSlide
        <LoadFunction> <...> name = 'anims\THPS6_skater_grind\Init_FSCrooked.ska' descchecksum = Init_FSCrooked
        <LoadFunction> <...> name = 'anims\THPS6_skater_grind\Init_FSFeeble.ska' descchecksum = Init_FSFeeble
        <LoadFunction> <...> name = 'anims\THPS6_skater_grind\Init_FSLipSlide.ska' descchecksum = Init_FSLipSlide
        <LoadFunction> <...> name = 'anims\THPS6_skater_grind\Init_FSNoseBlunt.ska' descchecksum = Init_FSNoseBlunt
        <LoadFunction> <...> name = 'anims\THPS6_skater_grind\Init_FSNoseSlide.ska' descchecksum = Init_FSNoseSlide
        <LoadFunction> <...> name = 'anims\THPS6_skater_grind\Init_FSOverCrook.ska' descchecksum = Init_FSOverCrook
        <LoadFunction> <...> name = 'anims\THPS6_skater_grind\Init_FSSmith.ska' descchecksum = Init_FSSmith
        <LoadFunction> <...> name = 'anims\THPS6_skater_grind\Init_FSTailSlide.ska' descchecksum = Init_FSTailSlide
        <LoadFunction> <...> name = 'anims\THPS6_skater_grind\Init_FiftyFifty.ska' descchecksum = Init_FiftyFifty
        <LoadFunction> <...> name = 'anims\THPS6_skater_grind\Init_NoseGrind.ska' descchecksum = Init_NoseGrind
        <LoadFunction> <...> name = 'anims\THPS6_skater_grind\Init_NoseSlide.ska' descchecksum = Init_NoseSlide
        <LoadFunction> <...> name = 'anims\THPS6_skater_grind\Init_TailGrind.ska' descchecksum = Init_TailGrind
        <LoadFunction> <...> name = 'anims\THPS6_skater_grind\Init_TailSlide.ska' descchecksum = Init_TailSlide
        <LoadFunction> <...> name = 'anims\THPS6_skater_grind\NoseGrind_Range.ska' descchecksum = NoseGrind_Range
        <LoadFunction> <...> name = 'anims\THPS6_skater_grind\NoseSlide_Range.ska' descchecksum = NoseSlide_Range
        <LoadFunction> <...> name = 'anims\THPS6_skater_grind\TailGrind_Range.ska' descchecksum = TailGrind_Range
        <LoadFunction> <...> name = 'anims\THPS6_skater_grind\TailSlide_Range.ska' descchecksum = TailSlide_Range
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\CrouchedLand4.ska' descchecksum = CrouchedLand4
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\CrouchedLand4_Small.ska' descchecksum = CrouchedLand4_Small
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\CrouchedLand_Tiny.ska' descchecksum = CrouchedLand_Tiny
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\StandingLand_Tiny.ska' descchecksum = StandingLand_Tiny
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\CrouchedLand5_Small.ska' descchecksum = CrouchedLand5_Small
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\CrouchedLand5.ska' descchecksum = CrouchedLand5
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\CrouchedLand6.ska' descchecksum = CrouchedLand6
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\CrouchedLandTurn4.ska' descchecksum = CrouchedLandTurn4
    endif
    SetReferenceChecksum 0
endscript


script animload_THPS6_human_net_10 LoadFunction = LoadAnim
    SetReferenceChecksum THPS6_human
    if <LoadFunction> <...> name = 'anims\THPS6_skater_basics\CrouchedLandTurn5.ska' descchecksum = CrouchedLandTurn5
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\StandingLandTurn1.ska' descchecksum = StandingLandTurn1
        <LoadFunction> <...> name = 'anims\THPS6_skater_lip\MuteInvert_Init.ska' descchecksum = MuteInvert_Init
        <LoadFunction> <...> name = 'anims\THPS6_skater_lip\MuteInvert_Range.ska' descchecksum = MuteInvert_Range
        <LoadFunction> <...> name = 'anims\THPS6_skater_lip\MuteInvert_Out.ska' descchecksum = MuteInvert_Out
        <LoadFunction> <...> name = 'anims\THPS6_skater_lip\EggPlant_Init.ska' descchecksum = EggPlant_Init
        <LoadFunction> <...> name = 'anims\THPS6_skater_lip\EggPlant_Range.ska' descchecksum = EggPlant_Range
        <LoadFunction> <...> name = 'anims\THPS6_skater_lip\EggPlant_Out.ska' descchecksum = EggPlant_Out
        <LoadFunction> <...> name = 'anims\THPS6_skater_lip\GymnastPlant_Init.ska' descchecksum = GymnastPlant_Init
        <LoadFunction> <...> name = 'anims\THPS6_skater_lip\GymnastPlant_Range.ska' descchecksum = GymnastPlant_Range
        <LoadFunction> <...> name = 'anims\THPS6_skater_lip\GymnastPlant_Out.ska' descchecksum = GymnastPlant_Out
        <LoadFunction> <...> name = 'anims\THPS6_skater_lip\FakieRockAndRoll_Init.ska' descchecksum = FakieRockAndRoll_Init
        <LoadFunction> <...> name = 'anims\THPS6_skater_lip\FakieRockAndRoll_Range.ska' descchecksum = FakieRockAndRoll_Range
        <LoadFunction> <...> name = 'anims\THPS6_skater_lip\FakieRockAndRoll_Out.ska' descchecksum = FakieRockAndRoll_Out
        <LoadFunction> <...> name = 'anims\THPS6_skater_lip\NoseTailStall_Init.ska' descchecksum = NoseTailStall_Init
        <LoadFunction> <...> name = 'anims\THPS6_skater_lip\NoseTailStall_Range.ska' descchecksum = NoseTailStall_Range
        <LoadFunction> <...> name = 'anims\THPS6_skater_lip\NoseTailStall_Out.ska' descchecksum = NoseTailStall_Out
        <LoadFunction> <...> name = 'anims\THPS6_skater_lip\BluntToFakie_Init.ska' descchecksum = BluntToFakie_Init
        <LoadFunction> <...> name = 'anims\THPS6_skater_lip\BluntToFakie_Range.ska' descchecksum = BluntToFakie_Range
        <LoadFunction> <...> name = 'anims\THPS6_skater_lip\BluntToFakie_Out.ska' descchecksum = BluntToFakie_Out
        <LoadFunction> <...> name = 'anims\THPS6_skater_lip\Disaster_Init.ska' descchecksum = Disaster_Init
        <LoadFunction> <...> name = 'anims\THPS6_skater_lip\Disaster_Range.ska' descchecksum = Disaster_Range
        <LoadFunction> <...> name = 'anims\THPS6_skater_lip\Disaster_Out.ska' descchecksum = Disaster_Out
        <LoadFunction> <...> name = 'anims\THPS6_skater_lip\AxleStall_Init.ska' descchecksum = AxleStall_Init
        <LoadFunction> <...> name = 'anims\THPS6_skater_lip\AxleStall_Range.ska' descchecksum = AxleStall_Range
        <LoadFunction> <...> name = 'anims\THPS6_skater_lip\AxleStall_Out.ska' descchecksum = AxleStall_Out
        <LoadFunction> <...> name = 'anims\THPS6_skater_lip\Invert_Init.ska' descchecksum = Invert_Init
        <LoadFunction> <...> name = 'anims\THPS6_skater_lip\Invert_Range.ska' descchecksum = Invert_Range
        <LoadFunction> <...> name = 'anims\THPS6_skater_lip\Invert_Out.ska' descchecksum = Invert_Out
        <LoadFunction> <...> name = 'anims\THPS6_skater_lip\OneFootInvert_Init.ska' descchecksum = OneFootInvert_Init
        <LoadFunction> <...> name = 'anims\THPS6_skater_lip\OneFootInvert_Range.ska' descchecksum = OneFootInvert_Range
        <LoadFunction> <...> name = 'anims\THPS6_skater_lip\OneFootInvert_Out.ska' descchecksum = OneFootInvert_Out
        <LoadFunction> <...> name = 'anims\THPS6_skater_lip\BSFootplant_Init.ska' descchecksum = BSFootplant_Init
        <LoadFunction> <...> name = 'anims\THPS6_skater_lip\BSFootplant_Range.ska' descchecksum = BSFootplant_Range
        <LoadFunction> <...> name = 'anims\THPS6_skater_lip\BSFootplant_Out.ska' descchecksum = BSFootplant_Out
        <LoadFunction> <...> name = 'anims\THPS6_skater_lip\BSFootplant_OllieOut.ska' descchecksum = BSFootplant_OllieOut
        <LoadFunction> <...> name = 'anims\THPS6_skater_lip\AxleStall_OllieOut.ska' descchecksum = AxleStall_OllieOut
        <LoadFunction> <...> name = 'anims\THPS6_skater_lip\FS180Noseblunt_Init.ska' descchecksum = FS180Noseblunt_Init
        <LoadFunction> <...> name = 'anims\THPS6_skater_lip\FS180Noseblunt_Range.ska' descchecksum = FS180Noseblunt_Range
        <LoadFunction> <...> name = 'anims\THPS6_skater_lip\FS180Noseblunt_Out.ska' descchecksum = FS180Noseblunt_Out
        <LoadFunction> <...> name = 'anims\THPS6_skater_lip\FSIndyNosePick_Init.ska' descchecksum = FSIndyNosePick_Init
        <LoadFunction> <...> name = 'anims\THPS6_skater_lip\FSIndyNosePick_Range.ska' descchecksum = FSIndyNosePick_Range
        <LoadFunction> <...> name = 'anims\THPS6_skater_lip\FSIndyNosePick_Out.ska' descchecksum = FSIndyNosePick_Out
        <LoadFunction> <...> name = 'anims\THPS6_skater_lip\AndrectInvert_Init.ska' descchecksum = AndrectInvert_Init
        <LoadFunction> <...> name = 'anims\THPS6_skater_lip\AndrectInvert_Out.ska' descchecksum = AndrectInvert_Out
        <LoadFunction> <...> name = 'anims\THPS6_skater_lip\AndrectInvert_Range.ska' descchecksum = AndrectInvert_Range
        <LoadFunction> <...> name = 'anims\THPS6_skater_lip\Switcheroo_Out.ska' descchecksum = Switcheroo_Out
        <LoadFunction> <...> name = 'anims\THPS6_skater_lip\Switcheroo_Init.ska' descchecksum = Switcheroo_Init
        <LoadFunction> <...> name = 'anims\THPS6_skater_lip\Switcheroo_Range.ska' descchecksum = Switcheroo_Range
        <LoadFunction> <...> name = 'anims\THPS6_Skater_Basics\Natas_Spin_Init.ska' descchecksum = Natas_Spin_Init
    endif
    SetReferenceChecksum 0
endscript


script animload_THPS6_human_net_11 LoadFunction = LoadAnim
    SetReferenceChecksum THPS6_human
    if <LoadFunction> <...> name = 'anims\THPS6_Skater_Basics\Natas_Spin_Range.ska' descchecksum = Natas_Spin_Range
        <LoadFunction> <...> name = 'anims\THPS6_Skater_Basics\Natas_Spin_Out.ska' descchecksum = Natas_Spin_Out
        <LoadFunction> <...> name = 'anims\THPS6_Skater_Basics\FS_PowerSlide_Init.ska' descchecksum = FS_PowerSlide_Init
        <LoadFunction> <...> name = 'anims\THPS6_Skater_Basics\FS_PowerSlide_Idle.ska' descchecksum = FS_PowerSlide_Idle
        <LoadFunction> <...> name = 'anims\THPS6_Skater_Basics\FS_PowerSlide_Out.ska' descchecksum = FS_PowerSlide_Out
        <LoadFunction> <...> name = 'anims\THPS6_Skater_Basics\FS_PowerSlide_180_Out.ska' descchecksum = FS_PowerSlide_180_Out
        <LoadFunction> <...> name = 'anims\THPS6_Skater_Basics\BS_PowerSlide_Init.ska' descchecksum = BS_PowerSlide_Init
        <LoadFunction> <...> name = 'anims\THPS6_Skater_Basics\BS_PowerSlide_Idle.ska' descchecksum = BS_PowerSlide_Idle
        <LoadFunction> <...> name = 'anims\THPS6_Skater_Basics\BS_PowerSlide_180_Out.ska' descchecksum = BS_PowerSlide_180_Out
        <LoadFunction> <...> name = 'anims\THPS6_Skater_Basics\BS_PowerSlide_Out.ska' descchecksum = BS_PowerSlide_Out
        <LoadFunction> <...> name = 'anims\THPS6_Skater_PressureFlip\BS180PressureFlip.ska' descchecksum = BS180PressureFlip
        <LoadFunction> <...> name = 'anims\THPS6_Skater_PressureFlip\BSToeFlip.ska' descchecksum = BSToeFlip
        <LoadFunction> <...> name = 'anims\THPS6_Skater_PressureFlip\BS360PressureFlip.ska' descchecksum = BS360PressureFlip
        <LoadFunction> <...> name = 'anims\THPS6_Skater_PressureFlip\FS360PressureFlip.ska' descchecksum = FS360PressureFlip
        <LoadFunction> <...> name = 'anims\THPS6_skater_misc\RunFromIdle.ska' descchecksum = RunFromIdle
        <LoadFunction> <...> name = 'anims\THPS6_skater_misc\Run.ska' descchecksum = run
        <LoadFunction> <...> name = 'anims\THPS6_skater_misc\RunToIdle.ska' descchecksum = RunToIdle
        <LoadFunction> <...> name = 'anims\THPS6_skater_misc\RunJump.ska' descchecksum = RunJump
        <LoadFunction> <...> name = 'anims\THPS6_skater_misc\RunJumpIdle.ska' descchecksum = runjumpidle
        <LoadFunction> <...> name = 'anims\THPS6_skater_misc\RunJumpLand.ska' descchecksum = runjumpland
        <LoadFunction> <...> name = 'anims\THPS6_Skater_Female\NewBrake_Female.ska' descchecksum = NewBrake_Female
        <LoadFunction> <...> name = 'anims\THPS6_Skater_Female\NewBrakeIdle_Female.ska' descchecksum = NewBrakeIdle_Female
        <LoadFunction> <...> name = 'anims\THPS6_Skater_Female\NewBrakeIdle2_Female.ska' descchecksum = NewBrakeIdle2_Female
        <LoadFunction> <...> name = 'anims\THPS6_Skater_Female\NewBrakeIdle3_Female.ska' descchecksum = NewBrakeIdle3_Female
        <LoadFunction> <...> name = 'anims\THPS6_Skater_Female\NewBrakeIdle4_Female.ska' descchecksum = NewBrakeIdle4_Female
        <LoadFunction> <...> name = 'anims\THPS6_Skater_Female\NewBrakeIdle6_Female.ska' descchecksum = NewBrakeIdle6_Female
        <LoadFunction> <...> name = 'anims\THPS6_Skater_Female\NewBrakeIdle7_Female.ska' descchecksum = NewBrakeIdle7_Female
        <LoadFunction> <...> name = 'anims\THPS6_Skater_Female\NewBrakeIdle8_Female.ska' descchecksum = NewBrakeIdle8_Female
        <LoadFunction> <...> name = 'anims\thps6_skater_OnFoot_partial\HangLeft10_Partial.ska' descchecksum = HangLeft10_Partial
        <LoadFunction> <...> name = 'anims\thps6_skater_OnFoot_partial\HangRight10_Partial.ska' descchecksum = HangRight10_Partial
        <LoadFunction> <...> name = 'anims\thps6_skater_OnFoot_partial\HangLeft10_PartialUp.ska' descchecksum = HangLeft10_PartialUp
        <LoadFunction> <...> name = 'anims\thps6_skater_OnFoot_partial\HangRight10_PartialUp.ska' descchecksum = HangRight10_PartialUp
        <LoadFunction> <...> name = 'anims\thps6_skater_OnFoot_partial\HangLeft20_Partial.ska' descchecksum = HangLeft20_Partial
        <LoadFunction> <...> name = 'anims\thps6_skater_OnFoot_partial\HangRight20_Partial.ska' descchecksum = HangRight20_Partial
        <LoadFunction> <...> name = 'anims\thps6_skater_OnFoot_partial\HangLeft20_PartialUp.ska' descchecksum = HangLeft20_PartialUp
        <LoadFunction> <...> name = 'anims\thps6_skater_OnFoot_partial\HangRight20_PartialUp.ska' descchecksum = HangRight20_PartialUp
        <LoadFunction> <...> name = 'anims\thps6_skater_OnFoot_partial\HangLeft30_Partial.ska' descchecksum = HangLeft30_Partial
        <LoadFunction> <...> name = 'anims\thps6_skater_OnFoot_partial\HangRight30_Partial.ska' descchecksum = HangRight30_Partial
        <LoadFunction> <...> name = 'anims\thps6_skater_OnFoot_partial\HangLeft30_PartialUp.ska' descchecksum = HangLeft30_PartialUp
        <LoadFunction> <...> name = 'anims\thps6_skater_OnFoot_partial\HangRight30_PartialUp.ska' descchecksum = HangRight30_PartialUp
        <LoadFunction> <...> name = 'anims\thps6_skater_OnFoot_partial\HangLeft40_Partial.ska' descchecksum = HangLeft40_Partial
        <LoadFunction> <...> name = 'anims\thps6_skater_OnFoot_partial\HangRight40_Partial.ska' descchecksum = HangRight40_Partial
        <LoadFunction> <...> name = 'anims\thps6_skater_OnFoot_partial\HangLeft40_PartialUp.ska' descchecksum = HangLeft40_PartialUp
        <LoadFunction> <...> name = 'anims\thps6_skater_OnFoot_partial\HangRight40_PartialUp.ska' descchecksum = HangRight40_PartialUp
        <LoadFunction> <...> name = 'anims\thps6_skater_OnFoot_partial\WalkingSlap_Partial.ska' descchecksum = WalkingSlap_Partial
        <LoadFunction> <...> name = 'anims\thps6_skater_OnFoot_partial\FastRun_Partial.ska' descchecksum = FastRun_Partial
        <LoadFunction> <...> name = 'anims\thps6_skater_OnFoot_partial\HangIdleToDrop_Partial.ska' descchecksum = HangIdleToDrop_Partial
        <LoadFunction> <...> name = 'anims\thps6_skater_OnFoot_partial\HangOntoTheTop_Partial.ska' descchecksum = HangOntoTheTop_Partial
        <LoadFunction> <...> name = 'anims\thps6_skater_OnFoot_partial\JumpAir_Partial.ska' descchecksum = JumpAir_Partial
        <LoadFunction> <...> name = 'anims\thps6_skater_OnFoot_partial\JumpLandToRun_Partial.ska' descchecksum = JumpLandToRun_Partial
    endif
    SetReferenceChecksum 0
endscript


script animload_THPS6_human_net_12 LoadFunction = LoadAnim
    SetReferenceChecksum THPS6_human
    if <LoadFunction> <...> name = 'anims\thps6_skater_OnFoot_partial\JumpLandToStand_Partial.ska' descchecksum = JumpLandToStand_Partial
        <LoadFunction> <...> name = 'anims\thps6_skater_OnFoot_partial\LadderClimb_Partial.ska' descchecksum = LadderClimb_Partial
        <LoadFunction> <...> name = 'anims\thps6_skater_OnFoot_partial\LadderClimbFromStandIdle_Partial.ska' descchecksum = LadderClimbFromStandIdle_Partial
        <LoadFunction> <...> name = 'anims\thps6_skater_OnFoot_partial\LadderOntoTheTop_Partial.ska' descchecksum = LadderOntoTheTop_Partial
        <LoadFunction> <...> name = 'anims\thps6_skater_OnFoot_partial\RunToJump_Partial.ska' descchecksum = RunToJump_Partial
        <LoadFunction> <...> name = 'anims\thps6_skater_OnFoot_partial\StandToHang_Partial.ska' descchecksum = StandToHang_Partial
        <LoadFunction> <...> name = 'anims\thps6_skater_OnFoot_partial\StandToJump_Partial.ska' descchecksum = StandToJump_Partial
        <LoadFunction> <...> name = 'anims\thps6_skater_OnFoot_partial\WRun_Partial.ska' descchecksum = WRun_Partial
        <LoadFunction> <...> name = 'anims\thps6_skater_OnFoot_partial\WStand_Partial.ska' descchecksum = WStand_Partial
        <LoadFunction> <...> name = 'anims\thps6_skater_OnFoot_partial\WStandToRun_Partial.ska' descchecksum = WStandToRun_Partial
        <LoadFunction> <...> name = 'anims\thps6_skater_OnFoot_partial\WStandToWalk_Partial.ska' descchecksum = WStandToWalk_Partial
        <LoadFunction> <...> name = 'anims\thps6_skater_OnFoot_partial\WWalk_Partial.ska' descchecksum = WWalk_Partial
        <LoadFunction> <...> name = 'anims\thps6_skater_OnFoot_partial\WalkFast_Partial.ska' descchecksum = WalkFast_Partial
        <LoadFunction> <...> name = 'anims\thps6_skater_OnFoot_partial\WalkSlow_Partial.ska' descchecksum = WalkSlow_Partial
        <LoadFunction> <...> name = 'anims\thps6_skater_OnFoot_partial\_180RunSkid_Partial.ska' descchecksum = _180RunSkid_Partial
        <LoadFunction> <...> name = 'anims\thps6_skater_OnFoot_partial\WStandIdle1_Partial.ska' descchecksum = WStandIdle1_Partial
        <LoadFunction> <...> name = 'anims\thps6_skater_OnFoot_partial\WStandIdle2_Partial.ska' descchecksum = WStandIdle2_Partial
        <LoadFunction> <...> name = 'anims\thps6_skater_OnFoot_partial\WStandIdle3_Partial.ska' descchecksum = WStandIdle3_Partial
        <LoadFunction> <...> name = 'anims\thps6_skater_OnFoot_partial\WStandIdle4_Partial.ska' descchecksum = WStandIdle4_Partial
        <LoadFunction> <...> name = 'anims\thps6_skater_OnFoot_partial\WStandIdle5_Partial.ska' descchecksum = WStandIdle5_Partial
        <LoadFunction> <...> name = 'anims\thps6_skater_OnFoot_partial\WStandIdle6_Partial.ska' descchecksum = WStandIdle6_Partial
        <LoadFunction> <...> name = 'anims\thps6_skater_OnFoot_partial\JumpToSwingHang_Partial.ska' descchecksum = JumpToSwingHang_Partial
        <LoadFunction> <...> name = 'anims\thps6_skater_OnFoot_partial\JumpToWallHang_Partial.ska' descchecksum = JumpToWallHang_Partial
        <LoadFunction> <...> name = 'anims\thps6_skater_OnFoot_partial\LadderFastClimb_Partial.ska' descchecksum = LadderFastClimb_Partial
        <LoadFunction> <...> name = 'anims\thps6_skater_OnFoot_partial\JumpLandToWalk_Partial.ska' descchecksum = JumpLandToWalk_Partial
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\AirCasperFlip_Idle.ska' descchecksum = AirCasperFlip_Idle
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\AirCasperFlip_Init.ska' descchecksum = AirCasperFlip_Init
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\AirCasperFlip_Out.ska' descchecksum = AirCasperFlip_Out
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\BSNoseSlideLipSlide.ska' descchecksum = BSNoseSlideLipSlide
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\BarrelRoll.ska' descchecksum = BarrelRoll
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\BigHitter_Init.ska' descchecksum = BigHitter_Init
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\BigHitter_Out.ska' descchecksum = BigHitter_Out
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\BigHitter_Range.ska' descchecksum = BigHitter_Range
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\CoffinGrind_Init.ska' descchecksum = CoffinGrind_Init
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\CoffinGrind_Out.ska' descchecksum = CoffinGrind_Out
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\CoffinGrind_Range.ska' descchecksum = CoffinGrind_Range
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\CrailSlide_Init.ska' descchecksum = CrailSlide_Init
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\CrailSlide_Out.ska' descchecksum = CrailSlide_Out
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\CrailSlide_Range.ska' descchecksum = CrailSlide_Range
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\CrookBigSpinFlipCrook.ska' descchecksum = CrookBigSpinFlipCrook
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\DaffyBroken_Init.ska' descchecksum = DaffyBroken_Init
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\DaffyBroken_Range.ska' descchecksum = DaffyBroken_Range
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\DanceParty_Idle.ska' descchecksum = DanceParty_Idle
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\DanceParty_Init.ska' descchecksum = DanceParty_Init
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\DarkSlide_Init.ska' descchecksum = DarkSlide_Init
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\DarkSlide_Out.ska' descchecksum = DarkSlide_Out
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\DarkSlide_Range.ska' descchecksum = DarkSlide_Range
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\DoubleBlunt_Idle.ska' descchecksum = DoubleBlunt_Idle
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\DoubleBlunt_Init.ska' descchecksum = DoubleBlunt_Init
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\DoubleKFVarialIndy.ska' descchecksum = DoubleKFVarialIndy
    endif
    SetReferenceChecksum 0
endscript


script animload_THPS6_human_net_13 LoadFunction = LoadAnim
    SetReferenceChecksum THPS6_human
    if <LoadFunction> <...> name = 'anims\THPS6_skater_special\ElbowSmash_Idle.ska' descchecksum = ElbowSmash_Idle
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\ElbowSmash_Init.ska' descchecksum = ElbowSmash_Init
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\ElbowSmash_Out.ska' descchecksum = ElbowSmash_Out
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\FS540.ska' descchecksum = FS540
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\FSBigSpinShifty_Idle.ska' descchecksum = FSBigSpinShifty_Idle
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\FSBigSpinShifty_Init.ska' descchecksum = FSBigSpinShifty_Init
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\FSBigSpinShifty_Out.ska' descchecksum = FSBigSpinShifty_Out
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\FSNoseSlideLipSlide.ska' descchecksum = FSNoseSlideLipSlide
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\Fandangle_Init.ska' descchecksum = Fandangle_Init
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\Fandangle_Out.ska' descchecksum = Fandangle_Out
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\Fandangle_Range.ska' descchecksum = Fandangle_Range
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\FingerFlipAirWalk.ska' descchecksum = FingerFlipAirWalk
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\Flamingo_Idle.ska' descchecksum = Flamingo_Idle
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\Flamingo_Init.ska' descchecksum = Flamingo_Init
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\Flamingo_Out.ska' descchecksum = Flamingo_Out
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\GazelleUnderflip.ska' descchecksum = GazelleUnderflip
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\Ghettobird2.ska' descchecksum = Ghettobird2
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\GrindOverturn_Init.ska' descchecksum = GrindOverturn_Init
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\GrindOverturn_Range.ska' descchecksum = GrindOverturn_Range
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\HangTenNoseGrind_Init.ska' descchecksum = HangTenNoseGrind_Init
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\HangTenNoseGrind_Out.ska' descchecksum = HangTenNoseGrind_Out
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\HangTenNoseGrind_Range.ska' descchecksum = HangTenNoseGrind_Range
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\HardFlipBackFootFlip.ska' descchecksum = HardFlipBackFootFlip
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\HeelflipFSInvert_Init.ska' descchecksum = HeelflipFSInvert_Init
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\HeelflipFSInvert_Out.ska' descchecksum = HeelflipFSInvert_Out
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\HeelflipFSInvert_Range.ska' descchecksum = HeelflipFSInvert_Range
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\HoHoSadPlant_Idle.ska' descchecksum = HoHoSadPlant_Idle
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\HoHoSadPlant_Init.ska' descchecksum = HoHoSadPlant_Init
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\HoHoSadPlant_Out.ska' descchecksum = HoHoSadPlant_Out
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\HoHoStreetPlant_Idle.ska' descchecksum = HoHoStreetPlant_Idle
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\HoHoStreetPlant_Init.ska' descchecksum = HoHoStreetPlant_Init
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\HoHoStreetPlant_Out.ska' descchecksum = HoHoStreetPlant_Out
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\KickFlipBodyBackFlip.ska' descchecksum = KickFlipBodyBackFlip
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\KickFlipUnderFlip.ska' descchecksum = KickFlipUnderFlip
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\LaserFlip.ska' descchecksum = LaserFlip
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\McTwist.ska' descchecksum = McTwist
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\NoComplyLate360.ska' descchecksum = NoComplyLate360
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\NosegrindPivot_Init.ska' descchecksum = NosegrindPivot_Init
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\NosegrindPivot_Range.ska' descchecksum = NosegrindPivot_Range
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\OneFootOneWheel_Init.ska' descchecksum = OneFootOneWheel_Init
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\OneFootOneWheel_Range.ska' descchecksum = OneFootOneWheel_Range
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\Primo_Init.ska' descchecksum = Primo_Init
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\Primo_Out.ska' descchecksum = Primo_Out
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\Primo_Range.ska' descchecksum = Primo_Range
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\PutDownOneWheel.ska' descchecksum = PutDownOneWheel
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\Russian_Idle.ska' descchecksum = Russian_Idle
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\Russian_OllieOut.ska' descchecksum = Russian_OllieOut
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\Russian_Out.ska' descchecksum = Russian_Out
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\RustySlide_Init.ska' descchecksum = RustySlide_Init
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\RustySlide_Out.ska' descchecksum = RustySlide_Out
    endif
    SetReferenceChecksum 0
endscript


script animload_THPS6_human_net_14 LoadFunction = LoadAnim
    SetReferenceChecksum THPS6_human
    if <LoadFunction> <...> name = 'anims\THPS6_skater_special\SackTap_Init.ska' descchecksum = SackTap_Init
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\SackTap_Out.ska' descchecksum = SackTap_Out
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\SackTap_Range.ska' descchecksum = SackTap_Range
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\SambaFlip.ska' descchecksum = SambaFlip
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\SemiFlip.ska' descchecksum = SemiFlip
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\SitDownAir_Idle.ska' descchecksum = SitDownAir_Idle
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\SitDownAir_Init.ska' descchecksum = SitDownAir_Init
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\SmithFS_Init.ska' descchecksum = SmithFS_Init
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\SmithFS_Range.ska' descchecksum = SmithFS_Range
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\Smith_Init.ska' descchecksum = Smith_Init
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\Smith_Range.ska' descchecksum = Smith_Range
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\Sproing.ska' descchecksum = Sproing
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\Sweet.ska' descchecksum = Sweet
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\TailGrindFingerFlip.ska' descchecksum = TailGrindFingerFlip
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\TailblockSlide_Init.ska' descchecksum = TailblockSlide_Init
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\TailblockSlide_Range.ska' descchecksum = TailblockSlide_Range
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\_2KickMadonnaFlip_Init.ska' descchecksum = _2KickMadonnaFlip_Init
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\_2KickMadonnaFlip_Out.ska' descchecksum = _2KickMadonnaFlip_Out
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\_360VarialMcTwist.ska' descchecksum = _360VarialMcTwist
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\_540Boneless.ska' descchecksum = _540Boneless
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\_540Flip.ska' descchecksum = _540Flip
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\_540TailWhip.ska' descchecksum = _540TailWhip
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\BamBendAir_Idle.ska' descchecksum = BamBendAir_Idle
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\BamBendAir_Init.ska' descchecksum = BamBendAir_Init
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\FiftyFiftySwitcheroo_Idle.ska' descchecksum = FiftyFiftySwitcheroo_Idle
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\FiftyFiftySwitcheroo_Init.ska' descchecksum = FiftyFiftySwitcheroo_Init
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\GrindNBarf_Init.ska' descchecksum = GrindNBarf_Init
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\GrindNBarf_Out.ska' descchecksum = GrindNBarf_Out
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\GrindNBarf_Range.ska' descchecksum = GrindNBarf_Range
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\RodneyGrind_Init.ska' descchecksum = RodneyGrind_Init
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\RodneyGrind_Out.ska' descchecksum = RodneyGrind_Out
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\RodneyGrind_Range.ska' descchecksum = RodneyGrind_Range
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\Shortbus_Idle.ska' descchecksum = Shortbus_Idle
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\Shortbus_Init.ska' descchecksum = Shortbus_Init
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\Shortbus_Out.ska' descchecksum = Shortbus_Out
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\SlamSpinner.ska' descchecksum = SlamSpinner
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\YeahRight_Idle.ska' descchecksum = YeahRight_Idle
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\YeahRight_Init.ska' descchecksum = YeahRight_Init
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\YeahRight_Out.ska' descchecksum = YeahRight_Out
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\_360ShovItNoseGrind_Init.ska' descchecksum = _360ShovItNoseGrind_Init
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\_360ShovItNoseGrind_Out.ska' descchecksum = _360ShovItNoseGrind_Out
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\_360ShovItNoseGrind_Range.ska' descchecksum = _360ShovItNoseGrind_Range
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\BreakIn_Init.ska' descchecksum = BreakIn_Init
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\FSDarkSlide_Init.ska' descchecksum = FSDarkSlide_Init
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\FSDarkSlide_Out.ska' descchecksum = FSDarkSlide_Out
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\FSDarkSlide_Range.ska' descchecksum = FSDarkSlide_Range
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\FSFlipOneFootTailGrab_Idle.ska' descchecksum = FSFlipOneFootTailGrab_Idle
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\FSFlipOneFootTailGrab_Init.ska' descchecksum = FSFlipOneFootTailGrab_Init
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\FSFlipOneFootTailGrab_Out.ska' descchecksum = FSFlipOneFootTailGrab_Out
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\FSNollie360FlipCrook_Init.ska' descchecksum = FSNollie360FlipCrook_Init
    endif
    SetReferenceChecksum 0
endscript


script animload_THPS6_human_net_15 LoadFunction = LoadAnim
    SetReferenceChecksum THPS6_human
    if <LoadFunction> <...> name = 'anims\THPS6_skater_special\FSNollie360FlipCrook_Out.ska' descchecksum = FSNollie360FlipCrook_Out
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\FSNollie360FlipCrook_Range.ska' descchecksum = FSNollie360FlipCrook_Range
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\HandStandCasper_Init.ska' descchecksum = HandStandCasper_Init
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\HandStandCasper_Out.ska' descchecksum = HandStandCasper_Out
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\HandStandCasper_Range.ska' descchecksum = HandStandCasper_Range
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\HCNHDF_Init.ska' descchecksum = HCNHDF_Init
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\HCNHDF_Out.ska' descchecksum = HCNHDF_Out
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\HCNHDF_Range.ska' descchecksum = HCNHDF_Range
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\KickFlipSwitchOneFootManual_Init.ska' descchecksum = KickFlipSwitchOneFootManual_Init
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\KickFlipSwitchOneFootManual_Out.ska' descchecksum = KickFlipSwitchOneFootManual_Out
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\KickFlipSwitchOneFootManual_Range.ska' descchecksum = KickFlipSwitchOneFootManual_Range
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\MixItUp_Idle.ska' descchecksum = MixItUp_Idle
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\MixItUp_Init.ska' descchecksum = MixItUp_Init
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\MixItUp_Out.ska' descchecksum = MixItUp_Out
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\MoonwalkGrind_Idle.ska' descchecksum = MoonwalkGrind_Idle
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\MoonwalkGrind_Init.ska' descchecksum = MoonwalkGrind_Init
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\MoonwalkGrind_Out.ska' descchecksum = MoonwalkGrind_Out
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\OneFootDarkslide_Init.ska' descchecksum = OneFootDarkslide_Init
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\OneFootDarkslide_Out.ska' descchecksum = OneFootDarkslide_Out
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\OneFootDarkslide_Range.ska' descchecksum = OneFootDarkslide_Range
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\PrimoHandStand_Init.ska' descchecksum = PrimoHandStand_Init
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\PrimoHandStand_Out.ska' descchecksum = PrimoHandStand_Out
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\PrimoHandStand_Range.ska' descchecksum = PrimoHandStand_Range
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\RowleyDarkSlideHandStand_Init.ska' descchecksum = RowleyDarkSlideHandStand_Init
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\RowleyDarkSlideHandStand_Out.ska' descchecksum = RowleyDarkSlideHandStand_Out
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\RowleyDarkSlideHandStand_Range.ska' descchecksum = RowleyDarkSlideHandStand_Range
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\Shifty360ShovItBSShifty_Idle.ska' descchecksum = Shifty360ShovItBSShifty_Idle
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\Shifty360ShovItBSShifty_Init.ska' descchecksum = Shifty360ShovItBSShifty_Init
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\Shifty360ShovItBSShifty_Out.ska' descchecksum = Shifty360ShovItBSShifty_Out
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\_540VarielHeelflipLien.ska' descchecksum = _540VarielHeelflipLien
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\The900.ska' descchecksum = The900
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\Indy900.ska' descchecksum = Indy900
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\_1234.ska' descchecksum = _1234
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\Special_Bam_Chainsaw_Init.ska' descchecksum = Special_Bam_Chainsaw_Init
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\Special_Bam_Chainsaw_Idle.ska' descchecksum = Special_Bam_Chainsaw_Idle
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\Special_Bam_Chainsaw_Out.ska' descchecksum = Special_Bam_Chainsaw_Out
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\Special_Bam_Lip_Init.ska' descchecksum = Special_Bam_Lip_Init
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\Special_Bam_Lip_Idle.ska' descchecksum = Special_Bam_Lip_Idle
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\Special_Bam_Lip_Out.ska' descchecksum = Special_Bam_Lip_Out
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\BeaverBlast.ska' descchecksum = BeaverBlast
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\Special_FranklinGrind_Init.ska' descchecksum = Special_FranklinGrind_Init
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\Special_FranklinGrind_Range.ska' descchecksum = Special_FranklinGrind_Range
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\Special_FranklinGrind_Out.ska' descchecksum = Special_FranklinGrind_Out
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\Special_FranklinGrind_Idle.ska' descchecksum = Special_FranklinGrind_Idle
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\Special_Bob_DrksldJapan_Init.ska' descchecksum = Special_Bob_DrksldJapan_Init
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\Special_Bob_DrksldJapan_Idle.ska' descchecksum = Special_Bob_DrksldJapan_Idle
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\Special_Bob_DrksldJapan_Out.ska' descchecksum = Special_Bob_DrksldJapan_Out
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\Special_Bob_RockNRollswitch_Init.ska' descchecksum = Special_Bob_RockNRollswitch_Init
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\Special_Bob_RockNRollswitch_Idle.ska' descchecksum = Special_Bob_RockNRollswitch_Idle
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\Special_Bob_RockNRollswitch_Out.ska' descchecksum = Special_Bob_RockNRollswitch_Out
    endif
    SetReferenceChecksum 0
endscript


script animload_THPS6_human_net_16 LoadFunction = LoadAnim
    SetReferenceChecksum THPS6_human
    if <LoadFunction> <...> name = 'anims\THPS6_skater_special\Special_BullF_Sword_Init.ska' descchecksum = Special_BullF_Sword_Init
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\Special_BullF_Sword_Idle.ska' descchecksum = Special_BullF_Sword_Idle
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\Special_BullF_Sword_Out.ska' descchecksum = Special_BullF_Sword_Out
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\Special_Eric_RnngMan_Init.ska' descchecksum = Special_Eric_RnngMan_Init
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\Special_Eric_RnngMan_Idle.ska' descchecksum = Special_Eric_RnngMan_Idle
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\Special_GrafPunk_Init.ska' descchecksum = Special_GrafPunk_Init
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\Special_GrafPunk_Idle.ska' descchecksum = Special_GrafPunk_Idle
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\Special_GrafPunk_Out.ska' descchecksum = Special_GrafPunk_Out
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\Special_Hand_Thebird_Init.ska' descchecksum = Special_Hand_Thebird_Init
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\Special_Hand_Thebird_Range.ska' descchecksum = Special_Hand_Thebird_Range
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\Special_Hand_Thebird_Out.ska' descchecksum = Special_Hand_Thebird_Out
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\Special_Jesse_HotRod_Init.ska' descchecksum = Special_Jesse_HotRod_Init
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\Special_Jesse_HotRod_Range.ska' descchecksum = Special_Jesse_HotRod_Range
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\Special_Jesse_HotRod_Out.ska' descchecksum = Special_Jesse_HotRod_Out
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\Special_Jester_Juggle_init.ska' descchecksum = Special_Jester_Juggle_init
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\Special_Jester_Juggle_Idle.ska' descchecksum = Special_Jester_Juggle_Idle
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\Special_Jester_Juggle_Out.ska' descchecksum = Special_Jester_Juggle_Out
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\Special_Koston_900.ska' descchecksum = Special_Koston_900
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\Special_Koston_EndlessFlip_Init.ska' descchecksum = Special_Koston_EndlessFlip_Init
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\Special_Koston_EndlessFlip_Idle.ska' descchecksum = Special_Koston_EndlessFlip_Idle
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\Special_Koston_EndlessFlip_Out.ska' descchecksum = Special_Koston_EndlessFlip_Out
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\Special_MikeV_Around_Int.ska' descchecksum = Special_MikeV_Around_Int
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\Special_MikeV_Around_Range.ska' descchecksum = Special_MikeV_Around_Range
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\Special_MikeV_Around_Out.ska' descchecksum = Special_MikeV_Around_Out
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\Special_MikeV_Boomerang.ska' descchecksum = Special_MikeV_Boomerang
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\Special_Muska_Burn_init.ska' descchecksum = Special_Muska_Burn_init
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\Special_Muska_Burn_Range.ska' descchecksum = Special_Muska_Burn_Range
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\Special_Muska_Burn_Out.ska' descchecksum = Special_Muska_Burn_Out
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\Special_Muska_Worm_Init.ska' descchecksum = Special_Muska_Worm_Init
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\Special_Muska_Worm_Idle.ska' descchecksum = Special_Muska_Worm_Idle
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\Special_Muska_Worm_Out.ska' descchecksum = Special_Muska_Worm_Out
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\Special_Natas_spin_init.ska' descchecksum = Special_Natas_spin_init
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\Special_Natas_Spin_Range.ska' descchecksum = Special_Natas_Spin_Range
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\Special_Paulie_ButtMan_Init.ska' descchecksum = Special_Paulie_ButtMan_Init
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\Special_Paulie_ButtMan_Range.ska' descchecksum = Special_Paulie_ButtMan_Range
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\Special_Paulie_ButtMan_Out.ska' descchecksum = Special_Paulie_ButtMan_Out
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\Special_Phil_Hoagie_Init.ska' descchecksum = Special_Phil_Hoagie_Init
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\Special_Phil_Hoagie_Idle.ska' descchecksum = Special_Phil_Hoagie_Idle
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\Special_Phil_Hoagie_Out.ska' descchecksum = Special_Phil_hoagie_Out
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\Special_Rodney_PrimoSpin_Init.ska' descchecksum = Special_Rodney_PrimoSpin_Init
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\Special_Rodney_PrimoSpin_Idle.ska' descchecksum = Special_Rodney_PrimoSpin_Idle
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\Special_Rodney_PrimoSpin_Out.ska' descchecksum = Special_Rodney_PrimoSpin_Out
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\Special_Rodney_HlfcabUndrFlip.ska' descchecksum = Special_Rodney_HlfcabUndrFlip
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\Special_Sheckler_Primo_Init.ska' descchecksum = Special_Sheckler_Primo_Init
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\Special_Sheckler_Primo_Range.ska' descchecksum = Special_Sheckler_Primo_Range
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\Special_Sheckler_Primo_Out.ska' descchecksum = Special_Sheckler_Primo_Out
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\Special_Sheckler_Grab_Init.ska' descchecksum = Special_Sheckler_Grab_Init
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\Special_Sheckler_Grab_Idle.ska' descchecksum = Special_Sheckler_Grab_Idle
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\Special_Sheckler_Grab_Out.ska' descchecksum = Special_Sheckler_Grab_Out
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\Special_Shrek_WaxSlide_Init.ska' descchecksum = Special_Shrek_WaxSlide_Init
    endif
    SetReferenceChecksum 0
endscript


script animload_THPS6_human_net_17 LoadFunction = LoadAnim
    SetReferenceChecksum THPS6_human
    if <LoadFunction> <...> name = 'anims\THPS6_skater_special\Special_Shrek_WaxSlide_Range.ska' descchecksum = Special_Shrek_WaxSlide_Range
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\Special_Shrek_WaxSlide_Out.ska' descchecksum = Special_Shrek_WaxSlide_Out
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\Special_Shrek_BoardSnap.ska' descchecksum = Special_Shrek_BoardSnap
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\Shrek_BurpTag.ska' descchecksum = Shrek_BurpTag
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\Shrek_BurpHangingTag.ska' descchecksum = Shrek_BurpHangingTag
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\Special_Shrimp_Rotisserie.ska' descchecksum = Special_Shrimp_Rotisserie
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\Special_Soldier_Solute.ska' descchecksum = Special_Soldier_Solute
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\Special_Soldier_AmerHero2_init.ska' descchecksum = Special_Soldier_AmerHero2_Init
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\Special_Soldier_AmerHero2_Idle.ska' descchecksum = Special_Soldier_AmerHero2_Idle
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\Special_Soldier_AmerHero2_Out.ska' descchecksum = Special_Soldier_AmerHero2_Out
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\Special_SteveO_BiteBoard.ska' descchecksum = Special_SteveO_BiteBoard
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\Special_Tony_Surfer_init.ska' descchecksum = Special_Tony_Surfer_init
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\Special_Tony_Surfer_Idle.ska' descchecksum = Special_Tony_Surfer_Idle
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\Special_Tony_Windmill_Init.ska' descchecksum = Special_Tony_Windmill_Init
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\Special_Tony_Windmill_Idle.ska' descchecksum = Special_Tony_Windmill_Idle
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\Special_Tony_Windmill_Out.ska' descchecksum = Special_Tony_Windmill_Out
        <LoadFunction> <...> name = 'anims\THPS6_skater_special\Special_Weeman_KickHead.ska' descchecksum = Special_Weeman_KickHead
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\Wallplant_Sticker.ska' descchecksum = Wallplant_Sticker
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\Standing_Tag2.ska' descchecksum = Standing_Tag2
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\Hanging_Tag.ska' descchecksum = Hanging_Tag
        <LoadFunction> <...> name = 'anims\THPS6_skater_basics\VertPlant.ska' descchecksum = VertPlant
        <LoadFunction> <...> name = 'anims\THPS6_Bail_GetUp\GetUp_HK_Ft_T.ska' descchecksum = GetUp_HK_Ft_T
        <LoadFunction> <...> name = 'anims\THPS6_Skater_Basics\Throw_Sidearm.ska' descchecksum = Throw_Sidearm
        <LoadFunction> <...> name = 'anims\THPS6_Skater_Basics\Standing_Throw.ska' descchecksum = Standing_Throw
        <LoadFunction> <...> name = 'anims\THPS6_Skater_Basics\Throw_Sidearm_Partial.ska' descchecksum = Throw_Sidearm_Partial
        <LoadFunction> <...> name = 'anims\THPS6_Skater_Basics\Walking_Throw_Partial.ska' descchecksum = Walking_Throw_Partial
        <LoadFunction> <...> name = 'anims\thps6_skater_OnFoot\WalkingSlap.ska' descchecksum = WalkingSlap
        <LoadFunction> <...> name = 'anims\thps6_skater_OnFoot\Jump_DoubleJump.ska' descchecksum = Jump_DoubleJump
        <LoadFunction> <...> name = 'anims\thps6_skater_OnFoot\AirIdleToJumpAir.ska' descchecksum = AirIdleToJumpAir
        <LoadFunction> <...> name = 'anims\thps6_skater_OnFoot\FastRun.ska' descchecksum = FastRun
        <LoadFunction> <...> name = 'anims\thps6_skater_OnFoot\HangIdle.ska' descchecksum = HangIdle
        <LoadFunction> <...> name = 'anims\thps6_skater_OnFoot\HangIdleToDrop.ska' descchecksum = HangIdleToDrop
        <LoadFunction> <...> name = 'anims\thps6_skater_OnFoot\HangLeft.ska' descchecksum = hangleft
        <LoadFunction> <...> name = 'anims\thps6_skater_OnFoot\HangOntoTheTop.ska' descchecksum = HangOntoTheTop
        <LoadFunction> <...> name = 'anims\thps6_skater_OnFoot\HangRight.ska' descchecksum = hangright
        <LoadFunction> <...> name = 'anims\thps6_skater_OnFoot\JumpAir.ska' descchecksum = JumpAir
        <LoadFunction> <...> name = 'anims\thps6_skater_OnFoot\JumpAirTo5050.ska' descchecksum = JumpAirTo5050
        <LoadFunction> <...> name = 'anims\thps6_skater_OnFoot\JumpAirToAirIdle.ska' descchecksum = JumpAirToAirIdle
        <LoadFunction> <...> name = 'anims\thps6_skater_OnFoot\JumpAirToManual.ska' descchecksum = JumpAirToManual
        <LoadFunction> <...> name = 'anims\thps6_skater_OnFoot\JumpLandToRun.ska' descchecksum = JumpLandToRun
        <LoadFunction> <...> name = 'anims\thps6_skater_OnFoot\JumpLandToStand.ska' descchecksum = JumpLandToStand
        <LoadFunction> <...> name = 'anims\thps6_skater_OnFoot\LadderClimb.ska' descchecksum = LadderClimb
        <LoadFunction> <...> name = 'anims\thps6_skater_OnFoot\LadderClimbFromStandIdle.ska' descchecksum = LadderClimbFromStandIdle
        <LoadFunction> <...> name = 'anims\thps6_skater_OnFoot\LadderOntoTheTop.ska' descchecksum = LadderOntoTheTop
        <LoadFunction> <...> name = 'anims\thps6_skater_OnFoot\RunToJump.ska' descchecksum = runtojump
        <LoadFunction> <...> name = 'anims\thps6_skater_OnFoot\StandToHang.ska' descchecksum = StandToHang
        <LoadFunction> <...> name = 'anims\thps6_skater_OnFoot\StandToJump.ska' descchecksum = StandToJump
        <LoadFunction> <...> name = 'anims\thps6_skater_OnFoot\WRun.ska' descchecksum = Wrun
        <LoadFunction> <...> name = 'anims\thps6_skater_OnFoot\WRunToSkate.ska' descchecksum = WRunToSkate
        <LoadFunction> <...> name = 'anims\thps6_skater_OnFoot\WSkateToRun.ska' descchecksum = WSkateToRun
    endif
    SetReferenceChecksum 0
endscript


script animload_THPS6_human_net_18 LoadFunction = LoadAnim
    SetReferenceChecksum THPS6_human
    if <LoadFunction> <...> name = 'anims\thps6_skater_OnFoot\WStand.ska' descchecksum = WStand
        <LoadFunction> <...> name = 'anims\thps6_skater_OnFoot\WStandToRun.ska' descchecksum = WStandToRun
        <LoadFunction> <...> name = 'anims\thps6_skater_OnFoot\WStandToWalk.ska' descchecksum = WStandToWalk
        <LoadFunction> <...> name = 'anims\thps6_skater_OnFoot\WWalk.ska' descchecksum = WWalk
        <LoadFunction> <...> name = 'anims\thps6_skater_OnFoot\WWalkToStand.ska' descchecksum = WWalkToStand
        <LoadFunction> <...> name = 'anims\thps6_skater_OnFoot\WalkFast.ska' descchecksum = WalkFast
        <LoadFunction> <...> name = 'anims\thps6_skater_OnFoot\WalkSlow.ska' descchecksum = WalkSlow
        <LoadFunction> <...> name = 'anims\thps6_skater_OnFoot\_180RunSkid.ska' descchecksum = _180RunSkid
        <LoadFunction> <...> name = 'anims\thps6_skater_OnFoot\SkateToStand.ska' descchecksum = SkateToStand
        <LoadFunction> <...> name = 'anims\thps6_skater_OnFoot\SkateToWalk.ska' descchecksum = SkateToWalk
        <LoadFunction> <...> name = 'anims\thps6_skater_OnFoot\BrakeToStand.ska' descchecksum = BrakeToStand
        <LoadFunction> <...> name = 'anims\thps6_skater_OnFoot\SlowSkateToStand.ska' descchecksum = SlowSkateToStand
        <LoadFunction> <...> name = 'anims\thps6_skater_OnFoot\WStandIdle1.ska' descchecksum = WStandIdle1
        <LoadFunction> <...> name = 'anims\thps6_skater_OnFoot\WStandIdle2.ska' descchecksum = WStandIdle2
        <LoadFunction> <...> name = 'anims\thps6_skater_OnFoot\WStandIdle3.ska' descchecksum = WStandIdle3
        <LoadFunction> <...> name = 'anims\thps6_skater_OnFoot\WStandIdle4.ska' descchecksum = WStandIdle4
        <LoadFunction> <...> name = 'anims\thps6_skater_OnFoot\WStandIdle5.ska' descchecksum = WStandIdle5
        <LoadFunction> <...> name = 'anims\thps6_skater_OnFoot\WStandIdle6.ska' descchecksum = WStandIdle6
        <LoadFunction> <...> name = 'anims\thps6_skater_OnFoot\JumpToSwingHang.ska' descchecksum = JumpToSwingHang
        <LoadFunction> <...> name = 'anims\thps6_skater_OnFoot\JumpToWallHang.ska' descchecksum = JumpToWallHang
        <LoadFunction> <...> name = 'anims\thps6_skater_OnFoot\LadderFastClimb.ska' descchecksum = LadderFastClimb
        <LoadFunction> <...> name = 'anims\thps6_skater_OnFoot\JumpAirToNoseManual.ska' descchecksum = JumpAirToNoseManual
        <LoadFunction> <...> name = 'anims\thps6_skater_OnFoot\JumpLandToWalk.ska' descchecksum = JumpLandToWalk
        <LoadFunction> <...> name = 'anims\thps6_skater_OnFoot\SkateToSkid.ska' descchecksum = SkateToSkid
    endif
    SetReferenceChecksum 0
endscript


script animload_PED_FluteGuy LoadFunction = LoadAnim
    SetReferenceChecksum THPS6_human
    if <LoadFunction> <...> name = 'anims\Ped_FluteGuy\FluteGuy_Idle.ska' descchecksum = Fluteguy_idle
        <LoadFunction> <...> name = 'anims\Ped_FluteGuy\FluteGuy_Idle2.ska' descchecksum = FluteGuy_Idle2
        <LoadFunction> <...> name = 'anims\Ped_FluteGuy\FluteGuy_GrabFlute.ska' descchecksum = Fluteguy_GrabFlute
        <LoadFunction> <...> name = 'anims\Ped_FluteGuy\FluteGuy_Play.ska' descchecksum = Fluteguy_Play
        <LoadFunction> <...> name = 'anims\Ped_FluteGuy\Fluteguy_Play1toPlay2.ska' descchecksum = Fluteguy_Play1toPLay2
        <LoadFunction> <...> name = 'anims\Ped_FluteGuy\FluteGuy_Play2.ska' descchecksum = Fluteguy_Play2
        <LoadFunction> <...> name = 'anims\Ped_FluteGuy\Fluteguy_Play2toGrabFlute.ska' descchecksum = Fluteguy_Play2toGrabFlute
        <LoadFunction> <...> name = 'anims\Ped_FluteGuy\FluteGuy_Play3.ska' descchecksum = Fluteguy_Play3
        <LoadFunction> <...> name = 'anims\Ped_FluteGuy\FluteGuy_BackToIdle.ska' descchecksum = Fluteguy_BackToidle
    endif
    SetReferenceChecksum 0
endscript


script animload_Ped_F_MardisGras LoadFunction = LoadAnim
    SetReferenceChecksum ped_female
    if <LoadFunction> <...> name = 'anims\Ped_F_MardisGras\Ped_F_Dance2.ska' descchecksum = Ped_F_Dance2
        <LoadFunction> <...> name = 'anims\Ped_F_MardisGras\Ped_F_Dance3.ska' descchecksum = Ped_F_Dance3
        <LoadFunction> <...> name = 'anims\Ped_F_MardisGras\Ped_F_Dance1.ska' descchecksum = Ped_F_Dance1
        <LoadFunction> <...> name = 'anims\Ped_F_MardisGras\Ped_F_Dance_GetAttention.ska' descchecksum = Ped_F_Dance_GetAttention
        <LoadFunction> <...> name = 'anims\Ped_F_MardisGras\Ped_F_ShowEm.ska' descchecksum = Ped_F_ShowEm
    endif
    SetReferenceChecksum 0
endscript


script animload_Ped_F_Zombie LoadFunction = LoadAnim
    SetReferenceChecksum THPS6_human
    if <LoadFunction> <...> name = 'anims\Ped_F_Zombie\Ped_F_Zombie_Idle.ska' descchecksum = Ped_F_Zombie_Idle
        <LoadFunction> <...> name = 'anims\Ped_F_Zombie\Ped_F_Zombie_StartWalk.ska' descchecksum = Ped_F_Zombie_StartWalk
        <LoadFunction> <...> name = 'anims\Ped_F_Zombie\Ped_F_Zombie_WalkCycle.ska' descchecksum = Ped_F_Zombie_WalkCycle
        <LoadFunction> <...> name = 'anims\Ped_F_Zombie\Ped_F_Zombie_StopWalk.ska' descchecksum = Ped_F_Zombie_StopWalk
        <LoadFunction> <...> name = 'anims\Ped_F_Zombie\Ped_M_Zombie_Idle.ska' descchecksum = Ped_M_Zombie_Idle
        <LoadFunction> <...> name = 'anims\Ped_F_Zombie\Ped_M_Zombie_StartWalk.ska' descchecksum = Ped_M_Zombie_StartWalk
        <LoadFunction> <...> name = 'anims\Ped_F_Zombie\Ped_M_Zombie_WalkCycle.ska' descchecksum = Ped_M_Zombie_WalkCycle
        <LoadFunction> <...> name = 'anims\Ped_F_Zombie\Ped_M_Zombie_StopWalk.ska' descchecksum = Ped_M_Zombie_StopWalk
    endif
    SetReferenceChecksum 0
endscript


script animload_Ped_GermanCop LoadFunction = LoadAnim
    SetReferenceChecksum THPS6_human
    if <LoadFunction> <...> name = 'anims\Ped_GermanCop\Ped_GermanCop_Idle01.ska' descchecksum = Ped_GermanCop_Idle01
        <LoadFunction> <...> name = 'anims\Ped_GermanCop\Ped_GermanCop_Look.ska' descchecksum = Ped_GermanCop_Look
        <LoadFunction> <...> name = 'anims\Ped_GermanCop\Ped_GermanCop_RubsTummy.ska' descchecksum = Ped_GermanCop_RubsTummy
        <LoadFunction> <...> name = 'anims\Ped_GermanCop\Ped_GermanCop_StickOut.ska' descchecksum = Ped_GermanCop_StickOut
        <LoadFunction> <...> name = 'anims\Ped_GermanCop\Ped_GermanCop_StickLook.ska' descchecksum = Ped_GermanCop_StickLook
        <LoadFunction> <...> name = 'anims\Ped_GermanCop\Ped_GermanCop_StickIdle.ska' descchecksum = Ped_GermanCop_StickIdle
        <LoadFunction> <...> name = 'anims\Ped_GermanCop\Ped_GermanCop_Idle2Run.ska' descchecksum = Ped_GermanCop_Idle2Run
        <LoadFunction> <...> name = 'anims\Ped_GermanCop\Ped_GermanCop_StickAway.ska' descchecksum = Ped_GermanCop_StickAway
        <LoadFunction> <...> name = 'anims\Ped_GermanCop\Ped_GermanCop_HandIdle2Stop.ska' descchecksum = Ped_GermanCop_HandIdle2Stop
        <LoadFunction> <...> name = 'anims\Ped_GermanCop\Ped_GermanCop_HandStop2Idle.ska' descchecksum = Ped_GermanCop_HandStop2Idle
        <LoadFunction> <...> name = 'anims\Ped_GermanCop\Ped_GermanCop_HandStop2Go.ska' descchecksum = Ped_GermanCop_HandStop2Go
        <LoadFunction> <...> name = 'anims\Ped_GermanCop\Ped_GermanCop_HandGoLoop.ska' descchecksum = Ped_GermanCop_HandGoLoop
        <LoadFunction> <...> name = 'anims\Ped_GermanCop\Ped_GermanCop_HandGo2Stop.ska' descchecksum = Ped_GermanCop_HandGo2Stop
        <LoadFunction> <...> name = 'anims\Ped_GermanCop\Ped_GermanCop_Idle2Panic.ska' descchecksum = Ped_GermanCop_Idle2Panic
        <LoadFunction> <...> name = 'anims\Ped_GermanCop\Ped_GermanCop_Panic.ska' descchecksum = Ped_GermanCop_Panic
        <LoadFunction> <...> name = 'anims\Ped_GermanCop\Ped_GermanCop_Panic2Idle.ska' descchecksum = Ped_GermanCop_Panic2Idle
    endif
    SetReferenceChecksum 0
endscript


script animload_ped_GermanDrunk LoadFunction = LoadAnim
    SetReferenceChecksum THPS6_human
    if <LoadFunction> <...> name = 'anims\Ped_GermanDrunk\Ped_GermanDrunk_idle.ska' descchecksum = Ped_GermanDrunk_idle
        <LoadFunction> <...> name = 'anims\Ped_GermanDrunk\Ped_GermanDrunk_idle2walk.ska' descchecksum = Ped_GermanDrunk_Idle2Walk
        <LoadFunction> <...> name = 'anims\Ped_GermanDrunk\Ped_GermanDrunk_walk.ska' descchecksum = Ped_GermanDrunk_walk
        <LoadFunction> <...> name = 'anims\Ped_GermanDrunk\Ped_GermanDrunk_walk2idle.ska' descchecksum = Ped_GermanDrunk_Walk2Idle
    endif
    SetReferenceChecksum 0
endscript


script animload_Ped_Graffiti LoadFunction = LoadAnim
    SetReferenceChecksum THPS6_human
    if <LoadFunction> <...> name = 'anims\Ped_Graffiti\Ped_Graffiti_ShakeCan.ska' descchecksum = Ped_Graffiti_ShakeCan
        <LoadFunction> <...> name = 'anims\Ped_Graffiti\Ped_Graffiti_Step2Tag.ska' descchecksum = Ped_Graffiti_Step2Tag
        <LoadFunction> <...> name = 'anims\Ped_Graffiti\Ped_Graffiti_LookAround.ska' descchecksum = Ped_Graffiti_LookAround
        <LoadFunction> <...> name = 'anims\Ped_Graffiti\Ped_Graffiti_Step2BigTag.ska' descchecksum = Ped_Graffiti_Step2BigTag
        <LoadFunction> <...> name = 'anims\Ped_Graffiti\Ped_Graffiti_BigTag01.ska' descchecksum = Ped_Graffiti_BigTag01
        <LoadFunction> <...> name = 'anims\Ped_Graffiti\Ped_Graffiti_BigTag02.ska' descchecksum = Ped_Graffiti_BigTag02
        <LoadFunction> <...> name = 'anims\Ped_Graffiti\Ped_Graffiti_BigTagStepBack.ska' descchecksum = Ped_Graffiti_BigTagStepBack
        <LoadFunction> <...> name = 'anims\Ped_Graffiti\Ped_Graffiti_Idle.ska' descchecksum = Ped_Graffiti_Idle
    endif
    SetReferenceChecksum 0
endscript


script animload_Ped_Griller LoadFunction = LoadAnim
    SetReferenceChecksum THPS6_human
    if <LoadFunction> <...> name = 'anims\Ped_Griller\Ped_Griller_CallingCustomers.ska' descchecksum = Ped_Griller_CallingCustomers
        <LoadFunction> <...> name = 'anims\Ped_Griller\Ped_Griller_FixesGrill.ska' descchecksum = Ped_Griller_FixesGrill
        <LoadFunction> <...> name = 'anims\Ped_Griller\Ped_Griller_Stretch.ska' descchecksum = Ped_Griller_Stretch
        <LoadFunction> <...> name = 'anims\Ped_Griller\Ped_Griller_Idle.ska' descchecksum = Ped_Griller_Idle
        <LoadFunction> <...> name = 'anims\Ped_Griller\Ped_Griller_LooksAround.ska' descchecksum = Ped_Griller_LooksAround
        <LoadFunction> <...> name = 'anims\Ped_Griller\Ped_Griller_Cooking01.ska' descchecksum = Ped_Griller_Cooking01
        <LoadFunction> <...> name = 'anims\Ped_Griller\Ped_Griller_Cooking02.ska' descchecksum = Ped_Griller_Cooking02
    endif
    SetReferenceChecksum 0
endscript


script animload_PED_Guitarist LoadFunction = LoadAnim
    SetReferenceChecksum THPS6_human
    if <LoadFunction> <...> name = 'anims\PED_Guitarist\PED_Guitarist_idle.ska' descchecksum = PED_Guitarist_idle
        <LoadFunction> <...> name = 'anims\PED_Guitarist\PED_Guitarist_grabguitar.ska' descchecksum = PED_Guitarist_GrabGuitar
        <LoadFunction> <...> name = 'anims\PED_Guitarist\PED_Guitarist_play01.ska' descchecksum = PED_Guitarist_Play01
        <LoadFunction> <...> name = 'anims\PED_Guitarist\PED_Guitarist__play02.ska' descchecksum = PED_Guitarist__Play02
        <LoadFunction> <...> name = 'anims\PED_Guitarist\PED_Guitarist_play03.ska' descchecksum = PED_Guitarist_Play03
        <LoadFunction> <...> name = 'anims\PED_Guitarist\PED_Guitarist_back2idle.ska' descchecksum = PED_Guitarist_Back2idle
        <LoadFunction> <...> name = 'anims\PED_Guitarist\PED_Guitarist_play_pick.ska' descchecksum = PED_Guitarist_Play_pick
    endif
    SetReferenceChecksum 0
endscript


script animload_Ped_Imp LoadFunction = LoadAnim
    SetReferenceChecksum THPS6_human
    if <LoadFunction> <...> name = 'anims\PED_Imp\PED_Imp_idle.ska' descchecksum = PED_Imp_idle
        <LoadFunction> <...> name = 'anims\PED_Imp\PED_Imp_Idle2Fly.ska' descchecksum = PED_Imp_Idle2Fly
        <LoadFunction> <...> name = 'anims\PED_Imp\PED_Imp_Fly.ska' descchecksum = PED_Imp_Fly
        <LoadFunction> <...> name = 'anims\PED_Imp\PED_Imp_Fly2Idle.ska' descchecksum = PED_Imp_Fly2Idle
    endif
    SetReferenceChecksum 0
endscript


script animload_Ped_Jazzman LoadFunction = LoadAnim
    SetReferenceChecksum THPS6_human
    if <LoadFunction> <...> name = 'anims\Ped_Jazzman\Ped_Jazzman_idle_01.ska' descchecksum = Ped_Jazzman_idle_01
        <LoadFunction> <...> name = 'anims\Ped_Jazzman\Ped_Jazzman_idle_02.ska' descchecksum = Ped_Jazzman_idle_02
        <LoadFunction> <...> name = 'anims\Ped_Jazzman\Ped_Jazzman_idle_03.ska' descchecksum = Ped_Jazzman_idle_03
        <LoadFunction> <...> name = 'anims\Ped_Jazzman\Ped_Jazzman_GrabTuba.ska' descchecksum = Ped_jazzman_GrabTuba
        <LoadFunction> <...> name = 'anims\Ped_Jazzman\Ped_Jazzman_Play_01.ska' descchecksum = Ped_Jazzman_Play_01
        <LoadFunction> <...> name = 'anims\Ped_Jazzman\Ped_Jazzman_Play_02.ska' descchecksum = Ped_Jazzman_Play_02
        <LoadFunction> <...> name = 'anims\Ped_Jazzman\Ped_Jazzman_Back2idle.ska' descchecksum = Ped_Jazzman_Back2Idle
    endif
    SetReferenceChecksum 0
endscript


script animload_Ped_Jester LoadFunction = LoadAnim
    SetReferenceChecksum THPS6_human
    if <LoadFunction> <...> name = 'anims\Ped_Jester\Ped_Jester_dance01.ska' descchecksum = Ped_Jester_dance01
        <LoadFunction> <...> name = 'anims\Ped_Jester\Ped_Jester_dance02.ska' descchecksum = Ped_Jester_dance02
    endif
    SetReferenceChecksum 0
endscript


script animload_Ped_LostSoul LoadFunction = LoadAnim
    SetReferenceChecksum THPS6_human
    if <LoadFunction> <...> name = 'anims\Ped_LostSoul\Ped_LostSoul_idle1.ska' descchecksum = Ped_LostSoul_idle1
        <LoadFunction> <...> name = 'anims\Ped_LostSoul\Ped_LostSoul_idle2.ska' descchecksum = Ped_LostSoul_idle2
    endif
    SetReferenceChecksum 0
endscript


script animload_Ped_LoungeSinger LoadFunction = LoadAnim
    SetReferenceChecksum THPS6_human
    if <LoadFunction> <...> name = 'anims\Ped_LoungeSinger\Ped_LoungeSinger_LayIdle1.ska' descchecksum = Ped_LoungeSinger_LayIdle1
        <LoadFunction> <...> name = 'anims\Ped_LoungeSinger\Ped_LoungeSinger_LayIdle2.ska' descchecksum = Ped_LoungeSinger_LayIdle2
        <LoadFunction> <...> name = 'anims\Ped_LoungeSinger\Ped_LoungeSinger_Hey.ska' descchecksum = Ped_LoungeSinger_Hey
        <LoadFunction> <...> name = 'anims\Ped_LoungeSinger\Ped_LoungeSinger_GetUp.ska' descchecksum = Ped_LoungeSinger_GetUp
        <LoadFunction> <...> name = 'anims\Ped_LoungeSinger\Ped_LoungeSinger_Dance.ska' descchecksum = Ped_LoungeSinger_Dance
    endif
    SetReferenceChecksum 0
endscript


script animload_Ped_MetalDetect LoadFunction = LoadAnim
    SetReferenceChecksum THPS6_human
    if <LoadFunction> <...> name = 'anims\Ped_MetalDetect\Ped_MetalDetect_Idle01.ska' descchecksum = Ped_MetalDetect_Idle01
        <LoadFunction> <...> name = 'anims\Ped_MetalDetect\Ped_MetalDetect_PicksUpCoin.ska' descchecksum = Ped_MetalDetect_PicksUpCoin
        <LoadFunction> <...> name = 'anims\Ped_MetalDetect\Ped_MetalDetect_StartWalkCycle.ska' descchecksum = Ped_MetalDetect_StartWalkCycle
        <LoadFunction> <...> name = 'anims\Ped_MetalDetect\Ped_MetalDetect_WalkCyle.ska' descchecksum = Ped_MetalDetect_WalkCyle
        <LoadFunction> <...> name = 'anims\Ped_MetalDetect\Ped_MetalDetect_WalkCyleStop.ska' descchecksum = Ped_MetalDetect_WalkCyleStop
    endif
    SetReferenceChecksum 0
endscript


script animload_PED_Mime LoadFunction = LoadAnim
    SetReferenceChecksum THPS6_human
    if <LoadFunction> <...> name = 'anims\PED_Mime\PED_Mime_idle2Wall.ska' descchecksum = PED_Mime_idle2Wall
        <LoadFunction> <...> name = 'anims\PED_Mime\PED_Mime_Wall2Push.ska' descchecksum = PED_Mime_Wall2Push
        <LoadFunction> <...> name = 'anims\PED_Mime\PED_Mime_Wall2idle.ska' descchecksum = PED_Mime_Wall2idle
        <LoadFunction> <...> name = 'anims\PED_Mime\PED_Mime_idle2Push.ska' descchecksum = PED_Mime_idle2Push
        <LoadFunction> <...> name = 'anims\PED_Mime\PED_Mime_Push2Wall.ska' descchecksum = PED_Mime_Push2Wall
        <LoadFunction> <...> name = 'anims\PED_Mime\PED_Mime_Push2idle.ska' descchecksum = PED_Mime_Push2idle
        <LoadFunction> <...> name = 'anims\PED_Mime\PED_Mime_idle2Pull.ska' descchecksum = PED_Mime_idle2Pull
        <LoadFunction> <...> name = 'anims\PED_Mime\PED_Mime_Pull.ska' descchecksum = PED_Mime_Pull
        <LoadFunction> <...> name = 'anims\PED_Mime\PED_Mime_Pull2idle.ska' descchecksum = PED_Mime_Pull2idle
        <LoadFunction> <...> name = 'anims\PED_Mime\PED_Mime_idle.ska' descchecksum = PED_Mime_idle
    endif
    SetReferenceChecksum 0
endscript


script animload_THPS6_FrontEnd LoadFunction = LoadAnim
    SetReferenceChecksum THPS6_human
    if <LoadFunction> <...> name = 'anims\THPS6_FrontEnd\Ped_M_CheckDamage.ska' descchecksum = Ped_M_CheckDamage
        <LoadFunction> <...> name = 'anims\THPS6_FrontEnd\FrontEnd_1.ska' descchecksum = FrontEnd_1
        <LoadFunction> <...> name = 'anims\THPS6_FrontEnd\FrontEnd_2.ska' descchecksum = FrontEnd_2
        <LoadFunction> <...> name = 'anims\THPS6_FrontEnd\FrontEnd_3.ska' descchecksum = FrontEnd_3
        <LoadFunction> <...> name = 'anims\THPS6_FrontEnd\FrontEnd_4.ska' descchecksum = FrontEnd_4
        <LoadFunction> <...> name = 'anims\THPS6_FrontEnd\FrontEnd_CAS_LookArms.ska' descchecksum = FrontEnd_CAS_LookArms
        <LoadFunction> <...> name = 'anims\THPS6_FrontEnd\FrontEnd_CAS_LookLegs.ska' descchecksum = FrontEnd_CAS_LookLegs
        <LoadFunction> <...> name = 'anims\THPS6_FrontEnd\FrontEnd_CAS_LookFeet.ska' descchecksum = FrontEnd_CAS_LookFeet
        <LoadFunction> <...> name = 'anims\THPS6_FrontEnd\FrontEnd_CAS_ThumbsUp.ska' descchecksum = FrontEnd_CAS_ThumbsUp
        <LoadFunction> <...> name = 'anims\THPS6_FrontEnd\FrontEnd_CAS_WhatTha.ska' descchecksum = FrontEnd_CAS_WhatTha
        <LoadFunction> <...> name = 'anims\THPS6_FrontEnd\FrontEnd_CAS_HoldBoard_Bot.ska' descchecksum = FrontEnd_CAS_HoldBoard_Bot
        <LoadFunction> <...> name = 'anims\THPS6_FrontEnd\FrontEnd_CAS_HoldBoard_Top.ska' descchecksum = FrontEnd_CAS_HoldBoard_Top
        <LoadFunction> <...> name = 'anims\THPS6_FrontEnd\FrontEnd_CAS_HoldBoard_Switch.ska' descchecksum = FrontEnd_CAS_HoldBoard_Switch
        <LoadFunction> <...> name = 'anims\THPS6_FrontEnd\FrontEnd_Wheel_Idle_1.ska' descchecksum = FrontEnd_Wheel_Idle_1
        <LoadFunction> <...> name = 'anims\THPS6_FrontEnd\FrontEnd_Wheel_Idle_2.ska' descchecksum = FrontEnd_Wheel_Idle_2
        <LoadFunction> <...> name = 'anims\THPS6_FrontEnd\FrontEnd_Wheel_Idle_3.ska' descchecksum = FrontEnd_Wheel_Idle_3
        <LoadFunction> <...> name = 'anims\THPS6_FrontEnd\FrontEnd_Wheel_Spin_Dwn.ska' descchecksum = FrontEnd_Wheel_Spin_Dwn
        <LoadFunction> <...> name = 'anims\THPS6_FrontEnd\FrontEnd_Wheel_Spin_Up.ska' descchecksum = FrontEnd_Wheel_Spin_Up
        <LoadFunction> <...> name = 'anims\THPS6_FrontEnd\FrontEnd_Wheel_Spin_Hard.ska' descchecksum = FrontEnd_Wheel_Spin_Hard
        <LoadFunction> <...> name = 'anims\THPS6_FrontEnd\FrontEnd_Wheel_Spin_Idle.ska' descchecksum = FrontEnd_Wheel_Spin_Idle
        <LoadFunction> <...> name = 'anims\THPS6_FrontEnd\FrontEnd_Wheel_Spin_Idle2.ska' descchecksum = FrontEnd_Wheel_Spin_Idle2
        <LoadFunction> <...> name = 'anims\THPS6_FrontEnd\FrontEnd_Spin2Wheel.ska' descchecksum = FrontEnd_Spin2Wheel
    endif
    SetReferenceChecksum 0
endscript


script animload_THPS6_NO_7 LoadFunction = LoadAnim
    SetReferenceChecksum THPS6_human
    if <LoadFunction> <...> name = 'anims\Ped_M_Idles\Ped_M_Sit_Idle_A.ska' descchecksum = Ped_M_Sit_Idle_A
        <LoadFunction> <...> name = 'anims\Ped_M_Idles\Ped_M_Sit_Idle_B.ska' descchecksum = Ped_M_Sit_Idle_B
        <LoadFunction> <...> name = 'anims\Ped_M_Idles\Ped_M_Sit_Idle_C.ska' descchecksum = Ped_M_Sit_Idle_C
    endif
    SetReferenceChecksum 0
endscript


script animload_Ped_Photo LoadFunction = LoadAnim
    SetReferenceChecksum THPS6_human
    if <LoadFunction> <...> name = 'anims\Ped_Photo\Ped_Photo_CheckCamera.ska' descchecksum = Ped_Photo_CheckCamera
        <LoadFunction> <...> name = 'anims\Ped_Photo\Ped_Photo_PhotoIdle.ska' descchecksum = Ped_Photo_PhotoIdle
        <LoadFunction> <...> name = 'anims\Ped_Photo\Ped_Photo_Shoot1.ska' descchecksum = Ped_Photo_Shoot1
        <LoadFunction> <...> name = 'anims\Ped_Photo\Ped_Photo_Shoot2.ska' descchecksum = Ped_Photo_Shoot2
        <LoadFunction> <...> name = 'anims\Ped_Photo\Ped_Photo_Wait.ska' descchecksum = Ped_Photo_Wait
        <LoadFunction> <...> name = 'anims\Ped_Photo\default.ska' descchecksum = default
    endif
    SetReferenceChecksum 0
endscript


script animload_Ped_RampKid LoadFunction = LoadAnim
    SetReferenceChecksum THPS6_human
    if <LoadFunction> <...> name = 'anims\Ped_RampKid\Ped_RampKid_Looking.ska' descchecksum = Ped_RampKid_Looking
        <LoadFunction> <...> name = 'anims\Ped_RampKid\Ped_RampKid_PutBoardDown.ska' descchecksum = Ped_RampKid_PutBoardDown
        <LoadFunction> <...> name = 'anims\Ped_RampKid\Ped_RampKid_BrdDwnLooks.ska' descchecksum = Ped_RampKid_BrdDwnLooks
        <LoadFunction> <...> name = 'anims\Ped_RampKid\Ped_RampKid_BrdDwnHelmet.ska' descchecksum = Ped_RampKid_BrdDwnHelmet
        <LoadFunction> <...> name = 'anims\Ped_RampKid\Ped_RampKid_PickUpBrd.ska' descchecksum = Ped_RampKid_PickUpBrd
        <LoadFunction> <...> name = 'anims\Ped_RampKid\Ped_RampKid_Idle01.ska' descchecksum = Ped_RampKid_Idle01
    endif
    SetReferenceChecksum 0
endscript


script animload_Ped_Rollerblade LoadFunction = LoadAnim
    SetReferenceChecksum THPS6_human
    if <LoadFunction> <...> name = 'anims\PED_RollerBlade\Ped_RollerBlader_SkateCycle.ska' descchecksum = Ped_Rollerblader_SkateCycle
        <LoadFunction> <...> name = 'anims\PED_RollerBlade\Ped_RollerBlader_ParadingAss.ska' descchecksum = Ped_RollerBlader_ParadingAss
        <LoadFunction> <...> name = 'anims\PED_RollerBlade\Ped_RollerBlader_Spin2Back.ska' descchecksum = Ped_RollerBlader_Spin2Back
        <LoadFunction> <...> name = 'anims\PED_RollerBlade\Ped_RollerBlader_BackSkate.ska' descchecksum = Ped_Rollerblader_BackSkate
        <LoadFunction> <...> name = 'anims\PED_RollerBlade\Ped_RollerBlader_Spin2Front.ska' descchecksum = Ped_Rollerblader_Spin2Front
        <LoadFunction> <...> name = 'anims\PED_RollerBlade\Ped_RollerBlader_HeelClick.ska' descchecksum = Ped_Rollerblader_HeelClick
        <LoadFunction> <...> name = 'anims\PED_RollerBlade\Ped_RollerBlader_StartHipPrance.ska' descchecksum = Ped_Rollerblader_StartHipPrance
        <LoadFunction> <...> name = 'anims\PED_RollerBlade\Ped_RollerBlader_HipPrance.ska' descchecksum = Ped_Rollerblader_HipPrance
        <LoadFunction> <...> name = 'anims\PED_RollerBlade\Ped_RollerBlader_StopHipPrance.ska' descchecksum = Ped_Rollerblader_StopHipPrance
    endif
    SetReferenceChecksum 0
endscript


script animload_Ped_Soldier LoadFunction = LoadAnim
    SetReferenceChecksum THPS6_human
    if <LoadFunction> <...> name = 'anims\Ped_Soldier\Ped_Sldr_Start.ska' descchecksum = Ped_Sldr_Start
        <LoadFunction> <...> name = 'anims\Ped_Soldier\Ped_Sldr_Marching01.ska' descchecksum = Ped_Sldr_Marching01
        <LoadFunction> <...> name = 'anims\Ped_Soldier\Ped_Sldr_Marching02_P.ska' descchecksum = Ped_Sldr_Marching02_P
        <LoadFunction> <...> name = 'anims\Ped_Soldier\Ped_Sldr_Marching03_P.ska' descchecksum = Ped_Sldr_Marching03_P
        <LoadFunction> <...> name = 'anims\Ped_Soldier\Ped_Sldr_Marching04_P.ska' descchecksum = Ped_Sldr_Marching04_P
        <LoadFunction> <...> name = 'anims\Ped_Soldier\Ped_Sldr_Marching06_P.ska' descchecksum = Ped_Sldr_Marching06_P
        <LoadFunction> <...> name = 'anims\Ped_Soldier\Ped_Sldr_Stop01.ska' descchecksum = Ped_Sldr_Stop01
        <LoadFunction> <...> name = 'anims\Ped_Soldier\Ped_Sldr_Drumming10_P.ska' descchecksum = Ped_Sldr_Drumming10_P
        <LoadFunction> <...> name = 'anims\Ped_Soldier\Ped_Sldr_Drumming02.ska' descchecksum = Ped_Sldr_Drumming02
        <LoadFunction> <...> name = 'anims\Ped_Soldier\Ped_Sldr_Drumming04_P.ska' descchecksum = Ped_Sldr_Drumming04_P
        <LoadFunction> <...> name = 'anims\Ped_Soldier\Ped_Sldr_Drumming06_P.ska' descchecksum = Ped_Sldr_Drumming06_P
        <LoadFunction> <...> name = 'anims\Ped_Soldier\Ped_Sldr_Drumming08_P.ska' descchecksum = Ped_Sldr_Drumming08_P
    endif
    SetReferenceChecksum 0
endscript


script animload_PED_Starwarskid LoadFunction = LoadAnim
    SetReferenceChecksum THPS6_human
    if <LoadFunction> <...> name = 'anims\PED_Starwarskid\PED_Starwarskid_idle_sit01.ska' descchecksum = Ped_Starwarskid_Idle_sit01
        <LoadFunction> <...> name = 'anims\PED_Starwarskid\PED_Starwarskid_idle_sit02.ska' descchecksum = Ped_Starwarskid_Idle_sit02
        <LoadFunction> <...> name = 'anims\PED_Starwarskid\PED_Starwarskid_idle_sit03.ska' descchecksum = Ped_Starwarskid_Idle_sit03
        <LoadFunction> <...> name = 'anims\PED_Starwarskid\PED_Starwarskid_stand.ska' descchecksum = Ped_Starwarskid_stand
        <LoadFunction> <...> name = 'anims\PED_Starwarskid\PED_Starwarskid_clip01.ska' descchecksum = Ped_StarWarsKid_Clip01
        <LoadFunction> <...> name = 'anims\PED_Starwarskid\PED_Starwarskid_clip02.ska' descchecksum = Ped_StarWarsKid_Clip02
        <LoadFunction> <...> name = 'anims\PED_Starwarskid\PED_Starwarskid_sitdown.ska' descchecksum = Ped_Starwarskid_sitdown
        <LoadFunction> <...> name = 'anims\PED_Starwarskid\PED_Starwarskid_ComeHere.ska' descchecksum = Ped_Starwarskid_ComeHere
    endif
    SetReferenceChecksum 0
endscript


script animload_Ped_Suit LoadFunction = LoadAnim
    SetReferenceChecksum THPS6_human
    if <LoadFunction> <...> name = 'anims\Ped_Suit\Ped_Suit_Ogle.ska' descchecksum = Ped_Suit_Ogle
        <LoadFunction> <...> name = 'anims\Ped_Suit\Ped_Suit_Dance.ska' descchecksum = Ped_Suit_Dance
        <LoadFunction> <...> name = 'anims\Ped_Suit\Ped_Suit_OgleToDance.ska' descchecksum = Ped_Suit_OgleToDance
        <LoadFunction> <...> name = 'anims\Ped_Suit\Ped_Suit_OgleFromDance.ska' descchecksum = Ped_Suit_OgleFromDance
    endif
    SetReferenceChecksum 0
endscript


script animload_Phil_Head LoadFunction = LoadAnim
    SetReferenceChecksum Phil_Head
    if <LoadFunction> <...> name = 'anims\Phil_Head\default.ska' descchecksum = default
        <LoadFunction> <...> name = 'anims\Phil_Head\idle.ska' descchecksum = idle
    endif
    SetReferenceChecksum 0
endscript


script animload_Rampkid_HEAD LoadFunction = LoadAnim
    SetReferenceChecksum Rampkid_HEAD
    if <LoadFunction> <...> name = 'anims\Rampkid_HEAD\default.ska' descchecksum = default
        <LoadFunction> <...> name = 'anims\Rampkid_HEAD\idle.ska' descchecksum = idle
    endif
    SetReferenceChecksum 0
endscript


script animload_SI_bustedboard LoadFunction = LoadAnim
    SetReferenceChecksum SI_BustedBoard
    if <LoadFunction> <...> name = 'anims\SI_BustedBoard\DaffyBroken_Init.ska' descchecksum = DaffyBroken_Init
        <LoadFunction> <...> name = 'anims\SI_BustedBoard\DaffyBroken_Range.ska' descchecksum = DaffyBroken_Range
        <LoadFunction> <...> name = 'anims\SI_BustedBoard\MightAsWellJUMP_Init.ska' descchecksum = MightAsWellJUMP_Init
        <LoadFunction> <...> name = 'anims\SI_BustedBoard\MightAsWellJUMP_Idle.ska' descchecksum = MightAsWellJUMP_Idle
        <LoadFunction> <...> name = 'anims\SI_BustedBoard\MightAsWellJUMP_Out.ska' descchecksum = MightAsWellJUMP_Out
        <LoadFunction> <...> name = 'anims\SI_BustedBoard\default.ska' descchecksum = default
    endif
    SetReferenceChecksum 0
endscript


script animload_SI_Extraboard LoadFunction = LoadAnim
    SetReferenceChecksum si_extraboard
    if <LoadFunction> <...> name = 'anims\SI_ExtraBoard\default.ska' descchecksum = default
        <LoadFunction> <...> name = 'anims\SI_ExtraBoard\YeahRight_Init.ska' descchecksum = YeahRight_Init
        <LoadFunction> <...> name = 'anims\SI_ExtraBoard\YeahRight_Out.ska' descchecksum = YeahRight_Out
        <LoadFunction> <...> name = 'anims\SI_ExtraBoard\YeahRight_Idle.ska' descchecksum = YeahRight_Idle
    endif
    SetReferenceChecksum 0
endscript


script animload_SI_FranklinKite LoadFunction = LoadAnim
    SetReferenceChecksum SI_FranklinKite
    if <LoadFunction> <...> name = 'anims\SI_FranklinKite\Special_FranklinGrind_Init.ska' descchecksum = Special_FranklinGrind_Init
        <LoadFunction> <...> name = 'anims\SI_FranklinKite\Special_FranklinGrind_Range.ska' descchecksum = Special_FranklinGrind_Range
        <LoadFunction> <...> name = 'anims\SI_FranklinKite\Special_FranklinGrind_Out.ska' descchecksum = Special_FranklinGrind_Out
        <LoadFunction> <...> name = 'anims\SI_FranklinKite\default.ska' descchecksum = default
        <LoadFunction> <...> name = 'anims\SI_FranklinKite\Special_FranklinGrind_Idle.ska' descchecksum = Special_FranklinGrind_Idle
    endif
    SetReferenceChecksum 0
endscript


script animload_SI_Prop_1 LoadFunction = LoadAnim
    SetReferenceChecksum si_prop_1
    if <LoadFunction> <...> name = 'anims\SI_Prop_1\Special_Bam_Chainsaw_Init.ska' descchecksum = Special_Bam_Chainsaw_Init
        <LoadFunction> <...> name = 'anims\SI_Prop_1\Special_Bam_Chainsaw_Idle.ska' descchecksum = Special_Bam_Chainsaw_Idle
        <LoadFunction> <...> name = 'anims\SI_Prop_1\Special_Bam_Chainsaw_Out.ska' descchecksum = Special_Bam_Chainsaw_Out
        <LoadFunction> <...> name = 'anims\SI_Prop_1\Special_BullF_Sword_Init.ska' descchecksum = Special_BullF_Sword_Init
        <LoadFunction> <...> name = 'anims\SI_Prop_1\Special_BullF_Sword_Idle.ska' descchecksum = Special_BullF_Sword_Idle
        <LoadFunction> <...> name = 'anims\SI_Prop_1\Special_BullF_Sword_Out.ska' descchecksum = Special_BullF_Sword_Out
        <LoadFunction> <...> name = 'anims\SI_Prop_1\Special_Jesse_HotRod_Init.ska' descchecksum = Special_Jesse_HotRod_Init
        <LoadFunction> <...> name = 'anims\SI_Prop_1\Special_Jesse_HotRod_Range.ska' descchecksum = Special_Jesse_HotRod_Range
        <LoadFunction> <...> name = 'anims\SI_Prop_1\Special_Jesse_HotRod_Out.ska' descchecksum = Special_Jesse_HotRod_Out
        <LoadFunction> <...> name = 'anims\SI_Prop_1\Special_Muska_Burn_init.ska' descchecksum = Special_Muska_Burn_init
        <LoadFunction> <...> name = 'anims\SI_Prop_1\Special_Muska_Burn_Range.ska' descchecksum = Special_Muska_Burn_Range
        <LoadFunction> <...> name = 'anims\SI_Prop_1\Special_Muska_Burn_Out.ska' descchecksum = Special_Muska_Burn_Out
        <LoadFunction> <...> name = 'anims\SI_Prop_1\Special_Phil_Hoagie_Init.ska' descchecksum = Special_Phil_Hoagie_Init
        <LoadFunction> <...> name = 'anims\SI_Prop_1\Special_Phil_Hoagie_Idle.ska' descchecksum = Special_Phil_Hoagie_Idle
        <LoadFunction> <...> name = 'anims\SI_Prop_1\Special_Phil_Hoagie_Out.ska' descchecksum = Special_Phil_hoagie_Out
        <LoadFunction> <...> name = 'anims\SI_Prop_1\default.ska' descchecksum = default
        <LoadFunction> <...> name = 'anims\SI_Prop_1\Wallplant_OllieTag.ska' descchecksum = Wallplant_OllieTag
        <LoadFunction> <...> name = 'anims\SI_Prop_1\Standing_Tag2.ska' descchecksum = Standing_Tag2
        <LoadFunction> <...> name = 'anims\SI_Prop_1\Hanging_Tag.ska' descchecksum = Hanging_Tag
    endif
    SetReferenceChecksum 0
endscript


script animload_SI_Prop2 LoadFunction = LoadAnim
    SetReferenceChecksum si_prop2
    if <LoadFunction> <...> name = 'anims\SI_Prop2\Special_GrafPunk_Init.ska' descchecksum = Special_GrafPunk_Init
        <LoadFunction> <...> name = 'anims\SI_Prop2\Special_GrafPunk_Idle.ska' descchecksum = Special_GrafPunk_Idle
        <LoadFunction> <...> name = 'anims\SI_Prop2\Special_GrafPunk_Out.ska' descchecksum = Special_GrafPunk_Out
        <LoadFunction> <...> name = 'anims\SI_Prop2\Default.ska' descchecksum = default
    endif
    SetReferenceChecksum 0
endscript


script animload_SI_Prop_3 LoadFunction = LoadAnim
    SetReferenceChecksum si_prop_3
    if <LoadFunction> <...> name = 'anims\SI_Prop_3\Special_Jester_Juggle_init.ska' descchecksum = Special_Jester_Juggle_init
        <LoadFunction> <...> name = 'anims\SI_Prop_3\Special_Jester_Juggle_Idle.ska' descchecksum = Special_Jester_Juggle_Idle
        <LoadFunction> <...> name = 'anims\SI_Prop_3\Special_Jester_Juggle_Out.ska' descchecksum = Special_Jester_Juggle_Out
        <LoadFunction> <...> name = 'anims\SI_Prop_3\default.ska' descchecksum = default
    endif
    SetReferenceChecksum 0
endscript


script animload_SI_shark LoadFunction = LoadAnim
    SetReferenceChecksum anl_shark
    if <LoadFunction> <...> name = 'anims\SI_shark\Special_Sheckler_Primo_Init.ska' descchecksum = Special_Sheckler_Primo_Init
        <LoadFunction> <...> name = 'anims\SI_shark\Special_Sheckler_Primo_Range.ska' descchecksum = Special_Sheckler_Primo_Range
        <LoadFunction> <...> name = 'anims\SI_shark\Special_Sheckler_Primo_Out.ska' descchecksum = Special_Sheckler_Primo_Out
        <LoadFunction> <...> name = 'anims\SI_shark\default.ska' descchecksum = default
    endif
    SetReferenceChecksum 0
endscript


script animload_SI_flag LoadFunction = LoadAnim
    SetReferenceChecksum SI_Flag
    if <LoadFunction> <...> name = 'anims\SI_Flag\Special_Soldier_AmerHero2_init.ska' descchecksum = Special_Soldier_AmerHero2_Init
        <LoadFunction> <...> name = 'anims\SI_Flag\Special_Soldier_AmerHero2_Idle.ska' descchecksum = Special_Soldier_AmerHero2_Idle
        <LoadFunction> <...> name = 'anims\SI_Flag\Special_Soldier_AmerHero2_Out.ska' descchecksum = Special_Soldier_AmerHero2_Out
        <LoadFunction> <...> name = 'anims\SI_Flag\default.ska' descchecksum = default
    endif
    SetReferenceChecksum 0
endscript


script animload_Sparrow_Head LoadFunction = LoadAnim
    SetReferenceChecksum Sparrow_Head
    if <LoadFunction> <...> name = 'anims\Sparrow_Head\default.ska' descchecksum = default
        <LoadFunction> <...> name = 'anims\Sparrow_Head\idle.ska' descchecksum = idle
    endif
    SetReferenceChecksum 0
endscript


script animload_THPS6_Veh_Bull LoadFunction = LoadAnim
    SetReferenceChecksum THPS6_human
    if <LoadFunction> <...> name = 'anims\THPS6_Veh_Bull\Veh_Bull_Wheels.ska' descchecksum = Veh_Bull_Wheels
        <LoadFunction> <...> name = 'anims\THPS6_Veh_Bull\Veh_Bull_Idle.ska' descchecksum = Veh_Bull_Idle
        <LoadFunction> <...> name = 'anims\THPS6_Veh_Bull\Veh_Bull_Accel.ska' descchecksum = Veh_Bull_Accel
        <LoadFunction> <...> name = 'anims\THPS6_Veh_Bull\Veh_Bull_Brake.ska' descchecksum = Veh_Bull_Brake
        <LoadFunction> <...> name = 'anims\THPS6_Veh_Bull\Veh_Bull_IdleMoving.ska' descchecksum = Veh_Bull_IdleMoving
        <LoadFunction> <...> name = 'anims\THPS6_Veh_Bull\Veh_Bull_TurnLeft.ska' descchecksum = Veh_Bull_TurnLeft
        <LoadFunction> <...> name = 'anims\THPS6_Veh_Bull\Veh_Bull_TurnRight.ska' descchecksum = Veh_Bull_TurnRight
        <LoadFunction> <...> name = 'anims\THPS6_Veh_Bull\Veh_Bull_Ollie.ska' descchecksum = Veh_Bull_Ollie
        <LoadFunction> <...> name = 'anims\THPS6_Veh_Bull\Veh_Bull_AirIdle.ska' descchecksum = Veh_Bull_AirIdle
        <LoadFunction> <...> name = 'anims\THPS6_Veh_Bull\Veh_Bull_Land.ska' descchecksum = Veh_Bull_Land
        <LoadFunction> <...> name = 'anims\THPS6_Veh_Bull\Veh_Bull_FlipTrick.ska' descchecksum = Veh_Bull_FlipTrick
        <LoadFunction> <...> name = 'anims\THPS6_Veh_Bull\Veh_Bull_GrabTrick_Init.ska' descchecksum = Veh_Bull_GrabTrick_Init
        <LoadFunction> <...> name = 'anims\THPS6_Veh_Bull\Veh_Bull_GrabTrick_Idle.ska' descchecksum = Veh_Bull_GrabTrick_Idle
        <LoadFunction> <...> name = 'anims\THPS6_Veh_Bull\Veh_Bull_GrabTrick_Out.ska' descchecksum = Veh_Bull_GrabTrick_Out
        <LoadFunction> <...> name = 'anims\THPS6_Veh_Bull\Veh_Bull_Wallplant.ska' descchecksum = Veh_Bull_Wallplant
        <LoadFunction> <...> name = 'anims\THPS6_Veh_Bull\Veh_Bull_Grind_Init.ska' descchecksum = Veh_Bull_Grind_Init
        <LoadFunction> <...> name = 'anims\THPS6_Veh_Bull\Veh_Bull_Grind_Range.ska' descchecksum = Veh_Bull_Grind_Range
        <LoadFunction> <...> name = 'anims\THPS6_Veh_Bull\Veh_Bull_Grind_Out.ska' descchecksum = Veh_Bull_Grind_Out
        <LoadFunction> <...> name = 'anims\THPS6_Veh_Bull\Veh_Bull_Revert.ska' descchecksum = Veh_Bull_Revert
        <LoadFunction> <...> name = 'anims\THPS6_Veh_Bull\Veh_Bull_Bump.ska' descchecksum = Veh_Bull_Bump
        <LoadFunction> <...> name = 'anims\THPS6_Veh_Bull\Veh_Bull_Wheelie_Init.ska' descchecksum = Veh_Bull_Wheelie_Init
        <LoadFunction> <...> name = 'anims\THPS6_Veh_Bull\Veh_Bull_Wheelie_Range.ska' descchecksum = Veh_Bull_Wheelie_Range
        <LoadFunction> <...> name = 'anims\THPS6_Veh_Bull\Veh_Bull_Getup.ska' descchecksum = Veh_Bull_Getup
    endif
    SetReferenceChecksum 0
endscript


script animload_THPS6_Veh_Gurney LoadFunction = LoadAnim
    SetReferenceChecksum THPS6_human
    if <LoadFunction> <...> name = 'anims\THPS6_Veh_Gurney\Gurney_Stand_Idle.ska' descchecksum = Gurney_Stand_Idle
        <LoadFunction> <...> name = 'anims\THPS6_Veh_Gurney\Gurney_Stand_To_Run.ska' descchecksum = Gurney_Stand_To_Run
        <LoadFunction> <...> name = 'anims\THPS6_Veh_Gurney\Gurney_Run.ska' descchecksum = Gurney_Run
        <LoadFunction> <...> name = 'anims\THPS6_Veh_Gurney\Gurney_Run_1.ska' descchecksum = Gurney_Run_1
        <LoadFunction> <...> name = 'anims\THPS6_Veh_Gurney\Gurney_Run_TurnLeft.ska' descchecksum = Gurney_Run_TurnLeft
        <LoadFunction> <...> name = 'anims\THPS6_Veh_Gurney\Gurney_Run_TurnRight.ska' descchecksum = Gurney_Run_TurnRight
        <LoadFunction> <...> name = 'anims\THPS6_Veh_Gurney\Gurney_Bump.ska' descchecksum = Gurney_Bump
        <LoadFunction> <...> name = 'anims\THPS6_Veh_Gurney\Gurney_Ollie.ska' descchecksum = Gurney_Ollie
        <LoadFunction> <...> name = 'anims\THPS6_Veh_Gurney\Gurney_AirIdle.ska' descchecksum = Gurney_AirIdle
        <LoadFunction> <...> name = 'anims\THPS6_Veh_Gurney\Gurney_Land.ska' descchecksum = Gurney_Land
        <LoadFunction> <...> name = 'anims\THPS6_Veh_Gurney\Gurney_Stop.ska' descchecksum = Gurney_Stop
        <LoadFunction> <...> name = 'anims\THPS6_Veh_Gurney\Gurney_grind_init.ska' descchecksum = Gurney_grind_init
        <LoadFunction> <...> name = 'anims\THPS6_Veh_Gurney\Gurney_grind_range.ska' descchecksum = Gurney_grind_range
        <LoadFunction> <...> name = 'anims\THPS6_Veh_Gurney\Gurney_grind_out.ska' descchecksum = Gurney_grind_out
        <LoadFunction> <...> name = 'anims\THPS6_Veh_Gurney\default.ska' descchecksum = default
        <LoadFunction> <...> name = 'anims\THPS6_Veh_Gurney\Gurney_Stand_Idle_Rider.ska' descchecksum = Gurney_Stand_Idle_Rider
        <LoadFunction> <...> name = 'anims\THPS6_Veh_Gurney\Gurney_Stand_To_Run_rider.ska' descchecksum = Gurney_Stand_To_Run_rider
        <LoadFunction> <...> name = 'anims\THPS6_Veh_Gurney\Gurney_Run_Rider.ska' descchecksum = Gurney_Run_Rider
        <LoadFunction> <...> name = 'anims\THPS6_Veh_Gurney\Gurney_Run_1_Rider.ska' descchecksum = Gurney_Run_1_Rider
        <LoadFunction> <...> name = 'anims\THPS6_Veh_Gurney\Gurney_Run_TurnLeft_Rider.ska' descchecksum = Gurney_Run_TurnLeft_Rider
        <LoadFunction> <...> name = 'anims\THPS6_Veh_Gurney\Gurney_Run_TurnRight_Rider.ska' descchecksum = Gurney_Run_TurnRight_Rider
        <LoadFunction> <...> name = 'anims\THPS6_Veh_Gurney\Gurney_Bump_Rider.ska' descchecksum = Gurney_Bump_Rider
        <LoadFunction> <...> name = 'anims\THPS6_Veh_Gurney\Gurney_Ollie_Rider.ska' descchecksum = Gurney_Ollie_Rider
        <LoadFunction> <...> name = 'anims\THPS6_Veh_Gurney\Gurney_AirIdle_Rider.ska' descchecksum = Gurney_AirIdle_Rider
        <LoadFunction> <...> name = 'anims\THPS6_Veh_Gurney\Gurney_Land_Rider.ska' descchecksum = Gurney_Land_Rider
        <LoadFunction> <...> name = 'anims\THPS6_Veh_Gurney\Gurney_stop_rider.ska' descchecksum = Gurney_stop_rider
        <LoadFunction> <...> name = 'anims\THPS6_Veh_Gurney\Gurney_grind_init_rider.ska' descchecksum = Gurney_grind_init_rider
        <LoadFunction> <...> name = 'anims\THPS6_Veh_Gurney\Gurney_grind_range_rider.ska' descchecksum = Gurney_grind_range_rider
        <LoadFunction> <...> name = 'anims\THPS6_Veh_Gurney\Gurney_grind_out_rider.ska' descchecksum = Gurney_grind_out_rider
    endif
    SetReferenceChecksum 0
endscript


script animload_THPS6_Veh_minikart LoadFunction = LoadAnim
    SetReferenceChecksum THPS6_human
    if <LoadFunction> <...> name = 'anims\THPS6_Veh_MiniKart\Veh_Minikart_Wheels.ska' descchecksum = Veh_Minikart_Wheels
        <LoadFunction> <...> name = 'anims\THPS6_Veh_MiniKart\Veh_Minikart_Idle.ska' descchecksum = Veh_Minikart_Idle
        <LoadFunction> <...> name = 'anims\THPS6_Veh_MiniKart\Veh_Minikart_Accel.ska' descchecksum = Veh_Minikart_Accel
        <LoadFunction> <...> name = 'anims\THPS6_Veh_MiniKart\Veh_Minikart_Brake.ska' descchecksum = Veh_Minikart_Brake
        <LoadFunction> <...> name = 'anims\THPS6_Veh_MiniKart\Veh_Minikart_IdleMoving.ska' descchecksum = Veh_Minikart_IdleMoving
        <LoadFunction> <...> name = 'anims\THPS6_Veh_MiniKart\Veh_Minikart_TurnLeft.ska' descchecksum = Veh_Minikart_TurnLeft
        <LoadFunction> <...> name = 'anims\THPS6_Veh_MiniKart\Veh_Minikart_TurnLeft_Idle.ska' descchecksum = Veh_Minikart_TurnLeft_Idle
        <LoadFunction> <...> name = 'anims\THPS6_Veh_MiniKart\Veh_Minikart_TurnRight.ska' descchecksum = Veh_Minikart_TurnRight
        <LoadFunction> <...> name = 'anims\THPS6_Veh_MiniKart\Veh_Minikart_TurnRight_Idle.ska' descchecksum = Veh_Minikart_TurnRight_Idle
        <LoadFunction> <...> name = 'anims\THPS6_Veh_MiniKart\Veh_Minikart_Ollie.ska' descchecksum = Veh_Minikart_Ollie
        <LoadFunction> <...> name = 'anims\THPS6_Veh_MiniKart\Veh_Minikart_AirIdle.ska' descchecksum = Veh_Minikart_AirIdle
        <LoadFunction> <...> name = 'anims\THPS6_Veh_MiniKart\Veh_Minikart_Land.ska' descchecksum = Veh_Minikart_Land
        <LoadFunction> <...> name = 'anims\THPS6_Veh_MiniKart\Veh_Minikart_Bump.ska' descchecksum = Veh_Minikart_Bump
        <LoadFunction> <...> name = 'anims\THPS6_Veh_MiniKart\Veh_Minikart_Wheelie_Init.ska' descchecksum = Veh_Minikart_Wheelie_Init
        <LoadFunction> <...> name = 'anims\THPS6_Veh_MiniKart\Veh_Minikart_Wheelie_Range.ska' descchecksum = Veh_Minikart_Wheelie_Range
        <LoadFunction> <...> name = 'anims\THPS6_Veh_MiniKart\Veh_Minikart_Revert.ska' descchecksum = Veh_Minikart_Revert
        <LoadFunction> <...> name = 'anims\THPS6_Veh_MiniKart\Veh_Minikart_Grind_Init.ska' descchecksum = Veh_Minikart_Grind_Init
        <LoadFunction> <...> name = 'anims\THPS6_Veh_MiniKart\Veh_Minikart_Grind_Range.ska' descchecksum = Veh_Minikart_Grind_Range
        <LoadFunction> <...> name = 'anims\THPS6_Veh_MiniKart\Veh_Minikart_Grind_Out.ska' descchecksum = Veh_Minikart_Grind_Out
        <LoadFunction> <...> name = 'anims\THPS6_Veh_MiniKart\Veh_Minikart_WallPlant.ska' descchecksum = Veh_Minikart_WallPlant
        <LoadFunction> <...> name = 'anims\THPS6_Veh_MiniKart\Veh_Minikart_FlipTrick.ska' descchecksum = Veh_Minikart_FlipTrick
        <LoadFunction> <...> name = 'anims\THPS6_Veh_MiniKart\Veh_Minikart_GrabTrick_Init.ska' descchecksum = Veh_Minikart_GrabTrick_Init
        <LoadFunction> <...> name = 'anims\THPS6_Veh_MiniKart\Veh_Minikart_GrabTrick_Idle.ska' descchecksum = Veh_Minikart_GrabTrick_Idle
        <LoadFunction> <...> name = 'anims\THPS6_Veh_MiniKart\Veh_Minikart_GrabTrick_Out.ska' descchecksum = Veh_Minikart_GrabTrick_Out
        <LoadFunction> <...> name = 'anims\THPS6_Veh_MiniKart\Veh_Minikart_GetUp.ska' descchecksum = Veh_Minikart_GetUp
    endif
    SetReferenceChecksum 0
endscript


script animload_THPS6_Veh_MotoSkateboard LoadFunction = LoadAnim
    SetReferenceChecksum THPS6_human
    if <LoadFunction> <...> name = 'anims\THPS6_Veh_MotoSkateboard\MotoSkateboard_StationaryIdle.ska' descchecksum = MotoSkateboard_StationaryIdle
        <LoadFunction> <...> name = 'anims\THPS6_Veh_MotoSkateboard\MotoSkateboard_Accel.ska' descchecksum = MotoSkateboard_Accel
        <LoadFunction> <...> name = 'anims\THPS6_Veh_MotoSkateboard\MotoSkateboard_Brake.ska' descchecksum = MotoSkateboard_Brake
        <LoadFunction> <...> name = 'anims\THPS6_Veh_MotoSkateboard\MotoSkateboard_MovingIdle.ska' descchecksum = MotoSkateboard_MovingIdle
        <LoadFunction> <...> name = 'anims\THPS6_Veh_MotoSkateboard\MotoSkateboard_TurnRight.ska' descchecksum = MotoSkateboard_TurnRight
        <LoadFunction> <...> name = 'anims\THPS6_Veh_MotoSkateboard\MotoSkateboard_TurnRightIdle.ska' descchecksum = MotoSkateboard_TurnRightIdle
        <LoadFunction> <...> name = 'anims\THPS6_Veh_MotoSkateboard\MotoSkateboard_TurnLeft.ska' descchecksum = MotoSkateboard_TurnLeft
        <LoadFunction> <...> name = 'anims\THPS6_Veh_MotoSkateboard\MotoSkateboard_TurnLeftIdle.ska' descchecksum = MotoSkateboard_TurnLeftIdle
        <LoadFunction> <...> name = 'anims\THPS6_Veh_MotoSkateboard\MotoSkateboard_Manual_init.ska' descchecksum = MotoSkateboard_Manual_init
        <LoadFunction> <...> name = 'anims\THPS6_Veh_MotoSkateboard\MotoSkateboard_Manual_Range.ska' descchecksum = MotoSkateboard_Manual_Range
        <LoadFunction> <...> name = 'anims\THPS6_Veh_MotoSkateboard\MotoSkateboard_Revert.ska' descchecksum = MotoSkateboard_Revert
        <LoadFunction> <...> name = 'anims\THPS6_Veh_MotoSkateboard\MotoSkateboard_ollie.ska' descchecksum = MotoSkateboard_ollie
        <LoadFunction> <...> name = 'anims\THPS6_Veh_MotoSkateboard\MotoSkateboard_AIrIdle.ska' descchecksum = MotoSkateboard_AIrIdle
        <LoadFunction> <...> name = 'anims\THPS6_Veh_MotoSkateboard\MotoSkateboard_Land.ska' descchecksum = MotoSkateboard_Land
        <LoadFunction> <...> name = 'anims\THPS6_Veh_MotoSkateboard\MotoSkateboard_GrabTrick_init.ska' descchecksum = MotoSkateboard_GrabTrick_init
        <LoadFunction> <...> name = 'anims\THPS6_Veh_MotoSkateboard\MotoSkateboard_GrabTrick_Idle.ska' descchecksum = MotoSkateboard_GrabTrick_Idle
        <LoadFunction> <...> name = 'anims\THPS6_Veh_MotoSkateboard\MotoSkateboard_FlipTrick.ska' descchecksum = MotoSkateboard_FlipTrick
        <LoadFunction> <...> name = 'anims\THPS6_Veh_MotoSkateboard\MotoSkateboard_WallPlant.ska' descchecksum = MotoSkateboard_WallPlant
        <LoadFunction> <...> name = 'anims\THPS6_Veh_MotoSkateboard\MotoSkateboard_Getup.ska' descchecksum = MotoSkateboard_Getup
        <LoadFunction> <...> name = 'anims\THPS6_Veh_MotoSkateboard\MotoSkateboard_Bump.ska' descchecksum = MotoSkateboard_Bump
    endif
    SetReferenceChecksum 0
endscript


script animload_THPS6_Veh_Segway LoadFunction = LoadAnim
    SetReferenceChecksum THPS6_human
    if <LoadFunction> <...> name = 'anims\THPS6_Veh_Segway\Segway_Idle.ska' descchecksum = Segway_Idle
        <LoadFunction> <...> name = 'anims\THPS6_Veh_Segway\Segway_Accel.ska' descchecksum = Segway_Accel
        <LoadFunction> <...> name = 'anims\THPS6_Veh_Segway\Segway_Stop.ska' descchecksum = Segway_Stop
        <LoadFunction> <...> name = 'anims\THPS6_Veh_Segway\Segway_IdletoLeanLeft.ska' descchecksum = Segway_IdletoLeanLeft
        <LoadFunction> <...> name = 'anims\THPS6_Veh_Segway\Segway_LeanLeft.ska' descchecksum = Segway_LeanLeft
        <LoadFunction> <...> name = 'anims\THPS6_Veh_Segway\Segway_IdletoLeanRight.ska' descchecksum = Segway_IdletoLeanRight
        <LoadFunction> <...> name = 'anims\THPS6_Veh_Segway\Segway_LeanRight.ska' descchecksum = Segway_LeanRight
        <LoadFunction> <...> name = 'anims\THPS6_Veh_Segway\Segway_Ollie.ska' descchecksum = Segway_Ollie
        <LoadFunction> <...> name = 'anims\THPS6_Veh_Segway\Segway_AirIdle.ska' descchecksum = Segway_AirIdle
        <LoadFunction> <...> name = 'anims\THPS6_Veh_Segway\Segway_Land.ska' descchecksum = Segway_Land
        <LoadFunction> <...> name = 'anims\THPS6_Veh_Segway\Segway_Crouch.ska' descchecksum = Segway_Crouch
        <LoadFunction> <...> name = 'anims\THPS6_Veh_Segway\Segway_CrouchtoLeanRight.ska' descchecksum = Segway_CrouchtoLeanRight
        <LoadFunction> <...> name = 'anims\THPS6_Veh_Segway\Segway_Crouch_LeanRight.ska' descchecksum = Segway_Crouch_LeanRight
        <LoadFunction> <...> name = 'anims\THPS6_Veh_Segway\Segway_CrouchtoLeanLeft.ska' descchecksum = Segway_CrouchtoLeanLeft
        <LoadFunction> <...> name = 'anims\THPS6_Veh_Segway\Segway_Crouch_LeanLeft.ska' descchecksum = Segway_Crouch_LeanLeft
        <LoadFunction> <...> name = 'anims\THPS6_Veh_Segway\Segway_Grind_Init.ska' descchecksum = Segway_Grind_Init
        <LoadFunction> <...> name = 'anims\THPS6_Veh_Segway\Segway_Grind_Range.ska' descchecksum = Segway_Grind_Range
        <LoadFunction> <...> name = 'anims\THPS6_Veh_Segway\Segway_Grind_Out.ska' descchecksum = Segway_Grind_Out
        <LoadFunction> <...> name = 'anims\THPS6_Veh_Segway\Segway_Trick1_Init.ska' descchecksum = Segway_Trick1_Init
        <LoadFunction> <...> name = 'anims\THPS6_Veh_Segway\Segway_Trick1_Idle.ska' descchecksum = Segway_Trick1_Idle
        <LoadFunction> <...> name = 'anims\THPS6_Veh_Segway\Segway_Trick1_Out.ska' descchecksum = Segway_Trick1_Out
        <LoadFunction> <...> name = 'anims\THPS6_Veh_Segway\Segway_FlipTrick1.ska' descchecksum = Segway_FlipTrick1
        <LoadFunction> <...> name = 'anims\THPS6_Veh_Segway\Segway_Wheels_Partial.ska' descchecksum = Segway_Wheels_Partial
    endif
    SetReferenceChecksum 0
endscript


script animload_THPS6_Veh_Tricycle LoadFunction = LoadAnim
    SetReferenceChecksum THPS6_human
    if <LoadFunction> <...> name = 'anims\THPS6_Veh_Tricyle\Tricycle_Idle.ska' descchecksum = Tricycle_Idle
        <LoadFunction> <...> name = 'anims\THPS6_Veh_Tricyle\Tricycle_Stand.ska' descchecksum = tricycle_stand
        <LoadFunction> <...> name = 'anims\THPS6_Veh_Tricyle\Tricycle_Turn_Left.ska' descchecksum = Tricycle_Turn_Left
        <LoadFunction> <...> name = 'anims\THPS6_Veh_Tricyle\Tricycle_Turn_Right.ska' descchecksum = Tricycle_Turn_Right
        <LoadFunction> <...> name = 'anims\THPS6_Veh_Tricyle\Tricycle_Start.ska' descchecksum = Tricycle_Start
        <LoadFunction> <...> name = 'anims\THPS6_Veh_Tricyle\Tricycle_Stop.ska' descchecksum = Tricycle_Stop
        <LoadFunction> <...> name = 'anims\THPS6_Veh_Tricyle\Tricycle_Ollie.ska' descchecksum = Tricycle_Ollie
        <LoadFunction> <...> name = 'anims\THPS6_Veh_Tricyle\Tricycle_Air_Idle.ska' descchecksum = Tricycle_Air_Idle
        <LoadFunction> <...> name = 'anims\THPS6_Veh_Tricyle\Tricycle_Land.ska' descchecksum = Tricycle_Land
        <LoadFunction> <...> name = 'anims\THPS6_Veh_Tricyle\Tricycle_GrabTrick_Init.ska' descchecksum = Tricycle_GrabTrick_Init
        <LoadFunction> <...> name = 'anims\THPS6_Veh_Tricyle\Tricycle_GrabTrick_Idle.ska' descchecksum = Tricycle_GrabTrick_Idle
        <LoadFunction> <...> name = 'anims\THPS6_Veh_Tricyle\Tricycle_GrabTrick_Out.ska' descchecksum = Tricycle_GrabTrick_Out
        <LoadFunction> <...> name = 'anims\THPS6_Veh_Tricyle\Tricycle_Wheels.ska' descchecksum = Tricycle_Wheels
        <LoadFunction> <...> name = 'anims\THPS6_Veh_Tricyle\Tricycle_Grind_Init.ska' descchecksum = Tricycle_Grind_Init
        <LoadFunction> <...> name = 'anims\THPS6_Veh_Tricyle\Tricycle_Grind_Range.ska' descchecksum = Tricycle_Grind_Range
        <LoadFunction> <...> name = 'anims\THPS6_Veh_Tricyle\Tricycle_Grind_Out.ska' descchecksum = Tricycle_Grind_Out
        <LoadFunction> <...> name = 'anims\THPS6_Veh_Tricyle\Tricycle_Wallplant.ska' descchecksum = Tricycle_Wallplant
        <LoadFunction> <...> name = 'anims\THPS6_Veh_Tricyle\Tricycle_Manual.ska' descchecksum = Tricycle_Manual
        <LoadFunction> <...> name = 'anims\THPS6_Veh_Tricyle\Tricycle_Manual_Range.ska' descchecksum = Tricycle_Manual_Range
        <LoadFunction> <...> name = 'anims\THPS6_Veh_Tricyle\Tricycle_Getup.ska' descchecksum = Tricycle_Getup
        <LoadFunction> <...> name = 'anims\THPS6_Veh_Tricyle\Tricycle_Revert.ska' descchecksum = Tricycle_Revert
        <LoadFunction> <...> name = 'anims\THPS6_Veh_Tricyle\Tricycle_FlipTrick.ska' descchecksum = Tricycle_FlipTrick
    endif
    SetReferenceChecksum 0
endscript


script animload_THPS6_Veh_WheelChair LoadFunction = LoadAnim
    SetReferenceChecksum THPS6_human
    if <LoadFunction> <...> name = 'anims\THPS6_Veh_WheelChair\WheelChair_Wheels_Partial.ska' descchecksum = WheelChair_Wheels_Partial
        <LoadFunction> <...> name = 'anims\THPS6_Veh_WheelChair\Wheelchair_Idle.ska' descchecksum = Wheelchair_Idle
        <LoadFunction> <...> name = 'anims\THPS6_Veh_WheelChair\Wheelchair_Attention.ska' descchecksum = Wheelchair_Attention
        <LoadFunction> <...> name = 'anims\THPS6_Veh_WheelChair\Wheelchair_Spin.ska' descchecksum = Wheelchair_Spin
        <LoadFunction> <...> name = 'anims\THPS6_Veh_WheelChair\Wheelchair_Accel.ska' descchecksum = Wheelchair_Accel
        <LoadFunction> <...> name = 'anims\THPS6_Veh_WheelChair\WheelChair_Brake.ska' descchecksum = WheelChair_Brake
        <LoadFunction> <...> name = 'anims\THPS6_Veh_WheelChair\Wheelchair_MovingIdle.ska' descchecksum = Wheelchair_MovingIdle
        <LoadFunction> <...> name = 'anims\THPS6_Veh_WheelChair\WheelChair_TurnRight.ska' descchecksum = WheelChair_TurnRight
        <LoadFunction> <...> name = 'anims\THPS6_Veh_WheelChair\Wheelchair_TurnRight_Idle.ska' descchecksum = Wheelchair_TurnRight_Idle
        <LoadFunction> <...> name = 'anims\THPS6_Veh_WheelChair\WheelChair_TurnLeft.ska' descchecksum = WheelChair_TurnLeft
        <LoadFunction> <...> name = 'anims\THPS6_Veh_WheelChair\Wheelchair_TurnLeft_Idle.ska' descchecksum = Wheelchair_TurnLeft_Idle
        <LoadFunction> <...> name = 'anims\THPS6_Veh_WheelChair\Wheelchair_Manual.ska' descchecksum = Wheelchair_Manual
        <LoadFunction> <...> name = 'anims\THPS6_Veh_WheelChair\Wheelchair_Manual_Range.ska' descchecksum = Wheelchair_Manual_Range
        <LoadFunction> <...> name = 'anims\THPS6_Veh_WheelChair\Wheelchair_Revert.ska' descchecksum = Wheelchair_Revert
        <LoadFunction> <...> name = 'anims\THPS6_Veh_WheelChair\Wheelchair_ollie.ska' descchecksum = Wheelchair_ollie
        <LoadFunction> <...> name = 'anims\THPS6_Veh_WheelChair\Wheelchair_AIrIdle.ska' descchecksum = Wheelchair_AIrIdle
        <LoadFunction> <...> name = 'anims\THPS6_Veh_WheelChair\Wheelchair_Land.ska' descchecksum = Wheelchair_Land
        <LoadFunction> <...> name = 'anims\THPS6_Veh_WheelChair\WheelChair_AirTrick_init.ska' descchecksum = WheelChair_AirTrick_init
        <LoadFunction> <...> name = 'anims\THPS6_Veh_WheelChair\WheelChair_AirTrick_Idle.ska' descchecksum = WheelChair_AirTrick_Idle
        <LoadFunction> <...> name = 'anims\THPS6_Veh_WheelChair\WheelChair_AirTrick_Out.ska' descchecksum = WheelChair_AirTrick_Out
        <LoadFunction> <...> name = 'anims\THPS6_Veh_WheelChair\WheelChair_FlipTrick.ska' descchecksum = WheelChair_FlipTrick
        <LoadFunction> <...> name = 'anims\THPS6_Veh_WheelChair\Wheelchair_WallPlant.ska' descchecksum = Wheelchair_WallPlant
        <LoadFunction> <...> name = 'anims\THPS6_Veh_WheelChair\Wheelchair_Grind_init.ska' descchecksum = Wheelchair_Grind_init
        <LoadFunction> <...> name = 'anims\THPS6_Veh_WheelChair\Wheelchair_Grind_Range.ska' descchecksum = Wheelchair_Grind_Range
        <LoadFunction> <...> name = 'anims\THPS6_Veh_WheelChair\Wheelchair_Grind_Out.ska' descchecksum = Wheelchair_Grind_Out
        <LoadFunction> <...> name = 'anims\THPS6_Veh_WheelChair\WheelChair_Getup.ska' descchecksum = WheelChair_Getup
    endif
    SetReferenceChecksum 0
endscript


script animload_Vallely_Head LoadFunction = LoadAnim
    SetReferenceChecksum Vallely_Head
    if <LoadFunction> <...> name = 'anims\Vallely_Head\default.ska' descchecksum = default
        <LoadFunction> <...> name = 'anims\Vallely_Head\idle.ska' descchecksum = idle
    endif
    SetReferenceChecksum 0
endscript


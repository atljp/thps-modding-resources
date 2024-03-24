
DrumPartialNumber = 1

script GetAnimEventTableName 
    animEventTableName = PedAnimEventTable
    switch <animType>
        case dog
        <animEventTableName> = DogAnimEventTable
    endswitch
    return animEventTableName = <animEventTableName>
endscript

SkaterAnimEventTable = {
    RunFromIdle = [
        {time = 0.02000 event = FootstepScuffSoundEffect}
    ]
    run = [
        {time = 0.02000 event = FootstepRunSoundEffect}
        {time = 0.02000 event = FootstepParticlesL}
        {time = 0.3500 event = FootstepRunSoundEffect}
        {time = 0.3500 event = FootstepParticlesR}
    ]
    RunToIdle = [
        {time = 0.05000 event = FootstepScuffSoundEffect}
        {time = 0.2500 event = FootstepWalkSoundEffect}
    ]
    run1 = [
        {time = 0.02000 event = FootstepRunSoundEffect}
        {time = 0.3500 event = FootstepRunSoundEffect}
    ]
    runjumpidle = [
        {time = 0.02000 event = FootstepRunSoundEffect}
        {time = 0.3500 event = FootstepRunSoundEffect}
        {time = 0.6600 event = FootstepRunSoundEffect}
    ]
    runjumpland = [
        {time = 0.02000 event = FootstepRunSoundEffect}
        {time = 0.3500 event = FootstepRunSoundEffect}
        {time = 0.6600 event = FootstepRunSoundEffect}
    ]
    BigJumpLandToStand = [
        {time = 0.06000 event = FootstepLandSoundEffect}
        {time = 1.400 event = FootstepScuffSoundEffect}
    ]
    BigJumpLandToRun = [
        {time = 0.06000 event = FootstepLandSoundEffect}
        {time = 0.3000 event = FootstepScuffSoundEffect}
        {time = 0.7000 event = FootstepRunSoundEffect}
    ]
    HangOntoTheTop = [
        {time = 1.100 event = FootstepWalkSoundEffect}
        {time = 1.700 event = FootstepWalkSoundEffect}
        {time = 2.100 event = FootstepScuffSoundEffect}
    ]
    JumpLandToRun = [
        {time = 0.1200 event = FootstepLandSoundEffect}
    ]
    JumpLandToStand = [
        {time = 0.02000 event = FootstepLandSoundEffect}
        {time = 0.5000 event = FootstepScuffSoundEffect}
    ]
    LadderClimb = [
        {time = 0.1700 event = FootstepWalkSoundEffect}
        {time = 0.7000 event = FootstepWalkSoundEffect}
    ]
    LadderClimbFromStandIdle = [
        {time = 0.02000 event = FootstepScuffSoundEffect}
        {time = 0.5000 event = FootstepWalkSoundEffect}
    ]
    LadderOntoTheTop = [
        {time = 0.3000 event = FootstepWalkSoundEffect}
        {time = 0.8000 event = FootstepWalkSoundEffect}
        {time = 1.400 event = FootstepScuffSoundEffect}
    ]
    runtojump = [
        {time = 0.02000 event = FootstepJumpSoundEffect}
    ]
    StandToHang = [
        {time = 0.3000 event = FootstepScuffSoundEffect}
    ]
    StandToJump = [
        {time = 0.03000 event = FootstepJumpSoundEffect}
    ]
    StandTurnLeft = [
        {time = 0.02000 event = FootstepScuffSoundEffect}
    ]
    StandTurnRight = [
        {time = 0.05000 event = FootstepScuffSoundEffect}
    ]
    NewBrakeTurnLeft = [
        {time = 0.01000 event = FootstepScuffSoundEffect}
    ]
    NewBrakeTurnRight = [
        {time = 0.01000 event = FootstepScuffSoundEffect}
    ]
    _180RunSkid = [
        {time = 0.02000 event = FootstepRunSoundEffect}
        {time = 0.3500 event = FootstepScuffSoundEffect}
        {time = 0.8500 event = FootstepWalkSoundEffect}
    ]
    SkateToStand = [
        {time = 0.02000 event = SoundEffect params = { name = FlipTransitionUp01 }}
        {time = 0.4200 event = FootstepRunSoundEffect}
        {time = 0.7500 event = FootstepRunSoundEffect}
        {time = 1.300 event = FootstepWalkSoundEffect}
        {time = 1.500 event = FootstepScuffSoundEffect}
    ]
    SkateToWalk = [
        {time = 0.02000 event = SoundEffect params = { name = FlipTransitionUp01 }}
        {time = 0.4200 event = FootstepRunSoundEffect}
        {time = 0.7500 event = FootstepWalkSoundEffect}
    ]
    BrakeToStand = [
        {time = 0.4500 event = SoundEffect params = { name = FlipTransitionUp01 }}
    ]
    SlowSkateToStand = [
        {time = 0.02000 event = SoundEffect params = { name = FlipTransitionUp01 }}
        {time = 0.3000 event = FootstepRunSoundEffect}
        {time = 0.7000 event = FootstepWalkSoundEffect}
        {time = 1.400 event = FootstepScuffSoundEffect}
    ]
    WalkSlow = [
        {time = 0.02000 event = FootstepWalkSoundEffect}
        {time = 0.02000 event = FootstepParticlesL}
        {time = 0.5200 event = FootstepWalkSoundEffect}
        {time = 0.5200 event = FootstepParticlesR}
    ]
    GrindNBarf_Init = [
        {time = 1.0 event = GenericParticles params = {specialtrick_particles = barf_particles bone = Bone_Jaw dont_orient_toskater = 1 StopEmitAt = 0.2000}}
    ]
    PrimoHandStand_Init = [
        {time = 0.5000 event = GenericParticles params = {specialtrick_particles = fire_particles bone = Bone_Board_Root}}
    ]
    WalkFast = [
        {time = 0.02000 event = FootstepWalkSoundEffect}
        {time = 0.02000 event = FootstepParticlesL}
        {time = 0.4000 event = FootstepWalkSoundEffect}
        {time = 0.4000 event = FootstepParticlesR}
    ]
    FastRun = [
        {time = 0.02000 event = FootstepRunSoundEffect}
        {time = 0.02000 event = FootstepParticlesL}
        {time = 0.3300 event = FootstepRunSoundEffect}
        {time = 0.3300 event = FootstepParticlesR}
    ]
    Wrun = [
        {time = 0.02000 event = FootstepRunSoundEffect}
        {time = 0.02000 event = FootstepParticlesL}
        {time = 0.3500 event = FootstepRunSoundEffect}
        {time = 0.3500 event = FootstepParticlesR}
    ]
    WRunToSkate = [
        {time = 0.02000 event = FootstepRunSoundEffect}
        {time = 0.02000 event = FootstepParticlesL}
        {time = 0.3500 event = FootstepRunSoundEffect}
        {time = 0.3500 event = FootstepParticlesR}
        {time = 0.5200 event = TurnOnSkaterLoopingSound}
        {time = 0.5200 event = SoundEffect params = { name = FlipTransitionDown01 }}
    ]
    WSkateToRun = [
        {time = 0.02000 event = SoundEffect params = { name = FlipTransitionUp01 }}
        {time = 0.4200 event = FootstepRunSoundEffect}
        {time = 0.7500 event = FootstepRunSoundEffect}
    ]
    WStandToRun = [
        {time = 0.02000 event = FootstepScuffSoundEffect}
    ]
    WStandToWalk = [
        {time = 0.02000 event = FootstepScuffSoundEffect}
    ]
    WWalk = [
        {time = 0.02000 event = FootstepWalkSoundEffect}
        {time = 0.02000 event = FootstepParticlesL}
        {time = 0.5200 event = FootstepWalkSoundEffect}
        {time = 0.5200 event = FootstepParticlesR}
    ]
    WWalkToStand = [
        {time = 0.05000 event = FootstepWalkSoundEffect}
        {time = 0.05000 event = FootstepParticlesL}
        {time = 0.4500 event = FootstepScuffSoundEffect}
    ]
    wallplant_ollie = [
        {time = 0.02000 event = FootstepWalkSoundEffect}
    ]
    wallplant_ollie2 = [
        {time = 0.02000 event = FootstepLandSoundEffect}
    ]
    wallplant_ollie3_flip = [
        {time = 0.02000 event = FootstepLandSoundEffect}
    ]
    wallplant_out = [
        {time = 0.02000 event = FootstepLandSoundEffect}
    ]
    JumpAirTo5050 = [
        {time = 0.2200 event = SoundEffect params = { name = FlipTransitionDown01 }}
        {time = 0.3500 event = TerrainLandSound}
        {time = 0.3800 event = TurnOnSkaterLoopingSound}
    ]
    JumpAirToManual = [
        {time = 0.3000 event = SoundEffect params = { name = FlipTransitionDown01 }}
        {time = 0.5500 event = TurnOnSkaterLoopingSound}
    ]
    FS_PowerSlide_Init = [
        {time = 0.0 event = SoundEffect params = {name = RevertConc DefPitch = 60}}
    ]
    BS_PowerSlide_Init = [
        {time = 0.0 event = SoundEffect params = {name = RevertConc DefPitch = 60}}
    ]
    fallback = [
        {time = 0.01000 event = BailBoardSoundEffect}
        {time = 0.5000 event = BailBodyFallSoundEffect}
        {time = 0.3600 event = BailBodyPunchSoundEffect}
        {time = 0.4000 event = BailSlapSoundEffect}
        {time = 0.8000 event = BailBodyFallSoundEffect}
    ]
    fallback_resume = [
        {time = 0.3800 event = FootstepScuffSoundEffect}
        {time = 0.4500 event = FootstepScuffSoundEffect}
        {time = 0.9200 event = FootstepWalkSoundEffect}
        {time = 1.170 event = FootstepWalkSoundEffect}
    ]
    slipbackwards = [
        {time = 0.01000 event = BailBoardSoundEffect}
        {time = 0.4000 event = BailBodyFallSoundEffect}
        {time = 0.3800 event = BailBodyPunchSoundEffect}
        {time = 0.6000 event = BailBodyFallSoundEffect}
        {time = 0.8000 event = BailBodyFallSoundEffect}
    ]
    kneeslide_resume = [
        {time = 0.7700 event = FootstepWalkSoundEffect}
        {time = 1.170 event = FootstepWalkSoundEffect}
    ]
    slipforwards = [
        {time = 0.01000 event = BailBoardSoundEffect}
        {time = 0.3500 event = BailBodyFallSoundEffect}
        {time = 0.5800 event = BailBodyPunchSoundEffect}
        {time = 0.6000 event = BailSlapSoundEffect}
        {time = 0.7000 event = BailBodyFallSoundEffect}
        {time = 1.0 event = BailBodyFallSoundEffect}
    ]
    fiftyfiftyfallbackward = [
        {time = 0.01000 event = BailBoardSoundEffect}
        {time = 0.4000 event = BailBodyFallSoundEffect}
        {time = 0.3800 event = BailBodyPunchSoundEffect}
        {time = 0.6300 event = BailBodyFallSoundEffect}
        {time = 1.0 event = BailSlapSoundEffect}
    ]
    fiftyfiftyfallforward = [
        {time = 0.01000 event = BailBoardSoundEffect}
        {time = 0.3400 event = BailCrackSoundEffect}
        {time = 0.3800 event = BailBodyPunchSoundEffect}
        {time = 0.4000 event = BailBodyFallSoundEffect}
        {time = 0.6000 event = BailBodyFallSoundEffect}
        {time = 1.150 event = FootstepLandSoundEffect}
        {time = 1.150 event = BailBodyFallSoundEffect}
    ]
    nutterfallforward = [
        {time = 0.01000 event = BailBoardSoundEffect}
        {time = 0.3000 event = BailCrackSoundEffect}
        {time = 0.3000 event = BailBodyPunchSoundEffect}
        {time = 0.7000 event = BailBodyFallSoundEffect}
        {time = 0.9000 event = BailBodyFallSoundEffect}
        {time = 1.100 event = BailBodyFallSoundEffect}
    ]
    backwardstest = [
        {time = 0.01000 event = BailBoardSoundEffect}
        {time = 0.3000 event = FootstepRunSoundEffect}
        {time = 0.3000 event = FootstepScuffSoundEffect}
        {time = 0.7000 event = FootstepRunSoundEffect}
        {time = 0.7000 event = FootstepScuffSoundEffect}
        {time = 1.250 event = BailBodyPunchSoundEffect}
        {time = 1.250 event = BailBodyFallSoundEffect}
        {time = 1.330 event = BailSlapSoundEffect}
        {time = 1.450 event = BailBodyFallSoundEffect}
        {time = 1.800 event = BailBodyFallSoundEffect}
    ]
    FaceFall = [
        {time = 0.01000 event = BailBoardSoundEffect}
    ]
    facefallsmallhit = [
        {time = 0.02000 event = BailBodyPunchSoundEffect}
        {time = 0.06000 event = BailSlapSoundEffect}
        {time = 0.2000 event = BailBodyFallSoundEffect}
    ]
    facefallbighit = [
        {time = 0.02000 event = BailBodyPunchSoundEffect}
        {time = 0.06000 event = BailSlapSoundEffect}
        {time = 0.02000 event = BailBodyFallSoundEffect}
        {time = 0.2500 event = BailBodyFallSoundEffect}
    ]
    backwardfaceslam = [
        {time = 0.01000 event = BailBoardSoundEffect}
        {time = 0.3800 event = BailBodyPunchSoundEffect}
        {time = 0.4300 event = BailSlapSoundEffect}
        {time = 1.200 event = BailBodyFallSoundEffect}
    ]
    GetUpBackwards = [
        {time = 0.3000 event = FootstepScuffSoundEffect}
        {time = 0.3700 event = FootstepScuffSoundEffect}
        {time = 0.8700 event = FootstepRunSoundEffect}
        {time = 0.8800 event = FootstepScuffSoundEffect}
        {time = 0.9400 event = FootstepRunSoundEffect}
        {time = 1.400 event = FootstepWalkSoundEffect}
        {time = 1.800 event = FootstepWalkSoundEffect}
    ]
    GetUpForwards = [
        {time = 0.1500 event = FootstepScuffSoundEffect}
        {time = 0.5000 event = FootstepRunSoundEffect}
        {time = 1.100 event = FootstepWalkSoundEffect}
        {time = 1.500 event = FootstepWalkSoundEffect}
    ]
    GetUpFacing = [
        {time = 0.7000 event = FootstepScuffSoundEffect}
        {time = 1.200 event = FootstepWalkSoundEffect}
        {time = 1.500 event = FootstepWalkSoundEffect}
    ]
    GetUpFaceSmash = [
        {time = 0.9500 event = FootstepRunSoundEffect}
        {time = 0.9700 event = FootstepScuffSoundEffect}
        {time = 1.0 event = FootstepRunSoundEffect}
        {time = 1.400 event = FootstepWalkSoundEffect}
        {time = 1.600 event = FootstepWalkSoundEffect}
    ]
    Smackwall = [
        {time = 0.02000 event = BailBodyPunchSoundEffect}
        {time = 0.04000 event = BailSlapSoundEffect}
        {time = 0.4000 event = BailBodyFallSoundEffect}
        {time = 0.6000 event = BailBodyFallSoundEffect}
        {time = 0.8000 event = BailBodyFallSoundEffect}
    ]
    smackwallfeet = [
        {time = 0.07000 event = BailBodyPunchSoundEffect}
        {time = 0.01000 event = FootstepRunSoundEffect}
        {time = 0.04000 event = FootstepRunSoundEffect}
        {time = 0.6000 event = BailBodyFallSoundEffect}
    ]
    Smackwallupright = [
        {time = 0.02000 event = BailBodyPunchSoundEffect}
        {time = 0.04000 event = BailSlapSoundEffect}
        {time = 0.5000 event = BailBodyFallSoundEffect}
        {time = 0.7000 event = BailBodyFallSoundEffect}
    ]
    RunOutQuick = [
        {time = 0.01000 event = BailBoardSoundEffect}
        {time = 0.3500 event = FootstepRunSoundEffect}
        {time = 0.4500 event = FootstepRunSoundEffect}
        {time = 0.4500 event = FootstepScuffSoundEffect}
        {time = 1.150 event = FootstepWalkSoundEffect}
        {time = 1.600 event = FootstepWalkSoundEffect}
        {time = 2.0 event = FootstepWalkSoundEffect}
    ]
    runoutdrop = [
        {time = 0.05000 event = FootstepLandSoundEffect}
        {time = 0.1200 event = FootstepScuffSoundEffect}
        {time = 1.500 event = FootstepWalkSoundEffect}
        {time = 1.900 event = FootstepWalkSoundEffect}
    ]
    headfirstsplat = [
        {time = 0.02000 event = BailBodyPunchSoundEffect}
        {time = 0.09000 event = BailSlapSoundEffect}
        {time = 0.1500 event = BailBodyFallSoundEffect}
        {time = 0.5500 event = BailBodyFallSoundEffect}
    ]
    BIGDROP = [
        {time = 0.05000 event = FootstepLandSoundEffect}
        {time = 0.2000 event = BailBodyPunchSoundEffect}
        {time = 0.2900 event = FootstepScuffSoundEffect}
        {time = 0.2500 event = BailBodyFallSoundEffect}
        {time = 0.8000 event = BailBodyPunchSoundEffect}
        {time = 0.8000 event = BailBodyFallSoundEffect}
        {time = 1.0 event = BailBodyFallSoundEffect}
    ]
    shoulders = [
        {time = 0.01000 event = BailBoardSoundEffect}
        {time = 0.4100 event = BailBodyPunchSoundEffect}
        {time = 0.4100 event = BailBodyFallSoundEffect}
        {time = 0.6100 event = BailBodyFallSoundEffect}
        {time = 0.8100 event = BailBodyFallSoundEffect}
        {time = 2.0 event = FootstepLandSoundEffect}
        {time = 2.0 event = BailBodyFallSoundEffect}
    ]
    getuphips = [
        {time = 0.1000 event = BailBodyFallSoundEffect}
        {time = 0.4500 event = FootstepScuffSoundEffect}
        {time = 1.0 event = FootstepWalkSoundEffect}
        {time = 1.500 event = FootstepWalkSoundEffect}
    ]
    spasmodic = [
        {time = 0.01000 event = BailBoardSoundEffect}
        {time = 0.3000 event = FootstepRunSoundEffect}
        {time = 0.3000 event = FootstepScuffSoundEffect}
        {time = 0.5700 event = FootstepRunSoundEffect}
        {time = 0.5700 event = FootstepScuffSoundEffect}
        {time = 0.8500 event = BailBodyPunchSoundEffect}
        {time = 0.8500 event = BailBodyFallSoundEffect}
        {time = 0.9400 event = BailSlapSoundEffect}
        {time = 1.0 event = BailBodyFallSoundEffect}
    ]
    tailslideout = [
        {time = 0.01000 event = BailBoardSoundEffect}
        {time = 0.1200 event = BailBodyPunchSoundEffect}
        {time = 0.1700 event = BailSlapSoundEffect}
        {time = 0.1900 event = BailCrackSoundEffect}
        {time = 0.7000 event = BailBodyFallSoundEffect}
        {time = 1.0 event = BailBodyFallSoundEffect}
    ]
    getuptailslideout = [
        {time = 1.150 event = FootstepScuffSoundEffect}
        {time = 1.250 event = FootstepScuffSoundEffect}
        {time = 1.500 event = FootstepWalkSoundEffect}
        {time = 1.700 event = FootstepWalkSoundEffect}
    ]
    splits = [
        {time = 0.08000 event = BailBodyPunchSoundEffect}
        {time = 0.1300 event = BailSlapSoundEffect}
        {time = 0.1500 event = BailCrackSoundEffect}
        {time = 0.9000 event = FootstepScuffSoundEffect}
        {time = 1.300 event = FootstepWalkSoundEffect}
    ]
    faceplant = [
        {time = 0.01000 event = BailBoardSoundEffect}
        {time = 0.3700 event = BailBodyPunchSoundEffect}
        {time = 0.4400 event = BailSlapSoundEffect}
        {time = 2.0 event = FootstepScuffSoundEffect}
        {time = 2.600 event = FootstepWalkSoundEffect}
        {time = 0.6000 event = BailBodyFallSoundEffect}
        {time = 0.8000 event = BailBodyFallSoundEffect}
    ]
    Bail_Falling_BCK = [
        {time = 0.01000 event = BailBoardSoundEffect}
    ]
    Bail_Falling_FWD = [
        {time = 0.01000 event = BailBoardSoundEffect}
    ]
    Bail_Falling_Hit_Hard = [
        {time = 0.01000 event = BailBodyPunchSoundEffect}
        {time = 0.01000 event = BailBodyFallSoundEffect}
        {time = 0.03000 event = BailSlapSoundEffect}
        {time = 0.5500 event = BailSlapSoundEffect}
        {time = 0.5500 event = BailBodyFallSoundEffect}
        {time = 0.7500 event = BailBodyFallSoundEffect}
    ]
    Bail_Falling_Hit_Hard_BCK = [
        {time = 0.01000 event = BailBodyPunchSoundEffect}
        {time = 0.01000 event = BailBodyFallSoundEffect}
        {time = 0.03000 event = BailSlapSoundEffect}
        {time = 0.5500 event = BailSlapSoundEffect}
        {time = 0.5500 event = BailBodyFallSoundEffect}
        {time = 0.7500 event = BailBodyFallSoundEffect}
    ]
    Bail_Falling_Hit_Hard_FWD = [
        {time = 0.01000 event = BailBodyPunchSoundEffect}
        {time = 0.01000 event = BailBodyFallSoundEffect}
        {time = 0.03000 event = BailSlapSoundEffect}
        {time = 0.5500 event = BailSlapSoundEffect}
        {time = 0.5500 event = BailBodyFallSoundEffect}
        {time = 0.7500 event = BailBodyFallSoundEffect}
    ]
    Bail_Falling_Hit_Med = [
        {time = 0.01000 event = BailBodyPunchSoundEffect}
        {time = 0.01000 event = BailBodyFallSoundEffect}
        {time = 0.03000 event = BailSlapSoundEffect}
        {time = 0.5000 event = BailBodyFallSoundEffect}
        {time = 0.6700 event = BailBodyFallSoundEffect}
    ]
    Bail_Falling_Hit_Med_BCK = [
        {time = 0.01000 event = BailBodyPunchSoundEffect}
        {time = 0.01000 event = BailBodyFallSoundEffect}
        {time = 0.03000 event = BailSlapSoundEffect}
        {time = 0.5000 event = BailBodyFallSoundEffect}
        {time = 0.6700 event = BailBodyFallSoundEffect}
    ]
    Bail_Falling_Hit_Med_FWD = [
        {time = 0.01000 event = BailBodyPunchSoundEffect}
        {time = 0.01000 event = BailBodyFallSoundEffect}
        {time = 0.03000 event = BailSlapSoundEffect}
        {time = 0.5000 event = BailBodyFallSoundEffect}
        {time = 0.6700 event = BailBodyFallSoundEffect}
    ]
    Bail_Falling_LT = [
        {time = 0.01000 event = BailBoardSoundEffect}
    ]
    Bail_Falling_RT = [
        {time = 0.01000 event = BailBoardSoundEffect}
    ]
    Bail_Falling_Slide_HitH_LTb = [
        {time = 0.01000 event = BailBodyPunchSoundEffect}
        {time = 0.01000 event = BailBodyFallSoundEffect}
        {time = 0.03000 event = BailSlapSoundEffect}
        {time = 0.5500 event = BailSlapSoundEffect}
        {time = 0.5500 event = BailBodyFallSoundEffect}
        {time = 0.7500 event = BailBodyFallSoundEffect}
    ]
    Bail_Falling_Slide_HitH_LTf = [
        {time = 0.01000 event = BailBodyPunchSoundEffect}
        {time = 0.01000 event = BailBodyFallSoundEffect}
        {time = 0.03000 event = BailSlapSoundEffect}
        {time = 0.5500 event = BailSlapSoundEffect}
        {time = 0.5500 event = BailBodyFallSoundEffect}
        {time = 0.7500 event = BailBodyFallSoundEffect}
    ]
    Bail_Falling_Slide_HitH_RTb = [
        {time = 0.01000 event = BailBodyPunchSoundEffect}
        {time = 0.01000 event = BailBodyFallSoundEffect}
        {time = 0.03000 event = BailSlapSoundEffect}
        {time = 0.5500 event = BailSlapSoundEffect}
        {time = 0.5500 event = BailBodyFallSoundEffect}
        {time = 0.7500 event = BailBodyFallSoundEffect}
    ]
    Bail_Falling_Slide_HitH_RTf = [
        {time = 0.01000 event = BailBodyPunchSoundEffect}
        {time = 0.01000 event = BailBodyFallSoundEffect}
        {time = 0.03000 event = BailSlapSoundEffect}
        {time = 0.5500 event = BailSlapSoundEffect}
        {time = 0.5500 event = BailBodyFallSoundEffect}
        {time = 0.7500 event = BailBodyFallSoundEffect}
    ]
    Bail_Falling_Slide_HitM_LTb = [
        {time = 0.01000 event = BailBodyPunchSoundEffect}
        {time = 0.01000 event = BailBodyFallSoundEffect}
        {time = 0.03000 event = BailSlapSoundEffect}
        {time = 0.5000 event = BailBodyFallSoundEffect}
        {time = 0.6700 event = BailBodyFallSoundEffect}
    ]
    Bail_Falling_Slide_HitM_LTf = [
        {time = 0.01000 event = BailBodyPunchSoundEffect}
        {time = 0.01000 event = BailBodyFallSoundEffect}
        {time = 0.03000 event = BailSlapSoundEffect}
        {time = 0.5000 event = BailBodyFallSoundEffect}
        {time = 0.6700 event = BailBodyFallSoundEffect}
    ]
    Bail_Falling_Slide_HitM_RTb = [
        {time = 0.01000 event = BailBodyPunchSoundEffect}
        {time = 0.01000 event = BailBodyFallSoundEffect}
        {time = 0.03000 event = BailSlapSoundEffect}
        {time = 0.5000 event = BailBodyFallSoundEffect}
        {time = 0.6700 event = BailBodyFallSoundEffect}
    ]
    Bail_Falling_Slide_HitM_RTf = [
        {time = 0.01000 event = BailBodyPunchSoundEffect}
        {time = 0.01000 event = BailBodyFallSoundEffect}
        {time = 0.03000 event = BailSlapSoundEffect}
        {time = 0.5000 event = BailBodyFallSoundEffect}
        {time = 0.6700 event = BailBodyFallSoundEffect}
    ]
    Bail_Falling_Slide_LTb = [
        {time = 0.01000 event = BailBoardSoundEffect}
    ]
    Bail_Falling_Slide_LTf = [
        {time = 0.01000 event = BailBoardSoundEffect}
    ]
    Bail_Falling_Slide_RTb = [
        {time = 0.01000 event = BailBoardSoundEffect}
    ]
    Bail_Falling_Slide_RTf = [
        {time = 0.01000 event = BailBoardSoundEffect}
    ]
    Bail_Falling_Slide_BCK = [
        {time = 0.01000 event = BailBoardSoundEffect}
    ]
    Bail_Falling_Slide_HitM_BCK = [
        {time = 0.01000 event = BailBodyPunchSoundEffect}
        {time = 0.01000 event = BailBodyFallSoundEffect}
        {time = 0.03000 event = BailSlapSoundEffect}
        {time = 0.5000 event = BailBodyFallSoundEffect}
        {time = 0.6700 event = BailBodyFallSoundEffect}
    ]
    Bail_Falling_Slide_HitH_BCK = [
        {time = 0.01000 event = BailBodyPunchSoundEffect}
        {time = 0.01000 event = BailBodyFallSoundEffect}
        {time = 0.03000 event = BailSlapSoundEffect}
        {time = 0.5500 event = BailSlapSoundEffect}
        {time = 0.5500 event = BailBodyFallSoundEffect}
        {time = 0.7500 event = BailBodyFallSoundEffect}
    ]
    FlailBail = [
        {time = 0.01000 event = BailBoardSoundEffect}
        {time = 0.4800 event = BailBodyPunchSoundEffect}
        {time = 0.5400 event = BailSlapSoundEffect}
        {time = 0.8000 event = BailBodyFallSoundEffect}
    ]
    FlailGetUp = [
        {time = 1.500 event = FootstepScuffSoundEffect}
        {time = 2.0 event = FootstepScuffSoundEffect}
        {time = 2.350 event = FootstepWalkSoundEffect}
        {time = 2.700 event = FootstepWalkSoundEffect}
    ]
    GetUp_HK_Ft = [
        {time = 0.3000 event = FootstepWalkSoundEffect}
        {time = 0.3000 event = FootstepScuffSoundEffect}
        {time = 0.7300 event = FootstepWalkSoundEffect}
    ]
    GetUp_HK_Ft_Q = [
        {time = 0.4500 event = FootstepWalkSoundEffect}
        {time = 0.4500 event = FootstepScuffSoundEffect}
    ]
    GetUp_Sit_Ft = [
        {time = 0.4800 event = FootstepWalkSoundEffect}
        {time = 0.4800 event = FootstepScuffSoundEffect}
        {time = 0.8000 event = FootstepWalkSoundEffect}
    ]
    GetUp_Sit_Ft_T = [
        {time = 0.2500 event = CatchBoardSound params = { DefVol = 50 }}
        {time = 0.4800 event = FootstepWalkSoundEffect}
        {time = 0.4800 event = FootstepScuffSoundEffect}
        {time = 0.7500 event = FootstepWalkSoundEffect}
    ]
    GetUp_Sit_Ft_Q = [
        {time = 0.5200 event = FootstepWalkSoundEffect}
        {time = 0.5200 event = FootstepScuffSoundEffect}
        {time = 0.7500 event = FootstepWalkSoundEffect}
        {time = 1.0 event = FootstepRunSoundEffect}
    ]
    GetUp_HK_Lt = [
        {time = 0.6000 event = FootstepRunSoundEffect}
        {time = 0.08000 event = FootstepScuffSoundEffect}
    ]
    GetUp_HK_Lt_T = [
        {time = 0.01000 event = CatchBoardSound params = { DefVol = 50 }}
        {time = 0.4000 event = FootstepRunSoundEffect}
        {time = 0.4000 event = FootstepScuffSoundEffect}
        {time = 0.7000 event = FootstepRunSoundEffect}
    ]
    GetUp_HK_Lt_Q = [
        {time = 0.2000 event = FootstepRunSoundEffect}
        {time = 0.2000 event = FootstepScuffSoundEffect}
        {time = 0.5000 event = FootstepWalkSoundEffect}
        {time = 0.7500 event = FootstepRunSoundEffect}
    ]
    GetUp_HK_Bk = [
        {time = 0.2000 event = FootstepRunSoundEffect}
        {time = 0.2000 event = FootstepScuffSoundEffect}
        {time = 0.5200 event = FootstepWalkSoundEffect}
        {time = 1.0 event = FootstepRunSoundEffect}
    ]
    GetUp_HK_Bk_T = [
        {time = 0.1000 event = CatchBoardSound params = { DefVol = 50 }}
        {time = 0.2000 event = FootstepRunSoundEffect}
        {time = 0.2000 event = FootstepScuffSoundEffect}
        {time = 0.5000 event = FootstepWalkSoundEffect}
        {time = 0.7800 event = FootstepRunSoundEffect}
        {time = 0.9500 event = FootstepRunSoundEffect}
        {time = 0.9500 event = FootstepScuffSoundEffect}
    ]
    GetUp_HK_Bk_Q = [
        {time = 0.2000 event = FootstepRunSoundEffect}
        {time = 0.2000 event = FootstepScuffSoundEffect}
        {time = 0.5000 event = FootstepWalkSoundEffect}
        {time = 0.7500 event = FootstepRunSoundEffect}
    ]
    GetUp_HK_Rt_T = [
        {time = 0.1000 event = CatchBoardSound params = { DefVol = 50 }}
        {time = 0.4000 event = FootstepRunSoundEffect}
        {time = 0.4000 event = FootstepScuffSoundEffect}
        {time = 0.7200 event = FootstepRunSoundEffect}
    ]
    GetUp_HK_Rt_Q = [
        {time = 0.02000 event = FootstepScuffSoundEffect}
        {time = 0.5200 event = FootstepWalkSoundEffect}
        {time = 0.5200 event = FootstepScuffSoundEffect}
        {time = 1.0 event = FootstepRunSoundEffect}
    ]
    GetUp_HK_Rt = [
        {time = 0.3000 event = FootstepWalkSoundEffect}
        {time = 0.3000 event = FootstepScuffSoundEffect}
        {time = 0.7300 event = FootstepWalkSoundEffect}
    ]
    GetUp_S_Turn180 = [
        {time = 0.3000 event = CatchBoardSound params = { DefVol = 50 }}
        {time = 0.4500 event = FootstepScuffSoundEffect}
        {time = 0.7000 event = FootstepWalkSoundEffect}
        {time = 0.3300 event = FootstepScuffSoundEffect}
        {time = 1.250 event = FootstepRunSoundEffect}
        {time = 1.550 event = FootstepRunSoundEffect}
    ]
    GetUp_S_NoPushOff = [
        {time = 0.3000 event = FootstepWalkSoundEffect}
        {time = 0.3300 event = FootstepScuffSoundEffect}
    ]
    Bail_Manual_BK = [
        {time = 0.02000 event = BailBoardSoundEffect}
        {time = 0.4500 event = BailBodyPunchSoundEffect}
        {time = 0.5400 event = BailSlapSoundEffect}
        {time = 0.8700 event = BailBodyFallSoundEffect}
        {time = 1.070 event = BailBodyFallSoundEffect}
        {time = 1.580 event = SoundEffect params = { name = BailBodyPunch02_11 }}
    ]
    Bail_Manual_BK_fast = [
        {time = 0.02000 event = BailBoardSoundEffect}
        {time = 0.4500 event = BailBodyPunchSoundEffect}
        {time = 0.5400 event = BailSlapSoundEffect}
        {time = 0.8700 event = BailBodyFallSoundEffect}
        {time = 1.070 event = BailBodyFallSoundEffect}
        {time = 2.100 event = SoundEffect params = { name = BailBodyPunch02_11 }}
    ]
    Bail_Manual_FT = [
        {time = 0.01000 event = BailBoardSoundEffect}
        {time = 0.3800 event = BailBodyPunchSoundEffect}
        {time = 0.4500 event = BailSlapSoundEffect}
        {time = 0.8500 event = BailBodyFallSoundEffect}
        {time = 1.050 event = BailBodyFallSoundEffect}
    ]
    Bail_Manual_FT_fast = [
        {time = 0.01000 event = BailBoardSoundEffect}
        {time = 0.3800 event = BailBodyPunchSoundEffect}
        {time = 0.4500 event = BailSlapSoundEffect}
        {time = 0.8500 event = BailBodyFallSoundEffect}
        {time = 1.050 event = BailBodyFallSoundEffect}
    ]
    manualback = [
        {time = 0.02000 event = BailBoardSoundEffect}
        {time = 0.5200 event = BailBodyPunchSoundEffect}
        {time = 0.6100 event = BailSlapSoundEffect}
        {time = 1.580 event = SoundEffect params = { name = BailBodyPunch02_11 }}
    ]
    manualgetup = [
        {time = 1.100 event = FootstepWalkSoundEffect}
        {time = 1.600 event = FootstepWalkSoundEffect}
        {time = 2.180 event = FootstepScuffSoundEffect}
        {time = 2.280 event = FootstepScuffSoundEffect}
        {time = 2.220 event = FootstepRunSoundEffect}
        {time = 2.320 event = FootstepRunSoundEffect}
    ]
    manualforwards = [
        {time = 0.01000 event = BailBoardSoundEffect}
        {time = 0.3800 event = BailBodyPunchSoundEffect}
        {time = 0.4500 event = BailSlapSoundEffect}
        {time = 0.8500 event = BailBodyFallSoundEffect}
        {time = 1.050 event = BailBodyFallSoundEffect}
    ]
    manual_fgetup = [
        {time = 0.7000 event = FootstepWalkSoundEffect}
        {time = 1.500 event = FootstepRunSoundEffect}
        {time = 1.500 event = FootstepScuffSoundEffect}
        {time = 1.950 event = FootstepRunSoundEffect}
        {time = 2.320 event = FootstepWalkSoundEffect}
    ]
    Nutsac = [
        {time = 0.2000 event = BailBodyPunchSoundEffect}
        {time = 0.2700 event = BailSlapSoundEffect}
        {time = 0.3300 event = BailCrackSoundEffect}
        {time = 0.9000 event = BailBodyFallSoundEffect}
        {time = 1.100 event = BailBodyFallSoundEffect}
    ]
    Bail_Nutter_FWD = [
        {time = 0.01000 event = BailBoardSoundEffect}
        {time = 0.4000 event = BailBodyPunchSoundEffect}
        {time = 0.4700 event = BailSlapSoundEffect}
        {time = 0.5300 event = BailCrackSoundEffect}
        {time = 1.100 event = BailBodyFallSoundEffect}
        {time = 1.500 event = BailBodyFallSoundEffect}
        {time = 1.700 event = BailBodyFallSoundEffect}
    ]
    Bail_Nutter_BCK = [
        {time = 0.01000 event = BailBoardSoundEffect}
        {time = 0.4000 event = BailBodyPunchSoundEffect}
        {time = 0.4700 event = BailSlapSoundEffect}
        {time = 0.5300 event = BailCrackSoundEffect}
        {time = 0.8000 event = BailBodyFallSoundEffect}
        {time = 1.200 event = BailBodyFallSoundEffect}
        {time = 1.400 event = BailBodyFallSoundEffect}
    ]
    Bail_Pitch_Nose = [
        {time = 0.1000 event = BailBodyPunchSoundEffect}
        {time = 0.1000 event = BailSlapSoundEffect}
        {time = 0.6000 event = BailBodyFallSoundEffect}
        {time = 1.200 event = BailBodyFallSoundEffect}
    ]
    Bail_Pitch_Back = [
        {time = 0.2200 event = BailBodyPunchSoundEffect}
        {time = 0.3100 event = BailSlapSoundEffect}
        {time = 0.4000 event = BailBodyFallSoundEffect}
        {time = 1.0 event = SoundEffect params = { name = BailBodyPunch02_11 }}
    ]
    Bail_Pitch_Face = [
        {time = 0.1800 event = BailBodyPunchSoundEffect}
        {time = 0.2500 event = BailSlapSoundEffect}
        {time = 0.5000 event = BailBodyFallSoundEffect}
        {time = 0.6500 event = BailBodyFallSoundEffect}
    ]
    Bail_Pitch_Tail = [
        {time = 0.2200 event = BailBodyPunchSoundEffect}
        {time = 0.3100 event = BailSlapSoundEffect}
        {time = 0.4000 event = BailBodyFallSoundEffect}
        {time = 1.200 event = SoundEffect params = { name = BailBodyPunch02_11 }}
    ]
    railbail = [
        {time = 0.01000 event = BailBoardSoundEffect}
    ]
    railbailgetup = [
        {time = 0.3300 event = FootstepScuffSoundEffect}
        {time = 1.0 event = FootstepWalkSoundEffect}
        {time = 2.050 event = FootstepWalkSoundEffect}
        {time = 2.500 event = FootstepWalkSoundEffect}
    ]
    railbailhitground = [
        {time = 0.02000 event = BailBodyPunchSoundEffect}
        {time = 0.1000 event = BailSlapSoundEffect}
        {time = 0.4000 event = BailBodyFallSoundEffect}
    ]
    Bail_Ramp_Lt = [
        {time = 0.01000 event = BailBoardSoundEffect}
        {time = 0.2500 event = FootstepRunSoundEffect}
        {time = 0.2500 event = FootstepScuffSoundEffect}
        {time = 0.5000 event = FootstepRunSoundEffect}
        {time = 0.5000 event = FootstepScuffSoundEffect}
        {time = 0.7000 event = BailBodyPunchSoundEffect}
        {time = 0.7000 event = BailBodyFallSoundEffect}
        {time = 0.8500 event = BailSlapSoundEffect}
    ]
    Bail_Ramp_Rt = [
        {time = 0.01000 event = BailBoardSoundEffect}
        {time = 0.3800 event = BailBodyPunchSoundEffect}
        {time = 0.4500 event = BailSlapSoundEffect}
        {time = 0.7500 event = BailBodyFallSoundEffect}
        {time = 0.9500 event = BailBodyFallSoundEffect}
    ]
    Bail_Ramp_Bk_Hd = [
        {time = 0.01000 event = BailBoardSoundEffect}
        {time = 0.3100 event = BailBodyPunchSoundEffect}
        {time = 0.3100 event = BailBodyFallSoundEffect}
        {time = 0.3300 event = BailSlapSoundEffect}
        {time = 0.8500 event = BailSlapSoundEffect}
        {time = 0.8500 event = BailBodyFallSoundEffect}
        {time = 1.430 event = BailBodyFallSoundEffect}
    ]
    Bail_Ramp_Rt_Med = [
        {time = 0.2000 event = BailBodyPunchSoundEffect}
        {time = 0.2000 event = BailBodyFallSoundEffect}
        {time = 0.2300 event = BailSlapSoundEffect}
        {time = 0.7000 event = BailBodyFallSoundEffect}
        {time = 0.8700 event = BailBodyFallSoundEffect}
    ]
    Bail_Ramp_Lt_Med = [
        {time = 0.01000 event = BailBoardSoundEffect}
        {time = 0.3100 event = BailBodyPunchSoundEffect}
        {time = 0.3100 event = BailBodyFallSoundEffect}
        {time = 0.3300 event = BailSlapSoundEffect}
        {time = 0.5800 event = BailBodyFallSoundEffect}
        {time = 0.7500 event = BailBodyFallSoundEffect}
    ]
    Bail_Ramp_Bk = [
        {time = 0.2200 event = BailBodyPunchSoundEffect}
        {time = 0.3100 event = BailSlapSoundEffect}
        {time = 0.4000 event = BailBodyFallSoundEffect}
        {time = 1.500 event = FootstepLandSoundEffect}
    ]
    Bail_Ramp_Ft_Hd = [
        {time = 0.2100 event = BailBodyPunchSoundEffect}
        {time = 0.2100 event = BailBodyFallSoundEffect}
        {time = 0.2300 event = BailSlapSoundEffect}
        {time = 0.8000 event = BailBodyFallSoundEffect}
        {time = 1.0 event = BailBodyFallSoundEffect}
        {time = 1.250 event = BailBodyFallSoundEffect}
    ]
    Bail_Ramp_Ft_Med = [
        {time = 0.01000 event = BailBoardSoundEffect}
        {time = 0.3100 event = BailBodyPunchSoundEffect}
        {time = 0.3100 event = BailBodyFallSoundEffect}
        {time = 0.3300 event = BailSlapSoundEffect}
        {time = 0.7500 event = BailBodyFallSoundEffect}
    ]
    Bail_Ramp_Ft = [
        {time = 0.01000 event = BailBoardSoundEffect}
        {time = 0.5100 event = BailBodyPunchSoundEffect}
        {time = 0.5100 event = BailBodyFallSoundEffect}
        {time = 0.5300 event = BailSlapSoundEffect}
        {time = 0.9800 event = BailBodyFallSoundEffect}
    ]
    Bail_Ramp_Lt_Hd = [
        {time = 0.01000 event = BailBoardSoundEffect}
        {time = 0.5100 event = BailBodyPunchSoundEffect}
        {time = 0.5100 event = BailBodyFallSoundEffect}
        {time = 0.5300 event = BailSlapSoundEffect}
        {time = 0.9800 event = BailBodyFallSoundEffect}
    ]
    Bail_Ramp_Rt_Hd = [
        {time = 0.01000 event = BailBoardSoundEffect}
        {time = 0.1000 event = FootstepRunSoundEffect}
        {time = 0.2500 event = FootstepRunSoundEffect}
        {time = 0.3800 event = FootstepRunSoundEffect}
        {time = 0.3800 event = FootstepScuffSoundEffect}
        {time = 0.8100 event = BailBodyPunchSoundEffect}
        {time = 0.8100 event = BailBodyFallSoundEffect}
        {time = 0.8300 event = BailSlapSoundEffect}
        {time = 1.180 event = BailBodyFallSoundEffect}
    ]
    Bail_RunOut_Old = [
        {time = 0.01000 event = BailBoardSoundEffect}
        {time = 0.3000 event = BailBoardSoundEffect}
        {time = 0.1800 event = FootstepRunSoundEffect}
        {time = 0.6000 event = FootstepRunSoundEffect}
        {time = 0.9700 event = FootstepScuffSoundEffect}
        {time = 1.500 event = FootstepWalkSoundEffect}
        {time = 2.100 event = FootstepWalkSoundEffect}
        {time = 2.480 event = FootstepWalkSoundEffect}
    ]
    Bail_RunOut_New_A = [
        {time = 0.01000 event = BailBoardSoundEffect}
        {time = 0.3000 event = BailBoardSoundEffect}
        {time = 0.1800 event = FootstepRunSoundEffect}
        {time = 0.6000 event = FootstepRunSoundEffect}
        {time = 0.9700 event = FootstepScuffSoundEffect}
        {time = 1.500 event = FootstepWalkSoundEffect}
        {time = 2.100 event = FootstepWalkSoundEffect}
        {time = 2.480 event = FootstepWalkSoundEffect}
    ]
    RunOut_Drop_Land_Med = [
        {time = 0.02000 event = BailBodyPunchSoundEffect}
        {time = 0.04000 event = BailSlapSoundEffect}
        {time = 0.5000 event = BailBodyFallSoundEffect}
        {time = 0.7000 event = BailBodyFallSoundEffect}
    ]
    Bail_Spin_CCW_Hard = [
        {time = 0.01000 event = BailBoardSoundEffect}
        {time = 0.5100 event = BailBodyPunchSoundEffect}
        {time = 0.5100 event = BailBodyFallSoundEffect}
        {time = 0.5300 event = BailSlapSoundEffect}
        {time = 0.8000 event = BailBodyFallSoundEffect}
    ]
    Bail_Spin_CW_Hard = [
        {time = 0.01000 event = BailBoardSoundEffect}
        {time = 0.4200 event = BailBodyPunchSoundEffect}
        {time = 0.4200 event = BailBodyFallSoundEffect}
        {time = 0.4400 event = BailSlapSoundEffect}
        {time = 0.6000 event = BailBodyFallSoundEffect}
        {time = 2.100 event = FootstepLandSoundEffect}
    ]
    Bail_Spin_CCW_Hard_B = [
        {time = 0.2100 event = BailBodyPunchSoundEffect}
        {time = 0.2100 event = BailBodyFallSoundEffect}
        {time = 0.2300 event = BailSlapSoundEffect}
        {time = 0.6800 event = BailBodyFallSoundEffect}
    ]
    Bail_Spin_CCW_Hard_C = [
        {time = 0.01000 event = BailBoardSoundEffect}
        {time = 0.4200 event = BailBodyPunchSoundEffect}
        {time = 0.4200 event = BailBodyFallSoundEffect}
        {time = 0.4400 event = BailSlapSoundEffect}
        {time = 0.6000 event = BailBodyFallSoundEffect}
        {time = 0.8000 event = BailBodyFallSoundEffect}
        {time = 1.0 event = BailBodyFallSoundEffect}
    ]
    Bail_Spin_CW_Hard_B = [
        {time = 0.01000 event = BailBoardSoundEffect}
        {time = 0.5100 event = BailBodyPunchSoundEffect}
        {time = 0.5100 event = BailBodyFallSoundEffect}
        {time = 0.5300 event = BailSlapSoundEffect}
        {time = 0.8000 event = BailBodyFallSoundEffect}
    ]
    Bail_Spin_CW_Hard_A = [
        {time = 0.01000 event = BailBoardSoundEffect}
        {time = 0.3100 event = BailBodyPunchSoundEffect}
        {time = 0.3100 event = BailBodyFallSoundEffect}
        {time = 0.3300 event = BailSlapSoundEffect}
        {time = 0.7000 event = BailBodyFallSoundEffect}
    ]
    Bail_Spin_FWD_Regular = [
        {time = 0.01000 event = BailBoardSoundEffect}
        {time = 0.1600 event = BailBodyPunchSoundEffect}
        {time = 0.1600 event = BailBodyFallSoundEffect}
        {time = 0.1800 event = BailSlapSoundEffect}
        {time = 0.7500 event = BailBodyFallSoundEffect}
    ]
    Bail_Spin_FWD_Hard = [
        {time = 0.01000 event = BailBoardSoundEffect}
        {time = 0.4100 event = BailBodyPunchSoundEffect}
        {time = 0.4100 event = BailBodyFallSoundEffect}
        {time = 0.4300 event = BailSlapSoundEffect}
        {time = 0.5000 event = BailBodyFallSoundEffect}
        {time = 1.600 event = FootstepLandSoundEffect}
    ]
    Bail_Spin_FWD_Fast = [
        {time = 0.01000 event = BailBoardSoundEffect}
        {time = 0.4100 event = BailBodyPunchSoundEffect}
        {time = 0.4100 event = BailBodyFallSoundEffect}
        {time = 0.4300 event = BailSlapSoundEffect}
        {time = 0.5000 event = BailBodyFallSoundEffect}
        {time = 0.7000 event = BailBodyFallSoundEffect}
        {time = 0.9000 event = BailBodyFallSoundEffect}
    ]
    Bail_Spin_BCK_Regular = [
        {time = 0.01000 event = BailBoardSoundEffect}
        {time = 0.1600 event = BailBodyPunchSoundEffect}
        {time = 0.1600 event = BailBodyFallSoundEffect}
        {time = 0.1800 event = BailSlapSoundEffect}
        {time = 0.7500 event = BailBodyFallSoundEffect}
    ]
    Bail_Spin_BCK_Fast = [
        {time = 0.01000 event = BailBoardSoundEffect}
        {time = 0.5000 event = BailBodyPunchSoundEffect}
        {time = 0.5000 event = BailBodyFallSoundEffect}
        {time = 0.5500 event = BailSlapSoundEffect}
        {time = 1.0 event = BailBodyFallSoundEffect}
        {time = 1.550 event = BailBodyFallSoundEffect}
        {time = 1.780 event = BailSlapSoundEffect}
    ]
    Bail_Spin_BCK_Hard = [
        {time = 0.01000 event = BailBoardSoundEffect}
        {time = 0.1600 event = BailBodyPunchSoundEffect}
        {time = 0.1600 event = BailBodyFallSoundEffect}
        {time = 0.3000 event = BailSlapSoundEffect}
        {time = 0.7500 event = BailBodyFallSoundEffect}
        {time = 1.600 event = FootstepLandSoundEffect}
    ]
    Bail_Wall_FWD_Regular = [
        {time = 0.02000 event = BailBodyPunchSoundEffect}
        {time = 0.04000 event = BailSlapSoundEffect}
        {time = 0.5000 event = BailBodyFallSoundEffect}
        {time = 0.7500 event = BailBodyFallSoundEffect}
        {time = 1.0 event = BailBodyFallSoundEffect}
    ]
    Bail_Wall_FWD_Low = [
        {time = 0.02000 event = BailBodyPunchSoundEffect}
        {time = 0.04000 event = BailSlapSoundEffect}
        {time = 0.3000 event = BailBodyFallSoundEffect}
        {time = 0.5000 event = BailBodyFallSoundEffect}
    ]
    Bail_Wall_BCK_Regular = [
        {time = 0.02000 event = BailBodyPunchSoundEffect}
        {time = 0.08000 event = BailSlapSoundEffect}
        {time = 0.6000 event = BailBodyFallSoundEffect}
        {time = 0.8000 event = BailBodyFallSoundEffect}
    ]
    Bail_Wall_BCK_Low = [
        {time = 0.02000 event = BailBodyPunchSoundEffect}
        {time = 0.04000 event = BailSlapSoundEffect}
        {time = 0.5000 event = BailBodyFallSoundEffect}
        {time = 0.7000 event = BailBodyFallSoundEffect}
    ]
    Bail_Wall_LT_Low = [
        {time = 0.02000 event = BailBodyPunchSoundEffect}
        {time = 0.04000 event = BailSlapSoundEffect}
        {time = 0.4000 event = BailBodyFallSoundEffect}
    ]
    Bail_Wall_RT_Low = [
        {time = 0.02000 event = BailBodyPunchSoundEffect}
        {time = 0.04000 event = BailSlapSoundEffect}
        {time = 0.4000 event = BailBodyFallSoundEffect}
    ]
    WalkingSlap = [
        {time = 0.2800 event = BailSlapSoundEffect}
        {time = 0.5700 event = FootstepRunSoundEffect}
        {time = 0.9000 event = FootstepWalkSoundEffect}
    ]
    WalkingBail = [
        {time = 0.01000 event = BailSlapSoundEffect}
        {time = 0.4500 event = BailBoardSoundEffect}
        {time = 0.6000 event = BailBodyFallSoundEffect}
    ]
    WalkingBailGetUp = [
        {time = 0.7000 event = FootstepScuffSoundEffect}
        {time = 1.200 event = FootstepScuffSoundEffect}
        {time = 1.600 event = FootstepWalkSoundEffect}
        {time = 1.900 event = FootstepWalkSoundEffect}
    ]
    GetUp_S_BoardCatch1 = [
        {time = 0.01000 event = TurnOffSkaterLoopingSound}
        {time = 0.2600 event = BoardFlyInSound}
        {time = 0.7000 event = CatchBoardSound}
        {time = 1.640 event = FootstepWalkSoundEffect}
        {time = 1.920 event = FootstepWalkSoundEffect}
        {time = 2.400 event = FootstepScuffSoundEffect}
        {time = 2.450 event = TerrainLandSound}
        {time = 2.450 event = TurnOnSkaterLoopingSound}
    ]
    GetUp_S_RunJump = [
        {time = 0.01000 event = TurnOffSkaterLoopingSound}
        {time = 0.01000 event = BoardRollingSound}
        {time = 1.050 event = FootstepRunSoundEffect}
        {time = 1.400 event = FootstepRunSoundEffect}
        {time = 1.800 event = FootstepScuffSoundEffect}
        {time = 1.800 event = TerrainLandSound}
        {time = 1.800 event = TurnOnSkaterLoopingSound}
    ]
    GetUp_S_BoardFlip1 = [
        {time = 0.01000 event = BoardScrapeSound}
        {time = 0.9000 event = CatchBoardSound params = { DefVol = 80 }}
        {time = 1.400 event = SoundEffect params = { name = OllieConc19 }}
        {time = 1.800 event = TerrainLandSound}
    ]
    Tantrum_BoardFocus = [
        {time = 0.6000 event = FootstepScuffSoundEffect}
        {time = 1.200 event = BoardSplitSound}
        {time = 2.0 event = FootstepWalkSoundEffect}
        {time = 2.400 event = FootstepWalkSoundEffect}
    ]
    Tantrum_DiscusStart = [
        {time = 0.01000 event = DiscusWhooshSound params = { DefPitch = 60 }}
    ]
    Tantrum_DiscusFinish = [ 
     ]
    Tantrum_KickBoard = [
        {time = 0.3000 event = FootstepScuffSoundEffect}
        {time = 0.4100 event = FootstepRunSoundEffect}
        {time = 0.7500 event = FootstepRunSoundEffect}
        {time = 0.8200 event = KickBoard}
        {time = 1.300 event = FootstepScuffSoundEffect}
    ]
    Tantrum_HeadButt = [
        {time = 0.9500 event = BoardSplitSound}
        {time = 2.100 event = SoundEffect params = { name = BoardBounce01 }}
        {time = 2.150 event = SoundEffect params = { name = BoardBounce01 }}
    ]
    Tantrum_SlingShot = [
        {time = 0.3000 event = DiscusWhooshSound params = { DefPitch = 60 }}
    ]
    Tantrum_PileDriver = [
        {time = 0.9500 event = BoardSplitSound}
        {time = 1.100 event = SoundEffect params = { name = BoardBounce01 }}
        {time = 2.200 event = SoundEffect params = { name = BoardBounce01 }}
    ]
    Standing_Tag2 = [
        {time = 0.2330 event = DoSprayPaint params = { on }}
        {time = 0.5000 event = DoSprayPaint params = { splat }}
        {time = 0.6000 event = DoSprayPaint params = { Off }}
    ]
    Hanging_Tag = [
        {time = 0.6000 event = DoSprayPaint params = { on }}
        {time = 0.5000 event = DoSprayPaint params = { splat }}
        {time = 1.060 event = DoSprayPaint params = { Off }}
    ]
    Throw_Sidearm = [
        {time = 0.2500 event = ThrowObject params = {}}
    ]
    Standing_Throw = [
        {time = 0.2700 event = ThrowObject params = {}}
    ]
    VertPlant = [
        {time = 0.3300 event = SlapVertSticker}
    ]
    Special_FranklinGrind_Idle = [
        {time = 0.01000 event = DoLightning}
    ]
    Shrek_BurpTag = [
        {time = 0.2000 event = DoShrekBurp}
        {time = 0.3000 event = DoSprayPaint params = { splat }}
    ]
    Shrek_BurpHangingTag = [
        {time = 0.1500 event = DoShrekBurp}
        {time = 0.2500 event = DoSprayPaint params = { splat }}
    ]
    Segway_Grind_Init = [
        {time = 0.05000 event = DoVehicleGrind}
    ]
    Veh_Bull_Grind_Init = [
        {time = 0.05000 event = DoVehicleGrind}
    ]
    Wheelchair_Grind_init = [
        {time = 0.05000 event = DoVehicleGrind}
    ]
    Veh_Minikart_Grind_Init = [
        {time = 0.05000 event = DoVehicleGrind}
    ]
    Tricycle_Grind_Init = [
        {time = 0.05000 event = DoVehicleGrind}
    ]
    BeaverBlast = [
        {time = 0.3000 event = DoFartBurst}
    ]
    Special_Muska_Burn_init = [
        {time = 0.4000 event = DoCanFlame}
    ]
    Special_Muska_Burn_Out = [
        {time = 0.01000 event = DoCanFlameOff}
    ]
    Special_GrafPunk_Idle = [
        {time = 0.01000 event = DoDoubleCanOn}
    ]
    Special_GrafPunk_Out = [
        {time = 0.01000 event = DoDoubleCanOff}
    ]
    Special_Phil_Hoagie_Idle = [
        {time = 0.01000 event = DoHoagieOn}
    ]
    Special_Phil_hoagie_Out = [
        {time = 0.01000 event = DoHoagieOff}
    ]
    Special_Jesse_HotRod_Init = [
        {time = 0.01000 event = DoTiresOn}
    ]
    Special_Koston_900 = [
        {time = 0.03000 event = DoVortex}
    ]
    Veh_Bull_IdleMoving = [
        {time = 0.3500 event = SoundEffect params = {name = SK6_BA_Steveo_Buck_11 DefVol = 60}}
        {time = 0.5800 event = SoundEffect params = {name = SK6_BA_Steveo_Buck02_11 DefVol = 60}}
    ]
    Veh_Bull_Accel = [
        {time = 0.3500 event = SoundEffect params = {name = SK6_BA_Steveo_Buck_11 DefVol = 60}}
        {time = 0.5800 event = SoundEffect params = {name = SK6_BA_Steveo_Buck02_11 DefVol = 60}}
    ]
    Veh_Bull_Brake = [
        {time = 0.3500 event = SoundEffect params = {name = SK6_BA_Steveo_Buck_11 DefVol = 60}}
        {time = 0.5800 event = SoundEffect params = {name = SK6_BA_Steveo_Buck02_11 DefVol = 60}}
    ]
    Veh_Bull_TurnLeft = [
        {time = 0.3500 event = SoundEffect params = {name = SK6_BA_Steveo_Buck_11 DefVol = 60}}
        {time = 0.5800 event = SoundEffect params = {name = SK6_BA_Steveo_Buck02_11 DefVol = 60}}
    ]
    Veh_Bull_TurnRight = [
        {time = 0.3500 event = SoundEffect params = {name = SK6_BA_Steveo_Buck_11 DefVol = 60}}
        {time = 0.5800 event = SoundEffect params = {name = SK6_BA_Steveo_Buck02_11 DefVol = 60}}
    ]
}
PedAnimEventTable = {
    Ped_Graffiti_BigTag01 = [
        {time = 1.300 event = DoSprayPaint params = { on }}
        {time = 2 event = DoSprayPaint params = { Off }}
        {time = 2.400 event = DoSprayPaint params = { on }}
        {time = 3.300 event = DoSprayPaint params = { Off }}
        {time = 4.200 event = DoSprayPaint params = { on }}
        {time = 4.500 event = DoSprayPaint params = { Off }}
        {time = 5 event = DoSprayPaint params = { on }}
        {time = 5.300 event = DoSprayPaint params = { Off }}
        {time = 5.850 event = DoSprayPaint params = { on }}
        {time = 6.500 event = DoSprayPaint params = { Off }}
    ]
    Ped_Graffiti_BigTag02 = [
        {time = 0.7000 event = DoSprayPaint params = { on }}
        {time = 2.270 event = DoSprayPaint params = { Off }}
        {time = 2.660 event = DoSprayPaint params = { on }}
        {time = 5.230 event = DoSprayPaint params = { Off }}
    ]
    Ped_Graffiti_Step2Tag = [
        {time = 1.370 event = DoSprayPaint params = { on }}
        {time = 3.860 event = DoSprayPaint params = { Off }}
        {time = 4.930 event = DoSprayPaint params = { on }}
        {time = 7.430 event = DoSprayPaint params = { Off }}
    ]
    Ped_Graffiti_Step2BigTag = [
        {time = 1.230 event = DoSprayPaint params = { on }}
        {time = 2.100 event = DoSprayPaint params = { Off }}
    ]
    Ped_Sldr_Marching01 = [
        {time = 0.001000 event = PedHitDrum params = {DefVol = 100 DefPitch = 100}}
    ]
    Ped_Sldr_Drumming02 = [
        {time = 0.001000 event = PedHitDrum params = {DefVol = 100 DefPitch = 100}}
    ]
    BarkIdle = [
        {time = 0.02000 event = DogBarkStream}
    ]
    Ped_M_JumpBack = [
        {time = 0.5800 event = FootstepScuffSoundEffect}
        {time = 0.8500 event = FootstepRunSoundEffect}
        {time = 1.0 event = FootstepRunSoundEffect}
    ]
    Ped_F_JumpBack = [
        {time = 0.1000 event = FootstepScuffSoundEffect}
        {time = 0.5000 event = FootstepRunSoundEffect}
        {time = 0.6500 event = FootstepRunSoundEffect}
    ]
    Ped_M_JumpForward = [
        {time = 0.6000 event = FootstepScuffSoundEffect}
        {time = 0.6000 event = FootstepRunSoundEffect}
        {time = 1.100 event = FootstepWalkSoundEffect}
    ]
    Ped_F_JumpForward = [
        {time = 0.4000 event = FootstepScuffSoundEffect}
        {time = 0.4000 event = FootstepRunSoundEffect}
        {time = 0.5600 event = FootstepRunSoundEffect}
        {time = 1.700 event = FootstepWalkSoundEffect}
    ]
    Ped_M_JumpLeft = [
        {time = 0.4500 event = FootstepScuffSoundEffect}
        {time = 0.4500 event = FootstepRunSoundEffect}
        {time = 0.8000 event = FootstepRunSoundEffect}
        {time = 1.300 event = FootstepWalkSoundEffect}
    ]
    Ped_F_JumpRight = [
        {time = 0.4500 event = FootstepScuffSoundEffect}
        {time = 0.4500 event = FootstepRunSoundEffect}
        {time = 0.6000 event = FootstepRunSoundEffect}
        {time = 1.300 event = FootstepWalkSoundEffect}
    ]
    Ped_M_FalldownA = [
        {time = 0.4500 event = BailBodyFallSoundEffect}
        {time = 0.7000 event = BailBodyFallSoundEffect}
    ]
    Ped_M_FalldownB = [
        {time = 0.4200 event = BailBodyFallSoundEffect}
        {time = 0.6500 event = BailBodyFallSoundEffect}
    ]
    Ped_M_FalldownC = [
        {time = 0.3000 event = BailBodyFallSoundEffect}
    ]
    Ped_M_FalldownD = [
        {time = 0.2000 event = FootstepScuffSoundEffect}
        {time = 0.4000 event = BailBodyFallSoundEffect}
    ]
    Ped_M_FalldownE = [
        {time = 0.2000 event = FootstepScuffSoundEffect}
        {time = 0.3500 event = BailBodyFallSoundEffect}
        {time = 0.5500 event = BailBodyFallSoundEffect}
    ]
    Ped_M_Run = [
        {time = 0.1200 event = FootstepRunSoundEffect}
        {time = 0.4600 event = FootstepRunSoundEffect}
    ]
    Ped_f_Run = [
        {time = 0.1800 event = FootstepRunSoundEffect}
        {time = 0.6000 event = FootstepRunSoundEffect}
    ]
    Ped_M_RunToIdle = [
        {time = 0.1200 event = FootstepRunSoundEffect}
        {time = 0.4600 event = FootstepRunSoundEffect}
        {time = 0.7500 event = FootstepScuffSoundEffect}
    ]
    Ped_F_RunToIdle1 = [
        {time = 0.1200 event = FootstepRunSoundEffect}
        {time = 0.4600 event = FootstepRunSoundEffect}
        {time = 0.1200 event = FootstepScuffSoundEffect}
    ]
    Ped_F_RunToIdle2 = [
        {time = 0.2000 event = FootstepRunSoundEffect}
        {time = 0.4600 event = FootstepRunSoundEffect}
    ]
    Ped_M_Run1 = [
        {time = 0.1200 event = FootstepRunSoundEffect}
        {time = 0.4600 event = FootstepRunSoundEffect}
    ]
    Ped_M_Run2 = [
        {time = 0.05000 event = FootstepRunSoundEffect}
        {time = 0.3800 event = FootstepRunSoundEffect}
    ]
    Ped_M_Walk1 = [
        {time = 0.01000 event = FootstepWalkSoundEffect}
        {time = 0.5300 event = FootstepWalkSoundEffect}
    ]
    Ped_F_Walk = [
        {time = 0.01000 event = FootstepWalkSoundEffect}
        {time = 0.6200 event = FootstepWalkSoundEffect}
    ]
    Ped_f_Walk2 = [
        {time = 0.01000 event = FootstepWalkSoundEffect}
        {time = 0.6200 event = FootstepWalkSoundEffect}
    ]
    Ped_f_Walk2toidle1 = [
        {time = 0.01000 event = FootstepWalkSoundEffect}
    ]
    Ped_f_Walk3 = [
        {time = 0.01000 event = FootstepWalkSoundEffect}
        {time = 0.7000 event = FootstepWalkSoundEffect}
    ]
    Ped_f_Walk3toidle1 = [
        {time = 0.01000 event = FootstepWalkSoundEffect}
    ]
    Ped_f_Walk4 = [
        {time = 0.01000 event = FootstepWalkSoundEffect}
        {time = 0.4300 event = FootstepWalkSoundEffect}
    ]
    Ped_f_Walk4toidle1 = [
        {time = 0.01000 event = FootstepWalkSoundEffect}
    ]
    Ped_F_WalkingWave = [
        {time = 0.01000 event = FootstepWalkSoundEffect}
        {time = 0.6200 event = FootstepWalkSoundEffect}
    ]
    Ped_M_Walk3 = [
        {time = 0.08000 event = FootstepWalkSoundEffect}
        {time = 0.5500 event = FootstepWalkSoundEffect}
    ]
    Ped_M_Walk4 = [
        {time = 0.05000 event = FootstepWalkSoundEffect}
        {time = 0.4000 event = FootstepWalkSoundEffect}
    ]
    Ped_M_WalkCool = [
        {time = 0.01000 event = FootstepWalkSoundEffect}
        {time = 0.8000 event = FootstepWalkSoundEffect}
    ]
    Ped_M_WalkTired = [
        {time = 0.01000 event = FootstepWalkSoundEffect}
        {time = 0.8000 event = FootstepWalkSoundEffect}
    ]
    Ped_M_Walk1ToIdle = [
        {time = 0.4000 event = FootstepScuffSoundEffect}
    ]
    Ped_F_WalkToIdle1 = [
        {time = 0.01000 event = FootstepWalkSoundEffect}
        {time = 0.6000 event = FootstepScuffSoundEffect}
    ]
    Ped_f_WalktoIdle2 = [
        {time = 0.01000 event = FootstepWalkSoundEffect}
    ]
    Ped_M_Walk2 = [
        {time = 0.01000 event = FootstepWalkSoundEffect}
        {time = 0.5300 event = FootstepWalkSoundEffect}
    ]
    Ped_M_Walk2ToIdle = [
        {time = 0.4000 event = FootstepScuffSoundEffect}
    ]
    Ped_M_Run1ToIdle = [
        {time = 0.3000 event = FootstepScuffSoundEffect}
    ]
}
DogAnimEventTable = {
    run = [
        {time = 0.1000 event = BullGallopSounds}
    ]
    BarkIdle = [
        {time = 0.02000 event = DogBarkStream}
    ]
    LiftLeg = [
        {time = 0.02000 event = print params = { string = 'Dog Lift Leg' }}
    ]
}
ActualSkaterAnimHandlerExceptionTable = [
    {event Ex = PedHitDrum scr = HandlePedHitDrum}
    {event Ex = SoundEffect scr = HandleSoundEffectEvent}
    {event Ex = FootstepWalkSoundEffect scr = HandleFootstepWalkSoundEffectEvent}
    {event Ex = FootstepRunSoundEffect scr = HandleFootstepRunSoundEffectEvent}
    {event Ex = FootstepScuffSoundEffect scr = HandleFootstepScuffSoundEffect}
    {event Ex = FootstepJumpSoundEffect scr = HandleFootstepJumpSoundEffect}
    {event Ex = FootstepLandSoundEffect scr = HandleFootstepLandSoundEffect}
    {event Ex = BailBodyFallSoundEffect scr = HandleBailBodyFallSoundEffect}
    {event Ex = BailBodyPunchSoundEffect scr = HandleBailBodyPunchSoundEffect}
    {event Ex = BailCrackSoundEffect scr = HandleBailCrackSoundEffect}
    {event Ex = BailSlapSoundEffect scr = HandleBailSlapSoundEffect}
    {event Ex = BailScrapeSoundEffect scr = HandleBailScrapeSoundEffect}
    {event Ex = BailBoardSoundEffect scr = HandleBailBoardSoundEffect}
    {event Ex = BailHitGroundSoundEffect scr = HandleHitGroundSoundEffect}
    {event Ex = TerrainLandSound scr = HandleTerrainLandSound}
    {event Ex = TerrainBonkSound scr = HandleTerrainBonkSound}
    {event Ex = TurnOnSkaterLoopingSound scr = HandleTurnOnSkaterLoopingSound}
    {event Ex = TurnOffSkaterLoopingSound scr = HandleTurnOffSkaterLoopingSound}
    {event Ex = CatchBoardSound scr = HandleCatchBoardSound}
    {event Ex = BoardScrapeSound scr = HandleBoardScrapeSound}
    {event Ex = BoardSplitSound scr = HandleBoardSplitSound}
    {event Ex = BoardFlyInSound scr = HandleBoardFlyInSound}
    {event Ex = BoardRollingSound scr = HandleBoardRollingSound}
    {event Ex = DiscusWhooshSound scr = HandleDiscusWhooshSound}
    {event Ex = ThrowObject scr = ThrowObjectScript}
    {event Ex = KickBoard scr = HandleKickBoardSound}
    {event Ex = StopAStream scr = HandleStoppingAStream}
    {event Ex = GenericParticles scr = Emit_SpecialTrickParticles}
    {event Ex = DoSprayPaint scr = HandleSkaterSprayPaint}
    {event Ex = SlapVertSticker scr = HandleVertSticker}
    {event Ex = DoLightning scr = HandleLightning}
    {event Ex = DoShrekBurp scr = HandleShrekBurp}
    {event Ex = DoVehicleGrind scr = handleVehiclegrind}
    {event Ex = DoFartBurst scr = HandleFartBurst}
    {event Ex = DoCanFlame scr = HandleCanFlameOn}
    {event Ex = DoCanFlameOff scr = HandleCanFlameOff}
    {event Ex = DoVortex scr = HandleVortex}
    {event Ex = DoDoubleCanOn scr = HandleDoubleCanOn}
    {event Ex = DoDoubleCanOff scr = HandleDoubleCanOff}
    {event Ex = DoHoagieOn scr = HandleHoagieOn}
    {event Ex = DoHoagieOff scr = HandleHoagieOff}
    {event Ex = DoTiresOn scr = HandleTiresOn}
    {event Ex = FootstepParticlesR scr = SkaterParticles_OnRightFootstep}
    {event Ex = FootstepParticlesL scr = SkaterParticles_OnLeftFootstep}
]
ActualPedAnimHandlerExceptionTable = [
    {event Ex = PedHitDrum scr = HandlePedHitDrum}
    {event Ex = print scr = HandlePrintEvent}
    {event Ex = PedObjPlayStream scr = HandlePedObjPlayStream}
    {event Ex = DogBarkStream scr = HandleDogBarkStream}
    {event Ex = BullGallopSounds scr = HandleBullGallopSounds}
    {event Ex = FootstepWalkSoundEffect scr = HandlePedFootstepWalkSoundEffectEvent}
    {event Ex = FootstepRunSoundEffect scr = HandlePedFootstepRunSoundEffectEvent}
    {event Ex = FootstepScuffSoundEffect scr = HandlePedFootstepScuffSoundEffect}
    {event Ex = FootstepJumpSoundEffect scr = HandlePedFootstepJumpSoundEffect}
    {event Ex = FootstepLandSoundEffect scr = HandlePedFootstepLandSoundEffect}
    {event Ex = BailBodyFallSoundEffect scr = HandlePedBailBodyFallSoundEffect}
    {event Ex = BailBodyPunchSoundEffect scr = HandlePedBailBodyPunchSoundEffect}
    {event Ex = BailCrackSoundEffect scr = HandlePedBailCrackSoundEffect}
    {event Ex = BailSlapSoundEffect scr = HandlePedBailSlapSoundEffect}
    {event Ex = BailScrapeSoundEffect scr = HandlePedBailScrapeSoundEffect}
    {event Ex = BailBoardSoundEffect scr = HandlePedBailBoardSoundEffect}
    {event Ex = DoSprayPaint scr = HandlePedSprayPaint}
]

script set_skater_anim_handlers 
    ResetEventHandlersFromTable ActualSkaterAnimHandlerExceptionTable group = anim
endscript


script set_ped_anim_handlers 
    ResetEventHandlersFromTable ActualPedAnimHandlerExceptionTable group = anim
endscript


script set_viewerobj_anim_handlers 
    set_skater_anim_handlers
    set_ped_anim_handlers
endscript


script HandlePedHitBassDrumBeats 
    wait 0.2820 seconds
    obj_playsound SK6_BO_RevolutionaryDrum01 dropoff = 100 vol = (60 + randomrange (0.10000000149011612, 4.0))pitch = (30 + randomrange (0.10000000149011612, 3.0))
    wait 0.5640 seconds
    obj_playsound SK6_BO_RevolutionaryDrum01 dropoff = 100 vol = (60 + randomrange (0.10000000149011612, 4.0))pitch = (30 + randomrange (0.10000000149011612, 3.0))
endscript


script HandlePedHitSnareDrumBeats 
    switch DrumPartialNumber
        case 1
        obj_playsound SK6_BO_RevolutionaryDrum01 vol = (<DefaultVol> + randomrange (0.10000000149011612, 4.0))pitch = (<DefaultPitch> + randomrange (0.10000000149011612, 3.0))
        wait 0.2820 seconds
        obj_playsound SK6_BO_RevolutionaryDrum01 vol = (<AccentV> + randomrange (0.10000000149011612, 4.0))pitch = (<DefaultPitch> + randomrange (0.10000000149011612, 3.0))
        wait 0.1410 seconds
        obj_playsound SK6_BO_RevolutionaryDrum01 vol = (<DefaultVol> + randomrange (0.10000000149011612, 4.0))pitch = (<DefaultPitch> + randomrange (0.10000000149011612, 3.0))
        wait 0.1410 seconds
        obj_playsound SK6_BO_RevolutionaryDrum01 vol = (<DefaultVol> + randomrange (0.10000000149011612, 4.0))pitch = (<DefaultPitch> + randomrange (0.10000000149011612, 3.0))
        case 2
        obj_playsound SK6_BO_RevolutionaryDrum01 vol = (<AccentV> + randomrange (0.10000000149011612, 4.0))pitch = (<DefaultPitch> + randomrange (0.10000000149011612, 3.0))
        wait 0.1410 seconds
        obj_playsound SK6_BO_RevolutionaryDrum01 vol = (<DefaultVol> + randomrange (0.10000000149011612, 4.0))pitch = (<DefaultPitch> + randomrange (0.10000000149011612, 3.0))
        wait 0.1410 seconds
        obj_playsound SK6_BO_RevolutionaryDrum01 vol = (<DefaultVol> + randomrange (0.10000000149011612, 4.0))pitch = (<DefaultPitch> + randomrange (0.10000000149011612, 3.0))
        wait 0.2820 seconds
        obj_playsound SK6_BO_RevolutionaryDrum01 vol = (<DefaultVol> + randomrange (0.10000000149011612, 4.0))pitch = (<DefaultPitch> + randomrange (0.10000000149011612, 3.0))
        wait 0.2820 seconds
        obj_playsound SK6_BO_RevolutionaryDrum01 vol = (<DefaultVol> + randomrange (0.10000000149011612, 4.0))pitch = (<DefaultPitch> + randomrange (0.10000000149011612, 3.0))
        case 3
        obj_playsound SK6_BO_RevolutionaryDrum01 vol = (<DefaultVol> + randomrange (0.10000000149011612, 4.0))pitch = (<DefaultPitch> + randomrange (0.10000000149011612, 3.0))
        wait 0.1410 seconds
        obj_playsound SK6_BO_RevolutionaryDrum01 vol = (<DefaultVol> + randomrange (0.10000000149011612, 4.0))pitch = (<DefaultPitch> + randomrange (0.10000000149011612, 3.0))
        wait 0.1410 seconds
        obj_playsound SK6_BO_RevolutionaryDrum01 vol = (<DefaultVol> + randomrange (0.10000000149011612, 4.0))pitch = (<DefaultPitch> + randomrange (0.10000000149011612, 3.0))
        wait 0.1410 seconds
        obj_playsound SK6_BO_RevolutionaryDrum01 vol = (<AccentV> + randomrange (0.10000000149011612, 4.0))pitch = (<DefaultPitch> + randomrange (0.10000000149011612, 3.0))
        wait 0.1410 seconds
        obj_playsound SK6_BO_RevolutionaryDrum01 vol = (<DefaultVol> + randomrange (0.10000000149011612, 4.0))pitch = (<DefaultPitch> + randomrange (0.10000000149011612, 3.0))
        wait 0.1410 seconds
        obj_playsound SK6_BO_RevolutionaryDrum01 vol = (<DefaultVol> + randomrange (0.10000000149011612, 4.0))pitch = (<DefaultPitch> + randomrange (0.10000000149011612, 3.0))
        wait 0.1410 seconds
        obj_playsound SK6_BO_RevolutionaryDrum01 vol = (<DefaultVol> + randomrange (0.10000000149011612, 4.0))pitch = (<DefaultPitch> + randomrange (0.10000000149011612, 3.0))
        case 4
        obj_playsound SK6_BO_RevolutionaryDrum01 vol = (<DefaultVol> + randomrange (0.10000000149011612, 4.0))pitch = (<DefaultPitch> + randomrange (0.10000000149011612, 3.0))
        wait 0.1410 seconds
        wait 0.1410 seconds
        obj_playsound SK6_BO_RevolutionaryDrum01 vol = (<AccentV> + randomrange (0.10000000149011612, 4.0))pitch = (<DefaultPitch> + randomrange (0.10000000149011612, 3.0))
        wait 0.1410 seconds
        obj_playsound SK6_BO_RevolutionaryDrum01 vol = (<DefaultVol> + randomrange (0.10000000149011612, 4.0))pitch = (<DefaultPitch> + randomrange (0.10000000149011612, 3.0))
        wait 0.1410 seconds
        obj_playsound SK6_BO_RevolutionaryDrum01 vol = (<DefaultVol> + randomrange (0.10000000149011612, 4.0))pitch = (<DefaultPitch> + randomrange (0.10000000149011612, 3.0))
        wait 0.2820 seconds
        obj_playsound SK6_BO_RevolutionaryDrum01 vol = (<DefaultVol> + randomrange (0.10000000149011612, 4.0))pitch = (<DefaultPitch> + randomrange (0.10000000149011612, 3.0))
        wait 0.1410 seconds
        obj_playsound SK6_BO_RevolutionaryDrum01 vol = (<DefaultVol> + randomrange (0.10000000149011612, 4.0))pitch = (<DefaultPitch> + randomrange (0.10000000149011612, 3.0))
        case 5
        obj_playsound SK6_BO_RevolutionaryDrum01 vol = (<DefaultVol> + randomrange (0.10000000149011612, 4.0))pitch = (<DefaultPitch> + randomrange (0.10000000149011612, 3.0))
        wait 0.1410 seconds
        obj_playsound SK6_BO_RevolutionaryDrum01 vol = (<DefaultVol> + randomrange (0.10000000149011612, 4.0))pitch = (<DefaultPitch> + randomrange (0.10000000149011612, 3.0))
        wait 0.1410 seconds
        obj_playsound SK6_BO_RevolutionaryDrum01 vol = (<AccentV> + randomrange (0.10000000149011612, 4.0))pitch = (<DefaultPitch> + randomrange (0.10000000149011612, 3.0))
        wait 0.1410 seconds
        obj_playsound SK6_BO_RevolutionaryDrum01 vol = (<AccentV> + randomrange (0.10000000149011612, 4.0))pitch = (<DefaultPitch> + randomrange (0.10000000149011612, 3.0))
        wait 0.2820 seconds
        obj_playsound SK6_BO_RevolutionaryDrum01 vol = (<DefaultVol> + randomrange (0.10000000149011612, 4.0))pitch = (<DefaultPitch> + randomrange (0.10000000149011612, 3.0))
        wait 0.1410 seconds
        obj_playsound SK6_BO_RevolutionaryDrum01 vol = (<DefaultVol> + randomrange (0.10000000149011612, 4.0))pitch = (<DefaultPitch> + randomrange (0.10000000149011612, 3.0))
        case 6
        obj_playsound SK6_BO_RevolutionaryDrum01 vol = (<DefaultVol> + randomrange (0.10000000149011612, 4.0))pitch = (<DefaultPitch> + randomrange (0.10000000149011612, 3.0))
        wait 0.2820 seconds
        obj_playsound SK6_BO_RevolutionaryDrum01 vol = (<DefaultVol> + randomrange (0.10000000149011612, 4.0))pitch = (<DefaultPitch> + randomrange (0.10000000149011612, 3.0))
        wait 0.1410 seconds
        obj_playsound SK6_BO_RevolutionaryDrum01 vol = (<AccentV> + randomrange (0.10000000149011612, 4.0))pitch = (<DefaultPitch> + randomrange (0.10000000149011612, 3.0))
        wait 0.2820 seconds
        obj_playsound SK6_BO_RevolutionaryDrum01 vol = (<AccentV> + randomrange (0.10000000149011612, 4.0))pitch = (<DefaultPitch> + randomrange (0.10000000149011612, 3.0))
        wait 0.1410 seconds
        obj_playsound SK6_BO_RevolutionaryDrum01 vol = (<DefaultVol> + randomrange (0.10000000149011612, 4.0))pitch = (<DefaultPitch> + randomrange (0.10000000149011612, 3.0))
        case 7
        obj_playsound SK6_BO_RevolutionaryDrum01 vol = (<DefaultVol> + randomrange (0.10000000149011612, 4.0))pitch = (<DefaultPitch> + randomrange (0.10000000149011612, 3.0))
        wait 0.1410 seconds
        obj_playsound SK6_BO_RevolutionaryDrum01 vol = (<DefaultVol> + randomrange (0.10000000149011612, 4.0))pitch = (<DefaultPitch> + randomrange (0.10000000149011612, 3.0))
        wait 0.1410 seconds
        obj_playsound SK6_BO_RevolutionaryDrum01 vol = (<AccentV> + randomrange (0.10000000149011612, 4.0))pitch = (<DefaultPitch> + randomrange (0.10000000149011612, 3.0))
        wait 0.5670 seconds
        obj_playsound SK6_BO_RevolutionaryDrum01 vol = (<AccentV> + randomrange (0.10000000149011612, 4.0))pitch = (<DefaultPitch> + randomrange (0.10000000149011612, 3.0))
        case 8
        obj_playsound SK6_BO_RevolutionaryDrum01 vol = (<AccentV> + randomrange (0.10000000149011612, 4.0))pitch = (<DefaultPitch> + randomrange (0.10000000149011612, 3.0))
        wait 0.2820 seconds
        obj_playsound SK6_BO_RevolutionaryDrum01 vol = (<DefaultVol> + randomrange (0.10000000149011612, 4.0))pitch = (<DefaultPitch> + randomrange (0.10000000149011612, 3.0))
        wait 0.2820 seconds
        obj_playsound SK6_BO_RevolutionaryDrum01 vol = (<AccentV> + randomrange (0.10000000149011612, 4.0))pitch = (<DefaultPitch> + randomrange (0.10000000149011612, 3.0))
        wait 0.2820 seconds
        obj_playsound SK6_BO_RevolutionaryDrum01 vol = (<DefaultVol> + randomrange (0.10000000149011612, 4.0))pitch = (<DefaultPitch> + randomrange (0.10000000149011612, 3.0))
        case 9
        obj_playsound SK6_BO_RevolutionaryDrum01 vol = (<DefaultVol> + randomrange (0.10000000149011612, 4.0))pitch = (<DefaultPitch> + randomrange (0.10000000149011612, 3.0))
        wait 0.2830 seconds
        obj_playsound SK6_BO_RevolutionaryDrum01 vol = (<DefaultVol> + randomrange (0.10000000149011612, 4.0))pitch = (<DefaultPitch> + randomrange (0.10000000149011612, 3.0))
        wait 0.2830 seconds
        obj_playsound SK6_BO_RevolutionaryDrum01 vol = (<AccentV> + randomrange (0.10000000149011612, 4.0))pitch = (<DefaultPitch> + randomrange (0.10000000149011612, 3.0))
        wait 0.1410 seconds
        obj_playsound SK6_BO_RevolutionaryDrum01 vol = (<DefaultVol> + randomrange (0.10000000149011612, 4.0))pitch = (<DefaultPitch> + randomrange (0.10000000149011612, 3.0))
        wait 0.1410 seconds
        obj_playsound SK6_BO_RevolutionaryDrum01 vol = (<DefaultVol> + randomrange (0.10000000149011612, 4.0))pitch = (<DefaultPitch> + randomrange (0.10000000149011612, 3.0))
        case 10
        obj_playsound SK6_BO_RevolutionaryDrum01 vol = (<DefaultVol> + randomrange (0.10000000149011612, 4.0))pitch = (<DefaultPitch> + randomrange (0.10000000149011612, 3.0))
        wait 0.2830 seconds
        obj_playsound SK6_BO_RevolutionaryDrum01 vol = (<AccentV> + randomrange (0.10000000149011612, 4.0))pitch = (<DefaultPitch> + randomrange (0.10000000149011612, 3.0))
        wait 0.2830 seconds
        obj_playsound SK6_BO_RevolutionaryDrum01 vol = (<DefaultVol> + randomrange (0.10000000149011612, 4.0))pitch = (<DefaultPitch> + randomrange (0.10000000149011612, 3.0))
        wait 0.2830 seconds
        obj_playsound SK6_BO_RevolutionaryDrum01 vol = (<AccentV> + randomrange (0.10000000149011612, 4.0))pitch = (<DefaultPitch> + randomrange (0.10000000149011612, 3.0))
        case 11
        obj_playsound SK6_BO_RevolutionaryDrum01 vol = (<DefaultVol> + randomrange (0.10000000149011612, 4.0))pitch = (<DefaultPitch> + randomrange (0.10000000149011612, 3.0))
        wait 0.2820 seconds
        obj_playsound SK6_BO_RevolutionaryDrum01 vol = (<DefaultVol> + randomrange (0.10000000149011612, 4.0))pitch = (<DefaultPitch> + randomrange (0.10000000149011612, 3.0))
        wait 0.1410 seconds
        obj_playsound SK6_BO_RevolutionaryDrum01 vol = (<AccentV> + randomrange (0.10000000149011612, 4.0))pitch = (<DefaultPitch> + randomrange (0.10000000149011612, 3.0))
        wait 0.2820 seconds
        obj_playsound SK6_BO_RevolutionaryDrum01 vol = (<DefaultVol> + randomrange (0.10000000149011612, 4.0))pitch = (<DefaultPitch> + randomrange (0.10000000149011612, 3.0))
        wait 0.1410 seconds
        obj_playsound SK6_BO_RevolutionaryDrum01 vol = (<AccentV> + randomrange (0.10000000149011612, 4.0))pitch = (<DefaultPitch> + randomrange (0.10000000149011612, 3.0))
        case 12
        obj_playsound SK6_BO_RevolutionaryDrum01 vol = (<AccentV> + randomrange (0.10000000149011612, 4.0))pitch = (<DefaultPitch> + randomrange (0.10000000149011612, 3.0))
        wait 0.5640 seconds
        obj_playsound SK6_BO_RevolutionaryDrum01 vol = (<DefaultVol> + randomrange (0.10000000149011612, 4.0))pitch = (<DefaultPitch> + randomrange (0.10000000149011612, 3.0))
        wait 0.1410 seconds
        obj_playsound SK6_BO_RevolutionaryDrum01 vol = (<DefaultVol> + randomrange (0.10000000149011612, 4.0))pitch = (<DefaultPitch> + randomrange (0.10000000149011612, 3.0))
        wait 0.1410 seconds
        case 13
        obj_playsound SK6_BO_RevolutionaryDrum01 vol = (<DefaultVol> + randomrange (0.10000000149011612, 4.0))pitch = (<DefaultPitch> + randomrange (0.10000000149011612, 3.0))
        wait 0.2820 seconds
        obj_playsound SK6_BO_RevolutionaryDrum01 vol = (<AccentV> + randomrange (0.10000000149011612, 4.0))pitch = (<DefaultPitch> + randomrange (0.10000000149011612, 3.0))
        wait 0.5640 seconds
        obj_playsound SK6_BO_RevolutionaryDrum01 vol = (<DefaultVol> + randomrange (0.10000000149011612, 4.0))pitch = (<DefaultPitch> + randomrange (0.10000000149011612, 3.0))
        case 14
        obj_playsound SK6_BO_RevolutionaryDrum01 vol = (<DefaultVol> + randomrange (0.10000000149011612, 4.0))pitch = (<DefaultPitch> + randomrange (0.10000000149011612, 3.0))
        wait 0.2820 seconds
        obj_playsound SK6_BO_RevolutionaryDrum01 vol = (<AccentV> + randomrange (0.10000000149011612, 4.0))pitch = (<DefaultPitch> + randomrange (0.10000000149011612, 3.0))
        wait 0.4230 seconds
        obj_playsound SK6_BO_RevolutionaryDrum01 vol = (<AccentV> + randomrange (0.10000000149011612, 4.0))pitch = (<DefaultPitch> + randomrange (0.10000000149011612, 3.0))
        wait 0.1410 seconds
        obj_playsound SK6_BO_RevolutionaryDrum01 vol = (<DefaultVol> + randomrange (0.10000000149011612, 4.0))pitch = (<DefaultPitch> + randomrange (0.10000000149011612, 3.0))
        case 15
        obj_playsound SK6_BO_RevolutionaryDrum01 vol = (<DefaultVol> + randomrange (0.10000000149011612, 4.0))pitch = (<DefaultPitch> + randomrange (0.10000000149011612, 3.0))
        wait 0.2820 seconds
        obj_playsound SK6_BO_RevolutionaryDrum01 vol = (<DefaultVol> + randomrange (0.10000000149011612, 4.0))pitch = (<DefaultPitch> + randomrange (0.10000000149011612, 3.0))
        wait 0.1410 seconds
        obj_playsound SK6_BO_RevolutionaryDrum01 vol = (<AccentV> + randomrange (0.10000000149011612, 4.0))pitch = (<DefaultPitch> + randomrange (0.10000000149011612, 3.0))
        wait 0.2820 seconds
        obj_playsound SK6_BO_RevolutionaryDrum01 vol = (<DefaultVol> + randomrange (0.10000000149011612, 4.0))pitch = (<DefaultPitch> + randomrange (0.10000000149011612, 3.0))
        wait 0.1410 seconds
        obj_playsound SK6_BO_RevolutionaryDrum01 vol = (<DefaultVol> + randomrange (0.10000000149011612, 4.0))pitch = (<DefaultPitch> + randomrange (0.10000000149011612, 3.0))
        wait 0.1410 seconds
        case 16
        obj_playsound SK6_BO_RevolutionaryDrum01 vol = (<DefaultVol> + randomrange (0.10000000149011612, 4.0))pitch = (<DefaultPitch> + randomrange (0.10000000149011612, 3.0))
        wait 0.2820 seconds
        obj_playsound SK6_BO_RevolutionaryDrum01 vol = (<DefaultVol> + randomrange (0.10000000149011612, 4.0))pitch = (<DefaultPitch> + randomrange (0.10000000149011612, 3.0))
        wait 0.2820 seconds
        obj_playsound SK6_BO_RevolutionaryDrum01 vol = (<AccentV> + randomrange (0.10000000149011612, 4.0))pitch = (<DefaultPitch> + randomrange (0.10000000149011612, 3.0))
    endswitch
endscript


script HandlePedHitDrum {DefVol = 75 DefPitch = 100 AccentVol = 150 AccentPitch = 102}
    SpawnSound HandlePedHitBassDrumBeats
    SpawnSound HandlePedHitSnareDrumBeats params = {DefaultVol = <DefVol> DefaultPitch = <DefPitch> AccentV = <AccentVol> AccentP = <AccentPitch>}
endscript


script HandlePrintEvent 
    
endscript


script HandlePedObjPlayStream 
    
endscript


script HandleDogBarkStream 
    if obj_visible
        SpawnSound DogBarkStreamsWaiting
    endif
endscript


script DogBarkStreamsWaiting 
endscript


script HandleBullGallopSounds 
    if (LevelIs load_ba)
        RandomNoRepeat (
            @ obj_playsound SK6_BA_BullGallop01 vol = 80 dropoff = 150
            @ obj_playsound SK6_BA_BullGallop02 vol = 80 dropoff = 150
            @ obj_playsound SK6_BA_BullGallop03 vol = 80 dropoff = 150
            @ obj_playsound SK6_BA_BullGallop04 vol = 80 dropoff = 150
        )
    endif
endscript


script HandleTurnOnSkaterLoopingSound 
    SkaterLoopingSound_TurnOn
endscript


script HandleTurnOffSkaterLoopingSound 
    SkaterLoopingSound_TurnOff
endscript


script HandleBoardFlyInSound 
    obj_spawnscript HandleBoardFlyInSound2
endscript


script HandleBoardFlyInSound2 
    SpawnSound BoardFlyInWaiting
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


script HandleCatchBoardSound { DefVol = 200 }
    obj_playsound SK6_BoardGrab01 vol = <DefVol> pitch = 115
endscript


script HandleKickBoardSound 
    obj_playsound SK6_BoardGrab01 vol = 200 pitch = 80
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
    
    obj_spawnscript HandleBoardScrapeSound2
endscript


script HandleBoardScrapeSound2 
    SpawnSound BoardScrapeWaiting
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
    
    obj_spawnscript HandleBoardRollingSound2
endscript


script HandleBoardRollingSound2 
    SpawnSound BoardRollingInWaiting
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


script HandleDiscusWhooshSound { DefPitch = 60 }
    SpawnSound DiscusWhooshWaiting
endscript


script DiscusWhooshWaiting 
    playsound DE_PauseFlyIn pitch = <DefPitch>
endscript


script HandleBoardSplitSound 
    SpawnSound BoardSplittingWaiting
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


script HandleSoundEffectEvent {DefVol = 100 DefPitch = 100}
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
    if (LevelIs load_au)
        if ((SFX_FootStepWalk01)= AU_SANDSTEP01)
            SpawnSound SFX_HandleLandOnSand
        else
            obj_playsound LandStepConc02_11 pitch = randomrange (97.0, 102.0) vol = randomrange (105.0, 120.0)
        endif
    endif
    SkaterParticles_CreateStepGfx
endscript


script HandlePedFootstepLandSoundEffect 
    obj_playsound LandStepConc02_11 pitch = randomrange (97.0, 102.0) vol = randomrange (30.0, 40.0)
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
        @ obj_playsound BailSlap01 pitch = randomrange (95.0, 115.0) vol = randomrange (140.0, 150.0)
        @ obj_playsound BailSlap02 pitch = randomrange (95.0, 115.0) vol = randomrange (140.0, 150.0)
        @ obj_playsound BailSlap03 pitch = randomrange (95.0, 115.0) vol = randomrange (140.0, 150.0)
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
    RandomNoRepeat (
        @ obj_playsound BailBoard01 pitch = randomrange (100.0, 102.0) vol = randomrange (115.0, 125.0)
        @ obj_playsound BailBoard02 pitch = randomrange (100.0, 102.0) vol = randomrange (115.0, 125.0)
        @ obj_playsound BailBoard03 pitch = randomrange (100.0, 102.0) vol = randomrange (115.0, 125.0)
        @ obj_playsound BailBoard04 pitch = randomrange (100.0, 102.0) vol = randomrange (115.0, 125.0)
        @ obj_playsound BailBoard05 pitch = randomrange (100.0, 102.0) vol = randomrange (115.0, 125.0)
    )
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
    if GotParam on
        if Flipped
            SprayPaintOn bone = Bone_Palm_L
        else
            SprayPaintOn bone = Bone_Palm_R
        endif
    endif
    if GotParam Off
        SprayPaintOff
    endif
    if GotParam splat
        TagNow
    endif
endscript


script HandleVertSticker 
    VertStickerSlap
endscript


script HandlePedSprayPaint 
    if GotParam on
        SprayPaintOn bone = Bone_Palm_R
    endif
    if GotParam Off
        SprayPaintOff
    endif
endscript


script HandleLightning r = 200 g = 200 b = 255
    
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
    obj_spawnscript HandleLightning_cleanup
endscript


script HandleLightning_cleanup 
    wait 1 seconds
    Vibrate_Controller_Safe actuator = 1 percent = 0
endscript


script HandleShrekBurp 
    obj_stopstream ShrekBurpStream
    obj_playstream Burp01 vol = 150 priority = StreamPriorityHigh id = ShrekBurpStream
    DestroyFlexibleParticleSystem name = ShrekBurpPart
    CreateFlexibleParticleSystem name = ShrekBurpPart params_script = JEG_ShrekBurp_particle_params
    ShakeCamera {
        duration = 1.0
        vert_amp = 2.500
        horiz_amp = 1.0
        vert_vel = 7
        horiz_vel = 5
    }
    obj_spawnscript HandleShrekBurp_cleanup
    Vibrate_Controller_Safe actuator = 1 percent = 55
endscript


script HandleShrekBurp_cleanup 
    wait 0.2000 seconds
    Vibrate_Controller_Safe actuator = 1 percent = 0
endscript


script handleVehiclegrind 
    
    CreateFlexibleParticleSystem name = VehSparks01 params_script = APM_VEH_SPARKS01_particle_params
    obj_spawnscript handleVehiclegrind_cleanup
endscript


script handleVehiclegrind_cleanup 
    gettags
    begin 
    if NOT animequals <grind_init_anim>
        if NOT animequals <grind_idle_anim>
            break 
        endif
    endif
    wait 1 gameframe
    repeat 
    DestroyFlexibleParticleSystem name = VehSparks01
endscript


script HandleFartBurst 
    
    playsound FlamingFireBall01 vol = 150
    obj_spawnscript HandleFartBurst_cleanup
    Vibrate_Controller_Safe actuator = 0 percent = 65
    DestroyFlexibleParticleSystem name = FartBurstParticle
    CreateFlexibleParticleSystem name = FartBurstParticle params_script = JEG_FartBurst_particle_params
    broadcastevent type = AU_Beaver_Blast
endscript


script HandleFartBurst_cleanup 
    begin 
    if NOT InAir
        break 
    endif
    wait 1 gameframe
    repeat 30
    Vibrate_Controller_Safe actuator = 0 percent = 0
endscript


script HandleCanFlameOn 
    
    if Flipped
        params_script = JEG_CanFlame_particle_params
    else
        params_script = JEG_CanFlame_particle_params2
    endif
    DestroyFlexibleParticleSystem name = CanFlameParticle
    CreateFlexibleParticleSystem name = CanFlameParticle params_script = <params_script>
    obj_spawnscript handleCanFlame_cleanup
endscript


script HandleCanFlameOff 
    
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
    if NOT animequals Special_Muska_Burn_init
        if NOT animequals Special_Muska_Burn_Range
            break 
        endif
    endif
    wait 1 gameframe
    repeat 
    DestroyFlexibleParticleSystem name = CanFlameParticle
endscript


script HandleDoubleCanOn 
    DestroyFlexibleParticleSystem name = Can1Particle
    DestroyFlexibleParticleSystem name = Can2Particle
    
    CreateFlexibleParticleSystem name = Can1Particle params_script = JEG_SprayBlue_particle_params
    CreateFlexibleParticleSystem name = Can2Particle params_script = JEG_SprayRed_particle_params
endscript


script HandleDoubleCanOff 
    
    DestroyFlexibleParticleSystem name = Can1Particle
    DestroyFlexibleParticleSystem name = Can2Particle
endscript


script HandleHoagieOn 
    
    DestroyFlexibleParticleSystem name = HoagieParticle
    CreateFlexibleParticleSystem name = HoagieParticle params_script = JEG_Hoagie_particle_params
endscript


script HandleHoagieOff 
    
    DestroyFlexibleParticleSystem name = HoagieParticle
endscript


script HandleTiresOn 
    
    DestroyFlexibleParticleSystem name = TiresParticle
    CreateFlexibleParticleSystem name = TiresParticle params_script = JEG_TireSmoke_particle_params
endscript


script HandleVortex 
    DestroyFlexibleParticleSystem name = KostonVortex
    CreateFlexibleParticleSystem name = KostonVortex params_script = JEG_Spin_particle_params
endscript


script ThrowObjectScript 
    LaunchDirtyProjectile
endscript



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
        { time = 0.02000 event = FootstepScuffSoundEffect }
    ]
    run = [
        { time = 0.02000 event = FootstepRunSoundEffect }
        { time = 0.02000 event = FootstepParticlesL }
        { time = 0.3500 event = FootstepRunSoundEffect }
        { time = 0.3500 event = FootstepParticlesR }
    ]
    RunToIdle = [
        { time = 0.05000 event = FootstepScuffSoundEffect }
        { time = 0.2500 event = FootstepWalkSoundEffect }
    ]
    runjumpidle = [
        { time = 0.02000 event = FootstepRunSoundEffect }
        { time = 0.3500 event = FootstepRunSoundEffect }
        { time = 0.6600 event = FootstepRunSoundEffect }
    ]
    runjumpland = [
        { time = 0.02000 event = FootstepRunSoundEffect }
        { time = 0.3500 event = FootstepRunSoundEffect }
        { time = 0.6600 event = FootstepRunSoundEffect }
    ]
    BigJumpLandToStand = [
        { time = 0.06000 event = FootstepLandSoundEffect }
        { time = 1.400 event = FootstepScuffSoundEffect }
    ]
    BigJumpLandToWalk = [
        { time = 0.1200 event = FootstepLandSoundEffect }
    ]
    BigJumpLandToRun = [
        { time = 0.06000 event = FootstepLandSoundEffect }
        { time = 0.3000 event = FootstepScuffSoundEffect }
        { time = 0.7000 event = FootstepRunSoundEffect }
    ]
    HangOntoTheTop = [
        { time = 1.100 event = FootstepWalkSoundEffect }
        { time = 1.700 event = FootstepWalkSoundEffect }
        { time = 2.100 event = FootstepScuffSoundEffect }
    ]
    JumpLandToWalk = [
        { time = 0.1200 event = FootstepLandSoundEffect }
    ]
    JumpLandToRun = [
        { time = 0.1200 event = FootstepLandSoundEffect }
    ]
    JumpLandToStand = [
        { time = 0.0 event = FootstepLandSoundEffect }
        { time = 0.5000 event = FootstepScuffSoundEffect }
    ]
    LadderClimb = [
        { time = 0.1700 event = FootstepWalkSoundEffect }
        { time = 0.7000 event = FootstepWalkSoundEffect }
    ]
    LadderFastClimb = [
        { time = 0.1700 event = FootstepWalkSoundEffect }
        { time = 0.7000 event = FootstepWalkSoundEffect }
    ]
    LadderClimbFromStandIdle = [
        { time = 0.02000 event = FootstepScuffSoundEffect }
        { time = 0.5000 event = FootstepWalkSoundEffect }
    ]
    LadderOntoTheTop = [
        { time = 0.3000 event = FootstepWalkSoundEffect }
        { time = 0.8000 event = FootstepWalkSoundEffect }
        { time = 1.400 event = FootstepScuffSoundEffect }
    ]
    runtojump = [
        { time = 0.02000 event = FootstepJumpSoundEffect }
    ]
    StandToHang = [
        { time = 0.3000 event = FootstepScuffSoundEffect }
    ]
    JumpToWallHang = [
        { time = 0.0 event = WhooshSoundEffect }
    ]
    JumpToSwingHang = [
        { time = 0.0 event = WhooshSoundEffect }
    ]
    StandToJump = [
        { time = 0.03000 event = FootstepJumpSoundEffect }
    ]
    NewBrakeTurnLeft = [
        { time = 0.01000 event = FootstepScuffSoundEffect }
    ]
    NewBrakeTurnRight = [
        { time = 0.01000 event = FootstepScuffSoundEffect }
    ]
    _180RunSkid = [
        { time = 0.02000 event = FootstepRunSoundEffect }
        { time = 0.3500 event = FootstepScuffSoundEffect }
        { time = 0.8500 event = FootstepWalkSoundEffect }
    ]
    SkateToStand = [
        {
            time = 0.02000
            event = SoundEffect
            params = { name = FlipTransitionUp01 }
        }
        { time = 0.4200 event = FootstepRunSoundEffect }
        { time = 0.7500 event = FootstepRunSoundEffect }
        { time = 1.300 event = FootstepWalkSoundEffect }
        { time = 1.500 event = FootstepScuffSoundEffect }
    ]
    SkateToWalk = [
        {
            time = 0.02000
            event = SoundEffect
            params = { name = FlipTransitionUp01 }
        }
        { time = 0.4200 event = FootstepRunSoundEffect }
        { time = 0.7500 event = FootstepWalkSoundEffect }
    ]
    SkateToSkid = [
        { time = 0.4000 event = CatchBoardSound }
        { time = 0.5000 event = FootstepRunSoundEffect }
        { time = 0.9000 event = FootstepRunSoundEffect }
        { time = 1.450 event = FootstepWalkSoundEffect }
    ]
    BrakeToStand = [
        { time = 0.4500 event = BoardKickupSoundEffect }
        { time = 0.7000 event = FootstepScuffSoundEffect }
        { time = 1.230 event = FootstepScuffSoundEffect }
    ]
    SlowSkateToStand = [
        {
            time = 0.02000
            event = SoundEffect
            params = { name = FlipTransitionUp01 }
        }
        { time = 0.3000 event = FootstepRunSoundEffect }
        { time = 0.4600 event = CatchBoardSound }
        { time = 0.7000 event = FootstepWalkSoundEffect }
        { time = 1.400 event = FootstepScuffSoundEffect }
    ]
    WalkSlow = [
        { time = 0.3500 event = FootstepWalkSoundEffect }
        { time = 0.3500 event = FootstepParticlesL }
        { time = 0.9000 event = FootstepWalkSoundEffect }
        { time = 0.9000 event = FootstepParticlesR }
    ]
    GrindNBarf_Init = [
        {
            time = 1.0
            event = GenericParticles
            params = { specialtrick_particles = barf_particles bone = Bone_Jaw dont_orient_toskater = 1 StopEmitAt = 0.2000 }
        }
    ]
    PrimoHandStand_Init = [
        {
            time = 0.5000
            event = GenericParticles
            params = { specialtrick_particles = fire_particles bone = Bone_Board_Root }
        }
    ]
    WalkFast = [
        { time = 0.2500 event = FootstepWalkSoundEffect }
        { time = 0.2500 event = FootstepParticlesL }
        { time = 0.6600 event = FootstepWalkSoundEffect }
        { time = 0.6600 event = FootstepParticlesR }
    ]
    FastRun = [
        { time = 0.02000 event = FootstepRunSoundEffect }
        { time = 0.02000 event = FootstepParticlesL }
        { time = 0.3300 event = FootstepRunSoundEffect }
        { time = 0.3300 event = FootstepParticlesR }
    ]
    Wrun = [
        { time = 0.02000 event = FootstepRunSoundEffect }
        { time = 0.02000 event = FootstepParticlesL }
        { time = 0.3500 event = FootstepRunSoundEffect }
        { time = 0.3500 event = FootstepParticlesR }
    ]
    WRunToSkate = [
        { time = 0.02000 event = FootstepRunSoundEffect }
        { time = 0.02000 event = FootstepParticlesL }
        { time = 0.3500 event = FootstepRunSoundEffect }
        { time = 0.3500 event = FootstepParticlesR }
        { time = 0.5200 event = TurnOnSkaterLoopingSound }
        {
            time = 0.5200
            event = SoundEffect
            params = { name = FlipTransitionDown01 }
        }
        {
            time = 0.6400
            event = BoardKickupSoundEffect
            params = { name = FlipTransitionDown01 }
        }
    ]
    WSkateToRun = [
        {
            time = 0.02000
            event = SoundEffect
            params = { name = FlipTransitionUp01 }
        }
        { time = 0.4200 event = FootstepRunSoundEffect }
        { time = 0.4500 event = CatchBoardSound }
        { time = 0.7500 event = FootstepRunSoundEffect }
    ]
    wstandtoidle1 = [
        { time = 0.6000 event = FootstepScuffSoundEffect }
    ]
    wstandtoidle4 = [
        { time = 0.6000 event = FootstepScuffSoundEffect }
        { time = 0.8700 event = FootstepWalkSoundEffect }
        { time = 1.350 event = FootstepScuffSoundEffect }
        { time = 1.700 event = FootstepWalkSoundEffect }
    ]
    wstandtoidle5 = [
        { time = 0.7300 event = FootstepScuffSoundEffect }
        { time = 1.600 event = FootstepWalkSoundEffect }
        { time = 2.050 event = FootstepScuffSoundEffect }
    ]
    WStandToRun = [
        { time = 0.02000 event = FootstepScuffSoundEffect }
    ]
    WStandToWalk = [
        { time = 0.02000 event = FootstepScuffSoundEffect }
    ]
    WWalk = [
        { time = 0.2800 event = FootstepWalkSoundEffect }
        { time = 0.2800 event = FootstepParticlesL }
        { time = 0.8500 event = FootstepWalkSoundEffect }
        { time = 0.8500 event = FootstepParticlesR }
    ]
    WWalkToStand = [
        { time = 0.05000 event = FootstepWalkSoundEffect }
        { time = 0.05000 event = FootstepParticlesL }
        { time = 0.4500 event = FootstepScuffSoundEffect }
    ]
    WWalkUp = [
        { time = 0.4300 event = FootstepWalkSoundEffect }
        { time = 0.4300 event = FootstepParticlesL }
        { time = 0.9500 event = FootstepWalkSoundEffect }
        { time = 0.9500 event = FootstepParticlesR }
    ]
    WWalkDown = [
        { time = 0.4300 event = FootstepWalkSoundEffect }
        { time = 0.4300 event = FootstepParticlesL }
        { time = 0.9500 event = FootstepWalkSoundEffect }
        { time = 0.9500 event = FootstepParticlesR }
    ]
    WRunUp = [
        { time = 0.3000 event = FootstepRunSoundEffect }
        { time = 0.3000 event = FootstepParticlesL }
        { time = 0.6000 event = FootstepRunSoundEffect }
        { time = 0.6000 event = FootstepParticlesR }
    ]
    WRunDown = [
        { time = 0.3000 event = FootstepRunSoundEffect }
        { time = 0.3000 event = FootstepParticlesL }
        { time = 0.6000 event = FootstepRunSoundEffect }
        { time = 0.6000 event = FootstepParticlesR }
    ]
    THPS7_RunBoardSmack = [
        { time = 0.2000 event = FootstepRunSoundEffect }
        { time = 0.2000 event = FootstepParticlesL }
        { time = 0.3000 event = WhooshSoundEffect }
        { time = 0.5100 event = FootstepRunSoundEffect }
        { time = 0.5100 event = FootstepParticlesR }
    ]
    THPS7_StandBoardSmack = [
        { time = 0.3000 event = WhooshSoundEffect }
    ]
    WallPlant_Ollie3 = [
        { time = 0.1700 event = FootstepRunSoundEffect }
    ]
    JumpAirTo5050 = [
        {
            time = 0.2200
            event = SoundEffect
            params = { name = FlipTransitionDown01 }
        }
        { time = 0.3500 event = TerrainLandSound }
        { time = 0.3800 event = TurnOnSkaterLoopingSound }
    ]
    JumpAirToManual = [
        {
            time = 0.3000
            event = SoundEffect
            params = { name = FlipTransitionDown01 }
        }
        { time = 0.3300 event = CatchBoardSound }
        { time = 0.5500 event = TurnOnSkaterLoopingSound }
    ]
    JumpAirToNoseManual = [
        {
            time = 0.3000
            event = SoundEffect
            params = { name = FlipTransitionDown01 }
        }
        { time = 0.3300 event = CatchBoardSound }
        { time = 0.5500 event = TurnOnSkaterLoopingSound }
    ]
    FS_PowerSlide_Init = [
        {
            time = 0.0
            event = SoundEffect
            params = { name = RevertConc DefPitch = 90 }
        }
    ]
    BS_PowerSlide_Init = [
        {
            time = 0.0
            event = SoundEffect
            params = { name = RevertConc DefPitch = 90 }
        }
    ]
    Vault_Roll = [
        { time = 0.0 event = VaultRollSoundEffect }
        { time = 0.0 event = FootstepLandSoundEffect }
        { time = 1.420 event = FootstepWalkSoundEffect }
        { time = 1.760 event = FootstepWalkSoundEffect }
    ]
    Walking_Wallgrab_Shimmy_Left = [
        { time = 0.3500 event = FootstepScuffSoundEffect }
        { time = 0.4000 event = FootstepWalkSoundEffect }
        { time = 0.6600 event = FootstepWalkSoundEffect }
    ]
    Walking_Wallgrab_Shimmy_Right = [
        { time = 0.3500 event = FootstepScuffSoundEffect }
        { time = 0.4000 event = FootstepWalkSoundEffect }
        { time = 0.6600 event = FootstepWalkSoundEffect }
    ]
    Walking_Wallgrab_FromStand = [
        { time = 0.1000 event = GruntSoundEffect }
        { time = 0.6600 event = FootstepScuffSoundEffect }
        { time = 0.6800 event = FootstepWalkSoundEffect }
        { time = 1.130 event = FootstepWalkSoundEffect }
        {
            time = 1.250
            event = CatchBoardSound
            params = { DefVol = 50 }
        }
    ]
    Walking_WallGrab_JumpBack = [
        { time = 0.8300 event = FootstepScuffSoundEffect }
        { time = 0.9000 event = GruntSoundEffect }
    ]
    Walking_WallFlip = [
        { time = 0.01000 event = FootstepScuffSoundEffect }
        { time = 0.05000 event = JumpSoundEffect }
        { time = 0.1600 event = FootstepWalkSoundEffect }
        { time = 0.3000 event = WhooshSoundEffect }
        { time = 0.7800 event = FootstepLandSoundEffect }
    ]
    Walking_wallRunUp = [
        { time = 0.1600 event = FootstepWalkSoundEffect }
        { time = 0.2700 event = FootstepWalkSoundEffect }
        { time = 0.5100 event = FootstepWalkSoundEffect }
    ]
    W_Boardswitch_Standing = [
        { time = 0.2800 event = FastWhooshSoundEffect }
        { time = 0.5200 event = CatchBoardSound }
    ]
    W_Boardswitch_Running = [
        { time = 0.2800 event = FastWhooshSoundEffect }
        { time = 0.2800 event = FootstepRunSoundEffect }
        { time = 0.2800 event = FootstepParticlesL }
        { time = 0.5200 event = CatchBoardSound }
        { time = 0.5200 event = FootstepRunSoundEffect }
        { time = 0.5200 event = FootstepParticlesL }
    ]
    W_BackFlip = [
        { time = 0.1000 event = JumpSoundEffect }
        { time = 0.2000 event = WhooshSoundEffect }
    ]
    W_FrontFlip = [
        { time = 0.1000 event = JumpSoundEffect }
        { time = 0.2000 event = WhooshSoundEffect }
    ]
    RunOutQuick = [
        { time = 0.01000 event = BailBoardSoundEffect }
        { time = 0.3500 event = FootstepRunSoundEffect }
        { time = 0.4500 event = FootstepRunSoundEffect }
        { time = 0.4500 event = FootstepScuffSoundEffect }
        { time = 1.150 event = FootstepWalkSoundEffect }
        { time = 1.600 event = FootstepWalkSoundEffect }
        { time = 2.0 event = FootstepWalkSoundEffect }
    ]
    Bail_Falling_BCK = [
        { time = 0.01000 event = BailBoardSoundEffect }
    ]
    Bail_Falling_FWD = [
        { time = 0.01000 event = BailBoardSoundEffect }
    ]
    Bail_Falling_Hit_Hard = [
        { time = 0.01000 event = BailBodyPunchSoundEffect }
        { time = 0.01000 event = BailBodyFallSoundEffect }
        { time = 0.03000 event = BailSlapSoundEffect }
        { time = 0.5500 event = BailSlapSoundEffect }
        { time = 0.5500 event = BailBodyFallSoundEffect }
        { time = 0.7500 event = BailBodyFallSoundEffect }
    ]
    Bail_Falling_Hit_Hard_BCK = [
        { time = 0.01000 event = BailBodyPunchSoundEffect }
        { time = 0.01000 event = BailBodyFallSoundEffect }
        { time = 0.03000 event = BailSlapSoundEffect }
        { time = 0.5500 event = BailSlapSoundEffect }
        { time = 0.5500 event = BailBodyFallSoundEffect }
        { time = 0.7500 event = BailBodyFallSoundEffect }
    ]
    Bail_Falling_Hit_Hard_FWD = [
        { time = 0.01000 event = BailBodyPunchSoundEffect }
        { time = 0.01000 event = BailBodyFallSoundEffect }
        { time = 0.03000 event = BailSlapSoundEffect }
        { time = 0.5500 event = BailSlapSoundEffect }
        { time = 0.5500 event = BailBodyFallSoundEffect }
        { time = 0.7500 event = BailBodyFallSoundEffect }
    ]
    Bail_Falling_Hit_Med = [
        { time = 0.01000 event = BailBodyPunchSoundEffect }
        { time = 0.01000 event = BailBodyFallSoundEffect }
        { time = 0.03000 event = BailSlapSoundEffect }
        { time = 0.5000 event = BailBodyFallSoundEffect }
        { time = 0.6700 event = BailBodyFallSoundEffect }
    ]
    Bail_Falling_Hit_Med_BCK = [
        { time = 0.01000 event = BailBodyPunchSoundEffect }
        { time = 0.01000 event = BailBodyFallSoundEffect }
        { time = 0.03000 event = BailSlapSoundEffect }
        { time = 0.5000 event = BailBodyFallSoundEffect }
        { time = 0.6700 event = BailBodyFallSoundEffect }
    ]
    Bail_Falling_Hit_Med_FWD = [
        { time = 0.01000 event = BailBodyPunchSoundEffect }
        { time = 0.01000 event = BailBodyFallSoundEffect }
        { time = 0.03000 event = BailSlapSoundEffect }
        { time = 0.5000 event = BailBodyFallSoundEffect }
        { time = 0.6700 event = BailBodyFallSoundEffect }
    ]
    Bail_Falling_LT = [
        { time = 0.01000 event = BailBoardSoundEffect }
    ]
    Bail_Falling_RT = [
        { time = 0.01000 event = BailBoardSoundEffect }
    ]
    Bail_Falling_Slide_HitH_LTb = [
        { time = 0.01000 event = BailBodyPunchSoundEffect }
        { time = 0.01000 event = BailBodyFallSoundEffect }
        { time = 0.03000 event = BailSlapSoundEffect }
        { time = 0.5500 event = BailSlapSoundEffect }
        { time = 0.5500 event = BailBodyFallSoundEffect }
        { time = 0.7500 event = BailBodyFallSoundEffect }
    ]
    Bail_Falling_Slide_HitH_LTf = [
        { time = 0.01000 event = BailBodyPunchSoundEffect }
        { time = 0.01000 event = BailBodyFallSoundEffect }
        { time = 0.03000 event = BailSlapSoundEffect }
        { time = 0.5500 event = BailSlapSoundEffect }
        { time = 0.5500 event = BailBodyFallSoundEffect }
        { time = 0.7500 event = BailBodyFallSoundEffect }
    ]
    Bail_Falling_Slide_HitH_RTb = [
        { time = 0.01000 event = BailBodyPunchSoundEffect }
        { time = 0.01000 event = BailBodyFallSoundEffect }
        { time = 0.03000 event = BailSlapSoundEffect }
        { time = 0.5500 event = BailSlapSoundEffect }
        { time = 0.5500 event = BailBodyFallSoundEffect }
        { time = 0.7500 event = BailBodyFallSoundEffect }
    ]
    Bail_Falling_Slide_HitH_RTf = [
        { time = 0.01000 event = BailBodyPunchSoundEffect }
        { time = 0.01000 event = BailBodyFallSoundEffect }
        { time = 0.03000 event = BailSlapSoundEffect }
        { time = 0.5500 event = BailSlapSoundEffect }
        { time = 0.5500 event = BailBodyFallSoundEffect }
        { time = 0.7500 event = BailBodyFallSoundEffect }
    ]
    Bail_Falling_Slide_HitM_LTb = [
        { time = 0.01000 event = BailBodyPunchSoundEffect }
        { time = 0.01000 event = BailBodyFallSoundEffect }
        { time = 0.03000 event = BailSlapSoundEffect }
        { time = 0.5000 event = BailBodyFallSoundEffect }
        { time = 0.6700 event = BailBodyFallSoundEffect }
    ]
    Bail_Falling_Slide_HitM_LTf = [
        { time = 0.01000 event = BailBodyPunchSoundEffect }
        { time = 0.01000 event = BailBodyFallSoundEffect }
        { time = 0.03000 event = BailSlapSoundEffect }
        { time = 0.5000 event = BailBodyFallSoundEffect }
        { time = 0.6700 event = BailBodyFallSoundEffect }
    ]
    Bail_Falling_Slide_HitM_RTb = [
        { time = 0.01000 event = BailBodyPunchSoundEffect }
        { time = 0.01000 event = BailBodyFallSoundEffect }
        { time = 0.03000 event = BailSlapSoundEffect }
        { time = 0.5000 event = BailBodyFallSoundEffect }
        { time = 0.6700 event = BailBodyFallSoundEffect }
    ]
    Bail_Falling_Slide_HitM_RTf = [
        { time = 0.01000 event = BailBodyPunchSoundEffect }
        { time = 0.01000 event = BailBodyFallSoundEffect }
        { time = 0.03000 event = BailSlapSoundEffect }
        { time = 0.5000 event = BailBodyFallSoundEffect }
        { time = 0.6700 event = BailBodyFallSoundEffect }
    ]
    Bail_Falling_Slide_LTb = [
        { time = 0.01000 event = BailBoardSoundEffect }
    ]
    Bail_Falling_Slide_LTf = [
        { time = 0.01000 event = BailBoardSoundEffect }
    ]
    Bail_Falling_Slide_RTb = [
        { time = 0.01000 event = BailBoardSoundEffect }
    ]
    Bail_Falling_Slide_RTf = [
        { time = 0.01000 event = BailBoardSoundEffect }
    ]
    Bail_Falling_Slide_BCK = [
        { time = 0.01000 event = BailBoardSoundEffect }
    ]
    Bail_Falling_Slide_HitM_BCK = [
        { time = 0.01000 event = BailBodyPunchSoundEffect }
        { time = 0.01000 event = BailBodyFallSoundEffect }
        { time = 0.03000 event = BailSlapSoundEffect }
        { time = 0.5000 event = BailBodyFallSoundEffect }
        { time = 0.6700 event = BailBodyFallSoundEffect }
    ]
    Bail_Falling_Slide_HitH_BCK = [
        { time = 0.01000 event = BailBodyPunchSoundEffect }
        { time = 0.01000 event = BailBodyFallSoundEffect }
        { time = 0.03000 event = BailSlapSoundEffect }
        { time = 0.5500 event = BailSlapSoundEffect }
        { time = 0.5500 event = BailBodyFallSoundEffect }
        { time = 0.7500 event = BailBodyFallSoundEffect }
    ]
    GetUp_HK_Ft = [
        { time = 0.3000 event = FootstepWalkSoundEffect }
        { time = 0.3000 event = FootstepScuffSoundEffect }
        { time = 0.7300 event = FootstepWalkSoundEffect }
    ]
    GetUp_HK_Ft_Q = [
        { time = 0.4500 event = FootstepWalkSoundEffect }
        { time = 0.4500 event = FootstepScuffSoundEffect }
    ]
    GetUp_Sit_Ft = [
        { time = 0.4800 event = FootstepWalkSoundEffect }
        { time = 0.4800 event = FootstepScuffSoundEffect }
        { time = 0.8000 event = FootstepWalkSoundEffect }
    ]
    GetUp_Sit_Ft_T = [
        {
            time = 0.2500
            event = CatchBoardSound
            params = { DefVol = 50 }
        }
        { time = 0.4800 event = FootstepWalkSoundEffect }
        { time = 0.4800 event = FootstepScuffSoundEffect }
        { time = 0.7500 event = FootstepWalkSoundEffect }
    ]
    GetUp_Sit_Ft_Q = [
        { time = 0.5200 event = FootstepWalkSoundEffect }
        { time = 0.5200 event = FootstepScuffSoundEffect }
        { time = 0.7500 event = FootstepWalkSoundEffect }
        { time = 1.0 event = FootstepRunSoundEffect }
    ]
    GetUp_HK_Lt = [
        { time = 0.6000 event = FootstepRunSoundEffect }
        { time = 0.08000 event = FootstepScuffSoundEffect }
    ]
    GetUp_HK_Lt_T = [
        {
            time = 0.01000
            event = CatchBoardSound
            params = { DefVol = 50 }
        }
        { time = 0.4000 event = FootstepRunSoundEffect }
        { time = 0.4000 event = FootstepScuffSoundEffect }
        { time = 0.7000 event = FootstepRunSoundEffect }
    ]
    GetUp_HK_Lt_Q = [
        { time = 0.2000 event = FootstepRunSoundEffect }
        { time = 0.2000 event = FootstepScuffSoundEffect }
        { time = 0.5000 event = FootstepWalkSoundEffect }
        { time = 0.7500 event = FootstepRunSoundEffect }
    ]
    GetUp_HK_Bk = [
        { time = 0.2000 event = FootstepRunSoundEffect }
        { time = 0.2000 event = FootstepScuffSoundEffect }
        { time = 0.5200 event = FootstepWalkSoundEffect }
        { time = 1.0 event = FootstepRunSoundEffect }
    ]
    GetUp_HK_Bk_T = [
        {
            time = 0.1000
            event = CatchBoardSound
            params = { DefVol = 50 }
        }
        { time = 0.2000 event = FootstepRunSoundEffect }
        { time = 0.2000 event = FootstepScuffSoundEffect }
        { time = 0.5000 event = FootstepWalkSoundEffect }
        { time = 0.7800 event = FootstepRunSoundEffect }
        { time = 0.9500 event = FootstepRunSoundEffect }
        { time = 0.9500 event = FootstepScuffSoundEffect }
    ]
    GetUp_HK_Bk_Q = [
        { time = 0.2000 event = FootstepRunSoundEffect }
        { time = 0.2000 event = FootstepScuffSoundEffect }
        { time = 0.5000 event = FootstepWalkSoundEffect }
        { time = 0.7500 event = FootstepRunSoundEffect }
    ]
    GetUp_HK_Rt_T = [
        {
            time = 0.1000
            event = CatchBoardSound
            params = { DefVol = 50 }
        }
        { time = 0.4000 event = FootstepRunSoundEffect }
        { time = 0.4000 event = FootstepScuffSoundEffect }
        { time = 0.7200 event = FootstepRunSoundEffect }
    ]
    GetUp_HK_Rt_Q = [
        { time = 0.02000 event = FootstepScuffSoundEffect }
        { time = 0.5200 event = FootstepWalkSoundEffect }
        { time = 0.5200 event = FootstepScuffSoundEffect }
        { time = 1.0 event = FootstepRunSoundEffect }
    ]
    GetUp_HK_Rt = [
        { time = 0.3000 event = FootstepWalkSoundEffect }
        { time = 0.3000 event = FootstepScuffSoundEffect }
        { time = 0.7300 event = FootstepWalkSoundEffect }
    ]
    GetUp_S_Turn180 = [
        {
            time = 0.3000
            event = CatchBoardSound
            params = { DefVol = 50 }
        }
        { time = 0.4500 event = FootstepScuffSoundEffect }
        { time = 0.7000 event = FootstepWalkSoundEffect }
        { time = 0.3300 event = FootstepScuffSoundEffect }
        { time = 1.250 event = FootstepRunSoundEffect }
        { time = 1.550 event = FootstepRunSoundEffect }
    ]
    GetUp_S_NoPushOff = [
        { time = 0.3000 event = FootstepWalkSoundEffect }
        { time = 0.3300 event = FootstepScuffSoundEffect }
    ]
    Bail_Manual_BK = [
        { time = 0.02000 event = BailBoardSoundEffect }
        { time = 0.4500 event = BailBodyPunchSoundEffect }
        { time = 0.5400 event = BailSlapSoundEffect }
        { time = 0.8700 event = BailBodyFallSoundEffect }
        { time = 1.070 event = BailBodyFallSoundEffect }
        {
            time = 1.580
            event = SoundEffect
            params = { name = BailBodyPunch02_11 }
        }
    ]
    Bail_Manual_BK_fast = [
        { time = 0.02000 event = BailBoardSoundEffect }
        { time = 0.4500 event = BailBodyPunchSoundEffect }
        { time = 0.5400 event = BailSlapSoundEffect }
        { time = 0.8700 event = BailBodyFallSoundEffect }
        { time = 1.070 event = BailBodyFallSoundEffect }
        {
            time = 2.100
            event = SoundEffect
            params = { name = BailBodyPunch02_11 }
        }
    ]
    Bail_Manual_FT = [
        { time = 0.01000 event = BailBoardSoundEffect }
        { time = 0.3800 event = BailBodyPunchSoundEffect }
        { time = 0.4500 event = BailSlapSoundEffect }
        { time = 0.8500 event = BailBodyFallSoundEffect }
        { time = 1.050 event = BailBodyFallSoundEffect }
    ]
    Bail_Manual_FT_fast = [
        { time = 0.01000 event = BailBoardSoundEffect }
        { time = 0.3800 event = BailBodyPunchSoundEffect }
        { time = 0.4500 event = BailSlapSoundEffect }
        { time = 0.8500 event = BailBodyFallSoundEffect }
        { time = 1.050 event = BailBodyFallSoundEffect }
    ]
    Nutsac = [
        { time = 0.2000 event = BailBodyPunchSoundEffect }
        { time = 0.2700 event = BailSlapSoundEffect }
        { time = 0.3300 event = BailCrackSoundEffect }
        { time = 0.9000 event = BailBodyFallSoundEffect }
        { time = 1.100 event = BailBodyFallSoundEffect }
    ]
    Bail_Nutter_FWD = [
        { time = 0.01000 event = BailBoardSoundEffect }
        { time = 0.4000 event = BailBodyPunchSoundEffect }
        { time = 0.4700 event = BailSlapSoundEffect }
        { time = 0.5300 event = BailCrackSoundEffect }
        { time = 1.100 event = BailBodyFallSoundEffect }
        { time = 1.500 event = BailBodyFallSoundEffect }
        { time = 1.700 event = BailBodyFallSoundEffect }
    ]
    Bail_Nutter_BCK = [
        { time = 0.01000 event = BailBoardSoundEffect }
        { time = 0.4000 event = BailBodyPunchSoundEffect }
        { time = 0.4700 event = BailSlapSoundEffect }
        { time = 0.5300 event = BailCrackSoundEffect }
        { time = 0.8000 event = BailBodyFallSoundEffect }
        { time = 1.200 event = BailBodyFallSoundEffect }
        { time = 1.400 event = BailBodyFallSoundEffect }
    ]
    Bail_Pitch_Nose = [
        { time = 0.1000 event = BailBodyPunchSoundEffect }
        { time = 0.1000 event = BailSlapSoundEffect }
        { time = 0.6000 event = BailBodyFallSoundEffect }
        { time = 1.200 event = BailBodyFallSoundEffect }
    ]
    Bail_Pitch_Back = [
        { time = 0.2200 event = BailBodyPunchSoundEffect }
        { time = 0.3100 event = BailSlapSoundEffect }
        { time = 0.4000 event = BailBodyFallSoundEffect }
        {
            time = 1.0
            event = SoundEffect
            params = { name = BailBodyPunch02_11 }
        }
    ]
    Bail_Pitch_Face = [
        { time = 0.1800 event = BailBodyPunchSoundEffect }
        { time = 0.2500 event = BailSlapSoundEffect }
        { time = 0.5000 event = BailBodyFallSoundEffect }
        { time = 0.6500 event = BailBodyFallSoundEffect }
    ]
    Bail_Pitch_Tail = [
        { time = 0.2200 event = BailBodyPunchSoundEffect }
        { time = 0.3100 event = BailSlapSoundEffect }
        { time = 0.4000 event = BailBodyFallSoundEffect }
        {
            time = 1.200
            event = SoundEffect
            params = { name = BailBodyPunch02_11 }
        }
    ]
    Bail_Ramp_Lt = [
        { time = 0.01000 event = BailBoardSoundEffect }
        { time = 0.2500 event = FootstepRunSoundEffect }
        { time = 0.2500 event = FootstepScuffSoundEffect }
        { time = 0.5000 event = FootstepRunSoundEffect }
        { time = 0.5000 event = FootstepScuffSoundEffect }
        { time = 0.7000 event = BailBodyPunchSoundEffect }
        { time = 0.7000 event = BailBodyFallSoundEffect }
        { time = 0.8500 event = BailSlapSoundEffect }
    ]
    Bail_Ramp_Rt = [
        { time = 0.01000 event = BailBoardSoundEffect }
        { time = 0.3800 event = BailBodyPunchSoundEffect }
        { time = 0.4500 event = BailSlapSoundEffect }
        { time = 0.7500 event = BailBodyFallSoundEffect }
        { time = 0.9500 event = BailBodyFallSoundEffect }
    ]
    Bail_Ramp_Bk_Hd = [
        { time = 0.01000 event = BailBoardSoundEffect }
        { time = 0.3100 event = BailBodyPunchSoundEffect }
        { time = 0.3100 event = BailBodyFallSoundEffect }
        { time = 0.3300 event = BailSlapSoundEffect }
        { time = 0.8500 event = BailSlapSoundEffect }
        { time = 0.8500 event = BailBodyFallSoundEffect }
        { time = 1.430 event = BailBodyFallSoundEffect }
    ]
    Bail_Ramp_Rt_Med = [
        { time = 0.2000 event = BailBodyPunchSoundEffect }
        { time = 0.2000 event = BailBodyFallSoundEffect }
        { time = 0.2300 event = BailSlapSoundEffect }
        { time = 0.7000 event = BailBodyFallSoundEffect }
        { time = 0.8700 event = BailBodyFallSoundEffect }
    ]
    Bail_Ramp_Lt_Med = [
        { time = 0.01000 event = BailBoardSoundEffect }
        { time = 0.3100 event = BailBodyPunchSoundEffect }
        { time = 0.3100 event = BailBodyFallSoundEffect }
        { time = 0.3300 event = BailSlapSoundEffect }
        { time = 0.5800 event = BailBodyFallSoundEffect }
        { time = 0.7500 event = BailBodyFallSoundEffect }
    ]
    Bail_Ramp_Bk = [
        { time = 0.2200 event = BailBodyPunchSoundEffect }
        { time = 0.3100 event = BailSlapSoundEffect }
        { time = 0.4000 event = BailBodyFallSoundEffect }
        { time = 1.500 event = FootstepLandSoundEffect }
    ]
    Bail_Ramp_Ft_Hd = [
        { time = 0.2100 event = BailBodyPunchSoundEffect }
        { time = 0.2100 event = BailBodyFallSoundEffect }
        { time = 0.2300 event = BailSlapSoundEffect }
        { time = 0.8000 event = BailBodyFallSoundEffect }
        { time = 1.0 event = BailBodyFallSoundEffect }
        { time = 1.250 event = BailBodyFallSoundEffect }
    ]
    Bail_Ramp_Ft_Med = [
        { time = 0.01000 event = BailBoardSoundEffect }
        { time = 0.3100 event = BailBodyPunchSoundEffect }
        { time = 0.3100 event = BailBodyFallSoundEffect }
        { time = 0.3300 event = BailSlapSoundEffect }
        { time = 0.7500 event = BailBodyFallSoundEffect }
    ]
    Bail_Ramp_Ft = [
        { time = 0.01000 event = BailBoardSoundEffect }
        { time = 0.5100 event = BailBodyPunchSoundEffect }
        { time = 0.5100 event = BailBodyFallSoundEffect }
        { time = 0.5300 event = BailSlapSoundEffect }
        { time = 0.9800 event = BailBodyFallSoundEffect }
    ]
    Bail_Ramp_Lt_Hd = [
        { time = 0.01000 event = BailBoardSoundEffect }
        { time = 0.5100 event = BailBodyPunchSoundEffect }
        { time = 0.5100 event = BailBodyFallSoundEffect }
        { time = 0.5300 event = BailSlapSoundEffect }
        { time = 0.9800 event = BailBodyFallSoundEffect }
    ]
    Bail_Ramp_Rt_Hd = [
        { time = 0.01000 event = BailBoardSoundEffect }
        { time = 0.1000 event = FootstepRunSoundEffect }
        { time = 0.2500 event = FootstepRunSoundEffect }
        { time = 0.3800 event = FootstepRunSoundEffect }
        { time = 0.3800 event = FootstepScuffSoundEffect }
        { time = 0.8100 event = BailBodyPunchSoundEffect }
        { time = 0.8100 event = BailBodyFallSoundEffect }
        { time = 0.8300 event = BailSlapSoundEffect }
        { time = 1.180 event = BailBodyFallSoundEffect }
    ]
    Bail_RunOut_Old = [
        { time = 0.01000 event = BailBoardSoundEffect }
        { time = 0.3000 event = BailBoardSoundEffect }
        { time = 0.1800 event = FootstepRunSoundEffect }
        { time = 0.6000 event = FootstepRunSoundEffect }
        { time = 0.9700 event = FootstepScuffSoundEffect }
        { time = 1.500 event = FootstepWalkSoundEffect }
        { time = 2.100 event = FootstepWalkSoundEffect }
        { time = 2.480 event = FootstepWalkSoundEffect }
    ]
    Bail_RunOut_New_A = [
        { time = 0.01000 event = BailBoardSoundEffect }
        { time = 0.3000 event = BailBoardSoundEffect }
        { time = 0.1800 event = FootstepRunSoundEffect }
        { time = 0.6000 event = FootstepRunSoundEffect }
        { time = 0.9700 event = FootstepScuffSoundEffect }
        { time = 1.500 event = FootstepWalkSoundEffect }
        { time = 2.100 event = FootstepWalkSoundEffect }
        { time = 2.480 event = FootstepWalkSoundEffect }
    ]
    RunOut_Drop_Land_Med = [
        { time = 0.02000 event = BailBodyPunchSoundEffect }
        { time = 0.04000 event = BailSlapSoundEffect }
        { time = 0.5000 event = BailBodyFallSoundEffect }
        { time = 0.7000 event = BailBodyFallSoundEffect }
    ]
    Bail_Spin_CCW_Hard = [
        { time = 0.01000 event = BailBoardSoundEffect }
        { time = 0.5100 event = BailBodyPunchSoundEffect }
        { time = 0.5100 event = BailBodyFallSoundEffect }
        { time = 0.5300 event = BailSlapSoundEffect }
        { time = 0.8000 event = BailBodyFallSoundEffect }
    ]
    Bail_Spin_CW_Hard = [
        { time = 0.01000 event = BailBoardSoundEffect }
        { time = 0.4200 event = BailBodyPunchSoundEffect }
        { time = 0.4200 event = BailBodyFallSoundEffect }
        { time = 0.4400 event = BailSlapSoundEffect }
        { time = 0.6000 event = BailBodyFallSoundEffect }
        { time = 2.100 event = FootstepLandSoundEffect }
    ]
    Bail_Spin_CCW_Hard_B = [
        { time = 0.2100 event = BailBodyPunchSoundEffect }
        { time = 0.2100 event = BailBodyFallSoundEffect }
        { time = 0.2300 event = BailSlapSoundEffect }
        { time = 0.6800 event = BailBodyFallSoundEffect }
    ]
    Bail_Spin_CCW_Hard_C = [
        { time = 0.01000 event = BailBoardSoundEffect }
        { time = 0.4200 event = BailBodyPunchSoundEffect }
        { time = 0.4200 event = BailBodyFallSoundEffect }
        { time = 0.4400 event = BailSlapSoundEffect }
        { time = 0.6000 event = BailBodyFallSoundEffect }
        { time = 0.8000 event = BailBodyFallSoundEffect }
        { time = 1.0 event = BailBodyFallSoundEffect }
    ]
    Bail_Spin_CW_Hard_B = [
        { time = 0.01000 event = BailBoardSoundEffect }
        { time = 0.5100 event = BailBodyPunchSoundEffect }
        { time = 0.5100 event = BailBodyFallSoundEffect }
        { time = 0.5300 event = BailSlapSoundEffect }
        { time = 0.8000 event = BailBodyFallSoundEffect }
    ]
    Bail_Spin_CW_Hard_A = [
        { time = 0.01000 event = BailBoardSoundEffect }
        { time = 0.3100 event = BailBodyPunchSoundEffect }
        { time = 0.3100 event = BailBodyFallSoundEffect }
        { time = 0.3300 event = BailSlapSoundEffect }
        { time = 0.7000 event = BailBodyFallSoundEffect }
    ]
    Bail_Spin_FWD_Regular = [
        { time = 0.01000 event = BailBoardSoundEffect }
        { time = 0.1600 event = BailBodyPunchSoundEffect }
        { time = 0.1600 event = BailBodyFallSoundEffect }
        { time = 0.1800 event = BailSlapSoundEffect }
        { time = 0.7500 event = BailBodyFallSoundEffect }
    ]
    Bail_Spin_FWD_Hard = [
        { time = 0.01000 event = BailBoardSoundEffect }
        { time = 0.4100 event = BailBodyPunchSoundEffect }
        { time = 0.4100 event = BailBodyFallSoundEffect }
        { time = 0.4300 event = BailSlapSoundEffect }
        { time = 0.5000 event = BailBodyFallSoundEffect }
        { time = 1.600 event = FootstepLandSoundEffect }
    ]
    Bail_Spin_FWD_Fast = [
        { time = 0.01000 event = BailBoardSoundEffect }
        { time = 0.4100 event = BailBodyPunchSoundEffect }
        { time = 0.4100 event = BailBodyFallSoundEffect }
        { time = 0.4300 event = BailSlapSoundEffect }
        { time = 0.5000 event = BailBodyFallSoundEffect }
        { time = 0.7000 event = BailBodyFallSoundEffect }
        { time = 0.9000 event = BailBodyFallSoundEffect }
    ]
    Bail_Spin_BCK_Regular = [
        { time = 0.01000 event = BailBoardSoundEffect }
        { time = 0.1600 event = BailBodyPunchSoundEffect }
        { time = 0.1600 event = BailBodyFallSoundEffect }
        { time = 0.1800 event = BailSlapSoundEffect }
        { time = 0.7500 event = BailBodyFallSoundEffect }
    ]
    Bail_Spin_BCK_Fast = [
        { time = 0.01000 event = BailBoardSoundEffect }
        { time = 0.5000 event = BailBodyPunchSoundEffect }
        { time = 0.5000 event = BailBodyFallSoundEffect }
        { time = 0.5500 event = BailSlapSoundEffect }
        { time = 1.0 event = BailBodyFallSoundEffect }
        { time = 1.550 event = BailBodyFallSoundEffect }
        { time = 1.780 event = BailSlapSoundEffect }
    ]
    Bail_Spin_BCK_Hard = [
        { time = 0.01000 event = BailBoardSoundEffect }
        { time = 0.1600 event = BailBodyPunchSoundEffect }
        { time = 0.1600 event = BailBodyFallSoundEffect }
        { time = 0.3000 event = BailSlapSoundEffect }
        { time = 0.7500 event = BailBodyFallSoundEffect }
        { time = 1.600 event = FootstepLandSoundEffect }
    ]
    Bail_Wall_FWD_Regular = [
        { time = 0.02000 event = BailBodyPunchSoundEffect }
        { time = 0.04000 event = BailSlapSoundEffect }
        { time = 0.5000 event = BailBodyFallSoundEffect }
        { time = 0.7500 event = BailBodyFallSoundEffect }
        { time = 1.0 event = BailBodyFallSoundEffect }
    ]
    Bail_Wall_FWD_Low = [
        { time = 0.02000 event = BailBodyPunchSoundEffect }
        { time = 0.04000 event = BailSlapSoundEffect }
        { time = 0.3000 event = BailBodyFallSoundEffect }
        { time = 0.5000 event = BailBodyFallSoundEffect }
    ]
    Bail_Wall_BCK_Regular = [
        { time = 0.02000 event = BailBodyPunchSoundEffect }
        { time = 0.08000 event = BailSlapSoundEffect }
        { time = 0.6000 event = BailBodyFallSoundEffect }
        { time = 0.8000 event = BailBodyFallSoundEffect }
    ]
    Bail_Wall_BCK_Low = [
        { time = 0.02000 event = BailBodyPunchSoundEffect }
        { time = 0.04000 event = BailSlapSoundEffect }
        { time = 0.5000 event = BailBodyFallSoundEffect }
        { time = 0.7000 event = BailBodyFallSoundEffect }
    ]
    Bail_Wall_LT_Low = [
        { time = 0.02000 event = BailBodyPunchSoundEffect }
        { time = 0.04000 event = BailSlapSoundEffect }
        { time = 0.4000 event = BailBodyFallSoundEffect }
    ]
    Bail_Wall_RT_Low = [
        { time = 0.02000 event = BailBodyPunchSoundEffect }
        { time = 0.04000 event = BailSlapSoundEffect }
        { time = 0.4000 event = BailBodyFallSoundEffect }
    ]
    WalkingSlap = [
        { time = 0.2800 event = BailSlapSoundEffect }
        { time = 0.5700 event = FootstepRunSoundEffect }
        { time = 0.9000 event = FootstepWalkSoundEffect }
    ]
    WalkingBail = [
        { time = 0.01000 event = BailSlapSoundEffect }
        { time = 0.4500 event = BailBoardSoundEffect }
        { time = 0.6000 event = BailBodyFallSoundEffect }
    ]
    WalkingBailGetUp = [
        { time = 0.7000 event = FootstepScuffSoundEffect }
        { time = 1.200 event = FootstepScuffSoundEffect }
        { time = 1.600 event = FootstepWalkSoundEffect }
        { time = 1.900 event = FootstepWalkSoundEffect }
    ]
    THPS7_BoardCatch_Stand = [
        { time = 0.2600 event = BoardFlyInSound }
        { time = 0.6600 event = CatchBoardSound }
    ]
    THPS7_BoardDrop_Stand = [
        { time = 0.4000 event = BoardDropSoundEffect }
    ]
    THPS7_BoardDrop_Run = [
        { time = 0.5000 event = FootstepWalkSoundEffect }
        { time = 0.3000 event = FootstepWalkSoundEffect }
        { time = 0.3600 event = BoardDropSoundEffect }
    ]
    THPS7_BoardCatch_Run = [
        { time = 0.1100 event = FootstepWalkSoundEffect }
        { time = 0.2600 event = BoardFlyInSound }
        { time = 0.4000 event = FootstepWalkSoundEffect }
        { time = 0.6600 event = CatchBoardSound }
        { time = 0.7500 event = FootstepWalkSoundEffect }
        { time = 1.080 event = FootstepWalkSoundEffect }
    ]
    THPS7_BoardThrow_Stand = [
        { time = 0.2700 event = WhooshSoundEffect }
    ]
    THPS7_BoardThrow_Run = [
        { time = 0.1700 event = FootstepWalkSoundEffect }
        { time = 0.2700 event = WhooshSoundEffect }
        { time = 0.3000 event = FootstepWalkSoundEffect }
    ]
    GetUp_S_BoardCatch1 = [
        { time = 0.01000 event = TurnOffSkaterLoopingSound }
        { time = 0.2600 event = BoardFlyInSound }
        { time = 0.7000 event = CatchBoardSound }
        { time = 1.640 event = FootstepWalkSoundEffect }
        { time = 1.920 event = FootstepWalkSoundEffect }
        { time = 2.400 event = FootstepScuffSoundEffect }
        { time = 2.450 event = TerrainLandSound }
        { time = 2.450 event = TurnOnSkaterLoopingSound }
    ]
    GetUp_S_RunJump = [
        { time = 0.01000 event = TurnOffSkaterLoopingSound }
        { time = 0.01000 event = BoardRollingSound }
        { time = 1.050 event = FootstepRunSoundEffect }
        { time = 1.400 event = FootstepRunSoundEffect }
        { time = 1.800 event = FootstepScuffSoundEffect }
        { time = 1.800 event = TerrainLandSound }
        { time = 1.800 event = TurnOnSkaterLoopingSound }
    ]
    GetUp_S_BoardFlip1 = [
        { time = 0.01000 event = BoardScrapeSound }
        {
            time = 0.9000
            event = CatchBoardSound
            params = { DefVol = 80 }
        }
        {
            time = 1.400
            event = SoundEffect
            params = { name = OllieConc19 }
        }
        { time = 1.800 event = TerrainLandSound }
    ]
    Tantrum_BoardFocus = [
        { time = 0.6000 event = FootstepScuffSoundEffect }
        { time = 1.200 event = BoardSplitSound }
        { time = 2.0 event = FootstepWalkSoundEffect }
        { time = 2.400 event = FootstepWalkSoundEffect }
    ]
    Tantrum_DiscusStart = [
        {
            time = 0.0
            event = CatchBoardSound
            params = { DefVol = 50 }
        }
        { time = 0.1000 event = FootstepScuffSoundEffect }
        { time = 0.1500 event = RageVoxSoundEffect }
        { time = 0.2800 event = FootstepWalkSoundEffect }
        { time = 0.3500 event = WhooshSoundEffect }
    ]
    Tantrum_DiscusFinish = [
    ]
    Tantrum_KickBoard = [
        { time = 0.3000 event = FootstepScuffSoundEffect }
        { time = 0.4000 event = RageVoxSoundEffect }
        { time = 0.4100 event = FootstepRunSoundEffect }
        { time = 0.7500 event = FootstepRunSoundEffect }
        { time = 0.8200 event = KickBoard }
        { time = 1.300 event = FootstepScuffSoundEffect }
    ]
    Tantrum_HeadButt = [
        { time = 0.1500 event = RageVoxSoundEffect }
        { time = 0.3500 event = WhooshSoundEffect }
        { time = 0.9500 event = BoardSplitSound }
        {
            time = 2.100
            event = SoundEffect
            params = { name = BoardBounce01 }
        }
        {
            time = 2.150
            event = SoundEffect
            params = { name = BoardBounce01 }
        }
    ]
    Tantrum_SlingShot = [
        { time = 0.2000 event = FootstepScuffSoundEffect }
        { time = 0.2500 event = RageVoxSoundEffect }
        {
            time = 0.6000
            event = WhooshSoundEffect
            params = { DefPitch = 60 }
        }
    ]
    Tantrum_PileDriver = [
        { time = 0.1500 event = RageVoxSoundEffect }
        { time = 0.8000 event = FootstepScuffSoundEffect }
        { time = 0.8300 event = WhooshSoundEffect }
        { time = 0.9500 event = BoardSplitSound }
        {
            time = 1.100
            event = SoundEffect
            params = { name = BoardBounce01 }
        }
        {
            time = 2.200
            event = SoundEffect
            params = { name = BoardBounce01 }
        }
    ]
    BMX_Idle_Pedaling = [
        { time = 0.1300 event = BMXPedalSoundEffect }
        { time = 0.3000 event = BMXPedalSoundEffect }
    ]
    BMX_TailWhip = [
        { time = 0.3000 event = WhooshSoundEffect }
    ]
    Standing_Tag2 = [
        {
            time = 0.2330
            event = DoSprayPaint
            params = { on }
        }
        { time = 0.3000 event = FootstepScuffSoundEffect }
        {
            time = 0.5000
            event = DoSprayPaint
            params = { splat }
        }
        {
            time = 0.6000
            event = DoSprayPaint
            params = { Off }
        }
        { time = 0.7800 event = FootstepScuffSoundEffect }
    ]
    Hanging_Tag = [
        {
            time = 0.6000
            event = DoSprayPaint
            params = { on }
        }
        {
            time = 0.5000
            event = DoSprayPaint
            params = { splat }
        }
        {
            time = 1.060
            event = DoSprayPaint
            params = { Off }
        }
    ]
    Standing_Tag_Ground = [
        {
            time = 0.2600
            event = DoSprayPaint
            params = { on }
        }
        {
            time = 0.3300
            event = DoSprayPaint
            params = { splat }
        }
        {
            time = 0.6670
            event = DoSprayPaint
            params = { Off }
        }
    ]
    Wallgrab_Tag = [
        {
            time = 0.5000
            event = DoSprayPaint
            params = { on }
        }
        {
            time = 0.5500
            event = DoSprayPaint
            params = { splat }
        }
        {
            time = 1.400
            event = DoSprayPaint
            params = { Off }
        }
    ]
    Throw_Sidearm = [
        {
            time = 0.2500
            event = ThrowObject
            params = {}
        }
    ]
    Standing_Throw = [
        {
            time = 0.2700
            event = ThrowObject
            params = {}
        }
    ]
    VertPlant = [
        { time = 0.3300 event = SlapVertSticker }
    ]
    Special_FranklinGrind_Idle = [
        { time = 0.01000 event = DoLightning }
    ]
    Shrek_BurpTag = [
        { time = 0.2000 event = DoShrekBurp }
        {
            time = 0.3000
            event = DoSprayPaint
            params = { splat }
        }
    ]
    Shrek_BurpHangingTag = [
        { time = 0.1500 event = DoShrekBurp }
        {
            time = 0.2500
            event = DoSprayPaint
            params = { splat }
        }
    ]
    BeaverBlast = [
        { time = 0.3000 event = DoFartBurst }
    ]
    Special_Muska_Burn_init = [
        { time = 0.4000 event = DoCanFlame }
    ]
    Special_Muska_Burn_Out = [
        { time = 0.01000 event = DoCanFlameOff }
    ]
    Special_GrafPunk_Idle = [
        { time = 0.01000 event = DoDoubleCanOn }
    ]
    Special_GrafPunk_Out = [
        { time = 0.01000 event = DoDoubleCanOff }
    ]
    Special_Phil_Hoagie_Idle = [
        { time = 0.01000 event = DoHoagieOn }
    ]
    Special_Phil_hoagie_Out = [
        { time = 0.01000 event = DoHoagieOff }
    ]
    Special_Jesse_HotRod_Init = [
        { time = 0.01000 event = DoTiresOn }
    ]
    Special_Koston_900 = [
        { time = 0.03000 event = DoVortex }
    ]
    ElbowSmash_Idle = [
        { time = 1.0 event = DoScreenShake }
    ]
}
PedAnimEventTable = {
    Ped_M_JumpBack = [
        { time = 0.5800 event = FootstepScuffSoundEffect }
        { time = 0.8500 event = FootstepRunSoundEffect }
        { time = 1.0 event = FootstepRunSoundEffect }
    ]
    Ped_M_JumpForward = [
        { time = 0.6000 event = FootstepScuffSoundEffect }
        { time = 0.6000 event = FootstepRunSoundEffect }
        { time = 1.100 event = FootstepWalkSoundEffect }
    ]
    Ped_M_JumpLeft = [
        { time = 0.4500 event = FootstepScuffSoundEffect }
        { time = 0.4500 event = FootstepRunSoundEffect }
        { time = 0.8000 event = FootstepRunSoundEffect }
        { time = 1.300 event = FootstepWalkSoundEffect }
    ]
    Ped_M_FalldownA = [
        { time = 0.4500 event = BailBodyFallSoundEffect }
        { time = 0.7000 event = BailBodyFallSoundEffect }
    ]
    Ped_M_FalldownB = [
        { time = 0.4200 event = BailBodyFallSoundEffect }
        { time = 0.6500 event = BailBodyFallSoundEffect }
    ]
    Ped_M_FalldownC = [
        { time = 0.3000 event = BailBodyFallSoundEffect }
    ]
    Ped_M_FalldownD = [
        { time = 0.2000 event = FootstepScuffSoundEffect }
        { time = 0.4000 event = BailBodyFallSoundEffect }
    ]
    Ped_M_FalldownE = [
        { time = 0.2000 event = FootstepScuffSoundEffect }
        { time = 0.3500 event = BailBodyFallSoundEffect }
        { time = 0.5500 event = BailBodyFallSoundEffect }
    ]
    Ped_f_Run = [
        { time = 0.1800 event = FootstepRunSoundEffect }
        { time = 0.6000 event = FootstepRunSoundEffect }
    ]
    Ped_M_Run1 = [
        { time = 0.1200 event = FootstepRunSoundEffect }
        { time = 0.4600 event = FootstepRunSoundEffect }
    ]
    Ped_F_Walk = [
        { time = 0.01000 event = FootstepWalkSoundEffect }
        { time = 0.6200 event = FootstepWalkSoundEffect }
    ]
    Ped_M_WalkCool = [
        { time = 0.01000 event = FootstepWalkSoundEffect }
        { time = 0.8000 event = FootstepWalkSoundEffect }
    ]
    Ped_M_WalkTired = [
        { time = 0.01000 event = FootstepWalkSoundEffect }
        { time = 0.8000 event = FootstepWalkSoundEffect }
    ]
    Ped_M_Walk2 = [
        { time = 0.01000 event = FootstepWalkSoundEffect }
        { time = 0.5300 event = FootstepWalkSoundEffect }
    ]
    Ped_M_Walk2ToIdle = [
        { time = 0.4000 event = FootstepScuffSoundEffect }
    ]
    Ped_M_Run1ToIdle = [
        { time = 0.3000 event = FootstepScuffSoundEffect }
    ]
    Ped_Tagger10 = [
        {
            time = 1.200
            event = DoSprayPaint
            params = { on }
        }
        {
            time = 3.100
            event = DoSprayPaint
            params = { Off }
        }
    ]
    Ped_TagWall02 = [
        {
            time = 0.7300
            event = DoSprayPaint
            params = { on }
        }
        {
            time = 1.800
            event = DoSprayPaint
            params = { Off }
        }
    ]
    Ped_DropCan = [
        {
            time = 2.130
            event = DoSprayPaint
            params = { on }
        }
        {
            time = 2.200
            event = DoSprayPaint
            params = { Off }
        }
    ]
    Ped_TagWall01a = [
        {
            time = 1.0
            event = DoSprayPaint
            params = { on }
        }
    ]
    Ped_TagWall01b = [
        {
            time = 0.0
            event = DoSprayPaint
            params = { on }
        }
        {
            time = 0.4000
            event = DoSprayPaint
            params = { Off }
        }
    ]
    run = [
        { time = 0.1000 event = BullGallopSounds }
    ]
    BarkIdle = [
        { time = 0.4500 event = DogGrowlSFX }
        { time = 0.7000 event = DogBarkSFX }
        { time = 0.8200 event = DogFootstepSFX }
        { time = 0.8900 event = DogFootstepSFX }
        { time = 1.400 event = DogGrowlSFX }
        { time = 1.500 event = DogFootstepSFX }
        { time = 1.570 event = DogFootstepSFX }
        { time = 1.800 event = DogBarkSFX }
        { time = 2.400 event = DogFootstepSFX }
        { time = 2.500 event = DogFootstepSFX }
        { time = 2.700 event = DogFootstepSFX }
    ]
    WalkFromIdle = [
        { time = 0.5600 event = DogFootstepSFX }
        { time = 0.7000 event = DogFootstepSFX }
    ]
    walk = [
        { time = 0.2300 event = DogFootstepSFX }
        { time = 0.3300 event = DogFootstepSFX }
        { time = 0.8000 event = DogFootstepSFX }
        { time = 0.9100 event = DogFootstepSFX }
    ]
    WalkToIdle = [
        { time = 0.2700 event = DogFootstepSFX }
        { time = 0.3100 event = DogFootstepSFX }
        { time = 0.7000 event = DogFootstepSFX }
        { time = 0.8800 event = DogFootstepSFX }
    ]
    run = [
        { time = 0.1800 event = DogFootstepSFX }
        { time = 0.3300 event = DogFootstepSFX }
        { time = 0.5500 event = DogFootstepSFX }
        { time = 0.6500 event = DogFootstepSFX }
    ]
    RunToIdle = [
        { time = 0.1800 event = DogFootstepSFX }
        { time = 0.3300 event = DogFootstepSFX }
        { time = 0.5000 event = DogFootstepSFX }
        { time = 0.6300 event = DogFootstepSFX }
    ]
    LiftLeg = [
        { time = 0.3100 event = DogFootstepSFX }
        { time = 0.5000 event = DogFootstepSFX }
        { time = 2.250 event = DogFootstepSFX }
        { time = 2.500 event = DogFootstepSFX }
    ]
    Dog_Stand2sit = [
        { time = 0.2500 event = DogFootstepSFX }
        { time = 0.4100 event = DogFootstepSFX }
        { time = 0.5800 event = DogFootstepSFX }
        { time = 0.7600 event = DogFootstepSFX }
    ]
    Dog_Sit_Bark = [
        { time = 0.3300 event = DogBarkSFX }
    ]
    Dog_Sit2Stand = [
        { time = 1.250 event = DogFootstepSFX }
        { time = 1.550 event = DogFootstepSFX }
        { time = 1.630 event = DogFootstepSFX }
        { time = 1.980 event = DogFootstepSFX }
    ]
    Dog_Stand_BarkSingle = [
        { time = 0.2000 event = DogBarkSFX }
    ]
    Dog_Stand_BarkDouble = [
        { time = 0.1700 event = DogGrowlSFX }
        { time = 0.3300 event = DogBarkSFX }
        { time = 0.6500 event = DogFootstepSFX }
        { time = 0.7000 event = DogFootstepSFX }
    ]
}
DogAnimEventTable = {
    run = [
        { time = 0.1000 event = BullGallopSounds }
    ]
    BarkIdle = [
        { time = 0.4500 event = DogGrowlSFX }
        { time = 0.7000 event = DogBarkSFX }
        { time = 0.8200 event = DogFootstepSFX }
        { time = 0.8900 event = DogFootstepSFX }
        { time = 1.400 event = DogBarkSFX }
        { time = 1.500 event = DogFootstepSFX }
        { time = 1.570 event = DogFootstepSFX }
        { time = 1.800 event = DogGrowlSFX }
        { time = 2.0 event = DogBarkSFX }
        { time = 2.400 event = DogFootstepSFX }
        { time = 2.500 event = DogFootstepSFX }
        { time = 2.700 event = DogFootstepSFX }
    ]
    WalkFromIdle = [
        { time = 0.5600 event = DogFootstepSFX }
        { time = 0.7000 event = DogFootstepSFX }
    ]
    walk = [
        { time = 0.2300 event = DogFootstepSFX }
        { time = 0.3300 event = DogFootstepSFX }
        { time = 0.8000 event = DogFootstepSFX }
        { time = 0.9100 event = DogFootstepSFX }
    ]
    WalkToIdle = [
        { time = 0.2700 event = DogFootstepSFX }
        { time = 0.3100 event = DogFootstepSFX }
        { time = 0.7000 event = DogFootstepSFX }
        { time = 0.8800 event = DogFootstepSFX }
    ]
    run = [
        { time = 0.1800 event = DogFootstepSFX }
        { time = 0.3300 event = DogFootstepSFX }
        { time = 0.5500 event = DogFootstepSFX }
        { time = 0.6500 event = DogFootstepSFX }
    ]
    RunToIdle = [
        { time = 0.1800 event = DogFootstepSFX }
        { time = 0.3300 event = DogFootstepSFX }
        { time = 0.5000 event = DogFootstepSFX }
        { time = 0.6300 event = DogFootstepSFX }
    ]
    LiftLeg = [
        { time = 0.3100 event = DogFootstepSFX }
        { time = 0.5000 event = DogFootstepSFX }
        { time = 2.250 event = DogFootstepSFX }
        { time = 2.500 event = DogFootstepSFX }
    ]
    Dog_Stand2sit = [
        { time = 0.2500 event = DogFootstepSFX }
        { time = 0.4100 event = DogFootstepSFX }
        { time = 0.5800 event = DogFootstepSFX }
        { time = 0.7600 event = DogFootstepSFX }
    ]
    Dog_Sit_Bark = [
        { time = 0.3300 event = DogBarkSFX }
    ]
    Dog_Sit2Stand = [
        { time = 1.250 event = DogFootstepSFX }
        { time = 1.550 event = DogFootstepSFX }
        { time = 1.630 event = DogFootstepSFX }
        { time = 1.980 event = DogFootstepSFX }
    ]
    Dog_Stand_BarkSingle = [
        { time = 0.2000 event = DogBarkSFX }
    ]
    Dog_Stand_BarkDouble = [
        { time = 0.1700 event = DogGrowlSFX }
        { time = 0.3300 event = DogBarkSFX }
        { time = 0.6500 event = DogFootstepSFX }
        { time = 0.7000 event = DogFootstepSFX }
    ]
}
ActualSkaterAnimHandlerExceptionTable = [
    { event Ex = PedHitDrum scr = HandlePedHitDrum }
    { event Ex = SoundEffect scr = HandleSoundEffectEvent }
    { event Ex = FootstepWalkSoundEffect scr = HandleFootstepWalkSoundEffectEvent }
    { event Ex = FootstepRunSoundEffect scr = HandleFootstepRunSoundEffectEvent }
    { event Ex = FootstepScuffSoundEffect scr = HandleFootstepScuffSoundEffect }
    { event Ex = FootstepJumpSoundEffect scr = HandleFootstepJumpSoundEffect }
    { event Ex = FootstepLandSoundEffect scr = HandleFootstepLandSoundEffect }
    { event Ex = BailBodyFallSoundEffect scr = HandleBailBodyFallSoundEffect }
    { event Ex = BailBodyPunchSoundEffect scr = HandleBailBodyPunchSoundEffect }
    { event Ex = BailCrackSoundEffect scr = HandleBailCrackSoundEffect }
    { event Ex = BailSlapSoundEffect scr = HandleBailSlapSoundEffect }
    { event Ex = BailScrapeSoundEffect scr = HandleBailScrapeSoundEffect }
    { event Ex = BailBoardSoundEffect scr = HandleBailBoardSoundEffect }
    { event Ex = BailHitGroundSoundEffect scr = HandleHitGroundSoundEffect }
    { event Ex = TerrainLandSound scr = HandleTerrainLandSound }
    { event Ex = TerrainBonkSound scr = HandleTerrainBonkSound }
    { event Ex = TurnOnSkaterLoopingSound scr = HandleTurnOnSkaterLoopingSound }
    { event Ex = TurnOffSkaterLoopingSound scr = HandleTurnOffSkaterLoopingSound }
    { event Ex = CatchBoardSound scr = HandleCatchBoardSound }
    { event Ex = BoardScrapeSound scr = HandleBoardScrapeSound }
    { event Ex = BoardSplitSound scr = HandleBoardSplitSound }
    { event Ex = BoardFlyInSound scr = HandleBoardFlyInSound }
    { event Ex = BoardRollingSound scr = HandleBoardRollingSound }
    { event Ex = DiscusWhooshSound scr = HandleDiscusWhooshSound }
    { event Ex = ThrowObject scr = ThrowObjectScript }
    { event Ex = KickBoard scr = HandleKickBoardSound }
    { event Ex = StopAStream scr = HandleStoppingAStream }
    { event Ex = GenericParticles scr = Emit_SpecialTrickParticles }
    { event Ex = DoSprayPaint scr = HandleSkaterSprayPaint }
    { event Ex = SlapVertSticker scr = HandleVertSticker }
    { event Ex = DoLightning scr = HandleLightning }
    { event Ex = DoShrekBurp scr = HandleShrekBurp }
    { event Ex = DoVehicleGrind scr = handleVehiclegrind }
    { event Ex = DoFartBurst scr = HandleFartBurst }
    { event Ex = DoCanFlame scr = HandleCanFlameOn }
    { event Ex = DoCanFlameOff scr = HandleCanFlameOff }
    { event Ex = DoVortex scr = HandleVortex }
    { event Ex = DoDoubleCanOn scr = HandleDoubleCanOn }
    { event Ex = DoDoubleCanOff scr = HandleDoubleCanOff }
    { event Ex = DoHoagieOn scr = HandleHoagieOn }
    { event Ex = DoHoagieOff scr = HandleHoagieOff }
    { event Ex = DoTiresOn scr = HandleTiresOn }
    { event Ex = FootstepParticlesR scr = SkaterParticles_OnRightFootstep }
    { event Ex = FootstepParticlesL scr = SkaterParticles_OnLeftFootstep }
    { event Ex = DoScreenShake scr = Grind_ScreenShake }
    { event Ex = VaultRollSoundEffect scr = HandleVaultRollSoundEffect }
    { event Ex = GruntSoundEffect scr = HandleGruntSoundEffect }
    { event Ex = JumpSoundEffect scr = HandleJumpSoundEffect }
    { event Ex = RageVoxSoundEffect scr = HandleRageVoxSoundEffect }
    { event Ex = WhooshSoundEffect scr = HandleWhooshSoundEffect }
    { event Ex = FastWhooshSoundEffect scr = HandleFastWhooshSoundEffect }
    { event Ex = BMXPedalSoundEffect scr = HandleBMXPedalSoundEffect }
    { event Ex = BoardKickupSoundEffect scr = HandleBoardKickupSoundEffect }
    { event Ex = BoardDropSoundEffect scr = HandleBoardDropSoundEffect }
]
ActualPedAnimHandlerExceptionTable = [
    { event Ex = PedHitDrum scr = HandlePedHitDrum }
    { event Ex = print scr = HandlePrintEvent }
    { event Ex = PedObjPlayStream scr = HandlePedObjPlayStream }
    { event Ex = DogBarkStream scr = HandleDogBarkStream }
    { event Ex = BullGallopSounds scr = HandleBullGallopSounds }
    { event Ex = FootstepWalkSoundEffect scr = HandlePedFootstepWalkSoundEffectEvent }
    { event Ex = FootstepRunSoundEffect scr = HandlePedFootstepRunSoundEffectEvent }
    { event Ex = FootstepScuffSoundEffect scr = HandlePedFootstepScuffSoundEffect }
    { event Ex = FootstepJumpSoundEffect scr = HandlePedFootstepJumpSoundEffect }
    { event Ex = FootstepLandSoundEffect scr = HandlePedFootstepLandSoundEffect }
    { event Ex = BailBodyFallSoundEffect scr = HandlePedBailBodyFallSoundEffect }
    { event Ex = BailBodyPunchSoundEffect scr = HandlePedBailBodyPunchSoundEffect }
    { event Ex = BailCrackSoundEffect scr = HandlePedBailCrackSoundEffect }
    { event Ex = BailSlapSoundEffect scr = HandlePedBailSlapSoundEffect }
    { event Ex = BailScrapeSoundEffect scr = HandlePedBailScrapeSoundEffect }
    { event Ex = BailBoardSoundEffect scr = HandlePedBailBoardSoundEffect }
    { event Ex = DoSprayPaint scr = HandlePedSprayPaint }
    { event Ex = DoSprayPaint scr = HandlePedSprayPaint }
    { event Ex = DogBarkSFX scr = HandleDogBarkSFX }
    { event Ex = DogFootstepSFX scr = HandleDogFootstepSFX }
    { event Ex = DogGrowlSFX scr = HandleDogGrowlSFX }
]

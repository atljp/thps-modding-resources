ped_avoid_jump_time = 3.0
ped_low_priority_waypoint_probability = 0.2000
ped_min_distance_to_path = 2
ped_max_distance_to_path = 48
ped_min_bias = 0.000001000
ped_avoid_ped_range = 60
ped_avoid_ped_bias = 0.4000
ped_whisker_decay_factor = 0.8000
ped_head_on_range = 0.1750
ped_target_node_bias = 0.7500
ped_max_angle_to_heading = 0.1750
ped_branching_path_min_angle = 90
ped_fade_target_bias_max_distance_square = 4225
ped_fade_target_bias_min_distance_square = 36
ped_min_inner_path_angle = 80
ped_turn_frames = 30
ped_passing_room_right = 100
ped_passing_room_rear = 60
ped_passing_room_front = 36
ped_passing_room_front_buffer_percent = 20
ped_max_y_distance_to_ignore = 36
ped_walker_min_square_distance_to_dead_end = 1000
ped_min_notice_TrickScore = 500
ped_skater_min_square_distance_to_waypoint = 3
ped_skater_min_square_distance_to_skater = 576
ped_skater_min_square_distance_to_crouch_for_jump = 14400
ped_skater_fade_target_bias_max_distance_square = 7056
ped_skater_stick_dist_below = 24.0
ped_skater_stick_dist_above = 18.0
ped_skater_jump_col_dist_above = 12
ped_skater_jump_col_dist_below = 12
ped_skater_vert_jump_speed_slop = 1
ped_skater_deltaV = 100
ped_skater_bail_deceleration = 9
ped_skater_stop_deceleration = 10
ped_skater_min_180_spin_time = 0.3000
ped_skater_vert_rotation_time_slop = 1.100
ped_skater_spine_rotation_slop = 60
ped_skater_jump_to_next_node_height_slop = 12
ped_skater_jump_speed = 280
ped_skater_jump_gravity = -700
goalped_MinAnimSpeed = 0.7500
goalped_MaxAnimSpeed = 1.250
Ped_AnimTagTable = {
    Ped_M_WalkTired = { MovementSpeed = 45.15 }
    Ped_M_Walk2 = { MovementSpeed = 65.40 }
    Ped_M_Walk3 = { MovementSpeed = 87.57 }
    Ped_M_Walk4 = { MovementSpeed = 121.7 }
    Ped_M_Run1 = { MovementSpeed = 168.0 }
    Ped_M_Run2 = { MovementSpeed = 221.3 }
    Ped_M_JumpForward = { MovementDist = 50.0 }
    Ped_M_JumpBack = { MovementDist = 50.0 }
    Ped_M_JumpRight = { MovementDist = 70.0 }
}
default_M_anim_assets = {
    StandToWalk = Ped_M_Walk2FromIdle
    walk = [ Ped_M_Walk2 Ped_M_WalkTired ]
    WalkToStand = Ped_M_Walk2ToIdle
    stand = [
        Ped_M_Idle1
        Ped_M_Wave
        Ped_M_LookAround
        Ped_M_ScratchChin
        Ped_M_LookLeftRight
        Ped_M_Talk_Dull
    ]
    idle = [ Ped_M_Idle1 ]
    run = Ped_M_Run1
    Turn = Ped_M_RotateLFromIdle1
    TurnLeft = [ Ped_M_TurnLeft Ped_M_TurnLeft180 ]
    TurnRight = [ Ped_M_TurnRight Ped_M_TurnRight180 ]
    Disgust = [ Ped_M_Disgust Ped_M_ShakeFist ]
    Bored = [
        Ped_M_LookAtWatch
        Ped_M_LookAtWatch2
        Ped_M_ScratchChin
        Ped_M_Talk_Shrug
        Ped_M_Talk_WhoKnows
    ]
    impressed = [
        Ped_M_Clap
        Ped_M_Cheering
        Ped_M_CheerIdle1
        Ped_M_CheerIdle2
        Ped_M_CheerIdle3
        Ped_M_CheerIdle4
        Ped_M_CheerIdle5
        Ped_M_CheerIdle6
        Ped_M_ThumbUp
    ]
    Wave = Ped_M_PlayerWave
    GetAttention = [ Ped_M_GetAttention_04 Ped_M_GetAttention_05 ]
    WhackedSet = [
        { anim = Ped_M_BoardSmackFall_02 idle = Ped_M_Falldown02Idle OutAnim = Ped_M_Falldown02GetUp }
        { anim = Ped_M_BoardSmackFall_03 idle = Ped_M_Falldown03Idle OutAnim = Ped_M_Falldown03GetUp }
    ]
    FallDownSet = [
        { anim = Ped_M_FalldownA idle = Ped_M_LayIdleA OutAnim = Ped_M_GetUpA }
        { anim = Ped_M_FalldownB idle = Ped_M_LayIdleB OutAnim = Ped_M_GetUpB }
        { anim = Ped_M_FalldownC idle = Ped_M_LayIdleC OutAnim = Ped_M_GetUpC }
        { anim = Ped_M_FalldownD idle = Ped_M_LayIdleD OutAnim = Ped_M_GetUpD }
        { anim = Ped_M_FalldownE idle = Ped_M_LayIdleE OutAnim = Ped_M_GetUpE }
    ]
    FallDown = [
        Ped_M_FalldownA
        Ped_M_FalldownB
        Ped_M_FalldownC
        Ped_M_FalldownD
        Ped_M_FalldownE
    ]
    LayIdle = [
        Ped_M_LayIdleA
        Ped_M_LayIdleB
        Ped_M_LayIdleC
        Ped_M_LayIdleD
        Ped_M_LayIdleE
    ]
    Getup = [
        Ped_M_GetUpA
        Ped_M_GetUpB
        Ped_M_GetUpC
        Ped_M_GetUpD
        Ped_M_GetUpE
    ]
    attack = [ Ped_M_Punch Ped_M_Push ]
    avoid = {
        JumpForward = Ped_M_JumpForward
        JumpBack = Ped_M_JumpBack
        JumpRight = Ped_M_JumpRight
        idle = Ped_M_Idle1
        DistForward = 50.0
        DistBack = 50.0
        DistLeft = 70.0
        DistRight = 70.0
    }
    WhackMove = {
        JumpForward = Ped_M_Falldown03
        JumpBack = Ped_M_Falldown02
        JumpRight = Ped_M_Falldown01
        idle = Ped_M_Idle1
        DistForward = 50.0
        DistBack = 50.0
        DistLeft = 70.0
        DistRight = 70.0
    }
    WhackMoveSet = [
        { idle = Ped_M_Falldown01Idle OutAnim = Ped_M_Falldown01GetUp }
        { idle = Ped_M_Falldown02Idle OutAnim = Ped_M_Falldown02GetUp }
        { idle = Ped_M_Falldown03Idle OutAnim = Ped_M_Falldown03GetUp }
    ]
    talk = [
        Ped_M_Talk2_Idle
        Ped_M_Talk2_Idle2
        Ped_M_Talk2_RightHere
        Ped_M_Talk2_MixIt
        Ped_M_Talk2_SureThing
        Ped_M_Talk2_Maybe
        Ped_M_Talk2_WhatDoYouThink
        Ped_M_Talk2_OfCourse
        Ped_M_Talk2_BackThere
        Ped_M_Talk2_RoundAndRound
        Ped_M_Talk2_UpAbove
        Ped_M_Talk2_KnowWhatIMean
        Ped_M_Talk2_GoAhead
        Ped_M_Talk2_TheyllTellYou
    ]
    wait = [ Ped_M_Talk2_Idle Ped_M_Talk2_Idle2 Ped_M_Talk2_RightHere ]
    Spectate = [
        Ped_M_Clap
        Ped_M_PlayerWave
        Ped_M_Cheer1
        Ped_M_Cheer5
        Ped_M_Cheer6
        Ped_M_Cheer7
        Ped_M_CheerIdle1
        Ped_M_CheerIdle2
        Ped_M_CheerIdle3
        Ped_M_CheerIdle4
        Ped_M_CheerIdle5
        Ped_M_CheerIdle6
        Ped_M_Cheering
        Ped_M_CheerIdleFlip
    ]
    cheer = [
        Ped_M_Clap
        Ped_M_Cheer1
        Ped_M_Cheer5
        Ped_M_Cheer6
        Ped_M_Cheer7
        Ped_M_Cheering
        Ped_M_CheerIdle1
        Ped_M_CheerIdle2
        Ped_M_CheerIdle3
        Ped_M_CheerIdle4
        Ped_M_CheerIdle5
        Ped_M_CheerIdle6
        Ped_M_CheerIdleFlip
    ]
    angry = [ Ped_M_ShakeFist Ped_M_Disgust Ped_M_Idle1 ]
}
default_M_skater_anim_assets = {
    walk = [ WalkFast WalkSlow WWalk ]
    idle = [
        WStand
        WStandIdle1
        WStandIdle2
        WStandIdle3
        WStandIdle4
        WStandIdle5
        WStandIdle6
    ]
    Bored = [ WStandIdle5 WStandIdle6 ]
    LayIdle = Ped_M_LayIdleE
    SkateIdle = [
        { anim = idle }
        { init_anim = crouch anim = CrouchIdle out_anim = CrouchIdleToIdle Cycle = 10 }
        { anim = PushIdle }
    ]
    FlipTrick = [
        FSFlip
        NollieKickflip
        VarialHeelFlip
        OllieAirWalk
        _BSBigSpin540
    ]
    GrabTrickStruct = [
        { anim = ChristAir_Init idle = ChristAir_Idle OutAnim = ChristAir_Out }
        { anim = SaranWrap idle = SaranWrap_Idle OutAnim = SaranWrap_Out }
        { anim = Benihana idle = Benihana_Idle OutAnim = Benihana_Out }
        { anim = BetweenTheLegs_In idle = BetweenTheLegs_Idle OutAnim = BetweenTheLegs_Out }
    ]
    LipTrickStruct = [
        { InitAnim = MuteInvert_Init anim = MuteInvert_Range OutAnim = MuteInvert_Out }
        { InitAnim = Switcheroo_Init anim = Switcheroo_Range OutAnim = Switcheroo_Out }
        { InitAnim = Disaster_Init anim = Disaster_Range OutAnim = Disaster_Out }
        { InitAnim = FakieRockAndRoll_Init anim = FakieRockAndRoll_Range OutAnim = FakieRockAndRoll_Out }
        { InitAnim = GymnastPlant_Init anim = GymnastPlant_Range OutAnim = GymnastPlant_Out }
    ]
    GrindStruct = [
        { TrickScript = Trick_Boardslide_BS }
        { TrickScript = Trick_5050_BS }
        { TrickScript = Trick_Crooked_FS }
        { TrickScript = Trick_Overcrook_FS }
        { TrickScript = Trick_Smith_FS }
        { TrickScript = Trick_Smith_BS }
        { TrickScript = Trick_Feeble_FS }
        { TrickScript = Trick_NoseGrind_FS }
        { TrickScript = Trick_5_0_FS }
    ]
    BailDefault = FaceFall
    BailGetupDefault = GetUpFaceSmash
    Air = AirIdle
    braking = [
        NewBrakeIdle
        NewBrakeIdle
        NewBrakeIdle
        NewBrakeIdle
        NewBrakeIdle
        NewBrakeIdle
        NewBrakeIdle
        NewBrakeIdle2
        NewBrakeIdle3
        NewBrakeIdle4
        NewBrakeIdle5
        NewBrakeIdle6
        NewBrakeIdle7
        NewBrakeIdle8
    ]
    ollie = ollie
    land = land
    crouch = crouch
    CrouchIdle = CrouchIdle
    CrouchedLand = [ CrouchedLandTurn4 CrouchedLandTurn5 ]
    ManualStruct = {
        Manual = { manual_out_anim = PutDownManual init_anim = Manual range_anim = Manual_Range }
        Handstand = { manual_out_anim = RustySlide_Out init_anim = RustySlide_Init range_anim = Primo_Range }
        default = { manual_out_anim = PutDownManual init_anim = Manual range_anim = Manual_Range }
    }
}
blocker_anim_assets = {
    ShuffleLeft = Ped_Blocker_ShuffleBlockLeft
    ShuffleRight = Ped_Blocker_ShuffleBlockRight
    idleanims = [ Ped_Blocker_idle Ped_Blocker_BlockA_idle ]
}
bum_anim_assets = {
    StandToWalk = Ped_M_Walk2FromIdle
    walk = [ Ped_M_Walk2 Ped_M_WalkTired Ped_M_DrunkWalk ]
    WalkToStand = Ped_M_Walk2ToIdle
    stand = [ Ped_Bum_Stand_Idle_01 Ped_Bum_Stand_Idle_02 ]
    Stand_special = [ Ped_Bum_Stand_Beg Ped_Bum_Stand_HitHead Ped_Bum_Stand_wNose ]
    SitToStand = Ped_Bum_Sit2Stand
    SitToSleep = Ped_Bum_Sit2Sleep
    StandToSit = Ped_Bum_Stand2Sit
    SleepToSit = Ped_Bum_Sleep2Sit
    sitting = [ Ped_Bum_Sit_Idle_01 Ped_Bum_Sit_Idle_02 Ped_Bum_Sit_Idle_03 ]
    Sitting_special = [ Ped_Bum_Sit_Sneeze Ped_Bum_Sit_ScratchLeg Ped_Bum_Sit_HeadSmack ]
    sleeping = Ped_Bum_Sleep_Idle_01
    Sleeping_special = Ped_Bum_Sleep_Scratch
}
chick_anim_assets = {
    WalkToIdle = Ped_F_Walk2Idle
    IdleToWalk = Ped_F_Idle2Walk
    IdleToStand = Ped_F_ShiftWeight
    StandToIdle = Ped_F_ShiftWeight2Idle
    walk = [ Ped_F_Walk ]
    idle = [ Ped_F_Idle04 ]
    stand = [ Ped_F_Idle05 ]
    Stand_special = [ Ped_F_Idle05 Ped_F_Idle05a Ped_F_Idle05Looking ]
}
MexGraffiti_anim_assets = {
    stand = [ Ped_M_Idle1 Ped_M_Talk2_RoundAndRound ]
}

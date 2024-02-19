server_projectile_composite_structure = [
    { Component = motion }
    { Component = velocity }
    { Component = Suspend }
    { Component = collideanddie }
    { Component = projectiletracker }
    { Component = rigidbody }
    { Component = sound projectile_type = generic }
]
net_server_projectile_composite_structure = [
    { Component = motion }
    { Component = velocity }
    { Component = Suspend }
    { Component = collideanddie }
    { Component = projectiletracker }
    { Component = rigidbody }
    { Component = sound }
    { Component = projectilecollision projectile_type = generic }
]
client_projectile_composite_structure = [
    { Component = motion }
    { Component = velocity }
    { Component = Suspend }
    { Component = collideanddie }
    { Component = projectiletracker }
    { Component = rigidbody }
    { Component = sound }
    { Component = projectilecollision projectile_type = generic }
]
projectile_board_components = [
    { Component = motion }
    { Component = velocity }
    { Component = Suspend }
    {
        Component = rigidbody
        coeff_friction = 0.7000
        coeff_restitution = 0.01000
        const_acc = -400
        mass_over_moment = 0.007000
        center_of_mass = (0.0, 0.0, 0.0)
        spring_const = 10
        linear_velocity_sleep_point = 1
        angular_velocity_sleep_point = 10
        skater_collision_radius = 2
        skater_collision_application_radius = 1
        skater_collision_impulse_factor = 1.0
        contacts = [
            (6.0, 7.0, 18.0)
            (6.0, 7.0, -18.0)
            (-6.0, 7.0, 18.0)
            (-6.0, 7.0, -18.0)
            (6.0, 0.0, 13.0)
            (6.0, 0.0, -13.0)
            (-6.0, 0.0, 13.0)
            (-6.0, 0.0, -13.0)
        ]
        directed_friction = [
            { None }
            { None }
            { None }
            { None }
            { (1.0, 0.0, 0.0) }
            { (1.0, 0.0, 0.0) }
            { (1.0, 0.0, 0.0) }
            { (1.0, 0.0, 0.0) }
        ]
        SoundType = SkaterBoardWhenBail
    }
    { Component = skeleton SkeletonName = thps7_human }
    { Component = Model usemodellights Model = 'board_default/board_default.mdl' }
    { Component = ModelLightUpdate }
    { Component = sound }
    { Component = projectilecollision projectile_type = generic }
    { Component = projectiletracker }
    {
        Component = shadow
        ShadowType = volume
        ShadowVolumeModels = [ 'Models\volume_shadows\volume_board_shadow.shd' ]
    }
]
last_projectile_id = 0

script kill_last_projectile 
    id = (last_projectile_id)
    if IsCreated <id>
        <id> ::Die
    endif
endscript

script kill_all_projectiles 
    index = 0
    begin 
    if (<index> = 10)
        return 
    endif
    FormatText checksumname = name 'projectile_%i' i = <index>
    if ObjectExists id = <name>
        <name> ::Die
    endif
    index = (<index> + 1)
    repeat 
endscript

script ClientLaunchBoard 
    obj_getid
    if NOT GetPlayerAppearancePart player = <ObjID> part = board
        return 
    endif
    SetAmmoType board
    index = 5
    begin 
    FormatText checksumname = name 'projectile_%i' i = <index>
    if NOT ObjectExists id = <name>
        break 
    endif
    if (<index> = 9)
        GetNextBoardToDestroyAndIncrement
        FormatText checksumname = name 'projectile_%i' i = <board_to_destroy>
        break 
    endif
    index = (<index> + 1)
    repeat 
    if IsCreated <name>
        <name> ::Die
    endif
    change last_projectile_id = <name>
    SwitchOffBoard
    if IsLocalSkater
        SetBoardMissing
        SetWalkingGroundTricks
    endif
    TheParams = {
        owner_id = <owner_id>
        Radius = 24
        name = <name>
        systemLifetime = 1
        neversuspend
        CloneFrom = <ObjID>
        geoms = [ board ]
    }
    skeleton_spawncompositeobject {
        bone = Bone_Board_Root
        Offset = (0.0, -3.0, 2.0)
        Components = projectile_board_components
        params = <TheParams>
        vel = <vel>
        rotvel = (0.0, 0.0, 0.0)
        object_vel_factor = 0
        adjust_vel = adjust_vel
    }
    if IsCreated <name>
        <name> ::rigidbody_ignoreskater 15 frames
        <name> ::rigidbody_wake
    endif
endscript
scope_projectile_velocity = 1000

script projectile_hit_ped 
    if NOT skating
        if NOT currentscorepotgreaterthan 0
            RunTimer_ComboStarted
            obj_spawnscriptlater wait_and_unpause_run_timer
        endif
    endif
    if NOT currentscorepotgreaterthan 0
        no_combo = 1
    endif
    SetTrickScore 500
    SetTrickName 'Mam ciê!'
    display
    if GotParam no_combo
        if NOT DoingTrick
            ClearPanel_Landed
        endif
    endif
    change projectile_last_ped_id = <ped_id>
    broadcastevent type = PedHitByProjectile
    if GotParam projectile_id
        if IsCreated <projectile_id>
            <projectile_id> ::Die
        endif
    endif
endscript

script projectile_die 
    Die
endscript

script hit_ped_script 
    projectile_hit_ped_sounds
    if GotParam \{ ammo_type }
        obj_spawnscriptlater projectile_splat_particles params = { <...>  }
    endif
endscript

script projectile_splat_particles 
    if LevelIs load_tr
        return 
    endif
    bone = (target_bone)
    switch <ammo_type>
        case apple
        params_script = {apm_BO_applesplatta01_fast_particle_params bone = <bone>}
        params_script2 = {apm_BO_applesplatta02_fast_particle_params bone = <bone>}
        case beads
        return 
        case shrimp
        params_script = {JOW_AU_ShrimpSplat01_fast_particle_params bone = <bone>}
        case smokebomb
        params_script = {JOW_ST_SmokeBomb01_fast_particle_params bone = <bone>}
        color1 = Random (@ [ 112 64 24 72 ] @ [ 24 112 64 72 ] @ [ 64 24 112 72 ])
        color1_endAlpha = 0
        params_script2 = {JOW_ST_SmokeBomb02_fast_particle_params bone = <bone>}
        case tomato
        params_script = {apm_BA_Tomatosplatta01_fast_particle_params bone = <bone>}
        params_script2 = {apm_BA_Tomatosplatta02_fast_particle_params bone = <bone>}
        case paintcan
        params_script = {apm_spraycan01_fast_particle_params bone = <bone>}
        color1 = Random (@ [ 128 32 32 128 ] @ [ 32 128 32 128 ] @ [ 32 32 128 128 ])
        params_script2 = {apm_spraycan02_fast_particle_params bone = <bone>}
        params_script3 = {apm_spraycan03_fast_particle_params bone = <bone>}
        case waterballoon
        params_script = {APM_SM_Waterhit02_fast_particle_params bone = <bone>}
        params_script2 = {APM_SM_Waterhit_fast_particle_params bone = <bone>}
        default 
        return 
    endswitch
    time = (<params_script>.lifetime)
    obj_getid
    if NOT (<ObjID> = 0)
        GetUniqueMangledId id = proj_part_id1 ObjID = <ObjID>
        proj_part1 = <uniqueid>
        CreateFastParticleSystem {
            name = <proj_part1>
            params_script = <params_script>
            attachobjid = <ObjID>
        }
        if GotParam params_script2
            GetUniqueMangledId id = proj_part_id2 ObjID = <ObjID>
            proj_part2 = <uniqueid>
            CreateFastParticleSystem {
                name = <proj_part2>
                params_script = <params_script2>
                attachobjid = <ObjID>
            }
        endif
        if GotParam params_script3
            GetUniqueMangledId id = proj_part_id3 ObjID = <ObjID>
            proj_part3 = <uniqueid>
            CreateFastParticleSystem {
                name = <proj_part3>
                params_script = <params_script3>
                attachobjid = <ObjID>
            }
        endif
        if GotParam color1
            MangleChecksums a = <proj_part1> b = <ObjID>
            if CompositeObjectExists name = <mangled_id>
                <mangled_id> ::setStartColor <color1>
                if GotParam color1_endAlpha
                    SetArrayElement arrayName = color1 index = 3 newValue = <color1_endAlpha>
                    <mangled_id> ::setEndColor <color1>
                endif
            endif
        endif
        wait <time> seconds
        MangleChecksums a = <proj_part1> b = <ObjID>
        if CompositeObjectExists name = <mangled_id>
            <mangled_id> ::Die
        endif
        if GotParam params_script2
            MangleChecksums a = <proj_part2> b = <ObjID>
            if CompositeObjectExists name = <mangled_id>
                <mangled_id> ::Die
            endif
        endif
        if GotParam params_script3
            MangleChecksums a = <proj_part3> b = <ObjID>
            if CompositeObjectExists name = <mangled_id>
                <mangled_id> ::Die
            endif
        endif
    endif
endscript

script GetUniqueMangledId 
    begin 
    MangleChecksums a = <id> b = <ObjID>
    if NOT ObjectExists id = <mangled_id>
        break 
    endif
    id = (<id> + 1)
    repeat 
    return uniqueid = <id>
endscript

script wait_and_unpause_run_timer 
    wait \{ 1 gameframes }
    RunTimer_unpause
endscript
projectile_last_ped_id = 0

script give_skater_ammo num = 5 type = None
    printf 'give_skater_ammo'
    obj_spawnscriptlater SK6_SFX_Get_Throwing_Item
    GetAmmo
    GetAmmoType
    if IsSkaterOnVehicle
        get_ammo_text type = <type>
        FormatText textname = text 'Nie mo¿esz nosiæ na tym %a!' a = <ammo_text>
        create_console_message text = <text> rgba = [ 8 73 123 90 ] wait_and_die = 1 time = 3
        return 
    endif
    need_new_meter = 0
    if NOT ChecksumEquals a = <type> b = <ammo_type>
        need_new_meter = 1
        root_window ::getsingletag menu_state
        if (<menu_state> = Off)
            get_ammo_text type = <type>
            FormatText textname = text '\c4Masz %i %a!' i = <num> a = <ammo_text>
            create_panel_message {
                id = new_ammo_message
                text = <text>
                rgba = [ 128 128 128 128 ]
                Pos = (320.0, 180.0)
                style = new_ammo_message_up
            }
            create_panel_message {
                id = new_ammo_message2
                text = '\c4Wcinij \c0\m3\c4 by rzuciæ'
                rgba = [ 128 128 128 128 ]
                style = new_ammo_message_up
                Pos = (320.0, 215.0)
            }
        endif
    endif
    if (<Ammo> = 0)
        need_new_meter = 1
    endif
    if (<need_new_meter> = 1)
        create_ammo_meter type = <type>
    endif
    if (<num> > <Ammo>)
        SetAmmoType <type>
        get_ammo_text type = <type>
        if (<Ammo> = 0)
            FormatText textname = text 'Masz %i %a!' i = <num> a = <ammo_text>
        else
            FormatText textname = text 'Zdobywasz o %i wiêcej ni¿ %a!' i = (<num> - <Ammo>)a = <ammo_text>
        endif
        SetAmmo <num>
        broadcastevent type = SkaterGotAmmo
        create_console_message text = <text> rgba = [ 0 70 0 100 ] wait_and_die = 1 time = 3
    else
        GetAmmoType
        get_ammo_text type = <ammo_type>
        FormatText textname = text 'Ju¿ masz %i %a!' i = <Ammo> a = <ammo_text>
        create_console_message text = <text> rgba = [ 8 73 123 90 ] wait_and_die = 1 time = 3
    endif
endscript

script get_ammo_text 
    switch <type>
        case apple
        ammo_text = 'jab³ka'
        case beads
        ammo_text = 'korale'
        case shrimp
        ammo_text = 'krewetki'
        case smokebomb
        ammo_text = 'Bombê dymn¹'
        case tomato
        ammo_text = 'pomidory'
        case paintcan
        ammo_text = 'puszki farby'
        default 
        ammo_text = 'amunicjê'
    endswitch
    return ammo_text = <ammo_text>
endscript
target_bone = Bone_Chest

script choose_projectile_target_bone 
    change target_bone = Random (@ Bone_Chest @ Bone_Pelvis @ Bone_Head @ Bone_Bicep_L @ Bone_Bicep_R)
endscript

script skate_throw_projectile 
    if Skater_AnimEquals NoProjectileAnims
        return 
    endif
    if IsInBail
        return 
    endif
    if IsInRevert
        return 
    endif
    GetAmmo
    if (<Ammo> > 0)
        Ammo = (<Ammo> - 1)
        SetAmmo <Ammo>
        obj_killspawnedscript name = ammo_meter_change
        obj_spawnscriptlater ammo_meter_change params = { count = -1 }
        if (<Ammo> = 0)
            text = 'Koniec amunicji!'
            SpawnSound SK6_SFX_OutOfAmmoBuzzer
            broadcastevent type = SkaterOutOfAmmo
            create_console_message text = <text> rgba = [ 70 0 0 70 ] wait_and_die = 1 time = 3
        endif
        MakeSkaterGoto throw_while_skating
    else
        if InAir
            MakeSkaterGoto Airborne
        else
            MakeSkaterGoto ongroundai
        endif
    endif
endscript

script throw_while_skating \{ anim = Throw_Sidearm_Partial }
    SetThrowingProjectile
    Skater_PlayThrowAnim anim = <anim>
    obj_spawnscriptlater \{throw_projectile params = { frames = 15 }}
    obj_spawnscriptlater \{ throw_while_walking_exit }
    if InAir
        MakeSkaterGoto \{ Airborne }
    else
        MakeSkaterGoto \{ ongroundai }
    endif
endscript
NoProjectileAnims = [
    _1990Invert_init
    _1990Invert_range
    _1990Invert_out
    HeelflipFSInvert_Init
    HeelflipFSInvert_Range
    HeelflipFSInvert_Out
    AndrectInvert_Init
    AndrectInvert_Range
    AndrectInvert_Out
    OneFootInvert_Init
    OneFootInvert_Range
    OneFootInvert_Out
    Invert_Init
    Invert_Range
    Invert_Out
    GymnastPlant_Init
    GymnastPlant_Range
    GymnastPlant_Out
    MuteInvert_Init
    MuteInvert_Range
    MuteInvert_Out
    HandstandHandFlip_Init
    HandstandHandFlip_Range
    HandstandHandFlip_Out
    HandStandCasper_Init
    HandStandCasper_Range
    HandStandCasper_Out
    HStandFliptoHstand
    HandstandHandFlip_Range
    HandstandHandFlip_Out
]

script throw_projectile \{ frames = 0 }
    wait <frames> frames
    obj_spawnscriptlater \{ ALL_Levels_SFX_PlayThrowingSound }
    LaunchDirtyProjectile board = <board> board_vel = <board_vel>
endscript

script throw_while_walking_exit 
    OnExitRun \{ throw_while_walking_cleanup }
    Skater_WaitThrowAnimFinished
    Walk_EndGroundTrick
endscript

script throw_while_walking_cleanup 
    UnsetThrowingProjectile
    Skater_ThrowAnimOff
    Walk_EndGroundTrick
endscript

script throw_board_while_walking 
    if IsBoardMissing
        goto get_new_board
    endif
    count = 0
    begin 
    if NOT Held square
        break 
    endif
    if (<count> > 10)
        break 
    endif
    count = (<count> + 1)
    wait 1 gameframe
    repeat 
    if (<count> < 10)
        board_vel = 0
    else
        board_vel = 200
    endif
    getspeed
    SetThrowingProjectile
    if NOT Walk_Air
        if (1 > <Speed>)
            standing = 1
        endif
    endif
    obj_spawnscriptlater throw_projectile params = {frames = 17 board = board board_vel = <board_vel>}
    if GotParam standing
        if (<board_vel> = 0)
            MakeSkaterGoto BoardDropStanding
        else
            MakeSkaterGoto BoardThrowStanding
        endif
    else
        if (<board_vel> = 0)
            MakeSkaterGoto BoardDropRunning
        else
            MakeSkaterGoto BoardThrowRunning
        endif
    endif
endscript
BoardThrowRunning_ExceptionTable = [
    {
        exception
        Ex = stand
        scr = BoardThrowStanding
        params = { synctopreviousanim }
    }
    {
        exception
        Ex = skid
        scr = BoardThrowStanding
        params = { synctopreviousanim }
    }
    { exception Ex = WalkOffEdge scr = AirState }
]

script BoardThrowRunning 
    ResetEventHandlersFromTable \{ BoardThrowRunning_ExceptionTable group = WalkingStateExceptions }
    OnExitRun \{ board_throw_cleanup }
    OnExceptionRun \{ board_throw_exit }
    norailtricks
    if GotParam \{ synctopreviousanim }
        from = current
    endif
    Skater_Playanim anim = THPS7_BoardThrow_Run from = <from> Speed = <Speed> BlendPeriod = <BlendPeriod>
    Skater_WaitAnimFinished
    SetWalkingGroundTricks
    UnsetThrowingProjectile
    Walk_EndGroundTrick
    MakeSkaterGoto \{ RunState }
endscript
BoardThrowStanding_ExceptionTable = [
    {
        exception
        Ex = run
        scr = BoardThrowRunning
        params = { synctopreviousanim }
    }
    { exception Ex = WalkOffEdge scr = AirState }
]

script BoardThrowStanding 
    ResetEventHandlersFromTable \{ BoardThrowStanding_ExceptionTable group = WalkingStateExceptions }
    OnExitRun \{ board_throw_cleanup }
    OnExceptionRun \{ board_throw_exit }
    norailtricks
    if GotParam \{ synctopreviousanim }
        from = current
    endif
    Skater_Playanim anim = THPS7_BoardThrow_Stand from = <from> Speed = <Speed> BlendPeriod = <BlendPeriod>
    Skater_WaitAnimFinished
    SetWalkingGroundTricks
    UnsetThrowingProjectile
    Walk_EndGroundTrick
    MakeSkaterGoto \{ StandState }
endscript
BoardDropRunning_ExceptionTable = [
    {
        exception
        Ex = stand
        scr = BoardDropStanding
        params = { synctopreviousanim }
    }
    {
        exception
        Ex = skid
        scr = BoardDropStanding
        params = { synctopreviousanim }
    }
    { exception Ex = WalkOffEdge scr = AirState }
]

script BoardDropRunning 
    ResetEventHandlersFromTable \{ BoardDropRunning_ExceptionTable group = WalkingStateExceptions }
    OnExitRun \{ board_throw_cleanup }
    OnExceptionRun \{ board_throw_exit }
    norailtricks
    if GotParam \{ synctopreviousanim }
        from = current
    endif
    Skater_Playanim anim = THPS7_BoardDrop_Run from = <from> Speed = <Speed> BlendPeriod = <BlendPeriod>
    Skater_WaitAnimFinished
    SetWalkingGroundTricks
    UnsetThrowingProjectile
    Walk_EndGroundTrick
    MakeSkaterGoto \{ RunState }
endscript
BoardDropStanding_ExceptionTable = [
    {
        exception
        Ex = run
        scr = BoardDropRunning
        params = { synctopreviousanim }
    }
    { exception Ex = WalkOffEdge scr = AirState }
]

script BoardDropStanding 
    ResetEventHandlersFromTable \{ BoardDropStanding_ExceptionTable group = WalkingStateExceptions }
    OnExitRun \{ board_throw_cleanup }
    OnExceptionRun \{ board_throw_exit }
    norailtricks
    if GotParam \{ synctopreviousanim }
        from = current
    endif
    Skater_Playanim anim = THPS7_BoardDrop_Stand from = <from> Speed = <Speed> BlendPeriod = <BlendPeriod>
    Skater_WaitAnimFinished
    SetWalkingGroundTricks
    UnsetThrowingProjectile
    Walk_EndGroundTrick
    MakeSkaterGoto \{ StandState }
endscript

script board_throw_cleanup 
    UnsetThrowingProjectile
    allowrailtricks
endscript

script board_throw_exit 
    SetBoardMissing
    allowrailtricks
endscript

script get_new_board 
    getspeed
    if NOT Walk_Air
        if (1 > <Speed>)
            standing = 1
        endif
    endif
    Walk_StartGroundTrick
    if GotParam \{ standing }
        MakeSkaterGoto \{ CatchBoardStanding }
    else
        MakeSkaterGoto \{ CatchBoardRunning }
    endif
endscript
CatchBoardRunning_ExceptionTable = [
    {
        exception
        Ex = stand
        scr = CatchBoardStanding
        params = { synctopreviousanim }
    }
    {
        exception
        Ex = skid
        scr = CatchBoardStanding
        params = { synctopreviousanim }
    }
    { exception Ex = WalkOffEdge scr = AirState }
]

script CatchBoardRunning 
    ResetEventHandlersFromTable \{ CatchBoardRunning_ExceptionTable group = WalkingStateExceptions }
    if GotParam \{ synctopreviousanim }
        from = current
    endif
    Skater_Playanim anim = THPS7_BoardCatch_Run from = <from> Speed = <Speed> BlendPeriod = <BlendPeriod>
    Skater_WaitAnim \{ percent = 40 }
    UnsetBoardMissing
    SwitchOnBoard
    SetWalkingGroundTricks
    Skater_WaitAnimFinished
    SetWalkingGroundTricks
    Walk_EndGroundTrick
    MakeSkaterGoto \{ RunState }
endscript
CatchBoardStanding_ExceptionTable = [
    {
        exception
        Ex = run
        scr = CatchBoardRunning
        params = { synctopreviousanim }
    }
    { exception Ex = WalkOffEdge scr = AirState }
]

script CatchBoardStanding 
    ResetEventHandlersFromTable \{ CatchBoardStanding_ExceptionTable group = WalkingStateExceptions }
    if GotParam \{ synctopreviousanim }
        from = current
    endif
    Skater_Playanim anim = THPS7_BoardCatch_Stand from = <from> Speed = <Speed> BlendPeriod = <BlendPeriod>
    Skater_WaitAnim \{ percent = 40 }
    UnsetBoardMissing
    SwitchOnBoard
    SetWalkingGroundTricks
    Skater_WaitAnimFinished
    SetWalkingGroundTricks
    Walk_EndGroundTrick
    MakeSkaterGoto \{ StandState }
endscript
server_fireball_composite_structure = [
    { Component = velocity }
    { Component = Suspend }
    { Component = projectilecollision projectile_type = fireball }
    { Component = collideanddie }
    { Component = particle }
]

script fireball_death 
    index = 0
    begin 
    FormatText checksumname = name 'explosion_%i' i = <index>
    if NOT ObjectExists id = <name>
        break 
    endif
    index = (<index> + 1)
    repeat 
    CreateCompositeObject {
        Components = explosion_composite_structure
        params = {
            name = <name>
            Pos = <Pos>
            vel = <vel>
            orient_to_vel
            Scale = <Scale>
            LocalSpace
            usestartposition
            NoName
            systemLifetime = 400
            neversuspend
            startposition = (0.0, 0.0, -50.0)
            BoxDimsStart = (20.220462799072266, 20.220462799072266, 20.220462799072266)
            MidPosition = (0.6540930271148682, -0.7677080035209656, 0.4177429974079132)
            BoxDimsMid = (74.37434387207031, 74.37434387207031, 74.37434387207031)
            EndPosition = (-0.9472929835319519, -0.8341410160064697, -0.782787024974823)
            BoxDimsEnd = (227.08786010742188, 227.08786010742188, 227.08786010742188)
            texture = dt_nj_flame02
            createdatstart
            absentinnetgames
            UseMidPoint
            UseColorMidTime
            type = NewFlat
            BlendMode = Add
            FixedAlpha = 128
            alphacutoff = 0
            maxstreams = 2
            suspenddistance = 0
            lod_dist1 = 400
            lod_dist2 = 401
            emitrate = 30.0
            lifetime = 0.3000
            MidPointPCT = 50
            startradius = 20.0
            MidRadius = 100.0
            endradius = 6.0
            StartRadiusSpread = 0.0
            MidRadiusSpread = 0.0
            EndRadiusSpread = 10.0
            startRGB = [255 , 111 , 54]
            startAlpha = 129
            ColorMidTime = 50
            midRGB = [135 , 35 , 0]
            midAlpha = 133
            endRGB = [0 , 0 , 0]
            endAlpha = 51
        }
    }
endscript

script LaunchFireball vel_scale = 1.0
    if (#"0x67a7a294" = 0)
        if NOT GameModeEquals is_firefight
            return 
        endif
    endif
    GetFireballLevel
    point_scale = 3
    switch <level>
        case 1
        point_scale = 1
        case 2
        point_scale = 5
        case 3
        point_scale = 25
        case 4
        point_scale = 100
        case 5
        point_scale = 250
    endswitch
    GetSkaterPosition
    scaled_vel = (<vel_scale> * 5000.0)
    GetSkaterVelocity Scale = <scaled_vel> <...> 
    if currentscorepotgreaterthan (20000 * <point_scale>)
        Radius = 400
        Scale = 10.0
    else
        if currentscorepotgreaterthan (10000 * <point_scale>)
            Radius = 200
            Scale = 5.0
        else
            if currentscorepotgreaterthan (5000 * <point_scale>)
                Radius = 100
                Scale = 3.500
            else
                if currentscorepotgreaterthan (2500 * <point_scale>)
                    Radius = 75
                    Scale = 2.500
                else
                    if currentscorepotgreaterthan (750 * <point_scale>)
                        Radius = 60
                        Scale = 2.0
                    else
                        if currentscorepotgreaterthan (250 * <point_scale>)
                            Radius = 45
                            Scale = 1.500
                        else
                            Radius = 24
                            Scale = 1.0
                        endif
                    endif
                endif
            endif
        endif
    endif
    new_y = (<y>)
    <y> = <new_y>
    GetCurrentSkaterId
    if InNetGame
        BroadcastProjectile ObjID = <ObjID> type = fireball Scale = <Scale> Radius = <Radius> Pos = (<x> * (1.0, 0.0, 0.0) + <new_y> * (0.0, 1.0, 0.0) + <z> * (0.0, 0.0, 1.0))vel = (<scaled_x> * (1.0, 0.0, 0.0) + <scaled_y> * (0.0, 1.0, 0.0) + <scaled_z> * (0.0, 0.0, 1.0))
    endif
    clientlaunchfireball owner_id = <ObjID> <...> 
endscript

script create_igc_waterballoon Pos = (-12935.0, 0.0, 15298.0) vel = (0.0, 0.0, 0.0) Scale = 1
    CreateCompositeObject {
        Components = [
            { Component = motion }
            { Component = velocity }
            { Component = Suspend }
            {Component = Model Model = 'gameobjects\projectiles\waterballoon01\waterballoon01.mdl'}
        ]
        params = {
            name = igc_waterballoon
            Pos = <Pos>
            vel = <vel>
            orient_to_vel
            Scale = <Scale>
            neversuspend
        }
    }
endscript

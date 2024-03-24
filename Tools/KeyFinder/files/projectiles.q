
server_projectile_composite_structure = 
[
    { Component = motion }
    { Component = velocity }
    { Component = Suspend }
    { Component = collideanddie }
    { Component = projectiletracker }
    { Component = rigidbody }
    { Component = sound }
]
net_server_projectile_composite_structure = 
[
    { Component = motion }
    { Component = velocity }
    { Component = Suspend }
    { Component = collideanddie }
    { Component = projectiletracker }
    { Component = rigidbody }
    { Component = sound }
    {Component = projectilecollision projectile_type = generic}
]
client_projectile_composite_structure = 
[
    { Component = motion }
    { Component = velocity }
    { Component = Suspend }
    { Component = collideanddie }
    { Component = projectiletracker }
    { Component = rigidbody }
    { Component = sound }
]

script ClientLaunchProjectile 
    index = 0
    begin 
    FormatText checksumname = name 'projectile_%i' i = <index>
    if NOT ObjectExists id = <name>
        break 
    endif
    if (<index> = 4)
        return 
    endif
    index = (<index> + 1)
    repeat 
    Pos = <skater_pos>
    TheParams = {
        owner_id = <owner_id>
        Pos = <Pos>
        vel = <vel>
        orient_to_vel
        Scale = 1.0
        Radius = 24
        name = <name>
        systemLifetime = 1
        neversuspend
        death_script = projectile_die
        DieUponSettling
    }
    switch <ammo_type>
        case tomato
        Model = [{Component = Model Model = 'gameobjects\projectiles\tomato\tomato.mdl'}]
        case apple
        Model = [{Component = Model Model = 'gameobjects\projectiles\apple\apple.mdl'}]
        case beads
        Model = [{Component = Model Model = 'gameobjects\projectiles\beads\beads.mdl'}]
        case shrimp
        Model = [{Component = Model Model = 'gameobjects\projectiles\shrimp\shrimp.mdl'}]
        case smokebomb
        Model = [{Component = Model Model = 'gameobjects\projectiles\smokebomb\smokebomb.mdl'}]
        case paintcan
        Model = [{Component = Model Model = 'gameobjects\projectiles\paintcan\paintcan.mdl'}]
        default 
        Model = [{Component = Model Model = 'GameObjects\COMBO\Goal_COMBO_O\Goal_COMBO_O.mdl'}]
    endswitch
    
    if OnServer
        if InNetGame
            CreateCompositeObject {
                Components = (net_server_projectile_composite_structure + <Model>)
                params = <TheParams>
            }
        else
            CreateCompositeObject {
                Components = (server_projectile_composite_structure + <Model>)
                params = <TheParams>
            }
        endif
    else
        CreateCompositeObject {
            Components = (client_projectile_composite_structure + <Model>)
            params = <TheParams>
        }
    endif
    <name> ::rigidbody_ignoreskater 15 frames
    <name> ::rigidbody_wake
endscript


script LaunchProjectile 
    GetCurrentSkaterId
    if NOT GotParam Pos
        <ObjID> ::obj_getposition
    endif
    <ObjID> ::obj_getvelocity
    skater_pos = <Pos>
    skater_vel = <vel>
    RemoveParameter Pos
    RemoveParameter vel
    Scale = 1.0
    Radius = 24
    if GotParam ped_dist
        delta_pos = (<ped_pos> - <skater_pos>)
        vel = (<delta_pos> * 4 + <ped_dist> * (0.0, 0.15000000596046448, 0.0))
    else
        GetHeading
        z = (600 * <Sine>)
        y = 20
        x = (600 * <cosine>)
        vel = (<x> * (1.0, 0.0, 0.0) + <y> * (0.0, 1.0, 0.0) + <z> * (0.0, 0.0, 1.0) + <skater_vel>)
    endif
    GetAmmoType
    if InNetGame
        BroadcastProjectile ObjID = <ObjID> type = generic Scale = <Scale> Radius = <Radius> Pos = <skater_pos> vel = <vel> ammo_type = <ammo_type>
    endif
    ClientLaunchProjectile owner_id = <ObjID> <...> 
endscript


script projectile_hit_ped 
    if NOT skating
        if NOT currentscorepotgreaterthan 0
            RunTimer_ComboStarted
            obj_spawnscript wait_and_unpause_run_timer
        endif
    endif
    if NOT currentscorepotgreaterthan 0
        no_combo = 1
    endif
    SetTrickScore 500
    SetTrickName 'Gotcha!'
    display
    if GotParam no_combo
        if NOT DoingTrick
            ClearPanel_Landed
        endif
    endif
    change projectile_last_ped_id = <ped_id>
    broadcastevent type = PedHitByProjectile
    <projectile_id> ::Die
endscript


script projectile_die 
endscript


script hit_ped_script 
    projectile_hit_ped_sounds
    obj_spawnscript projectile_splat_particles params = { <...>  }
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
    wait 1 gameframes
    RunTimer_unpause
endscript

projectile_last_ped_id = 0

script give_skater_ammo num = 5 type = None
    
    obj_spawnscript SK6_SFX_Get_Throwing_Item
    GetAmmo
    GetAmmoType
    if IsSkaterOnVehicle
        get_ammo_text type = <type>
        FormatText textname = text 'You can\'t carry %a on that thing!' a = <ammo_text>
        create_console_message text = <text> rgba = [ 8 73 123 90 ] wait_and_die = 1 time = 3
        return 
    endif
    need_new_meter = 0
    if NOT ChecksumEquals a = <type> b = <ammo_type>
        need_new_meter = 1
        root_window ::getsingletag menu_state
        if (<menu_state> = Off)
            get_ammo_text type = <type>
            FormatText textname = text '\c4You got %i %a!' i = <num> a = <ammo_text>
            create_panel_message {
                id = new_ammo_message
                text = <text>
                rgba = [ 128 128 128 128 ]
                Pos = (320.0, 180.0)
                style = new_ammo_message_up
            }
            create_panel_message {
                id = new_ammo_message2
                text = '\c4Press \c0\m3\c4 to throw'
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
            FormatText textname = text 'You got %i %a!' i = <num> a = <ammo_text>
        else
            FormatText textname = text 'You got %i more %a!' i = (<num> - <Ammo>)a = <ammo_text>
        endif
        SetAmmo <num>
        broadcastevent type = SkaterGotAmmo
        create_console_message text = <text> rgba = [ 0 70 0 100 ] wait_and_die = 1 time = 3
    else
        GetAmmoType
        get_ammo_text type = <ammo_type>
        FormatText textname = text 'You already have %i %a!' i = <Ammo> a = <ammo_text>
        create_console_message text = <text> rgba = [ 8 73 123 90 ] wait_and_die = 1 time = 3
    endif
endscript


script get_ammo_text 
    switch <type>
        case apple
        ammo_text = 'apples'
        case beads
        ammo_text = 'beads'
        case shrimp
        ammo_text = 'shrimp'
        case smokebomb
        ammo_text = 'smokebomb'
        case tomato
        ammo_text = 'tomatos'
        case paintcan
        ammo_text = 'paint cans'
        default 
        ammo_text = 'ammo'
    endswitch
    return ammo_text = <ammo_text>
endscript

target_bone = Bone_Chest

script choose_projectile_target_bone 
    change target_bone = Random (@ Bone_Chest @ Bone_Pelvis @ Bone_Head @ Bone_Bicep_L @ Bone_Bicep_R)
endscript


script skate_maybe_throw_projectile 
    if IsSkaterOnVehicle
        return 
    endif
    if animequals NoProjectileAnims
        return 
    endif
    if IsInBail
        return 
    endif
    if IsInRevert
        
        return 
    endif
    obj_spawnscript throw_while_skating
    GetAmmo
    Ammo = (<Ammo> - 1)
    SetAmmo <Ammo>
    obj_killspawnedscript name = ammo_meter_change
    obj_spawnscript ammo_meter_change params = { count = -1 }
    if (<Ammo> = 0)
        text = 'You\'re out of ammo!'
        SpawnSound SK6_SFX_OutOfAmmoBuzzer
        broadcastevent type = SkaterOutOfAmmo
        create_console_message text = <text> rgba = [ 70 0 0 70 ] wait_and_die = 1 time = 3
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

script throw_while_skating anim = Throw_Sidearm_Partial
    if NOT skating
        goto throw_while_walking
    endif
    SetThrowingProjectile
    if IsSkaterOnVehicle
        anim = Walking_Throw_Partial
    endif
    if obj_animsubsetexists subsetid = cloth
        obj_removeanimsubset subsetid = cloth
    endif
    OnExitRun throw_while_skating_exit
    if NOT obj_animsubsetexists subsetid = Throw
        obj_addanimsubset subsetid = Throw EnableBlending stage = 2
    endif
    obj_setanimsubsetweight subsetid = Throw blendweight = 1 blendduration = 0.1000
    if Obj_AnimationFlipped
        Obj_Flip subsetid = Throw
    endif
    PlayAnim subsetid = Throw anim = <anim> Speed = 1
    obj_spawnscript throw_projectile params = { frames = 15 }
    wait 0.7000 second
    if obj_animsubsetexists subsetid = Throw
        obj_setanimsubsetweight subsetid = Throw blendweight = 0 blendduration = 0.6000
        Obj_WaitAnimFinished subsetid = Throw
    endif
endscript

projectile_control = square

script throw_while_skating_exit 
    if obj_animsubsetexists subsetid = Throw
        obj_removeanimsubset subsetid = Throw
    endif
    UnsetThrowingProjectile
endscript


script walk_maybe_throw_projectile 
    obj_spawnscript walk_maybe_throw_projectile2
endscript


script walk_maybe_throw_projectile2 
    if animfinished
        return 
    endif
    if NOT walking
        goto throw_while_skating
    endif
    MakeSkaterGoto throw_while_walking
    GetAmmo
    Ammo = (<Ammo> - 1)
    SetAmmo <Ammo>
    obj_killspawnedscript name = ammo_meter_change
    obj_spawnscript ammo_meter_change params = { count = -1 }
    if (<Ammo> = 0)
        text = 'You\'re out of ammo!'
        SpawnSound SK6_SFX_OutOfAmmoBuzzer
        broadcastevent type = SkaterOutOfAmmo
        create_console_message text = <text> rgba = [ 70 0 0 70 ] wait_and_die = 1 time = 3
    endif
endscript


script throw_projectile frames = 0
    wait <frames> frames
    obj_spawnscript ALL_Levels_SFX_PlayThrowingSound
    LaunchDirtyProjectile
endscript


script throw_while_walking 
    getspeed
    SetThrowingProjectile
    OnExitRun throw_while_walking_cleanup
    if NOT Walk_Air
        if (1 > <Speed>)
            standing = 1
        endif
    endif
    if GotParam standing
        PlayAnim anim = Standing_Throw BlendPeriod = 0.1000 Speed = 1.100
        Obj_WaitAnimFinished
    else
        if obj_animsubsetexists subsetid = Throw
            obj_removeanimsubset subsetid = Throw
        endif
        if NOT obj_animsubsetexists subsetid = Throw
            obj_addanimsubset subsetid = Throw EnableBlending stage = 2
            if Obj_AnimationFlipped
                Obj_Flip subsetid = Throw
            endif
        endif
        partial_anim = Walking_Throw_Partial
        GetAnimLength anim = <partial_anim>
        PlayAnim subsetid = Throw anim = <partial_anim> Speed = 1 BlendPeriod = 0
        obj_setanimsubsetweight subsetid = Throw blendweight = 1 blendduration = 0.1000
        obj_spawnscript throw_projectile params = { frames = 17 }
        obj_spawnscript throw_while_walking_exit params = { Length = <Length> }
        OnExitRun
    endif
    MakeSkaterGoto GroundOrAirWaitState
endscript


script throw_while_walking_exit 
    OnExitRun throw_while_walking_cleanup
    if obj_animsubsetexists subsetid = Throw
        Obj_WaitAnimFinished subsetid = Throw
    endif
endscript


script throw_while_walking_cleanup 
    if obj_animsubsetexists subsetid = Throw
        obj_removeanimsubset subsetid = Throw
    endif
    UnsetThrowingProjectile
endscript

server_fireball_composite_structure = 
[
    { Component = velocity }
    { Component = Suspend }
    {Component = projectilecollision projectile_type = fireball}
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
    if NOT GameModeEquals is_firefight
        return 
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


script clientlaunchfireball 
    if NOT GameModeEquals is_firefight
        return 
    endif
    index = 0
    begin 
    FormatText checksumname = name 'fireball_%i' i = <index>
    if NOT ObjectExists id = <name>
        break 
    endif
    index = (<index> + 1)
    repeat 
    TheParams = {owner_id = <owner_id>
        name = <name>
        Pos = (<x> * (1.0, 0.0, 0.0) + <y> * (0.0, 1.0, 0.0) + <z> * (0.0, 0.0, 1.0))
        vel = (<scaled_x> * (1.0, 0.0, 0.0) + <scaled_y> * (0.0, 1.0, 0.0) + <scaled_z> * (0.0, 0.0, 1.0))
        orient_to_vel
        Scale = <Scale>
        Radius = <Radius>
        LocalSpace
        usestartposition
        NoName
        systemLifetime = 10000
        neversuspend
        death_script = fireball_death
        startposition = (0.0, 0.0, 0.0)
        BoxDimsStart = (3.3395938873291016, 3.3395938873291016, 3.3395938873291016)
        MidPosition = (-0.10193400084972382, 2.3261380195617676, -75.07246398925781)
        BoxDimsMid = (10.16847038269043, 10.16847038269043, 10.16847038269043)
        EndPosition = (-1.1684709787368774, 1.3517390489578247, -301.16650390625)
        BoxDimsEnd = (2.507714033126831, 2.507714033126831, 2.507714033126831)
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
        lifetime = 0.7500
        MidPointPCT = 50
        startradius = 20.0
        MidRadius = 20.0
        endradius = 5.0
        StartRadiusSpread = 0.0
        MidRadiusSpread = 0.0
        EndRadiusSpread = 10.0
        startRGB = [54 , 97 , 255]
        startAlpha = 129
        ColorMidTime = 50
        midRGB = [135 , 35 , 0]
        midAlpha = 27
        endRGB = [0 , 0 , 0]
        endAlpha = 0
    }
    if OnServer
        CreateCompositeObject {
            Components = server_fireball_composite_structure
            params = <TheParams>
        }
    else
        CreateCompositeObject {
            Components = fireball_composite_structure
            params = <TheParams>
        }
    endif
    obj_playsound FlamingFireBall01 vol = (130 + <Scale> * 15)pitch = (190 - <Scale> * 7)dropoff = 140
endscript


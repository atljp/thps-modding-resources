
script PED_DBGSCRIPT_EVENT 
    if (DEBUG_PEDLOGIC = 1)
        obj_getid
        if (DEBUG_PED_OBJID = 0 || DEBUG_PED_OBJID = <ObjID>)
            printf ''
            printf '----------------------------------------------------------'
            printf '~~ EventHandler() for ID=%i' i = <ObjID>
            if GotParam params
                printf '~~~~~~ Event Params:'
                printstruct <params>
            endif
            printf '----------------------------------------------------------'
            printf ''
        endif
    endif
endscript

script PED_DBGSCRIPT_SHOWPARAMS ScriptName = unknown
    if (DEBUG_PEDLOGIC = 1)
        obj_getid
        if (DEBUG_PED_OBJID = 0 || DEBUG_PED_OBJID = <ObjID>)
            printf ''
            printf '----------------------------------------------------------'
            printf '~~ PED SCRIPT CALL (%s) for ID=%i' s = <ScriptName> i = <ObjID>
            printf '----------------------------------------------------------'
            printf '~~ Params and Ped tags:'
            gettags
            printstruct <...> 
            printf '----------------------------------------------------------'
            printf ''
        endif
    endif
endscript

script Ped_Utils_SetupHintSpeech \{hint_text = 'Wskazówka!' hint_text_time = 3 inner_radius = 8 outer_radius = 24 activation_script = ped_utils_default_hint_dialog}
    ClearEventHandler \{ anyobjectinradius }
    ClearEventHandler \{ objectoutofradius }
    obj_setinnerradius <inner_radius>
    seteventhandler Ex = anyobjectinradius scr = ped_speech_got_trigger params = { <...> activation_script_params = <...>  }
endscript

script ped_utils_default_hint_dialog 
    if ObjectExists id = <ped_id>
        <ped_id> ::Ped_SetLogicState STATE_standing
    endif
    if ObjectExists id = ped_speech_dialog
        DestroyScreenElement id = ped_speech_dialog
    endif
    UnpauseSkaters
    create_speech_box {
        anchor_id = ped_hint_dialog
        text = <hint_text>
        no_pad_choose
        no_pad_start
        bg_rgba = [ 100 100 100 128 ]
        text_rgba = [ 128 128 128 128 ]
        Pos = (320.0, 400.0)
        bg_x_scale = 1.400
        z_priority = 5
    }
    if GotParam vo
        if ObjectExists id = <ped_id>
            <ped_id> ::obj_stopstream ThisPedHintStream
            wait 1 gameframe
            if StreamExists <vo>
                if (CheckForPedStreamExistence = 1)
                    printf '##########  Good, the hint stream is there.'
                endif
                if GotParam volume
                    printf 'Have a volume parameter'
                    <ped_id> ::obj_playstream <vo> vol = <volume> priority = 101 dropoff = GlobalHintVODropoff id = ThisPedHintStream
                else
                    printf 'Don\'t have a volume parameter, using GlobalHintVOVol'
                    <ped_id> ::obj_playstream <vo> vol = GlobalHintVOVol priority = 101 dropoff = GlobalHintVODropoff id = ThisPedHintStream
                endif
            else
                ped_utils_stream_warning stream = <stream>
                if (CheckForPedStreamExistence = 1)
                    begin 
                    playsound GUI_Buzzer01 vol = 200
                    wait 0.2000 seconds
                    repeat 10
                endif
            endif
        endif
    endif
    if GotParam hint_text_script
        if ObjectExists id = <ped_id>
            <ped_id> ::obj_spawnscriptlater <hint_text_script> params = <...> 
        endif
    endif
    wait <hint_text_time> seconds
    if ObjectExists id = <ped_id>
        <ped_id> ::PedLogic_ResetEventHandlers
        <ped_id> ::PedLogic_SetDefaultState
    endif
    if ObjectExists id = ped_hint_dialog
        DestroyScreenElement id = ped_hint_dialog
    endif
endscript

script ped_utils_hint_dialog_refuse 
    if ObjectExists id = <ped_id>
        <ped_id> ::PedLogic_ResetEventHandlers
    endif
    if ObjectExists \{ id = ped_hint_dialog }
        DestroyScreenElement \{ id = ped_hint_dialog }
    endif
endscript

script ped_utils_stream_warning 
    printf '##  Missing hint ped stream \'%v\'' v = <stream>
endscript

script Ped_Utils_PlayStream 
    printf 'Warning:  Ignoring call to Ped_Utils_PlayStream'
    return 
    if GotParam type
        if Ped_GetVoicePrefix
            begin 
            <which> = RandomPermute (@ 1 @ 2 @ 3 @ 4 @ 5 @ 6 @ 7)
            switch <type>
                case shot
                FormatText checksumname = stream '%p_Shot0%w' p = <VoicePrefix> w = <which>
                FormatText textname = streams_text_name '%p_Shot0%w' p = <VoicePrefix> w = <which>
                case Whacked
                FormatText checksumname = stream '%p_Whacked0%w' p = <VoicePrefix> w = <which>
                FormatText textname = streams_text_name '%p_Whacked0%w' p = <VoicePrefix> w = <which>
                case avoid
                FormatText checksumname = stream '%p_Avoid0%w' p = <VoicePrefix> w = <which>
                FormatText textname = streams_text_name '%p_Avoid0%w' p = <VoicePrefix> w = <which>
                case far
                FormatText checksumname = stream '%p_Far0%w' p = <VoicePrefix> w = <which>
                FormatText textname = streams_text_name '%p_Far0%w' p = <VoicePrefix> w = <which>
                case trickbail
                FormatText checksumname = stream '%p_TrickBail0%w' p = <VoicePrefix> w = <which>
                FormatText textname = streams_text_name '%p_TrickBail0%w' p = <VoicePrefix> w = <which>
                case trickpositive
                FormatText checksumname = stream '%p_TrickPositive0%w' p = <VoicePrefix> w = <which>
                FormatText textname = streams_text_name '%p_TrickPositive0%w' p = <VoicePrefix> w = <which>
            endswitch
            if NOT StreamExists <stream>
            else
                break 
            endif
            wait 0.001000 seconds
            repeat 7
            if NOT StreamExists <stream>
                ped_utils_stream_warning stream = <streams_text_name>
                if (CheckForPedStreamExistence = 1)
                    begin 
                    playsound GUI_Buzzer01 vol = 200
                    wait 0.2000 seconds
                    repeat 10
                endif
            else
                if (CheckForPedStreamExistence = 1)
                    printf '######  Good, the ped\'s far, avoid, trickpositive,'
                    printf '######  or trickbail stream is there.'
                    printf '######  Stream\'s name = %s' s = <streams_text_name>
                endif
                switch <type>
                    case shot
                    if (CheckForPedStreamExistence = 1)
                        printf '######  Playing a SHOT line'
                    endif
                    obj_stopstream InGamePedObjStreamLine
                    obj_stopstream ThisPedHintStream
                    RandomNoRepeat (
                        @*4 
                        @ obj_playstream <stream> vol = GlobalShotVOVol dropoff = GlobalShotVODropoff id = InGamePedObjStreamLine priority = StreamPriorityLowMid
                    )
                    case Whacked
                    if (CheckForPedStreamExistence = 1)
                        printf '######  Playing a WHACKED line'
                    endif
                    obj_stopstream InGamePedObjStreamLine
                    obj_stopstream ThisPedHintStream
                    RandomNoRepeat (
                        @*4 
                        @ obj_playstream <stream> vol = GlobalWhackedVOVol dropoff = GlobalWhackedVODropoff id = InGamePedObjStreamLine priority = StreamPriorityLowMid
                    )
                    case avoid
                    if (CheckForPedStreamExistence = 1)
                        printf '######  Playing an AVOID line'
                    endif
                    obj_stopstream InGamePedObjStreamLine
                    obj_stopstream ThisPedHintStream
                    RandomNoRepeat (
                        @*4 
                        @ obj_playstream <stream> vol = GlobalAvoidVOVol dropoff = GlobalAvoidVODropoff id = InGamePedObjStreamLine priority = StreamPriorityLowMid
                    )
                    case far
                    if (CheckForPedStreamExistence = 1)
                        printf '######  Playing a FAR line'
                    endif
                    if NOT IsStreamPlaying ThisPedHintStream
                        if NOT IsStreamPlaying InGamePedObjStreamLine
                            obj_playstream <stream> vol = GlobalFarVOVol dropoff = GlobalFarVODropoff id = InGamePedObjStreamLine priority = StreamPriorityLow
                        endif
                    endif
                    case trickbail
                    if (CheckForPedStreamExistence = 1)
                        printf '######  Playing a TRICK BAIL line'
                    endif
                    if NOT IsStreamPlaying ThisPedHintStream
                        obj_stopstream InGamePedObjStreamLine
                        obj_playstream <stream> vol = GlobalTrickBailVOVol dropoff = GlobalTrickBailVODropoff id = InGamePedObjStreamLine priority = StreamPriorityLowMid
                    endif
                    case trickpositive
                    if (CheckForPedStreamExistence = 1)
                        printf '######  Playing a TRICK POSITIVE line'
                    endif
                    if NOT IsStreamPlaying ThisPedHintStream
                        obj_stopstream InGamePedObjStreamLine
                        obj_playstream <stream> vol = GlobalTrickPositiveVOVol dropoff = GlobalTrickPositiveVODropoff id = InGamePedObjStreamLine priority = StreamPriorityLowMid
                    endif
                endswitch
            endif
        endif
    else
        if NOT GotParam name
            script_assert 'Missing <name> param'
        endif
        getsingletag VO_Types
        if NOT GotParam VO_Types
            AddParams default_M_audio_assets
        endif
        if GotParam VO_Types
            if StructureContains <name> structure = <VO_Types>
                if IsArray (<VO_Types>.<name>)
                    if GotParam index
                        obj_playstream (<VO_Types>.<name> [ <index> ])vol = 200
                    else
                        GetRandomArrayElement (<VO_Types>.<name>)
                        obj_playstream (<element>)vol = 200
                    endif
                else
                    obj_playstream (<VO_Types>.<name>)vol = 200
                endif
            endif
        endif
    endif
endscript

script PedLogic_ResetEventHandlers 
    settags pissed = 0
    if getsingletag collision_mode
        switch <collision_mode>
            case fall
            obj_setinneravoidradius 4
            seteventhandler {
                Ex = objectinavoidradius
                scr = PedLogic_EventHandler params = {setstate = STATE_fall event = objectinavoidradius}
            }
            case knock
            obj_setinneravoidradius 2
            seteventhandler {
                Ex = objectinavoidradius
                scr = PedLogic_EventHandler params = {setstate = STATE_knockdown event = objectinavoidradius}
            }
            case avoid
            obj_setinneravoidradius 8
            seteventhandler {
                Ex = objectinavoidradius
                scr = PedLogic_EventHandler params = {setstate = STATE_avoidstop event = objectinavoidradius}
            }
            case bump
            obj_setinneravoidradius 3
            seteventhandler {
                Ex = objectinavoidradius
                scr = PedLogic_EventHandler params = {setstate = STATE_BumpPlayer event = objectinavoidradius}
            }
            case shot
            Ped_SetFlag PEDLOGIC_CAN_BE_SHOT
            obj_setinneravoidradius 8
            seteventhandler {
                Ex = objectinavoidradius
                scr = PedLogic_EventHandler params = {setstate = STATE_shot event = objectinavoidradius}
            }
            case explode
            obj_setinneravoidradius 4
            seteventhandler {
                Ex = objectinavoidradius
                scr = PedLogic_EventHandler params = {setstate = STATE_Explode event = objectinavoidradius}
            }
            case ignore
            default 
            Obj_ClearException objectinavoidradius
        endswitch
    endif
    <Allow_projectiles> = 1
    getsingletag Allow_projectiles
    if (<Allow_projectiles> = 1)
        if getsingletag Navigation_mode
            switch <Navigation_mode>
                case PEDMOTION_STAND
                case PEDMOTION_NAVMESH
                case PEDMOTION_WAYPOINT
                Ped_SetFlag PEDLOGIC_CAN_BE_SHOT
                seteventhandler {
                    Ex = ProjectileInAvoidRadius
                    scr = PedLogic_EventHandler params = { event = ProjectileInAvoidRadius }
                }
            endswitch
        endif
    endif
    if getsingletag Attention_radius
        obj_setattentionradius <Attention_radius>
    else
        obj_setattentionradius 30 ifzero
    endif
    if getsingletag Register_events
        begin 
        if GetNextArrayElement <Register_events>
            seteventhandler {
                Ex = (<element>)
                scr = (PedLogic_EventHandler)
                params = {
                    event = (<element>)
                }
            }
        else
            break 
        endif
        repeat 
    endif
endscript

script PedLogic_ClearAllEventHandlers 
    ClearEventHandler \{ objectinavoidradius }
    ClearEventHandler \{ objectoutofavoidradius }
    ClearEventHandler \{ objectinattentionradius }
    ClearEventHandler \{ objectoutofattentionradius }
    ClearEventHandler \{ ProjectileInAvoidRadius }
    Ped_ClearFlag \{ PEDLOGIC_RESET_EVENT_HANDLERS }
endscript

script PedLogic_EventHandler 
    if GotParam \{ event }
        ClearEventHandler <event>
        if NOT GotParam \{ setstate }
            switch <event>
                case objectinattentionradius
                <setstate> = STATE_ObjectInAttentionRadius
                case objectoutofattentionradius
                <setstate> = STATE_ObjectOutOfAttentionRadius
                case objectinavoidradius
                <setstate> = STATE_ObjectInAvoidRadius
                case ProjectileInAvoidRadius
                <setstate> = STATE_ProjectileInAvoidRadius
            endswitch
        endif
        if GotParam \{ setstate }
            Ped_SetLogicState <setstate> StateParams = <...> 
        endif
    endif
endscript

script PedLogic_RegisterTempEventHandler 
    settags TempEvent = <event>
    settags TempEventHandler = <handler>
    Ped_SetFlag \{ PEDLOGIC_ACTIVATE_TEMP_EVENT_HANDLER }
endscript

script PedLogic_ActivateTempEventHandler 
    getsingletag \{ TempEvent }
    getsingletag \{ TempEventHandler }
    seteventhandler {
        Ex = <TempEvent>
        scr = PedLogic_EventHandler params = {event = <TempEvent> setstate = <TempEventHandler>}
    }
    removetags \{[ TempEvent TempEventHandler ]}
endscript

script Ped_Utils_BeginPlayerChase \{ MaxHomeDist = 0 CatchScript = NullScript table = Ped_StateLogic_Table }
    <MaxHomeDist> = (<MaxHomeDist> * 12)
    Ped_StateLogic_RegisterTempDefaultState {state = STATE_chase table = <table>}
    settags MaxHomeDist = <MaxHomeDist> CatchScript = <CatchScript>
    Ped_SetLogicState \{ STATE_chase }
endscript

script Ped_Utils_EndPlayerChase 
    removetags \{tags = [ CatchScript ]}
    Ped_StateLogic_UnregisterTempDefaultState
    goto \{ Ped_Utils_BeginReturnHome }
endscript

script Ped_Utils_BeginReturnHome 
    Ped_StateLogic_RegisterTempDefaultState \{ state = STATE_gohome table = Ped_StateLogic_Table }
    Ped_SetLogicState \{ STATE_gohome }
endscript

script Ped_Utils_EndReturnHome 
    Ped_StateLogic_UnregisterTempDefaultState
    PedLogic_SetDefaultState
endscript

script PedLogic_GetAnimName 
    if NOT GotParam type
        script_assert 'Missing <Type> Param'
    endif
    if getsingletag anim_assets
        if StructureContains <type> structure = (<anim_assets>)
            <AnimAssets> = (<anim_assets>.<type>)
        endif
    endif
    if NOT GotParam AnimAssets
        if getsingletag Navigation_mode
            switch <Navigation_mode>
                case PEDMOTION_SKATER
                if StructureContains <type> structure = (default_M_skater_anim_assets)
                    <AnimAssets> = (default_M_skater_anim_assets.<type>)
                endif
                default 
                if StructureContains <type> structure = (default_M_anim_assets)
                    <AnimAssets> = (default_M_anim_assets.<type>)
                endif
            endswitch
        endif
    endif
    <AnimName> = default
    <index> = 0
    if GotParam AnimAssets
        if IsArray (<AnimAssets>)
            if GotParam ReturnAll
                <AnimName> = <AnimAssets>
            else
                GetRandomArrayElement (<AnimAssets>)
                <AnimName> = <element>
            endif
        else
            <AnimName> = <AnimAssets>
        endif
    else
        obj_getid
        printf ('WARNING: anim asset type \'%s\' not found for PedLogic_GetAnimName() call')s = <type>
        printstruct <...> 
        printscriptinfo
    endif
    return AnimName = <AnimName> index = <index>
endscript

script Ped_Utils_GetVectorToPlayer 
    if GotParam \{ playerid }
        <playerid> ::obj_getposition
    else
        skater ::obj_getposition
    endif
    <VecToPlayer> = <Pos>
    obj_getposition
    <VecToPlayer> = (<VecToPlayer> - <Pos>)
    NormalizeVector <VecToPlayer>
    return VecToPlayer = <norm>
endscript

script PedLogic_InFrontOfSkater 
    <retVal> = 0
    obj_getorientationtoobject \{ skater }
    if (<dotprod> < 0.5000)
        if (<dotprod> > -0.5000)
            <retVal> = 1
        endif
    endif
    return in_front = <retVal>
endscript

script PedLogic_RotateToSkater \{ time = 0.6000 }
    if obj_angletonearestskatergreaterthan \{ 15 }
        if Obj_LookAtObject type = skater time = <time>
            PedLogic_GetAnimName \{ type = Turn }
            Ped_PlayAnim {
                tree = Ped_AnimBranch_LookAt
                anim = <AnimName>
                Cycle
                lookat_params = igc_lookat_defaultanims
                lookat_target = skater
            }
            Obj_WaitRotate
        endif
    endif
endscript

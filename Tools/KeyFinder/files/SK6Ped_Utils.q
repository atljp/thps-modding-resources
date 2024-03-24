

script Ped_Utils_SetupHintSpeech {
        hint_text = 'Hint!'
        hint_text_time = 3
        inner_radius = 8
        outer_radius = 24
        activation_script = ped_utils_default_hint_dialog
    }
    ClearEventHandler anyobjectinradius
    ClearEventHandler objectoutofradius
    obj_setinnerradius <inner_radius>
    seteventhandler Ex = anyobjectinradius scr = ped_speech_got_trigger params = { <...> activation_script_params = <...>  }
endscript


script Ped_Utils_CancelHintSpeech 
    ClearEventHandler anyobjectinradius
    ClearEventHandler objectoutofradius
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
                    
                endif
                if GotParam volume
                    
                    <ped_id> ::obj_playstream <vo> vol = <volume> priority = 101 dropoff = GlobalHintVODropoff id = ThisPedHintStream
                else
                    
                    <ped_id> ::obj_playstream <vo> vol = GlobalHintVOVol priority = 101 dropoff = GlobalHintVODropoff id = ThisPedHintStream
                endif
            else
                
                
                
                
                
                
                
                
                
                
                
                
                
                
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
            <ped_id> ::obj_spawnscript <hint_text_script> params = <...> 
        endif
    endif
    wait <hint_text_time> seconds
    if ObjectExists id = <ped_id>
        <ped_id> ::Ped_Utils_SetMiscEventHandlers
        <ped_id> ::Ped_StateLogic_SetDefaultState
    endif
    if ObjectExists id = ped_hint_dialog
        DestroyScreenElement id = ped_hint_dialog
    endif
endscript


script ped_utils_hint_dialog_refuse 
    if ObjectExists id = <ped_id>
        <ped_id> ::Ped_Utils_SetMiscEventHandlers
    endif
    if ObjectExists id = ped_hint_dialog
        DestroyScreenElement id = ped_hint_dialog
    endif
endscript


script Ped_Utils_SetCollisionResponse type = ignore
    GetArraySize (Ped_StateLogic_CollisionTypes)
    <index> = 0
    begin 
    if (<type> = (Ped_StateLogic_CollisionTypes [ <index> ].tag))
        settags collision_mode = (Ped_StateLogic_CollisionTypes [ <index> ].Set_mode)
        ClearEventHandler objectinavoidradius
        obj_setinneravoidradius 0
    endif
    <index> = (<index> + 1)
    repeat <array_size>
    ped_initialize_collision_exceptions
endscript


script Ped_Utils_SetMiscEventHandlers 
    gettags
    GetArraySize (Ped_StateLogic_EventHandlers)
    <index> = 0
    begin 
    if GotParam (Ped_StateLogic_EventHandlers [ <index> ].tag)
        seteventhandler {
            Ex = (Ped_StateLogic_EventHandlers [ <index> ].Hook_event)
            scr = (Ped_StateLogic_EventHandlers [ <index> ].scr)
            params = {
                setstate = (Ped_StateLogic_EventHandlers [ <index> ].state)
                event = (Ped_StateLogic_EventHandlers [ <index> ].Hook_event)
            }
        }
        obj_setattentionradius 30 ifzero
    endif
    <index> = (<index> + 1)
    repeat <array_size>
endscript


script Ped_Utils_EventHandler 
    PED_DEBUGEVENT { params = <...>  }
    if NOT GotParam setstate
        script_assert 'Missing <SetState> param'
    endif
    if GotParam event
        ClearEventHandler <event>
    endif
    Ped_SetLogicState <setstate> StateParams = <...> 
endscript


script Ped_Utils_PlayStream 
    if GotParam type
        if Ped_GetVoicePrefix
            begin 
            <which> = RandomPermute (@ 1 @ 2 @ 3 @ 4 @ 5 @ 6 @ 7)
            switch <type>
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
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                if (CheckForPedStreamExistence = 1)
                    begin 
                    playsound GUI_Buzzer01 vol = 200
                    wait 0.2000 seconds
                    repeat 10
                endif
            else
                if (CheckForPedStreamExistence = 1)
                    
                    
                    
                endif
                switch <type>
                    case avoid
                    if (CheckForPedStreamExistence = 1)
                        
                    endif
                    obj_stopstream InGamePedObjStreamLine
                    obj_stopstream ThisPedHintStream
                    RandomNoRepeat (
                        @*4 
                        @ obj_playstream <stream> vol = GlobalAvoidVOVol dropoff = GlobalAvoidVODropoff id = InGamePedObjStreamLine priority = StreamPriorityLowMid
                    )
                    case far
                    if (CheckForPedStreamExistence = 1)
                        
                    endif
                    if NOT IsStreamPlaying ThisPedHintStream
                        if NOT IsStreamPlaying InGamePedObjStreamLine
                            obj_playstream <stream> vol = GlobalFarVOVol dropoff = GlobalFarVODropoff id = InGamePedObjStreamLine priority = StreamPriorityLow
                        endif
                    endif
                    case trickbail
                    if (CheckForPedStreamExistence = 1)
                        
                    endif
                    if NOT IsStreamPlaying ThisPedHintStream
                        obj_stopstream InGamePedObjStreamLine
                        obj_playstream <stream> vol = GlobalTrickBailVOVol dropoff = GlobalTrickBailVODropoff id = InGamePedObjStreamLine priority = StreamPriorityLowMid
                    endif
                    case trickpositive
                    if (CheckForPedStreamExistence = 1)
                        
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


script Ped_Utils_GetAnimName 
    if NOT GotParam type
        script_assert 'Missing <Type> Param'
    endif
    if getsingletag Anim_Types
        if StructureContains <type> structure = (<Anim_Types>)
            <AnimAssets> = (<Anim_Types>.<type>)
        endif
    endif
    if NOT GotParam AnimAssets
        Ped_GetGender
        getsingletag move_type
        if (<move_type> = skate)
            if StructureContains <type> structure = (default_M_skater_anim_assets.Anim_Types)
                <AnimAssets> = (default_M_skater_anim_assets.Anim_Types.<type>)
            endif
        else
            if (<gender> = Male)
                if StructureContains <type> structure = (default_M_anim_assets.Anim_Types)
                    <AnimAssets> = (default_M_anim_assets.Anim_Types.<type>)
                endif
            else
                if StructureContains <type> structure = (default_F_anim_assets.Anim_Types)
                    <AnimAssets> = (default_F_anim_assets.Anim_Types.<type>)
                endif
            endif
        endif
    endif
    <AnimName> = default
    if GotParam AnimAssets
        if IsArray (<AnimAssets>)
            if GotParam index
                <AnimName> = (<AnimAssets> [ <index> ])
            else
                GetRandomArrayElement (<AnimAssets>)
                <AnimName> = <element>
            endif
        else
            <AnimName> = <AnimAssets>
        endif
    endif
    if GotParam index
        return AnimName = <AnimName> index = <index>
    endif
    return AnimName = <AnimName>
endscript


script Ped_Utils_GetStateAnimName table = Ped_StateLogic_Table
    if NOT GotParam type
        script_assert 'Missing <Type> Param'
    endif
    getsingletag move_type
    if (move_type = skater)
        <m_assets> = skater
    else
        Ped_GetGender
        if (<gender> = Male)
            <m_assets> = Male
            if (<move_type> = stand)
                <m_stand_assets> = male_stand
            endif
        else
            <m_assets> = Female
            if (<move_type> = stand)
                <m_stand_assets> = female_stand
            endif
        endif
    endif
    if NOT GotParam logicstate
        ped_getlogicstate
    endif
    if StructureContains (<logicstate>)structure = (<table>)
        if StructureContains (anim_assets)structure = (<table>.<logicstate>)
            
            if StructureContains (<m_assets>)structure = (<table>.<logicstate>.anim_assets)
                <state_assets> = (<table>.<logicstate>.anim_assets.<m_assets>)
                
                if StructureContains (Anim_Types)structure = (<state_assets>)
                    if StructureContains (<type>)structure = (<state_assets>.Anim_Types)
                        <AnimName> = (<state_assets>.Anim_Types.<type>)
                        FormatText textname = msg 'Got <AnimName>=%s for male' s = <AnimName>
                        
                    endif
                endif
            endif
        endif
    endif
    return <AnimName>
endscript


script Ped_Utils_BeginPlayerChase MaxHomeDist = 0 CatchScript = NullScript table = Ped_StateLogic_Table
    <MaxHomeDist> = (<MaxHomeDist> * 12)
    Ped_StateLogic_RegisterTempDefaultState {state = STATE_chase table = <table>}
    settags MaxHomeDist = <MaxHomeDist> CatchScript = <CatchScript>
    Ped_SetLogicState STATE_chase
endscript


script Ped_Utils_EndPlayerChase 
    removetags tags = [ CatchScript ]
    Ped_StateLogic_UnregisterTempDefaultState
    goto Ped_Utils_BeginReturnHome
endscript


script Ped_Utils_BeginReturnHome 
    Ped_StateLogic_RegisterTempDefaultState {state = STATE_gohome table = Ped_StateLogic_Table}
    Ped_SetLogicState STATE_gohome
endscript


script Ped_Utils_EndReturnHome 
    Ped_StateLogic_UnregisterTempDefaultState
    Ped_StateLogic_SetDefaultState
endscript


script Ped_Utils_GetVectorToPlayer 
    skater ::obj_getposition
    <VecToPlayer> = <Pos>
    obj_getposition
    <VecToPlayer> = (<VecToPlayer> - <Pos>)
    NormalizeVector <VecToPlayer>
    return VecToPlayer = <norm>
endscript


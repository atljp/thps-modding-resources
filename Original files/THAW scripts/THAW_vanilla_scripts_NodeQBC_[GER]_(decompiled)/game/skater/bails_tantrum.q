
script TantrumOn 
    enableinputevents
    obj_spawnscriptlater \{ TantrumCheck }
endscript
TANTRUM_PRESSES = 0

script TantrumCheck presses = 0 triangle = 0
    if (GetGlobalFlag flag = TANTRUM_OFF)
        return 
    endif
    root_window ::getsingletag menu_state
    if (<menu_state> = on)
        return 
    endif
    max = 0
    count = 0
    total = 0
    spazzfactor = 0
    got_button = 0
    GetCurrentBailEndpose
    if (<current_bail_endpose> = None)
        return 
    endif
    tantrum_draw_meter
    OnExitRun kill_tantrum_meter
    min_spaz = 5
    max_spaz = 10
    tantrum_draw_and_update_spazzfactors min = <min_spaz> max = <max_spaz>
    cleared_bash = 0
    begin 
    last_spazzfactor = <spazzfactor>
    GetSpazzFactor
    if NOT (<last_spazzfactor> = <spazzfactor>)
        tantrum_meter_update_tags spazzfactor = <spazzfactor>
    endif
    if Held triangle
        if NOT (<got_button> = 1)
            tantrum_meter_maybe_play_sound
            got_button = 1
        endif
        if (<cleared_bash> = 0)
            BashOff
            cleared_bash = 1
        endif
    else
        got_button = 0
    endif
    count = (<count> + 1)
    total = (<total> + <spazzfactor>)
    average = ((<total> * 1.0)/ (<count> * 1.0))
    tantrum_update_meter current = (<average> * 2.0)max = <max_spaz>
    if (<spazzfactor> > <max>)
        max = <spazzfactor>
        ShakeCamera {duration = 0.1000
            vert_amp = 3.0
            horiz_amp = 2.0
            vert_vel = 5
            horiz_vel = 5
        }
    endif
    if ((<average> * 2.0)> <max_spaz>)
        settags waitfortantrum = 1
        tantrum_update_meter current = (<average> * 2.0)max = <max_spaz> maxedOut
        Skater_WaitAnimFinished
        break 
    endif
    if Skater_AnimComplete
        break 
    endif
    wait 1 gameframe
    repeat 
    final_spazz = (<average> * 2.0)
    GetHighestTantrumReached spazzfactor = <final_spazz>
    if (<final_spazz> > <max_spaz>)
        if lastscorelandedgreaterthan 100000
        endif
    endif
    if NOT (<tantrum> < 0)
        goto TantrumStart params = { spazzfactor = <tantrum> }
    endif
endscript

script kill_tantrum_meter 
    tantrum_draw_meter \{ Die }
endscript

script TantrumStart 
    printf 'TantrumStart'
    BashOff
    removetags tags = [ waitfortantrum ]
    if NOT IsStreamPlaying tantrum_stream
    endif
    SpawnSound ALL_SFX_Wait_Before_Tantrum_Stream
    if NOT IsStreamPlaying SK6_Teapot_Sign_Whistle
        PlayStream SK6_Teapot_Sign_Whistle vol = 50 priority = StreamPriorityHigh
    endif
    ShakeCamera {duration = 0.5000
        vert_amp = 10.0
        horiz_amp = 10.0
        vert_vel = 5
        horiz_vel = 5
    }
    SetSkaterCamOverride heading = 2 tilt = -0.3000 time = 1 Zoom = 1.300
    playsound GotStat04 pitch = 80 vol = 500
    if lastscorelandedlessthan 5000
        maxscore = 2000.0
        minscore = 1000.0
    else
        maxscore = 3500.0
        minscore = 2000.0
    endif
    if (<spazzfactor> = 99)
        GetArraySize tantrum_array
        rank = (tantrum_array [(<array_size> -1)].spazzfactor)
    else
        rank = <spazzfactor>
    endif
    Score = (<minscore> + ((<rank> / 5.0)* (<maxscore> - <minscore>)))
    CastToInteger Score
    printf 'score=%s spazz=%z rank=%r min=%n max=%x' s = <Score> r = <rank> n = <minscore> x = <maxscore> z = <spazzfactor>
    SetTrickScore <Score>
    SetTrickName '\c4FREAK OUT!\c0'
    display Blockspin TrickTextScript = do_trick_text_spazz
    GetScoreInfo
    if (<ScorePot> > 3000)
        if AbilityEnabled special
            ForceSpecial
        endif
    endif
    GetCurrentBailEndpose
    if NOT (<current_bail_endpose> = None)
        SetCurrentBailEndpose
        MakeSkaterGoto <current_bail_endpose> params = {tantrum = true spazzfactor = <spazzfactor> Score = <ScorePot>}
    endif
endscript

script tantrum_maybe_force_land 
    obj_spawnscriptlater tantrum_maybe_force_land2 params = { Score = <Score> }
endscript

script tantrum_maybe_force_land2 
    begin 
    if currentscorepotgreaterthan <Score>
        return 
    endif
    if DoingTrick
        return 
    endif
    wait \{ 1 gameframe }
    repeat 120
    LandSkaterTricks
endscript

script TantrumOff 
    obj_getid
    TerminateObjectsScripts id = <ObjID> script_name = TantrumCheck
    ClearSkaterCamOverride
    tantrum_draw_meter \{ Die }
endscript

script Choose_Tantrum 
    printf 'Got a Tantrum Signal'
    EnterTantrum
    if NOT GotParam spazzfactor
        printf 'Choose_Tantrum missing spazzfactor param'
        return 
    endif
    switch <Getup>
        case Ft
        anim1 = GetUp_HK_Ft
        Anim2 = GetUp_HK_Ft_T
        case Bk
        anim1 = GetUp_HK_Bk
        Anim2 = GetUp_HK_Bk_T
        case RT
        anim1 = GetUp_HK_Rt
        Anim2 = GetUp_HK_Rt_T
        case LT
        anim1 = GetUp_HK_Lt
        Anim2 = GetUp_HK_Lt_T
        case Sit_Ft
        anim1 = GetUp_Sit_Ft
        Anim2 = GetUp_Sit_Ft_T
        default 
        printf 'Choose_Tantrum missing getup param'
    endswitch
    printf 'tantrum slot =============== %i' i = <spazzfactor>
    if (<spazzfactor> > 1)
        SwitchOnBoard
        Skater_Playanim anim = <Anim2> BlendPeriod = 0.0
    else
        Skater_Playanim anim = <anim1> BlendPeriod = 0.0
    endif
    Skater_WaitAnimFinished
    SwitchOnBoard
    boardrotate normal
    if (<spazzfactor> = 99)
        goto Random (@ skaterExplode @ skaterLoseHead) params = { Score = <Score> }
    else
        if StructureContains structure = (tantrum_array [ <spazzfactor> ])name
            goto ((tantrum_array [ <spazzfactor> ]).name)params = { Score = <Score> }
        endif
    endif
endscript
tantrum_array = [
    { name = KickBoard }
    { name = BoardFocus }
    { name = Slingshot }
    { name = DiscusThrow }
    { name = PileDriver }
    { name = HeadButt }
]

script DiscusThrow 
    Skater_Playanim \{ anim = Tantrum_DiscusStart BlendPeriod = 0.0 }
    Skater_WaitAnimFinished
    Skater_Playanim \{ anim = Tantrum_DiscusFinish BlendPeriod = 0.0 }
    obj_spawnscriptlater \{BailBoardControl params = {BoardOffFrame = 38 BoardVel = (0.0, 500.0, 1000.0) BoardRotVel = (0.0, 15.0, 0.0) BoardSkaterVel = 0 tantrum = tantrum}}
    Skater_WaitAnimFinished
    goto startskate params = { tantrum_score = <Score> }
endscript

script HeadButt 
    if SkaterIsNamed \{ chainsawskater }
        goto DiscusThrow params = <...> 
        return 
    endif
    Skater_Playanim \{ anim = Tantrum_HeadButt BlendPeriod = 0.0 }
    Skater_WaitAnimFinished
    goto startskate params = { tantrum_score = <Score> }
endscript

script PileDriver 
    if SkaterIsNamed \{ chainsawskater }
        goto Slingshot params = <...> 
        return 
    endif
    Skater_Playanim \{ anim = Tantrum_PileDriver BlendPeriod = 0.0 }
    Skater_WaitAnimFinished
    goto startskate params = { tantrum_score = <Score> }
endscript

script Slingshot 
    Skater_Playanim anim = Tantrum_SlingShot BlendPeriod = 0.0
    if Flipped
        obj_spawnscriptlater BailBoardControl params = {BoardOffFrame = 42 BoardVel = (-800.0, 400.0, -600.0) BoardRotVel = (10.0, 0.0, 0.0) BoardSkaterVel = 0 tantrum = tantrum}
    else
        obj_spawnscriptlater BailBoardControl params = {BoardOffFrame = 42 BoardVel = (800.0, 400.0, -600.0) BoardRotVel = (-10.0, 0.0, 0.0) BoardSkaterVel = 0 tantrum = tantrum}
    endif
    Skater_WaitAnimFinished
    goto startskate params = { tantrum_score = <Score> }
endscript

script BoardFocus 
    if SkaterIsNamed \{ chainsawskater }
        goto KickBoard params = <...> 
        return 
    endif
    Skater_Playanim \{ anim = Tantrum_BoardFocus BlendPeriod = 0.0 }
    Skater_WaitAnimFinished
    goto startskate params = { tantrum_score = <Score> }
endscript

script KickBoard 
    Skater_Playanim \{ anim = Tantrum_KickBoard BlendPeriod = 0.0 }
    wait \{ 50 gameframes }
    obj_spawnscriptlater \{BailBoardControl params = {BoardOffFrame = 0 BoardVel = (0.0, 500.0, 1000.0) BoardRotVel = (0.0, 15.0, -10.0) BoardSkaterVel = 0 tantrum = tantrum}}
    Skater_WaitAnimFinished
    goto startskate params = { tantrum_score = <Score> }
endscript

script skaterExplode 
    Skater_Playanim \{ anim = WStandIdle1 Speed = 2.0 }
    Skater_WaitAnimFinished
    obj_spawnscriptlater \{BailBoardControl params = {BoardOffFrame = 0 BoardVel = (0.0, 0.0, 0.0) BoardRotVel = (0.0, 0.0, 0.0) BoardSkaterVel = 0 tantrum = tantrum}}
    make_skater_explode
    obj_getid
    MangleChecksums a = TantrumBoard b = <ObjID>
    if ObjectExists id = <mangled_id>
        <mangled_id> ::Die
    endif
    goto startskate params = { tantrum_score = <Score> }
endscript

script skaterLoseHead 
    if SkaterIsNamed chainsawskater
        goto skaterExplode params = <...> 
        return 
    endif
    Skater_Playanim anim = Tantrum_HeadButt
    waitanim 22 percent
    obj_spawnscriptlater BailBoardControl params = {BoardOffFrame = 0 BoardVel = (0.0, 0.0, 0.0) BoardRotVel = (0.0, 0.0, 0.0) BoardSkaterVel = 0 tantrum = tantrum}
    make_skater_lose_head
    obj_getid
    MangleChecksums a = TantrumBoard b = <ObjID>
    if ObjectExists id = <mangled_id>
        <mangled_id> ::Die
    endif
    goto startskate params = { tantrum_score = <Score> }
endscript

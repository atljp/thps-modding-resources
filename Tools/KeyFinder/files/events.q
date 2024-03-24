
display_event_arrows = 0

script ClearExceptionGroup 
    cleareventhandlergroup <...> 
    OnExceptionRun
endscript


script broadcastevent 
    LaunchEvent <...> broadcast
endscript


script ClearExceptions 
    cleareventhandlergroup default
    OnExceptionRun
endscript


script ClearException 
    ClearEventHandler <...> 
    OnExceptionRun
endscript


script ClearAllExceptionGroups 
    cleareventhandlergroup all_groups
    OnExceptionRun
endscript


script Obj_SetException 
    SetException <...> 
endscript


script Obj_ClearException 
    ClearException <...> 
endscript


script Obj_ClearExceptions 
    ClearExceptions <...> 
endscript


script BlockUntilDetailedEvent 
    seteventhandler Ex = <type> scr = BlockUntilDetailedEvent_FilterEvent params = { BlockUntilDetailedEvent_EventDetails = <Details> }group = BlockUntilDetailedEvent_Group
    Block
    cleareventhandlergroup BlockUntilDetailedEvent_Group
endscript


script BlockUntilDetailedEvent_FilterEvent 
    if (<BlockUntilDetailedEvent_EventDetails> < <...> )
        UnBlockInterruptedScript
    endif
endscript

StateToEntryEventMapping = {
    Skater_InAir = SkaterEnterAir
    Skater_InBail = SkaterEnterBail
    Skater_OnRail = SkaterEnterRail
    Skater_Skitching = SkaterEnterSkitch
    Skater_InManual = SkaterEnterManual
    Skater_InRevert = SkaterEnterRevert
    Skater_OnGround = SkaterEnterGround
    Skater_OnWall = SkaterEnterWall
    Skater_InWallplant = SkaterEnterWallplant
    Skater_InRevert = SkaterEnterRevert
    Skater_OnLip = SkaterEnterLip
    Skater_EndOfRun = SkaterEnterEndOfRun
    Skater_OnLadder = SkaterEnterLadder
    Skater_InHang = SkaterEnterHang
}
StateToExitEventMapping = {
    Skater_InAir = SkaterExitAir
    Skater_InBail = SkaterExitBail
    Skater_OnRail = SkaterExitRail
    Skater_Skitching = SkaterExitSkitch
    Skater_InManual = SkaterExitManual
    Skater_InRevert = SkaterExitRevert
    Skater_OnGround = SkaterExitGround
    Skater_OnWall = SkaterExitWall
    Skater_InWallplant = SkaterExitWallplant
    Skater_InRevert = SkaterExitRevert
    Skater_OnLip = SkaterExitLip
    Skater_EndOfRun = SkaterExitEndOfRun
    Skater_OnLadder = SkaterExitLadder
    Skater_InHang = SkaterExitHang
}
SubStateToEntryEventMapping = {
    flip = SkaterEnterFlip
    Grab = SkaterEnterGrab
    Transfer = SkaterEnterTransfer
    AcidDrop = SkaterEnterAcidDrop
}
SubStateToExitEventMapping = {
    flip = SkaterExitFlip
    Grab = SkaterExitGrab
    Transfer = SkaterExitTransfer
    AcidDrop = SkaterExitAcidDrop
}
StateToSubStateExitEventMask = {
    Skater_None = []
    Skater_InAir = [ SkaterExitTransfer SkaterExitAcidDrop ]
    Skater_InBail = []
    Skater_OnRail = []
    Skater_Skitching = []
    Skater_InManual = []
    Skater_InRevert = []
    Skater_OnGround = []
    Skater_OnWall = []
    Skater_InWallplant = []
    Skater_OnLip = []
    Skater_EndOfRun = []
    Skater_OnLadder = []
    Skater_InHang = []
}

script LaunchStateChangeEvent 
    newstate = <state>
    gettags
    LaunchAllSubStateExitEvents newstate = <newstate>
    if (<newstate> = <state>)
        return 
    endif
    if GotParam StateExitEvent
        LaunchEvent broadcast type = <StateExitEvent>
    endif
    LaunchEvent broadcast type = (StateToEntryEventMapping.<newstate>)
    settags StateExitEvent = (StateToExitEventMapping.<newstate>)state = <newstate>
endscript


script LaunchSubStateEntryEvent 
    LaunchEvent broadcast type = (SubStateToEntryEventMapping.<substate>)
    gettags
    NewExitEvent = (SubStateToExitEventMapping.<substate>)
    SubStateExitEventList = (<SubStateExitEventList> + { <NewExitEvent> })
    settags SubStateExitEventList = <SubStateExitEventList>
endscript


script LaunchSubStateExitEvent 
    LaunchEvent broadcast type = (SubStateToExitEventMapping.<substate>)
    gettags
    SubStateExitEventList = (<SubStateExitEventList> - (SubStateToExitEventMapping.<substate>))
    settags SubStateExitEventList = <SubStateExitEventList>
endscript


script InitializeStateChangeEvent 
    gettags
    if GotParam StateExitEvent
        LaunchAllSubStateExitEvents newstate = Skater_None
        LaunchEvent broadcast type = <StateExitEvent>
    endif
    setprops remove_tags = [ StateExitEvent ]
    settags state = Skater_None SubStateExitEventList = {}
endscript


script LaunchAllSubStateExitEvents 
    gettags
    if NOT GotParam SubStateExitEventList
        return 
    endif
    MaskedSubStateExitEventList = (<SubStateExitEventList> - (StateToSubStateExitEventMask.<newstate>))
    LaunchEvent broadcast type = <MaskedSubStateExitEventList>
    SubStateExitEventList = (<SubStateExitEventList> - <MaskedSubStateExitEventList>)
    settags SubStateExitEventList = <SubStateExitEventList>
endscript


script SkaterEventDebug 
    KillSpawnedScript name = TestEventListener
    SpawnScript TestEventListener
endscript


script TestEventListener 
    seteventhandler Ex = SkaterEnterAir scr = ReportEvent params = { EventName = SkaterEnterAir }
    seteventhandler Ex = SkaterExitAir scr = ReportEvent params = { EventName = SkaterExitAir }
    seteventhandler Ex = SkaterEnterGround scr = ReportEvent params = { EventName = SkaterEnterGround }
    seteventhandler Ex = SkaterExitGround scr = ReportEvent params = { EventName = SkaterExitGround }
    seteventhandler Ex = SkaterEnterBail scr = ReportEvent params = { EventName = SkaterEnterBail }
    seteventhandler Ex = SkaterExitBail scr = ReportEvent params = { EventName = SkaterExitBail }
    seteventhandler Ex = SkaterEnterRail scr = ReportEvent params = { EventName = SkaterEnterRail }
    seteventhandler Ex = SkaterExitRail scr = ReportEvent params = { EventName = SkaterExitRail }
    seteventhandler Ex = SkaterEnterSkitch scr = ReportEvent params = { EventName = SkaterEnterSkitch }
    seteventhandler Ex = SkaterExitSkitch scr = ReportEvent params = { EventName = SkaterExitSkitch }
    seteventhandler Ex = SkaterEnterManual scr = ReportEvent params = { EventName = SkaterEnterManual }
    seteventhandler Ex = SkaterExitManual scr = ReportEvent params = { EventName = SkaterExitManual }
    seteventhandler Ex = SkaterEnterWall scr = ReportEvent params = { EventName = SkaterEnterWall }
    seteventhandler Ex = SkaterExitWall scr = ReportEvent params = { EventName = SkaterExitWall }
    seteventhandler Ex = SkaterEnterWallplant scr = ReportEvent params = { EventName = SkaterEnterWallplant }
    seteventhandler Ex = SkaterExitWallplant scr = ReportEvent params = { EventName = SkaterExitWallplant }
    seteventhandler Ex = SkaterEnterRevert scr = ReportEvent params = { EventName = SkaterEnterRevert }
    seteventhandler Ex = SkaterExitRevert scr = ReportEvent params = { EventName = SkaterExitRevert }
    seteventhandler Ex = SkaterEnterLip scr = ReportEvent params = { EventName = SkaterEnterLip }
    seteventhandler Ex = SkaterExitLip scr = ReportEvent params = { EventName = SkaterExitLip }
    seteventhandler Ex = SkaterEnterLadder scr = ReportEvent params = { EventName = SkaterEnterLadder }
    seteventhandler Ex = SkaterExitLadder scr = ReportEvent params = { EventName = SkaterExitLadder }
    seteventhandler Ex = SkaterEnterHang scr = ReportEvent params = { EventName = SkaterEnterHang }
    seteventhandler Ex = SkaterExitHang scr = ReportEvent params = { EventName = SkaterExitHang }
    seteventhandler Ex = SkaterEnterEndOfRun scr = ReportEvent params = { EventName = SkaterEnterEndOfRun }
    seteventhandler Ex = SkaterExitEndOfRun scr = ReportEvent params = { EventName = SkaterExitEndOfRun }
    seteventhandler Ex = SkaterEnterFlip scr = ReportEvent params = { EventName = SkaterEnterFlip }
    seteventhandler Ex = SkaterExitFlip scr = ReportEvent params = { EventName = SkaterExitFlip }
    seteventhandler Ex = SkaterEnterGrab scr = ReportEvent params = { EventName = SkaterEnterGrab }
    seteventhandler Ex = SkaterExitGrab scr = ReportEvent params = { EventName = SkaterExitGrab }
    seteventhandler Ex = SkaterEnterTransfer scr = ReportEvent params = { EventName = SkaterEnterTransfer }
    seteventhandler Ex = SkaterExitTransfer scr = ReportEvent params = { EventName = SkaterExitTransfer }
    seteventhandler Ex = SkaterEnterAcidDrop scr = ReportEvent params = { EventName = SkaterEnterAcidDrop }
    seteventhandler Ex = SkaterExitAcidDrop scr = ReportEvent params = { EventName = SkaterExitAcidDrop }
    seteventhandler Ex = SkaterLanded scr = ReportEvent params = { EventName = SkaterLanded }
    seteventhandler Ex = SkaterLandedClean scr = ReportEvent params = { EventName = SkaterLandedClean }
    seteventhandler Ex = SkaterBailed scr = ReportEvent params = { EventName = SkaterBailed }
    seteventhandler Ex = SkaterTrickDisplayed scr = ReportEvent params = { EventName = SkaterTrickDisplayed }
    seteventhandler Ex = SkaterSpinDisplayed scr = ReportEvent params = { EventName = SkaterSpinDisplayed }
    seteventhandler Ex = SkaterEnterCombo scr = ReportEvent params = { EventName = SkaterEnterCombo }
    seteventhandler Ex = SkaterExitCombo scr = ReportEvent params = { EventName = SkaterExitCombo }
    seteventhandler Ex = SkaterJump scr = ReportEvent params = { EventName = SkaterJump }
    seteventhandler Ex = SkaterOffEdge scr = ReportEvent params = { EventName = SkaterOffEdge }
    seteventhandler Ex = SkaterWallplant scr = ReportEvent params = { EventName = SkaterWallplant }
    seteventhandler Ex = SkaterWallpush scr = ReportEvent params = { EventName = SkaterWallpush }
    seteventhandler Ex = SkaterPointRail scr = ReportEvent params = { EventName = SkaterPointRail }
    seteventhandler Ex = SkaterEnterSkating scr = ReportEvent params = { EventName = SkaterEnterSkating }
    seteventhandler Ex = SkaterExitSkating scr = ReportEvent params = { EventName = SkaterExitSkating }
    seteventhandler Ex = SkaterEnterWalking scr = ReportEvent params = { EventName = SkaterEnterWalking }
    seteventhandler Ex = SkaterExitWalking scr = ReportEvent params = { EventName = SkaterExitWalking }
    seteventhandler Ex = SkaterEnterNollie scr = ReportEvent params = { EventName = SkaterEnterNollie }
    seteventhandler Ex = SkaterExitNollie scr = ReportEvent params = { EventName = SkaterExitNollie }
    seteventhandler Ex = SkaterEnterPressure scr = ReportEvent params = { EventName = SkaterEnterPressure }
    seteventhandler Ex = SkaterExitPressure scr = ReportEvent params = { EventName = SkaterExitPressure }
    seteventhandler Ex = SkaterEnterVertAir scr = ReportEvent params = { EventName = SkaterEnterVertAir }
    seteventhandler Ex = SkaterExitVertAir scr = ReportEvent params = { EventName = SkaterExitVertAir }
    seteventhandler Ex = SkaterEnterSpecial scr = ReportEvent params = { EventName = SkaterEnterSpecial }
    seteventhandler Ex = SkaterExitSpecial scr = ReportEvent params = { EventName = SkaterExitSpecial }
    Block
endscript


script ReportEvent 
    
endscript


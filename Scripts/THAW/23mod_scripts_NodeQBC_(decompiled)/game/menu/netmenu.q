
script StopServerList 
    printf \{ 'script StopServerList' }
    NetSessionFunc \{ obj = match func = stop_server_list }
endscript

script set_join_mode 
    StopServerList
    SetJoinMode <...> 
endscript

script chosen_leave_server 
    printscriptinfo 'chosen_leave_server wywo³ane nieprawid³owo'
    ClearOmnigons
    change check_for_unplugged_controllers = 0
    printf '****************** DEACTIVATING GOALS!!!! ********************'
    GoalManager_DeactivateAllGoals force_all
    GoalManager_UninitializeAllGoals
    GoalManager_RemoveAllGoals
    ParkEditorCommand command = DestroyGeneratedPark instant
    LeaveServer
    if InNetGame
        NetSessionFunc obj = match func = free_server_list
    endif
    SetNetworkMode
endscript

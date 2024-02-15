
script GenericProWaiting 
    getsingletag \{ STATE_DEFAULT }
    if NOT GotParam \{ STATE_DEFAULT }
        PedLogic_InitParams \{ stand_pedlogic_params }
        Ped_SetLogicState STATE_GoalPed_waiting table = GoalPed_StateLogic_Table StateParams = <...> 
    else
        PedLogic_SetDefaultState
    endif
endscript

script GenericProTalking 
    getsingletag \{ STATE_DEFAULT }
    if NOT GotParam \{ STATE_DEFAULT }
        Ped_SetLogicState STATE_GoalPed_talking table = GoalPed_StateLogic_Table StateParams = <...> 
    else
        PedLogic_SetDefaultState
    endif
endscript

script GenericProSuccess 
    getsingletag \{ STATE_DEFAULT }
    if NOT GotParam \{ STATE_DEFAULT }
        Ped_SetLogicState STATE_GoalPed_success table = GoalPed_StateLogic_Table StateParams = <...> 
    else
        PedLogic_SetDefaultState
    endif
endscript

script GenericPro_vo 
    if NOT GotParam \{ goal_id }
        return 
    endif
    if ObjectExists \{ id = skater }
        if NOT InMultiPlayerGame
            if NOT skater ::obj_flagset \{ FLAG_SKATER_INGOALINIT }
                if NOT skater ::driving
                    <should_say_something> = randomrange (0.0, 100.0)
                    if (<should_say_something> > 70)
                        GoalManager_PlayGoalStream name = <goal_id> <...> type = <type>
                    endif
                endif
            endif
        endif
    endif
endscript
GoalPed_StateLogic_Table = {
    STATE_GoalPed_waiting = { Navigation_mode = PEDMOTION_STAND script_ped_state = STATECONTROL_gp_waiting }
    STATE_GoalPed_talking = { Navigation_mode = PEDMOTION_STAND script_ped_state = STATECONTROL_gp_talking }
    STATE_GoalPed_success = { Navigation_mode = PEDMOTION_STAND script_ped_state = STATECONTROL_gp_success }
}

script STATECONTROL_gp_waiting 
    if NOT GotParam \{ goal_id }
    endif
    PedLogic_GetAnimName \{ type = idle }
    Ped_PlayAnim anim = <AnimName>
    begin 
    PedLogic_RotateToSkater
    GenericPro_vo type = 'Wait' goal_id = <goal_id> pro = <pro>
    PedLogic_GetAnimName \{ type = wait }
    Ped_PlayAnim anim = <AnimName>
    Ped_WaitAnimFinished
    repeat 
endscript

script STATECONTROL_gp_talking 
    begin 
    PedLogic_RotateToSkater
    GenericPro_vo type = 'talk' goal_id = <goal_id> pro = <pro>
    PedLogic_GetAnimName \{ type = talk }
    Ped_PlayAnim anim = <AnimName>
    Ped_WaitAnimFinished
    repeat 
endscript

script STATECONTROL_gp_success 
    begin 
    PedLogic_RotateToSkater
    GenericPro_vo type = 'success' goal_id = <goal_id> pro = <pro>
    PedLogic_GetAnimName \{ type = success }
    Ped_PlayAnim anim = <AnimName>
    Ped_WaitAnimFinished
    repeat 
endscript


goal_horse_mp_genericParams = {
    goal_text = 'Complete the other players\' tricks!'
    time = 10
    net
    init = goal_horse_mp_init
    activate = goal_horse_mp_activate
    deactivate = goal_horse_mp_deactivate
    expire = goal_horse_mp_expire
    goal_description = 'Horse!'
}

script goal_horse_mp_init 
endscript


script goal_horse_mp_activate 
    RunScriptOnScreenElement id = the_time clock_morph
    ResetScore
endscript


script goal_horse_mp_deactivate 
    if ObjectExists id = horse_score_menu
        DestroyScreenElement id = horse_score_menu
    endif
    
endscript


script horse_mp_done 
    dialog_box_exit
    do_backend_retry
endscript


script goal_horse_mp_expire 
    
    if ObjectExists id = goal_message
        DestroyScreenElement id = goal_message
    endif
    
endscript


script AddGoal_Horse_Mp 
    GoalManager_AddGoal name = horse_mp {
        params = { goal_horse_mp_genericParams }
    }
endscript


script StartGoal_Horse_Mp 
    GoalManager_EditGoal name = horse_mp params = <...> 
    GoalManager_ActivateGoal name = horse_mp
    create_horse_score_menu
endscript


script EndGoal_Horse_Mp 
    GoalManager_DeactivateGoal name = horse_mp
endscript


script create_horse_score_menu 
    if NOT ObjectExists id = horse_score_menu
        SetScreenElementLock id = root_window Off
        CreateScreenElement {
            type = ContainerElement
            parent = root_window
            id = horse_score_menu
            font = dialog
            Pos = (0.0, 30.0)
            just = [ left top ]
            Scale = 0
            dims = (640.0, 480.0)
        }
        CreateScreenElement {
            type = vmenu
            parent = horse_score_menu
            id = horse_score_vmenu
            font = dialog
            just = [ left top ]
            Pos = (45.0, 60.0)
            Scale = 0.9000
            padding_scale = 0.7000
            internal_scale = 1
            internal_just = [ left top ]
        }
        <index> = 1
        begin 
        FormatText checksumname = current_id 'horse_score_%i' i = <index>
        CreateScreenElement {
            type = TextElement
            parent = horse_score_vmenu
            id = <current_id>
            font = dialog
            text = ''
            Scale = 0.9000
            rgba = [ 108 112 120 128 ]
            not_focusable
            z_priority = -5
        }
        <index> = (<index> + 1)
        repeat 3
        RunScriptOnScreenElement id = horse_score_menu menu_onscreen params = { preserve_menu_state }
    endif
endscript


script update_horse_score 
    if ObjectExists id = horse_score_menu
        SetScreenElementProps {
            id = <id>
            text = <text>
        }
    endif
endscript


paused_for_hardware = 0
sysnotify_wait_in_progress = 0
xenon_device_checked = -1
sysnotify_paused_screen_elements = [
    current_menu_anchor
    signout_warning
    dialog_box_anchor
    link_lost_dialog_anchor
    quit_dialog_anchor
    keyboard_anchor
]

script sysnotify_wait_until_safe 
    begin 
    <should_wait> = 0
    if SystemUIDelayed
        <should_wait> = 1
    endif
    if IsTrue is_changing_levels
        <should_wait> = 1
    endif
    if IsTrue igc_playing
        <should_wait> = 1
    endif
    if NOT CutsceneFinished name = cutscene
        <should_wait> = 1
    endif
    if ScreenElementExists id = screenfader
        <should_wait> = 1
    endif
    if (<should_wait> = 1)
        change sysnotify_wait_in_progress = 1
        wait 0.1000 seconds
    else
        change sysnotify_wait_in_progress = 0
        return 
    endif
    repeat 
endscript

script sysnotify_handle_pause 
    printf '----------------------'
    printf 'sysnotify_handle_pause'
    printf '----------------------'
    change paused_for_hardware = 1
    sysnotify_wait_until_safe
    if GameIsPaused
        return 
    endif
    if InFrontend
        return 
    endif
    if CustomParkMode editing
        return 
    endif
    if IsTrue cat_pak_is_loaded
        return 
    endif
    GetArraySize sysnotify_paused_screen_elements
    <i> = 0
    begin 
    if ScreenElementExists id = (sysnotify_paused_screen_elements [ <i> ])
        return 
    endif
    <i> = (<i> + 1)
    repeat <array_size>
    if GetGlobalFlag flag = CAREER_ONETIMEINTRO
        return 
    endif
    change viewer_buttons_enabled = 0
    do_actual_pause
    create_pause_menu no_actual_menu
endscript

script sysnotify_handle_unpause 
    printf '------------------------'
    printf 'sysnotify_handle_unpause'
    printf '------------------------'
    change paused_for_hardware = 0
    sysnotify_wait_until_safe
    if InFrontend
        broadcastevent type = profile_status_confirmed
        UnpauseMusicAndStreams
        return 
    endif
    if NOT InNetGame
        if NOT GameIsPaused
            return 
        endif
    endif
    if CustomParkMode editing
        return 
    endif
    if IsTrue cat_pak_is_loaded
        return 
    endif
    GetArraySize sysnotify_paused_screen_elements
    <i> = 0
    begin 
    if ScreenElementExists id = (sysnotify_paused_screen_elements [ <i> ])
        return 
    endif
    <i> = (<i> + 1)
    repeat <array_size>
    if GetGlobalFlag flag = CAREER_ONETIMEINTRO
        return 
    endif
    do_actual_unpause
    exit_pause_menu
    change inside_pause = 0
endscript

script sysnotify_reset_user_progress 
    ResetToDefaultProfile \{ name = custom_classic partial = stats_and_tricks }
    ResetToDefaultProfile \{ name = custom_story }
    CareerFunc \{ func = reset }
    UnsetGlobalFlag \{ flag = CAREER_STARTED }
    UnsetGlobalFlag \{ flag = CLASSIC_STARTED }
    UnsetGlobalFlag \{ flag = CAS_PANDA_SUIT_UNLOCKED }
    change \{ attempted_xbox_autoload = 0 }
    change \{ no_load = 0 }
    change \{ xenon_device_checked = -1 }
endscript

script sysnotify_handle_signin_change 
    printf '------------------------------'
    printf 'sysnotify_handle_signin_change'
    printf '------------------------------'
    sysnotify_wait_until_safe
    switch <message>
        case live_connection_lost
        if InFrontend
            if NOT xboxlive_menus_active
                return 
            endif
        else
            if NOT InNetGame
                return 
            endif
        endif
        case user_changed
        sysnotify_reset_user_progress
        options_retrieve_from_user_profile
        default 
        printf '- no response required'
        return 
    endswitch
    KillSpawnedScript name = game_progress_process_status
    if InFrontend
        if NOT xboxlive_menus_active
            <need_cleanup> = 0
            if ChecksumEquals a = (main_menu_current_state)b = main
                if ScreenElementExists id = dialog_box_anchor
                    <need_cleanup> = 1
                endif
            else
                <need_cleanup> = 1
            endif
            if (<need_cleanup> = 1)
                cleanup_arbitrary_game_mode_settings
                dialog_box_exit
                KillSpawnedScript name = main_menu_exit
                if ScreenElementExists id = current_menu_anchor
                    DestroyScreenElement id = current_menu_anchor
                endif
                if ScreenElementExists id = progress_anchor
                    DestroyScreenElement id = progress_anchor
                endif
                if ScreenElementExists id = cas_category_anchor
                    DestroyScreenElement id = cas_category_anchor
                endif
                main_menu_camera_control next_state = main
                create_main_menu
            endif
            return 
        endif
    endif
    if ScreenElementExists id = link_lost_dialog_anchor
        return 
    endif
    sysnotify_cleanup_misc
    if ((InFrontend)|| (NetSessionFunc obj = match func = still_in_netgame))
        if NOT IsObserving
            if ObjectExists id = skater
                skater ::netenableplayerinput
            endif
        endif
        live_connection_loss_back
    else
        level_select_change_level_quit level = Load_Z_MainMenu
    endif
endscript

script sysnotify_handle_game_invite 
    printf \{ '----------------------------' }
    printf \{ 'sysnotify_handle_game_invite' }
    printf \{ '----------------------------' }
    sysnotify_wait_until_safe
    sysnotify_cleanup_misc
    if GotParam \{ cross_game }
        cross_game_invite_accepted <...> 
    else
        invite_accepted <...> 
    endif
endscript

script sysnotify_handle_connection_loss 
    printf '--------------------------------'
    printf 'sysnotify_handle_connection_loss'
    printf '--------------------------------'
    sysnotify_wait_until_safe
    if isPC
        printf 'sysnotify_handle_connection_loss: ispc'
        if ScreenElementExists id = link_lost_dialog_anchor
            printf 'sysnotify_handle_connection_loss: any screen is present'
            return 
        endif
    endif
    printf 'sysnotify_handle_connection_loss: screen is NOT present'
    cleanup_sessionfuncs
    xboxlive_lost_connection_ui_cleanup
    create_link_unplugged_dialog
endscript

script sysnotify_cleanup_misc 
    if ScreenElementExists id = root_window
        FireEvent type = unfocus target = root_window
    endif
    if InFrontend
        KillSpawnedScript name = attract_mode_timer
        if ScreenElementExists id = cas_category_anchor
            DestroyScreenElement id = cas_category_anchor
        endif
        if ScreenElementExists id = progress_anchor
            DestroyScreenElement id = progress_anchor
        endif
    endif
    destroy_onscreen_keyboard
    if InNetGame
        force_close_rankings dont_retry
        if LocalSkaterExists
            skater ::vibrate Off
        endif
        if NOT IsObserving
            ExitSurveyorMode
        endif
        dialog_box_exit anchor_id = link_lost_dialog_anchor
        dialog_box_exit anchor_id = quit_dialog_anchor
    endif
    if ScreenElementExists id = piece_menu_hmenu
        DestroyScreenElement id = piece_menu_hmenu
    endif
    dialog_box_exit
    change main_menu_return_to_createamodes = 0
    change update_transition_nodes = 0
    change check_for_unplugged_controllers = 0
    change inside_pause = 0
    kill_start_key_binding
    KillSpawnedScript name = main_menu_exit
endscript

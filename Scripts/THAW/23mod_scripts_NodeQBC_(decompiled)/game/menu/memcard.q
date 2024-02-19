VERSION_OPTIONSANDPROS = 61
VERSION_NETWORKSETTINGS = 10
VERSION_CAS = 23
VERSION_CAT = 2
VERSION_PARK = 7
VERSION_CREATEDGOALS = 8
VERSION_CREATEDGRAPHIC = 1
max_memcard_filename_length = 15
SaveSize_OptionsAndPros = 90000
SaveSize_OptionsAndPros_PS2 = 120000
SaveSize_NetworkSettings = 1100
SaveSize_Cat = 34000
SaveSize_Park = 35000
SaveSize_CreatedGoals = 100000
SaveSize_CreatedGraphic = 32000
CATIconSpaceRequired = 8
ParkIconSpaceRequired = 8
OptionsProsIconSpaceRequired = 11
NetworkSettingsIconSpaceRequired = 9
CreatedGoalsIconSpaceRequired = 9
CreatedGraphicIconSpaceRequired = 8
badversionnumber = "Z£A WERSJA!"
damagedfile = "USZKODZONY!"
NGCDamagedFile = "PLIK USZKODZONY!"
SavingOrLoading = saving
PreviousProgressiveMode = Off

script save_previous_progressive_mode 
    if GetGlobalFlag \{ flag = SCREEN_MODE_PROGRESSIVE }
        change \{ PreviousProgressiveMode = on }
    else
        change \{ PreviousProgressiveMode = Off }
    endif
endscript

script restore_previous_progressive_mode 
    if ChecksumEquals a = (PreviousProgressiveMode)b = on
        SetGlobalFlag \{ flag = SCREEN_MODE_PROGRESSIVE }
    else
        UnsetGlobalFlag \{ flag = SCREEN_MODE_PROGRESSIVE }
    endif
endscript

script GetFileTypeName 
    switch <file_type>
        case OptionsAndPros
        return filetype_name = 'POSTÊP W GRZE'
        case NetworkSettings
        if IsXbox
            return filetype_name = 'USTAWIENIA PO£¥CZENIA SYSTEMOWEGO'
        else
            return filetype_name = 'PREFERENCJE SIECIOWE'
        endif
        case cas
        return filetype_name = 'SKEJT'
        case CAT
        return filetype_name = 'TRIK'
        case Park
        return filetype_name = 'PARK'
        case CreatedGoals
        return filetype_name = 'CELE'
        case createdgraphic
        return filetype_name = 'GRAFIKI'
        default 
        return filetype_name = ''
    endswitch
endscript

script QuitToDashboard 
    GetPlatform
    switch <platform>
        case ps2
        ResetPS2
        case xbox
        GotoXboxDashboard memory total_blocks_needed = <total_blocks_needed>
        case ngc
        ResetToIPL
        case xenon
        printf \{ 'QuitToDashboard' }
    endswitch
endscript

script destroy_pause_menu 
    if ObjectExists \{ id = current_menu_anchor }
        DestroyScreenElement \{ id = current_menu_anchor }
        wait \{ 1 gameframe }
    endif
    kill_start_key_binding
endscript

script destroy_main_menu 
    if ObjectExists \{ id = current_menu_anchor }
        DestroyScreenElement \{ id = current_menu_anchor }
        wait \{ 1 gameframe }
    endif
endscript

script destroy_files_menu 
    if ObjectExists \{ id = files_menu }
        DestroyScreenElement \{ id = files_menu }
        wait \{ 1 frame }
    endif
endscript

script destroy_net_settings_menu 
    if ObjectExists \{ id = current_menu_anchor }
        DestroyScreenElement \{ id = current_menu_anchor }
        wait \{ 1 gameframe }
    endif
endscript

script destroy_internet_options_menu 
    if ObjectExists \{ id = current_menu_anchor }
        DestroyScreenElement \{ id = current_menu_anchor }
        wait \{ 1 gameframe }
    endif
endscript

script destroy_level_select 
    if ObjectExists \{ id = current_menu_anchor }
        DestroyScreenElement \{ id = current_menu_anchor }
        wait \{ 1 frame }
    endif
endscript

script ResetAbortAndDoneScripts 
    change \{ DoneScript = DefaultDoneScript }
    change \{ AbortScript = DefaultAbortScript }
    change \{ RetryScript = DefaultRetryScript }
    change \{ SavingOrLoading = saving }
endscript
DoneScript = DefaultDoneScript

script DefaultDoneScript 
    printf \{ 'DefaultDoneScript called !!!' }
endscript
AbortScript = DefaultAbortScript

script DefaultAbortScript 
    printf \{ 'DefaultAbortScript called !!!' }
endscript

script memcard_menus_cleanup 
    EnableReset
    dialog_box_exit \{ no_pad_start }
    destroy_files_menu
    destroy_onscreen_keyboard
    if NOT InFrontend
        if NOT GoalManager_HasActiveGoals
        endif
    endif
    pause_menu_gradient \{ Off }
    SpawnScriptLater \{TemporarilyDisableInput params = { time = 500 }}
endscript

script auto_load_finished 
    memcard_menus_cleanup
    ResetAbortAndDoneScripts
    if IsXenon
        broadcastevent \{ type = auto_load_finished }
    else
        if GetGlobalFlag \{ flag = SCREEN_MODE_PROGRESSIVE }
            if NOT IsPAL
                onload_progressive_scan_check \{ callback_script = launch_main_menu }
            else
                launch_main_menu
            endif
        else
            launch_main_menu
        endif
    endif
endscript

script back_to_pre_cagr_menu 
    memcard_menus_cleanup
    ResetAbortAndDoneScripts
    edit_graphic_create_pre_menu
endscript

script back_to_pre_cas_menu 
    memcard_menus_cleanup
    ResetAbortAndDoneScripts
    if ScreenElementExists \{ id = black_top_strip }
        DoScreenElementMorph \{ id = black_top_strip time = 0 alpha = 1 }
    endif
    create_pre_cas_menu
endscript

script back_to_pause_menu 
    memcard_menus_cleanup
    ResetAbortAndDoneScripts
    restore_start_key_binding
    if (save_successful = 1)
        printf 'save complete ========================='
        parked_quit level = Load_Z_MainMenu
    else
        printf 'save aborted ========================='
        if root_window ::getsingletag save_return_to_pause_menu
            root_window ::removetags tags = [ save_return_to_pause_menu ]
            create_pause_menu
            return 
        endif
        if root_window ::getsingletag save_return_to_game
            root_window ::removetags tags = [ save_return_to_game ]
            ingame_save_return_to_game
            return 
        endif
        create_pause_menu
    endif
    change save_successful = 2
endscript

script back_to_net_settings_menu 
    memcard_menus_cleanup
    ResetAbortAndDoneScripts
    create_network_options_menu
endscript

script back_to_beat_goal 
    memcard_menus_cleanup
    GoalManager_ShowPoints
    ResetAbortAndDoneScripts
    goal_save_reject
endscript

script back_to_select_skater 
    restore_previous_progressive_mode
    memcard_menus_cleanup
    ResetAbortAndDoneScripts
    launch_select_skater_menu
endscript

script back_to_options_menu 
    memcard_menus_cleanup
    if ChecksumEquals a = (SavingOrLoading)b = loading
        if NOT (load_successful = 0)
            if GetGlobalFlag \{ flag = SCREEN_MODE_PROGRESSIVE }
                if NOT ChecksumEquals a = (PreviousProgressiveMode)b = on
                    if NOT IsPAL
                        onload_progressive_scan_check \{ callback_script = create_setup_options_menu }
                        return 
                    endif
                endif
            endif
        endif
    endif
    restore_previous_progressive_mode
    ResetAbortAndDoneScripts
    create_setup_options_menu
endscript

script back_to_career_options_menu 
    memcard_menus_cleanup
    ResetAbortAndDoneScripts
    restore_previous_progressive_mode
    skater ::unhide
    create_gamemode_options_menu
endscript

script back_to_created_park_menu 
    memcard_menus_cleanup
    ResetAbortAndDoneScripts
    if (still_in_net_area = 1)
        back_to_net_host_options
    else
        return_to_created_park_menu
    endif
endscript

script load_loaded_created_park 
    dialog_box_exit
    if LevelIs \{ load_sk5ed_gameplay }
        if InNetGame
            level_select_change_level level = load_sk5ed_gameplay <...> show_warning
            return 
        endif
    endif
    return_to_created_park_menu
endscript

script back_to_net_host_options 
    prefs = network
    field = 'level'
    string = 'Stworzony park'
    checksum = load_sk5ed_gameplay
    select_host_option <...> 
    change \{ still_in_net_area = 0 }
    if ObjectExists \{ id = host_options_menu }
        DestroyScreenElement \{ id = host_options_menu }
    endif
    create_network_host_options_menu
endscript

script back_to_internet_options_menu 
    memcard_menus_cleanup
    ResetAbortAndDoneScripts
    if (load_successful = 1)
        get_upload_description type = <type> filename = <filename>
    else
        if SwitchToTempPoolsIfTheyExist
            ClearMemCardDataForUpload
            SwitchToRegularPools
            RemoveTemporaryMemCardPools
        endif
        create_internet_options
    endif
    change \{ load_successful = 2 }
    change \{ LoadForUpload = 0 }
endscript

script back_to_cat_pause 
    memcard_menus_cleanup
    ResetAbortAndDoneScripts
    create_CAT_pause_menu
endscript

script back_to_pre_cat_menu 
    memcard_menus_cleanup
    ResetAbortAndDoneScripts
    create_pre_cat_menu
endscript

script back_to_edit_cat_menu 
    memcard_menus_cleanup
    ResetAbortAndDoneScripts
    create_CAT_menu \{ load = 0 }
endscript

script finish_loading_cat 
    memcard_menus_cleanup
    ResetAbortAndDoneScripts
    auto_assign_cat_to_slot
endscript

script back_to_edit_tricks_menu 
    memcard_menus_cleanup
    ResetAbortAndDoneScripts
    create_edit_tricks_menu
endscript
RetryScript = DefaultRetryScript

script DefaultRetryScript 
    printf \{ 'DefaultRetryScript called !!!' }
endscript

script mem_card_message_pause time = 3
    DisableReset
    if NOT GotParam NoTimerReset
        ResetTimer
    endif
    change check_for_unplugged_controllers = 0
    <CardCheckCounter> = 0
    begin 
    if NOT CustomParkMode editing
        if ScreenElementExists id = controller_unplugged_dialog_anchor
            change check_for_unplugged_controllers = 1
            goto NullScript
        endif
    endif
    if NOT GotParam NoCardRemovalCheck
        if (<CardCheckCounter> = 10)
            DisableReset
            if NOT CardIsInSlot
                change check_for_unplugged_controllers = 1
                goto mcmess_ErrorNoCardInSlot
            endif
            <CardCheckCounter> = 0
        else
            <CardCheckCounter> = (<CardCheckCounter> + 1)
        endif
    endif
    if TimeGreaterThan <time>
        break 
    endif
    wait 1 gameframe
    repeat 
    change check_for_unplugged_controllers = 1
endscript

script memcard_xenon_select_source \{ force = 0 }
    mcmess_CheckingCard
    ShowStorageSelector force = <force> filetype = <filetype>
    begin 
    if StorageSelectorFinished
        break 
    else
        wait \{ 1 gameframe }
    endif
    repeat 
endscript

script memcard_xenon_force_select_source 
    memcard_menus_cleanup
    memcard_xenon_select_source force = 1 filetype = <filetype>
    check_card <...> 
    create_files_menu <...> 
endscript

script memcard_panic_cleanup 
    CleanupMemcardDirectoryListing
    KillSpawnedScript \{ name = create_files_menu }
    if ScreenElementExists \{ id = files_menu }
        DestroyScreenElement \{ id = files_menu }
    endif
    if SwitchToTempPoolsIfTheyExist
        SwitchToRegularPools
        PopTemporaryMemCardPools
    endif
endscript

script check_card 
    if IsXenon
        memcard_xenon_select_source <...> 
    endif
    if NOT CardIsInSlot
        goto mcmess_ErrorNoCardInSlot
    endif
    if BadDevice
        goto mcmess_BadDevice
    endif
    if CardIsDamaged
        goto mcmess_DamagedCard
    endif
    if NOT SectorSizeOK
        if CardIsDamaged
            goto mcmess_DamagedCard
        else
            goto mcmess_BadSectorSize
        endif
    endif
    if NOT CardIsFormatted_Sync
        if CardIsDamaged
            goto mcmess_DamagedCard
        else
            if GotParam save
                goto mcmess_ErrorNotFormatted
            else
                goto mcmess_ErrorNotFormattedNoFormatOption
            endif
        endif
    endif
    if NOT ((IsXbox)|| (isPC))
        mcmess_CheckingCard
        if IsXenon
            <time> = 0.7500
        endif
        mem_card_message_pause time = <time>
    endif
    dialog_box_exit no_pad_start
endscript
StopCheckingForCardRemoval = 0

script CheckForCardRemoval 
    change \{ StopCheckingForCardRemoval = 0 }
    <CardCheckCounter> = 0
    begin 
    if (<CardCheckCounter> = 10)
        if NOT CardIsInSlot
            goto \{ mcmess_ErrorNoCardInSlot }
        endif
        <CardCheckCounter> = 0
    else
        <CardCheckCounter> = (<CardCheckCounter> + 1)
    endif
    if NOT ObjectExists id = <menu_id>
        break 
    endif
    if IsTrue \{ StopCheckingForCardRemoval }
        break 
    endif
    wait \{ 1 gameframe }
    repeat 
endscript

script DoFormatCard 
    KillSpawnedScript \{ name = CheckForCardRemoval }
    if NOT IsNGC
        if CardIsFormatted
            goto \{ DoneScript }
        endif
    endif
    ResetTimer
    mcmess_FormattingCard
    DisableReset
    if FormatCard
        mem_card_message_pause \{ XSkips NoTimerReset NoCardRemovalCheck }
        goto \{ mcmess_FormatSuccessful }
    else
        mem_card_message_pause \{ XSkips NoTimerReset NoCardRemovalCheck }
        goto \{ mcmess_FormatFailed }
    endif
endscript

script mem_card_update_directoy_query 
    dialog_box_exit \{ no_pad_start }
    mcmess_CheckingCard
    begin 
    if NOT ProcessNextInMemCardDirectoryListing
        dialog_box_exit \{ no_pad_start }
        return 
    endif
    wait \{ 4 gameframes }
    repeat 
endscript

script launch_files_menu 
    memcard_menus_cleanup
    create_files_menu <...> 
endscript

script create_files_menu pos_tweak = (-20.0, -45.0)
    SetAnalogStickActiveForMenus 1
    if CustomParkMode editing
        if ScreenElementExists id = controller_unplugged_dialog_anchor
            return 
        endif
    endif
    if GotParam save
        UnloadAnimsAndCreateMemCardPools
        GetMemCardDirectoryListing count_only filetype = <filetype>
        GetMemCardSpaceAvailable
        GetMemCardSpaceRequired <filetype>
        if NOT CardIsInSlot
            goto mcmess_ErrorNoCardInSlot
        endif
        RemoveParameter add_createnew_option
        if (<totalthps4filesoncard> = 0)
            if ((<spaceavailable> < <spacerequired>)|| (<filesleft> < 1))
                if NOT IsXenon
                    goto mcmess_ErrorNotEnoughRoomNoTHPSFilesExist params = {
                        filetype = <filetype>
                        spacerequired = <spacerequired>
                        spaceavailable = <spaceavailable>
                    }
                endif
            else
                <add_createnew_option> = 1
            endif
        else
            if ((<spaceavailable> < <spacerequired>)|| (<filesleft> < 1))
                if NOT IsXenon
                    if NOT GotParam DoNotShowNotEnoughRoomMessage
                        goto mcmess_ErrorNotEnoughRoomButTHPSFilesExist params = {filetype = <filetype> spacerequired = <spacerequired>}
                    endif
                endif
            else
                if NOT GotParam fileslimitreached
                    <add_createnew_option> = 1
                endif
            endif
        endif
        if (<spaceavailable> > <spacerequired>)
            GetMemCardDirectoryListing filetype = <filetype>
        else
            GetMemCardDirectoryListing
        endif
    else
        GetMemCardDirectoryListing filetype = <filetype>
    endif
    if GotParam save
        change SavingOrLoading = saving
    else
        change SavingOrLoading = loading
    endif
    if NOT CardIsInSlot
        goto mcmess_ErrorNoCardInSlot
    endif
    SetScreenElementLock id = root_window Off
    GoalManager_HidePoints
    GoalManager_HideGoalPoints
    helper_text_elements = [
        { text = '\b7/\b4 = Zaznacz' }
        { text = '\m1 = Wstecz' }
        { text = '\m0 = Akceptuj' }
    ]
    if GotParam save
        menu_title = 'ZAPISZ'
        AddArrayElement array = <helper_text_elements> element = { text = '\md = Usuñ' }
        <helper_text_elements> = <array>
        RemoveParameter array
    else
        menu_title = 'WCZYTAJ'
    endif
    if IsXenon
        AddArrayElement array = <helper_text_elements> element = { text = '\m2 = Urz¹dzenie' }
        <helper_text_elements> = <array>
        RemoveParameter array
    endif
    if InFrontend
        Pos = (55.0, 40.0)
        bg_pos = (318.0, 77.0)
        top_bar_pos = (60.0, 95.0)
    else
        Pos = (55.0, 50.0)
        bg_pos = (318.0, 87.0)
        top_bar_pos = (60.0, 100.0)
    endif
    make_new_menu {menu_title = ''
        padding_scale = 1
        menu_id = files_menu
        vmenu_id = files_vmenu
        Pos = <Pos>
        dims = (548.0, 192.0)
        just = [ center top ]
        type = vscrollingmenu
        scrolling_menu_id = files_scrolling_menu
        scrolling_menu_title_id = files_scrolling_menu_title
        scrolling_menu_offset = (0.0, 32.0)
        dont_allow_wrap = dont_allow_wrap
        helper_text = { helper_text_elements = <helper_text_elements> }
    }
    if IsXenon
        RemoveParameter card_name
        if GetCardName
            FormatText textname = card_title 'Urz¹dzenie: %s.' s = <card_name>
            CreateScreenElement {
                type = TextElement
                parent = files_menu
                font = testtitle
                text = <card_title>
                Scale = 1.0
                Pos = (50.0, 60.0)
                just = [ left top ]
                not_focusable
            }
            RemoveParameter card_name
            RemoveParameter card_title
        endif
        <selection_params> = <...> 
        RemoveComponent name = directorylisting structure_name = selection_params
        RemoveComponent name = helper_text_elements structure_name = selection_params
        SetScreenElementProps {
            id = current_menu
            event_handlers = [{pad_space memcard_xenon_force_select_source params = <selection_params>}]
        }
        RemoveParameter selection_params
    endif
    SetScreenElementProps {
        id = current_menu
        event_handlers = [{pad_back generic_menu_pad_back params = { callback = reload_anims_then_run_abort_script }}
            {pad_down menu_vert_blink_arrow params = { id = files_menu_down_arrow }}
            {pad_up menu_vert_blink_arrow params = { id = files_menu_up_arrow }}
        ]
    }
    theme_background width = 7.124 Pos = <bg_pos> num_parts = 10 z_priority = 1 static = static
    if InFrontend
        build_theme_sub_title Title = <menu_title> no_grad_bar
    else
        build_theme_sub_title Title = <menu_title>
    endif
    files_menu_add_top_bar Pos = <top_bar_pos>
    if GotParam save
        if GotParam add_createnew_option
            files_menu_add_item {file_type = <filetype>
                filename = '              Stwórz nowy'
                file_size = ''
                pad_choose_script = CreateNew
                font = small
                icon_alpha = 0.0
            }
        endif
        RemoveParameter add_createnew_option
    endif
    if GotParam directorylisting
        if GotParam save
            ForEachIn <directorylisting> do = files_menu_add_item params = {pad_choose_script = OKToOverwrite MenuFileType = <filetype> save}
        else
            ForEachIn <directorylisting> do = files_menu_add_item params = { pad_choose_script = load }
        endif
    else
        if NOT GotParam save
            if NOT IsXenon
                goto mcmess_NoFiles params = { MenuFileType = <filetype> }
            endif
        endif
    endif
    RemoveParameter directorylisting
    files_menu_add_bottom_bar <...> 
    if ScreenElementExists id = controller_unplugged_dialog_anchor
        DoScreenElementMorph id = current_menu_anchor Scale = 0
    else
        FireEvent type = focus target = files_vmenu
    endif
    wait 2 gameframe
    if ScreenElementExists id = files_scrolling_menu
        SetScreenElementProps id = files_scrolling_menu reset_window_top
    endif
    CheckForCardRemoval menu_id = files_menu
endscript

script files_menu_add_item pad_choose_script = NullScript font = dialog icon_alpha = 1.0
    SwitchToTempPoolsIfTheyExist
    Theme_GetUnhighlightedTextColor return_value = unhighlight_rgba
    if IsNGC
        heap = TopDown
        delete_button = pad_circle
    else
        heap = bottomup
        delete_button = pad_square
    endif
    if GotParam save
        if NOT (<file_type> = <MenuFileType>)
            disable_item_overwrite = 1
            unhighlight_rgba = [ 128 128 128 50 ]
        endif
    endif
    CreateScreenElement {
        type = ContainerElement
        parent = current_menu
        dims = (603.0, 24.0)
        event_handlers = [{ focus files_menu_focus }
            { unfocus files_menu_unfocus }
            { <delete_button> files_menu_delete }
        ]
        heap = <heap>
    }
    if NOT GotParam disable_item_overwrite
        SetScreenElementProps {
            id = <id>
            event_handlers = [{ pad_choose <pad_choose_script> }
                { pad_start <pad_choose_script> }
            ]
        }
    endif
    <container_id> = <id>
    if GotParam total_file_size
        if IsPAL
            FormatText textname = date '%d/%m/%y' m = <month> d = <day> y = <year>
            if (10 > <minutes>)
                mzero = '0'
            else
                mzero = ''
            endif
            FormatText textname = time '%h:%z%m' h = <hour> m = <minutes> z = <mzero>
        else
            FormatText textname = date '%m/%d/%y' m = <month> d = <day> y = <year>
            if (10 > <minutes>)
                mzero = '0'
            else
                mzero = ''
            endif
            if (<hour> < 12)
                ampm = 'am'
            else
                ampm = 'pm'
                hour = (<hour> - 12)
            endif
            if (<hour> = 0)
                hour = 12
            endif
            FormatText textname = time '%h:%z%m%a' h = <hour> m = <minutes> z = <mzero> a = <ampm>
        endif
    endif
    RemoveParameter year
    RemoveParameter month
    RemoveParameter day
    RemoveParameter hour
    RemoveParameter minutes
    RemoveParameter seconds
    <container_id> ::settags <...> 
    if ((IsXbox)|| (isPC))
        if GotParam corrupt
            GetFileTypeName file_type = <file_type>
            FormatText textname = filename 'USZKODZONY %s' s = <filetype_name>
        endif
    endif
    CreateScreenElement {
        type = TextElement
        parent = <container_id>
        Scale = 0.7300
        font = <font>
        text = <filename>
        Pos = (25.0, 0.0)
        just = [ left center ]
        rgba = <unhighlight_rgba>
        z_priority = 6
        heap = <heap>
    }
    if GotParam total_file_size
        GetPlatform
        switch <platform>
            case ps2
            FormatText textname = file_size_text '%d KB' d = <total_file_size>
            case xbox
            FormatText textname = file_size_text '%d bloków' d = <total_file_size>
            case ngc
            FormatText textname = file_size_text '%d bloków' d = <total_file_size>
        endswitch
    else
        <file_size_text> = ''
    endif
    CreateScreenElement {
        type = TextElement
        parent = <container_id>
        Scale = 0.7300
        font = small
        text = <file_size_text>
        Pos = (345.0, 2.0)
        just = [ RIGHT center ]
        rgba = <unhighlight_rgba>
        z_priority = 6
        heap = <heap>
    }
    switch <file_type>
        case OptionsAndPros
        <file_type_icon> = mem_career
        case NetworkSettings
        <file_type_icon> = mem_net
        case Park
        <file_type_icon> = mem_park
        case replay
        <file_type_icon> = mem_replay
        case cas
        <file_type_icon> = mem_skater
        case CAT
        <file_type_icon> = mem_tricks
        case CreatedGoals
        <file_type_icon> = mem_goals
        case createdgraphic
        <file_type_icon> = mem_graphics
        default 
        <file_type_icon> = mem_bad
    endswitch
    CreateScreenElement {
        type = SpriteElement
        parent = <container_id>
        Scale = 0.7300
        texture = <file_type_icon>
        Pos = (5.0, 0.0)
        just = [ center center ]
        rgba = [ 50 50 50 128 ]
        Scale = 0.7200
        z_priority = 1
        alpha = <icon_alpha>
        heap = <heap>
    }
    highlight_angle = 0
    CreateScreenElement {
        type = SpriteElement
        parent = <container_id>
        texture = DE_highlight_bar
        Pos = (264.0, 0.0)
        just = [ center center ]
        Scale = (4.5, 0.699999988079071)
        rgba = [ 128 128 128 0 ]
        rot_angle = (<highlight_angle> / 4)
        heap = <heap>
    }
    CreateScreenElement {
        type = TextElement
        parent = <container_id>
        Scale = 0.7300
        font = small
        text = <date>
        Pos = (460.0, 2.0)
        just = [ RIGHT center ]
        rgba = <unhighlight_rgba>
        z_priority = 6
        heap = <heap>
    }
    CreateScreenElement {
        type = TextElement
        parent = <container_id>
        Scale = 0.7300
        font = small
        text = <time>
        Pos = (530.0, 2.0)
        just = [ RIGHT center ]
        rgba = <unhighlight_rgba>
        z_priority = 6
        heap = <heap>
    }
    SwitchToRegularPools
endscript

script files_menu_add_top_bar 
    CreateScreenElement {
        type = ContainerElement
        parent = current_menu_anchor
        dims = (603.0, 24.0)
        Pos = <Pos>
        just = [ left top ]
    }
    <container_id> = <id>
    CreateScreenElement {
        type = SpriteElement
        parent = <container_id>
        id = files_menu_up_arrow
        texture = up_arrow
        Pos = (250.0, 0.0)
        just = [ center center ]
        z_priority = 3
    }
    CreateScreenElement {
        type = SpriteElement
        parent = <container_id>
        texture = black
        Pos = (-5.0, 0.0)
        just = [ left center ]
        Scale = (132.0, 6.699999809265137)
        rgba = [ 0 0 0 60 ]
    }
endscript

script files_menu_add_bottom_bar text_scale = 1.0
    Theme_GetHighlightedTextColor return_value = highlight_rgba
    Theme_GetUnhighlightedTextColor return_value = unhighlight_rgba
    GetStackedScreenElementPos y id = files_scrolling_menu Offset = (0.0, 15.0)
    CreateScreenElement {
        type = ContainerElement
        parent = current_menu_anchor
        Pos = <Pos>
        just = [ left top ]
        not_focusable
    }
    <container_id> = <id>
    CreateScreenElement {
        type = SpriteElement
        parent = <container_id>
        id = files_menu_down_arrow
        texture = down_arrow
        Pos = (240.0, -15.0)
        just = [ left bottom ]
    }
    CreateScreenElement {
        type = SpriteElement
        parent = <container_id>
        texture = black
        Scale = (143.0, 6.0)
        Pos = (-25.0, 0.0)
        just = [ left center ]
        rgba = [ 0 0 0 60 ]
    }
    bar_id = <id>
    GetStackedScreenElementPos y id = <container_id> Offset = (-30.0, 0.0)
    CreateScreenElement {
        type = ContainerElement
        parent = current_menu_anchor
        dims = (603.0, 24.0)
        Pos = <Pos>
        just = [ left top ]
    }
    <info_section_id> = <id>
    CreateScreenElement {
        type = TextElement
        parent = <id>
        id = files_menu_file_info
        font = small
        text = ''
        Pos = (20.0, 0.0)
        Scale = <text_scale>
        rgba = <highlight_rgba>
        just = [ left center ]
    }
    GetStackedScreenElementPos y id = <info_section_id>
    CreateScreenElement {
        type = ContainerElement
        parent = current_menu_anchor
        dims = (603.0, 24.0)
        Pos = <Pos>
        just = [ left top ]
    }
    <mem_info_id> = <id>
    GetPlatform
    if GotParam save
        GetMemCardSpaceRequired <filetype>
        switch <platform>
            case xbox
            case ngc
            FormatText {
                textname = LeftText
                'Potrzeba: %n bloków'
                n = <spacerequired>
            }
            case ps2
            FormatText {
                textname = LeftText
                'Potrzeba: %n KB'
                n = <spacerequired>
            }
        endswitch
    endif
    GetMemCardSpaceAvailable
    switch <platform>
        case xbox
        if (<spaceavailable> > 50000)
            MiddleText = 'Wolne: 50000+'
        else
            FormatText {
                textname = MiddleText
                'Wolnych bloków: %f'
                f = <spaceavailable>
            }
        endif
        case ngc
        FormatText {
            textname = MiddleText
            'Wolnych bloków: %f'
            f = <spaceavailable>
        }
        case ps2
        if (<spaceavailable> < 3)
            displayed_space_available = 0
        else
            displayed_space_available = (<spaceavailable> -2)
        endif
        FormatText {
            textname = MiddleText
            'Wolne: %f KB'
            f = <displayed_space_available>
        }
    endswitch
    GetMaxTHPS4FilesAllowed
    FormatText {
        textname = RightText
        'Zapisy: %t/%m'
        t = <totalthps4filesoncard>
        m = <maxthps4filesallowed>
    }
    if GotParam save
        CreateScreenElement {
            type = TextElement
            parent = <mem_info_id>
            font = small
            Pos = (20.0, -9.0)
            just = [ left top ]
            rgba = <unhighlight_rgba>
            Scale = <text_scale>
            text = <LeftText>
        }
    endif
    GetStackedScreenElementPos x id = <id> Offset = (20.0, 0.0)
    CreateScreenElement {
        type = TextElement
        parent = <mem_info_id>
        font = small
        Pos = <Pos>
        just = [ left top ]
        rgba = <unhighlight_rgba>
        Scale = <text_scale>
        text = <MiddleText>
    }
    GetStackedScreenElementPos x id = <id> Offset = (20.0, 0.0)
    CreateScreenElement {
        type = TextElement
        parent = <mem_info_id>
        font = small
        Pos = <Pos>
        just = [ left top ]
        rgba = <unhighlight_rgba>
        Scale = <text_scale>
        text = <RightText>
    }
    GetStackedScreenElementPos y id = <bar_id> Offset = (29.0, -23.0)
    CreateScreenElement {
        type = SpriteElement
        parent = <mem_info_id>
        texture = white2
        Scale = (71.9000015258789, 3.299999952316284)
        Pos = <Pos>
        just = [ left top ]
        rgba = <highlight_rgba>
        alpha = 0.2500
    }
endscript

script files_menu_focus 
    gettags
    if GotParam disable_item_overwrite
        create_helper_text helper_text_elements = [{ text = '\b7/\b4 = Zaznacz' }
            { text = '\m1 = Wstecz' }
            { text = '\md = Usuñ' }
        ]
    endif
    Theme_GetHighlightedTextColor return_value = highlight_rgba
    Theme_GetHighlightBarColor return_value = bar_rgba
    <files_menu_file_info_text> = ''
    if NOT GotParam index
        GetSummaryInfo <file_type> VaultData = savevaultdata
    endif
    if NOT ((GotParam badversion)|| (GotParam corrupt))
        switch <file_type>
            case OptionsAndPros
            GetClassicLevelGoalCount
            if (<total_goals_complete> > <classic_potential_goals>)
                <total_goals_complete> = <classic_potential_goals>
            endif
            FormatText {
                textname = files_menu_file_info_text
                '\c3Tryb fabularny: %a z %b misji / Klasyczny: %c z %d'
                a = <careermissionscomplete>
                b = <careermissionstotal>
                c = <total_goals_complete>
                d = <classic_potential_goals>
            }
            case NetworkSettings
            FormatText {
                textname = files_menu_file_info_text
                '\c3USTAWIENIA SIECI: %i'
                i = <network_id>
            }
            case cas
            <files_menu_file_info_text> = '\c3Stwórz-skejta'
            case Park
            if NOT GotParam maxplayers
                maxplayers = 1
            endif
            colour = '\c3'
            if InNetGame
                GetNetworkNumPlayers
                if (<num_players> > <maxplayers>)
                    colour = '\c2'
                endif
            endif
            if (<maxplayers> = 1)
                FormatText {
                    textname = files_menu_file_info_text
                    '%cPark dla jednego gracza'
                    c = <colour>
                    d = <maxplayers>
                }
            else
                FormatText {
                    textname = files_menu_file_info_text
                    '%cPark dla maksymalnie %d graczy.'
                    c = <colour>
                    d = <maxplayers>
                }
            endif
            case replay
            FormatText {
                textname = files_menu_file_info_text
                '\c3Replay: %l'
                l = <LevelName>
            }
            case CreatedGoals
            FormatText {
                textname = files_menu_file_info_text
                '\c3%i stworzonych zadañ'
                i = <num_edited_goals>
            }
            case CAT
            if NOT GotParam name
                name = ' '
            endif
            FormatText {
                textname = files_menu_file_info_text
                '\c3IMIÊ: %i'
                i = <name>
            }
            case createdgraphic
            <files_menu_file_info_text> = '\c3Stwóz grafikê'
        endswitch
    endif
    SetScreenElementProps {
        id = files_menu_file_info
        text = <files_menu_file_info_text>
    }
    gettags
    RunScriptOnScreenElement id = {<id> child = 0}text_twitch_effect2
    RunScriptOnScreenElement id = {<id> child = 1}text_twitch_effect2
    RunScriptOnScreenElement id = {<id> child = 4}text_twitch_effect2
    RunScriptOnScreenElement id = {<id> child = 5}text_twitch_effect2
    SetScreenElementProps {
        id = {<id> child = 0}
        rgba = <highlight_rgba>
    }
    SetScreenElementProps {
        id = {<id> child = 1}
        rgba = <highlight_rgba>
    }
    SetScreenElementProps {
        id = {<id> child = 2}
        rgba = <highlight_rgba>
        z_priority = 7
    }
    DoScreenElementMorph {
        id = {<id> child = 2}
        Scale = 1
    }
    SetScreenElementProps {
        id = {<id> child = 3}
        rgba = <bar_rgba>
    }
    SetScreenElementProps {
        id = {<id> child = 4}
        rgba = <highlight_rgba>
    }
    SetScreenElementProps {
        id = {<id> child = 5}
        rgba = <highlight_rgba>
    }
    GetScreenElementDims id = files_vmenu
    if (<height> > 216)
        SetScreenElementProps {
            id = files_menu_up_arrow
            rgba = [ 128 128 128 0 ]
        }
        SetScreenElementProps {
            id = files_menu_down_arrow
            rgba = [ 128 128 128 0 ]
        }
    else
        generic_menu_update_arrows {
            menu_id = files_vmenu
            up_arrow_id = files_menu_up_arrow
            down_arrow_id = files_menu_down_arrow
        }
    endif
endscript

script files_menu_unfocus 
    Theme_GetUnhighlightedTextColor return_value = unhighlight_rgba
    gettags
    if GotParam disable_item_overwrite
        unhighlight_rgba = [ 128 128 128 50 ]
        create_helper_text helper_text_elements = [{ text = '\b7/\b4 = Zaznacz' }
            { text = '\m1 = Wstecz' }
            { text = '\m0 = Akceptuj' }
            { text = '\md = Usuñ' }
        ]
    endif
    KillSpawnedScript name = text_twitch_effect2
    DoScreenElementMorph {
        id = {<id> child = 0}
        Scale = 0.7300
    }
    DoScreenElementMorph {
        id = {<id> child = 1}
        Scale = 0.7300
    }
    DoScreenElementMorph {
        id = {<id> child = 2}
        Scale = 0.7300
    }
    DoScreenElementMorph {
        id = {<id> child = 4}
        Scale = 0.7300
    }
    DoScreenElementMorph {
        id = {<id> child = 5}
        Scale = 0.7300
    }
    SetScreenElementProps {
        id = {<id> child = 0}
        rgba = <unhighlight_rgba>
    }
    SetScreenElementProps {
        id = {<id> child = 1}
        rgba = <unhighlight_rgba>
    }
    SetScreenElementProps {
        id = {<id> child = 2}
        rgba = [ 50 50 50 128 ]
        z_priority = 6
    }
    DoScreenElementMorph {
        id = {<id> child = 2}
        Scale = 0.7200
    }
    SetScreenElementProps {
        id = {<id> child = 3}
        rgba = [ 128 128 128 0 ]
    }
    SetScreenElementProps {
        id = {<id> child = 4}
        rgba = <unhighlight_rgba>
    }
    SetScreenElementProps {
        id = {<id> child = 5}
        rgba = <unhighlight_rgba>
    }
endscript

script files_menu_delete 
    gettags
    if GotParam index
        if GotParam save
            memcard_menus_cleanup
            GetFileTypeName file_type = <file_type>
            if ((IsXbox)|| (isPC))
                FormatText {
                    textname = DeleteText
                    'Usun¹æ %t\n\'%s\' ?'
                    t = <filetype_name>
                    s = <filename>
                }
            else
                FormatText {
                    textname = DeleteText
                    'Usun¹æ plik %t \n\'%s\' ?'
                    t = <filetype_name>
                    s = <filename>
                }
            endif
            create_snazzy_dialog_box {
                Title = 'Usuñ'
                text = <DeleteText>
                pad_back_script = launch_files_menu
                pad_back_params = {filetype = <MenuFileType> save}
                buttons = [
                    {font = small text = 'Nie' pad_choose_script = launch_files_menu pad_choose_params = {filetype = <MenuFileType> save}}
                    {font = small text = 'Tak' pad_choose_script = delete_file pad_choose_params = <...> }
                ]
                destroy_on_event = 0
            }
            CheckForCardRemoval menu_id = dialog_box_anchor
        endif
    endif
endscript

script delete_file 
    memcard_menus_cleanup
    change StopCheckingForCardRemoval = 1
    ResetTimer
    mcmess_DeletingFile filetype = <file_type>
    DisableReset
    if DeleteMemCardFile CardFileName = <actual_file_name> XBoxDirectoryName = <xbox_directory_name>
        mem_card_message_pause XSkips NoTimerReset NoCardRemovalCheck
        EnableReset
        create_snazzy_dialog_box {
            Title = 'Usuniêto'
            text = 'Usuwanie udane'
            pad_back_script = launch_files_menu
            pad_back_params = {filetype = <MenuFileType> save}
            buttons = [
                {font = small text = 'OK' pad_choose_script = launch_files_menu pad_choose_params = {filetype = <MenuFileType> save}}
            ]
            destroy_on_event = 0
        }
        CheckForCardRemoval menu_id = dialog_box_anchor
    else
        mem_card_message_pause XSkips NoTimerReset NoCardRemovalCheck
        goto mcmess_ErrorDeleteFailed
    endif
endscript

script delete_bad_file 
    memcard_menus_cleanup
    ResetTimer
    mcmess_DeletingFile filetype = <file_type>
    DisableReset
    if DeleteMemCardFile {
            CardFileName = <actual_file_name>
            XBoxDirectoryName = <xbox_directory_name>
            UserFileName = <filename>
            type = <file_type>
        }
        EnableReset
        mem_card_message_pause XSkips NoTimerReset NoCardRemovalCheck
        if GotParam GoBackToFilesMenu
            create_snazzy_dialog_box {
                Title = 'Usuniêto'
                text = 'Usuwanie udane'
                pad_back_script = launch_files_menu
                pad_back_params = { filetype = <MenuFileType> }
                buttons = [
                    {font = small text = 'OK' pad_choose_script = launch_files_menu pad_choose_params = { filetype = <file_type> }}
                ]
                destroy_on_event = 0
            }
        else
            create_snazzy_dialog_box {
                Title = 'Usuniêto'
                text = 'Usuwanie udane'
                pad_back_script = AbortScript
                buttons = [
                    {font = small text = 'OK' pad_choose_script = AbortScript}
                ]
                destroy_on_event = 0
            }
        endif
        CheckForCardRemoval menu_id = dialog_box_anchor
    else
        mem_card_message_pause XSkips NoTimerReset NoCardRemovalCheck
        goto mcmess_ErrorDeleteFailed
    endif
endscript

script NGC_delete_bad_file 
    memcard_menus_cleanup
    ResetTimer
    mcmess_DeletingFile
    DisableReset
    if DeleteMemCardFile {
            CardFileName = <actual_file_name>
            UserFileName = <filename>
            type = <file_type>
        }
        EnableReset
        mem_card_message_pause XSkips NoTimerReset NoCardRemovalCheck
        create_snazzy_dialog_box {
            Title = 'Plik'
            text = 'Usuwanie udane'
            pad_back_script = launch_files_menu
            pad_back_params = {filetype = <MenuFileType> save}
            buttons = [
                {font = small text = 'OK' pad_choose_script = launch_files_menu pad_choose_params = {filetype = <MenuFileType> save}}
            ]
            destroy_on_event = 0
        }
        CheckForCardRemoval menu_id = dialog_box_anchor
    else
        mem_card_message_pause XSkips NoTimerReset NoCardRemovalCheck
        goto mcmess_ErrorDeleteFailed
    endif
endscript

script OKToOverwrite 
    if GotParam NoGetTags
    else
        gettags
    endif
    if ((GotParam badversion)|| (GotParam corrupt))
        if IsNGC
            goto mcmess_NGCDeleteCorruptFile params = <...> 
        endif
        return 
    endif
    DisableReset
    GetMemCardSpaceRequired <MenuFileType>
    GetMemCardSpaceAvailable
    EnableReset
    if (<spacerequired> > <spaceavailable> + <total_file_size>)
        goto mcmess_ErrorNotEnoughRoomButTHPSFilesExist params = {
            overwrite
            filetype = <MenuFileType>
            spacerequired = <spacerequired>
            spaceavailable = (<spaceavailable> + <total_file_size>)
        }
    endif
    memcard_menus_cleanup
    GetFileTypeName file_type = <file_type>
    if ((IsXbox)|| (isPC))
        FormatText {
            textname = OverwriteText
            'Nadpisaæ istniej¹ce: %t\n\'%s\' ?'
            t = <filetype_name>
            s = <filename>
        }
    else
        FormatText {
            textname = OverwriteText
            'Czy nadpisaæ istniej¹cy %t plik\n\'%s\' ?'
            t = <filetype_name>
            s = <filename>
        }
    endif
    create_snazzy_dialog_box {
        Title = 'Nadpisz'
        text = <OverwriteText>
        pad_back_script = launch_files_menu
        pad_back_params = {filetype = <MenuFileType> save}
        buttons = [
            {font = small text = 'Nie' pad_choose_script = launch_files_menu pad_choose_params = {filetype = <MenuFileType> save}}
            {
                font = small text = 'Tak'
                pad_choose_script = DeleteOldSaveNew
                pad_choose_params = 
                {
                    filename = <filename>
                    old_file_type = <file_type>
                    new_file_type = <MenuFileType>
                    actual_file_name = <actual_file_name>
                }
            }
        ]
        destroy_on_event = 0
    }
    CheckForCardRemoval menu_id = dialog_box_anchor
endscript

script DeleteOldSaveNew 
    save {
        filename = <filename>
        file_type = <new_file_type>
        total_file_size = <total_file_size>
        overwrite = {CardFileName = <actual_file_name> UserFileName = <filename> type = <old_file_type>}
    }
endscript

script retry_launch_save_network_settings 
    memcard_menus_cleanup
    goto \{ launch_save_network_settings }
endscript

script launch_save_network_settings 
    destroy_net_settings_menu
    skater ::hide
    change \{ RetryScript = retry_launch_save_network_settings }
    change \{ AbortScript = back_to_net_settings_menu }
    change \{ DoneScript = back_to_net_settings_menu }
    change \{ SavingOrLoading = saving }
    check_card \{ filetype = NetworkSettings save }
    launch_files_menu \{ save filetype = NetworkSettings }
endscript

script retry_launch_save_internet_settings 
    memcard_menus_cleanup
    goto \{ launch_save_internet_settings }
endscript

script launch_save_internet_settings 
    destroy_internet_options_menu
    change \{ RetryScript = retry_launch_save_internet_settings }
    change \{ AbortScript = back_to_internet_options_menu }
    change \{ DoneScript = back_to_internet_options_menu }
    change \{ SavingOrLoading = saving }
    check_card \{ filetype = NetworkSettings save }
    launch_files_menu \{ save filetype = NetworkSettings }
endscript

script retry_launch_pause_menu_save_game_sequence 
    memcard_menus_cleanup
    goto \{ launch_pause_menu_save_game_sequence }
endscript

script launch_pause_menu_save_game_sequence 
    destroy_pause_menu
    change \{ RetryScript = retry_launch_pause_menu_save_game_sequence }
    change \{ AbortScript = back_to_pause_menu }
    change \{ DoneScript = back_to_pause_menu }
    change \{ SavingOrLoading = saving }
    check_card \{ filetype = OptionsAndPros save }
    launch_files_menu \{ save filetype = OptionsAndPros }
endscript

script launch_ingame_menu_save_game_sequence 
    if GameModeEquals \{ is_classic }
        root_window ::settags \{ save_return_to_pause_menu }
    endif
    if GameModeEquals \{ is_career }
        PauseObjects
        root_window ::settags \{ save_return_to_game }
    endif
    launch_pause_menu_save_game_sequence
endscript

script launch_quit_career_save_game_sequence 
    change \{ RetryScript = launch_quit_career_save_game_sequence }
    change \{ AbortScript = quit_career_save_game_sequence_abort }
    change \{ DoneScript = career_quit_to_main }
    change \{ SavingOrLoading = saving }
    check_card \{ filetype = OptionsAndPros save }
    launch_files_menu \{ save filetype = OptionsAndPros }
endscript

script quit_career_save_game_sequence_abort 
    memcard_menus_cleanup
    create_pause_menu
endscript
save_successful = 2

script retry_launch_pause_menu_save_park_sequence 
    memcard_menus_cleanup
    goto \{ launch_pause_menu_save_park_sequence }
endscript

script launch_pause_menu_save_park_sequence 
    destroy_pause_menu
    change \{ RetryScript = retry_launch_pause_menu_save_park_sequence }
    change \{ AbortScript = back_to_pause_menu }
    change \{ DoneScript = back_to_pause_menu }
    change \{ SavingOrLoading = saving }
    check_card \{ filetype = Park save }
    launch_files_menu \{ save filetype = Park }
endscript

script retry_launch_park_editor_save_park_sequence 
    memcard_menus_cleanup
    goto \{ launch_park_editor_save_park_sequence }
endscript

script launch_park_editor_save_park_sequence 
    destroy_pause_menu
    change \{ RetryScript = retry_launch_park_editor_save_park_sequence }
    change \{ AbortScript = back_to_pause_menu }
    change \{ DoneScript = back_to_pause_menu }
    change \{ SavingOrLoading = saving }
    change \{ save_successful = 0 }
    check_card \{ filetype = Park save }
    launch_files_menu \{ save filetype = Park }
endscript

script retry_launch_pause_menu_load_park_sequence 
    memcard_menus_cleanup
    goto \{ launch_pause_menu_load_park_sequence }
endscript

script launch_pause_menu_load_park_sequence 
    destroy_pause_menu
    change \{ RetryScript = retry_launch_pause_menu_load_park_sequence }
    change \{ AbortScript = back_to_pause_menu }
    change \{ DoneScript = back_to_pause_menu }
    change \{ SavingOrLoading = loading }
    check_card \{ filetype = Park load }
    launch_files_menu \{ load filetype = Park }
endscript

script retry_launch_level_select_load_park_sequence 
    memcard_menus_cleanup
    goto \{ launch_level_select_load_park_sequence }
endscript

script launch_level_select_load_park_sequence 
    destroy_level_select
    change \{ RetryScript = retry_launch_level_select_load_park_sequence }
    change \{ AbortScript = back_to_created_park_menu }
    change \{ DoneScript = load_loaded_created_park }
    change \{ SavingOrLoading = loading }
    check_card \{ filetype = Park load }
    launch_files_menu \{ load filetype = Park }
endscript
load_successful = 2
LoadForUpload = 0

script retry_launch_upload_file_sequence_cat 
    memcard_menus_cleanup
    goto \{launch_upload_file_sequence params = { type = CAT }}
endscript

script retry_launch_upload_file_sequence_cas 
    memcard_menus_cleanup
    goto \{launch_upload_file_sequence params = { type = OptionsAndPros }}
endscript

script retry_launch_upload_file_sequence_cag 
    memcard_menus_cleanup
    goto \{launch_upload_file_sequence params = { type = CreatedGoals }}
endscript

script retry_launch_upload_file_sequence_cap 
    memcard_menus_cleanup
    goto \{launch_upload_file_sequence params = { type = Park }}
endscript

script retry_launch_upload_file_sequence_cagr 
    memcard_menus_cleanup
    goto \{launch_upload_file_sequence params = { type = createdgraphic }}
endscript

script launch_upload_file_sequence 
    change load_successful = 0
    switch <type>
        case CAT
        change LoadForUpload = 1
        change RetryScript = retry_launch_upload_file_sequence_cat
        case OptionsAndPros
        change LoadForUpload = 1
        change RetryScript = retry_launch_upload_file_sequence_cas
        case CreatedGoals
        change LoadForUpload = 1
        change RetryScript = retry_launch_upload_file_sequence_cag
        case Park
        change LoadForUpload = 1
        change RetryScript = retry_launch_upload_file_sequence_cap
        case createdgraphic
        change LoadForUpload = 1
        change RetryScript = retry_launch_upload_file_sequence_cagr
    endswitch
    change AbortScript = back_to_internet_options_menu
    change DoneScript = back_to_internet_options_menu
    change SavingOrLoading = loading
    check_card filetype = <type> load
    launch_files_menu load filetype = <type>
endscript
savevaultdata = 0

script retry_launch_download_save_sequence_cat 
    memcard_menus_cleanup
    goto \{launch_download_save_sequence params = { file_type = CAT }}
endscript

script retry_launch_download_save_sequence_cas 
    memcard_menus_cleanup
    goto \{launch_download_save_sequence params = { file_type = OptionsAndPros }}
endscript

script retry_launch_download_save_sequence_cag 
    memcard_menus_cleanup
    goto \{launch_download_save_sequence params = { file_type = CreatedGoals }}
endscript

script retry_launch_download_save_sequence_cap 
    memcard_menus_cleanup
    goto \{launch_download_save_sequence params = { file_type = Park }}
endscript

script retry_launch_download_save_sequence_cagr 
    memcard_menus_cleanup
    goto \{launch_download_save_sequence params = { file_type = createdgraphic }}
endscript

script launch_download_save_sequence 
    if NOT GotParam file_type
        printf 'missing param file_type'
        return 
    endif
    switch <file_type>
        case CAT
        change RetryScript = retry_launch_download_save_sequence_cat
        change savevaultdata = 1
        case OptionsAndPros
        change RetryScript = retry_launch_download_save_sequence_cas
        change savevaultdata = 1
        case CreatedGoals
        change RetryScript = retry_launch_download_save_sequence_cag
        change savevaultdata = 1
        case Park
        change RetryScript = retry_launch_download_save_sequence_cap
        change savevaultdata = 1
        case createdgraphic
        change RetryScript = retry_launch_download_save_sequence_cagr
        change savevaultdata = 1
        default 
        printf 'bad file_type'
    endswitch
    change AbortScript = back_from_transfer_succeeded_dialog
    change DoneScript = back_from_transfer_succeeded_dialog
    change SavingOrLoading = saving
    check_card filetype = <file_type> save
    launch_files_menu save filetype = <file_type>
endscript

script retry_launch_save_cas_sequence 
    memcard_menus_cleanup
    goto \{ launch_save_cas_sequence }
endscript

script launch_save_cas_sequence 
    destroy_main_menu
    if ScreenElementExists \{ id = black_top_strip }
        DoScreenElementMorph \{ id = black_top_strip time = 0 alpha = 0 }
    endif
    change \{ RetryScript = retry_launch_save_cas_sequence }
    change \{ AbortScript = back_to_pre_cas_menu }
    change \{ DoneScript = back_to_pre_cas_menu }
    change \{ SavingOrLoading = saving }
    check_card \{ filetype = OptionsAndPros save }
    launch_files_menu \{ save filetype = OptionsAndPros from_cas }
endscript

script retry_launch_save_cat_sequence 
    memcard_menus_cleanup
    goto \{ launch_save_cat_sequence }
endscript

script launch_save_cat_sequence 
    if ScreenElementExists \{ id = current_menu_anchor }
        DestroyScreenElement \{ id = current_menu_anchor }
    endif
    change \{ RetryScript = retry_launch_save_cat_sequence }
    change \{ AbortScript = back_to_cat_pause }
    change \{ DoneScript = back_to_cat_pause }
    change \{ SavingOrLoading = saving }
    check_card \{ filetype = CAT save }
    launch_files_menu \{ save filetype = CAT }
endscript

script retry_launch_options_menu_save_game_sequence 
    memcard_menus_cleanup
    goto \{ launch_options_menu_save_game_sequence }
endscript

script launch_options_menu_save_game_sequence 
    destroy_main_menu
    change \{ RetryScript = retry_launch_options_menu_save_game_sequence }
    change \{ AbortScript = back_to_options_menu }
    change \{ DoneScript = back_to_options_menu }
    change \{ SavingOrLoading = saving }
    check_card \{ save filetype = OptionsAndPros }
    launch_files_menu \{ save filetype = OptionsAndPros }
endscript

script retry_launch_beat_goal_save_game_sequence 
    memcard_menus_cleanup
    goto \{ launch_beat_goal_save_game_sequence }
endscript

script launch_beat_goal_save_game_sequence 
    change \{ RetryScript = retry_launch_beat_goal_save_game_sequence }
    change \{ AbortScript = back_to_beat_goal }
    change \{ DoneScript = back_to_beat_goal }
    change \{ SavingOrLoading = saving }
    check_card \{ filetype = OptionsAndPros save }
    launch_files_menu \{ save filetype = OptionsAndPros }
endscript

script retry_launch_save_cagr_sequence 
    memcard_menus_cleanup
    goto \{ launch_save_cagr_sequence }
endscript

script launch_save_cagr_sequence 
    destroy_main_menu
    change \{ RetryScript = retry_launch_save_cagr_sequence }
    change \{ AbortScript = back_to_pre_cagr_menu }
    change \{ DoneScript = back_to_pre_cagr_menu }
    change \{ SavingOrLoading = saving }
    check_card \{ filetype = createdgraphic save }
    launch_files_menu \{ save filetype = createdgraphic }
endscript

script AppendDigitsToFilenameUntilNoClash max_chars = 15
    if NOT ((IsXbox)|| (isPC))
        PauseMusic 1
        PauseStream 1
    endif
    <newfilename> = <filename>
    <i> = 2
    begin 
    DisableReset
    if NOT MemCardFileExists name = <newfilename> type = <file_type>
        if NOT ((IsXbox)|| (isPC))
            PauseMusic -1
            PauseStream -1
        endif
        return filename = <newfilename>
        break 
    endif
    AppendSuffix newtextname = newfilename text = <filename> suffix = <i> maxchars = <max_chars>
    <i> = (<i> + 1)
    repeat 
    if NOT ((IsXbox)|| (isPC))
        PauseMusic -1
        PauseStream -1
    endif
endscript

script CreateNew 
    gettags
    memcard_menus_cleanup
    switch <file_type>
        case OptionsAndPros
        GetCustomSkaterName
        <filename> = <display_name>
        case NetworkSettings
        if IsXbox
            <filename> = 'Ustalono po³o¹czenie systemu'
        else
            <filename> = 'Ustawienia sieci'
        endif
        case CAT
        get_CAT_other_param_values trick_index = 0
        <filename> = <name>
        case Park
        GetCustomParkName
        <filename> = <name>
        case replay
        <filename> = 'Replay'
        case CreatedGoals
        <filename> = 'Stworzone zadania'
        case createdgraphic
        <filename> = 'Grafika'
        default 
        <filename> = 'Dooby Doo'
    endswitch
    if (savevaultdata = 1)
        GetScriptString
        filename = <string>
    endif
    AppendDigitsToFilenameUntilNoClash file_type = <file_type> filename = <filename> max_chars = max_memcard_filename_length
    create_onscreen_keyboard {
        allow_cancel
        keyboard_cancel_script = launch_files_menu
        keyboard_cancel_params = {filetype = <file_type> save}
        keyboard_done_script = CreateNew_Done
        keyboard_title = 'ZAPISZ IMIÊ'
        text = <filename>
        min_length = 1
        max_length = max_memcard_filename_length
        filetype = <file_type>
        disable_special_character_tabs
    }
    CheckForCardRemoval menu_id = keyboard_anchor
endscript

script CreateNew_Done 
    GetTextElementString id = keyboard_current_string
    StringRemoveTrailingWhitespace param = string
    memcard_menus_cleanup
    if (savevaultdata = 0)
        switch <filetype>
            case OptionsAndPros
            SetCustomSkaterFilename <string>
            case Park
            SetCustomParkName name = <string>
            SetParkName <string>
            case CAT
            get_CAT_other_param_values trick_index = 0
            if (<name> = '')
                set_new_CAT_param_values trick_index = 0 name = <string> can_spin = <can_spin> is_grind = <is_grind>
            endif
        endswitch
    endif
    check_card filetype = <filetype> save
    DisableReset
    if MemCardFileExists name = <string> type = <filetype>
        OKToOverwrite NoGetTags filename = <string> file_type = <filetype> MenuFileType = <filetype> total_file_size = <total_file_size>
    else
        save filename = <string> file_type = <filetype>
    endif
endscript

script save 
    memcard_menus_cleanup
    GetCurrentSkaterProfileIndex
    SetSkaterProfileCagInfo player = <currentSkaterProfileIndex> params = edit_graphic_layer_infos
    if (savevaultdata = 0)
        switch <file_type>
            case Park
            SetCustomParkName name = <filename>
            SetParkName <filename>
            case OptionsAndPros
            SetCustomSkaterFilename <filename>
        endswitch
    endif
    DisableReset
    ResetTimer
    if GotParam overwrite
        change StopCheckingForCardRemoval = 1
        mcmess_OverwritingData filetype = <file_type>
        change StopCheckingForCardRemoval = 0
        if NOT DeleteMemCardFile CardFileName = (<overwrite>.CardFileName)UserFileName = (<overwrite>.UserFileName)type = (<overwrite>.type)
            RemoveMemCardPoolsAndLoadAnims
            goto mcmess_ErrorOverwriteFailed
        endif
        if MemCardFileExists name = <filename> type = <file_type>
            goto OKToOverwrite params = {NoGetTags filename = <filename> file_type = <file_type> MenuFileType = <file_type> total_file_size = <total_file_size>}
        endif
    else
        mcmess_SavingData filetype = <file_type>
    endif
    DisableReset
    if SaveToMemoryCard name = <filename> type = <file_type> savevaultdata = savevaultdata
        RemoveMemCardPoolsAndLoadAnims
        mem_card_message_pause NoTimerReset NoCardRemovalCheck
        if (save_successful = 0)
            change save_successful = 1
            goto AbortScript params = { type = <file_type> }
        else
            if GotParam overwrite
                goto mcmess_OverwriteSuccessful params = { type = <file_type> }
            else
                goto mcmess_SaveSuccessful params = { type = <file_type> }
            endif
        endif
    else
        RemoveMemCardPoolsAndLoadAnims
        mem_card_message_pause XSkips NoTimerReset NoCardRemovalCheck
        if GotParam overwrite
            goto mcmess_ErrorOverwriteFailed
        else
            goto mcmess_ErrorSaveFailed
        endif
    endif
endscript
DoAutoload = 1
no_load = 0
most_recent_save_exists = 0
attempted_xbox_autoload = 0
goto_secret_shop = 0

script maybe_go_back_to_online_lobby 
    if ((IsPs2)|| (isPC))
        if NetSessionFunc func = match_started
            SetNetworkMode INTERNET_MODE
            change_gamemode_net
            NetSessionFunc obj = match func = set_quiet_mode params = { Off }
            change main_menu_current_state = online
            kill_start_key_binding
            goto rejoin_lobby
        endif
    else
        if GameModeEquals is_net
            if NetSessionFunc func = match_started
                if IsXbox
                    if NOT NetSessionFunc func = invited_session_pending
                        if NetSessionFunc obj = match func = logged_in
                            goto xboxlive_menu_create
                        endif
                    endif
                else
                    if NetSessionFunc obj = match func = logged_in
                        goto xboxlive_menu_create
                    endif
                endif
            endif
        endif
    endif
endscript

script maybe_auto_load_from_memory_card 
    if (DoAutoload = 0)
        SpawnScriptLater wait_and_pause_skater params = {time = 1 dont_pause_music = 1}
        maybe_go_back_to_online_lobby
        launch_main_menu
    else
        change DoAutoload = 0
        maybe_go_back_to_online_lobby
        if ((IsXbox)|| (IsXenon)|| (isPC))
            if NOT GotParam force_autoload
                wait 3 gameframes
                if NOT PadsPluggedIn
                    goto launch_main_menu
                endif
                SpawnScriptLater wait_and_pause_skater
                goto launch_main_menu
            else
                SpawnScriptLater wait_and_pause_skater params = { time = 1 }
                CheckForCardOnBootup
            endif
        else
            SpawnScriptLater wait_and_pause_skater
            CheckForCardOnBootup
        endif
    endif
endscript

script CheckForCardOnBootup 
    ResetAbortAndDoneScripts
    change SavingOrLoading = loading
    if IsXenon
        memcard_xenon_select_source force = 1
    endif
    DisableReset
    if CardIsInSlot
        if BadDevice
            change RetryScript = CheckForCardOnBootup
            change AbortScript = auto_load_finished
            goto mcmess_BadDevice
        else
            if SectorSizeOK
                if IsXenon
                    mem_card_message_pause time = 0.7500
                endif
                goto auto_load
            else
                change RetryScript = CheckForCardOnBootup
                change AbortScript = auto_load_finished
                if CardIsDamaged
                    goto mcmess_DamagedCard
                else
                    goto mcmess_BadSectorSize
                endif
            endif
        endif
    else
        change RetryScript = CheckForCardOnBootup
        change AbortScript = auto_load_finished
        goto mcmess_ErrorNoCardOnBootup
    endif
endscript

script auto_load 
    if (no_load = 0)
        memcard_menus_cleanup
    endif
    change AbortScript = auto_load_finished
    change DoneScript = auto_load_finished
    change RetryScript = auto_load
    change SavingOrLoading = loading
    StopMusic
    DisableReset
    if NOT CardIsInSlot
        goto mcmess_ErrorNoCardOnBootup
    endif
    ResetTimer
    mcmess_CheckingCard
    DisableReset
    if BadDevice
        mem_card_message_pause NoTimerReset NoCardRemovalCheck
        goto mcmess_BadDevice
    endif
    if CardIsDamaged
        mem_card_message_pause NoTimerReset NoCardRemovalCheck
        goto mcmess_DamagedCard
    endif
    if NOT SectorSizeOK
        if CardIsDamaged
            mem_card_message_pause NoTimerReset NoCardRemovalCheck
            goto mcmess_DamagedCard
        else
            mem_card_message_pause NoTimerReset NoCardRemovalCheck
            goto mcmess_BadSectorSize
        endif
    endif
    DisableReset
    if NOT CardIsFormatted
        if CardIsDamaged
            goto mcmess_DamagedCard
        else
            if IsPs2
                RemoveMemCardPoolsAndLoadAnims
                KillSpawnedScript name = wait_and_pause_skater
                goto auto_load_finished
            else
                mem_card_message_pause NoTimerReset NoCardRemovalCheck
                goto mcmess_ErrorNotFormatted params = {QuitText = 'Kontynuowaæ bez formatowania' backScript = NullScript}
            endif
        endif
    endif
    if (no_load = 0)
        DisableReset
        GetMemCardDirectoryListing
        GetMostRecentSave <directorylisting> NetworkSettings
        mem_card_message_pause NoTimerReset NoCardRemovalCheck
        if NOT CardIsInSlot
            goto mcmess_ErrorNoCardOnBootup
        endif
    endif
    <did_load> = 0
    if GotParam mostrecentsave
        change most_recent_save_exists = 1
        ResetTimer
        mcmess_LoadingData filetype = NetworkSettings
        DisableReset
        if LoadFromMemoryCard name = (<mostrecentsave>.filename)type = NetworkSettings
            mem_card_restore_network_config
        else
            mem_card_message_pause NoTimerReset NoCardRemovalCheck
            goto mcmess_ErrorLoadFailed params = {
                <...> 
                filename = (<mostrecentsave>.filename)
                actual_file_name = (<mostrecentsave>.actual_file_name)
                file_type = NetworkSettings
            }
        endif
        <did_load> = 1
    endif
    DisableReset
    GetMostRecentSave <directorylisting> OptionsAndPros
    if GotParam mostrecentsave
        if (<did_load> = 0)
            ResetTimer
            mcmess_LoadingData filetype = OptionsAndPros
        endif
        SetSectionsToApplyWhenLoading all
        DisableReset
        if NOT LoadFromMemoryCard name = (<mostrecentsave>.filename)type = OptionsAndPros
            mem_card_message_pause NoTimerReset NoCardRemovalCheck
            goto mcmess_ErrorLoadFailed params = {
                <...> 
                filename = (<mostrecentsave>.filename)
                actual_file_name = (<mostrecentsave>.actual_file_name)
                file_type = OptionsAndPros
            }
        endif
        <did_load> = 1
    endif
    if (<did_load> = 1)
        mem_card_message_pause NoTimerReset
    endif
    DisableReset
    if IsXenon
        if NOT GotParam mostrecentsave
            goto mcmess_NoFiles params = { MenuFileType = <filetype> }
        endif
    else
        GetMemCardSpaceAvailable
        GetSaveSizes
        if IsPs2
            if IsPAL
                <TotalSpaceRequired> = <SaveSize_OptionsAndPros>
            else
                <TotalSpaceRequired> = (<SaveSize_OptionsAndPros> + 
                <SaveSize_Park> + 
                <SaveSize_CreateATrick> + 
                <SaveSize_NetworkSettings>)
            endif
        else
            <TotalSpaceRequired> = (<SaveSize_OptionsAndPros> + 
            <SaveSize_Park> + 
            <SaveSize_CreateATrick> + 
            <SaveSize_CreatedGraphic>)
        endif
        if (<filesleft> < 4)
            mem_card_message_pause XSkips NoTimerReset
            goto mcmess_ErrorNotEnoughSpaceToSaveAllTypes
        endif
        if (<spaceavailable> < <TotalSpaceRequired>)
            mem_card_message_pause XSkips NoTimerReset
            goto mcmess_ErrorNotEnoughSpaceToSaveAllTypes
        endif
    endif
    goto auto_load_finished
endscript

script mem_card_restore_network_config 
    GetPreferenceChecksum \{ pref_type = network config_type }
    switch <checksum>
        case config_sony
        if LoadNetConfigs
            GetPreferenceString \{ pref_type = network config_type }
            ChooseNetConfig name = <ui_string>
        else
            clear_config_type
            clear_device_type
        endif
    endswitch
endscript

script retry_launch_pause_menu_save_created_goals 
    memcard_menus_cleanup
    goto \{ launch_pause_menu_save_created_goals }
endscript

script launch_pause_menu_save_created_goals 
    memcard_menus_cleanup
    root_window ::settags \{ save_return_to_pause_menu }
    change \{ RetryScript = retry_launch_pause_menu_save_created_goals }
    change \{ AbortScript = back_to_pause_menu }
    change \{ DoneScript = back_to_pause_menu }
    change \{ SavingOrLoading = saving }
    check_card \{ filetype = CreatedGoals save }
    launch_files_menu \{ save filetype = CreatedGoals }
endscript
DoInitialiseCreatedGoalsAfterLoading = 0

script retry_launch_pause_menu_load_created_goals 
    memcard_menus_cleanup
    goto \{ launch_pause_menu_load_created_goals }
endscript

script launch_pause_menu_load_created_goals 
    destroy_pause_menu
    root_window ::settags \{ save_return_to_pause_menu }
    change \{ RetryScript = retry_launch_pause_menu_load_created_goals }
    change \{ AbortScript = back_to_pause_menu }
    change \{ DoneScript = back_to_pause_menu }
    change \{ SavingOrLoading = loading }
    change \{ DoInitialiseCreatedGoalsAfterLoading = 1 }
    check_card \{ filetype = CreatedGoals }
    launch_files_menu \{ filetype = CreatedGoals }
endscript

script launch_load_created_goals_from_select_goals_menu 
    change \{ check_for_unplugged_controllers = 0 }
    memcard_menus_cleanup
    change \{ RetryScript = launch_load_created_goals_from_select_goals_menu }
    change \{ AbortScript = create_select_goals_menu }
    change \{ DoneScript = create_select_goals_menu }
    change \{ SavingOrLoading = loading }
    change \{ DoInitialiseCreatedGoalsAfterLoading = 0 }
    check_card \{ filetype = CreatedGoals }
    launch_files_menu \{ filetype = CreatedGoals }
    change \{ check_for_unplugged_controllers = 1 }
endscript

script launch_load_created_goals_from_host_goals_menu 
    memcard_menus_cleanup
    change \{ RetryScript = launch_load_created_goals_from_host_goals_menu }
    change \{ AbortScript = launch_network_host_options_menu }
    change \{ DoneScript = host_options_goals_sub_menu_return }
    change \{ SavingOrLoading = loading }
    change \{ DoInitialiseCreatedGoalsAfterLoading = 0 }
    check_card \{ filetype = CreatedGoals }
    launch_files_menu \{ filetype = CreatedGoals }
endscript

script launch_load_created_goals_from_game_options_menu 
    memcard_menus_cleanup
    change \{ RetryScript = launch_load_created_goals_from_game_options_menu }
    change \{ AbortScript = create_network_game_options_menu }
    change \{ DoneScript = game_options_goals_sub_menu_return }
    change \{ SavingOrLoading = loading }
    change \{ DoInitialiseCreatedGoalsAfterLoading = 0 }
    check_card \{ filetype = CreatedGoals }
    launch_files_menu \{ filetype = CreatedGoals }
endscript

script retry_launch_load_network_settings 
    memcard_menus_cleanup
    goto \{ launch_load_network_settings }
endscript

script loaded_network_preferences 
    GetPreferenceChecksum \{ pref_type = network config_type }
    switch <checksum>
        case config_sony
        GetPreferenceString \{ pref_type = network config_type }
        if NOT ChooseNetConfig name = <ui_string>
            clear_config_type
            clear_device_type
        endif
        default 
        clear_config_type
        clear_device_type
    endswitch
    back_to_net_settings_menu
endscript

script launch_load_network_settings 
    destroy_net_settings_menu
    change \{ RetryScript = retry_launch_load_network_settings }
    change \{ AbortScript = back_to_net_settings_menu }
    change \{ DoneScript = loaded_network_preferences }
    change \{ SavingOrLoading = loading }
    check_card \{ filetype = NetworkSettings }
    launch_files_menu \{ filetype = NetworkSettings }
endscript

script retry_launch_options_menu_load_game_sequence 
    memcard_menus_cleanup
    goto \{ launch_options_menu_load_game_sequence }
endscript

script retry_launch_career_menu_load_game_sequence 
    memcard_menus_cleanup
    goto \{ launch_career_menu_load_game_sequence }
endscript

script launch_career_menu_load_game_sequence 
    dialog_box_exit
    destroy_main_menu
    skater ::hide
    change \{ RetryScript = retry_launch_career_menu_load_game_sequence }
    change \{ AbortScript = back_to_career_options_menu }
    change \{ DoneScript = back_to_career_options_menu }
    save_previous_progressive_mode
    change \{ SavingOrLoading = loading }
    SetSectionsToApplyWhenLoading \{ all }
    check_card \{ filetype = OptionsAndPros }
    launch_files_menu \{ filetype = OptionsAndPros }
endscript

script launch_options_menu_load_game_sequence 
    destroy_main_menu
    change \{ RetryScript = retry_launch_options_menu_load_game_sequence }
    change \{ AbortScript = back_to_options_menu }
    change \{ DoneScript = back_to_options_menu }
    save_previous_progressive_mode
    change \{ SavingOrLoading = loading }
    SetSectionsToApplyWhenLoading \{ all }
    check_card \{ filetype = OptionsAndPros }
    launch_files_menu \{ filetype = OptionsAndPros }
endscript

script retry_launch_load_cas_sequence 
    memcard_menus_cleanup
    goto \{ launch_load_cas_sequence }
endscript

script launch_load_cas_sequence 
    destroy_main_menu
    save_previous_progressive_mode
    change \{ AbortScript = back_to_pre_cas_menu }
    change \{ DoneScript = jump_to_edit_skater }
    change \{ RetryScript = retry_launch_load_cas_sequence }
    change \{ SavingOrLoading = loading }
    SetSectionsToApplyWhenLoading \{ all }
    check_card \{ filetype = OptionsAndPros }
    launch_files_menu \{ filetype = OptionsAndPros from_cas }
endscript

script retry_launch_load_cas_from_select_sequence 
    memcard_menus_cleanup
    goto \{ launch_load_cas_from_select_sequence }
endscript

script launch_load_cas_from_select_sequence 
    change \{ check_for_unplugged_controllers = 0 }
    destroy_main_menu
    dialog_box_exit
    change \{ AbortScript = back_to_select_skater }
    change \{ DoneScript = back_to_select_skater }
    save_previous_progressive_mode
    change \{ RetryScript = retry_launch_load_cas_from_select_sequence }
    change \{ SavingOrLoading = loading }
    GetCurrentSkaterProfileIndex
    if (<currentSkaterProfileIndex> = 0)
        SetSectionsToApplyWhenLoading \{ all }
    else
        SetSectionsToApplyWhenLoading \{ applycustomskater }
    endif
    check_card \{ filetype = OptionsAndPros }
    launch_files_menu \{ filetype = OptionsAndPros }
    change \{ check_for_unplugged_controllers = 1 }
endscript

script retry_launch_load_cat_sequence 
    memcard_menus_cleanup
    goto \{ launch_load_cat_sequence }
endscript

script launch_load_cat_sequence 
    if ScreenElementExists \{ id = current_menu_anchor }
        DestroyScreenElement \{ id = current_menu_anchor }
    endif
    change \{ AbortScript = back_to_pre_cat_menu }
    change \{ DoneScript = back_to_edit_cat_menu }
    change \{ RetryScript = retry_launch_load_cat_sequence }
    change \{ SavingOrLoading = loading }
    check_card \{ filetype = CAT }
    launch_files_menu \{ filetype = CAT }
endscript

script retry_launch_load_cat_sequence2 
    memcard_menus_cleanup
    goto \{ launch_load_cat_sequence2 }
endscript

script launch_load_cat_sequence2 
    if ScreenElementExists \{ id = current_menu_anchor }
        DestroyScreenElement \{ id = current_menu_anchor }
    endif
    change \{ loading_cat_from_edit_tricks = 1 }
    change \{ AbortScript = back_to_edit_tricks_menu }
    change \{ DoneScript = finish_loading_cat }
    change \{ RetryScript = retry_launch_load_cat_sequence2 }
    change \{ SavingOrLoading = loading }
    check_card \{ filetype = CAT }
    launch_files_menu \{ filetype = CAT }
endscript

script retry_launch_load_cagr_sequence 
    memcard_menus_cleanup
    goto \{ launch_load_cagr_sequence }
endscript

script launch_load_cagr_sequence 
    destroy_main_menu
    change \{ RetryScript = retry_launch_load_cagr_sequence }
    change \{ AbortScript = back_to_pre_cagr_menu }
    change \{ DoneScript = load_cagr_sequence_done }
    change \{ SavingOrLoading = loading }
    check_card \{ filetype = createdgraphic }
    launch_files_menu \{ filetype = createdgraphic }
endscript

script load_cagr_sequence_done 
    dialog_box_exit
    edit_graphic_create_main_menu \{ new = 0 }
endscript

script load 
    gettags
    if ((GotParam badversion)|| (GotParam corrupt))
        if IsNGC
            memcard_menus_cleanup
            goto mcmess_ErrorLoadFailed params = { <...> CorruptedData GoBackToFilesMenu }
        else
            return 
        endif
    endif
    memcard_menus_cleanup
    generic_menu_pad_choose_sound
    ResetTimer
    mcmess_LoadingData filetype = <file_type>
    DisableReset
    if LoadFromMemoryCard name = <filename> type = <file_type> LoadForUpload = LoadForUpload
        change check_for_unplugged_controllers = 0
        mcmess_LoadingData filetype = <file_type> no_animate = no_animate
        mem_card_message_pause XSkips NoTimerReset NoCardRemovalCheck
        if (load_successful = 0)
            change load_successful = 1
            change check_for_unplugged_controllers = 1
            goto AbortScript params = {type = <file_type> filename = <filename>}
        else
            if (<file_type> = NetworkSettings)
                mem_card_restore_network_config
            endif
            change check_for_unplugged_controllers = 1
            if (<file_type> = Park)
                if InNetGame
                    goto DoneScript params = { type = <file_type> }
                endif
            endif
            goto mcmess_LoadSuccessful params = {type = <file_type> filename = <filename>}
        endif
    else
        mem_card_message_pause XSkips NoTimerReset NoCardRemovalCheck
        goto mcmess_ErrorLoadFailed params = { <...> GoBackToFilesMenu }
    endif
endscript

script CardIsFormatted_Sync 
    CardIsFormatted
    CardSync
    if CardIsFormatted
        return \{ true }
    else
        return \{ false }
    endif
endscript

script post_load_from_memory_card 
    if NOT GotParam type
        printstruct <...> 
        script_assert 'Poróbowano znaleæ parametr \'type\'!'
    endif
    switch <type>
        case OptionsAndPros
        career_post_load
        if LoadedCustomSkater
            LoadSkaterParts unload
            GetCurrentSkaterProfileIndex
            GetSkaterProfileInfo player = <currentSkaterProfileIndex>
            change edit_graphic_layer_infos = <cag_info>
            edit_graphic_apply_graphic_from_save
            LoadSkaterParts
            load_pro_skater
            cas_post_load
        endif
        SetScreenEffectsBrightness brightness = (SE_Brightness / 10.0)
        case Park
        SetCustomParkName name = <name>
        SetParkName <name>
        if CustomParkMode editing
        endif
        case CreatedGoals
        end_current_goal_run
        if IsTrue DoInitialiseCreatedGoalsAfterLoading
        endif
        case createdgraphic
        edit_graphic_set_layer_infos layer_infos = <layer_infos>
    endswitch
endscript

script UnloadAnimsAndCreateMemCardPools 
    if NOT InFrontend
        if NOT LevelIs load_sk5ed
            change DebugPausedObjects = 1
            if NOT IsNGC
                if (EG_in_create_a_graphic = 1)
                    if IsTrue EG_pak_loaded
                        BeginUnloadPak 'pak/CAGR_assets/CAGR_assets.pak' localized
                        EndUnloadPak 'pak/CAGR_assets/CAGR_assets.pak' localized
                        change EG_pak_loaded = 0
                    endif
                else
                    do_unload_unloadable
                endif
                PushTemporaryMemCardPools
            endif
        endif
    else
        if NOT IsNGC
            PushTemporaryMemCardPools
        endif
    endif
endscript

script RemoveMemCardPoolsAndLoadAnims 
    if NOT InFrontend
        if LevelIs load_sk5ed
            return 
        endif
        if NOT IsNGC
            PopTemporaryMemCardPools
            if (EG_in_create_a_graphic = 1)
                if NOT IsTrue EG_pak_loaded
                    LoadPak 'pak/CAGR_assets/CAGR_assets.pak' localized heap = unloadableanim
                    change EG_pak_loaded = 1
                endif
            else
                do_load_unloadable
            endif
        endif
        change DebugPausedObjects = 0
    else
        if NOT IsNGC
            PopTemporaryMemCardPools
        endif
    endif
endscript

script reload_anims_then_run_abort_script 
    change \{ movies_disabled = 0 }
    printf \{ 'reload_anims_then_run_abort_script' }
    if ObjectExists \{ id = current_menu_anchor }
        DestroyScreenElement \{ id = current_menu_anchor }
    endif
    RemoveMemCardPoolsAndLoadAnims
    goto \{ AbortScript }
endscript
memcardtest_on = 0

script memcardtest_toggle 
    SpawnScriptLater \{ memcardtest_backout }
    if IsTrue \{ memcardtest_on }
        KillSpawnedScript \{ name = memcardtest_loop }
        change \{ memcardtest_on = 0 }
    else
        SpawnScriptLater \{ memcardtest_loop notsessionspecific = 1 }
        change \{ memcardtest_on = 1 }
    endif
endscript

script memcardtest_backout \{menu_list = [ DEBUG_MENU options_menu current_menu ]}
    GetArraySize <menu_list>
    i = 0
    begin 
    if ScreenElementExists id = (<menu_list> [ <i> ])
        FireEvent type = pad_back target = (<menu_list> [ <i> ])Data = {device_num = 0 pause_controller = 0}
        wait \{ 0.5000 seconds }
    else
        return 
    endif
    i = (<i> + 1)
    repeat <array_size>
endscript

script memcardtest_loop 
    wait 5 seconds
    level_index = 0
    counter = 0
    level_list = [
        load_bo
        load_ba
        load_NO
        load_st
    ]
    GetArraySize <level_list>
    begin 
    pausegame
    hide_all_hud_items
    SpawnScriptLater launch_ingame_menu_save_game_sequence
    wait 5 seconds
    if ScreenElementExists id = { files_vmenu child = 1 }
        FireEvent type = pad_choose target = { files_vmenu child = 1 }
        wait 1 seconds
        if ScreenElementExists id = { dialog_box_vmenu child = 4 }
            FireEvent type = pad_choose target = { dialog_box_vmenu child = 4 }
        endif
    else
        if ScreenElementExists id = { files_vmenu child = 0 }
            FireEvent type = pad_choose target = { files_vmenu child = 0 }
            wait 1 seconds
            if ScreenElementExists id = keyboard_done_button
                FireEvent type = pad_choose target = keyboard_done_button
            endif
            wait 5 seconds
        else
            if ScreenElementExists id = files_vmenu
                FireEvent type = pad_back target = files_vmenu
            endif
        endif
    endif
    wait 2 seconds
    if ScreenElementExists id = { dialog_box_vmenu child = 3 }
        FireEvent type = pad_choose target = { dialog_box_vmenu child = 3 }
    endif
    wait 2 seconds
    counter = (<counter> + 1)
    if (<counter> > 10)
        counter = 0
        level_index = (<level_index> + 1)
        if NOT (<level_index> < <array_size>)
            level_index = 0
        endif
        change_level level = (<level_list> [ <level_index> ])
    endif
    wait 10 seconds
    repeat 
endscript

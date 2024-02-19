
script create_dialog_box_with_wait 
    if (no_load = 0)
        memcard_menus_cleanup
    else
        <no_bg> = no_bg
    endif
    create_snazzy_dialog_box { <...> no_animate }
    change \{ check_for_unplugged_controllers = 0 }
    DisableReset
    wait \{ 20 gameframes }
    EnableReset
    change \{ check_for_unplugged_controllers = 1 }
endscript

script mcmess_CheckingCard 
    GetPlatform
    switch <platform>
        case ps2
        create_dialog_box_with_wait {
            Title = 'Checking ...'
            text = 'Checking memory card (8MB) (for PlayStation®2) in MEMORY CARD slot 1. Do not remove memory card (8MB) (for PlayStation®2), controller, or reset/switch off the console'
            add_loading_anim = add_loading_anim
        }
        case xbox
        create_dialog_box_with_wait {
            Title = 'Checking ...'
            text = 'Checking hard disk ...\nPlease do not turn off your Xbox console.'
            no_bg = <no_bg>
            add_loading_anim = add_loading_anim
        }
        case pc
        create_dialog_box_with_wait {
            Title = 'Checking ...'
            text = 'Checking hard disk ...\nPlease wait.'
            no_bg = <no_bg>
            add_loading_anim = add_loading_anim
        }
        case ngc
        create_dialog_box_with_wait {
            Title = 'Accessing ...'
            text = 'Accessing. Do not touch the Nintendo GameCube Memory Card in Slot A, or the POWER Button.'
            add_loading_anim = add_loading_anim
        }
        case xenon
        create_dialog_box_with_wait {
            Title = 'Checking ...'
            text = 'Checking storage device ...\nPlease do not turn off your Xbox 360 console.'
            no_bg = <no_bg>
            add_loading_anim = add_loading_anim
        }
    endswitch
endscript

script mcmess_SavingData 
    GetPlatform
    switch <platform>
        case ps2
        create_dialog_box_with_wait {
            Title = 'Saving ...'
            text = 'Saving data. Do not remove memory card (8MB) (for PlayStation®2) in MEMORY CARD slot 1, controller, or reset/switch off the console.'
            add_loading_anim = add_loading_anim
        }
        case xbox
        GetFileTypeName file_type = <filetype>
        FormatText {
            textname = text
            'Saving %f to hard disk ...\nPlease do not turn off your Xbox console.'
            f = <filetype_name>
        }
        create_dialog_box_with_wait {
            Title = 'Saving ...'
            text_dims = (350.0, 0.0)
            text = <text>
            add_loading_anim = add_loading_anim
        }
        case pc
        GetFileTypeName file_type = <filetype>
        FormatText {
            textname = text
            'Saving %f to hard disk ...\nPlease wait.'
            f = <filetype_name>
        }
        create_dialog_box_with_wait {
            Title = 'Saving ...'
            text_dims = (350.0, 0.0)
            text = <text>
            add_loading_anim = add_loading_anim
        }
        case xenon
        GetFileTypeName file_type = <filetype>
        FormatText {
            textname = text
            'Saving Content.\nPlease don\'t turn off your console.'
            f = <filetype_name>
        }
        create_dialog_box_with_wait {
            Title = 'Saving ...'
            text_dims = (350.0, 0.0)
            text = <text>
            add_loading_anim = add_loading_anim
        }
        case ngc
        create_dialog_box_with_wait {
            Title = 'Saving ...'
            text_dims = (350.0, 0.0)
            text = 'Saving data. Do not touch the Nintendo GameCube Memory Card in Slot A, or the POWER Button.'
            add_loading_anim = add_loading_anim
        }
    endswitch
endscript

script mcmess_OverwritingData 
    GetPlatform
    switch <platform>
        case ps2
        create_dialog_box_with_wait {
            Title = 'Overwriting ...'
            text = 'Overwriting data. Do not remove memory card (8MB) (for PlayStation®2) in MEMORY CARD slot 1, controller, or reset/switch off console.'
            add_loading_anim = add_loading_anim
        }
        case xbox
        GetFileTypeName file_type = <filetype>
        FormatText {
            textname = text
            'Overwriting %f to hard disk ...\nPlease do not turn off your Xbox console.'
            f = <filetype_name>
        }
        create_dialog_box_with_wait {
            Title = 'Overwriting ...'
            text_dims = (350.0, 0.0)
            text = <text>
            add_loading_anim = add_loading_anim
        }
        case pc
        GetFileTypeName file_type = <filetype>
        FormatText {
            textname = text
            'Overwriting %f to hard disk ...\nPlease wait.'
            f = <filetype_name>
        }
        create_dialog_box_with_wait {
            Title = 'Overwriting ...'
            text_dims = (350.0, 0.0)
            text = <text>
            add_loading_anim = add_loading_anim
        }
        case xenon
        GetFileTypeName file_type = <filetype>
        FormatText {
            textname = text
            'Overwriting Content.\nPlease don\'t turn off your console.'
            f = <filetype_name>
        }
        create_dialog_box_with_wait {
            Title = 'Overwriting ...'
            text_dims = (350.0, 0.0)
            text = <text>
            add_loading_anim = add_loading_anim
        }
        case ngc
        create_dialog_box_with_wait {
            Title = 'Overwriting ...'
            text_dims = (350.0, 0.0)
            text = 'Overwriting data. Do not touch the Nintendo GameCube Memory Card in Slot A, or the POWER Button.'
            add_loading_anim = add_loading_anim
        }
    endswitch
endscript

script mcmess_LoadingData 
    GetPlatform
    switch <platform>
        case ps2
        create_dialog_box_with_wait {
            Title = 'Loading ...'
            text = 'Loading data. Do not remove memory card (8MB) (for PlayStation®2) in MEMORY CARD slot 1, controller, or reset/switch off the console.'
            add_loading_anim = add_loading_anim
        }
        no_animate = <no_animate>
        case xbox
        GetFileTypeName file_type = <filetype>
        FormatText {
            textname = text
            'Loading %f from hard disk ...\nPlease do not turn off your Xbox console.'
            f = <filetype_name>
        }
        create_dialog_box_with_wait {
            Title = 'Loading ...'
            text_dims = (400.0, 0.0)
            text = <text>
            add_loading_anim = add_loading_anim
        }
        no_animate = <no_animate>
        case pc
        GetFileTypeName file_type = <filetype>
        FormatText {
            textname = text
            'Loading %f from hard disk ...\nPlease wait.'
            f = <filetype_name>
        }
        create_dialog_box_with_wait {
            Title = 'Loading ...'
            text_dims = (400.0, 0.0)
            text = <text>
            add_loading_anim = add_loading_anim
        }
        no_animate = <no_animate>
        case xenon
        GetFileTypeName file_type = <filetype>
        FormatText {
            textname = text
            'Loading Content.\nPlease don\'t turn off your console.'
            f = <filetype_name>
        }
        create_dialog_box_with_wait {
            Title = 'Loading ...'
            text_dims = (400.0, 0.0)
            text = <text>
            add_loading_anim = add_loading_anim
        }
        no_animate = <no_animate>
        case ngc
        create_dialog_box_with_wait {
            Title = 'Loading ...'
            text_dims = (350.0, 0.0)
            text = 'Loading data. Do not touch the Nintendo GameCube Memory Card in Slot A, or the POWER Button.'
            add_loading_anim = add_loading_anim
        }
        no_animate = <no_animate>
    endswitch
endscript

script mcmess_DeletingFile 
    GetPlatform
    switch <platform>
        case ps2
        create_dialog_box_with_wait {
            Title = 'Deleting ...'
            text = 'Deleting data. Do not remove memory card (8MB) (for PlayStation®2) in MEMORY CARD slot 1, controller, or reset/switch off console.'
            add_loading_anim = add_loading_anim
        }
        case pc
        GetFileTypeName file_type = <filetype>
        FormatText {
            textname = text
            'Deleting %f from hard disk ...\nPlease wait.'
            f = <filetype_name>
        }
        create_dialog_box_with_wait {
            Title = 'Deleting ...'
            text_dims = (350.0, 0.0)
            text = <text>
            add_loading_anim = add_loading_anim
        }
        case xbox
        GetFileTypeName file_type = <filetype>
        FormatText {
            textname = text
            'Deleting %f from hard disk ...\nPlease do not turn off your Xbox console.'
            f = <filetype_name>
        }
        create_dialog_box_with_wait {
            Title = 'Deleting ...'
            text_dims = (350.0, 0.0)
            text = <text>
            add_loading_anim = add_loading_anim
        }
        case xenon
        GetFileTypeName file_type = <filetype>
        FormatText {
            textname = text
            'Deleting Content.\nPlease don\'t turn off your console.'
            f = <filetype_name>
        }
        create_dialog_box_with_wait {
            Title = 'Deleting ...'
            text_dims = (350.0, 0.0)
            text = <text>
            add_loading_anim = add_loading_anim
        }
        case ngc
        create_dialog_box_with_wait {
            Title = 'Deleting ...'
            text_dims = (350.0, 0.0)
            text = 'Deleting data. Do not touch the Nintendo GameCube Memory Card in Slot A, or the POWER Button.'
            add_loading_anim = add_loading_anim
        }
    endswitch
endscript

script mcmess_SaveSuccessful 
    <text> = 'Save successful'
    create_memcard_success_dialog_box {
        Title = 'Successful'
        text = <text>
    }
endscript

script mcmess_OverwriteSuccessful 
    <text> = 'Overwrite successful'
    create_memcard_success_dialog_box {
        Title = 'Successful'
        text = <text>
    }
endscript

script mcmess_LoadSuccessful 
    create_memcard_success_dialog_box \{ Title = "Successful" text = "Load Successful" }
endscript

script mcmess_FormattingCard 
    GetPlatform
    switch <platform>
        case ps2
        create_dialog_box_with_wait {
            Title = 'Formatting...'
            text = 'Formatting memory card (8MB) (for PlayStation®2) in MEMORY CARD slot 1. Do not remove memory card (8MB) (for PlayStation®2), controller, or reset/switch off console.'
            add_loading_anim = add_loading_anim
        }
        case ngc
        create_dialog_box_with_wait {
            text_dims = (400.0, 0.0)
            Title = 'Formatting...'
            text = 'Formatting. Do not touch the Nintendo GameCube Memory Card in Slot A, or the POWER Button.'
            add_loading_anim = add_loading_anim
        }
    endswitch
endscript

script mcmess_FormatSuccessful 
    memcard_menus_cleanup
    create_snazzy_dialog_box \{Title = "Successful" text = "Format Successful" pad_back_script = RetryScript buttons = [{ font = small text = "OK" pad_choose_script = RetryScript }]}
endscript

script create_memcard_error_dialog_box 
    memcard_menus_cleanup
    create_error_box {
        <...> 
        pad_back_script = reload_anims_then_run_abort_script
        buttons = [
            {font = small text = 'Retry' pad_choose_script = RetryScript}
            {font = small text = 'Quit' pad_choose_script = reload_anims_then_run_abort_script}
        ]
    }
endscript

script create_memcard_success_dialog_box 
    memcard_menus_cleanup
    create_snazzy_dialog_box {
        <...> 
        pad_back_script = DoneScript
        buttons = [
            {font = small text = 'OK' pad_choose_script = DoneScript pad_choose_params = { type = <type> }}
        ]
    }
endscript

script mcmess_FormatFailed 
    memcard_menus_cleanup
    GetPlatform
    switch <platform>
        case ps2
        create_error_box {
            Title = 'Warning !'
            text = 'Format failed! Please check memory card (8MB) (for PlayStation®2) in MEMORY CARD slot 1 and try again.'
            pad_back_script = reload_anims_then_run_abort_script
            buttons = [
                {font = small text = 'Retry' pad_choose_script = RetryScript}
                {font = small text = 'Continue without saving' pad_choose_script = reload_anims_then_run_abort_script}
            ]
        }
        case ngc
        goto mcmess_DamagedCard
    endswitch
endscript

script mcmess_ErrorSaveFailed 
    GetPlatform
    switch <platform>
        case ps2
        <text> = [
            'Save failed !\n'
            'Check memory card (8MB) '
            '(for PlayStation®2) in MEMORY CARD '
            'slot 1 and please try again.'
        ]
        create_memcard_error_dialog_box {
            Title = 'Warning !'
            text = <text>
        }
        case pc
        case xbox
        case xenon
        create_memcard_error_dialog_box {
            Title = 'Warning !'
            text = 'Failed trying to save.'
        }
        case ngc
        create_memcard_error_dialog_box {
            text_dims = (350.0, 0.0)
            Title = 'Warning !'
            text = 'Save failed !\nCheck Nintendo GameCube Memory Card in Slot A and please try again !'
        }
    endswitch
endscript

script mcmess_ErrorOverwriteFailed 
    GetPlatform
    switch <platform>
        case ps2
        if CheckPS2SaveState
            FormatText textname = text 'OVERWRITE NOT SUCCESSFUL!!!\n\n\n\n TELL HIM THIS:\n Save State = %d' d = <save_state>
        else
            <text> = [
                'Overwrite failed !\n'
                'Please check memory card (8MB) '
                '(for PlayStation®2) in MEMORY CARD '
                'slot 1 and please try again.'
            ]
        endif
        create_memcard_error_dialog_box {
            Title = 'Warning !'
            text = <text>
        }
        case pc
        case xbox
        case xenon
        create_memcard_error_dialog_box {
            Title = 'Warning !'
            text = 'Failed trying to overwrite.'
        }
        case ngc
        create_memcard_error_dialog_box {
            text_dims = (350.0, 0.0)
            Title = 'Warning !'
            text = 'Overwrite failed !\nCheck Nintendo GameCube Memory Card in Slot A and please try again !'
        }
    endswitch
endscript

script mcmess_ErrorbadParkMaxPlayers back_script = reload_anims_then_run_abort_script back_params = {}
    FormatText {
        textname = text
        'This park cannot run with %p players.\nThe maximum number of players for this park is %m'
        p = <num_players>
        m = <maxplayers>
    }
    create_error_box {
        Title = 'Warning !'
        text = <text>
        text_dims = (400.0, 0.0)
        pad_back_script = <back_script>
        pad_back_params = <back_params>
        buttons = [
            {font = small text = 'OK' pad_choose_script = <back_script> pad_choose_params = <back_params>}
        ]
    }
endscript

script mcmess_ErrorLoadFailed 
    GetPlatform
    switch <platform>
        case ps2
        if GotParam CorruptedData
            create_memcard_error_dialog_box {
                Title = 'Warning !'
                text = [
                    'Load failed !\n'
                    'The file data is damaged.\n'
                    'Check memory card (8MB) '
                    '(for PlayStation®2) in MEMORY CARD '
                    'slot 1 and please try again!'
                ]
            }
        else
            create_memcard_error_dialog_box {
                Title = 'Warning !'
                text = [
                    'Load failed !\n'
                    'Check memory card (8MB) '
                    '(for PlayStation®2) in MEMORY CARD '
                    'slot 1 and please try again.'
                ]
            }
        endif
        case pc
        GetFileTypeName file_type = <file_type>
        FormatText textname = text '%s appears to be damaged and cannot be used. Press Jump to continue.' s = <filetype_name>
        memcard_menus_cleanup
        create_error_box {
            Title = ''
            text = <text>
            pad_back_script = reload_anims_then_run_abort_script
            buttons = [
                {font = small text = 'Continue' pad_choose_script = reload_anims_then_run_abort_script}
            ]
        }
        case xbox
        case xenon
        GetFileTypeName file_type = <file_type>
        FormatText textname = text '%s appears to be damaged and cannot be used. Press A to continue.' s = <filetype_name>
        memcard_menus_cleanup
        create_error_box {
            Title = ''
            text = <text>
            pad_back_script = reload_anims_then_run_abort_script
            buttons = [
                {font = small text = 'Continue' pad_choose_script = reload_anims_then_run_abort_script}
            ]
        }
        case ngc
        create_error_box {
            text_dims = (450.0, 0.0)
            Title = 'Warning !'
            text = 'The Memory Card in Slot A contains a corrupted Tony Hawk\'s American Wasteland save file.'
            pad_back_script = reload_anims_then_run_abort_script
            buttons = [
                {font = small text = 'Continue without loading' pad_choose_script = reload_anims_then_run_abort_script}
                {font = small text = 'Retry' pad_choose_script = RetryScript}
                {font = small text = 'Delete file' pad_choose_script = delete_bad_file pad_choose_params = <...> }
            ]
        }
        CheckForCardRemoval menu_id = dialog_box_anchor
    endswitch
endscript

script mcmess_NGCDeleteCorruptFile 
    memcard_menus_cleanup
    create_error_box {
        text_dims = (450.0, 0.0)
        Title = 'Warning !'
        text = 'The Memory Card in Slot A contains a corrupted Tony Hawk\'s American Wasteland save file.'
        pad_back_script = reload_anims_then_run_abort_script
        buttons = [
            {font = small text = 'Continue without Saving' pad_choose_script = reload_anims_then_run_abort_script}
            {font = small text = 'Retry' pad_choose_script = RetryScript}
            {font = small text = 'Delete Corrupted Data' pad_choose_script = NGC_delete_bad_file pad_choose_params = <...> }
        ]
    }
    CheckForCardRemoval menu_id = dialog_box_anchor
endscript

script mcmess_ErrorNoCardInSlot 
    memcard_menus_cleanup
    if (SavingOrLoading = saving)
        ContinueText = 'Continue without saving'
    else
        ContinueText = 'Continue'
    endif
    GetPlatform
    switch <platform>
        case ps2
        create_error_box {
            Title = 'Warning !'
            text = [
                'No memory card (8MB) (for PlayStation®2) '
                'in MEMORY CARD slot 1.  '
            ]
            pad_back_script = reload_anims_then_run_abort_script
            buttons = [
                {font = small text = 'Retry' pad_choose_script = RetryScript}
                {font = small text = <ContinueText> pad_choose_script = reload_anims_then_run_abort_script}
            ]
        }
        case ngc
        create_error_box {
            Title = 'Warning !'
            text = 'There is no Nintendo GameCube Memory Card in Slot A.'
            pad_back_script = reload_anims_then_run_abort_script
            buttons = [
                {font = small text = 'Retry' pad_choose_script = RetryScript}
                {font = small text = <ContinueText> pad_choose_script = reload_anims_then_run_abort_script}
            ]
        }
        case xenon
        create_error_box {
            Title = 'Warning !'
            text = [ 
            'No storage device was selected or the in-use storage device is unavailable.'
             ]
            pad_back_script = reload_anims_then_run_abort_script
            buttons = [
                {font = small text = 'Select a device' pad_choose_script = RetryScript}
                {font = small text = <ContinueText> pad_choose_script = reload_anims_then_run_abort_script}
            ]
        }
    endswitch
endscript

script mcmess_ErrorNotEnoughRoomNoTHPSFilesExist spacerequired = 0 spaceavailable = 0
    memcard_menus_cleanup
    GetFileTypeName file_type = <filetype>
    GetPlatform
    switch <platform>
        case ps2
        FormatText {
            textname = text
            'Insufficient free space on memory card (8MB) (for PlayStation®2) in MEMORY CARD slot 1.\n%f requires %sKB of free space to save data.'
            s = <spacerequired>
            f = <filetype_name>
        }
        create_error_box {
            Title = 'Warning !'
            text = <text>
            pad_back_script = reload_anims_then_run_abort_script
            buttons = [
                {font = small text = 'Continue without saving' pad_choose_script = reload_anims_then_run_abort_script}
                {font = small text = 'Retry' pad_choose_script = RetryScript}
            ]
        }
        case xbox
        FormatText {
            textname = text
            'Your Xbox does not have enough free blocks to save.\nAt least %s blocks are needed to save the current %f.\nPlease free at least %n blocks.'
            s = <spacerequired>
            f = <filetype_name>
            n = (<spacerequired> - <spaceavailable>)
        }
        create_error_box {
            Title = 'Warning !'
            text = <text>
            text_dims = (400.0, 0.0)
            pad_back_script = reload_anims_then_run_abort_script
            buttons = [
                {font = small text = 'Continue without saving' pad_choose_script = reload_anims_then_run_abort_script}
            ]
        }
        case xenon
        FormatText {
            textname = text
            'Your storage device does not have enough free blocks to save.\nAt least %s blocks are needed to save the current %f.\nPlease free at least %n blocks.'
            s = <spacerequired>
            f = <filetype_name>
            n = (<spacerequired> - <spaceavailable>)
        }
        create_error_box {
            Title = 'Warning !'
            text = <text>
            text_dims = (400.0, 0.0)
            pad_back_script = reload_anims_then_run_abort_script
            buttons = [
                {font = small text = 'Continue without saving' pad_choose_script = reload_anims_then_run_abort_script}
            ]
        }
        case ngc
        FormatText {
            textname = text
            'There is not enough space on the Memory Card in Slot A. In order to save the current %t file 1 file and %b blocks are required. To manage the contents of your Memory Card, use the Memory Card Screen.'
            t = <filetype_name>
            b = <spacerequired>
        }
        create_error_box {
            Title = 'Warning !'
            text = <text>
            text_dims = (400.0, 0.0)
            pad_back_script = reload_anims_then_run_abort_script
            buttons = [
                {font = small text = 'Continue without saving' pad_choose_script = reload_anims_then_run_abort_script}
                {font = small text = 'Retry' pad_choose_script = RetryScript}
            ]
        }
    endswitch
endscript

script mcmess_ErrorNotEnoughRoomButTHPSFilesExist spacerequired = 0
    memcard_menus_cleanup
    GetFileTypeName file_type = <filetype>
    GetPlatform
    switch <platform>
        case ps2
        FormatText {
            textname = text
            'Insufficient free space on memory card (8MB) (for PlayStation®2) in MEMORY CARD slot 1.\n%f requires %sKB of free space to save data.\nWould you like to overwrite previous %f data?'
            s = <spacerequired>
            f = <filetype_name>
        }
        create_error_box {
            Title = 'Warning !'
            text = <text>
            text_dims = (450.0, 0.0)
            pad_back_script = reload_anims_then_run_abort_script
            buttons = [
                {font = small text = 'Continue' pad_choose_script = launch_files_menu pad_choose_params = {DoNotShowNotEnoughRoomMessage save filetype = <filetype>}}
                {font = small text = 'Quit' pad_choose_script = reload_anims_then_run_abort_script}
            ]
        }
        case xbox
        FormatText {
            textname = text
            'Your Xbox does not have enough free blocks to save.\nAt least %s blocks are needed to save the current %f.\nYou will need to either delete or overwrite existing saves.'
            s = <spacerequired>
            f = <filetype_name>
        }
        create_error_box {
            Title = 'Warning !'
            text = <text>
            text_dims = (450.0, 0.0)
            pad_back_script = reload_anims_then_run_abort_script
            buttons = [
                {font = small text = 'Continue' pad_choose_script = launch_files_menu pad_choose_params = {DoNotShowNotEnoughRoomMessage save filetype = <filetype>}}
                {font = small text = 'Quit' pad_choose_script = reload_anims_then_run_abort_script}
            ]
        }
        case xenon
        FormatText {
            textname = text
            'Your storage device does not have enough free blocks to save.\nAt least %s blocks are needed to save the current %f.\nYou will need to either delete or overwrite existing saves.'
            s = <spacerequired>
            f = <filetype_name>
        }
        create_error_box {
            Title = 'Warning !'
            text = <text>
            text_dims = (450.0, 0.0)
            pad_back_script = reload_anims_then_run_abort_script
            buttons = [
                {font = small text = 'Continue' pad_choose_script = launch_files_menu pad_choose_params = {DoNotShowNotEnoughRoomMessage save filetype = <filetype>}}
                {font = small text = 'Quit' pad_choose_script = reload_anims_then_run_abort_script}
            ]
        }
        case ngc
        if GotParam overwrite
            <word> = 'overwrite'
        else
            <word> = 'save'
        endif
        FormatText {
            textname = text
            'There is not enough space on the Memory Card in Slot A. In order to %w the current %t file 1 file and %b blocks are required.\nYou will need to either delete or overwrite existing Tony Hawk\'s American Wasteland files. To manage the contents of your Memory Card, use the Memory Card Screen.'
            w = <word>
            t = <filetype_name>
            b = <spacerequired>
        }
        create_error_box {
            Title = 'Warning !'
            text = <text>
            text_dims = (450.0, 0.0)
            pad_back_script = reload_anims_then_run_abort_script
            buttons = [
                {font = small text = 'Continue without saving' pad_choose_script = reload_anims_then_run_abort_script}
                {font = small text = 'Retry' pad_choose_script = RetryScript}
                {font = small text = 'Delete/Overwrite files' pad_choose_script = launch_files_menu pad_choose_params = {DoNotShowNotEnoughRoomMessage save filetype = <filetype>}}
            ]
        }
    endswitch
endscript

script mcmess_ErrorDeleteFailed 
    if CardIsDamaged
        goto mcmess_DamagedCard
    endif
    GetPlatform
    switch <platform>
        case ps2
        create_memcard_error_dialog_box {
            Title = 'Delete failed !'
            text = 'Delete Failed! Please check memory card (8MB) (for PlayStation®2) in MEMORY CARD slot 1 and please try again.'
        }
        case pc
        case xbox
        case xenon
        create_memcard_error_dialog_box {
            Title = 'Delete failed !'
            text = 'Unable to delete.'
        }
        case ngc
        create_memcard_error_dialog_box {
            text_dims = (350.0, 0.0)
            Title = 'Delete failed !'
            text = 'Check Nintendo GameCube Memory Card in Slot A and please try again !'
        }
    endswitch
endscript

script mcmess_NoFiles 
    GetFileTypeName file_type = <MenuFileType>
    if ScreenElementExists id = current_menu_anchor
        DestroyScreenElement id = current_menu_anchor
    endif
    GetPlatform
    switch <platform>
        case ps2
        FormatText {
            textname = text
            'No Tony Hawk\'s American Wasteland %n save data present on memory card (8MB) (for PlayStation®2) in MEMORY CARD slot 1.'
            n = <filetype_name>
        }
        create_memcard_error_dialog_box {
            Title = 'Warning !'
            text = <text>
        }
        case pc
        case xbox
        FormatText {
            textname = text
            'No Tony Hawk\'s American Wasteland %n present on hard disk.'
            n = <filetype_name>
        }
        memcard_menus_cleanup
        create_error_box {
            Title = 'No Saves'
            text = <text>
            pad_back_script = reload_anims_then_run_abort_script
            buttons = [
                {font = small text = 'Quit' pad_choose_script = reload_anims_then_run_abort_script}
            ]
        }
        case xenon
        FormatText {
            textname = text
            'No Tony Hawk\'s American Wasteland %n present.'
            n = <filetype_name>
        }
        memcard_menus_cleanup
        create_error_box {
            Title = 'No Saves'
            text = <text>
            pad_back_script = reload_anims_then_run_abort_script
            buttons = [
                {font = small text = 'Continue' pad_choose_script = reload_anims_then_run_abort_script}
            ]
        }
        case ngc
        FormatText {
            textname = text
            'No Tony Hawk\'s American Wasteland %n data present on Nintendo GameCube Memory Card in Slot A.'
            n = <filetype_name>
        }
        create_memcard_error_dialog_box {
            Title = 'Warning !'
            text = <text>
        }
    endswitch
endscript

script mcmess_ErrorNotFormatted QuitText = 'Continue without formatting' backScript = reload_anims_then_run_abort_script
    memcard_menus_cleanup
    GetPlatform
    switch <platform>
        case ps2
        create_error_box {
            text_dims = (650.0, 0.0)
            Title = 'Warning !'
            text = 'Memory card (8MB) (for PlayStation®2)\n in MEMORY CARD slot 1 is unformatted.'
            pad_back_script = <backScript>
            buttons = [
                {font = small text = <QuitText> pad_choose_script = reload_anims_then_run_abort_script}
                {font = small text = 'Retry' pad_choose_script = RetryScript}
                {font = small text = 'Format memory card (8MB) (for PlayStation®2)?' pad_choose_script = mcmess_FormatYesNo pad_choose_params = { backScript = <backScript> }}
            ]
        }
        case ngc
        if CardIsForeign
            create_error_box {
                text_dims = (590.0, 0.0)
                Title = 'Warning !'
                text = 'The Memory Card in Slot A is corrupted and needs to be formatted.'
                pad_back_script = <backScript>
                buttons = [
                    {font = small text = 'Continue without saving' pad_choose_script = reload_anims_then_run_abort_script}
                    {font = small text = 'Retry' pad_choose_script = RetryScript}
                    {font = small text = 'Format Memory Card' pad_choose_script = mcmess_FormatYesNo pad_choose_params = { backScript = <backScript> }}
                ]
            }
        else
            create_error_box {
                text_dims = (590.0, 0.0)
                Title = 'Warning !'
                text = 'The Memory Card in Slot A is corrupted and needs to be formatted.\nDo you want to format?'
                pad_back_script = <backScript>
                buttons = [
                    {font = small text = 'Continue without saving' pad_choose_script = reload_anims_then_run_abort_script}
                    {font = small text = 'Retry' pad_choose_script = RetryScript}
                    {font = small text = 'Format Memory Card' pad_choose_script = mcmess_FormatYesNo pad_choose_params = { backScript = <backScript> }}
                ]
            }
        endif
    endswitch
    CheckForCardRemoval menu_id = dialog_box_anchor
endscript

script mcmess_ErrorNotFormattedNoFormatOption 
    memcard_menus_cleanup
    GetPlatform
    switch <platform>
        case ps2
        create_error_box {
            Title = 'Warning !'
            text = 'Memory card (8MB) (for PlayStation®2) in MEMORY CARD slot 1 is unformatted.'
            pad_back_script = reload_anims_then_run_abort_script
            buttons = [
                {font = small text = 'Continue' pad_choose_script = reload_anims_then_run_abort_script}
                {font = small text = 'Retry' pad_choose_script = RetryScript}
            ]
        }
        case ngc
        if CardIsForeign
            create_error_box {
                text_dims = (350.0, 0.0)
                Title = 'Warning !'
                text = 'The Memory Card in Slot A is corrupted and needs to be formatted.'
                pad_back_script = <backScript>
                buttons = [
                    {font = small text = 'Continue without saving' pad_choose_script = reload_anims_then_run_abort_script}
                    {font = small text = 'Retry' pad_choose_script = RetryScript}
                    {font = small text = 'Format Memory Card' pad_choose_script = mcmess_FormatYesNo pad_choose_params = { backScript = reload_anims_then_run_abort_script }}
                ]
            }
        else
            create_error_box {
                text_dims = (350.0, 0.0)
                Title = 'Warning !'
                text = 'The Nintendo GameCube Memory Card in Slot A is corrupted and needs to be formatted.\nDo you want to format?'
                pad_back_script = <backScript>
                buttons = [
                    {font = small text = 'Continue without saving' pad_choose_script = reload_anims_then_run_abort_script}
                    {font = small text = 'Retry' pad_choose_script = RetryScript}
                    {font = small text = 'Format Memory Card' pad_choose_script = mcmess_FormatYesNo pad_choose_params = { backScript = reload_anims_then_run_abort_script }}
                ]
            }
        endif
    endswitch
    CheckForCardRemoval menu_id = dialog_box_anchor
endscript

script mcmess_FormatYesNo backScript = reload_anims_then_run_abort_script
    memcard_menus_cleanup
    GetPlatform
    switch <platform>
        case ps2
        create_snazzy_dialog_box {
            Title = 'Format'
            text = 'Are you sure you wish to format memory card (8MB) (for PlayStation®2) in MEMORY CARD slot 1?'
            pad_back_script = <backScript>
            buttons = [
                {font = small text = 'No' pad_choose_script = reload_anims_then_run_abort_script}
                {font = small text = 'Yes' pad_choose_script = DoFormatCard}
            ]
        }
        case ngc
        create_snazzy_dialog_box {
            Title = 'Format'
            text = 'All previously saved data on Memory Card in Slot A will be lost. Would you like to continue formatting?'
            pad_back_script = <backScript>
            buttons = [
                {font = small text = 'No' pad_choose_script = reload_anims_then_run_abort_script}
                {font = small text = 'Yes' pad_choose_script = DoFormatCard}
            ]
        }
    endswitch
    CheckForCardRemoval menu_id = dialog_box_anchor
endscript

script GetSaveSizes 
    GetMemCardSpaceRequired \{ OptionsAndPros }
    <SaveSize_OptionsAndPros> = <spacerequired>
    GetMemCardSpaceRequired \{ NetworkSettings }
    <SaveSize_NetworkSettings> = <spacerequired>
    GetMemCardSpaceRequired \{ Park }
    <SaveSize_Park> = <spacerequired>
    GetMemCardSpaceRequired \{ CAT }
    <SaveSize_CreateATrick> = <spacerequired>
    GetMemCardSpaceRequired \{ CreatedGoals }
    <SaveSize_Goals> = <spacerequired>
    GetMemCardSpaceRequired \{ createdgraphic }
    <SaveSize_CreatedGraphic> = <spacerequired>
    return <...> 
endscript

script mcmess_ErrorNotEnoughSpaceToSaveAllTypes 
    if (no_load = 0)
        memcard_menus_cleanup
    else
        <no_bg> = no_bg
    endif
    GetSaveSizes
    GetPlatform
    switch <platform>
        case ps2
        FormatText {
            textname = text
            'Insufficient free space on memory card (8MB) (for PlayStation®2) in MEMORY CARD slot 1.\nAt least %c KB of free space is required to save Game Progress. 94 KB of free space is needed for the\nmanagement of Your Network Configuration file. An\nadditional %n KB of free space is also required to save\nonline preferences.\n\nGame Progress requires %c KB\nOnline Preferences requires %n KB\nPark requires %p KB\nTricks require %t KB\nGraphics Require %u KB'
            c = <SaveSize_OptionsAndPros>
            n = <SaveSize_NetworkSettings>
            u = <SaveSize_CreatedGraphic>
            p = <SaveSize_Park>
            t = <SaveSize_CreateATrick>
            z = ''
        }
        create_error_box {
            Title = 'Warning !'
            text = <text>
            text_dims = (580.0, 0.0)
            pos_tweak = (0.0, -33.0)
            no_animate
            pad_back_script = reload_anims_then_run_abort_script
            buttons = [
                {font = small text = 'Continue without saving all types of files' pad_choose_script = reload_anims_then_run_abort_script}
                {font = small text = 'Retry' pad_choose_script = RetryScript}
            ]
        }
        case xbox
        GetMemCardSpaceAvailable
        total_blocks_needed = (<SaveSize_OptionsAndPros> + <SaveSize_Park> + <SaveSize_CreateATrick> + <SaveSize_CreatedGraphic>)
        change movies_disabled = 1
        FormatText {
            textname = text
            'Your Xbox does not have enough free blocks to save all types of Tony Hawk\'s American Wasteland saves.\nPlease free at least %f blocks.\n\nGame Progress requires %c blocks\nPark requires %p blocks\nTricks require %t blocks\nGraphics Require %u blocks'
            c = <SaveSize_OptionsAndPros>
            p = <SaveSize_Park>
            t = <SaveSize_CreateATrick>
            u = <SaveSize_CreatedGraphic>
            f = (<total_blocks_needed> - <spaceavailable>)
        }
        create_error_box {
            Title = ''
            text = <text>
            text_dims = (560.0, 0.0)
            pos_tweak = (0.0, -15.0)
            no_animate
            no_bg = <no_bg>
            buttons = [
                {font = small text = 'Continue without saving all types of game saves' pad_choose_script = reload_anims_then_run_abort_script}
                {font = small text = 'Free More Blocks' pad_choose_script = QuitToDashboard pad_choose_params = { total_blocks_needed = <total_blocks_needed> }}
            ]
        }
        case xenon
        GetMemCardSpaceAvailable
        total_blocks_needed = (<SaveSize_OptionsAndPros> + <SaveSize_Park> + <SaveSize_CreateATrick> + <SaveSize_CreatedGraphic>)
        change movies_disabled = 1
        FormatText {
            textname = text
            'Your storage device does not have enough free blocks to save all types of Tony Hawk\'s American Wasteland saves.\nPlease free at least %f blocks.\n\nGame Progress requires %c blocks\nPark requires %p blocks\nTricks require %t blocks\nGraphics Require %u blocks'
            c = <SaveSize_OptionsAndPros>
            p = <SaveSize_Park>
            t = <SaveSize_CreateATrick>
            u = <SaveSize_CreatedGraphic>
            f = (<total_blocks_needed> - <spaceavailable>)
        }
        create_error_box {
            Title = ''
            text = <text>
            text_dims = (560.0, 0.0)
            pos_tweak = (0.0, -15.0)
            no_animate
            no_bg = <no_bg>
            buttons = [
                {font = small text = 'Continue without saving all types of game saves' pad_choose_script = reload_anims_then_run_abort_script}
                {font = small text = 'Free More Blocks' pad_choose_script = QuitToDashboard pad_choose_params = { total_blocks_needed = <total_blocks_needed> }}
            ]
        }
        case ngc
        FormatText {
            textname = text
            'The Memory Card in Slot A does not have sufficient \nspace to save all types of Tony Hawk\'s American Wasteland save files. Saved \ndata may be loaded and overwritten.\n\nGame Progress requires 1 file and %c blocks.\nPark requires 1 file and %p blocks.\nTricks require 1 file and %t blocks.\nGraphics Require 1 file and %u blocks\nTo manage the contents of your Memory Card, \nuse the Memory Card Screen.'
            c = <SaveSize_OptionsAndPros>
            p = <SaveSize_Park>
            t = <SaveSize_CreateATrick>
            u = <SaveSize_CreatedGraphic>
        }
        if GotParam no_manager
            create_error_box {
                Title = 'Warning !'
                text = <text>
                text_dims = (550.0, 0.0)
                pos_tweak = (15.0, -17.0)
                no_animate
                pad_back_script = reload_anims_then_run_abort_script
                buttons = [
                    {font = small text = 'Continue without saving all types of files' pad_choose_script = reload_anims_then_run_abort_script}
                    {font = small text = 'Retry' pad_choose_script = RetryScript}
                ]
            }
        else
            create_error_box {
                Title = 'Warning !'
                text = <text>
                text_dims = (550.0, 0.0)
                pos_tweak = (15.0, -17.0)
                no_animate
                pad_back_script = reload_anims_then_run_abort_script
                buttons = [
                    {font = small text = 'Continue without saving all types of files' pad_choose_script = reload_anims_then_run_abort_script}
                    {font = small text = 'Retry' pad_choose_script = RetryScript}
                    {font = small text = 'Manage Memory Card' pad_choose_script = QuitToDashboard}
                ]
            }
        endif
    endswitch
endscript

script mcmess_ErrorNoCardOnBootup 
    memcard_menus_cleanup
    GetSaveSizes
    GetPlatform
    switch <platform>
        case ps2
        FormatText {
            textname = text
            'No memory card (8MB) (for PlayStation®2)\n in MEMORY CARD slot 1.\nPlease insert a memory card (8MB) (for PlayStation®2)\nwith at least %c KB free space for Game \nProgress. 94 KB of free space is needed for the \nManagement of Your Network Configuration file.\nAn additional %n KB of free space is also required \nto save online preferences.\n\nGame Progress requires %c KB\nOnline Preferences requires %n KB\nPark requires %p KB\nTricks require %t KB\nGraphics Require %u KB'
            c = <SaveSize_OptionsAndPros>
            n = <SaveSize_NetworkSettings>
            u = <SaveSize_CreatedGraphic>
            p = <SaveSize_Park>
            t = <SaveSize_CreateATrick>
            z = ''
        }
        create_error_box {
            Title = 'Warning !'
            text = <text>
            text_dims = (560.0, 0.0)
            pos_tweak = (0.0, -33.0)
            no_animate
            pad_back_script = generic_menu_pad_back
            pad_back_params = { callback = reload_anims_then_run_abort_script }
            buttons = [
                {font = small text = 'Continue without saving all types of game files' pad_choose_script = reload_anims_then_run_abort_script}
                {font = small text = 'Retry' pad_choose_script = RetryScript}
            ]
        }
        case xenon
        mcmess_ErrorNoCardInSlot
        case ngc
        FormatText {
            textname = text
            'No Memory Card detected in Slot A.\n\nGame Progress requires 1 file and %c blocks\nPark requires 1 file and %p blocks\nTricks require 1 file and %t blocks\nGraphics Require 1 file and %u blocks'
            c = <SaveSize_OptionsAndPros>
            p = <SaveSize_Park>
            t = <SaveSize_CreateATrick>
            u = <SaveSize_CreatedGraphic>
        }
        create_error_box {
            Title = 'Warning !'
            text = <text>
            text_dims = (560.0, 0.0)
            pos_tweak = (0.0, 0.0)
            no_animate
            pad_back_script = generic_menu_pad_back
            pad_back_params = { callback = reload_anims_then_run_abort_script }
            buttons = [
                {font = small text = 'Continue without saving all types of files' pad_choose_script = reload_anims_then_run_abort_script}
                {font = small text = 'Retry' pad_choose_script = RetryScript}
            ]
        }
    endswitch
endscript

script mcmess_DamagedCard 
    memcard_menus_cleanup
    create_error_box \{Title = "Error" text = "The Memory Card in Slot A is damaged and cannot be used." pad_back_script = reload_anims_then_run_abort_script buttons = [{ font = small text = "Continue without saving" pad_choose_script = reload_anims_then_run_abort_script }{ font = small text = "Retry" pad_choose_script = RetryScript }]}
endscript

script mcmess_BadDevice 
    memcard_menus_cleanup
    create_error_box \{Title = "Error" text = "Wrong device in Slot A. Please insert a Memory Card." pad_back_script = reload_anims_then_run_abort_script buttons = [{ font = small text = "Continue without saving" pad_choose_script = reload_anims_then_run_abort_script }{ font = small text = "Retry" pad_choose_script = RetryScript }]}
endscript

script mcmess_BadSectorSize 
    memcard_menus_cleanup
    create_error_box {
        Title = 'Error'
        text = 'The Memory Card in Slot A is not compatible with the Tony Hawk\'s American Wasteland save file.'
        pad_back_script = reload_anims_then_run_abort_script
        buttons = [
            {font = small text = 'Continue without saving' pad_choose_script = reload_anims_then_run_abort_script}
            {font = small text = 'Retry' pad_choose_script = RetryScript}
        ]
    }
endscript

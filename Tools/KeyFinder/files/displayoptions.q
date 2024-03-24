

script launch_display_options_menu 
    if GotParam from_options
        create_display_options_menu from_options
    else
        create_display_options_menu
    endif
endscript


script create_display_options_menu 
    make_new_themed_sub_menu Title = 'DISPLAY OPTIONS'
    create_helper_text {helper_text_elements = [{ text = '\b7/\b4 = Select' }
            { text = '\bn = Back' }
            { text = '\bm = Accept' }
        ]
    }
    SetScreenElementProps {id = sub_menu
        event_handlers = [
            {pad_back generic_menu_pad_back params = { callback = display_options_exit }}
        ]
    }
    if GetGlobalFlag flag = NO_DISPLAY_HUD
        hud_text = 'Off'
    else
        hud_text = 'On'
    endif
    theme_menu_add_item {text = 'Score/Special Meter:'
        extra_text = <hud_text>
        id = menu_display_hud
        pad_choose_script = toggle_display_hud
    }
    if GetGlobalFlag flag = NO_DISPLAY_TRICKSTRING
        hud_text = 'Off'
    else
        hud_text = 'On'
    endif
    theme_menu_add_item {text = 'Trick String:'
        extra_text = <hud_text>
        id = menu_display_trickstring
        pad_choose_script = toggle_display_trickstring
    }
    if GetGlobalFlag flag = NO_DISPLAY_BASESCORE
        hud_text = 'Off'
    else
        hud_text = 'On'
    endif
    theme_menu_add_item {text = 'Base Score:'
        extra_text = <hud_text>
        id = menu_display_basescore
        pad_choose_script = toggle_display_basescore
    }
    if GetGlobalFlag flag = NO_DISPLAY_CHATWINDOW
        hud_text = 'Off'
    else
        hud_text = 'On'
    endif
    theme_menu_add_flag_item {text = 'Tantrum Meter:'
        id = tantrum_text
        flag = TANTRUM_OFF
        reverse
    }
    if InNetGame
        theme_menu_add_item {text = 'Chat Window:'
            extra_text = <hud_text>
            id = menu_display_chatwindow
            pad_choose_script = toggle_display_chatwindow
        }
    else
        theme_menu_add_item {text = 'Console Window:'
            extra_text = <hud_text>
            id = menu_display_chatwindow
            pad_choose_script = toggle_display_chatwindow
        }
    endif
    if GetGlobalFlag flag = NO_DISPLAY_BALANCE
        hud_text = 'Off'
    else
        hud_text = 'On'
    endif
    if InNetGame
        if GetGlobalFlag flag = no_g_display_balance
            theme_menu_add_item {text = 'Balance Meters:'
                extra_text = <hud_text>
                id = menu_display_balance
                pad_choose_script = toggle_display_balance
                not_focusable = not_focusable
            }
        else
            theme_menu_add_item {text = 'Balance Meters:'
                extra_text = <hud_text>
                id = menu_display_balance
                pad_choose_script = toggle_display_balance
            }
        endif
    else
        theme_menu_add_item {text = 'Balance Meters:'
            extra_text = <hud_text>
            id = menu_display_balance
            pad_choose_script = toggle_display_balance
        }
    endif
    if NOT InNetGame
        if GetGlobalFlag flag = NO_DISPLAY_CUTSCENE_SUBTITLES
            <hud_text> = 'Off'
        else
            <hud_text> = 'On'
        endif
        theme_menu_add_item {
            text = 'Cutscene Subtitles:'
            extra_text = <hud_text>
            id = menu_display_cutscene_subtitles
            pad_choose_script = toggle_cutscene_subtitles
        }
    endif
    if InNetGame
        if GetGlobalFlag flag = NO_DISPLAY_NET_SCORES
            hud_text = 'Off'
        else
            hud_text = 'On'
        endif
        theme_menu_add_item {text = 'Names and Scores:'
            extra_text = <hud_text>
            id = menu_display_net_scores
            pad_choose_script = toggle_display_net_scores
        }
    endif
    if GotParam from_options
        theme_menu_add_item text = 'Done' id = menu_done pad_choose_script = display_options_exit pad_choose_params = { from_options }last_menu_item = 1
    else
        theme_menu_add_item text = 'Done' id = menu_done pad_choose_script = display_options_exit last_menu_item = 1
    endif
    finish_themed_sub_menu
endscript


script toggle_display_hud 
    if NOT GetGlobalFlag flag = NO_DISPLAY_HUD
        SetScreenElementProps id = { menu_display_hud child = 3 }text = 'Off'
        SetGlobalFlag flag = NO_DISPLAY_HUD
    else
        SetScreenElementProps id = { menu_display_hud child = 3 }text = 'On'
        UnsetGlobalFlag flag = NO_DISPLAY_HUD
    endif
endscript


script toggle_display_trickstring 
    if NOT GetGlobalFlag flag = NO_DISPLAY_TRICKSTRING
        SetScreenElementProps id = { menu_display_trickstring child = 3 }text = 'Off'
        SetGlobalFlag flag = NO_DISPLAY_TRICKSTRING
    else
        SetScreenElementProps id = { menu_display_trickstring child = 3 }text = 'On'
        UnsetGlobalFlag flag = NO_DISPLAY_TRICKSTRING
    endif
endscript


script toggle_display_basescore 
    if NOT GetGlobalFlag flag = NO_DISPLAY_BASESCORE
        SetScreenElementProps id = { menu_display_basescore child = 3 }text = 'Off'
        SetGlobalFlag flag = NO_DISPLAY_BASESCORE
    else
        SetScreenElementProps id = { menu_display_basescore child = 3 }text = 'On'
        UnsetGlobalFlag flag = NO_DISPLAY_BASESCORE
    endif
endscript


script toggle_display_chatwindow 
    if NOT GetGlobalFlag flag = NO_DISPLAY_CHATWINDOW
        SetScreenElementProps id = { menu_display_chatwindow child = 3 }text = 'Off'
        SetGlobalFlag flag = NO_DISPLAY_CHATWINDOW
    else
        SetScreenElementProps id = { menu_display_chatwindow child = 3 }text = 'On'
        UnsetGlobalFlag flag = NO_DISPLAY_CHATWINDOW
    endif
endscript


script toggle_display_balance 
    if NOT GetGlobalFlag flag = NO_DISPLAY_BALANCE
        SetScreenElementProps id = { menu_display_balance child = 3 }text = 'Off'
        SetGlobalFlag flag = NO_DISPLAY_BALANCE
    else
        SetScreenElementProps id = { menu_display_balance child = 3 }text = 'On'
        UnsetGlobalFlag flag = NO_DISPLAY_BALANCE
    endif
endscript


script toggle_display_net_names 
    GetPreferenceString pref_type = network show_names
    if (<ui_string> = 'Off')
        SetScreenElementProps id = { menu_display_net_names child = 3 }text = 'On'
        SetPreferencesFromUI prefs = network field = 'show_names' checksum = boolean_true string = 'On'
    else
        SetScreenElementProps id = { menu_display_net_names child = 3 }text = 'Off'
        SetPreferencesFromUI prefs = network field = 'show_names' checksum = boolean_false string = 'Off'
    endif
endscript


script toggle_display_net_scores 
    if NOT GetGlobalFlag flag = NO_DISPLAY_NET_SCORES
        SetScreenElementProps id = { menu_display_net_scores child = 3 }text = 'Off'
        SetGlobalFlag flag = NO_DISPLAY_NET_SCORES
    else
        SetScreenElementProps id = { menu_display_net_scores child = 3 }text = 'On'
        UnsetGlobalFlag flag = NO_DISPLAY_NET_SCORES
    endif
endscript


script display_options_exit 
    if ScreenElementExists id = current_menu_anchor
        DestroyScreenElement id = current_menu_anchor
    endif
    if NOT LevelIs load_mainmenu
        create_options_menu
    else
        create_setup_options_menu
    endif
endscript


script toggle_cutscene_subtitles 
    if GetGlobalFlag flag = NO_DISPLAY_CUTSCENE_SUBTITLES
        UnsetGlobalFlag flag = NO_DISPLAY_CUTSCENE_SUBTITLES
        SetScreenElementProps id = { menu_display_cutscene_subtitles child = 3 }text = 'On'
    else
        SetGlobalFlag flag = NO_DISPLAY_CUTSCENE_SUBTITLES
        SetScreenElementProps id = { menu_display_cutscene_subtitles child = 3 }text = 'Off'
    endif
endscript


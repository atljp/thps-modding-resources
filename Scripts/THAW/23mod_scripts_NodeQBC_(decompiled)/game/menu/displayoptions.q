
script launch_display_options_menu 
    if GotParam \{ from_options }
        create_display_options_menu \{ from_options }
    else
        create_display_options_menu
    endif
endscript

script create_display_options_menu 
    make_new_themed_sub_menu Title = 'OPCJE WYWIETLANIA'
    create_helper_text {helper_text_elements = [{ text = '\b7/\b4 = Zaznacz' }
            { text = '\m1 = Wstecz' }
            { text = '\m0 = Akceptuj' }
        ]
    }
    SetScreenElementProps {id = sub_menu
        event_handlers = [
            {pad_back generic_menu_pad_back params = { callback = display_options_exit }}
        ]
    }
    if GetGlobalFlag flag = NO_DISPLAY_HUD
        hud_text = 'Wy³.'
    else
        hud_text = 'W³.'
    endif
    theme_menu_add_item {text = 'Wynik/Licznik specjalny'
        extra_text = <hud_text>
        id = menu_display_hud
        pad_choose_script = toggle_display_hud
    }
    if GameModeEquals is_career
        if GetGlobalFlag flag = NO_DISPLAY_COMPASS
            hud_text = 'Wy³.'
        else
            hud_text = 'W³.'
        endif
        theme_menu_add_item {text = 'Kompas:'
            extra_text = <hud_text>
            id = menu_display_compass
            pad_choose_script = toggle_display_compass
        }
    endif
    if GetGlobalFlag flag = NO_DISPLAY_TRICKSTRING
        hud_text = 'Wy³.'
    else
        hud_text = 'W³.'
    endif
    theme_menu_add_item {text = 'Ci¹g trików:'
        extra_text = <hud_text>
        id = menu_display_trickstring
        pad_choose_script = toggle_display_trickstring
    }
    if GetGlobalFlag flag = NO_DISPLAY_BASESCORE
        hud_text = 'Wy³.'
    else
        hud_text = 'W³.'
    endif
    theme_menu_add_item {text = 'Bazowy wynik:'
        extra_text = <hud_text>
        id = menu_display_basescore
        pad_choose_script = toggle_display_basescore
    }
    if GetGlobalFlag flag = NO_DISPLAY_CHATWINDOW
        hud_text = 'Wy³.'
    else
        hud_text = 'W³.'
    endif
    theme_menu_add_flag_item {text = 'Wskanik furii:'
        id = tantrum_text
        flag = TANTRUM_OFF
        reverse
    }
    if InNetGame
        if IsPs2
            theme_menu_add_item {text = 'Okno chatu:'
                extra_text = <hud_text>
                id = menu_display_chatwindow
                pad_choose_script = toggle_display_chatwindow
            }
        endif
    else
        theme_menu_add_item {text = 'Okno konsoli:'
            extra_text = <hud_text>
            id = menu_display_chatwindow
            pad_choose_script = toggle_display_chatwindow
        }
    endif
    if GetGlobalFlag flag = NO_DISPLAY_BALANCE
        hud_text = 'Wy³.'
    else
        hud_text = 'W³.'
    endif
    if InNetGame
        if GetGlobalFlag flag = no_g_display_balance
            theme_menu_add_item {text = 'Mierniki równowagi:'
                extra_text = <hud_text>
                id = menu_display_balance
                pad_choose_script = toggle_display_balance
                not_focusable = not_focusable
            }
        else
            theme_menu_add_item {text = 'Mierniki równowagi:'
                extra_text = <hud_text>
                id = menu_display_balance
                pad_choose_script = toggle_display_balance
            }
        endif
    else
        theme_menu_add_item {text = 'Mierniki równowagi:'
            extra_text = <hud_text>
            id = menu_display_balance
            pad_choose_script = toggle_display_balance
        }
    endif
    if NOT InNetGame
        if GetGlobalFlag flag = NO_DISPLAY_CUTSCENE_SUBTITLES
            <hud_text> = 'Wy³.'
        else
            <hud_text> = 'W³.'
        endif
        theme_menu_add_item {
            text = 'Napisy w filmikach'
            extra_text = <hud_text>
            id = menu_display_cutscene_subtitles
            pad_choose_script = toggle_cutscene_subtitles
        }
    endif
    if InNetGame
        if GetGlobalFlag flag = NO_DISPLAY_NET_SCORES
            hud_text = 'Wy³.'
        else
            hud_text = 'W³.'
        endif
        theme_menu_add_item {text = 'Imiona i wyniki'
            extra_text = <hud_text>
            id = menu_display_net_scores
            pad_choose_script = toggle_display_net_scores
        }
    endif
    if GotParam from_options
        theme_menu_add_item text = 'Zrobione' id = menu_done pad_choose_script = display_options_exit pad_choose_params = { from_options }last_menu_item = 1
    else
        theme_menu_add_item text = 'Zrobione' id = menu_done pad_choose_script = display_options_exit last_menu_item = 1
    endif
    finish_themed_sub_menu
endscript

script toggle_display_hud 
    if NOT GetGlobalFlag \{ flag = NO_DISPLAY_HUD }
        SetScreenElementProps \{id = { menu_display_hud child = 3 }text = 'Wy³.'}
        SetGlobalFlag \{ flag = NO_DISPLAY_HUD }
    else
        SetScreenElementProps \{id = { menu_display_hud child = 3 }text = 'W³.'}
        UnsetGlobalFlag \{ flag = NO_DISPLAY_HUD }
    endif
endscript

script toggle_display_compass 
    if NOT GetGlobalFlag \{ flag = NO_DISPLAY_COMPASS }
        SetScreenElementProps \{id = { menu_display_compass child = 3 }text = 'Wy³.'}
        SetGlobalFlag \{ flag = NO_DISPLAY_COMPASS }
    else
        SetScreenElementProps \{id = { menu_display_compass child = 3 }text = 'W³.'}
        UnsetGlobalFlag \{ flag = NO_DISPLAY_COMPASS }
        CompassManager_Refresh
        hide_compass_anchor
    endif
endscript

script toggle_display_trickstring 
    if NOT GetGlobalFlag \{ flag = NO_DISPLAY_TRICKSTRING }
        SetScreenElementProps \{id = { menu_display_trickstring child = 3 }text = 'Wy³.'}
        SetGlobalFlag \{ flag = NO_DISPLAY_TRICKSTRING }
    else
        SetScreenElementProps \{id = { menu_display_trickstring child = 3 }text = 'W³.'}
        UnsetGlobalFlag \{ flag = NO_DISPLAY_TRICKSTRING }
    endif
endscript

script toggle_display_basescore 
    if NOT GetGlobalFlag \{ flag = NO_DISPLAY_BASESCORE }
        SetScreenElementProps \{id = { menu_display_basescore child = 3 }text = 'Wy³.'}
        SetGlobalFlag \{ flag = NO_DISPLAY_BASESCORE }
    else
        SetScreenElementProps \{id = { menu_display_basescore child = 3 }text = 'W³.'}
        UnsetGlobalFlag \{ flag = NO_DISPLAY_BASESCORE }
    endif
endscript

script toggle_display_chatwindow 
    if NOT GetGlobalFlag \{ flag = NO_DISPLAY_CHATWINDOW }
        SetScreenElementProps \{id = { menu_display_chatwindow child = 3 }text = 'Wy³.'}
        SetGlobalFlag \{ flag = NO_DISPLAY_CHATWINDOW }
    else
        SetScreenElementProps \{id = { menu_display_chatwindow child = 3 }text = 'W³.'}
        UnsetGlobalFlag \{ flag = NO_DISPLAY_CHATWINDOW }
    endif
endscript

script toggle_display_balance 
    if NOT GetGlobalFlag \{ flag = NO_DISPLAY_BALANCE }
        SetScreenElementProps \{id = { menu_display_balance child = 3 }text = 'Wy³.'}
        SetGlobalFlag \{ flag = NO_DISPLAY_BALANCE }
    else
        SetScreenElementProps \{id = { menu_display_balance child = 3 }text = 'W³.'}
        UnsetGlobalFlag \{ flag = NO_DISPLAY_BALANCE }
    endif
endscript

script toggle_cutscene_subtitles 
    if NOT GetGlobalFlag \{ flag = NO_DISPLAY_CUTSCENE_SUBTITLES }
        SetScreenElementProps \{id = { menu_display_cutscene_subtitles child = 3 }text = 'Wy³.'}
        SetGlobalFlag \{ flag = NO_DISPLAY_CUTSCENE_SUBTITLES }
    else
        SetScreenElementProps \{id = { menu_display_cutscene_subtitles child = 3 }text = 'W³.'}
        UnsetGlobalFlag \{ flag = NO_DISPLAY_CUTSCENE_SUBTITLES }
    endif
endscript

script toggle_display_net_scores 
    if NOT GetGlobalFlag \{ flag = NO_DISPLAY_NET_SCORES }
        SetScreenElementProps \{id = { menu_display_net_scores child = 3 }text = 'Wy³.'}
        SetGlobalFlag \{ flag = NO_DISPLAY_NET_SCORES }
    else
        SetScreenElementProps \{id = { menu_display_net_scores child = 3 }text = 'W³.'}
        UnsetGlobalFlag \{ flag = NO_DISPLAY_NET_SCORES }
    endif
endscript

script display_options_exit 
    if ScreenElementExists \{ id = current_menu_anchor }
        DestroyScreenElement \{ id = current_menu_anchor }
    endif
    if NOT InFrontend
        create_options_menu
    else
        create_setup_options_menu
    endif
endscript

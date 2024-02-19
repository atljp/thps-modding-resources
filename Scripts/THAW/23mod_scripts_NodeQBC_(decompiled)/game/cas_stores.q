cas_store_params = {
    barbershop = {
        store_title = 'FRYZJER'
        text_length = 150
        accept_text = 'Wcinij \ms, by skosiæ hery'
        part = skater_m_hair
        options = edit_skater_barbershop_options
        cam_anim = Head
        z_ho = {
            entrance_camera = { LockTo = world Pos = (-3258.300048828125, 73.5, -2983.10009765625) Quat = (-0.04935000091791153, 0.9198039770126343, -0.12289399653673172) FOV = 72.0 }
            cam_angle = -90
            node_enter = Z_HO_TRG_Restart_Barbershop_Int
            node_in = Z_HO_TRG_Restart_Barbershop_Edit
            node_out = Z_HO_TRG_Restart_Barbershop_Ext
            node_board = 0
            board_camera = 0
        }
        z_sm = {
            entrance_camera = { LockTo = world Pos = (-3737.5, 80.80000305175781, 10135.599609375) Quat = (-0.059363000094890594, -0.8875730037689209, 0.12006200104951859) FOV = 72.0 }
            cam_angle = 75
            node_enter = Z_SM_TRG_Restart_Barbershop_Int
            node_in = Z_SM_TRG_Restart_Barbershop_Edit
            node_out = Z_SM_TRG_Restart_Barbershop_Ext
            node_board = 0
            board_camera = 0
        }
    }
    clothingshop = {
        store_title = 'SKLEP Z CIUCHAMI'
        text_length = 200
        accept_text = 'Wcinij \ms, by zmieniæ ciuchy'
        options = edit_skater_clothing_options
        cam_anim = FullBody
        z_bh = {
            entrance_camera = { LockTo = world Pos = (-14531.7998046875, -736.2999877929688, 7244.89990234375) Quat = (-0.0050559998489916325, -0.7354490160942078, 0.002583000110462308) FOV = 67.0 }
            cam_angle = 0
            node_enter = Z_BH_TRG_Restart_CASShop_Int
            node_in = Z_BH_TRG_Restart_CASshop_Edit
            node_out = Z_BH_TRG_Restart_CASshop_Ext
            node_board = 0
            board_camera = 0
        }
        z_el = {
            entrance_camera = { LockTo = world Pos = (19116.400390625, -502.5, 12567.900390625) Quat = (-0.03096099942922592, -0.9511250257492065, 0.04484200105071068) FOV = 55.0 }
            cam_angle = 0
            node_enter = Z_EL_TRG_Restart_CASShop_Int
            node_in = Z_EL_TRG_Restart_CASshop_Edit
            node_out = Z_EL_TRG_Restart_CASshop_Ext
            node_board = 0
            board_camera = 0
        }
        z_ho = {
            entrance_camera = { LockTo = world Pos = (-4234.7998046875, 83.5, -3262.5) Quat = (-0.0654349997639656, 0.46565499901771545, -0.034550998359918594) FOV = 72.0 }
            cam_angle = -180
            node_enter = Z_HO_TRG_Restart_CASShop_Int
            node_in = Z_HO_TRG_Restart_CASshop_Edit
            node_out = Z_HO_TRG_Restart_CASshop_Ext
            node_board = 0
            board_camera = 0
        }
    }
    skateshop = {
        store_title = 'SKATESHOP'
        text_length = 150
        accept_text = 'Wcinij \ms by zabraæ sprzêt'
        options = edit_skater_skateshop_options
        cam_anim = FullBody
        z_bh = {
            entrance_camera = { LockTo = world Pos = (-11947.400390625, -9.300000190734863, 8273.2998046875) Quat = (-0.03085700049996376, 0.9359760284423828, -0.07126999646425247) FOV = 72.0 }
            board_camera = {
                LockTo = world
                Pos = (-12129.400390625, -18.899999618530273, 8127.7998046875)
                Quat = (-0.08247099816799164, 0.8282279968261719, -0.11797600239515305)
                FOV = 66.0
                Play_hold
                frames = 1
            }
            cam_angle = -60
            node_enter = Z_BH_TRG_Restart_Skateshop_Int
            node_in = Z_BH_TRG_Restart_Skateshop_Edit
            node_out = Z_BH_TRG_Restart_Skateshop_Ext
            node_board = Z_BH_TRG_SkateShop_BoardNode
        }
        z_dt = {
            entrance_camera = { LockTo = world Pos = (10055.5, -1292.5, 5439.5) Quat = (-0.03448700159788132, -0.9465799927711487, 0.10815700143575668) FOV = 72.0 }
            board_camera = {
                LockTo = world
                Pos = (10265.5, -1307.800048828125, 5255.39990234375)
                Quat = (-0.006587999872863293, -0.9886170029640198, 0.045462001115083694)
                FOV = 60.0
                Play_hold
                frames = 1
            }
            cam_angle = 30
            node_enter = Z_DT_TRG_Restart_Skateshop_Int
            node_in = Z_DT_TRG_Restart_Skateshop_Edit
            node_out = Z_DT_TRG_Restart_Skateshop_Ext
            node_board = Z_DT_TRG_SkateShop_BoardNode
        }
        z_el = {
            entrance_camera = { LockTo = world Pos = (20395.0, -509.3999938964844, 12244.599609375) Quat = (-0.040591999888420105, 0.9094840288162231, -0.09543199837207794) FOV = 62.0 }
            board_camera = {
                LockTo = world
                Pos = (20195.30078125, -535.2000122070312, 12105.7001953125)
                Quat = (-0.003619000082835555, 0.7628430128097534, -0.0025110000278800726)
                FOV = 44.0
                Play_hold
                frames = 1
            }
            cam_angle = -60
            node_enter = Z_EL_TRG_Restart_Skateshop_Int
            node_in = Z_EL_TRG_Restart_Skateshop_Edit
            node_out = Z_EL_TRG_Restart_Skateshop_Ext
            node_board = Z_EL_TRG_SkateShop_BoardNode
        }
        z_ho = {
            entrance_camera = { LockTo = world Pos = (-4249.7998046875, 94.30000305175781, -1365.199951171875) Quat = (0.0016469999682158232, 0.9608169794082642, 0.005714999977499247) FOV = 72.0 }
            board_camera = {
                LockTo = world
                Pos = (-4337.89990234375, 82.69999694824219, -1525.5999755859375)
                Quat = (-0.0001250000059371814, -0.9998639822006226, 0.009302999824285507)
                FOV = 72.0
                Play_hold
                frames = 1
            }
            cam_angle = -60
            node_enter = Z_HO_TRG_Restart_Skateshop_Int
            node_in = Z_HO_TRG_Restart_Skateshop_Edit
            node_out = Z_HO_TRG_Restart_Skateshop_Ext
            node_board = Z_HO_TRG_SkateShop_BoardNode
        }
        z_sm = {
            entrance_camera = { LockTo = world Pos = (-10267.2001953125, -783.0999755859375, 16802.599609375) Quat = (-0.02969999983906746, 0.9161139726638794, -0.06848400086164474) FOV = 72.0 }
            board_camera = {
                LockTo = world
                Pos = (-10397.7001953125, -794.0999755859375, 16724.099609375)
                Quat = (-0.027860000729560852, 0.9397779703140259, -0.07827199995517731)
                FOV = 72.0
                Play_hold
                frames = 1
            }
            cam_angle = -60
            node_enter = Z_SM_TRG_Restart_Skateshop_Int
            node_in = Z_SM_TRG_Restart_Skateshop_Edit
            node_out = Z_SM_TRG_Restart_Skateshop_Ext
            node_board = Z_SM_TRG_SkateShop_BoardNode
        }
    }
    tattooshop = {
        store_title = 'GABINET TATUA¯U'
        text_length = 150
        accept_text = 'Wcinij \ms by zostaæ wytatuowany.'
        options = edit_skater_tattoo_options
        cam_anim = FullBody
        z_dt = {
            cam_angle = 0
            node_enter = Z_DT_TRG_Restart_Tattooshop_Int
            node_in = Z_DT_TRG_Restart_Tattooshop_Edit
            node_out = Z_DT_TRG_Restart_Tattooshop_Ext
            node_board = 0
            board_camera = 0
        }
        z_el = {
            entrance_camera = { LockTo = world Pos = (21027.400390625, -522.2000122070312, 12170.400390625) Quat = (0.003200999926775694, -0.9782630205154419, 0.044346000999212265) FOV = 55.0 }
            cam_angle = 0
            node_enter = Z_EL_TRG_Restart_Tattooshop_Int
            node_in = Z_EL_TRG_Restart_Tattooshop_Edit
            node_out = Z_EL_TRG_Restart_Tattooshop_Ext
            node_board = 0
            board_camera = 0
        }
        z_sm = {
            entrance_camera = { LockTo = world Pos = (-12074.5, -786.4000244140625, 17165.69921875) Quat = (-0.025985000655055046, -0.9721930027008057, 0.13161799311637878) FOV = 72.0 }
            cam_angle = 0
            node_enter = Z_SM_TRG_Restart_Tattooshop_Int
            node_in = Z_SM_TRG_Restart_Tattooshop_Edit
            node_out = Z_SM_TRG_Restart_Tattooshop_Ext
            node_board = 0
            board_camera = 0
        }
    }
    accessoryshop = {
        store_title = 'SKLEP Z DODATKAMI'
        text_length = 150
        accept_text = 'Wcinij \ms by kupiæ nieco b³yskotek'
        options = edit_skater_accessory_options
        cam_anim = FullBody
        z_bh = {
            entrance_camera = { LockTo = world Pos = (-12894.400390625, -1398.699951171875, 10975.7001953125) Quat = (-0.009014000184834003, -0.9844499826431274, 0.04668999835848808) FOV = 42.0 }
            cam_angle = 40
            node_enter = Z_BH_TRG_Restart_Accessoryshop_Int
            node_in = Z_BH_TRG_Restart_Accessoryshop_Edit
            node_out = Z_BH_TRG_Restart_Accessoryshop_Ext
            node_board = 0
            board_camera = 0
        }
        z_dt = {
            entrance_camera = { LockTo = world Pos = (9330.0, -535.2000122070312, 5150.39990234375) Quat = (-0.022064000368118286, -0.9218000173568726, 0.052981000393629074) FOV = 72.0 }
            cam_angle = 30
            node_enter = Z_DT_TRG_Restart_Accessoryshop_Int
            node_in = Z_DT_TRG_Restart_Accessoryshop_Edit
            node_out = Z_DT_TRG_Restart_Accessoryshop_Ext
            node_board = 0
            board_camera = 0
        }
        z_ho = {
            cam_angle = 0
            cam_pos = (-55.0, 55.0, 80.0)
            node_enter = Z_HO_TRG_Restart_Accessoryshop_Int
            node_in = Z_HO_TRG_Restart_Accessoryshop_Edit
            node_out = Z_HO_TRG_Restart_Accessoryshop_Ext
            node_board = 0
            board_camera = 0
        }
    }
}
last_cas_item_price = 0
last_cas_item_id = 0

script cas_store_try_load 
    PauseSkaters
    disableplayerinput
    <zone_loaded> = 1
    if (<zone_loaded> = 0)
        create_snazzy_dialog_box {
            Title = 'Wczytywanie...'
            text = 'Wchodzenie do sklepu...'
            text_dims = (200.0, 0.0)
            pad_back_script = NullScript
            no_bg
        }
        wait 5 seconds
        dialog_box_exit
    endif
    PlayIGCCam <camera> Play_hold
    Walk_UseMovieCamera
    FinishPendingZoneLoads
    TeleportSkaterToNode nodeName = <node> walking
    SetForceWalk
    MakeSkaterGoto WalkIndoorState
endscript
entering_cas_store = 0
cas_current_store_ped = 0
cas_was_in_store = 0

script enter_cas_store 
    if GameModeEquals is_career
        if NOT (entering_cas_store = 0)
            return 
        endif
        if ((cat_pak_is_loaded)= 1)
            return 
        endif
        change cas_was_in_store = 1
        OnExitRun enter_cas_store_cleanup
        change entering_cas_store = 1
        if skater ::IsSkaterOnBike
            text = 'Zabierz st¹d ten rower!'
        else
            if NOT walking
                text = 'Nikt nie bêdzie jedzi³ po moim sklepie!\n\n(Wcinij \mm by zacz¹æ chodziæ)'
            else
                if currentscorepotgreaterthan 0
                    text = 'Zakoñcz combo, zanim tu przyjdziesz!'
                else
                    <allow_enter> = 1
                    if NOT GoalManager_HasWonGoal name = Z_SM_Goal_Counter2
                        GetCurrentSkaterProfileIndex
                        GetPlayerAppearancePart player = <currentSkaterProfileIndex> part = skater_m_torso
                        if (<desc_id> = #"Alien Costume")
                            text = 'Nie obs³ugujemy tu takich jak ty!'
                            <allow_enter> = 0
                        endif
                    endif
                    if (<allow_enter> = 1)
                        GetCurrentZoneName
                        if (<zone_name> = 'z_ho')
                            <allow_enter> = 0
                            <text> = 'Hej, lepiej pogadaj z Mindy.'
                            if ((GoalManager_GoalIsActive name = Z_HO_Goal_Gaps30)|| 
                                (GoalManager_GoalIsActive name = Z_HO_Goal_Gaps15)|| 
                                (GoalManager_HasWonGoal name = Z_HO_Goal_Gaps15))
                                <allow_enter> = 1
                            endif
                        endif
                        if (<allow_enter> = 1)
                            if GoalManager_GoalExists name = (goal_utility_last_goal_activated)
                                if GoalManager_GoalIsActive name = (goal_utility_last_goal_activated)
                                    <allow_enter> = 0
                                    <text> = 'Powniene znaleæ sobie jakie zadanie przed zakupami.'
                                    if ChecksumEquals a = (goal_utility_last_goal_activated)b = Z_HO_Goal_Gaps15
                                        <allow_enter> = 1
                                    else
                                        if ChecksumEquals a = (goal_utility_last_goal_activated)b = Z_HO_Goal_Gaps30
                                            <allow_enter> = 1
                                        endif
                                    endif
                                endif
                            endif
                        endif
                        if (<allow_enter> = 1)
                            if GotParam type
                                disableplayerinput
                                spawnscriptnow SK6_Music_Fade_Out
                                skater ::kill_all_projectiles
                                wait 2 gameframes
                                if NOT IsNGC
                                    do_unload_unloadable
                                    LoadPak 'pak/CAS_common/CAS_common.pak' localized heap = unloadableanim
                                else
                                    LoadPak 'pak/CAS_common/CAS_common.pak' localized
                                endif
                                MakeSkaterGoto SkaterInit params = { walk }
                                GetCurrentSkaterProfileIndex
                                RememberTemporaryAppearance {
                                    player = <currentSkaterProfileIndex>
                                    name = cas_preview_temp_profile
                                    nofacetexture
                                }
                                if NOT IsNGC
                                    InitPlayerAppearanceCache profile = <currentSkaterProfileIndex> heap = unloadableanim
                                else
                                    InitPlayerAppearanceCache profile = <currentSkaterProfileIndex>
                                endif
                                if NOT IsNGC
                                    RefreshSkaterModel profile = <currentSkaterProfileIndex> skater = <controller> is_caching
                                endif
                                GetLevelStructureName
                                FormatText checksumname = level (<level_structure_name>.level)
                                cas_store_try_load camera = (cas_store_params.<type>.<level>.entrance_camera)node = (cas_store_params.<type>.<level>.node_enter)
                                hide_compass_anchor
                                RunTimer_pause
                                wait 2 gameframes
                                SetScreenElementLock id = root_window Off
                                CreateScreenElement {
                                    type = ContainerElement
                                    id = exit_shop_anchor
                                    parent = root_window
                                    dims = (640.0, 480.0)
                                    Pos = (320.0, 240.0)
                                    event_handlers = [
                                        {pad_back cas_store_pad_back params = {node = (cas_store_params.<type>.<level>.node_out)}}
                                    ]
                                }
                                create_helper_text parent = exit_shop_anchor helper_text_elements = [{ text = '\m1=Wyjd ze sklepu' }] no_bar
                                FireEvent type = focus target = exit_shop_anchor
                                OnExitRun
                                enableplayerinput
                                UnpauseSkaters
                                return 
                            endif
                        endif
                    endif
                endif
            endif
        endif
        PauseSkaters
        OnExitRun
        GoalManager_PauseAllGoals
        create_snazzy_dialog_box {
            Title = 'Hej'
            text = <text>
            text_dims = (400.0, 0.0)
            pad_back_script = enter_cas_store_cleanup
            no_bg
            buttons = [
                {text = 'Ok' pad_choose_script = enter_cas_store_cleanup}
            ]
        }
    endif
endscript

script enter_cas_store_cleanup 
    dialog_box_exit
    UnpauseSkaters
    GoalManager_UnPauseAllGoals
    change \{ entering_cas_store = 0 }
endscript

script cas_store_pad_back 
    if NOT AsyncLoadPakInProgress
        MakeSkaterGoto exit_cas_store params = { node = <node> }
    endif
endscript

script exit_cas_store 
    if ScreenElementExists \{ id = exit_shop_anchor }
        DestroyScreenElement \{ id = exit_shop_anchor }
    endif
    show_compass_anchor
    UnsetForceWalk
    if GotParam \{ type }
        GetLevelStructureName
        FormatText checksumname = level (<level_structure_name>.level)
        cas_store_try_exit node = (cas_store_params.<type>.<level>.node_out)
    else
        cas_store_try_exit node = <node>
    endif
endscript
last_cas_store = 0

script Ped_Utils_SetupCASStore {
        inner_radius = 8
        outer_radius = 40
        activation_script = cas_store_enter
        dont_deactivate_goals
    }
    if NOT GotParam ped_id
        if IsObjectScript
            obj_getid
            ped_id = <ObjID>
            RemoveParameter ObjID
            printf 'Ped_Utils_SetupCASStore: assuming ped id %s' s = <ped_id>
        else
            scriptassert 'need ped_id='
        endif
    endif
    accept_text = (cas_store_params.<type>.accept_text)
    ClearEventHandler anyobjectinradius
    ClearEventHandler objectoutofradius
    obj_setinnerradius <inner_radius>
    seteventhandler Ex = anyobjectinradius scr = ped_speech_got_trigger params = { <...> activation_script_params = <...>  }
endscript
in_game_cas_angle = 0
in_game_cas_default_node = Z_HO_TRG_Restart_Skateshop_Int
in_game_cas_default_node_board = Z_HO_TRG_SkateShop_BoardNode
in_game_cas_board_camera = {
    LockTo = world
    Pos = (-4520.7001953125, 90.0, -2133.0)
    Quat = (-0.0066999997943639755, 0.9932649731636047, -0.0858990028500557)
    FOV = 72.0
    Play_hold
    frames = 1
}
cas_store_pak_file = ''

script cas_store_enter 
    if ScreenElementExists id = exit_shop_anchor
        DestroyScreenElement id = exit_shop_anchor
    endif
    SetButtonEventMappings block_menu_input
    skater ::disableplayerinput
    UnpauseSkaters
    fadetoblack on alpha = 1.0 time = 0.3000
    wait 0.4000 seconds
    change cas_current_store_ped = (<ped_id>)
    change cas_store_pak_file = ''
    GetLevelStructureName
    FormatText checksumname = level (<level_structure_name>.level)
    store_type_params = (cas_store_params.<type>)
    if NOT StructureContains structure = (cas_store_params.<type>)<level>
        scriptassert 'Nie znaleziono parametrów poziomu dla tego typu sklepu'
    endif
    current_store_params = (cas_store_params.<type>.<level>)
    <store_string> = ''
    switch <level>
        case z_ho
        <store_string> = 'z_ho_'
        case z_bh
        <store_string> = 'z_bh_'
        case z_dt
        <store_string> = 'z_dt_'
        case z_sm
        <store_string> = 'z_sm_'
        case z_el
        <store_string> = 'z_el_'
    endswitch
    switch <type>
        case barbershop
        ped_vo_type = 'barbershop_'
        StringRemove new_string = shop_type text = <ped_vo_type> remove = '_'
        <store_string> = (<store_string> + <shop_type>)
        case clothingshop
        ped_vo_type = 'clothingshop_'
        StringRemove new_string = shop_type text = <ped_vo_type> remove = '_'
        <store_string> = (<store_string> + <shop_type>)
        case skateshop
        ped_vo_type = 'skateshop_'
        StringRemove new_string = shop_type text = <ped_vo_type> remove = '_'
        <store_string> = (<store_string> + <shop_type>)
        case tattooshop
        ped_vo_type = 'tattooshop_'
        StringRemove new_string = shop_type text = <ped_vo_type> remove = '_'
        <store_string> = (<store_string> + <shop_type>)
        case accessoryshop
        ped_vo_type = 'accessoryshop_'
        StringRemove new_string = shop_type text = <ped_vo_type> remove = '_'
        <store_string> = (<store_string> + <shop_type>)
    endswitch
    change last_cas_store = <ped_vo_type>
    if GotParam ped_vo_type
        if ((GetGlobalFlag flag = GETTING_SPIDER_TAT)& (StringEquals a = <ped_vo_type> b = 'tattooshop_'))
            spawnscriptnow play_vo_sound_killall params = {ped_vo_type = <ped_vo_type> ped_vo_action = 'widowz_' play_action action_range = 4}
        else
            if (StringEquals a = <ped_vo_type> b = 'skateshop_')
                <sponsor_flag> = play_sponsor
            endif
            spawnscriptnow play_vo_sound_killall params = {ped_vo_type = <ped_vo_type> play_generic play_lasttime play_tod <sponsor_flag>}
        endif
    endif
    if NOT (<store_string> = 'z_ho_clothingshop')
        FormatText checksumname = store_flag '%a' a = <store_string>
    endif
    <store_string> = (<store_string> + '_data')
    printf 'ENTERING STORE: %a' a = <store_string>
    FormatText textname = pak_file 'pak/%a/%b.pak' a = <store_string> b = <store_string>
    printf 'Loading store pak: %a' a = <pak_file>
    change cas_store_pak_file = <pak_file>
    if NOT IsNGC
        LoadPak (cas_store_pak_file)heap = unloadableanim is_raw
    else
    endif
    SetScreenElementLock id = root_window Off
    CreateScreenElement {
        parent = root_window
        id = cas_store_anchor
        type = ContainerElement
        tags = {
            current_store_params = <current_store_params>
        }
    }
    SetScreenEffectsShadowVolumeParams intensity = 0
    hide_all_hud_items
    ResetSkaters RestartWalking node_name = (<current_store_params>.node_in)
    change in_game_cas_default_node = (<current_store_params>.node_in)
    change in_game_cas_default_node_board = (<current_store_params>.node_board)
    change in_game_cas_board_camera = (<current_store_params>.board_camera)
    skater ::disableplayerinput
    KillSkaterCamAnim all
    Walk_RestoreCamera
    change cas_cam_angle = (<current_store_params>.cam_angle)
    change in_game_cas_angle = (<current_store_params>.cam_angle)
    skater ::SwitchOnBoard
    cas_setup_rotating_camera cam_anim = (cas_store_params.<type>.cam_anim)
    wait 1 gameframes
    fadetoblack Off no_wait alpha = 0.0 time = 0.3000
    SetButtonEventMappings unblock_menu_input
    spawnscriptnow noqbid Integrated_CAS_create_options_menu params = {
        options_array = (cas_store_params.<type>.options)
        pad_back_script = cas_store_exit
        parent = cas_store_anchor
        cam_anim = (cas_store_params.<type>.cam_anim)
        show_deck
        store_flag = <store_flag>
    }
    MakeSkaterGoto Skater_Playanim params = {anim = WStand Cycle BlendPeriod = 0}
    SetScreenElementProps {
        id = current_menu
        event_handlers = [
            { pad_l1 cas_rotate_skater_left }
            { pad_r1 cas_rotate_skater_right }
        ]
        replace_handlers
    }
    CreateScreenElement {
        parent = cas_store_anchor
        id = cash_anchor
        type = ContainerElement
        Pos = (560.0, 95.0)
    }
    CareerFunc func = GetCash
    FormatText textname = cash_text 'Kasa - $%c' c = <cash>
    CreateScreenElement {
        type = TextElement
        parent = cash_anchor
        id = cash_counter
        text = <cash_text>
        font = dialog
        just = [ center , center ]
        Scale = (0.800000011920929, 0.949999988079071)
        rgba = [ 128 128 128 78 ]
        z_priority = 20
    }
    CreateScreenElement {
        type = SpriteElement
        parent = cash_anchor
        id = cash_bar
        texture = goal_grad
        rgba = [ 0 0 0 100 ]
        just = [ center , center ]
        Scale = (5.0, 4.0)
        z_priority = 19
        flip_v
    }
endscript

script cas_store_exit 
    KillSpawnedScript \{ name = cas_rotate_skater }
    if NOT (cas_temp_shirt_desc = 0)
        create_snazzy_dialog_box \{Title = 'Hej' text = 'Chcesz znów za³o¿yæ swoj¹ koszulê?' text_dims = (400.0, 0.0) pad_back_script = NullScript no_bg buttons = [{ text = 'Tak' pad_choose_script = cas_store_replace_shirt }{ text = 'Nie' pad_choose_script = cas_store_exit_continue }]}
        return 
    endif
    cas_store_exit_continue
endscript

script cas_store_exit_continue 
    dialog_box_exit
    skater ::UnPausePhysics
    SetButtonEventMappings block_menu_input
    cas_store_anchor ::getsingletag current_store_params
    DestroyScreenElement id = cas_store_anchor
    show_all_hud_items
    kill_panel_message_if_it_exists id = ped_speech_dialog
    if NOT IsNGC
        if NOT (cas_store_pak_file = '')
            BeginUnloadPak (cas_store_pak_file)
            wait 2 gameframes
            EndUnloadPak (cas_store_pak_file)
            change cas_store_pak_file = ''
        endif
    endif
    SetScreenEffectsShadowVolumeParams Shadow_Volume_Settings
    cas_store_try_exit node = (<current_store_params>.node_out)
    skater ::enableplayerinput
    skater ::Walk_ExitIndoors
    SetButtonEventMappings unblock_menu_input
endscript

script cas_store_try_exit 
    printf 'cas_store_try_exit'
    OnExitRun cas_store_finish_exit
    speech_box_input_debounce
    PauseMusic 0
    <fade_music> = 1
    if GoalManager_GoalExists name = Z_HO_Goal_Gaps15
        if GoalManager_GoalIsActive name = Z_HO_Goal_Gaps15
            <fade_music> = 0
        endif
    endif
    if GoalManager_GoalExists name = Z_HO_Goal_Gaps30
        if GoalManager_GoalIsActive name = Z_HO_Goal_Gaps30
            <fade_music> = 0
        endif
    endif
    if (<fade_music> = 0)
        SK6_Music_Fade_In DoQuick = 1
    else
        spawnscriptnow SK6_Music_Fade_In
    endif
    printf 'flush the model cache'
    GetCurrentSkaterProfileIndex
    DestroyPlayerAppearanceCache profile = <currentSkaterProfileIndex>
    play_vo_sound_killall
    change cas_current_store_ped = 0
    BeginUnloadPak 'pak/CAS_common/CAS_common.pak' localized
    EndUnloadPak 'pak/CAS_common/CAS_common.pak' localized
    if NOT IsNGC
        do_load_unloadable
    endif
    <zone_loaded> = 1
    if (<zone_loaded> = 0)
        create_snazzy_dialog_box {
            Title = 'Wczytywanie...'
            text = 'Opuszczanie sklep...'
            text_dims = (200.0, 0.0)
            pad_back_script = NullScript
            no_bg
        }
        wait 5 seconds
        printf 'waited 5 seconds' bg_color = green
        dialog_box_exit
    endif
    pulse_blur start = 255 Speed = 5
    KillSkaterCamAnim all
    ResetSkaters RestartWalking node_name = <node>
endscript

script cas_store_finish_exit 
    change \{ entering_cas_store = 0 }
endscript

script cas_store_replace_shirt 
    GetCurrentSkaterProfileIndex
    EditPlayerAppearance profile = <currentSkaterProfileIndex> target = setpart targetParams = {part = skater_m_torso desc_id = (cas_temp_shirt_desc)}
    EditPlayerAppearance profile = <currentSkaterProfileIndex> target = setpart targetParams = {part = bare_torso desc_id = None}
    RefreshSkaterModel skater = 0 profile = <currentSkaterProfileIndex> no_board = 0
    change \{ cas_temp_shirt_desc = 0 }
    cas_store_exit_continue
endscript
edit_skater_clothing_options = [
    {
        group_title = 'UBRANIE'
        text = "Koszula"
        vo_text = 'shirt_'
        submenu = shirt_style_menu
        cam_anim_sub = Torso
    }
    {
        text = "Kolor koszuli 1"
        submenu = shirt_color_menu
        is_enabled_script = check_if_part_colorable
        is_enabled_params = {
            parts = [ skater_m_torso skater_f_torso ]
        }
        modifier
        part_parent = "Koszula"
    }
    {
        text = "Kolor koszuli 2"
        submenu = sleeve_color_menu
        is_enabled_script = check_if_sleeve_colorable
        is_enabled_params = {
            parts = [ skater_m_torso skater_f_torso ]
        }
        modifier
        part_parent = "Koszula"
    }
    {
        text = "Logo z przodu"
        submenu = front_logo_menu
        is_enabled_script = check_if_part_logoable
        is_enabled_params = {
            parts = [ skater_m_torso skater_f_torso ]
        }
        cam_angle = 0
        cam_anim_sub = Torso
        list
        modifier
        part_parent = "Koszula"
    }
    {
        text = "Dost. P. logo"
        submenu = front_logo_pos_menu
        is_enabled_script = check_if_part_logoable
        is_enabled_params = {
            parts = [ skater_m_torso skater_f_torso ]
            extra_script = check_if_part_editable
            extra_script_params = { part = front_logo }
        }
        cam_angle = 0
        modifier
        part_parent = "Koszula"
    }
    {
        text = "Logo z ty³u"
        submenu = back_logo_menu
        is_enabled_script = check_if_part_back_logoable
        is_enabled_params = {
            parts = [ skater_m_torso skater_f_torso ]
        }
        cam_angle = 180
        cam_anim_sub = Torso
        list
        modifier
        part_parent = "Koszula"
    }
    {
        text = "Dos. T. logo"
        submenu = back_logo_pos_menu
        is_enabled_script = check_if_part_back_logoable
        is_enabled_params = {
            parts = [ skater_m_torso skater_f_torso ]
            extra_script = check_if_part_editable
            extra_script_params = { part = back_logo }
        }
        cam_angle = 180
        modifier
        part_parent = "Koszula"
    }
    {
        text = "Koszule z Beverly"
        submenu = shirt_style_menu
        cam_anim_sub = Torso
        store_flag = z_bh_clothingshop
        cas_pak = 'pak/z_bh_clothingshop_data/z_bh_clothingshop_data.pak'
        is_visible_script = cas_in_ho_and_unlocked_bh
    }
    {
        text = "Kolor koszuli 1"
        submenu = shirt_color_menu
        is_enabled_script = check_if_part_colorable
        is_enabled_params = {
            parts = [ skater_m_torso skater_f_torso ]
        }
        modifier
        part_parent = "Koszule z Beverly"
    }
    {
        text = "Kolor koszuli 2"
        submenu = sleeve_color_menu
        is_enabled_script = check_if_sleeve_colorable
        is_enabled_params = {
            parts = [ skater_m_torso skater_f_torso ]
        }
        modifier
        part_parent = "Koszule z Beverly"
    }
    {
        text = "Logo z przodu"
        submenu = front_logo_menu
        is_enabled_script = check_if_part_logoable
        is_enabled_params = {
            parts = [ skater_m_torso skater_f_torso ]
        }
        cam_angle = 0
        cam_anim_sub = Torso
        list
        modifier
        part_parent = "Koszule z Beverly"
    }
    {
        text = "Logo Adj F"
        submenu = front_logo_pos_menu
        is_enabled_script = check_if_part_logoable
        is_enabled_params = {
            parts = [ skater_m_torso skater_f_torso ]
            extra_script = check_if_part_editable
            extra_script_params = { part = front_logo }
        }
        cam_angle = 0
        modifier
        part_parent = "Koszule z Beverly"
    }
    {
        text = "Logo z ty³u"
        submenu = back_logo_menu
        is_enabled_script = check_if_part_back_logoable
        is_enabled_params = {
            parts = [ skater_m_torso skater_f_torso ]
        }
        cam_angle = 180
        cam_anim_sub = Torso
        list
        modifier
        part_parent = "Koszule z Beverly"
    }
    {
        text = "Logo Adj B "
        submenu = back_logo_pos_menu
        is_enabled_script = check_if_part_back_logoable
        is_enabled_params = {
            parts = [ skater_m_torso skater_f_torso ]
            extra_script = check_if_part_editable
            extra_script_params = { part = back_logo }
        }
        cam_angle = 180
        modifier
        part_parent = "Koszule z Beverly"
    }
    {
        text = "Koszule ze wschodniego LA"
        submenu = shirt_style_menu
        cam_anim_sub = Torso
        store_flag = z_el_clothingshop
        cas_pak = 'pak/z_el_clothingshop_data/z_el_clothingshop_data.pak'
        is_visible_script = cas_in_ho_and_unlocked_el
    }
    {
        text = "Kolor koszuli 1"
        submenu = shirt_color_menu
        is_enabled_script = check_if_part_colorable
        is_enabled_params = {
            parts = [ skater_m_torso skater_f_torso ]
        }
        modifier
        part_parent = "Koszule ze wschodniego LA"
    }
    {
        text = "Kolor koszuli 2"
        submenu = sleeve_color_menu
        is_enabled_script = check_if_sleeve_colorable
        is_enabled_params = {
            parts = [ skater_m_torso skater_f_torso ]
        }
        modifier
        part_parent = "Koszule ze wschodniego LA"
    }
    {
        text = "Logo z przodu"
        submenu = front_logo_menu
        is_enabled_script = check_if_part_logoable
        is_enabled_params = {
            parts = [ skater_m_torso skater_f_torso ]
        }
        cam_angle = 0
        cam_anim_sub = Torso
        list
        modifier
        part_parent = "Koszule ze wschodniego LA"
    }
    {
        text = "Logo Adj F"
        submenu = front_logo_pos_menu
        is_enabled_script = check_if_part_logoable
        is_enabled_params = {
            parts = [ skater_m_torso skater_f_torso ]
            extra_script = check_if_part_editable
            extra_script_params = { part = front_logo }
        }
        cam_angle = 0
        modifier
        part_parent = "Koszule ze wschodniego LA"
    }
    {
        text = "Logo z ty³u"
        submenu = back_logo_menu
        is_enabled_script = check_if_part_back_logoable
        is_enabled_params = {
            parts = [ skater_m_torso skater_f_torso ]
        }
        cam_angle = 180
        cam_anim_sub = Torso
        list
        modifier
        part_parent = "Koszule ze wschodniego LA"
    }
    {
        text = "Logo Adj B "
        submenu = back_logo_pos_menu
        is_enabled_script = check_if_part_back_logoable
        is_enabled_params = {
            parts = [ skater_m_torso skater_f_torso ]
            extra_script = check_if_part_editable
            extra_script_params = { part = back_logo }
        }
        cam_angle = 180
        modifier
        part_parent = "Koszule ze wschodniego LA"
    }
    { text = "Majtki" vo_text = 'pants_' submenu = pants_menu cam_anim_sub = Legs }
    {
        text = "Kolor Majtek"
        submenu = pants_color_menu
        is_enabled_script = check_if_part_colorable
        is_enabled_params = {
            parts = [ skater_m_legs skater_f_legs ]
        }
        group = legs_items
        modifier
        part_parent = "Majtki"
    }
]

script cas_in_ho_and_unlocked_bh 
    GetLevelStructureName
    if NOT ((<level_structure_name>.level)= 'Z_HO')
        printf \{ 'not in z_ho!' }
        return \{ is_enabled = 0 }
    endif
    if NOT GetFlag \{ level = z_bh flag = LEVEL_UNLOCKED_STORY }
        printf \{ 'z_bh not unlocked!!' }
        return \{ is_enabled = 0 }
    endif
    return \{ is_enabled = 1 }
endscript

script cas_in_ho_and_unlocked_el 
    GetLevelStructureName
    if NOT ((<level_structure_name>.level)= 'Z_HO')
        printf \{ 'not in z_ho!' }
        return \{ is_enabled = 0 }
    endif
    if NOT GetFlag \{ level = z_el flag = LEVEL_UNLOCKED_STORY }
        printf \{ 'z_el not unlocked!!' }
        return \{ is_enabled = 0 }
    endif
    return \{ is_enabled = 1 }
endscript
edit_skater_skateshop_options = [
    {
        group_title = 'SKATESHOP'
        text = "Grafika na decku"
        vo_text = 'deckgraphic_'
        submenu = deck_graphic_menu
        cam_anim_sub = Deck
        deck_bottom
    }
    {
        text = "Tama ochronna"
        vo_text = 'griptape_'
        submenu = grip_tape_style_menu
        cam_anim_sub = Deck
        deck_top
    }
    {
        text = "Kolor kó³ek"
        submenu = wheel_color_menu
        cam_anim = FullBody
        cam_anim_sub = Deck
        use_cam_anim_for_back = 1
        deck_bottom
    }
    {
        text = "Na³okietniki"
        vo_text = 'elbowpads_'
        submenu = elbowpads_menu
        is_enabled_script = check_for_lockout_parts
        is_enabled_params = {
            parts = [ skater_m_torso skater_f_torso ]
            menu_parts = [ elbowpads ]
        }
        cam_anim_sub = Torso
    }
    {
        text = "Kolor ochraniaczy ³okci"
        submenu = elbowpads_color_menu
        is_enabled_script = check_if_part_colorable
        is_enabled_params = {
            parts = [ elbowpads ]
        }
        modifier
        part_parent = "Na³okietniki"
    }
    {
        text = "Ochraniacze kolan"
        vo_text = 'kneepads_'
        submenu = kneepads_menu
        is_enabled_script = check_for_lockout_parts
        is_enabled_params = {
            parts = [ skater_m_legs skater_f_legs ]
            menu_parts = [ kneepads ]
        }
        cam_anim_sub = Legs
    }
    {
        text = "Kolor ochraniaczy kolan"
        submenu = kneepads_color_menu
        is_enabled_script = check_if_part_colorable
        is_enabled_params = {
            parts = [ kneepads ]
        }
        cam_anim_sub = Legs
        modifier
        part_parent = "Ochraniacze kolan"
    }
    {
        text = "Buty"
        vo_text = 'shoes_'
        submenu = shoes_menu
        is_enabled_script = check_for_lockout_parts
        is_enabled_params = {
            parts = [ skater_m_legs skater_f_legs shoes ]
            menu_parts = [ shoes ]
        }
        cam_anim_sub = feet
    }
    {
        text = "Kolor butów"
        submenu = shoe_color_menu
        is_enabled_script = check_if_part_colorable
        is_enabled_params = {
            parts = [ shoes ]
        }
        cam_anim_sub = feet
        modifier
        part_parent = "Buty"
    }
    {
        text = "Kolor sznurówek"
        submenu = shoe_laces_color_menu
        is_enabled_script = check_if_sleeve_colorable
        is_enabled_params = {
            parts = [ shoes ]
        }
        cam_anim_sub = feet
        modifier
        part_parent = "Buty"
    }
    {
        text = "Skarpetki"
        vo_text = 'socks_'
        submenu = socks_menu
        cam_anim_sub = feet
        is_visible_script = currently_editing_male
    }
    {
        text = "Kolor skarpetek"
        submenu = socks_color_menu
        is_enabled_script = check_if_part_colorable
        is_enabled_params = {
            parts = [ socks ]
        }
        cam_anim_sub = feet
        modifier
        part_parent = "Skarpetki"
    }
]

script inverse_check_for_lockout_parts 
    check_for_lockout_parts <...> 
    if (<is_enabled> = 0)
        return \{ is_enabled = 1 }
    else
        return \{ is_enabled = 0 }
    endif
endscript
edit_skater_tattoo_options = [
    {
        group_title = "GABINET TATUA¯U"
        text = "Zdejmij koszulê"
        vo_text = 'tattoo_'
        submenu = remove_shirt_option
        is_visible_script = inverse_check_for_lockout_parts
        is_visible_params = {
            parts = [ skater_m_torso skater_f_torso ]
            menu_parts = [ chest_tattoo ]
        }
        cam_anim_sub = Torso
        cam_angle = 0
    }
    {
        text = "Tatua¿ na klacie"
        short_text = "Wybierz tatua¿"
        submenu = chest_tattoo_menu
        is_enabled_script = check_for_lockout_parts
        is_enabled_params = {
            parts = [ skater_m_torso skater_f_torso ]
            menu_parts = [ chest_tattoo ]
        }
        cam_anim_sub = Torso
        cam_angle = 0
    }
    {
        text = "Tatua¿ na plecach"
        vo_text = 'tattoo_'
        short_text = "Wybierz tatua¿"
        submenu = back_tattoo_menu
        is_enabled_script = check_for_lockout_parts
        is_enabled_params = {
            parts = [ skater_m_torso skater_f_torso ]
            menu_parts = [ back_tattoo ]
        }
        cam_anim_sub = Torso
        cam_angle = 180
    }
    {
        text = "Tatua¿ na g³owie"
        vo_text = 'tattoo_'
        short_text = "Wybierz tatua¿"
        submenu = head_tattoo_menu
        is_enabled_script = check_for_lockout_parts
        is_enabled_params = {
            parts = [
                skater_m_head
                skater_f_head
                Hat
                skater_m_hair
                skater_f_hair
            ]
            menu_parts = [ head_tattoo ]
        }
        cam_anim_sub = HeadTop
        cam_angle = 180
    }
    {
        text = "Tatua¿ L rêkawa"
        vo_text = 'tattoo_'
        short_text = "Wybierz tatua¿"
        submenu = left_sleeve_tattoo_menu
        is_enabled_script = check_for_lockout_parts
        is_enabled_params = {
            parts = [ skater_m_torso skater_f_torso ]
            menu_parts = [ left_sleeve_tattoo ]
        }
    }
    {
        text = "Tatua¿ L rêki 1"
        vo_text = 'tattoo_'
        short_text = "Wybierz tatua¿"
        submenu = left_bicep_tattoo_menu
        is_enabled_script = check_for_lockout_parts
        is_enabled_params = {
            parts = [ skater_m_torso skater_f_torso ]
            menu_parts = [ left_bicep_tattoo ]
        }
    }
    {
        text = "Lewe ramiê, tatua¿ 2"
        vo_text = 'tattoo_'
        short_text = "Wybierz tatua¿"
        submenu = left_forearm_tattoo_menu
        is_enabled_script = check_for_lockout_parts
        is_enabled_params = {
            parts = [ skater_m_torso skater_f_torso ]
            menu_parts = [ left_forearm_tattoo ]
        }
    }
    {
        text = "Tatua¿ P rêkawa"
        vo_text = 'tattoo_'
        short_text = "Wybierz tatua¿"
        submenu = right_sleeve_tattoo_menu
        is_enabled_script = check_for_lockout_parts
        is_enabled_params = {
            parts = [ skater_m_torso skater_f_torso ]
            menu_parts = [ right_sleeve_tattoo ]
        }
    }
    {
        text = "Tatua¿ prawe ramiê"
        vo_text = 'tattoo_'
        short_text = "Wybierz tatua¿"
        submenu = right_bicep_tattoo_menu
        is_enabled_script = check_for_lockout_parts
        is_enabled_params = {
            parts = [ skater_m_torso skater_f_torso ]
            menu_parts = [ right_bicep_tattoo ]
        }
    }
    {
        text = "Tatua¿ P rêki 2"
        vo_text = 'tattoo_'
        short_text = "Wybierz tatua¿"
        submenu = right_forearm_tattoo_menu
        is_enabled_script = check_for_lockout_parts
        is_enabled_params = {
            parts = [ skater_m_torso skater_f_torso ]
            menu_parts = [ right_forearm_tattoo ]
        }
    }
    {
        text = "Tatua¿ lewa noga"
        vo_text = 'tattoo_'
        short_text = "Wybierz tatua¿"
        submenu = left_leg_tattoo_menu
        is_enabled_script = check_for_lockout_parts
        is_enabled_params = {
            parts = [ skater_m_legs skater_f_legs ]
            menu_parts = [ left_leg_tattoo ]
        }
        cam_anim_sub = legtattoo
    }
    {
        text = "Tatua¿ P nogi"
        vo_text = 'tattoo_'
        short_text = "Wybierz tatua¿"
        submenu = right_leg_tattoo_menu
        is_enabled_script = check_for_lockout_parts
        is_enabled_params = {
            parts = [ skater_m_legs skater_f_legs ]
            menu_parts = [ right_leg_tattoo ]
        }
        cam_anim_sub = legtattoo
    }
]
edit_skater_accessory_options = [
    {
        group_title = "SKLEP Z DODATKAMI"
        vo_text = 'laccessory_'
        text = "Lewy dodatek"
        short_text = "Wybierz dodatek"
        submenu = accessory1_menu
        is_enabled_script = check_for_lockout_parts
        is_enabled_params = {
            parts = [ skater_m_torso skater_f_torso ]
            menu_parts = [ accessory1 ]
        }
        cam_anim_sub = Accessory
    }
    {
        text = "Kolor dodatku"
        submenu = accessory1_color_menu
        is_enabled_script = check_if_part_colorable
        is_enabled_params = {
            parts = [ accessory1 ]
        }
        cam_anim_sub = Accessory
        modifier
        part_parent = "Lewy dodatek"
    }
    {
        text = "Prawe dodatki"
        vo_text = 'raccessory_'
        short_text = "Wybierz dodatek"
        submenu = accessory2_menu
        is_enabled_script = check_for_lockout_parts
        is_enabled_params = {
            parts = [ skater_m_torso skater_f_torso ]
            menu_parts = [ accessory2 ]
        }
        cam_anim_sub = Accessory
    }
    {
        text = "Kolor dodatku"
        submenu = accessory2_color_menu
        is_enabled_script = check_if_part_colorable
        is_enabled_params = {
            parts = [ accessory2 ]
        }
        cam_anim_sub = Accessory
        modifier
        part_parent = "Prawe dodatki"
    }
    {
        text = "Rêkawice"
        vo_text = 'gloves_'
        submenu = hands_menu
        is_enabled_script = check_for_lockout_parts
        is_enabled_params = {
            parts = [ skater_m_torso skater_f_torso ]
            menu_parts = [ skater_m_hands skater_f_hands ]
        }
        cam_anim_sub = Accessory
    }
    {
        text = "Kolor rêkawic"
        submenu = hands_color_menu
        is_enabled_script = check_if_part_colorable
        is_enabled_params = {
            parts = [ skater_m_hands skater_f_hands ]
        }
        cam_anim_sub = Accessory
        modifier
        part_parent = "Rêkawice"
    }
    {
        text = "Plecak"
        vo_text = 'backpack_'
        submenu = backpack_menu
        is_enabled_script = check_for_lockout_parts
        is_enabled_params = {
            parts = [ skater_m_torso skater_f_torso ]
            menu_parts = [ skater_m_backpack skater_f_backpack ]
        }
        cam_anim_sub = Torso
    }
    {
        text = "Kolor plecak"
        submenu = pack_color_menu
        is_enabled_script = check_if_part_colorable
        is_enabled_params = {
            parts = [ skater_m_backpack skater_f_backpack ]
        }
        modifier
        part_parent = "Plecak"
        cam_anim_sub = Torso
    }
    {
        text = "Czapki"
        vo_text = 'hats_'
        submenu = hats_menu
        is_enabled_script = check_for_lockout_parts
        is_enabled_params = {
            parts = [ skater_m_head skater_f_head ]
            menu_parts = [ Hat ]
        }
        cam_anim_sub = Head
    }
    {
        text = "Kolor czapki"
        submenu = hat_color_menu
        is_enabled_script = check_if_part_colorable
        is_enabled_params = {
            parts = [ Hat ]
        }
        modifier
        part_parent = "Czapki"
    }
    {
        text = "Logo na kapeluszu"
        submenu = hat_logo_menu
        is_enabled_script = check_if_part_logoable
        is_enabled_params = {
            parts = [ Hat ]
        }
        list
        modifier
        part_parent = "Czapki"
    }
    {
        text = "Okulary"
        vo_text = 'glasses_'
        submenu = glasses_menu
        is_enabled_script = check_for_lockout_parts
        is_enabled_params = {
            parts = [ skater_m_head skater_f_head Hat ]
            menu_parts = [ glasses ]
        }
        cam_angle = 0
        cam_anim_sub = Head
    }
    {
        text = "Kolor okularów"
        submenu = glasses_color_menu
        is_enabled_script = check_if_part_colorable
        is_enabled_params = {
            parts = [ glasses ]
        }
        cam_angle = 0
        modifier
        part_parent = "Okulary"
    }
]
edit_skater_barbershop_options = [
    {
        group_title = 'FRYZJER'
        text = "Zdejmij kapelusz"
        submenu = remove_hat_option
        is_visible_script = inverse_check_for_lockout_parts
        is_visible_params = {
            parts = [ skater_m_head skater_f_head Hat ]
            menu_parts = [ skater_m_hair skater_f_hair ]
        }
    }
    {
        text = "W³osy"
        vo_text = 'hair_'
        submenu = hair_menu
        is_visible_script = check_for_lockout_parts
        is_visible_params = {
            parts = [ skater_m_head skater_f_head Hat ]
            menu_parts = [ skater_m_hair skater_f_hair ]
        }
    }
    {
        text = "Kolor w³osów"
        submenu = hair_color_menu
        is_enabled_script = check_if_part_colorable
        is_enabled_params = {
            parts = [ skater_m_hair skater_f_hair ]
            extra_script = check_if_parts_editable
            extra_script_params = {
                parts = [ skater_m_hair skater_f_hair ]
            }
        }
        modifier
        part_parent = "W³osy"
    }
    {
        text = "W³ochaty kapelusz"
        vo_text = 'hair_'
        submenu = hat_hair_menu
        is_visible_script = check_if_part_editable
        is_visible_params = {
            part = Hat
            extra_script = check_for_lockout_parts
            extra_script_params = {
                parts = [ Hat skater_m_head skater_f_head ]
                menu_parts = [ skater_m_hat_hair skater_f_hat_hair ]
            }
        }
        list
    }
    {
        text = "Kolor w³osów pod czapk¹"
        submenu = hat_hair_color_menu
        is_enabled_script = check_if_part_colorable
        is_enabled_params = {
            parts = [ skater_m_hat_hair skater_f_hat_hair ]
            extra_script = check_for_lockout_parts
            extra_script_params = {
                parts = [ Hat skater_m_head skater_f_head ]
                menu_parts = [ skater_m_hat_hair skater_f_hat_hair ]
            }
        }
        modifier
        part_parent = "W³ochaty kapelusz"
    }
    {
        text = "Zarost"
        vo_text = 'facialhair_'
        submenu = jaw_menu
        is_visible_script = currently_editing_male
        is_enabled_script = check_for_lockout_parts
        is_enabled_params = {
            parts = [ skater_m_head Hat ]
            menu_parts = [ skater_m_jaw ]
        }
        cam_angle = 0
        list
    }
]
cas_bought_items_array = [
    { id = BuzzedHAT flag = 0 }
    { id = ShortHAT flag = 0 }
    { id = MedHAT01 flag = 0 }
    { id = LongHAT01 flag = 0 }
    { id = Hair_PonytailHAT01 flag = 0 }
    { id = Bald flag = 0 }
    { id = Hair_M_Buzzed01 flag = 0 }
    { id = Hair_M_Devillock01 flag = 0 }
    { id = Hair_M_Medium01 flag = 0 }
    { id = Hair_M_Mullet01 flag = 0 }
    { id = Hair_M_Mcsqueeb01 flag = 0 }
    { id = Hair_M_Mcsqueeb02 flag = 0 }
    { id = Hair_M_Mohawk01 flag = 0 }
    { id = Hair_M_Mohawk02 flag = 0 }
    { id = Hair_M_Mohawk03 flag = 0 }
    { id = Hair_M_Mohawk04 flag = 0 }
    { id = Hair_M_Spiked01 flag = 0 }
    { id = Hair_M_Spiked02 flag = 0 }
    { id = Hair_M_Spiked03 flag = 0 }
    { id = Hair_M_Long01 flag = 0 }
    { id = Hair_M_Ponytail01 flag = 0 }
    { id = Hair_M_Afro01 flag = 0 }
    { id = Hair_M_Dreads01 flag = 0 }
    { id = Hair_M_Pompadour01 flag = 0 }
    { id = Hair_M_Jarhead01 flag = 0 }
    { id = Hair_M_Pigtails flag = 0 }
    { id = Hair_M_Short02 flag = 0 }
    { id = Hair_M_Cornrows01 flag = 0 }
    { id = Hair_M_Medium02 flag = 0 }
    { id = Hair_M_Short01 flag = 0 }
    { id = #"Alien Costume" flag = 0 }
    { id = Shirtless flag = 1 }
    { id = Shirt_M_Tanktop01 flag = 0 }
    { id = Shirt_M_Sleeveless01 flag = 0 }
    { id = Shirt_M_Sleeveless02 flag = 0 }
    { id = Shirt_M_Tshirt01 flag = 0 }
    { id = Shirt_M_Tshirt02 flag = 0 }
    { id = Shirt_M_Tshirt03 flag = 0 }
    { id = Shirt_M_Polo01 flag = 0 }
    { id = Shirt_M_TshirtLS01 flag = 0 }
    { id = Shirt_M_TshirtLS05 flag = 0 }
    { id = Shirt_M_TshirtLS02 flag = 0 }
    { id = Shirt_M_TshirtLS03 flag = 0 }
    { id = Shirt_M_TshirtLS04 flag = 0 }
    { id = Shirt_M_Blazer01 flag = 0 }
    { id = Shirt_M_Blazer02 flag = 0 }
    { id = Shirt_M_Dress01 flag = 0 }
    { id = Shirt_M_Dress02 flag = 0 }
    { id = Shirt_M_Sweater01 flag = 0 }
    { id = Shirt_M_Hood01 flag = 0 }
    { id = Shirt_M_ZipHood01 flag = 0 }
    { id = Shirt_M_HoodUp01 flag = 0 }
    { id = Shirt_M_ZipHoodUp01 flag = 0 }
    { id = Shirt_M_Vest01 flag = 0 }
    { id = Shirt_M_Jacket01 flag = 0 }
    { id = Shirt_M_Jacket02 flag = 0 }
    { id = Shirt_M_Jacket03 flag = 0 }
    { id = Shirt_M_Jacket04 flag = 0 }
    { id = Shirt_M_Jacket05 flag = 0 }
    { id = Shirt_M_Tshirt34 flag = 0 }
    { id = Shirt_M_Polo09 flag = 0 }
    { id = Shirt_M_Panda01 flag = 0 }
    { id = Shirt_M_Robot01 flag = 0 }
    { id = Shirt_M_Polo02 flag = 0 }
    { id = Shirt_M_Polo03 flag = 0 }
    { id = Shirt_M_Hood10 flag = 0 }
    { id = Shirt_M_Jacket06 flag = 0 }
    { id = Shirt_M_Vest02 flag = 0 }
    { id = Shirt_M_Hood02 flag = 0 }
    { id = Shirt_M_SSKnit01 flag = 0 }
    { id = Shirt_M_TshirtLS06 flag = 0 }
    { id = Shirt_M_TshirtLS07 flag = 0 }
    { id = Shirt_M_Dress03 flag = 0 }
    { id = Shirt_M_Dress04 flag = 0 }
    { id = Shirt_M_Jacket07 flag = 0 }
    { id = Shirt_M_Hood03 flag = 0 }
    { id = Shirt_M_Hood04 flag = 0 }
    { id = Shirt_M_Hood05 flag = 0 }
    { id = Shirt_M_Jacket08 flag = 0 }
    { id = Shirt_M_Polo04 flag = 0 }
    { id = Shirt_M_Tshirt04 flag = 0 }
    { id = Shirt_M_Tshirt05 flag = 0 }
    { id = Shirt_M_Tshirt06 flag = 0 }
    { id = Shirt_M_Tshirt07 flag = 0 }
    { id = Shirt_M_Tshirt08 flag = 0 }
    { id = Shirt_M_Hood06 flag = 0 }
    { id = Shirt_M_Jacket09 flag = 0 }
    { id = Shirt_M_Tshirt09 flag = 0 }
    { id = Shirt_M_Tshirt10 flag = 0 }
    { id = Shirt_M_Tshirt11 flag = 0 }
    { id = Shirt_M_Hood07 flag = 0 }
    { id = Shirt_M_Hood08 flag = 0 }
    { id = Shirt_M_Tshirt12 flag = 0 }
    { id = Shirt_M_Tshirt13 flag = 0 }
    { id = Shirt_M_Tshirt14 flag = 0 }
    { id = Shirt_M_Hood09 flag = 0 }
    { id = Shirt_M_Hood11 flag = 0 }
    { id = Shirt_M_Jacket10 flag = 0 }
    { id = Shirt_M_TshirtLS08 flag = 0 }
    { id = Shirt_M_Hood12 flag = 0 }
    { id = Shirt_M_Tshirt15 flag = 0 }
    { id = Shirt_M_Tshirt16 flag = 0 }
    { id = Shirt_M_Tshirt17 flag = 0 }
    { id = Shirt_M_Tshirt18 flag = 0 }
    { id = Shirt_M_Tshirt19 flag = 0 }
    { id = Shirt_M_Tshirt20 flag = 0 }
    { id = Shirt_M_Tshirt21 flag = 0 }
    { id = Shirt_M_Tshirt22 flag = 0 }
    { id = Shirt_M_Tshirt23 flag = 0 }
    { id = Shirt_M_Polo06 flag = 0 }
    { id = Shirt_M_Tshirt24 flag = 0 }
    { id = Shirt_M_Tshirt25 flag = 0 }
    { id = Shirt_M_Tshirt26 flag = 0 }
    { id = Shirt_M_Hood13 flag = 0 }
    { id = Shirt_M_Tshirt27 flag = 0 }
    { id = Shirt_M_Tshirt28 flag = 0 }
    { id = Shirt_M_Tshirt29 flag = 0 }
    { id = Shirt_M_Hood14 flag = 0 }
    { id = Shirt_M_Tanktop02 flag = 0 }
    { id = Shirt_M_Tshirt30 flag = 0 }
    { id = Shirt_M_Polo07 flag = 0 }
    { id = Shirt_M_Sweater02 flag = 0 }
    { id = Shirt_M_Hood15 flag = 0 }
    { id = Shirt_M_Polo08 flag = 0 }
    { id = Shirt_M_TshirtLS09 flag = 0 }
    { id = Shirt_M_Tshirt31 flag = 0 }
    { id = Shirt_M_Tshirt32 flag = 0 }
    { id = Shirt_M_Tshirt33 flag = 0 }
    { id = Shirt_M_Tanktop03 flag = 0 }
    { id = Shirt_M_Tanktop04 flag = 0 }
    { id = Shirt_M_AmJam01 flag = 0 }
    { id = Shirt_M_Tshirt34 flag = 0 }
    { id = Shirt_M_Tshirt35 flag = 0 }
    { id = Pants_M_Jeans01 flag = 0 }
    { id = Pants_M_Jeans03 flag = 0 }
    { id = Pants_M_Jeans02 flag = 0 }
    { id = Pants_M_Khaki01 flag = 0 }
    { id = Pants_M_Khaki02 flag = 0 }
    { id = Pants_M_Plaid01 flag = 0 }
    { id = Pants_M_Cargo01 flag = 0 }
    { id = Pants_M_Leather01 flag = 0 }
    { id = Shorts_M_Plaid01 flag = 0 }
    { id = Shorts_M_Surfer01 flag = 0 }
    { id = Shorts_M_Short01 flag = 0 }
    { id = Shorts_M_Cargo01 flag = 0 }
    { id = Shorts_M_Cargo02 flag = 0 }
    { id = Shorts_M_Cargo03 flag = 0 }
    { id = Pants_M_Jeans04 flag = 0 }
    { id = Pants_M_Jeans05 flag = 0 }
    { id = Pants_M_Jeans06 flag = 0 }
    { id = Pants_M_Jeans07 flag = 0 }
    { id = Pants_M_Jeans08 flag = 0 }
    { id = Pants_M_Jeans09 flag = 0 }
    { id = Acc_Backpack01 flag = 0 }
    { id = Acc_Backpack02 flag = 0 }
    { id = Acc_Backpack03 flag = 0 }
    { id = Acc_Backpack04 flag = 0 }
    { id = Body_M_Glove01 flag = 0 }
    { id = Body_M_Glove02 flag = 0 }
    { id = Specs_Aviator flag = 0 }
    { id = Specs_Electric01 flag = 0 }
    { id = Specs_Arnette01 flag = 0 }
    { id = Specs_Arnette02 flag = 0 }
    { id = Specs_Arnette03 flag = 0 }
    { id = Specs_Arnette04 flag = 0 }
    { id = Specs_VZ01 flag = 0 }
    { id = Specs_VZ02 flag = 0 }
    { id = Specs_VZ03 flag = 0 }
    { id = Specs_VZ04 flag = 0 }
    { id = Hat_Sportscap01 flag = 0 }
    { id = Hat_Sportscap02 flag = 0 }
    { id = Hat_Sportscap03 flag = 0 }
    { id = Hat_Sportscap04 flag = 0 }
    { id = Hat_Trucker01 flag = 0 }
    { id = Hat_Trucker02 flag = 0 }
    { id = Hat_Beanie01 flag = 0 }
    { id = Hat_Beanie02 flag = 0 }
    { id = Hat_Beret01 flag = 0 }
    { id = Hat_Headband01 flag = 0 }
    { id = Hat_Bandana01 flag = 0 }
    { id = Hat_Bandana02 flag = 0 }
    { id = Hat_Beanie06 flag = 0 }
    { id = Hat_Visor01 flag = 0 }
    { id = Hat_Headphones01 flag = 0 }
    { id = Hat_Beret02 flag = 0 }
    { id = Hat_Dunce01 flag = 0 }
    { id = Hat_Pirate01 flag = 0 }
    { id = Hat_Robin01 flag = 0 }
    { id = Hat_Sun01 flag = 0 }
    { id = Hat_Sombrero01 flag = 0 }
    { id = Hat_TopHat01 flag = 0 }
    { id = Hat_TopHat02 flag = 0 }
    { id = Hat_Turban01 flag = 0 }
    { id = Hat_Paperbag01 flag = 0 }
    { id = Hat_Sportscap05 flag = 0 }
    { id = Hat_Sportscap06 flag = 0 }
    { id = Hat_Beanie03 flag = 0 }
    { id = Hat_Fedora01 flag = 0 }
    { id = Hat_Headband02 flag = 0 }
    { id = Hat_Sportscap07 flag = 0 }
    { id = Hat_Sportscap08 flag = 0 }
    { id = Hat_Trucker04 flag = 0 }
    { id = Hat_Sportscap09 flag = 0 }
    { id = Hat_Sportscap10 flag = 0 }
    { id = Helmet_Hassan flag = 0 }
    { id = Helmet_Lasek flag = 0 }
    { id = Helmet_Caballero flag = 0 }
    { id = Hat_Military01 flag = 0 }
    { id = Hat_Military02 flag = 0 }
    { id = Hat_Beanie04 flag = 0 }
    { id = Hat_Sportscap11 flag = 0 }
    { id = Hat_Sportscap12 flag = 0 }
    { id = Hat_Sportscap13c flag = 0 }
    { id = Hat_Sportscap14 flag = 0 }
    { id = Hat_Sportscap15 flag = 0 }
    { id = Hat_Sportscap16 flag = 0 }
    { id = Hat_Sportscap17 flag = 0 }
    { id = Hat_Sportscap18 flag = 0 }
    { id = Hat_Sportscap19 flag = 0 }
    { id = Hat_Sportscap20 flag = 0 }
    { id = Hat_Trucker05 flag = 0 }
    { id = Hat_Sportscap21 flag = 0 }
    { id = Hat_Sportscap22 flag = 0 }
    { id = Hat_Trucker06 flag = 0 }
    { id = Hat_Sportscap23 flag = 0 }
    { id = Hat_Headband03 flag = 0 }
    { id = Hat_Beanie05 flag = 0 }
    { id = Hat_Trucker07 flag = 0 }
    { id = Hat_Trucker08 flag = 0 }
    { id = Acc_Wristband_L flag = 0 }
    { id = Acc_Watch01_L flag = 0 }
    { id = Acc_Wristband02_L flag = 0 }
    { id = Acc_Wristband03_L flag = 0 }
    { id = Acc_Watch02_L flag = 0 }
    { id = Acc_Watch03_L flag = 0 }
    { id = Acc_Watch04_L flag = 0 }
    { id = Acc_Watch05_L flag = 0 }
    { id = Acc_Wristband04_L flag = 0 }
    { id = Acc_Watch06_L flag = 0 }
    { id = Acc_Wristguard01_L flag = 0 }
    { id = Acc_Spiker01_L flag = 0 }
    { id = Acc_Ring01_L flag = 0 }
    { id = Acc_Ring02_L flag = 0 }
    { id = Acc_Wristband_R flag = 0 }
    { id = Acc_Wristband02_R flag = 0 }
    { id = Acc_Watch01_R flag = 0 }
    { id = Acc_Wristband03_R flag = 0 }
    { id = Acc_Watch02_R flag = 0 }
    { id = Acc_Watch03_R flag = 0 }
    { id = Acc_Watch04_R flag = 0 }
    { id = Acc_Watch05_R flag = 0 }
    { id = Acc_Wristband04_R flag = 0 }
    { id = Acc_Watch06_R flag = 0 }
    { id = Acc_Wristguard01_R flag = 0 }
    { id = Acc_Spiker01_R flag = 0 }
    { id = Acc_Ring01_R flag = 0 }
    { id = Acc_Ring02_R flag = 0 }
    { id = Acc_Parrot flag = 0 }
    { id = #"AL Deck 1" flag = 0 }
    { id = #"AL Deck 2" flag = 0 }
    { id = #"AL Deck 3" flag = 0 }
    { id = #"AL Deck 4" flag = 0 }
    { id = #"AL Deck 5" flag = 0 }
    { id = #"AL Deck 6" flag = 0 }
    { id = #"AV Deck 1" flag = 0 }
    { id = #"AV Deck 2" flag = 0 }
    { id = #"AV Deck 3" flag = 0 }
    { id = #"AV Deck 4" flag = 0 }
    { id = #"AV Deck 5" flag = 0 }
    { id = #"AV Deck 6" flag = 0 }
    { id = #"AV Deck 7" flag = 0 }
    { id = #"AV Deck 8" flag = 0 }
    { id = #"AV Deck 9" flag = 0 }
    { id = #"AV Deck 10" flag = 0 }
    { id = #"AH Deck 1" flag = 0 }
    { id = #"AH Deck 2" flag = 0 }
    { id = #"BA Deck 1" flag = 0 }
    { id = #"BA Deck 2" flag = 0 }
    { id = #"BA Deck 3" flag = 0 }
    { id = #"BH Deck 1" flag = 0 }
    { id = #"BH Deck 2" flag = 0 }
    { id = #"BH Deck 3" flag = 0 }
    { id = #"BH Deck 4" flag = 0 }
    { id = #"BH Deck 5" flag = 0 }
    { id = #"BH Deck 6" flag = 0 }
    { id = #"BH Deck 7" flag = 0 }
    { id = #"BH Deck 8" flag = 0 }
    { id = #"BH Deck 9" flag = 0 }
    { id = #"BH Deck 10" flag = 0 }
    { id = #"BH Deck 11" flag = 0 }
    { id = #"BL Deck 1" flag = 0 }
    { id = #"BL Deck 2" flag = 0 }
    { id = #"BL Deck 3" flag = 0 }
    { id = #"0x5B Deck 1" flag = 0 }
    { id = #"0x5B Deck 2" flag = 0 }
    { id = #"DG Deck 1" flag = 0 }
    { id = #"DG Deck 2" flag = 0 }
    { id = #"DG Deck 3" flag = 0 }
    { id = #"DG Deck 4" flag = 0 }
    { id = #"DG Deck 5" flag = 0 }
    { id = #"EL Deck 1" flag = 0 }
    { id = #"EL Deck 2" flag = 0 }
    { id = #"EL Deck 3" flag = 0 }
    { id = #"EL Deck 4" flag = 0 }
    { id = #"EL Deck 5" flag = 0 }
    { id = #"EL Deck 6" flag = 0 }
    { id = #"EL Deck 7" flag = 0 }
    { id = #"HU Deck 1" flag = 0 }
    { id = #"GR Deck 1" flag = 0 }
    { id = #"GR Deck 2" flag = 0 }
    { id = #"GR Deck 3" flag = 0 }
    { id = #"GR Deck 4" flag = 0 }
    { id = #"GR Deck 5" flag = 0 }
    { id = #"OS Deck 1" flag = 0 }
    { id = #"OS Deck 2" flag = 0 }
    { id = #"OS Deck 3" flag = 0 }
    { id = #"OS Deck 4" flag = 0 }
    { id = #"OS Deck 5" flag = 0 }
    { id = #"OS Deck 6" flag = 0 }
    { id = #"PB Deck 1" flag = 0 }
    { id = #"PB Deck 2" flag = 0 }
    { id = #"PB Deck 3" flag = 0 }
    { id = #"PB Deck 4" flag = 0 }
    { id = #"PB Deck 5" flag = 0 }
    { id = #"PO Deck 1" flag = 0 }
    { id = #"PO Deck 2" flag = 0 }
    { id = #"PO Deck 3" flag = 0 }
    { id = #"PO Deck 4" flag = 0 }
    { id = #"PO Deck 5" flag = 0 }
    { id = #"PO Deck 6" flag = 0 }
    { id = #"RDS Deck 1" flag = 0 }
    { id = #"RDS Deck 2" flag = 0 }
    { id = #"RDS Deck 3" flag = 0 }
    { id = #"RDS Deck 4" flag = 0 }
    { id = #"WO Deck 1" flag = 0 }
    { id = #"WO Deck 2" flag = 0 }
    { id = #"WO Deck 3" flag = 0 }
    { id = #"SH Deck 1" flag = 0 }
    { id = #"SH Deck 2" flag = 0 }
    { id = #"SH Deck 3" flag = 0 }
    { id = #"SH Deck 4" flag = 0 }
    { id = #"SH Deck 5" flag = 0 }
    { id = #"Fi Deck 1" flag = 0 }
    { id = #"Fi Deck 2" flag = 0 }
    { id = #"Do Deck 1" flag = 0 }
    { id = #"Me Deck 1" flag = 0 }
    { id = #"Jason Ellis" flag = 0 }
    { id = #"Generic 1" flag = 0 }
    { id = #"Generic 2" flag = 0 }
    { id = #"Generic 3" flag = 0 }
    { id = #"Generic 4" flag = 0 }
    { id = #"Generic 5" flag = 0 }
    { id = #"Generic 7" flag = 0 }
    { id = #"Generic 8" flag = 0 }
    { id = #"Generic 9" flag = 0 }
    { id = #"Generic 10" flag = 0 }
    { id = #"Generic 11" flag = 0 }
    { id = #"Generic 12" flag = 0 }
    { id = #"Generic 13" flag = 0 }
    { id = #"Generic 14" flag = 0 }
    { id = #"Generic 15" flag = 0 }
    { id = #"Generic 16" flag = 0 }
    { id = #"Generic 17" flag = 0 }
    { id = #"Generic 18" flag = 0 }
    { id = #"Hawk 1" flag = 0 }
    { id = #"Koston 1" flag = 0 }
    { id = #"Mullen 1" flag = 0 }
    { id = #"Muska 1" flag = 0 }
    { id = #"Sheckler 1" flag = 0 }
    { id = #"Ellis 1" flag = 0 }
    { id = #"Elbow Pads" flag = 0 }
    { id = #"Left Elbow Pad" flag = 0 }
    { id = #"Right Elbow Pad" flag = 0 }
    { id = #"Elbow Pads Big" flag = 0 }
    { id = #"Left Elbow Pad Big" flag = 0 }
    { id = #"Right Elbow Pad Big" flag = 0 }
    { id = #"Knee Pads" flag = 0 }
    { id = #"Knee Pads Big" flag = 0 }
    { id = Socks_M_High01 flag = 0 }
    { id = Socks_M_Mid01 flag = 0 }
    { id = Socks_M_Low01 flag = 0 }
    { id = #"Bare Feet" flag = 1 }
    { id = Shoes_Skate01 flag = 0 }
    { id = Shoes_Boots01 flag = 0 }
    { id = Shoes_HiTops02 flag = 0 }
    { id = Shoes_Hurley01 flag = 0 }
    { id = Shoes_Hurley02 flag = 0 }
    { id = Shoes_Hurley03 flag = 0 }
    { id = Shoes_DGK01 flag = 0 }
    { id = Shoes_DGK02 flag = 0 }
    { id = Shoes_DGK03 flag = 0 }
    { id = Shoes_Globe01 flag = 0 }
    { id = Shoes_Globe02 flag = 0 }
    { id = Shoes_Globe03 flag = 0 }
    { id = Shoes_DVS01 flag = 0 }
    { id = Shoes_DVS02 flag = 0 }
    { id = Shoes_DVS03 flag = 0 }
    { id = Shoes_DVS04 flag = 0 }
    { id = Shoes_Vans01 flag = 0 }
    { id = Shoes_Vans02 flag = 0 }
    { id = Shoes_Vans03 flag = 0 }
    { id = Shoes_Vans04 flag = 0 }
    { id = Shoes_Vans05 flag = 0 }
    { id = Shoes_Vans06 flag = 0 }
    { id = Shoes_Vans07 flag = 0 }
    { id = Shoes_ES01 flag = 0 }
    { id = Shoes_ES02 flag = 0 }
    { id = Shoes_ES03 flag = 0 }
    { id = Shoes_Emerica01 flag = 0 }
    { id = Shoes_Emerica02 flag = 0 }
    { id = Shoes_Emerica03 flag = 0 }
    { id = Shoes_Emerica04 flag = 0 }
    { id = Shoes_Etnies01 flag = 0 }
    { id = Shoes_Etnies02 flag = 0 }
    { id = Shoes_Etnies03 flag = 0 }
    { id = Shoes_Etnies04 flag = 0 }
    { id = Shoes_QS01 flag = 0 }
    { id = Shoes_QS02 flag = 0 }
    { id = Shoes_Adio01 flag = 0 }
    { id = Shoes_Adio02 flag = 0 }
    { id = Shoes_Adio03 flag = 0 }
    { id = Shoes_Adio04 flag = 0 }
    { id = Shoes_Adio05 flag = 0 }
    { id = Shoes_Nike01 flag = 0 }
    { id = Shoes_Nike02 flag = 0 }
    { id = Shoes_Nike03 flag = 0 }
    { id = Shoes_DC01 flag = 0 }
    { id = Shoes_DC02 flag = 0 }
    { id = Shoes_Element01 flag = 0 }
    { id = #"Sleeve 1" flag = 0 }
    { id = #"Sleeve 2" flag = 0 }
    { id = #"Sleeve 3" flag = 0 }
    { id = #"Sleeve 4" flag = 0 }
    { id = #"Sleeve 5" flag = 0 }
    { id = #"Sleeve 6" flag = 0 }
    { id = #"Sleeve 7" flag = 0 }
    { id = #"Sleeve 8" flag = 0 }
    { id = #"Sleeve 9" flag = 0 }
    { id = #"Sleeve 10" flag = 0 }
    { id = #"Sleeve 11" flag = 0 }
    { id = #"Sleeve 12" flag = 0 }
    { id = #"Sleeve 13" flag = 0 }
    { id = #"Sleeve 14" flag = 0 }
    { id = #"Sleeve 15" flag = 0 }
    { id = #"Sleeve 16" flag = 0 }
    { id = #"Sleeve 17" flag = 0 }
    { id = #"Sleeve 18" flag = 0 }
    { id = #"Sleeve 19" flag = 0 }
    { id = #"Sleeve 20" flag = 0 }
    { id = dots flag = 0 }
    { id = Hazard flag = 0 }
    { id = skull flag = 0 }
    { id = fist flag = 0 }
    { id = Fiery flag = 0 }
    { id = #"Pointy Eye" flag = 0 }
    { id = #"Red Curtain" flag = 0 }
    { id = Burst flag = 0 }
    { id = #"Old School" flag = 0 }
    { id = star flag = 0 }
    { id = #"Ancient Secret" flag = 0 }
    { id = #"Killer Butterfly" flag = 0 }
    { id = #"Western Badge" flag = 0 }
    { id = #"Long Life" flag = 0 }
    { id = #"Flaming Eyeball" flag = 0 }
    { id = #"Tribal Engine" flag = 0 }
    { id = D-Monster flag = 0 }
    { id = #"Shadow Devil" flag = 0 }
    { id = Barcode flag = 0 }
    { id = #"Ancient Animal" flag = 0 }
    { id = #"Hood Ornament" flag = 0 }
    { id = rock flag = 0 }
    { id = #"Scribble Skull" flag = 0 }
    { id = axe flag = 0 }
    { id = #"Lightning Devil" flag = 0 }
    { id = #"Guilt Ladle" flag = 0 }
    { id = #"Stencil Eagle" flag = 0 }
    { id = #"Devil Dude" flag = 0 }
    { id = Girlish flag = 0 }
    { id = #"Urban Skater" flag = 0 }
    { id = #"Moon Star" flag = 0 }
    { id = explode flag = 0 }
    { id = #"Underground 2" flag = 0 }
    { id = world flag = 0 }
    { id = #"War Tank" flag = 0 }
    { id = Hawk flag = 0 }
    { id = grafitti flag = 0 }
    { id = #"Blood Splat" flag = 0 }
    { id = #"Hot Chick" flag = 0 }
    { id = #"Eyeball in a Fan" flag = 0 }
    { id = #"In a Vice" flag = 0 }
    { id = Dragon flag = 0 }
    { id = #"German Bird" flag = 0 }
    { id = #"No Bull" flag = 0 }
    { id = #"Racing Chick" flag = 0 }
    { id = Speedway flag = 0 }
    { id = Tavern flag = 0 }
    { id = stripes flag = 0 }
    { id = stars flag = 0 }
    { id = Interesting flag = 0 }
    { id = Chinese flag = 0 }
    { id = #"thorn track" flag = 0 }
    { id = #"Fire 1" flag = 0 }
    { id = #"Fire 2" flag = 0 }
    { id = Gecko flag = 0 }
    { id = #"Fire Skull" flag = 0 }
    { id = Flamejob flag = 0 }
    { id = #"Tribal Band" flag = 0 }
    { id = Thorn flag = 0 }
    { id = #"Flaming Skull" flag = 0 }
    { id = Tiki flag = 0 }
    { id = #"Green Dragon" flag = 0 }
    { id = Diablo flag = 0 }
    { id = #"Skull Snake" flag = 0 }
    { id = ship flag = 0 }
    { id = #"Bold Star" flag = 0 }
    { id = Whale flag = 0 }
    { id = #"Death Skull" flag = 0 }
    { id = #"Tribal Mask" flag = 0 }
    { id = Rose flag = 0 }
    { id = #"Blue Skull" flag = 0 }
    { id = Grim flag = 0 }
    { id = #"Tribal Star" flag = 0 }
    { id = #"Cool Cat" flag = 0 }
    { id = eyeball flag = 0 }
    { id = engine flag = 0 }
    { id = Voodoo flag = 0 }
    { id = #"Tribal Disk" flag = 0 }
    { id = #"Red Devil Head" flag = 0 }
    { id = anchor flag = 0 }
    { id = Demon flag = 0 }
    { id = Hazardous flag = 0 }
    { id = #"Broken Heart" flag = 0 }
    { id = #"Tribal Staff" flag = 0 }
    { id = #"Tribal Sun" flag = 0 }
    { id = Spider flag = 0 }
    { id = #"Tribal Arrow" flag = 0 }
    { id = Swallow flag = 0 }
    { id = Samurai flag = 0 }
    { id = Tiger flag = 0 }
    { id = #"Bloody Knife" flag = 0 }
    { id = Belief flag = 0 }
    { id = #"Alien Text" flag = 0 }
    { id = #"Cow Skull Bullets" flag = 0 }
    { id = #"Web 1" flag = 0 }
    { id = #"Web 2" flag = 0 }
    { id = Poison flag = 0 }
    { id = music flag = 0 }
    { id = Girly flag = 0 }
    { id = #"Flame Crown" flag = 0 }
    { id = #"Dark Arts" flag = 0 }
    { id = Butterfly flag = 0 }
    { id = #"Bolt Skull" flag = 0 }
    { id = #"Winged Skull" flag = 0 }
    { id = #"Ying Yang" flag = 0 }
    { id = Race flag = 0 }
    { id = Pointy flag = 0 }
    { id = flame flag = 0 }
    { id = #"Maltese Ball" flag = 0 }
    { id = #"Lowbrow Star" flag = 0 }
    { id = #"Alien Design" flag = 0 }
    { id = #"Spade n Bones" flag = 0 }
    { id = #"Skull n Bones" flag = 0 }
    { id = #"Maltese Skull" flag = 0 }
    { id = #"Butterfly eye" flag = 0 }
    { id = #"Heart of Fire" flag = 0 }
    { id = #"Spade with Wings" flag = 0 }
    { id = #"Spiked Ribbon" flag = 0 }
    { id = #"Spiked Cross" flag = 0 }
    { id = #"Yield Arrow" flag = 0 }
    { id = splat flag = 0 }
    { id = #"Bloody Eyeball" flag = 0 }
    { id = #"Goth Heart" flag = 0 }
    { id = Tribal flag = 0 }
    { id = Skullsee flag = 0 }
    { id = Valentine flag = 0 }
    { id = #"Save me" flag = 0 }
    { id = winged flag = 0 }
    { id = leader flag = 0 }
    { id = Devilgeez flag = 0 }
]

script cas_store_dummy 
    return \{ is_enabled = 0 }
endscript

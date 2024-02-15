tod_manager_inactive = 0
tod_debug = 0
tod_manager_num_prefixes = 10
tod_manager_block_fakelight_updates = 0
tod_manager_system_main_params = {
    global_effects_state_id = tod_main_scene
    transition_length = 90000
    level_light_update_params = { parts = 8 wait_frames = 3 light_group = outdoor reset_light_group = indoor }
}
tod_manager_system_sky_params = {
    global_effects_state_id = tod_sky_scene
    sky
    transition_length = 90000
    level_light_update_params = { parts = 8 wait_frames = 3 light_group = outdoor reset_light_group = indoor }
}
tod_manager_system_main_cycle = { Morning = tod_manager_default_morning Afternoon = tod_manager_default_afternoon Evening = tod_manager_default_evening Night = tod_manager_default_night }
tod_manager_system_sky_cycle = { Morning = tod_manager_default_morning_sky Afternoon = tod_manager_default_afternoon_sky Evening = tod_manager_default_evening_sky Night = tod_manager_default_night_sky }
tod_manager_default_morning = {
    state_length = 90000
    lev_red = 64
    lev_green = 77
    lev_blue = 81
    fog_on = 1
    fog_red = 85
    fog_green = 100
    fog_blue = 105
    fog_alpha = 108
    fog_dist = 350
    fog_sky_red = 135
    fog_sky_green = 138
    fog_sky_blue = 110
    fog_sky_alpha = 68
    ambient_red = 53
    ambient_green = 54
    ambient_blue = 57
    ambient_mod_factor_lo = 0.2000
    ambient_mod_factor_hi = 0.0
    heading_0 = 44
    pitch_0 = 317
    red_0 = 16
    green_0 = 19
    blue_0 = 29
    mod_factor_0_lo = 0.1200
    mod_factor_0_hi = 0.0
    heading_1 = 0
    pitch_1 = 0
    red_1 = 34
    green_1 = 42
    blue_1 = 49
    mod_factor_1_lo = 0.1000
    mod_factor_1_hi = 0.0
    indoor = {
        ambient_red = 80
        ambient_green = 65
        ambient_blue = 55
        ambient_mod_factor_lo = 0.3000
        ambient_mod_factor_hi = 0.0
        heading_0 = 84.0
        pitch_0 = 285.0
        red_0 = 115
        green_0 = 110
        blue_0 = 145
        mod_factor_0_lo = 0.7500
        mod_factor_0_hi = 0.0
        heading_1 = 185.0
        pitch_1 = 30.0
        red_1 = 95
        green_1 = 80
        blue_1 = 80
        mod_factor_1_lo = 0.7500
        mod_factor_1_hi = 0.0
    }
    headlights_on = 0
    bloom_on = 1
    bloom_color = [ 120 100 120 ]
    bloom1 = 0
    bloom2 = 100
    bloom_strength = [ 48 64 76 ]
    dof_on = 0
}
tod_manager_default_morning_sky = {
    state_length = 110000
    sun_on = 1
    sun_theta = 20.0
    sun_phi = -10.0
    sun_red = 185.0
    sun_green = 94.0
    sun_blue = 40.0
    sky_red = 135
    sky_green = 118
    sky_blue = 85
    headlights_on = 0
}
tod_manager_default_afternoon = {
    state_length = 400000
    lev_red = 135
    lev_green = 130
    lev_blue = 125
    fog_on = 1
    fog_red = 105
    fog_green = 96
    fog_blue = 132
    fog_alpha = 60
    fog_dist = 803
    fog_sky_red = 105
    fog_sky_green = 96
    fog_sky_blue = 132
    fog_sky_alpha = 60
    ambient_red = 80
    ambient_green = 65
    ambient_blue = 55
    ambient_mod_factor_lo = 0.3000
    ambient_mod_factor_hi = 0.0
    heading_0 = 44
    pitch_0 = 305
    red_0 = 135
    green_0 = 130
    blue_0 = 165
    mod_factor_0_lo = 0.7500
    mod_factor_0_hi = 0.0
    heading_1 = 185.0
    pitch_1 = 30.0
    red_1 = 55
    green_1 = 50
    blue_1 = 50
    mod_factor_1_lo = 0.7500
    mod_factor_1_hi = 0.0
    indoor = {
        ambient_red = 80
        ambient_green = 65
        ambient_blue = 55
        ambient_mod_factor_lo = 0.3000
        ambient_mod_factor_hi = 0.0
        heading_0 = 84.0
        pitch_0 = 285.0
        red_0 = 115
        green_0 = 110
        blue_0 = 145
        mod_factor_0_lo = 0.7500
        mod_factor_0_hi = 0.0
        heading_1 = 185.0
        pitch_1 = 30.0
        red_1 = 95
        green_1 = 80
        blue_1 = 80
        mod_factor_1_lo = 0.7500
        mod_factor_1_hi = 0.0
    }
    headlights_on = 0
    bloom_on = 1
    bloom_color = [ 120 120 120 ]
    bloom1 = 5
    bloom2 = 40
    bloom_strength = [ 105 95 75 ]
    dof_on = 0
}
tod_manager_default_afternoon_sky = {
    state_length = 400000
    sun_on = 1
    sun_theta = 20.0
    sun_phi = 20.0
    sun_red = 85.0
    sun_green = 67.0
    sun_blue = 75.0
    sky_red = 118
    sky_green = 128
    sky_blue = 155
    headlights_on = 0
}
tod_manager_default_evening = {
    state_length = 90000
    lev_red = 113
    lev_green = 95
    lev_blue = 74
    fog_on = 1
    fog_red = 130
    fog_green = 96
    fog_blue = 59
    fog_alpha = 40
    fog_dist = 753
    fog_sky_red = 100
    fog_sky_green = 86
    fog_sky_blue = 29
    fog_sky_alpha = 30
    ambient_red = 59
    ambient_green = 48
    ambient_blue = 52
    ambient_mod_factor_lo = 0.3000
    ambient_mod_factor_hi = 0.0
    heading_0 = 44
    pitch_0 = 320
    red_0 = 84
    green_0 = 71
    blue_0 = 30
    mod_factor_0_lo = 0.7500
    mod_factor_0_hi = 0.0
    heading_1 = 190
    pitch_1 = 10
    red_1 = 35
    green_1 = 62
    blue_1 = 38
    mod_factor_1_lo = 0.4000
    mod_factor_1_hi = 0.0
    indoor = {
        ambient_red = 80
        ambient_green = 65
        ambient_blue = 55
        ambient_mod_factor_lo = 0.7000
        ambient_mod_factor_hi = 0.0
        heading_0 = 84.0
        pitch_0 = 285.0
        red_0 = 115
        green_0 = 110
        blue_0 = 145
        mod_factor_0_lo = 0.7500
        mod_factor_0_hi = 0.0
        heading_1 = 185.0
        pitch_1 = 30.0
        red_1 = 95
        green_1 = 80
        blue_1 = 80
        mod_factor_1_lo = 0.7500
        mod_factor_1_hi = 0.0
    }
    headlights_on = 0
    bloom_on = 1
    bloom_color = [ 120 120 120 ]
    bloom1 = 10
    bloom2 = 70
    bloom_strength = [ 80 45 20 ]
    dof_on = 0
}
tod_manager_default_evening_sky = {
    state_length = 110000
    sun_on = 1
    sun_theta = 20.0
    sun_phi = 180.0
    sun_red = 184.0
    sun_green = 97
    sun_blue = 40
    sky_red = 100
    sky_green = 79
    sky_blue = 56
    headlights_on = 0
}
tod_manager_default_night = {
    state_length = 140000
    lev_red = 60
    lev_green = 65
    lev_blue = 70
    fog_on = 1
    fog_red = 5
    fog_green = 16
    fog_blue = 22
    fog_alpha = 63
    fog_dist = 1030
    fog_sky_red = 5
    fog_sky_green = 16
    fog_sky_blue = 22
    fog_sky_alpha = 63
    ambient_red = 36
    ambient_green = 36
    ambient_blue = 40
    ambient_mod_factor_lo = 0.3000
    ambient_mod_factor_hi = 0.0
    heading_0 = 44
    pitch_0 = 300
    red_0 = 80
    green_0 = 110
    blue_0 = 116
    mod_factor_0_lo = 0.8000
    mod_factor_0_hi = 0.8000
    heading_1 = 181
    pitch_1 = 50
    red_1 = 45
    green_1 = 40
    blue_1 = 50
    mod_factor_1_lo = 0.1000
    mod_factor_1_hi = 0.0
    indoor = {
        ambient_red = 80
        ambient_green = 65
        ambient_blue = 55
        ambient_mod_factor_lo = 0.7000
        ambient_mod_factor_hi = 0.0
        heading_0 = 84.0
        pitch_0 = 285.0
        red_0 = 115
        green_0 = 110
        blue_0 = 145
        mod_factor_0_lo = 0.7500
        mod_factor_0_hi = 0.0
        heading_1 = 185.0
        pitch_1 = 30.0
        red_1 = 95
        green_1 = 80
        blue_1 = 80
        mod_factor_1_lo = 0.7500
        mod_factor_1_hi = 0.0
    }
    headlights_on = 1
    bloom_on = 1
    bloom_color = [ 150 100 200 ]
    bloom1 = 40
    bloom2 = 100
    bloom_strength = [ 48 64 46 ]
    dof_on = 0
}
tod_manager_default_night_sky = {
    state_length = 100000
    sun_on = 0
    sun_theta = 20.0
    sun_phi = 200.0
    sun_red = 0.0
    sun_green = 0.0
    sun_blue = 0.0
    sky_red = 38
    sky_green = 30
    sky_blue = 28
    headlights_on = 1
}

script tod_manager_setup_systems \{ system_transition_length = 0 }
    if GotParam \{ systems }
        printf \{ 'Setting up TOD systems' }
        GetArraySize \{ systems }
        i = 0
        begin 
        TODManager_SetParams {
            system = (<i> + 1)
            current_state = Afternoon
            system_transition_length = <system_transition_length>
            (<systems> [ <i> ])
        }
        i = (<i> + 1)
        repeat <array_size>
    endif
    if (<system_transition_length> = 0)
        TODManager_Refresh
    endif
endscript

script load_level_tod_set_default 
    tod_manager_setup_systems \{active = 1 systems = [{ tod_manager_system_main_params tod_manager_system_main_cycle }{ tod_manager_system_sky_params tod_manager_system_sky_cycle }]}
    TODManager_SetTODScript <tod_script>
endscript

script load_level_tod_finalize system_transition_length = 0
    tod_manager_setup_systems <...> 
    if GotParam instant
        if NOT GotParam start_state
            start_state = Afternoon
        endif
        tod_printf 'Applying instant state %s' s = <start_state>
        TODManager_SetTODInstant <start_state>
        TODManager_Refresh
    endif
    if ((IsTrue tod_manager_inactive)|| 
        (InFrontend)|| 
        (<active> = 0)|| 
        (IsTrue GameInformerBuild))
        tod_printf 'Turning off TOD cycle'
        TODManager_SetActive 0
    else
        tod_printf 'Turning on TOD cycle'
        TODManager_SetActive 1
    endif
    if GotParam temp_tod
        tod_printf 'Setting temp tod'
        TODManager_SetTempTOD {
            <temp_tod>
            transition_length = <system_transition_length>
        }
    else
        tod_printf 'Restoring current tod'
        TODManager_RestoreCurrentTOD transition_length = <system_transition_length>
    endif
endscript

script zone_changed_setup_tod system_transition_length = 4500
    if NOT GotParam no_wait
        wait 1 seconds
    endif
    GetLevelStructureName level = <prefix>
    FormatText checksumname = zone_map_entry (<level_structure_name>.level)
    begin 
    if ZoneLoaded <zone_map_entry>
        break 
    endif
    wait 10 gameframes
    repeat 
    tod_printf '-=-=-==-=-=-=-=-=-==--=-=-=-=-=-=-=-=-==-=-=-=-=-=-'
    tod_printf 'Applying new zone TOD for %s' s = <zone_map_entry>
    tod_printf '-=-=-==-=-=-=-=-=-==--=-=-=-=-=-=-=-=-==-=-=-=-=-=-'
    load_level_tod_finalize {
        (<level_structure_name>.tod_manager_params)
        system_transition_length = <system_transition_length>
    }
endscript

script tod_printf 
    if IsTrue \{ tod_debug }
        printf <...> bg_color = magenta
    endif
endscript

script tod_manager_nodeflags_setup 
    tod_state_variables = [
        TOD_MorningOn_01
        TOD_MorningOn_02
        TOD_MorningOn_03
        TOD_MorningOn_04
        TOD_MorningOn_05
        TOD_MorningOn_06
        TOD_MorningOn_07
        TOD_MorningOn_08
        TOD_MorningOn_09
        TOD_MorningOn_10
        TOD_MorningOff_01
        TOD_MorningOff_02
        TOD_MorningOff_03
        TOD_MorningOff_04
        TOD_MorningOff_05
        TOD_MorningOff_06
        TOD_MorningOff_07
        TOD_MorningOff_08
        TOD_MorningOff_09
        TOD_MorningOff_10
        TOD_AfternoonOn_01
        TOD_AfternoonOn_02
        TOD_AfternoonOn_03
        TOD_AfternoonOn_04
        TOD_AfternoonOn_05
        TOD_AfternoonOn_06
        TOD_AfternoonOn_07
        TOD_AfternoonOn_08
        TOD_AfternoonOn_09
        TOD_AfternoonOn_10
        TOD_AfternoonOff_01
        TOD_AfternoonOff_02
        TOD_AfternoonOff_03
        TOD_AfternoonOff_04
        TOD_AfternoonOff_05
        TOD_AfternoonOff_06
        TOD_AfternoonOff_07
        TOD_AfternoonOff_08
        TOD_AfternoonOff_09
        TOD_AfternoonOff_10
        TOD_EveningOn_01
        TOD_EveningOn_02
        TOD_EveningOn_03
        TOD_EveningOn_04
        TOD_EveningOn_05
        TOD_EveningOn_06
        TOD_EveningOn_07
        TOD_EveningOn_08
        TOD_EveningOn_09
        TOD_EveningOn_10
        TOD_EveningOff_01
        TOD_EveningOff_02
        TOD_EveningOff_03
        TOD_EveningOff_04
        TOD_EveningOff_05
        TOD_EveningOff_06
        TOD_EveningOff_07
        TOD_EveningOff_08
        TOD_EveningOff_09
        TOD_EveningOff_10
        TOD_NightOn_01
        TOD_NightOn_02
        TOD_NightOn_03
        TOD_NightOn_04
        TOD_NightOn_05
        TOD_NightOn_06
        TOD_NightOn_07
        TOD_NightOn_08
        TOD_NightOn_09
        TOD_NightOn_10
        TOD_NightOff_01
        TOD_NightOff_02
        TOD_NightOff_03
        TOD_NightOff_04
        TOD_NightOff_05
        TOD_NightOff_06
        TOD_NightOff_07
        TOD_NightOff_08
        TOD_NightOff_09
        TOD_NightOff_10
    ]
    GetArraySize tod_state_variables
    i = 0
    begin 
    tod_printf 'Adding TOD nodeflag: %s' s = (<tod_state_variables> [ <i> ])
    createnodeflag (<tod_state_variables> [ <i> ])
    i = (<i> + 1)
    repeat <array_size>
endscript

script tod_manager_state_transition 
    GetCurrentLevel
    tod_manager_update_car_textures <...> 
    KillSpawnedScript \{ name = tod_manager_instant_fakelights_and_geo }
    KillSpawnedScript \{ name = tod_manager_update_fakelights_and_geo }
    KillSpawnedScript \{ name = tod_manager_update_car_textures }
    if GotParam \{ instant_change }
        tod_manager_instant_fakelights_and_geo <...> 
    else
        tod_manager_update_fakelights_and_geo <...> 
    endif
    if GotParam \{ level_specific_transition_script }
        <level_specific_transition_script> <...> 
    endif
    if StructureContains \{ structure = next_state_tod_struct entry_script }
        ScriptName = (<next_state_tod_struct>.entry_script)
        <ScriptName>
    endif
    if GotParam \{ set_inactive }
        TODManager_SetActive \{ 0 }
    endif
endscript

script tod_manager_update_fakelights_and_geo wait_time = 120
    tod_manager_get_tod_strings current_tod = <current_tod>
    TODManager_GetTimeMultiplier
    if (<tod_time_multiplier> > 1.0)
        wait_time = (<wait_time> / <tod_time_multiplier>)
    endif
    <prefix_index> = 1
    begin 
    begin 
    if NOT NodeArrayBusy
        break 
    endif
    printf 'Warning! Node array still busy; stalling TOD state change'
    wait 1 seconds
    repeat 
    FormatText {
        checksumname = next_state_on_variable
        'TOD_%s%g_%i'
        s = <next_tod_string>
        g = 'on'
        i = <prefix_index>
        integer_width = 2
    }
    FormatText {
        checksumname = next_state_off_variable
        'TOD_%s%g_%i'
        s = <next_tod_string>
        g = 'off'
        i = <prefix_index>
        integer_width = 2
    }
    FormatText {
        checksumname = current_state_on_variable
        'TOD_%s%g_%i'
        s = <current_tod_string>
        g = 'on'
        i = <prefix_index>
        integer_width = 2
    }
    FormatText {
        checksumname = current_state_off_variable
        'TOD_%s%g_%i'
        s = <current_tod_string>
        g = 'off'
        i = <prefix_index>
        integer_width = 2
    }
    if AreNodeFlagsLocked
        node_flag_lock = 1
        SetNodeFlagLock Off
    endif
    tod_printf 'Switching tod flag %f on' f = <next_state_on_variable>
    ChangeNodeFlag <next_state_on_variable> 1 queue = 1
    tod_printf 'Switching tod flag %f off' f = <next_state_off_variable>
    ChangeNodeFlag <next_state_off_variable> 0 queue = 1
    tod_printf 'Switching tod flag %f off' f = <current_state_on_variable>
    ChangeNodeFlag <current_state_on_variable> 0 queue = 1
    tod_printf 'Switching tod flag %f on' f = <current_state_off_variable>
    ChangeNodeFlag <current_state_off_variable> 1 queue = 1
    if GotParam node_flag_lock
        SetNodeFlagLock
    endif
    wait <wait_time> gameframes
    <prefix_index> = (<prefix_index> + 1)
    repeat tod_manager_num_prefixes
    UpdateFxLighting
endscript

script tod_manager_get_tod_strings 
    switch <current_tod>
        case Morning
        return current_tod_string = 'morning' next_tod_string = 'afternoon'
        case Afternoon
        return current_tod_string = 'afternoon' next_tod_string = 'evening'
        case Evening
        return current_tod_string = 'evening' next_tod_string = 'night'
        case Night
        return current_tod_string = 'night' next_tod_string = 'morning'
        default 
        script_assert 'Unrecognized tod state'
    endswitch
endscript

script tod_manager_instant_fakelights_and_geo 
    UpdateFxLighting
    if IsTrue tod_manager_block_fakelight_updates
        return 
    endif
    if NodeArrayBusy
        ParseNodeArray Block
    endif
    tod_manager_get_tod_strings current_tod = <current_tod>
    tod_state_names = [
        'morning'
        'afternoon'
        'evening'
        'night'
    ]
    GetArraySize <tod_state_names>
    <index> = 0
    begin 
    <prefix_index> = 1
    begin 
    FormatText {
        checksumname = state_on_variable
        'TOD_%s%g_%i'
        s = (<tod_state_names> [ <index> ])
        g = 'on'
        i = <prefix_index>
        integer_width = 2
    }
    FormatText {
        checksumname = state_off_variable
        'TOD_%s%g_%i'
        s = (<tod_state_names> [ <index> ])
        g = 'off'
        i = <prefix_index>
        integer_width = 2
    }
    if InFrontend
        SetNodeFlagMultiplayerBlock disable_multiplayer_check_hack
    endif
    if AreNodeFlagsLocked
        node_flag_lock = 1
        SetNodeFlagLock Off
    endif
    if ((<tod_state_names> [ <index> ])= <next_tod_string>)
        tod_printf 'Switching tod flag %f on' f = <state_on_variable>
        ChangeNodeFlag <state_on_variable> 1
        tod_printf 'Switching tod flag %f off' f = <state_off_variable>
        ChangeNodeFlag <state_off_variable> 0
    else
        tod_printf 'Switching tod flag %f off' f = <state_on_variable>
        ChangeNodeFlag <state_on_variable> 0
        tod_printf 'Switching tod flag %f on' f = <state_off_variable>
        ChangeNodeFlag <state_off_variable> 1
    endif
    if GotParam node_flag_lock
        SetNodeFlagLock
    endif
    if InFrontend
        SetNodeFlagMultiplayerBlock enable_multiplayer_check_hack
    endif
    <prefix_index> = (<prefix_index> + 1)
    repeat tod_manager_num_prefixes
    <index> = (<index> + 1)
    repeat <array_size>
endscript

script tod_manager_update_car_textures 
endscript

script tod_manager_day_changed 
    printf '!!!!####!!!!#### tod_manager_day_changed'
    if CompositeObjectExists name = skater
        <should_shuffle> = 1
        if GoalManager_GoalExists name = z_ho_goal_gaps31
            if GoalManager_GoalIsActive name = z_ho_goal_gaps31
                GetLevelStructureName
                FormatText checksumname = level_checksum '%l' l = (<level_structure_name>.level)
                skater ::StatsManager_GetGroupNumFromLevel <level_checksum>
                if GotParam group_num
                    GetArraySize stats_goals
                    <index> = 0
                    begin 
                    if ((stats_goals [ <index> ].group_num)= <group_num>)
                        skater ::StatsManager_GetGoalStatus num = <index>
                        if ((ChecksumEquals a = <status> b = active)|| (ChecksumEquals a = <status> b = pending))
                            <should_shuffle> = 0
                            break 
                        endif
                    endif
                    <index> = (<index> + 1)
                    repeat <array_size>
                endif
            endif
        endif
        if (<should_shuffle> = 1)
            skater ::StatsManager_ShuffleStatsGroups
        endif
    endif
    CareerFunc func = IncrementDaysPassed
endscript

script tod_manager_is_night 
    if GetNodeFlag \{TOD_NightOn_01 TOD_NightOn_02 TOD_NightOn_03 TOD_NightOn_04 TOD_NightOn_05 TOD_NightOn_06 TOD_NightOn_07 TOD_NightOn_08 TOD_NightOn_09 TOD_NightOn_10}
        return \{ true }
    else
        return \{ false }
    endif
endscript

script tod_manager_smoi_fog_on 
    printf \{ 'SWITCHING ON FOG' }
    TODManager_SetTempTOD \{fog_on = 1 fog_red = 105 fog_green = 100 fog_blue = 132 fog_alpha = 255 fog_dist = 803 fog_sky_red = 115 fog_sky_green = 106 fog_sky_blue = 122 fog_sky_alpha = 110 transition_length = 5000}
    TODManager_AllowTempTOD \{ 0 }
endscript

script tod_manager_smoi_fog_off 
    printf \{ 'SWITCHING OFF FOG' }
    TODManager_AllowTempTOD \{ 1 }
    TODManager_RestoreCurrentTOD
endscript

script tod_manager_el_force_night_on 
    printf \{ '==== tod_manager_el_force_night_on ====' }
    TODManager_SetTODInstant \{ Night }
    TODManager_SetActive \{ 0 }
    TODManager_AllowTempTOD \{ 0 }
endscript

script tod_manager_el_force_night_off 
    printf \{ '==== tod_manager_el_force_night_off ====' }
    TODManager_AllowTempTOD \{ 1 }
    TODManager_SetActive \{ 1 }
endscript

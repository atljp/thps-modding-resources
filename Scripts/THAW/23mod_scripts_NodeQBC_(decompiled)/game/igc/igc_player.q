igc_debug = 0
igc_debug_hold_camera = 0
igc_use_heads = 1
igc_play_head_anims = 1
igc_playing = 0
igc_player_head_BaseAnimTree = {
    type = IGCHead
    SourceObject = param_src
    ExcludeBones = param_exclude
    [
        { type = degenerateblend id = Blender }
    ]
}
igc_player_head_Branch_PlayAnim = {
    type = param_timer_type
    id = HeadTimer
    Speed = param_speed
    start = param_start
    anim = param_anim
    [
        { id = HeadSource type = source anim = param_anim }
    ]
}

script igc_printf 
    if IsTrue \{ igc_debug }
        printf <...> bg_color = cyan
    endif
endscript

script igc_player_run {
        Play_hold = 0
        skippable = 1
        use_fam = 0
        total_shots = 10
    }
    change igc_playing = 1
    if GotParam name
        display_name = <name>
    else
        display_name = 'Nienazwany'
    endif
    printf '===== Playing IGC Scene: \'%n\' =====' n = <display_name>
    SetScreenElementLock id = root_window Off
    CreateScreenElement {
        parent = root_window
        id = igc_anchor
        type = ContainerElement
    }
    current_template = {
        shadow_map_params = {
            near = 100.0
            far = 450.0
        }
        <template>
        <scene_setup>
    }
    RemoveParameter template
    RemoveParameter scene_setup
    igc_anchor ::settags {
        <gameside_tags>
        gameside_callbacks = <gameside_callbacks>
        scene_name = <name>
        shot_params = <shot_params>
        camera_cycle = (<current_template>.camera_cycle)
        default_behavior = (<current_template>.default_behavior)
        default_direction = (<current_template>.default_direction)
        extra_storage_heap = <extra_storage_heap>
        use_fam = <use_fam>
    }
    if GotParam shot_params
        GetArraySize shot_params
        if (<total_shots> < <array_size>)
            total_shots = <array_size>
        endif
        RemoveParameter shot_params
    endif
    igc_process_transition <current_template>
    igc_do_transition_out
    igc_printf '=== Processing setup ==='
    if StructureContains structure = current_template passive_setup
        igc_anchor ::settags passive_setup
    endif
    igc_gameside_callback_execute ScriptName = setup
    igc_process_pre_shot_actions <current_template>
    igc_process_actor_declarations <current_template>
    igc_process_element_params <current_template>
    RemoveParameter current_template
    if GotParam start_script
        <start_script> <start_script_params>
    endif
    shot_num = 1
    begin 
    igc_printf '=== Processing shot %s ===' s = <shot_num>
    RemoveParameter current_shot_params
    igc_process_next_shot {
        shot_num = <shot_num>
        current_shot_params = {
            Play_hold = <Play_hold>
            skippable = <skippable>
        }
    }
    if GotParam current_shot_params
        igc_printf '=== Playing shot %s ===' s = <shot_num>
        igc_process_element_params <current_shot_params>
        igc_process_shot_script <current_shot_params> type = pre
        igc_do_transition_in
        igc_process_transition <current_shot_params>
        igc_element_play <current_shot_params>
        igc_process_shot_script <current_shot_params> type = post
        GlobalEffects_ClearState id = igc_dof
        LaunchEvent broadcast type = igc_shot_finished
    else
        igc_printf 'unused'
    endif
    shot_num = (<shot_num> + 1)
    repeat <total_shots>
    igc_printf '=== Processing cleanup ==='
    if GotParam scene_cleanup
        igc_process_transition <scene_cleanup>
        igc_process_pre_shot_actions <scene_cleanup>
        igc_process_actor_declarations <scene_cleanup>
        igc_process_element_params <scene_cleanup>
    endif
    if GotParam end_script
        <end_script> <end_script_params>
    endif
    igc_cleanup_actors
    igc_kill_camera
    igc_gameside_callback_execute ScriptName = cleanup
    igc_do_transition_in
    if IsXenon
        ResetShadowMapParams
    endif
    igc_temporarily_disable_input
    igc_temporarily_disable_rendering 5 gameframes
    igc_unload_all_paks
    DestroyScreenElement id = igc_anchor
    change igc_playing = 0
    LaunchEvent broadcast type = igc_scene_finished
endscript

script igc_wait_scene 
    if IsTrue \{ igc_playing }
        Block \{ type = igc_scene_finished }
    endif
endscript

script igc_wait_shot 
    if IsTrue \{ igc_playing }
        Block \{ type = igc_shot_finished }
    endif
endscript

script igc_process_pre_shot_actions 
    if GotParam \{ extra_storage_heap }
        igc_anchor ::settags extra_storage_heap = <extra_storage_heap>
    endif
endscript

script igc_process_element_params 
    if IsXenon
        if GotParam \{ shadow_map_params }
            SetShadowMapParams <shadow_map_params>
        endif
    endif
    igc_process_actor_positions <...> 
    igc_process_actor_behaviors <...> 
    igc_process_actor_directions <...> 
    igc_process_element_dof <...> 
endscript

script igc_load_pak \{ should_wait_on_unload = 1 }
    igc_anchor ::getsingletag \{ extra_storage_heap }
    igc_printf '- Loading pak \'%s\'' s = <pak_name>
    LoadPak <pak_name> heap = <extra_storage_heap>
    igc_anchor ::getsingletag \{ paks_to_unload }
    <param_stacks> = { pak_info = <paks_to_unload> }
    <pak_info> = {
        name = <pak_name>
        should_wait_on_unload = <should_wait_on_unload>
    }
    push \{ pak_info }
    igc_anchor ::settags paks_to_unload = (<param_stacks>.pak_info)
endscript

script igc_unload_all_paks 
    if igc_anchor ::getsingletag \{ paks_to_unload }
        flushdeadobjects
        wait \{ 2 gameframes }
        ForEachIn <paks_to_unload> do = igc_unload_single_pak
    endif
endscript

script igc_unload_single_pak 
    igc_printf '- Unloading pak: %s' s = <name>
    BeginUnloadPak <name>
    if (<should_wait_on_unload> = 1)
        igc_printf \{ 'waiting' }
        wait \{ 2 gameframes }
    endif
    EndUnloadPak <name>
endscript

script igc_process_shot_script type = during
    switch <type>
        case pre
        if GotParam pre_shot_script
            igc_printf '+ exe pre_shot_script \'%s\'' s = <pre_shot_script> color = magenta
            <pre_shot_script>
        endif
        case during
        if GotParam shot_script
            igc_printf '+ spawning shot script \'%s\'' s = <shot_script> color = magenta
            igc_anchor ::obj_spawnscriptnow <shot_script> params = <shot_script_params>
        endif
        case post
        if GotParam post_shot_script
            igc_printf '+ exe post_shot_script \'%s\'' s = <post_shot_script> color = magenta
            <post_shot_script>
        endif
    endswitch
endscript

script igc_process_transition 
    if NOT GotParam \{ transition }
        return 
    endif
    igc_printf \{ 'got new transition template' }
    igc_anchor ::settags current_transition = <transition>
endscript

script igc_do_transition_out 
    if igc_anchor ::getsingletag \{ current_transition }
        ScriptName = (<current_transition>.out)
        igc_printf 'playing transition (out) \'%t\'' t = <ScriptName>
        <ScriptName>
    endif
endscript

script igc_do_transition_in 
    if igc_anchor ::getsingletag \{ current_transition }
        ScriptName = (<current_transition>.in)
        igc_printf 'playing transition (in)  \'%t\'' t = <ScriptName>
        <ScriptName>
        igc_anchor ::removetags \{[ current_transition ]}
    endif
endscript

script igc_find_vo_stream 
    if NOT igc_anchor ::getsingletag scene_name
        return 
    endif
    igc_anchor ::getsingletag actor_list
    igc_get_actor_params actor = <actor>
    if (<use_fam> = 1)
        fam_suffix = '_lip'
    else
        fam_suffix = ''
    endif
    FormatText {
        checksumname = vo
        '%n_%i_%a%s'
        n = <scene_name>
        i = <shot_num> integer_width = 2
        a = <vo_suffix>
        s = <fam_suffix>
    }
    if StreamExists <vo>
        igc_printf 'found VO \'%v\' for %a' a = <actor> v = <vo>
        igc_anchor ::settags current_vo_checksum = <vo>
        return vo = <vo>
    endif
endscript

script igc_process_next_shot 
    shot_valid = 0
    if igc_anchor ::getsingletag shot_params
        GetArraySize shot_params
        shot_params_size = <array_size>
        i = 0
        begin 
        if StructureContains structure = (<shot_params> [ <i> ])shotnum
            if (((<shot_params> [ <i> ]).shotnum)= <shot_num>)
                igc_printf 'shot params found (explicit)'
                current_shot_params = {
                    <current_shot_params>
                    (<shot_params> [ <i> ])
                }
                shot_valid = 1
                break 
            endif
        endif
        i = (<i> + 1)
        repeat <shot_params_size>
        if (<shot_valid> = 0)
            i = 0
            j = 0
            begin 
            if NOT StructureContains structure = (<shot_params> [ <i> ])shotnum
                j = (<j> + 1)
                if (<j> = <shot_num>)
                    igc_printf 'shot params found (implicit)'
                    current_shot_params = {
                        <current_shot_params>
                        (<shot_params> [ <i> ])
                    }
                    shot_valid = 1
                    break 
                endif
            endif
            i = (<i> + 1)
            repeat <shot_params_size>
        endif
    endif
    igc_process_pre_shot_actions <current_shot_params>
    igc_process_actor_declarations <current_shot_params>
    if StructureContains structure = current_shot_params speaker
        igc_get_actor_name_from_params (<current_shot_params>.speaker)
        if GotParam actor_name
            igc_printf 'speaker: \'%a\' specified' a = <actor_name>
            current_shot_params = {
                <current_shot_params>
                speaking_actor_name = <actor_name>
            }
            igc_find_vo_stream actor = <actor_name> shot_num = <shot_num>
            if GotParam vo
                current_shot_params = {
                    <current_shot_params>
                    vo = <vo>
                }
            endif
        else
            no_speaker = 1
        endif
    endif
    if NOT StructureContains structure = current_shot_params speaking_actor_name
        if igc_anchor ::getsingletag actor_names
            GetArraySize actor_names
            num_actors = <array_size>
            mod a = (<shot_num> -1)b = <num_actors>
            current_shot_params = {
                <current_shot_params>
                speaking_actor_name = (<actor_names> [ <mod> ])
            }
            igc_printf 'guessing speaker \'%a\'' a = (<actor_names> [ <mod> ])
            i = 0
            begin 
            current_actor_name = (<actor_names> [ <i> ])
            igc_find_vo_stream actor = <current_actor_name> shot_num = <shot_num>
            if GotParam vo
                current_shot_params = {
                    <current_shot_params>
                    vo = <vo>
                    speaking_actor_name = <current_actor_name>
                }
                shot_valid = 1
                break 
            endif
            i = (<i> + 1)
            repeat <num_actors>
        endif
    endif
    if GotParam no_speaker
        RemoveComponent name = speaking_actor_name structure_name = current_shot_params
        igc_anchor ::removetags [ current_vo_checksum ]
        igc_printf 'speaker: none specified'
    endif
    if (<shot_valid> = 1)
        if igc_anchor ::getsingletag camera_holding
            if StructureContains structure = current_shot_params camera
                igc_printf 'camera hold off'
                igc_anchor ::removetags [ camera_holding ]
                igc_kill_camera
            else
                igc_printf 'camera holding'
            endif
        else
            if NOT StructureContains structure = current_shot_params camera
                if igc_anchor ::getsingletag camera_cycle
                    igc_printf 'getting camera from camera_cycle'
                    GetArraySize camera_cycle
                    mod a = (<shot_num> -1)b = <array_size>
                    current_shot_params = {
                        <current_shot_params>
                        camera = (<camera_cycle> [ <mod> ])
                    }
                endif
            endif
        endif
        if StructureContains structure = current_shot_params camera_hold
            camera_hold = 1
            camera_hold_value = (<current_shot_params>.camera_hold)
            if GotParam camera_hold_value
                if (<camera_hold_value> = 0)
                    RemoveParameter camera_hold
                endif
            endif
            if GotParam camera_hold
                igc_printf 'camera hold on'
                igc_anchor ::settags camera_holding
            endif
        endif
        return current_shot_params = <current_shot_params>
    endif
endscript

script igc_actor_behavior_entry 
    if NOT GotParam behavior
        return 
    endif
    obj_killspawnedscript name = igc_cycle_actor_anims
    igc_printf '- behavior  (%a): \'%b\' started' b = (<behavior>.ScriptName)a = <actor>
    settags igc_behavior_active
    (<behavior>.ScriptName)(<behavior>.params)
    removetags [ igc_behavior_active ]
    igc_printf '- behavior  (%a): \'%b\' finished' b = (<behavior>.ScriptName)a = <actor>
    igc_set_actor_direction actor = <actor> BlendPeriod = randomrange (0.20000000298023224, 0.4000000059604645)
endscript

script igc_process_actor_declarations 
    if NOT GotParam Actors
        return 
    endif
    if NOT igc_anchor ::getsingletag actor_names
        actor_names = [ null ]
        first_actor = 1
    endif
    if NOT igc_anchor ::getsingletag actor_list
        actor_list = {}
    endif
    if NOT igc_anchor ::getsingletag default_direction
        scriptassert 'Can\'t process actors without first setting a default_direction'
    endif
    igc_anchor ::getsingletag default_behavior
    GetArraySize Actors
    num_actors = <array_size>
    i = 0
    begin 
    RemoveParameter current_actor_name
    RemoveParameter current_head
    action = Add
    current_actor_template = {}
    description_structure = (<Actors> [ <i> ])
    if StructureContains structure = description_structure action
        action = (<description_structure>.action)
    endif
    if StructureContains structure = description_structure template
        current_actor_template = (<description_structure>.template)
        if NOT globalexists name = <current_actor_template> type = structure
            scriptassert 'Actor template does not exist!'
        endif
    else
        if ChecksumEquals a = <action> b = Add
            scriptassert 'need \'template=\' in actors array when adding an actor'
        endif
    endif
    if StructureContains structure = description_structure ActorName
        current_actor_name = (<description_structure>.ActorName)
    else
        if StructureContains structure = current_actor_template ActorName
            current_actor_name = (<current_actor_template>.ActorName)
        else
            scriptassert 'need \'name=\' in actors array or ActorName in template'
        endif
    endif
    if StructureContains structure = description_structure HeadStructure
        current_head = (<description_structure>.HeadStructure)
    endif
    if StructureContains structure = description_structure use_fam
        use_fam = (<description_structure>.use_fam)
    else
        igc_anchor ::getsingletag use_fam
    endif
    switch <action>
        case Add
        if NOT StructureContains structure = actor_list <current_actor_name>
            igc_printf '+ Adding actor \'%a\'' a = <current_actor_name>
            MangleChecksums a = <current_actor_name> b = Head
            AddParam {
                name = <current_actor_name>
                structure_name = actor_list
                value = {
                    <current_actor_template>
                    ActorName = <current_actor_name>
                    HeadStructure = <current_head>
                    HeadName = <mangled_id>
                    use_fam = <use_fam>
                }
            }
            if GotParam first_actor
                RemoveParameter first_actor
                SetArrayElement arrayName = actor_names index = 0 newValue = <current_actor_name>
            else
                AddArrayElement array = <actor_names> element = <current_actor_name>
                actor_names = <array>
            endif
            igc_anchor ::settags {
                actor_list = <actor_list>
                actor_names = <actor_names>
            }
            if ObjectExists id = <current_actor_name>
                <current_actor_name> ::UnPause
                <current_actor_name> ::unhide
            else
                igc_actor_management_script_execute {
                    actor = <current_actor_name>
                    ScriptName = Create
                    params = {
                        name = <current_actor_name>
                    }
                    defaultscript = Create
                    run_on_actor = 0
                }
            endif
            <current_actor_name> ::settags igc_actor_flag = 1
            igc_actor_management_script_execute {
                actor = <current_actor_name>
                ScriptName = setup
            }
            igc_head_create actor = <current_actor_name>
            if GotParam default_behavior
                igc_spawn_behavior_entry {
                    actor = <current_actor_name>
                    behavior = <default_behavior>
                }
            endif
            igc_set_actor_direction {
                actor = <current_actor_name>
                direction = <default_direction>
                anim_type = idle_animations
            }
        else
            igc_printf 'WARNING: Trying to add an actor that already exists'
        endif
        case remove
        case remove_and_kill
        if StructureContains structure = actor_list <current_actor_name>
            igc_printf '+ Removing actor \'%a\'' a = <current_actor_name>
            igc_cleanup_single_actor actor = <current_actor_name>
            GetArraySize actor_names
            if (<array_size> > 1)
                RemoveComponent name = <current_actor_name> structure_name = actor_list
                RemoveArrayElement element = <current_actor_name> array = <actor_names>
                actor_names = <array>
                igc_anchor ::settags {
                    actor_list = <actor_list>
                    actor_names = <actor_names>
                }
            else
                igc_anchor ::removetags [ actor_list actor_names ]
                RemoveComponent actor_list
                RemoveComponent actor_names
            endif
            if ChecksumEquals a = <action> b = remove_and_kill
                igc_printf '+ Killing actor \'%a\'' a = <current_actor_name>
                Kill name = <current_actor_name>
            endif
        else
            igc_printf 'WARNING: Trying to remove an actor that does not exist'
        endif
        default 
        scriptassert 'Invalid Action'
    endswitch
    i = (<i> + 1)
    repeat <num_actors>
endscript

script igc_set_actor_direction BlendPeriod = 0.0
    if GotParam direction
        <actor> ::settags igc_last_direction = <direction>
    else
        if <actor> ::getsingletag igc_last_direction
            direction = <igc_last_direction>
        else
            scriptassert 'No direction specified and no old one exists'
        endif
    endif
    if GotParam anim_type
        <actor> ::settags igc_last_anim_type = <anim_type>
    endif
    if <actor> ::getsingletag igc_behavior_active
        return 
    endif
    igc_get_actor_params actor = <actor>
    if NOT StructureContains structure = direction_params <direction>
        scriptassert 'Direction not in actor\'s template!'
    endif
    current_direction_params = (<direction_params>.<direction>)
    if <actor> ::getsingletag igc_speaking
        anim_type = talk_animations
        lookat_params = (<current_direction_params>.talk_lookat_params)
    else
        if NOT GotParam anim_type
            if <actor> ::getsingletag igc_last_anim_type
                anim_type = <igc_last_anim_type>
            else
                scriptassert 'No anim_type specified'
            endif
        endif
        lookat_params = (<current_direction_params>.idle_lookat_params)
    endif
    igc_printf '- direction (%a): \'%d\', anims \'%m\'' a = <actor> d = <direction> m = <anim_type>
    <actor> ::obj_killspawnedscript name = igc_cycle_actor_anims
    <actor> ::obj_spawnscriptnow {
        igc_cycle_actor_anims
        params = {
            <management_scripts>
            anim_list = (<current_direction_params>.<anim_type>)
            BlendPeriod = <BlendPeriod>
            lookat_params = <lookat_params>
        }
    }
endscript

script igc_cycle_actor_anims \{anims = [ default ]}
    begin 
    getsingletag \{ igc_lookat_target }
    GetRandomArrayElement \{ anim_list }
    <play_anim> {
        anim = <element>
        anim_list = <anim_list>
        BlendPeriod = <BlendPeriod>
        lookat_params = <lookat_params>
        lookat_target = <igc_lookat_target>
    }
    <wait_anim>
    repeat 
endscript

script igc_get_default_blend_period 
    if igc_anchor ::getsingletag \{ camera_holding }
        return BlendPeriod = randomrange (0.20000000298023224, 0.4000000059604645)
    else
        return \{ BlendPeriod = 0.0 }
    endif
endscript

script igc_process_actor_directions 
    if GotParam default_look_at_enabled
        if (<default_look_at_enabled> = 1)
            igc_anchor ::settags everyone_looks_at_speaker
            igc_printf 'setting default lookat on'
        else
            igc_anchor ::removetags [ everyone_looks_at_speaker ]
            igc_printf 'setting default lookat off'
        endif
    endif
    if NOT igc_anchor ::getsingletag actor_names
        return 
    endif
    GetArraySize actor_names
    num_actors = <array_size>
    if GotParam actor_directions
        GetArraySize actor_directions
        num_directions = <array_size>
    endif
    igc_get_default_blend_period
    i = 0
    begin 
    RemoveParameter current_lookat_target
    RemoveParameter direction
    need_update = 0
    current_actor = (<actor_names> [ <i> ])
    if <current_actor> ::getsingletag igc_speaking
        if GotParam speaking_actor_name
            if NOT ChecksumEquals a = <speaking_actor_name> b = <current_actor>
                <current_actor> ::removetags [ igc_speaking ]
                current_lookat_target = <speaking_actor_name>
                need_update = 1
            endif
        endif
    else
        if GotParam speaking_actor_name
            if ChecksumEquals a = <speaking_actor_name> b = <current_actor>
                <current_actor> ::settags igc_speaking = 1
                if igc_anchor ::getsingletag previous_speaker_name
                    current_lookat_target = <previous_speaker_name>
                endif
                need_update = 1
            else
                current_lookat_target = <speaking_actor_name>
            endif
        endif
    endif
    if igc_anchor ::getsingletag everyone_looks_at_speaker
        if GotParam current_lookat_target
            igc_printf '- lookat    (%a): at \'%b\' by default' a = <current_actor> b = <current_lookat_target>
            <current_actor> ::settags igc_lookat_target = <current_lookat_target>
        endif
    else
        <current_actor> ::removetags [ igc_lookat_target ]
    endif
    if GotParam actor_directions
        j = 0
        begin 
        direction_entry = (<actor_directions> [ <j> ])
        igc_get_actor_name_from_params <direction_entry>
        if ChecksumEquals a = <current_actor> b = <actor_name>
            if StructureContains structure = direction_entry direction
                direction = (<direction_entry>.direction)
                need_update = 1
            endif
            igc_process_lookat_entry <direction_entry> actor = <actor_name>
            break 
        endif
        j = (<j> + 1)
        repeat <num_directions>
    endif
    igc_update_head_animation actor = <current_actor>
    if (<need_update> = 1)
        igc_set_actor_direction actor = <current_actor> direction = <direction> BlendPeriod = <BlendPeriod>
    else
        igc_process_lookat_change actor = <current_actor>
    endif
    i = (<i> + 1)
    repeat <num_actors>
    igc_anchor ::settags previous_speaker_name = <speaking_actor_name>
endscript

script igc_process_lookat_entry 
    if NOT GotParam lookat
        return 
    endif
    igc_get_actor_name_from_params <lookat>
    if GotParam actor_name
        object_name = <actor_name>
    else
        if StructureContains structure = <lookat> name
            object_name = (<lookat>.name)
        else
            <actor> ::removetags [ igc_lookat_target ]
            return 
        endif
    endif
    igc_printf '- lookat    (%a): at \'%b\' explicitly' a = <actor> b = <object_name>
    <actor> ::settags igc_lookat_target = <object_name>
endscript

script igc_process_lookat_change 
    if NOT <actor> ::getsingletag igc_lookat_target
        return 
    endif
    if <actor> ::getsingletag igc_behavior_active
        return 
    endif
    igc_actor_management_script_execute {
        actor = <actor>
        ScriptName = change_lookat
        params = {
            lookat_target = <igc_lookat_target>
        }
    }
endscript

script igc_get_actor_name_from_params 
    if GotParam ActorName
        if NOT igc_anchor ::getsingletag actor_list
            scriptassert 'Trying to reference ActorName when none exist!'
        endif
        if StructureContains structure = actor_list <ActorName>
            return actor_name = <ActorName>
        else
            scriptassert 'Unknown actor name'
        endif
    endif
    if GotParam ActorNum
        if NOT igc_anchor ::getsingletag actor_names
            scriptassert 'Trying to reference ActorNum when none exist!'
        endif
        GetArraySize actor_names
        actor_num = (<ActorNum> -1)
        if (<actor_num> < 0)
            scriptassert 'Invalid ActorNum: too small'
        endif
        if NOT (<actor_num> < <array_size>)
            scriptassert 'Invalid ActorNum: too large'
        endif
        return actor_name = (<actor_names> [ <actor_num> ])
    endif
endscript

script igc_process_actor_positions 
    if GotParam actor_positions
        GetArraySize actor_positions
        i = 0
        begin 
        current_pos_struct = (<actor_positions> [ <i> ])
        igc_get_actor_name_from_params <current_pos_struct>
        igc_printf '- position \'%a\'' a = <actor_name>
        <actor_name> ::settags ignore_actor_marks = 1
        if StructureContains structure = current_pos_struct node
            <actor_name> ::obj_movetonode name = (<current_pos_struct>.node)orient
        else
            if StructureContains structure = current_pos_struct Quat
                igc_actor_management_script_execute {
                    actor = <actor_name>
                    ScriptName = orient
                    params = {
                        Quat = (<current_pos_struct>.Quat)
                    }
                    defaultscript = obj_setorientation
                }
            endif
            <actor_name> ::obj_setposition position = (<current_pos_struct>.Pos)
        endif
        i = (<i> + 1)
        repeat <array_size>
    endif
    if GotParam actor_marks
        GetArraySize actor_marks
        i = 0
        begin 
        if StructureContains structure = (<actor_marks> [ <i> ])relativeto
            igc_get_actor_name_from_params (<actor_marks> [ <i> ].relativeto)
            RelObj = <actor_name>
            igc_get_actor_name_from_params (<actor_marks> [ <i> ])
            if NOT <actor_name> ::getsingletag ignore_actor_marks
                <RelObj> ::obj_getposition
                <RelObj> ::Obj_GetQuat
                igc_actor_management_script_execute {
                    actor = <actor_name>
                    ScriptName = orient
                    params = {
                        Quat = <Quat>
                    }
                    defaultscript = obj_setorientation
                }
                <actor_name> ::obj_setposition position = <Pos>
                igc_printf '- mark \'%a\' relative to \'%b\'' a = <actor_name> b = <RelObj>
                if StructureContains structure = (<actor_marks> [ <i> ])Pos
                    <actor_name> ::move {
                        x = ((<actor_marks> [ <i> ].Pos).(1.0, 0.0, 0.0))
                        y = ((<actor_marks> [ <i> ].Pos).(0.0, 1.0, 0.0))
                        z = ((<actor_marks> [ <i> ].Pos).(0.0, 0.0, 1.0))
                    }
                endif
                if StructureContains structure = (<actor_marks> [ <i> ])angles
                    igc_actor_management_script_execute {
                        actor = <actor_name>
                        ScriptName = rotate
                        params = {
                            relative = ((<actor_marks> [ <i> ]).angles)
                        }
                        defaultscript = obj_rotate
                    }
                endif
            endif
        else
            scriptassert 'actor_mark without RelativeTo not possible'
        endif
        i = (<i> + 1)
        repeat <array_size>
    endif
    if igc_anchor ::getsingletag actor_names
        GetArraySize actor_names
        i = 0
        begin 
        (<actor_names> [ <i> ])::removetags [ ignore_actor_marks ]
        i = (<i> + 1)
        repeat <array_size>
    endif
endscript

script igc_callback_execute { 
     }
    my_script = <defaultscript>
    if GotParam structure
        if StructureContains structure = <structure> <ScriptName>
            my_script = (<structure>.<ScriptName>)
            igc_printf '+ exe (%a,%b): \'%c\'' a = <structurename> b = <ScriptName> c = <my_script> color = magenta
        endif
    endif
    if GotParam my_script
        if GotParam object
            <object> ::<my_script> <params>
        else
            <my_script> <params>
        endif
    endif
endscript

script igc_gameside_callback_execute 
    igc_anchor ::getsingletag \{ gameside_callbacks }
    igc_callback_execute {
        structurename = gameside_callbacks
        structure = <gameside_callbacks>
        ScriptName = <ScriptName>
        defaultscript = <defaultscript>
        params = <params>
    }
endscript

script igc_actor_management_script_execute \{ run_on_actor = 1 }
    igc_get_actor_params actor = <actor>
    if (<run_on_actor> = 0)
        RemoveParameter \{ actor }
    endif
    igc_callback_execute {
        structurename = actor_params
        structure = <management_scripts>
        ScriptName = <ScriptName>
        defaultscript = <defaultscript>
        params = <params>
        object = <actor>
    }
endscript

script igc_process_actor_behaviors 
    if NOT GotParam \{ actor_behaviors }
        return 
    endif
    GetArraySize \{ actor_behaviors }
    i = 0
    begin 
    current_params = (<actor_behaviors> [ <i> ])
    igc_get_actor_name_from_params <current_params>
    igc_spawn_behavior_entry <current_params> actor = <actor_name>
    i = (<i> + 1)
    repeat <array_size>
endscript

script igc_spawn_behavior_entry 
    <actor> ::obj_spawnscriptnow {
        igc_actor_behavior_entry
        params = {
            behavior = <behavior>
            actor = <actor>
        }
    }
endscript

script igc_cleanup_actors 
    if NOT igc_anchor ::getsingletag \{ actor_names }
        return 
    endif
    GetArraySize \{ actor_names }
    i = 0
    begin 
    igc_cleanup_single_actor actor = (<actor_names> [ <i> ])
    i = (<i> + 1)
    repeat <array_size>
endscript

script igc_cleanup_single_actor 
    igc_printf '+ Cleaning up \'%a\'' a = <actor>
    igc_head_cleanup actor = <actor>
    if <actor> ::getsingletag igc_speaking
        <actor> ::removetags [ igc_speaking ]
        igc_set_actor_direction actor = <actor>
    endif
    <actor> ::removetags {
        tags = [
            igc_actor_flag
            igc_lookat_target
            igc_last_direction
            igc_last_anim_type
            igc_behavior_active
        ]
    }
    <actor> ::obj_killspawnedscript name = igc_cycle_actor_anims
    <actor> ::obj_killspawnedscript name = igc_actor_behavior_entry
    igc_actor_management_script_execute {
        actor = <actor>
        ScriptName = cleanup
        params = {
            name = <actor>
        }
        run_on_actor = 0
    }
endscript

script igc_get_actor_params 
    igc_anchor ::getsingletag \{ actor_list }
    return (<actor_list>.<actor>)
endscript

script igc_head_create 
    if NOT IsTrue igc_use_heads
        return 
    endif
    igc_get_actor_params actor = <actor>
    if NOT GotParam HeadStructure
        return 
    endif
    if (<use_fam> = 1)
        return 
    endif
    if CompositeObjectExists <HeadName>
        <HeadName> ::Die
    endif
    igc_printf '- Creating hi-res head \'%n\' on actor \'%o\'' n = <HeadName> o = <ActorName>
    if StructureContains structure = HeadStructure pak
        igc_load_pak pak_name = (<HeadStructure>.pak)should_wait_on_unload = 0
    endif
    CreateCompositeObject {
        Components = [
            {
                Component = Suspend
                neversuspend
            }
            {
                Component = skeleton
                SkeletonName = (<HeadStructure>.skeleton)
            }
            {
                Component = AnimTree
                SkeletonName = (<HeadStructure>.skeleton)
                defaultcommandtarget = Blender
            }
            {
                Component = lockobj
                id = <ActorName>
            }
            {
                Component = ModelLightUpdate
            }
            {
                Component = Model
                usemodellights
                multicolor
                Model = (<HeadStructure>.Model)
                SkeletonName = (<HeadStructure>.skeleton)
            }
        ]
        params = {
            name = <HeadName>
        }
    }
    <ActorName> ::obj_getscaling
    <HeadName> ::obj_applyscaling Scale = <scaling>
    if (<ActorName> = skater)
        RefreshSkaterHead <HeadName> part = (<HeadStructure>.part_name)buildscript = replace_igc_skater_from_appearance
    endif
    igc_actor_management_script_execute {
        actor = <ActorName>
        ScriptName = head_off
        params = <HeadStructure>
    }
    <HeadName> ::anim_inittree {
        tree = igc_player_head_BaseAnimTree
        nodeiddeclaration = [
            Blender
            HeadTimer
            HeadSource
        ]
        params = {
            param_src = <ActorName>
        }
    }
    igc_update_head_animation actor = <ActorName>
endscript

script igc_find_head_anim 
    <mangle_checksum> = mission
    MangleChecksums a = <current_vo_checksum> b = <mangle_checksum>
    if anim_animexists anim = <mangled_id> ReferenceChecksum = <ReferenceChecksum>
        return {
            anim = <mangled_id>
            true
        }
    endif
    if anim_animexists anim = <current_vo_checksum> ReferenceChecksum = <ReferenceChecksum>
        return {
            anim = <current_vo_checksum>
            true
        }
    endif
    return \{ false }
endscript

script igc_update_head_animation 
    if NOT IsTrue igc_use_heads
        return 
    endif
    igc_get_actor_params actor = <actor>
    if NOT GotParam HeadStructure
        return 
    endif
    if NOT CompositeObjectExists <HeadName>
        return 
    endif
    <HeadName> ::obj_killspawnedscript name = igc_head_custom_anim_wait
    anim = default
    if IsTrue igc_play_head_anims
        if <actor> ::getsingletag igc_speaking
            anim = idle
            if igc_anchor ::getsingletag current_vo_checksum
                if igc_find_head_anim current_vo_checksum = <current_vo_checksum> ReferenceChecksum = (<HeadStructure>.skeleton)
                    igc_printf '- found VO anim for head \'%h\'' h = <HeadName>
                    <HeadName> ::obj_spawnscriptlater {
                        igc_head_custom_anim_wait
                        params = {
                            current_vo_checksum = <current_vo_checksum>
                            actor = <actor>
                            anim = <anim>
                            HeadName = <HeadName>
                        }
                    }
                endif
            endif
        endif
    endif
    igc_get_default_blend_period
    igc_play_head_anim {
        anim = <anim>
        timer_type = Cycle
        HeadName = <HeadName>
        BlendPeriod = <BlendPeriod>
    }
endscript

script igc_play_head_anim 
    igc_printf '- playing anim \'%a\' on head \'%h\'' a = <anim> h = <HeadName>
    <HeadName> ::anim_command {
        command = degenerateblend_addbranch
        blendduration = <BlendPeriod>
        params = {
            tree = igc_player_head_Branch_PlayAnim
            params = {
                param_timer_type = <timer_type>
                param_anim = <anim>
            }
        }
    }
endscript

script igc_head_custom_anim_wait 
    begin 
    if IsStreamPlaying <current_vo_checksum> consider_loading = 1
        break 
    endif
    wait 1 gameframes
    repeat 
    igc_play_head_anim {
        timer_type = play
        anim = <anim>
        HeadName = <HeadName>
        BlendPeriod = 0.2000
    }
    anim_command target = HeadTimer command = timer_wait
    obj_getid
    igc_printf '- anim wait on head \'%h\' finished' h = <ObjID>
    goto igc_update_head_animation params = { actor = <actor> }
endscript

script igc_head_cleanup 
    if NOT IsTrue \{ igc_use_heads }
        return 
    endif
    igc_get_actor_params actor = <actor>
    if NOT GotParam \{ HeadStructure }
        return 
    endif
    if CompositeObjectExists name = <HeadName>
        igc_printf '- removing hi-res head \'%h\'' h = <HeadName>
        <HeadName> ::Die
    endif
    if CompositeObjectExists name = <ActorName>
        igc_actor_management_script_execute {
            actor = <ActorName>
            ScriptName = head_on
            params = <HeadStructure>
        }
    endif
endscript

script igc_element_frame_advance 
    UnPauseGame
    PauseStream \{ 0 }
    wait \{ 1 gameframes }
    pausegame
    PauseStream \{ 1 }
endscript

script igc_process_element_dof 
    if GotParam \{ camera }
        if StructureContains \{ structure = camera DOF_Strength }
            igc_apply_dof strength = (<camera>.DOF_Strength)
            return 
        endif
    endif
    if GotParam \{ DOF_Strength }
        igc_apply_dof strength = <DOF_Strength>
    endif
endscript

script igc_apply_dof \{ strength = 0 }
    GlobalEffects_SetDOF {
        priority = 32
        id = igc_dof
        on = 1
        backdist = 255
        strength = <strength>
        crossfade = 128
    }
endscript

script igc_element_pause 
    if NOT ScreenElementExists id = igc_paused
        pausegame
        PauseStream 1
        IGC_current_dialog ::setprops {
            event_handlers = [
                { pad_choose NullScript }
            ]
            replace_handlers
        }
        IGC_current_dialog ::setprops {
            event_handlers = [
                { pad_right igc_element_frame_advance }
            ]
            replace_handlers
        }
        SetScreenElementLock id = igc_anchor Off
        CreateScreenElement {
            id = igc_paused
            parent = igc_anchor
            Pos = (320.0, 50.0)
            type = TextElement
            font = small
            Scale = 2.0
            rgba = [ 77 77 15 128 ]
            text = 'ZAPAUZOWANO'
            z_priority = 20
        }
    else
        UnPauseGame
        PauseStream 0
        DestroyScreenElement id = igc_paused
        IGC_current_dialog ::setprops {
            event_handlers = [
                { pad_choose igc_element_skip }
                { pad_right NullScript }
            ]
            replace_handlers
        }
    endif
endscript

script igc_element_play_stream 
    igc_anchor ::settags stream_current_checksum = <vo>
    if GotParam actor
        igc_get_actor_params actor = <actor>
        if (<use_fam> = 1)
            igc_printf '- playing FAM \'%s\'' s = <vo>
            igc_anchor ::settags stream_current_owner = <actor>
            <actor> ::obj_playfam <vo> vol = 700 priority = streamprioritysystem
            return 
        endif
    endif
    igc_printf '- playing stream \'%s\'' s = <vo>
    PlayStream <vo> vol = 700 priority = streamprioritysystem
endscript

script igc_element_stream_finished 
    if igc_anchor ::getsingletag \{ stream_current_owner }
        if <stream_current_owner> ::fam_ispreloading
            return \{ false }
        endif
    endif
    if igc_anchor ::getsingletag \{ stream_current_checksum }
        if NOT IsStreamPlaying <stream_current_checksum>
            return \{ true }
        endif
    endif
    return \{ false }
endscript

script igc_element_stop_stream 
    if igc_anchor ::getsingletag \{ stream_current_checksum }
        if igc_anchor ::getsingletag \{ stream_current_owner }
            <stream_current_owner> ::obj_stoplastfam
        else
            StopStream <stream_current_checksum>
        endif
    endif
    igc_anchor ::removetags \{[ stream_current_checksum stream_current_owner ]}
endscript

script igc_element_play {
        text = ' '
        skippable = 1
    }
    igc_temporarily_disable_input
    if GotParam vo
        igc_element_play_stream {
            vo = <vo>
            actor = <speaking_actor_name>
        }
        igc_anchor ::removetags [ current_vo_checksum ]
    else
        if NOT GotParam frames
            Play_hold = 1
            igc_printf 'No frames or VO found, holding...'
        endif
    endif
    if NOT IsTrue igc_debug_hold_camera
        if GotParam camera
            if GotParam speaking_actor_name
                if NOT StructureContains structure = camera LockTo
                    igc_printf 'Modifying camera to lock to speaker'
                    camera = {
                        <camera>
                        LockTo = <speaking_actor_name>
                    }
                endif
            endif
            igc_temporarily_disable_rendering 3 gameframes
            igc_gameside_callback_execute {
                ScriptName = play_camera
                params = {
                    <camera>
                    name = IGC_current_shot
                    Play_hold = 1
                }
                defaultscript = PlayIGCCam
            }
        endif
    endif
    igc_gameside_callback_execute {
        ScriptName = play_text
        params = <...> 
    }
    if NOT cd
        IGC_current_dialog ::setprops {
            event_handlers = [
                { pad_start igc_element_pause }
            ]
        }
    endif
    if (<skippable> = 0)
        if GotParam Play_hold
            if (<Play_hold> = 1)
                printstruct <...> 
                printf 'Mega IGC Warning: You can\'t have a non skippable shot with play_hold enabled'
                <skippable> = 1
            endif
        endif
    endif
    if (<skippable> = 1)
        IGC_current_dialog ::setprops {
            event_handlers = [
                { pad_choose igc_element_skip }
            ]
        }
        if cd
            IGC_current_dialog ::setprops {
                event_handlers = [
                    { pad_start igc_element_skip }
                ]
            }
        endif
    endif
    FireEvent type = focus target = IGC_current_dialog
    igc_process_shot_script <...> type = during
    igc_element_wait {
        Play_hold = <Play_hold>
        vo = <vo>
        frames = <frames>
        waitfor = <waitfor>
    }
    igc_do_transition_out
    igc_element_stop
endscript

script igc_element_skip 
    igc_gameside_callback_execute \{ ScriptName = stop_text }
    Debounce \{ x }
endscript

script igc_element_wait_frames 
    igc_anchor ::settags \{ currently_waiting_on_frames }
    wait <frames> frames
    igc_anchor ::removetags \{[ currently_waiting_on_frames ]}
endscript

script igc_element_wait Play_hold = 0
    if GotParam waitfor
        WaitForEvent type = <waitfor>
    else
        if GotParam frames
            igc_anchor ::obj_spawnscriptnow igc_element_wait_frames params = { frames = <frames> }
        endif
        begin 
        if (<Play_hold> = 0)
            if GotParam frames
                if NOT igc_anchor ::getsingletag currently_waiting_on_frames
                    break 
                endif
            else
                if igc_element_stream_finished
                    break 
                endif
            endif
        endif
        if NOT ScreenElementExists id = IGC_current_dialog
            break 
        endif
        wait 1 gameframes
        repeat 
    endif
endscript

script igc_kill_camera 
    igc_gameside_callback_execute \{ScriptName = stop_camera params = { name = IGC_current_shot }defaultscript = KillSkaterCamAnim}
endscript

script igc_element_stop 
    if NOT IsTrue \{ igc_debug_hold_camera }
        if NOT igc_anchor ::getsingletag \{ camera_holding }
            igc_kill_camera
        endif
    endif
    igc_element_skip
    igc_element_stop_stream
    igc_anchor ::obj_killspawnedscript \{ name = igc_element_wait_frames }
    igc_anchor ::removetags \{[ currently_waiting_on_frames ]}
endscript

script igc_temporarily_disable_input 
    Debounce \{ x }
    KillSpawnedScript \{ id = igc_input_toggle }
    spawnscriptnow \{TemporarilyDisableInput params = { time = 350 }id = igc_input_toggle}
endscript

script TemporarilyDisableInput \{ time = 1500 }
    OnExitRun \{ TemporarilyDisableInput_Reenable }
    SetButtonEventMappings \{ block_menu_input }
    wait <time>
endscript

script TemporarilyDisableInput_Reenable 
    SetButtonEventMappings \{ unblock_menu_input }
endscript

script igc_immediately_start_rendering 
    KillSpawnedScript \{ id = igc_render_toggle }
    startrendering
endscript

script igc_temporarily_disable_rendering 
    if NOT IsTrue \{ is_changing_levels }
        KillSpawnedScript \{ id = igc_render_toggle }
        spawnscriptnow igc_temporarily_disable_rendering_with_wait params = <...> id = igc_render_toggle
    endif
endscript

script igc_temporarily_disable_rendering_with_wait 
    stoprendering
    wait <...> 
    startrendering
endscript


script graffiti_goals_add_next_goal 
    Block \{ untilevent = goal_cam_anim_done }
    wait \{ 2 gameframes }
    if GotParam \{ fail }
        GoalManager_RemoveGoal name = <goal_id>
    endif
    PushMemProfile \{ 'Goals script' }
    graffiti_goals_add_goals zone = <zone>
    PopMemProfile
    if GotParam \{ graffiti_goal_id }
        GoalManager_InitializeGoal name = <graffiti_goal_id>
    endif
endscript
graffiti_goals_max_spots = 5
graffiti_goals_current_goal = null
graffiti_goals_num_required_per_zone = 3
graffiti_goals_areacomplete = 0

script graffiti_goals_add_goals 
    printf 'graffiti_goals_add_goals'
    if NOT InSplitScreenGame
        if GameModeEquals is_career
            <index> = 1
            <continue> = 0
            begin 
            if (<index> < 10)
                FormatText checksumname = node_flag 'NODEFLAG_%z_GRAFFITI_0%n' z = <zone> n = <index>
            else
                FormatText checksumname = node_flag 'NODEFLAG_%z_GRAFFITI_%n' z = <zone> n = <index>
            endif
            if NodeFlagExists <node_flag>
                if NOT GetNodeFlag <node_flag>
                    <continue> = 1
                    break 
                endif
            endif
            <index> = (<index> + 1)
            repeat (graffiti_goals_max_spots)
            if (<continue> = 0)
                getrandomvalue name = index a = 1 b = (graffiti_goals_max_spots)integer
                change graffiti_goals_areacomplete = 1
            else
                change graffiti_goals_areacomplete = 0
            endif
            if (<index> < 10)
                FormatText checksumname = trigger_obj_id '%z_TRG_Ped_GraffitiGoal0%n' z = <zone> n = <index>
                FormatText checksumname = restart_node '%z_TRG_Restart_GraffitiGoal0%n' z = <zone> n = <index>
                FormatText checksumname = trigger_plane '%z_TRGP_GraffitiGoalPre0%n' z = <zone> n = <index>
                FormatText checksumname = ped_tag '%z_TRGP_GraffitiGoalPedTag0%n' z = <zone> n = <index>
            else
                FormatText checksumname = trigger_obj_id '%z_TRG_Ped_GraffitiGoal%n' z = <zone> n = <index>
                FormatText checksumname = restart_node '%z_TRG_Restart_GraffitiGoal%n' z = <zone> n = <index>
                FormatText checksumname = trigger_plane '%z_TRGP_GraffitiGoalPre%n' z = <zone> n = <index>
                FormatText checksumname = ped_tag '%z_TRGP_GraffitiGoalPedTag%n' z = <zone> n = <index>
            endif
            if NOT IsInNodeArray <trigger_obj_id>
                return 
            endif
            if NOT IsInNodeArray <trigger_plane>
                return 
            endif
            if NOT IsInNodeArray <ped_tag>
                return 
            endif
            if NOT IsInNodeArray <restart_node>
                RemoveParameter restart_node
            endif
            <version> = (666 - <index>)
            FormatText checksumname = goal_id '%z_goal_gaps%v' z = <zone> v = <version>
            change graffiti_goals_current_goal = <goal_id>
            GetNode <trigger_obj_id>
            <trigger_pos> = ((<node>.Pos)+ (0.0, 60.0, 0.0))
            <trigger_head_pos> = ((<node>.Pos)+ (0.0, 120.0, 0.0))
            GetNode <trigger_plane>
            <look_at_pos> = (<node>.Pos)
            GetNode <restart_node>
            <skater_pos> = ((<node>.Pos)+ (0.0, 120.0, 0.0))
            graffiti_goals_edit_IGCs ped = <trigger_obj_id> ped_pos = <trigger_pos> ped_head_pos = <trigger_head_pos> graffiti_pos = <look_at_pos> skater_pos = <skater_pos> goal_id = <goal_id>
            graffiti_goals_check_duplicate_goal goal_id = <goal_id>
            if (<index> = (graffiti_goals_num_required_per_zone))
                FormatText checksumname = zone_checksum '%s' s = <zone>
                <goal_success_script> = graffiti_goals_unlock_zone_style
                <goal_success_params> = { zone_checksum = <zone_checksum> }
            endif
            AddGoal_Gaps {
                zone = <zone>
                version = <version>
                goal_text = 'Tagge den Spot! (\b0)'
                goal_description = 'Tagge den Spot! (\b0)'
                view_goals_text = 'Tagge den Spot! (\b0)'
                goal_flags = [ got_1 ]
                trigger_obj_id = <trigger_obj_id>
                restart_node = <restart_node>
                time = 60
                show_goal_timer
                intro_scene = graffiti_goals_intro_IGC
                ped_floater = graffiti_goals_ped_floater
                graffiti_goal
                trigger_plane = <trigger_plane>
                trigger_plane_pos = <look_at_pos>
                node_flag = <node_flag>
                control_type = walk
                goal_init_script = graffiti_goals_create_ped_tag
                goal_init_params = { ped_tag = <ped_tag> }
                goal_pre_start_script = graffiti_goals_create_trigger_plane
                goal_pre_start_params = { trigger_plane = <trigger_plane> }
                goal_success_script = <goal_success_script>
                goal_success_params = <goal_success_params>
                goal_deactivate_script = graffiti_goals_cleanup
                goal_deactivate_params = {trigger_plane = <trigger_plane> ped_tag = <ped_tag>}
                cash_reward = 20
            }
            return graffiti_goal_id = <goal_id>
        endif
    endif
endscript

script graffiti_goals_check_duplicate_goal 
    if GoalManager_GoalExists name = <goal_id>
        GoalManager_UninitializeGoal name = <goal_id>
        GoalManager_RemoveGoal name = <goal_id>
    endif
endscript

script graffiti_goals_unlock_zone_style 
    CareerFunc func = UnlockZoneGraffitiStyle params = { zone = <zone_checksum> }
endscript

script graffiti_goals_create_trigger_plane 
    Create name = <trigger_plane>
endscript

script graffiti_goals_create_ped_tag 
    Create name = <ped_tag>
    spawnscriptnow graffiti_goals_force_create params = { ped_tag = <ped_tag> }
endscript

script graffiti_goals_force_create 
    begin 
    if IsInNodeArray <ped_tag>
        Create name = <ped_tag>
    endif
    wait \{ 10 gameframes }
    repeat 10
endscript

script graffiti_goals_cleanup 
    if IsInNodeArray <trigger_plane>
        Kill name = <trigger_plane>
    endif
    if IsInNodeArray <ped_tag>
        Kill name = <ped_tag>
    endif
endscript
graffiti_goals_tagging = 0

script graffiti_goals_trigger type = stand
    Debounce triangle time = 0.5000
    <version> = (666 - <num>)
    if NOT GetCurrentZoneName
        printf 'graffiti_goals_trigger: no current zone?'
        return 
    endif
    FormatText checksumname = goal_id '%z_goal_gaps%v' z = <zone_name> v = <version>
    GoalManager_GetGoalTime name = <goal_id>
    if (<goal_time> < 1)
        return 
    endif
    if GoalManager_GoalIsActive name = <goal_id>
        if triggertype graffiti onto
            if ((graffiti_goals_tagging)= 0)
                change graffiti_goals_tagging = 1
                skater ::TagClearFlagsScript
                KillTextureSplats all
                PreAllocSplats
                GoalManager_EditGoal name = <goal_id> params = { tag_stance = <type> }
                PlayIGCScene graffiti_goals_outro_IGC goal_id = <goal_id>
                GoalManager_SetGoalFlag name = <goal_id> got_1 1
                change graffiti_goals_tagging = 0
            endif
        endif
    endif
endscript

script graffiti_goals_taganim 
    KillTextureSplats all
    PreAllocSplats
    GoalManager_GetGoalParams name = <goal_id>
    switch <tag_stance>
        case stand
        <anim> = Standing_Tag2
        case hang
        <anim> = Wallgrab_Tag
        case Ground
        <anim> = Standing_Tag_Ground
    endswitch
    skater ::TurnOnSpecialItem specialitem_details = spraycan_details
    skater ::SprayPaintOn
    skater ::obj_spawnscriptlater THUG2_SFX_Tag_Spray_Wallplant
    Skater_Playanim anim = <anim>
    Skater_WaitAnimFinished
    Kill name = <trigger_plane>
    ChangeNodeFlag <node_flag> 1
    skater ::obj_spawnscriptlater THUG2_SFX_Tag_Spray_Wallplant
    Skater_Playanim anim = <anim>
    Skater_WaitAnimFinished
    skater ::obj_spawnscriptlater THUG2_SFX_Tag_Spray_Wallplant
    Skater_Playanim anim = <anim> Cycle
    Block
endscript

script graffiti_goals_turn_off_item 
    begin 
    skater ::SprayPaintOff
    skater ::TurnOffSpecialItem
    wait \{ 1 gameframe }
    repeat 10
endscript
graffiti_goals_intro_IGC = {}
graffiti_goals_outro_IGC = {}
graffiti_test_igc_template = {
    default_direction = calm
    default_look_at_enabled = 1
    actor_directions = [
        {
            ActorNum = 1
            lookat = { ActorNum = 2 }
        }
    ]
}
goals_laststream = 0

script goals_handlestream 
    play_vo_sound_killall
    StopStream (goals_laststream)
    if GotParam \{ stream }
        PlayStream <stream> vol = 125 priority = 103
        change goals_laststream = <stream>
    endif
    if GotParam \{ create_menu }
        goal_graffiti_goals_create_menu
    endif
endscript

script graffiti_goals_edit_IGCs 
    graffiti_challenge = [
        {
            text = 'Hilf mir, etwas Farbe hier reinzubringen.'
            stream = graffiti_challenge_0_lip
        }
        {
            text = 'Hilf mir, diesen Ort zu verschönern.'
            stream = graffiti_challenge_2_lip
        }
    ]
    graffiti_success = [
        {
            text = 'Gut gemacht, Bruder! Ich bin weg. Komm mich besuchen, wenn du noch was für die Kunst tun willst.'
            stream = graffiti_success_0_lip
        }
        {
            text = 'Gut gemacht! Komm mich besuchen, wenn du noch mehr taggen willst, du findest mich überall. Bis später.'
            stream = graffiti_success_1_lip
        }
        {
            text = 'Nett! Komm später wieder vorbei, dann betätigen wir uns noch weiter künstlerisch. Peace.'
            stream = graffiti_success_2_lip
        }
    ]
    GetArraySize <graffiti_challenge>
    getrandomvalue name = graffiti_challenge_index a = 0 b = (<array_size> -1)integer
    challenge_shot_text = (<graffiti_challenge> [ <graffiti_challenge_index> ].text)
    challenge_shot_stream = (<graffiti_challenge> [ <graffiti_challenge_index> ].stream)
    change graffiti_goals_intro_IGC = {
        name = 'graffiti_intro_igc'
        template = igc_template_conversation2
        scene_setup = {
            transition = igc_transition_fade
            Actors = [
                {template = ped_m_actor ActorName = <ped>}
                { template = skater_actor }
            ]
            actor_positions = [
                {
                    ActorName = skater
                    Pos = <restart_pos>
                }
            ]
        }
        shot_params = [
            {
                camera = {
                    Pos = <skater_pos>
                    lookatpos = <ped_pos>
                    FOV = 72.0
                    LockTo = world
                    Quat = (0.0, 0.0, 0.0)
                }
                text = <challenge_shot_text>
                shot_script = goals_handlestream
                shot_script_params = { stream = <challenge_shot_stream> }
                frames = 150
                skippable = 1
            }
            {
                camera = {
                    Pos = <skater_pos>
                    lookatpos = <graffiti_pos>
                    FOV = 72.0
                    LockTo = world
                    Quat = (0.0, 0.0, 0.0)
                }
                text = 'Kannst du wohl mein Graffiti da oben anbringen? (\b0)'
                shot_script = goals_handlestream
                shot_script_params = { stream = graffiti_challenge_1_lip }
                frames = 150
                skippable = 1
            }
        ]
    }
    GetArraySize <graffiti_success>
    getrandomvalue name = graffiti_success_index a = 0 b = (<array_size> -1)integer
    success_shot_text = (<graffiti_success> [ <graffiti_success_index> ].text)
    success_shot_stream = (<graffiti_success> [ <graffiti_success_index> ].stream)
    change graffiti_goals_outro_IGC = {
        name = 'graffiti_outro_igc'
        template = graffiti_test_igc_template
        end_script = graffiti_goals_turn_off_item
        scene_setup = {
            transition = igc_transition_fade
            Actors = [
                {template = ped_m_actor ActorName = <ped>}
                { template = skater_actor }
            ]
            actor_behaviors = [
                {ActorNum = 2 behavior = {ScriptName = graffiti_goals_taganim params = { goal_id = <goal_id> }}}
            ]
        }
        shot_params = [
            {
                camera = {
                    Pos = <ped_head_pos>
                    lookatpos = <graffiti_pos>
                    FOV = 72.0
                    LockTo = world
                    Quat = (0.0, 0.0, 0.0)
                }
                text = <success_shot_text>
                shot_script = goals_handlestream
                shot_script_params = { stream = <success_shot_stream> }
                frames = 220
                skippable = 0
            }
        ]
    }
endscript
graffiti_goals_pre_IGC = {}

script graffiti_goals_edit_pre_IGC 
    printf 'graffiti_goals_edit_pre_IGC'
    <firsttime> = 0
    if NOT ((GetNodeFlag NODEFLAG_Z_HO_GRAFFITI_01)|| (GetNodeFlag NODEFLAG_Z_BH_GRAFFITI_01)|| 
        (GetNodeFlag NODEFLAG_Z_DT_GRAFFITI_01)|| (GetNodeFlag NODEFLAG_Z_SM_GRAFFITI_01))
        <firsttime> = 1
    endif
    if (<firsttime> = 1)
        <igc_text_0> = 'Ich bin Muton. Wusstes du, dass du Wände taggen (\b0) kannst? Das geht auch, während du an einem Mauervorsprung hängst oder auch am Boden.'
        play_vo_sound_killall ped_vo_type = 'graffiti_'
        <igc_shot_script_0> = goals_handlestream
        <igc_shot_script_params_0> = { stream = graffiti_firsttime_lip }
    else
        <igc_text_0> = 'Yo, Tagger.'
        <igc_shot_script_0> = play_vo_sound_killall
        <igc_shot_script_params_0> = {ped_vo_type = 'graffiti_' play_generic play_lasttime}
    endif
    <igc_shot_script_1> = goals_handlestream
    if (<firsttime> = 1)
        <igc_text_1> = 'Bei mir kannst du deine eigene Grafik erstellen oder mir helfen, meinen Kram fertig zu kriegen. Ich versorg dich auch mit neuen Styles.'
        <igc_shot_script_stream_1> = graffiti_intro_lip
    else
        if (graffiti_goals_areacomplete = 1)
            graffiti_areacomplete = [
                {
                    text = 'Du hast jetzt alle Styles, die du hier brauchst. Kümmer dich jetzt um deinen eigenen Kram oder komm ich in einem anderen Stadtteil besuchen, dann hab ich noch was für dich.'
                    stream = graffiti_areacomplete_0_lip
                }
                {
                    text = 'Du hast alle Styles, die du momentan brauchst. Kümmer dich um deinen deine Tags oder besuch mich woanders, dann hab ich noch was für dich.'
                    stream = graffiti_areacomplete_1_lip
                }
                {
                    text = 'Du hast alle Grafiken, die du brauchst. Arbeite an deiner Grafik oder besuch mich woanders, dann hab ich wieder was für dich.'
                    stream = graffiti_areacomplete_2_lip
                }
            ]
            GetArraySize <graffiti_areacomplete>
            getrandomvalue name = graffiti_areacomplete_index a = 0 b = (<array_size> -1)integer
            <igc_text_1> = (<graffiti_areacomplete> [ <graffiti_areacomplete_index> ].text)
            <igc_shot_script_stream_1> = (<graffiti_areacomplete> [ <graffiti_areacomplete_index> ].stream)
        else
            graffiti_choice = [
                {
                    text = 'Was willst du machen? Mir bei den Tags helfen oder lieber selbst was machen?'
                    stream = graffiti_choice_0_lip
                }
                {
                    text = 'Und was jetzt? Hilfst du mir oder machst du deinen eigenen Kram?'
                    stream = graffiti_choice_1_lip
                }
                {
                    text = 'Was steht an? Hilfst du mir oder machst du dein eigenes Ding?'
                    stream = graffiti_choice_2_lip
                }
            ]
            GetArraySize <graffiti_choice>
            getrandomvalue name = graffiti_choice_index a = 0 b = (<array_size> -1)integer
            <igc_text_1> = (<graffiti_choice> [ <graffiti_choice_index> ].text)
            <igc_shot_script_stream_1> = (<graffiti_choice> [ <graffiti_choice_index> ].stream)
        endif
    endif
    igc_shot_script_params_1 = {stream = <igc_shot_script_stream_1> create_menu}
    change graffiti_goals_pre_IGC = {
        name = 'graffiti_pre_igc'
        template = igc_template_conversation2
        scene_setup = {
            transition = igc_transition_fade
            Actors = [
                {template = ped_m_actor ActorName = <ped>}
                { template = skater_actor }
            ]
            actor_positions = [
                {
                    ActorName = skater
                    Pos = <restart_pos>
                    lookatpos = <ped_pos>
                }
            ]
        }
        shot_params = [
            {
                camera = {
                    Pos = (<restart_pos> + (0.0, 80.0, 0.0))
                    lookatpos = (<ped_pos> + (0.0, -80.0, 0.0))
                    FOV = 72.0
                    LockTo = world
                    Quat = (0.0, 0.0, 0.0)
                }
                frames = 600
                skippable = 1
                text = <igc_text_0>
                shot_script = <igc_shot_script_0>
                shot_script_params = <igc_shot_script_params_0>
            }
            {
                camera = {
                    Pos = (<restart_pos> + (0.0, 80.0, 0.0))
                    lookatpos = (<ped_pos> + (0.0, -80.0, 0.0))
                    FOV = 72.0
                    LockTo = world
                    Quat = (0.0, 0.0, 0.0)
                }
                Play_hold = 1
                text = <igc_text_1>
                shot_script = <igc_shot_script_1>
                shot_script_params = <igc_shot_script_params_1>
            }
        ]
    }
endscript
goal_graffiti_pre_running = 0

script goal_graffiti_pre_launch 
    change goal_graffiti_pre_running = 1
    skater ::PausePhysics
    skater ::disableplayerinput
    GoalManager_GetGoalParams name = <goal_id>
    Debounce Circle time = 0.5000
    speech_box_exit anchor_id = goal_start_dialog
    kill_start_key_binding
    GoalManager_ResetGoalTrigger name = <goal_id> no_new_exceptions
    StartDelaySystemUI
    igc_fadeout
    StopDelaySystemUI
    hide_all_hud_items
    skater ::KillSkater node = <restart_node> RestartWalking
    MakeSkaterGoto goal_graffiti_hold_skater
    GetNode <trigger_obj_id>
    <ped_pos> = ((<node>.Pos)+ (0.0, 120.0, 0.0))
    GetNode <restart_node>
    <restart_pos> = (<node>.Pos)
    graffiti_goals_edit_pre_IGC ped = <trigger_obj_id> ped_pos = <ped_pos> restart_pos = <restart_pos> goal_id = <goal_id>
    PlayIGCScene graffiti_goals_pre_IGC goal_id = <goal_id>
    Debounce Circle time = 0.5000
    speech_box_exit anchor_id = goal_start_dialog
    GoalManager_ResetGoalTrigger name = <goal_id> no_new_exceptions
    goal_graffiti_unhold_skater
    show_all_hud_items
    skater ::UnPausePhysics
    skater ::enableplayerinput
    change goal_graffiti_pre_running = 0
endscript

script goal_graffiti_goals_create_menu 
    OnExitRun goal_graffiti_goals_kill_menu
    make_label_menu {
        Pos = (320.0, 100.0)
        spacing = 12
        pad_back_script = NullScript
        just = [ RIGHT ]
        menu_id = graffiti_goals_menu
        vmenu_id = graffiti_goals_vmenu
    }
    if (graffiti_goals_areacomplete = 0)
        add_label_menu_item {
            text = 'ZUSAMMEN ARBEITEN '
            rot = 2
            Length = 200
            pad_choose_script = NullScript
        }
    endif
    add_label_menu_item {
        text = 'MACH-DIR-DIE-GRAFIK'
        rot = -3
        Length = 200
        pad_choose_script = NullScript
    }
    add_label_menu_item {
        text = 'VERLASSEN'
        rot = -3
        Length = 200
        pad_choose_script = NullScript
    }
    FireEvent type = focus target = graffiti_goals_menu
    Block
endscript

script goal_graffiti_goals_kill_menu 
    graffiti_goals_vmenu ::getsingletag \{ tag_selected_index }
    goals_handlestream
    if (graffiti_goals_areacomplete = 1)
        <tag_selected_index> = (<tag_selected_index> + 1)
    endif
    GoalManager_EditGoal name = (graffiti_goals_current_goal)params = { continue_to = <tag_selected_index> }
    DestroyScreenElement \{ id = graffiti_goals_menu }
endscript

script goal_graffiti_hold_skater 
    setrollingfriction \{ 1000 }
    ResetSkaterParticleSystems
    SkaterInit
    if walking
        <anim1> = WStand
    else
        <anim1> = SkateToStand
    endif
    Obj_ClearExceptions
    Skater_Playanim anim = <anim1>
    Skater_WaitAnimFinished
    Skater_Playanim \{ anim = WStand }
    Skater_WaitAnimFinished
endscript

script goal_graffiti_unhold_skater 
    skater ::setrollingfriction \{ default }
endscript

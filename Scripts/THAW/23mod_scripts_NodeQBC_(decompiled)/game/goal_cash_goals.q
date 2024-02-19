cash_goals_num_goal_peds = 10
cash_goals_last_goal_ped = -1
cash_goals_last_goal = -1
cash_goals_available_goals = [
    cash_goals_add_count_tricks
    cash_goals_add_high_combo
    cash_goals_add_hold_trick
    cash_goals_add_find_gaps
    cash_goals_add_skatetris
    cash_goals_add_tricktris
    cash_goals_add_combotris
    cash_goals_add_mod_tricks
]

script cash_goals_add_next_goal 
    printf \{ 'cash_goals_add_next_goal' }
    Block \{ untilevent = goal_cam_anim_done }
    wait \{ 2 gameframes }
    if GotParam \{ fail }
        GoalManager_RemoveGoal name = <goal_id>
    endif
    PushMemProfile \{ 'Goals script' }
    cash_goals_add_goals zone = <zone>
    PopMemProfile
    GoalManager_InitializeGoal name = <cash_goal_id>
endscript

script cash_goals_add_goals 
    printf 'cash_goals_add_goals'
    if NOT cd
        begin 
        if IsCreated skater
            break 
        endif
        wait 1 gameframe
        repeat 
    endif
    if NOT InSplitScreenGame
        if GameModeEquals is_career
            getrandomvalue name = ped_num a = 1 b = (cash_goals_num_goal_peds)integer
            if (<ped_num> = (cash_goals_last_goal_ped))
                <ped_num> = (<ped_num> + 1)
                if (<ped_num> > (cash_goals_num_goal_peds))
                    <ped_num> = 1
                endif
            endif
            change cash_goals_last_goal_ped = <ped_num>
            if (<ped_num> < 10)
                FormatText checksumname = ped_name '%z_TRG_Ped_CashGoal%f%n' z = <zone> f = 0 n = <ped_num>
                FormatText checksumname = restart_name '%z_TRG_Restart_CashGoal%f%n' z = <zone> f = 0 n = <ped_num>
            else
                FormatText checksumname = ped_name '%z_TRG_Ped_CashGoal%n' z = <zone> n = <ped_num>
                FormatText checksumname = restart_name '%z_TRG_Restart_CashGoal%n' z = <zone> n = <ped_num>
            endif
            if NOT IsInNodeArray <ped_name>
                <ped_num> = 1
                change cash_goals_last_goal_ped = <ped_num>
                FormatText checksumname = ped_name '%z_TRG_Ped_CashGoal%f%n' z = <zone> f = 0 n = <ped_num>
                FormatText checksumname = restart_name '%z_TRG_Restart_CashGoal%f%n' z = <zone> f = 0 n = <ped_num>
            endif
            if NOT IsInNodeArray <ped_name>
                return 
            endif
            GetArraySize cash_goals_available_goals
            getrandomvalue name = index a = 0 b = (<array_size> - 1)integer
            if (<index> = (cash_goals_last_goal))
                <index> = (<index> + 1)
                if (<index> = <array_size>)
                    <index> = 0
                endif
            endif
            change cash_goals_last_goal = <index>
            (cash_goals_available_goals [ <index> ])zone = <zone> ped = <ped_name> restart = <restart_name>
            return cash_goal_id = <goal_id>
        endif
    endif
endscript

script cash_goals_check_duplicate_goal 
    if GoalManager_GoalExists name = <goal_id>
        GoalManager_GetTimesWonGoal name = <goal_id>
        GoalManager_UninitializeGoal name = <goal_id>
        GoalManager_RemoveGoal name = <goal_id>
        return times_won = <times_won>
    endif
endscript

script cash_goals_reinit_goal_ped 
    wait \{ 30 gameframes }
    if IsTrue \{ igc_playing }
        Block \{ type = igc_scene_finished }
    endif
    begin 
    if SkaterCamAnimFinished
        break 
    endif
    wait \{ 1 gameframe }
    repeat 
    if GoalManager_GoalExists name = <goal_id>
        if GoalManager_GoalInitialized name = <goal_id>
            printf \{ 'CASH GOAL RE-INITIALIZING GOAL PED' }
            GoalManager_InitGoalTrigger name = <goal_id>
        endif
    endif
endscript

script cash_goals_init_count_tricks 
    <tricks_easy> = [
        'Kickflip'
        'Heelflip'
        'No Comply'
        'Boneless'
        'Melon'
        'Indy'
        'Manual'
        'Nose Manual'
        'Impossible'
        'Pop Shove-It'
        'Tailgrab'
        'Nosegrab'
    ]
    <tricks_med> = [
        'Hardflip'
        'Inward Heelflip'
        'Varial Kickflip'
        'Varial Heelflip'
        'Double Kickflip'
        'Double Heelflip'
        'Double Impossible'
        '360 Shove-It'
        'Japan'
        'Madonna'
        'Benihana'
        'Airwalk'
        'Method'
        'Stiffy'
        'One Foot Tailgrab'
        'Rocket Air'
        'FS 50-50'
        'BS 50-50'
        'BS Boardslide'
        'FS Boardslide'
    ]
    <tricks_hard> = [
        'FS 5-0'
        'BS 5-0'
        'FS Nosegrind'
        'BS Nosegrind'
        'FS Crooked'
        'BS Crooked'
        'FS Smith'
        'BS Smith'
        'FS Noseslide'
        'BS Noseslide'
        'FS Tailslide'
        'BS Tailslide'
        'FS Feeble'
        'BS Feeble'
        'FS Lipslide'
        'BS Lipslide'
        '360 Hardflip'
        '360 Heelflip'
        '360 Flip'
        '360 Inward Heelflip'
        'Christ Air'
        'One Foot Japan'
        'Judo'
        'Sacktap'
    ]
    GoalManager_GetTimesWonGoal name = <goal_id>
    if (<times_won> > 4)
        <tricks> = <tricks_hard>
        <number> = 3
        <time> = 60
        <cash_reward> = 75
        shot_text = [
            {
                text = 'Hmm... Twoja znajomoæ trików jest naprawdê wporz.  Muszê wymyliæ co trudniejszego.'
                stream = count_tricks_hard_1_lip
            }
            {
                text = 'Wymieniê jaki naprawdê trudny trik, a ty nie pytaj mnie, jak go siê wykonuje.'
                stream = count_tricks_hard_2_lip
            }
            {
                text = 'Na pewno zas³ugujesz na tê kasê, jeli uda ci siê wykonaæ je parê razy'
                stream = count_tricks_hard_3_lip
            }
        ]
    else
        if (<times_won> > 2)
            <tricks> = <tricks_med>
            <number> = 3
            <time> = 60
            <cash_reward> = 50
            shot_text = [
                {
                    text = 'Sporo wiesz o trikach. Od teraz bêdzie nieco trudniej.'
                    stream = count_tricks_med_1_lip
                }
                {
                    text = 'Wymieniê trudniejszy trik, ale nie powiem ci, jak go wykonaæ.'
                    stream = count_tricks_med_2_lip
                }
                {
                    text = 'Wykonaj ten trik parê razy, a odejdziesz st¹d bogatszy o parê zielonych.'
                    stream = count_tricks_med_3_lip
                }
            ]
        else
            <tricks> = <tricks_easy>
            <number> = 3
            <time> = 60
            <cash_reward> = 25
            shot_text = [
                {
                    text = 'Mylisz, ¿e jeste niez³y, co?  No to sprawdmy twoj¹ wiedzê o trikach.'
                    stream = count_tricks_easy_1_lip
                }
                {
                    text = 'Wymieniê trik, ale nie powiem ci, jak go wykonaæ.'
                    stream = count_tricks_easy_2_lip
                }
                {
                    text = 'Dostaniesz kasê, jeli dasz radê wykonaæ parê takich trików.'
                    stream = count_tricks_easy_3_lip
                }
            ]
        endif
    endif
    GetArraySize tricks
    getrandomvalue name = index a = 0 b = (<array_size> - 1)integer
    <ability_index> = 0
    <learned_abilities> = [
        {
            name = 'Boneless'
            ability = Boneless
        }
        {
            name = 'Manual'
            ability = Manual
        }
        {
            name = 'Nose Manual'
            ability = Manual
        }
    ]
    begin 
    printf 'CASH GOAL TESTING: %s' s = (<tricks> [ <index> ])
    if ((<tricks> [ <index> ])= (<learned_abilities> [ <ability_index> ].name))
        if NOT skater ::AbilityEnabled (<learned_abilities> [ <ability_index> ].ability)
            <index> = (<index> + 1)
            if (<index> = <array_size>)
                <index> = 0
            endif
            <ability_index> = 0
        else
            break 
        endif
    else
        <ability_index> = (<ability_index> + 1)
        if (<ability_index> = 3)
            break 
        endif
    endif
    repeat 100
    printf 'CASH GOAL SETTLED ON: %s' s = (<tricks> [ <index> ])
    FormatText textname = goal_text 'Zrób %t %n razy w %s sekund.' t = (<tricks> [ <index> ])n = <number> s = <time>
    GoalManager_EditGoal name = <goal_id> params = {
        goal_text = <goal_text>
        number = <number>
        hud_counter_caption = (<tricks> [ <index> ])
        collect_type = (<tricks> [ <index> ])
        time = <time>
        trick_text = (<tricks> [ <index> ])
        cash_reward = <cash_reward>
    }
    cash_goals_edit_IGCs {
        ped_name = <ped_name>
        restart_name = <restart_name>
        shot_text = <shot_text>
        igc_name = 'count_tricks'
    }
    KillSpawnedScript name = cash_goals_reinit_goal_ped
    SpawnScriptLater cash_goals_reinit_goal_ped params = { goal_id = <goal_id> }
endscript

script cash_goals_add_count_tricks 
    printf 'cash_goals_add_count_tricks'
    FormatText checksumname = goal_id '%z_goal_counter999' z = <zone>
    cash_goals_check_duplicate_goal goal_id = <goal_id>
    AddGoal_Counter {
        ped_vo_type = 'cash_'
        ped_vo_action = 'count_'
        init_script = cash_goals_init_count_tricks
        init_script_params = {goal_id = <goal_id> ped_name = <ped> restart_name = <restart> zone = <zone>}
        times_won = <times_won>
        zone = <zone>
        version = 999
        goal_text = 'Niewywo³ane liczenie trików dla kasy.'
        goal_description = 'Udowodnij, ¿e znasz parê trików.\nZarób trochê kasy.'
        full_name = 'Losowy kole'
        trigger_obj_id = <ped>
        restart_node = <restart>
        intro_scene = cash_goals_intro_IGC
        success_scene = cash_goals_success_IGC
        fail_scene = cash_goals_fail_IGC
        number = 1
        use_hud_counter
        hud_counter_caption = 'Nieautoryzowany napis na wywietlaczu.'
        show_midgoal_msg
        collect_type = 'Uninitialized collect type.'
        show_goal_timer
        time = 10
        count_tricks
        goal_type_checksum = count_tricks
        trick_text = 'Uninitialized'
        by_name
        cash_goal
        cash_reward = 20
        ped_floater = cash_goals_ped_floater
    }
    return goal_id = <goal_id>
endscript

script cash_goals_init_high_combo 
    GoalManager_GetTimesWonGoal name = <goal_id>
    if (<times_won> > 4)
        getrandomvalue name = Score a = 16 b = 40 integer
        <Score> = (<Score> * 1000)
        <cash_reward> = 75
        <time> = 60
        shot_text = [
            {
                text = 'Có¿, jeste niez³y.  Ale zastanawiam siê, jak radzisz sobie z combosami.'
                stream = high_combo_hard_1_lip
            }
            {
                text = 'Teraz bêdzie trudne. Jeli potrafisz zrobiæ trudne wysokie combo, dam ci trochê szmalu.'
                stream = high_combo_hard_2_lip
            }
        ]
    else
        if (<times_won> > 2)
            getrandomvalue name = Score a = 8 b = 20 integer
            <Score> = (<Score> * 1000)
            <cash_reward> = 50
            <time> = 60
            shot_text = [
                {
                    text = 'Jeste niez³y.  Zobaczmy, czy twoje combosy siê poprawi³y.'
                    stream = high_combo_med_1_lip
                }
                {
                    text = 'Podniemy poprzeczkê.  Jak chcesz zarobiæ, musisz wysma¿yæ rednie combo.'
                    stream = high_combo_med_2_lip
                }
            ]
        else
            getrandomvalue name = Score a = 2 b = 10 integer
            <Score> = (<Score> * 1000)
            <cash_reward> = 25
            <time> = 60
            shot_text = [
                {
                    text = 'Wiêc chcesz sprawdziæ swoje umiejêtnoci? Sprawdmy, jakie combo potrafisz wykonywaæ.'
                    stream = high_combo_easy_1_lip
                }
                {
                    text = 'Zaczniemy od czego ³atwego.  Wyczesz ³atwiutkie combo, a dostaniesz kasê.'
                    stream = high_combo_easy_2_lip
                }
            ]
        endif
    endif
    FormatText textname = goal_text 'Wykonaj combo za %s punktów w ci¹gu %t sekund.' s = <Score> t = <time>
    GoalManager_EditGoal name = <goal_id> params = {
        cash_reward = <cash_reward>
        goal_text = <goal_text>
        Score = <Score>
        time = <time>
    }
    cash_goals_edit_IGCs {
        ped_name = <ped_name>
        restart_name = <restart_name>
        shot_text = <shot_text>
        igc_name = 'high_combo'
    }
    KillSpawnedScript name = cash_goals_reinit_goal_ped
    SpawnScriptLater cash_goals_reinit_goal_ped params = { goal_id = <goal_id> }
endscript

script cash_goals_add_high_combo 
    printf 'cash_goals_add_high_combo'
    FormatText checksumname = goal_id '%z_goal_highcombo999' z = <zone>
    cash_goals_check_duplicate_goal goal_id = <goal_id>
    AddGoal_HighCombo {
        ped_vo_type = 'cash_'
        ped_vo_action = 'combo_'
        init_script = cash_goals_init_high_combo
        init_script_params = {goal_id = <goal_id> ped_name = <ped> restart_name = <restart> zone = <zone>}
        times_won = <times_won>
        zone = <zone>
        version = 999
        goal_text = 'Nierozpoczêty.'
        goal_description = 'Udowodnij, ¿e znasz siê na combo.\nZarób trochê kasy.'
        trigger_obj_id = <ped>
        full_name = 'Losowy kole'
        restart_node = <restart>
        intro_scene = cash_goals_intro_IGC
        success_scene = cash_goals_success_IGC
        fail_scene = cash_goals_fail_IGC
        Score = 10
        show_goal_timer
        time = 10
        cash_goal
        ped_floater = cash_goals_ped_floater
    }
    return goal_id = <goal_id>
endscript

script cash_goals_init_hold_trick 
    GoalManager_GetTimesWonGoal name = <goal_id>
    <tricks_easy> = [
        {
            id = SlideOrGrind
            text = 'lizg czy grind'
        }
        {
            id = Manual
            text = 'Manual'
        }
        {
            id = skitch
            text = 'Skitch'
        }
    ]
    <tricks_med> = [
        {
            id = grind
            text = 'Grind'
        }
        {
            id = slide
            text = 'lizg'
        }
        {
            id = lip
            text = 'Lip'
        }
        {
            id = focus
            text = 'Focus'
        }
        {
            id = stall
            text = 'Stall'
        }
        {
            id = spin
            text = 'Spin'
        }
    ]
    <tricks_hard> = [
        {
            id = grind
            text = 'Grind'
        }
        {
            id = Manual
            text = 'Manual'
        }
        {
            id = skitch
            text = 'Skitch'
        }
        {
            id = slide
            text = 'lizg'
        }
        {
            id = lip
            text = 'Lip'
        }
        {
            id = focus
            text = 'Focus'
        }
        {
            id = stall
            text = 'Stall'
        }
        {
            id = spin
            text = 'Spin'
        }
    ]
    if (<times_won> > 4)
        <tricks> = <tricks_hard>
        <time> = 60
        <cash_reward> = 75
        <hold_time> = 15
        shot_text = [
            {
                text = 'Dobra, nie jeste taki kiepski.  Zobaczmy jak d³ugo potrafisz utrzymaæ parê trików.'
                stream = hold_tricks_hard_1_lip
            }
            {
                text = 'Czas na co trudnego.  Jeli chcesz wyci¹gn¹æ ode mnie kasê, musisz naprawdê d³ugo utrzymaæ ten trik.'
                stream = hold_tricks_hard_2_lip
            }
        ]
    else
        if (<times_won> > 2)
            <tricks> = <tricks_med>
            <time> = 60
            <cash_reward> = 50
            <hold_time> = 10
            shot_text = [
                {
                    text = 'Potrafisz conieco. Zastanawiam siê, jak d³ugo potrafisz utrzymaæ trik.'
                    stream = hold_tricks_med_1_lip
                }
                {
                    text = 'Teraz bêdzie trochê trudniej. Mam dla ciebie kasê, jeli potrafisz utrzymaæ ten trik.'
                    stream = hold_tricks_med_2_lip
                }
            ]
        else
            <tricks> = <tricks_easy>
            <time> = 60
            <cash_reward> = 25
            <hold_time> = 5
            shot_text = [
                {
                    text = 'Mylisz, ¿e jeste kozak, co? Zobaczymy jak d³ugo potrafisz utrzymaæ trik.'
                    stream = hold_tricks_easy_1_lip
                }
                {
                    text = 'Na pocz¹tek bêdê ³agodny. Utrzymaj ten prosty trik przez parê sekund, a ja ci zap³acê.'
                    stream = hold_tricks_easy_2_lip
                }
            ]
        endif
    endif
    GetArraySize tricks
    getrandomvalue name = index a = 0 b = (<array_size> - 1)integer
    if ChecksumEquals a = (<tricks> [ <index> ].id)b = skitch
        printf 'TESTING: skitch'
        if ((<zone> = 'z_sm')|| (<zone> = 'z_oi')|| (<zone> = 'z_el')|| (<zone> = 'z_lv'))
            printf 'IN NO CAR LEVEL: %z' z = <zone>
            <index> = (<index> + 1)
            if (<index> = <array_size>)
                <index> = 0
            endif
        endif
    endif
    printf 'CONTINUING WITH: %s' s = (<tricks> [ <index> ].text)
    <ability_index> = 0
    <learned_abilities> = [
        {
            name = 'Manual'
            ability = Manual
        }
        {
            name = 'Skitch'
            ability = skitch
        }
        {
            name = 'Focus'
            ability = focus
        }
        {
            name = 'Stall'
            ability = stall
        }
        {
            name = 'Spin'
            ability = Natas
        }
    ]
    begin 
    printf 'TESTING: %s' s = (<tricks> [ <index> ].text)
    if ((<tricks> [ <index> ].text)= (<learned_abilities> [ <ability_index> ].name))
        if NOT skater ::AbilityEnabled (<learned_abilities> [ <ability_index> ].ability)
            <index> = (<index> + 1)
            if (<index> = <array_size>)
                <index> = 0
            endif
            <ability_index> = 0
        else
            break 
        endif
    else
        <ability_index> = (<ability_index> + 1)
        if (<ability_index> = 5)
            break 
        endif
    endif
    repeat 100
    printf 'SETTLED ON: %s' s = (<tricks> [ <index> ].text)
    FormatText textname = goal_text 'Wykonuj %t przez %s sekund.' t = (<tricks> [ <index> ].text)s = <hold_time>
    GoalManager_EditGoal name = <goal_id> params = {
        cash_reward = <cash_reward>
        goal_text = <goal_text>
        trick_type = (<tricks> [ <index> ].id)
        trick_time = <hold_time>
        time = <time>
    }
    cash_goals_edit_IGCs {
        ped_name = <ped_name>
        restart_name = <restart_name>
        shot_text = <shot_text>
        igc_name = 'hold_trick'
    }
    KillSpawnedScript name = cash_goals_reinit_goal_ped
    SpawnScriptLater cash_goals_reinit_goal_ped params = { goal_id = <goal_id> }
endscript

script cash_goals_add_hold_trick 
    printf 'cash_goals_add_hold_trick'
    FormatText checksumname = goal_id '%z_goal_gaps999' z = <zone>
    cash_goals_check_duplicate_goal goal_id = <goal_id>
    AddGoal_Gaps {
        ped_vo_type = 'cash_'
        ped_vo_action = 'hold_'
        init_script = cash_goals_init_hold_trick
        init_script_params = {goal_id = <goal_id> ped_name = <ped> restart_name = <restart> zone = <zone>}
        times_won = <times_won>
        zone = <zone>
        version = 999
        goal_text = 'Nierozpoczêty.'
        goal_description = 'Udowodnij, ¿e potrafisz utrzymaæ równowagê.\nZdob¹d kasê.'
        goal_flags = [ got_1 ]
        trigger_obj_id = <ped>
        full_name = 'Losowy kole'
        restart_node = <restart>
        intro_scene = cash_goals_intro_IGC
        success_scene = cash_goals_success_IGC
        fail_scene = cash_goals_fail_IGC
        hold_trick
        trick_type = None
        trick_time = 1
        show_goal_timer
        time = 10
        cash_goal
        ped_floater = cash_goals_ped_floater
    }
    return goal_id = <goal_id>
endscript

script cash_goals_init_find_gaps 
    GoalManager_GetTimesWonGoal name = <goal_id>
    if (<times_won> > 4)
        <number> = 10
        <cash_reward> = 75
        <time> = 120
        shot_text = [
            {
                text = 'Masz talent, naprawdê.  Ale zastanawiam siê, czy wiesz, gdzie znajduj¹ siê luki.'
                stream = find_gaps_hard_1_lip
            }
            {
                text = 'To mo¿e byæ trudne. Dostaniesz tê forsê, jeli zaliczysz sporo luk.'
                stream = find_gaps_hard_2_lip
            }
        ]
    else
        if (<times_won> > 2)
            <number> = 5
            <cash_reward> = 50
            <time> = 60
            shot_text = [
                {
                    text = 'Nie jeste taki z³y.  Ale jeszcze chcia³bym, ¿eby znalaz³ wiêcej luk.'
                    stream = find_gaps_med_1_lip
                }
                {
                    text = 'To bêdzie trochê trudniejsze. Znajd kilka luk, a ja znajdê trochê forsy.'
                    stream = find_gaps_med_2_lip
                }
            ]
        else
            <number> = 2
            <cash_reward> = 25
            <time> = 60
            shot_text = [
                {
                    text = 'Masz kasê na rachunki? Potrafisz znaleæ jakie niez³e luki na swojej trasie?'
                    stream = find_gaps_easy_1_lip
                }
                {
                    text = 'Na pocz¹tek bêdzie ³atwo. Sypnê groszem, jeli ³ykniesz kilka luk.'
                    stream = find_gaps_easy_2_lip
                }
            ]
        endif
    endif
    FormatText checksumname = level '%z' z = <zone>
    GetLevelGapTotals level = <level>
    if (<number> > <num_gaps>)
        <number> = <num_gaps>
    endif
    FormatText textname = goal_text 'Zalicz %n luk w %s sekund.' n = <number> s = <time>
    GoalManager_EditGoal name = <goal_id> params = {
        cash_reward = <cash_reward>
        goal_text = <goal_text>
        number = <number>
        time = <time>
    }
    cash_goals_edit_IGCs {
        ped_name = <ped_name>
        restart_name = <restart_name>
        shot_text = <shot_text>
        igc_name = 'find_gaps'
    }
    KillSpawnedScript name = cash_goals_reinit_goal_ped
    SpawnScriptLater cash_goals_reinit_goal_ped params = { goal_id = <goal_id> }
endscript

script cash_goals_add_find_gaps 
    printf 'cash_goals_add_find_gaps'
    FormatText checksumname = goal_id '%z_goal_counter998' z = <zone>
    cash_goals_check_duplicate_goal goal_id = <goal_id>
    AddGoal_Counter {
        ped_vo_type = 'cash_'
        ped_vo_action = 'gaps_'
        init_script = cash_goals_init_find_gaps
        init_script_params = {goal_id = <goal_id> ped_name = <ped> restart_name = <restart> zone = <zone>}
        times_won = <times_won>
        zone = <zone>
        version = 998
        goal_text = 'Nie zosta³o zainicjalizowane'
        goal_description = 'Poka¿, jak radzisz sobie z lukami,\na otrzymasz nieco forsy.'
        trigger_obj_id = <ped>
        full_name = 'Losowy kole'
        restart_node = <restart>
        intro_scene = cash_goals_intro_IGC
        success_scene = cash_goals_success_IGC
        fail_scene = cash_goals_fail_IGC
        find_gaps
        goal_type_checksum = find_gaps
        number = 1
        use_hud_counter
        hud_counter_caption = 'Dziury'
        show_goal_timer
        time = 10
        show_midgoal_msg
        collect_type = 'Gaps'
        cash_goal
        ped_floater = cash_goals_ped_floater
    }
    return goal_id = <goal_id>
endscript

script cash_goals_init_skatetris 
    GoalManager_GetTimesWonGoal name = <goal_id>
    <tricks_easy> = [
        {
            key_combos
            desc = 'flip triki'
            tricks = [
                Air_SquareU
                Air_SquareUL
                Air_SquareUR
                Air_SquareD
                Air_SquareDL
                Air_SquareDR
                Air_SquareL
                Air_SquareR
            ]
        }
        {
            key_combos
            desc = 'graby'
            tricks = [
                Air_CircleU
                Air_CircleUL
                Air_CircleUR
                Air_CircleD
                Air_CircleDL
                Air_CircleDR
                Air_CircleL
                Air_CircleR
            ]
        }
    ]
    <tricks_med> = [
        {
            key_combos
            desc = 'flip spin triki'
            tricks = [
                {key_combo = Air_SquareUL spin = 180}
                {key_combo = Air_SquareUR spin = 180}
                {key_combo = Air_SquareDL spin = 180}
                {key_combo = Air_SquareDR spin = 180}
                {key_combo = Air_SquareL spin = 180}
                {key_combo = Air_SquareR spin = 180}
            ]
        }
        {
            key_combos
            desc = 'grab spin triki'
            tricks = [
                {key_combo = Air_CircleUL spin = 360}
                {key_combo = Air_CircleUR spin = 360}
                {key_combo = Air_CircleDL spin = 360}
                {key_combo = Air_CircleDR spin = 360}
                {key_combo = Air_CircleL spin = 360}
                {key_combo = Air_CircleR spin = 360}
            ]
        }
    ]
    <tricks_hard> = [
        {
            desc = 'mid manual triki'
            tricks = [
                {Trick = 'Pogo' key_combo = '\b0 + \b0' text = 'Pogo'}
                {Trick = 'Truckstand' key_combo = '\b0 + \b1' text = 'Truckstand'}
                {Trick = 'To Rail' key_combo = '\b2 + \b1' text = 'To Rail'}
                {Trick = 'Switch Foot Pogo' key_combo = '\b0 + \b2' text = 'Switch Foot Pogo'}
                {Trick = 'Casper' key_combo = '\b1 + \b0' text = 'Casper'}
                {Trick = 'Anti Casper' key_combo = '\b1 + \b2' text = 'Anti Casper'}
                {Trick = 'Handstand' key_combo = '\b2 + \b2' text = 'Handstand'}
                {Trick = 'Spacewalk' key_combo = '\b6 + \b5 + \b1' text = 'Spacewalk'}
                {Trick = 'One Foot Manual' key_combo = '\b2 + \b0' text = 'One Foot Manual'}
            ]
        }
        {
            desc = 'mid lip triki'
            tricks = [
                {Trick = 'Disaster' key_combo = '\b1 + \b1' text = 'Katastrofa'}
                {Trick = 'Axle Stall' key_combo = '\b2 + \b2' text = 'Axle Stall'}
                {Trick = 'FS Noseblunt' key_combo = '\b0 + \b0' text = 'FS Noseblunt'}
                {Trick = 'Rock To Fakie' key_combo = '\b1 + \b2' text = 'Rock do Fakie'}
                {Trick = 'Blunt To Fakie' key_combo = '\b0 + \b2' text = 'Blunt do Fakie'}
                {Trick = 'BS Boneless' key_combo = '\b2 + \b1' text = 'BS Boneless'}
                {Trick = 'FS Nosepick' key_combo = '\b0 + \b1' text = 'FS Nosepick'}
            ]
        }
    ]
    if (<times_won> > 4)
        <trick_array> = <tricks_hard>
        <cash_reward> = 75
        shot_text = [
            {
                text = 'Nawet niele ci idzie. Ale nie jestem pewien, czy poradzisz sobie z trudniejszymi rzeczami.'
                stream = skatetris_hard_1_lip
            }
            {
                text = 'Czas pokazaæ prawdziwe umiejêtnoci. Wyczesz te triki, a kasiora poleci do twojej kieszeni.'
                stream = skatetris_hard_2_lip
            }
        ]
    else
        if (<times_won> > 2)
            <trick_array> = <tricks_med>
            <cash_reward> = 50
            shot_text = [
                {
                    text = 'Yo, wiêc wróci³e po wiêcej? Zobaczmy, jak ci idzie z trikami.'
                    stream = skatetris_med_1_lip
                }
                {
                    text = 'Teraz bêdzie trudniej. Wykonaj te wszystkie triki zanim siê nagromadz¹, a dostaniesz trochê forsy.'
                    stream = skatetris_med_2_lip
                }
            ]
        else
            <trick_array> = <tricks_easy>
            <cash_reward> = 25
            shot_text = [
                {
                    text = 'OK, cwaniaku, co potrafisz? Mylisz, ¿e wykonasz triki, o które poproszê?'
                    stream = skatetris_easy_1_lip
                }
                {
                    text = 'Dla twojego dobra, zaczniemy od prostych rzeczy. Rób triki, które wymieniê i nie pozwól, by wype³ni³y ekran.'
                    stream = skatetris_easy_2_lip
                }
            ]
        endif
    endif
    <time> = 30
    <trick_time> = 2000
    <max_tricks> = 15
    <acceleration_interval> = 3
    <acceleration_percent> = 0.05000
    <time_to_stop_adding_tricks> = 10
    GetArraySize <trick_array>
    getrandomvalue name = trick_group a = 0 b = (<array_size> -1)integer
    if (<times_won> > 4)
        if (<trick_group> = 0)
            printf 'SKATETRIS GOAL TESTING: Manual'
            if NOT skater ::AbilityEnabled freestyle
                <trick_group> = 1
            endif
        endif
    endif
    printf 'SKATETRIS GOAL SETTLED ON: %s' s = (<trick_array> [ <trick_group> ].desc)
    if StructureContains structure = (<trick_array> [ <trick_group> ])key_combos
        <tricks> = {goal_tetris_key_combos = (<trick_array> [ <trick_group> ].tricks)}
    else
        <tricks> = {goal_tetris_tricks = (<trick_array> [ <trick_group> ].tricks)}
    endif
    FormatText textname = goal_text 'Nie pozwól, by %s wype³ni³ ekran.' s = (<trick_array> [ <trick_group> ].desc)
    GoalManager_EditGoal name = <goal_id> params = {
        goal_text = <goal_text>
        time = <time>
        <tricks>
        cash_reward = <cash_reward>
        trick_time = <trick_time>
        max_tricks = <max_tricks>
        acceleration_interval = <acceleration_interval>
        acceleration_percent = <acceleration_percent>
        time_to_stop_adding_tricks = <time_to_stop_adding_tricks>
    }
    cash_goals_edit_IGCs {
        ped_name = <ped_name>
        restart_name = <restart_name>
        shot_text = <shot_text>
        igc_name = 'skatetris'
    }
    KillSpawnedScript name = cash_goals_reinit_goal_ped
    SpawnScriptLater cash_goals_reinit_goal_ped params = { goal_id = <goal_id> }
endscript

script cash_goals_add_skatetris 
    printf 'cash_goals_add_skatetris'
    FormatText checksumname = goal_id '%z_goal_tetris999' z = <zone>
    cash_goals_check_duplicate_goal goal_id = <goal_id>
    AddGoal_Tetris {
        ped_vo_type = 'cash_'
        ped_vo_action = 'tris_'
        init_script = cash_goals_init_skatetris
        init_script_params = {goal_id = <goal_id> ped_name = <ped> restart_name = <restart> zone = <zone>}
        times_won = <times_won>
        zone = <zone>
        version = 999
        goal_text = 'Nie zosta³o zainicjalizowane'
        goal_description = 'Poka¿, ¿e potrafisz czesaæ triki.\nZdob¹d trochê kasy.'
        trigger_obj_id = <ped>
        full_name = 'Losowy kole'
        restart_node = <restart>
        intro_scene = cash_goals_intro_IGC
        success_scene = cash_goals_success_IGC
        fail_scene = cash_goals_fail_IGC
        goal_tetris_tricks = []
        trick_time = 1
        max_tricks = 1
        acceleration_interval = 1
        acceleration_percent = 1
        time_to_stop_adding_tricks = 1
        show_goal_timer
        time = 10
        cash_goal
        ped_floater = cash_goals_ped_floater
    }
    return goal_id = <goal_id>
endscript

script cash_goals_init_tricktris 
    GoalManager_GetTimesWonGoal name = <goal_id>
    <tricks_easy> = [
        {
            key_combos
            desc = 'flip triki'
            tricks = [
                Air_SquareU
                Air_SquareUL
                Air_SquareUR
                Air_SquareD
                Air_SquareDL
                Air_SquareDR
                Air_SquareL
                Air_SquareR
            ]
        }
        {
            key_combos
            desc = 'graby'
            tricks = [
                Air_CircleU
                Air_CircleUL
                Air_CircleUR
                Air_CircleD
                Air_CircleDL
                Air_CircleDR
                Air_CircleL
                Air_CircleR
            ]
        }
    ]
    <tricks_med> = [
        {
            key_combos
            desc = 'flip spin triki'
            tricks = [
                {key_combo = Air_SquareUL spin = 180}
                {key_combo = Air_SquareUR spin = 180}
                {key_combo = Air_SquareDL spin = 180}
                {key_combo = Air_SquareDR spin = 180}
                {key_combo = Air_SquareL spin = 180}
                {key_combo = Air_SquareR spin = 180}
            ]
        }
        {
            key_combos
            desc = 'grab spin triki'
            tricks = [
                {key_combo = Air_CircleUL spin = 360}
                {key_combo = Air_CircleUR spin = 360}
                {key_combo = Air_CircleDL spin = 360}
                {key_combo = Air_CircleDR spin = 360}
                {key_combo = Air_CircleL spin = 360}
                {key_combo = Air_CircleR spin = 360}
            ]
        }
    ]
    <tricks_hard> = [
        {
            desc = 'mid manual triki'
            tricks = [
                {Trick = 'Pogo' key_combo = '\b0 + \b0' text = 'Pogo'}
                {Trick = 'Truckstand' key_combo = '\b0 + \b1' text = 'Truckstand'}
                {Trick = 'To Rail' key_combo = '\b2 + \b1' text = 'To Rail'}
                {Trick = 'Switch Foot Pogo' key_combo = '\b0 + \b2' text = 'Switch Foot Pogo'}
                {Trick = 'Casper' key_combo = '\b1 + \b0' text = 'Casper'}
                {Trick = 'Anti Casper' key_combo = '\b1 + \b2' text = 'Anti Casper'}
                {Trick = 'Handstand' key_combo = '\b2 + \b2' text = 'Handstand'}
                {Trick = 'Spacewalk' key_combo = '\b6 + \b5 + \b1' text = 'Spacewalk'}
                {Trick = 'One Foot Manual' key_combo = '\b2 + \b0' text = 'One Foot Manual'}
            ]
        }
        {
            desc = 'mid lip triki'
            tricks = [
                {Trick = 'Disaster' key_combo = '\b1 + \b1' text = 'Katastrofa'}
                {Trick = 'Axle Stall' key_combo = '\b2 + \b2' text = 'Axle Stall'}
                {Trick = 'FS Noseblunt' key_combo = '\b0 + \b0' text = 'FS Noseblunt'}
                {Trick = 'Rock To Fakie' key_combo = '\b1 + \b2' text = 'Rock do Fakie'}
                {Trick = 'Blunt To Fakie' key_combo = '\b0 + \b2' text = 'Blunt do Fakie'}
                {Trick = 'BS Boneless' key_combo = '\b2 + \b1' text = 'BS Boneless'}
                {Trick = 'FS Nosepick' key_combo = '\b0 + \b1' text = 'FS Nosepick'}
            ]
        }
        {
            key_combos
            desc = 'flip spin triki'
            tricks = [
                {key_combo = Air_SquareUL spin = 360}
                {key_combo = Air_SquareUR spin = 360}
                {key_combo = Air_SquareDL spin = 360}
                {key_combo = Air_SquareDR spin = 360}
                {key_combo = Air_SquareL spin = 360}
                {key_combo = Air_SquareR spin = 360}
            ]
        }
    ]
    if (<times_won> > 4)
        <trick_array> = <tricks_hard>
        <cash_reward> = 75
        shot_text = [
            {
                text = 'Wiesz co? Ca³kiem niez³y jeste. Przygotowa³em kilka trików, których powiniene spróbowaæ.'
                stream = tricktris_hard_1_lip
            }
            {
                text = 'Zobaczmy, jak sobie radzisz z cinieniem. Forsa jest twoja, jeli wyciniesz te triki.'
                stream = tricktris_hard_2_lip
            }
        ]
    else
        if (<times_won> > 2)
            <trick_array> = <tricks_med>
            <cash_reward> = 50
            shot_text = [
                {
                    text = 'W porz¹dku, umiesz czesaæ niez³e triki.  Ale zastanawiam siê, jak sobie poradzisz z czym bardziej technicznym.'
                    stream = tricktris_med_1_lip
                }
                {
                    text = 'Podbijmy nieco poziom trudnoci. Rozstanê siê z fors¹ jeli wykonasz triki, o które poproszê.'
                    stream = tricktris_med_2_lip
                }
            ]
        else
            <trick_array> = <tricks_easy>
            <cash_reward> = 25
            shot_text = [
                {
                    text = 'O, gwiazda skateboardingu wróci³a po wiêcej.  Sprawdmy, czy jeste konsekwentny.'
                    stream = tricktris_easy_1_lip
                }
                {
                    text = 'Na razie bêdzie ³atwo. Wykonuj triki, o które poproszê. Zrób je wszystkie, a dostaniesz trochê grosza.'
                    stream = tricktris_easy_2_lip
                }
            ]
        endif
    endif
    <time> = 60
    <trick_time> = 1500
    <max_tricks> = 15
    <acceleration_interval> = 4
    <acceleration_percent> = 0.1000
    <time_to_stop_adding_tricks> = 10
    <tricktris_block_size> = 1
    <tricktris_total_to_win> = 6
    GetArraySize <trick_array>
    getrandomvalue name = trick_group a = 0 b = (<array_size> -1)integer
    if (<times_won> > 4)
        if (<trick_group> = 0)
            printf 'TRICKTRIS GOAL TESTING: Manual'
            if NOT skater ::AbilityEnabled freestyle
                <trick_group> = 2
            endif
        endif
    endif
    printf 'TRICKTRIS GOAL SETTLED ON: %s' s = (<trick_array> [ <trick_group> ].desc)
    if StructureContains structure = (<trick_array> [ <trick_group> ])key_combos
        <tricks> = {goal_tetris_key_combos = (<trick_array> [ <trick_group> ].tricks)}
    else
        <tricks> = {goal_tetris_tricks = (<trick_array> [ <trick_group> ].tricks)}
    endif
    FormatText textname = goal_text 'Wyczesz %n %s w %t sekund.' n = <tricktris_total_to_win> s = (<trick_array> [ <trick_group> ].desc)t = <time>
    GoalManager_EditGoal name = <goal_id> params = {
        goal_text = <goal_text>
        time = <time>
        <tricks>
        cash_reward = <cash_reward>
        trick_time = <trick_time>
        max_tricks = <max_tricks>
        acceleration_interval = <acceleration_interval>
        acceleration_percent = <acceleration_percent>
        time_to_stop_adding_tricks = <time_to_stop_adding_tricks>
        tricktris_block_size = <tricktris_block_size>
        tricktris_total_to_win = <tricktris_total_to_win>
    }
    cash_goals_edit_IGCs {
        ped_name = <ped_name>
        restart_name = <restart_name>
        shot_text = <shot_text>
        igc_name = 'tricktris'
    }
    KillSpawnedScript name = cash_goals_reinit_goal_ped
    SpawnScriptLater cash_goals_reinit_goal_ped params = { goal_id = <goal_id> }
endscript

script cash_goals_add_tricktris 
    printf 'cash_goals_add_tricktris'
    FormatText checksumname = goal_id '%z_goal_tetris998' z = <zone>
    cash_goals_check_duplicate_goal goal_id = <goal_id>
    AddGoal_Tetris {
        ped_vo_type = 'cash_'
        ped_vo_action = 'tris_'
        init_script = cash_goals_init_tricktris
        init_script_params = {goal_id = <goal_id> ped_name = <ped> restart_name = <restart> zone = <zone>}
        times_won = <times_won>
        zone = <zone>
        version = 998
        goal_text = 'Nie zosta³o zainicjalizowane'
        goal_description = 'Poka¿, ¿e potrafisz czesaæ triki.\nZdob¹d trochê kasy.'
        trigger_obj_id = <ped>
        full_name = 'Losowy kole'
        restart_node = <restart>
        intro_scene = cash_goals_intro_IGC
        success_scene = cash_goals_success_IGC
        fail_scene = cash_goals_fail_IGC
        tricktris
        tricktris_block_size = 1
        tricktris_total_to_win = 1
        trick_time = 1
        max_tricks = 1
        acceleration_interval = 1
        acceleration_percent = 1
        time_to_stop_adding_tricks = 1
        show_goal_timer
        time = 10
        cash_goal
        ped_floater = cash_goals_ped_floater
    }
    return goal_id = <goal_id>
endscript

script cash_goals_init_combotris 
    GoalManager_GetTimesWonGoal name = <goal_id>
    <tricks_easy> = [
        {
            key_combos
            desc = 'flip triki'
            tricks = [
                Air_SquareU
                Air_SquareD
                Air_SquareL
                Air_SquareR
            ]
        }
        {
            key_combos
            desc = 'graby'
            tricks = [
                Air_CircleU
                Air_CircleD
                Air_CircleL
                Air_CircleR
            ]
        }
    ]
    <tricks_med> = [
        {
            key_combos
            desc = 'flip triki'
            tricks = [
                Air_SquareUL
                Air_SquareUR
                Air_SquareDL
                Air_SquareDR
            ]
        }
        {
            key_combos
            desc = 'graby'
            tricks = [
                Air_CircleUL
                Air_CircleUR
                Air_CircleDL
                Air_CircleDR
            ]
        }
        {
            key_combos
            desc = 'flip spin triki'
            tricks = [
                {key_combo = Air_SquareL spin = 180}
                {key_combo = Air_SquareR spin = 180}
            ]
        }
        {
            key_combos
            desc = 'grab spin triki'
            tricks = [
                {key_combo = Air_CircleL spin = 360}
                {key_combo = Air_CircleR spin = 360}
            ]
        }
    ]
    <tricks_hard> = [
        {
            key_combos
            desc = 'flip spin triki'
            tricks = [
                {key_combo = Air_SquareUL spin = 180}
                {key_combo = Air_SquareUR spin = 180}
                {key_combo = Air_SquareDL spin = 180}
                {key_combo = Air_SquareDR spin = 180}
            ]
        }
        {
            key_combos
            desc = 'grab spin triki'
            tricks = [
                {key_combo = Air_CircleUL spin = 360}
                {key_combo = Air_CircleUR spin = 360}
                {key_combo = Air_CircleDL spin = 360}
                {key_combo = Air_CircleDR spin = 360}
            ]
        }
        {
            desc = 'mid manual triki'
            tricks = [
                {Trick = 'Pogo' key_combo = '\b0 + \b0' text = 'Pogo'}
                {Trick = 'Truckstand' key_combo = '\b0 + \b1' text = 'Truckstand'}
                {Trick = 'To Rail' key_combo = '\b2 + \b1' text = 'To Rail'}
                {Trick = 'Switch Foot Pogo' key_combo = '\b0 + \b2' text = 'Switch Foot Pogo'}
                {Trick = 'Casper' key_combo = '\b1 + \b0' text = 'Casper'}
                {Trick = 'Anti Casper' key_combo = '\b1 + \b2' text = 'Anti Casper'}
                {Trick = 'Handstand' key_combo = '\b2 + \b2' text = 'Handstand'}
                {Trick = 'Spacewalk' key_combo = '\b6 + \b5 + \b1' text = 'Spacewalk'}
                {Trick = 'One Foot Manual' key_combo = '\b2 + \b0' text = 'One Foot Manual'}
            ]
        }
        {
            desc = 'mid lip triki'
            tricks = [
                {Trick = 'Disaster' key_combo = '\b1 + \b1' text = 'Katastrofa'}
                {Trick = 'Axle Stall' key_combo = '\b2 + \b2' text = 'Axle Stall'}
                {Trick = 'FS Noseblunt' key_combo = '\b0 + \b0' text = 'FS Noseblunt'}
                {Trick = 'Rock To Fakie' key_combo = '\b1 + \b2' text = 'Rock do Fakie'}
                {Trick = 'Blunt To Fakie' key_combo = '\b0 + \b2' text = 'Blunt do Fakie'}
                {Trick = 'BS Boneless' key_combo = '\b2 + \b1' text = 'BS Boneless'}
                {Trick = 'FS Nosepick' key_combo = '\b0 + \b1' text = 'FS Nosepick'}
            ]
        }
    ]
    if (<times_won> > 4)
        <trick_array> = <tricks_hard>
    else
        if (<times_won> > 2)
            <trick_array> = <tricks_med>
        else
            <trick_array> = <tricks_easy>
        endif
    endif
    <time> = 60
    <trick_time> = 5000
    <max_tricks> = 15
    <acceleration_interval> = 2
    <acceleration_percent> = 0.05000
    <time_to_stop_adding_tricks> = 15
    GetArraySize <trick_array>
    getrandomvalue name = trick_group a = 0 b = (<array_size> -1)integer
    if (<times_won> > 4)
        if (<trick_group> = 2)
            printf 'COMBOTRIS GOAL TESTING MANUAL'
            if NOT skater ::AbilityEnabled freestyle
                getrandomvalue name = trick_group a = 0 b = 3 integer
                if (<trick_group> = 2)
                    <trick_group> = 0
                endif
            endif
        endif
    endif
    printf 'COMBOTRIS GOAL SETTLED ON: %s' s = (<trick_array> [ <trick_group> ].desc)
    if StructureContains structure = (<trick_array> [ <trick_group> ])key_combos
        <tricks> = {goal_tetris_key_combos = (<trick_array> [ <trick_group> ].tricks)}
    else
        <tricks> = {goal_tetris_tricks = (<trick_array> [ <trick_group> ].tricks)}
    endif
    getrandomvalue name = rand_num a = 0 b = 50 integer
    if (<rand_num> < 35)
        <combo_type> = combo
        <combo_size> = 2
        <time> = 30
        FormatText textname = goal_text 'Nie pozwól, ¿eby %s combosy wype³ni³y ekran.' s = (<trick_array> [ <trick_group> ].desc)
        <single_combo> = 0
    else
        <combo_type> = single_combo
        <combo_size> = 4
        <time> = 60
        FormatText textname = goal_text 'Wyczesz to %s combo' s = (<trick_array> [ <trick_group> ].desc)
        <single_combo> = 1
    endif
    if (<times_won> > 4)
        <cash_reward> = 100
        if (<single_combo> = 1)
            shot_text = [
                {
                    text = 'Wow, dobra, to ty znasz siê na rzeczy.  Ale i tak zastanawiam siê, czy jeste w stanie graæ w pierwszej lidze.'
                    stream = combotris_hard_1_lip
                }
                {
                    text = 'Teraz bêdzie naprawdê trudno. Wyczesz to combo, a dostaniesz okr¹g³¹ sumkê.'
                    stream = combotris_hard_2_lip
                }
            ]
        else
            shot_text = [
                {
                    text = 'Wow, dobra, to ty znasz siê na rzeczy.  Ale i tak zastanawiam siê, czy jeste w stanie graæ w pierwszej lidze.'
                    stream = combotris_hard_1_lip
                }
                {
                    text = 'Teraz przestaje byæ ³atwo. Jak wykonasz wszystkie combo, kasa jest twoja.'
                    stream = combotris_hard_2_lip
                }
            ]
        endif
    else
        if (<times_won> > 2)
            <cash_reward> = 75
            if (<single_combo> = 1)
                shot_text = [
                    {
                        text = 'No dobra, nie jeste taki z³y. Co powiesz na nie³atwe combo? Dasz radê je zrobiæ?'
                        stream = combotris_med_1_lip
                    }
                    {
                        text = 'Mylê o czym rednio trudnym.  Ukoñcz to combo, a dostaniesz kieszonkowe, ma³y.'
                        stream = combotris_med_2_lip
                    }
                ]
            else
                shot_text = [
                    {
                        text = 'No dobra, jak widaæ, nie jeste taki z³y,  A co powiesz, na parê trików na ¿yczenie?  Mylisz, ¿e dasz radê?'
                        stream = combotris_med_1_lip
                    }
                    {
                        text = 'Tak sobie mylê, zróbmy co rednio trudnego.  Jeli wyczeszesz wszystkie te combosy, dostaniesz ode mnie wiêcej kasy.'
                        stream = combotris_med_2_lip
                    }
                ]
            endif
        else
            <cash_reward> = 50
            if (<single_combo> = 1)
                shot_text = [
                    {
                        text = 'Yo, co jest, skejcik?  Mam takie wyzwania, ¿e ci nogi zmiêkn¹.'
                        stream = combotris_easy_1_lip
                    }
                    {
                        text = 'Mo¿e dam ci fory. Wykonaj to combo, a odejdziesz z fors¹ w kieszeni.'
                        stream = combotris_easy_2_lip
                    }
                ]
            else
                shot_text = [
                    {
                        text = 'Yo, co jest, skejcik?  Mam takie wyzwania, ¿e ci nogi zmiêkn¹.'
                        stream = combotris_easy_1_lip
                    }
                    {
                        text = 'Bêdê dla ciebie wyrozumia³y.  Wysma¿ te combosy, ale nie pozwól, ¿eby zala³y ekran, bo z kasy nici.'
                        stream = combotris_easy_2_lip
                    }
                ]
            endif
        endif
    endif
    GoalManager_EditGoal name = <goal_id> params = {
        goal_text = <goal_text>
        time = <time>
        <tricks>
        cash_reward = <cash_reward>
        trick_time = <trick_time>
        max_tricks = <max_tricks>
        acceleration_interval = <acceleration_interval>
        acceleration_percent = <acceleration_percent>
        time_to_stop_adding_tricks = <time_to_stop_adding_tricks>
        <combo_type>
        combo_size = <combo_size>
    }
    cash_goals_edit_IGCs {
        ped_name = <ped_name>
        restart_name = <restart_name>
        shot_text = <shot_text>
        igc_name = 'combotris'
    }
    KillSpawnedScript name = cash_goals_reinit_goal_ped
    SpawnScriptLater cash_goals_reinit_goal_ped params = { goal_id = <goal_id> }
endscript

script cash_goals_add_combotris 
    printf 'cash_goals_add_combotris'
    FormatText checksumname = goal_id '%z_goal_tetris997' z = <zone>
    cash_goals_check_duplicate_goal goal_id = <goal_id>
    AddGoal_Tetris {
        ped_vo_type = 'cash_'
        ped_vo_action = 'tris_'
        init_script = cash_goals_init_combotris
        init_script_params = {goal_id = <goal_id> ped_name = <ped> restart_name = <restart> zone = <zone>}
        times_won = <times_won>
        zone = <zone>
        version = 997
        goal_text = 'Nie zosta³o zainicjalizowane'
        goal_description = 'Poka¿, ¿e potrafisz czesaæ triki.\nZdob¹d trochê kasy.'
        trigger_obj_id = <ped>
        full_name = 'Losowy kole'
        restart_node = <restart>
        intro_scene = cash_goals_intro_IGC
        success_scene = cash_goals_success_IGC
        fail_scene = cash_goals_fail_IGC
        combo_size = 1
        trick_time = 1
        max_tricks = 1
        acceleration_interval = 1
        acceleration_percent = 1
        time_to_stop_adding_tricks = 1
        show_goal_timer
        time = 10
        cash_goal
        ped_floater = cash_goals_ped_floater
    }
    return goal_id = <goal_id>
endscript

script cash_goals_init_mod_tricks 
    GoalManager_GetTimesWonGoal name = <goal_id>
    if (<times_won> > 4)
        <number> = 10
        <time> = 90
        <cash_reward> = 75
        shot_text = [
            {
                text = 'No, no, no, szefunio wróci³.  Jeli chcesz, dam ci szansê udowodniæ, na co ciê staæ.'
                stream = mod_tricks_hard_1_lip
            }
            {
                text = 'Teraz to ju¿ jazda bez trzymanki, stary. Dostaniesz kasê, jak wyczeszesz wszystkie warianty tego triku.'
                stream = mod_tricks_hard_2_lip
            }
        ]
    else
        if (<times_won> > 2)
            <number> = 5
            <time> = 60
            <cash_reward> = 50
            shot_text = [
                {
                    text = 'Niele. Naprawdê niele. Ale mylisz, ¿e staæ ciê na wiêcej?'
                    stream = mod_tricks_med_1_lip
                }
                {
                    text = 'Chcê, ¿eby spróbowa³ czego trudniejszego.  Wykonaj wszystkie wariacje triku, o który mi chodzi, a dorzucê ci parê dolców.'
                    stream = mod_tricks_med_2_lip
                }
            ]
        else
            <number> = 3
            <time> = 60
            <cash_reward> = 25
            shot_text = [
                {
                    text = 'Yo, królu skejtów. Mylisz, ¿e jeste dobry? Mo¿e sprawdzimy?'
                    stream = mod_tricks_easy_1_lip
                }
                {
                    text = 'Zacznijmy od bana³ów. Wykonasz trik, o który poproszê, a potem wszystkie jego wariacje, a ja bêdê p³aci³.'
                    stream = mod_tricks_easy_2_lip
                }
            ]
        endif
    endif
    <trick_types> = [
        {
            text = 'Spin'
            type = spin
        }
        {
            text = 'Grind'
            type = grind
        }
        {
            text = 'Lip'
            type = lip
        }
        {
            text = 'Odwrócenie'
            type = invert
        }
        {
            text = 'Manual'
            type = Manual
        }
    ]
    GetArraySize <trick_types>
    getrandomvalue name = trick_type_index a = 0 b = (<array_size> -1)integer
    <ability_index> = 0
    <learned_abilities> = [
        {
            type = spin
            ability = ExtraNatas
        }
        {
            type = Manual
            ability = freestyle
        }
    ]
    begin 
    printf 'MOD TRICK GOAL TESTING: %s' s = (<trick_types> [ <trick_type_index> ].text)
    if ((<trick_types> [ <trick_type_index> ].type)= (<learned_abilities> [ <ability_index> ].type))
        if NOT skater ::AbilityEnabled (<learned_abilities> [ <ability_index> ].ability)
            <trick_type_index> = (<trick_type_index> + 1)
            if (<trick_type_index> = <array_size>)
                <trick_type_index> = 0
            endif
            <ability_index> = 0
        else
            break 
        endif
    else
        <ability_index> = (<ability_index> + 1)
        if (<ability_index> = 2)
            break 
        endif
    endif
    repeat 100
    printf 'MOD TRICK GOAL SETTLED ON: %s' s = (<trick_types> [ <trick_type_index> ].text)
    <trick_type> = (<trick_types> [ <trick_type_index> ].type)
    if (<trick_type_index> = 3)
        FormatText textname = goal_text '%s (\b4 + \b0), a potem wykonaj triki!' s = (<trick_types> [ <trick_type_index> ].text)
        FormatText textname = goal_description 'Rozpocznij %s (\b4 + \b0) i wykonuj modyfikacje %s' s = (<trick_types> [ <trick_type_index> ].text)
    else
        FormatText textname = goal_text '%s, a potem wykonaj triki!' s = (<trick_types> [ <trick_type_index> ].text)
        FormatText textname = goal_description 'Rozpocznij %s i wykonuj modyfikacje %s' s = (<trick_types> [ <trick_type_index> ].text)
    endif
    FormatText textname = hud_counter_caption '%s trików' s = (<trick_types> [ <trick_type_index> ].text)
    GoalManager_EditGoal name = <goal_id> params = {
        goal_text = <goal_text>
        goal_description = <goal_description>
        cash_reward = <cash_reward>
        number = <number>
        time = <time>
        trick_type = <trick_type>
        hud_counter_caption = <hud_counter_caption>
    }
    cash_goals_edit_IGCs {
        ped_name = <ped_name>
        restart_name = <restart_name>
        shot_text = <shot_text>
        igc_name = 'mod_tricks'
    }
    KillSpawnedScript name = cash_goals_reinit_goal_ped
    SpawnScriptLater cash_goals_reinit_goal_ped params = { goal_id = <goal_id> }
endscript

script cash_goals_add_mod_tricks 
    printf 'cash_goals_add_mod_tricks'
    FormatText checksumname = goal_id '%z_goal_counter997' z = <zone>
    cash_goals_check_duplicate_goal goal_id = <goal_id>
    AddGoal_Counter {
        ped_vo_type = 'cash_'
        ped_vo_action = 'mod_'
        init_script = cash_goals_init_mod_tricks
        init_script_params = {goal_id = <goal_id> ped_name = <ped> restart_name = <restart> zone = <zone>}
        times_won = <times_won>
        zone = <zone>
        version = 997
        goal_text = 'Nierozpoczêty.'
        goal_description = 'Nierozpoczêty.'
        trigger_obj_id = <ped>
        full_name = 'Losowy kole'
        restart_node = <restart>
        intro_scene = cash_goals_intro_IGC
        success_scene = cash_goals_success_IGC
        fail_scene = cash_goals_fail_IGC
        number = 1
        use_hud_counter
        hud_counter_caption = 'Nierozpoczêty.'
        mod_tricks
        trick_type = spin
        show_goal_timer
        time = 10
        cash_goal
        ped_floater = cash_goals_ped_floater
    }
    return goal_id = <goal_id>
endscript
cash_goals_intro_IGC = {}
cash_goals_success_IGC = {}
cash_goals_fail_IGC = {}

script cash_goals_edit_IGCs 
    GetNode <ped_name>
    <ped_node> = <node>
    GetNode <restart_name>
    <restart_node> = <node>
    <cam_info> = {
        pos0 = ((<restart_node>.Pos)+ (0.0, 80.0, 0.0))
        pos1 = ((<ped_node>.Pos)+ (0.0, 80.0, 0.0))
        target0 = ((<ped_node>.Pos)+ (0.0, 50.0, 0.0))
        target1 = ((<restart_node>.Pos)+ (0.0, 50.0, 0.0))
    }
    <cam_actor_pos_index> = 0
    GetArraySize shot_text
    <shot_params> = [
        {
            camera = {
                Pos = (<cam_info>.pos0)
                lookatpos = (<cam_info>.target0)
                FOV = 72.0
                LockTo = world
                Quat = (0.0, 0.0, 0.0)
            }
            text = 'Yo, skejcik.'
            frames = 300
            skippable = 1
            shot_script = play_vo_sound_killall
            shot_script_params = {ped_vo_type = 'cash_' play_generic play_lasttime}
        }
    ]
    <index> = 0
    begin 
    FormatText checksumname = Pos 'pos%i' i = <cam_actor_pos_index>
    FormatText checksumname = target 'target%i' i = <cam_actor_pos_index>
    <tmp_array> = [
        {
            camera = {
                Pos = (<cam_info>.<Pos>)
                lookatpos = (<cam_info>.<target>)
                FOV = 72.0
                LockTo = world
                Quat = (0.0, 0.0, 0.0)
            }
            text = (<shot_text> [ <index> ].text)
            frames = 300
            skippable = 1
            shot_script = goals_handlestream
            shot_script_params = {stream = (<shot_text> [ <index> ].stream)}
        }
    ]
    <shot_params> = (<shot_params> + <tmp_array>)
    <cam_actor_pos_index> = (1 - <cam_actor_pos_index>)
    <index> = (<index> + 1)
    repeat <array_size>
    change cash_goals_intro_IGC = {
        name = <igc_name>
        template = igc_template_conversation2
        scene_setup = {
            transition = igc_transition_fade
            Actors = [
                {template = ped_m_actor ActorName = <ped_name> use_fam = 1}
                { template = skater_actor }
            ]
            actor_positions = [
                {ActorNum = 1
                    node = <ped_name>
                }
                {ActorNum = 2
                    node = <restart_name>
                }
            ]
        }
        shot_params = <shot_params>
    }
    if NOT GotParam success_text
        <success_text> = 'Dobra robota! Odszukaj mnie, a ja nagram ci nastêpne wyzwania za wiêksz¹ forsê.'
    endif
    FormatText textname = igc_success_name '%s_success' s = <igc_name>
    change cash_goals_success_IGC = {
        name = <igc_success_name>
        template = igc_template_conversation2
        scene_setup = {
            transition = igc_transition_fade
            Actors = [
                {template = ped_m_actor ActorName = <ped_name> use_fam = 1}
                { template = skater_actor }
            ]
            actor_positions = [
                {ActorNum = 1
                    node = <ped_name>
                }
                {ActorNum = 2
                    node = <restart_name>
                }
            ]
        }
        shot_params = [
            {
                camera = {
                    Pos = (<cam_info>.pos0)
                    lookatpos = (<cam_info>.target0)
                    FOV = 72.0
                    LockTo = world
                    Quat = (0.0, 0.0, 0.0)
                }
                text = <success_text>
                frames = 300
                skippable = 1
                shot_script = goals_handlestream
                shot_script_params = { stream = cash_goals_success }
            }
        ]
    }
    if NOT GotParam fail_text
        <fail_text> = 'Ooo, pechunio.  Jak chcesz zarobiæ, wpadnij do mnie.'
    endif
    FormatText textname = igc_fail_name '%s_fail' s = <igc_name>
    change cash_goals_fail_IGC = {
        name = <igc_fail_name>
        template = igc_template_conversation2
        scene_setup = {
            transition = igc_transition_fade
            Actors = [
                {template = ped_m_actor ActorName = <ped_name> use_fam = 1}
                { template = skater_actor }
            ]
            actor_positions = [
                {ActorNum = 1
                    node = <ped_name>
                }
                {ActorNum = 2
                    node = <restart_name>
                }
            ]
        }
        shot_params = [
            {
                camera = {
                    Pos = (<cam_info>.pos0)
                    lookatpos = (<cam_info>.target0)
                    FOV = 72.0
                    LockTo = world
                    Quat = (0.0, 0.0, 0.0)
                }
                text = <fail_text>
                frames = 400
                skippable = 1
                shot_script = goals_handlestream
                shot_script_params = { stream = cash_goals_fail }
            }
        ]
    }
endscript

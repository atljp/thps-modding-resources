story_game_complete_rewards = [
    {
        flags = [
            GAME_COMPLETED_BEGINNER
            Z_SR_UNLOCKED_WITH_STORY
            MOVIE_UNLOCKED_WASTELAND
            SKATER_UNLOCKED_ROBOTONY
            SKATER_UNLOCKED_MINDY
        ]
        movie = 'movies\awf'
        play_credits
        message = '\n\c3STORY-MODUS ABGESCHLOSSEN!\n\nDu hast neue geheime Skater freigespielt:\n\c3Robo-Tony und Mindy!\n\nDu hast den Story-Modus abgeschlossen, aber spiel weiter,\nwenn du alle Missionen\nin Los Angeles abschließen willst!\n\nVergiss auch nicht, alle Teile\nin der Stadt aufzusammeln, um die\n Skate-Ranch fertig zu stellen!\n\nSieh dir jetzt das Wasteland-Video an ...'
        use_shrek_logo = use_shrek_logo
    }
    {
        flags = [
            GAME_COMPLETED_NORMAL
            Z_SR_UNLOCKED_WITH_STORY
            MOVIE_UNLOCKED_WASTELAND
            SKATER_UNLOCKED_LILJOHN
            SKATER_UNLOCKED_IGGY
            SKATER_UNLOCKED_ELLIS
        ]
        movie = 'movies\awf'
        play_credits
        message = '\n\c3STORY-MODUS ABGESCHLOSSEN!\n\nDu hast neue geheime Skater freigespielt:\n\c3Lil\' Jon, Iggy, und Jason Ellis!\n\nDu hast den Story-Modus abgeschlossen, aber spiel weiter,\nwenn du alle Missionen\nin Los Angeles abschließen willst!\n\nVergiss auch nicht, alle Teile\nin der Stadt aufzusammeln, um die\n Skate-Ranch fertig zu stellen!\n\nSieh dir jetzt das Wasteland-Video an ...'
    }
    {
        flags = [
            GAME_COMPLETED_SICK
            Z_SR_UNLOCKED_WITH_STORY
            MOVIE_UNLOCKED_WASTELAND
            SKATER_UNLOCKED_JIMBO
            SKATER_UNLOCKED_MURPHY
            SKATER_UNLOCKED_MEGA
        ]
        movie = 'movies\awf'
        play_credits
        message = '\n\c3STORY-MODUS ABGESCHLOSSEN!\n\nDu hast neue geheime Skater freigespielt:\n\c3Murphy, Mega und Jimbo!\n\nDu hast den Story-Modus abgeschlossen, aber spiel weiter,\nwenn du alle Missionen\nin Los Angeles abschließen willst!\n\nVergiss auch nicht, alle Teile\nin der Stadt aufzusammeln, um die\n Skate-Ranch fertig zu stellen!\n\nSieh dir jetzt das Wasteland-Video an ...'
    }
]
classic_game_complete_rewards = [
    {
        flags = [ GAME_COMPLETED_CLASSIC_NORMAL MOVIE_UNLOCKED_PRO_BAILS SKATER_UNLOCKED_BILLIEJOE SKATER_UNLOCKED_BOONE ]
        movie = 'movies\probail1'
        message = '\n\c3KLASSIK-MODUS ABGESCHLOSSEN!\n\nDu hast den Klassik-Modus im \nnormalen Schwierigkeitsgrad abgeschlossen!\n\nDu hast auch geheime\nSkater freigespielt:\n\c3Boone und Billie Joe!\n\nVersuch, alle Ziele im Klassik-Modus abzuschließen, um zusätzliche geheime Skater freizuspielen!\n'
    }
    {
        flags = [ GAME_COMPLETED_CLASSIC_SICK MOVIE_UNLOCKED_PRO_BAILS SKATER_UNLOCKED_HOFFMAN SKATER_UNLOCKED_CARELESS ]
        movie = 'movies\probail1'
        message = '\n\c5KLASSIK-MODUS ABGESCHLOSSEN!\n\nDu hast den Klassik-Modus im kranken Schwierigkeitsgrad abgeschlossen\nund geheime Skater freigespielt:\n\c3Useless Dave und Mat Hoffman!\n'
    }
]
story_goal_complete_rewards = {
    flags = [ CAREER_GOALS_COMPLETE MOVIE_UNLOCKED_PRO_BAILS2 SKATER_UNLOCKED_PEDGROUPA ]
    movie = 'movies\probail2'
    message = '\n\c3ALLE ZIELE IM STORY-MODUS ABGESCHLOSSEN!\n\nDu hast alle nur möglichen Ziele im Story-Modus abgeschlossen!\n\nDu hast neue geheime Skater freigespielt:\n\c3Ballspieler, Schweißer, Cholo\n\c3und Kameratyp!\n\n'
    already_got_message = '\n\c5ALLE ZIELE IM STORY-MODUS ABGESCHLOSSEN!\n\nDu hast alle nur möglichen Ziele im Story-Modus abgeschlossen!\n\nDu solltest bei Neversoft arbeiten!\n'
}
story_piece_goal_complete_rewards = {
    flags = [ MOVIE_UNLOCKED_PRO_BAILS2 SKATER_UNLOCKED_PEDGROUPB ]
    message = '\n\c3 OBJEKTE FÜR DIE SKATE RANCH SIND KOMPLETT!\n\n\nDu hast alle Objekte in der Stadt gesammelt und den ultimativen Skat-Park errichtet!\n\nJetzt stehen neue geheime Skater zur Verfügung:\n\c3 Der Frisör, der Jahrmarkt Typ,\n\c3Dogtown Guy und der Franzose!\n\n'
}
classic_goal_complete_rewards = {
    flags = [ CLASSIC_GOALS_COMPLETE MOVIE_UNLOCKED_NS_BAILS SKATER_UNLOCKED_PEDGROUPC ]
    movie = 'movies\nsbails'
    message = '\n\c3ALLE ZIELE IM KLASSIK-MODUS ABGESCHLOSSEN!\n\nDu hast alle nur möglichen Ziele im\nKlassik-Modus abgeschlossen!\n\nDu hast neue geheime Skater freigespielt:\n\c3Schutzhelm-Arbeiter, Dogtown-Typ 2, Graffiti-Typ\n\c3und Meister Zen!\n\n'
    already_got_message = '\n\c5ALLE ZIELE IM KLASSIK-MODUS ABGESCHLOSSEN!\n\nDu hast alle nur möglichen Ziele im\nKlassik-Modus abgeschlossen!\n\nDu solltest bei Neversoft arbeiten!\n\n\n\n'
}
all_gaps_complete_rewards = {
    flags = [ GOT_ALL_GAPS SKATER_UNLOCKED_PEDGROUPD ]
    message = '\n\c3ALLE GAPS GEFUNDEN!\n\nWahnsinn! Du hast alle Gaps in diesem Spiel abgeschlossen! Du bist einer der besten Tony-Hawk-Spieler überhaupt!\n\nDu hast neue geheime Skater freigespielt:\n\c3Bohrinselarbeiter, Polizist, Künstler\n\c3und Boone in Unterhosen!\n'
}
want_game_complete_message = 0
want_goal_complete_message = 0
want_piece_goal_complete_message = 0
want_gaps_complete_message = 0
want_goal_alt_message = 0
want_completion_movie = 0

script SetRewardFlagArray 
    GetArraySize <flags>
    index = 0
    begin 
    if NOT GetGlobalFlag flag = (<flags> [ <index> ])
        SetGlobalFlag flag = (<flags> [ <index> ])
        new_reward = 1
    endif
    index = (<index> + 1)
    repeat <array_size>
    return new_reward = <new_reward>
endscript

script GetDifficultyLevelRewards 
    GoalManager_GetDifficultyLevel
    if GameModeEquals \{ is_career }
        return (story_game_complete_rewards [ <difficulty_level> ])
    else
        return (classic_game_complete_rewards [ <difficulty_level> ])
    endif
endscript

script GetGoalRewards 
    GoalManager_GetDifficultyLevel
    if GameModeEquals \{ is_career }
        return (story_goal_complete_rewards)
    else
        return (classic_goal_complete_rewards)
    endif
endscript

script GetPieceGoalRewards 
    return (story_piece_goal_complete_rewards)
endscript

script ProcessGameRewards 
    printf 'Processing Game Rewards'
    if IsTrue want_game_complete_message
        return 
    endif
    if GameModeEquals is_career
        if GetGlobalFlag flag = CAREER_SEEN_GAME_COMPLETE_MESSAGE
            return 
        endif
        CareerFunc func = PushIncidentalAtom params = {
            only_if_new
            name = do_rewards
            atom_script = DoCompletionMessages
            atom_params = { no_update_on_exit }
        }
    else
        if GetGlobalFlag flag = CLASSIC_SEEN_GAME_COMPLETE_MESSAGE
            return 
        endif
        GetClassicLevelGoalCount
        if IsCollectorsEdition
            target = (classic_game_complete_goals_collector)
        else
            target = (classic_game_complete_goals_standard)
        endif
        if (<classic_total_goals> < <target>)
            return 
        endif
    endif
    GetDifficultyLevelRewards
    SetRewardFlagArray flags = <flags>
    change want_game_complete_message = 1
    change want_completion_movie = 1
    kill_start_key_binding
endscript

script ProcessGoalRewards 
    if IsTrue want_goal_complete_message
        return 
    endif
    if GameModeEquals is_career
        if GetGlobalFlag flag = CAREER_SEEN_GOAL_COMPLETE_MESSAGE
            return 
        endif
        CareerFunc func = PushIncidentalAtom params = {
            only_if_new
            name = do_rewards
            atom_script = DoCompletionMessages
            atom_params = { no_update_on_exit }
        }
    else
        if GetGlobalFlag flag = CLASSIC_SEEN_GOAL_COMPLETE_MESSAGE
            return 
        endif
        GetClassicLevelGoalCount
        if (<classic_total_goals> < <classic_potential_goals>)
            return 
        endif
    endif
    GetGoalRewards
    SetRewardFlagArray flags = <flags>
    change want_goal_complete_message = 1
    change want_completion_movie = 1
    kill_start_key_binding
    if GotParam new_reward
        change want_goal_alt_message = 0
    else
        change want_goal_alt_message = 1
    endif
endscript

script ProcessPieceGoalRewards 
    if IsTrue want_piece_goal_complete_message
        return 
    endif
    if GameModeEquals is_career
        if GetGlobalFlag flag = CAREER_SEEN_PIECE_GOAL_COMPLETE_MESSAGE
            return 
        endif
        CareerFunc func = PushIncidentalAtom params = {
            only_if_new
            name = do_rewards
            atom_script = DoCompletionMessages
            atom_params = { no_update_on_exit }
        }
    else
        scriptassert 'Pieces are not in non-career modes'
    endif
    GetPieceGoalRewards
    SetRewardFlagArray flags = <flags>
    change want_piece_goal_complete_message = 1
    kill_start_key_binding
endscript

script ProcessAllGapsReward 
    if GetGlobalFlag \{ flag = GOT_ALL_GAPS }
        return 
    endif
    unlock_all_gameplay_cheat_codes
    SetRewardFlagArray flags = (all_gaps_complete_rewards.flags)
    if InNetGame
        AllGapsCompleteMessage
    else
        change \{ want_gaps_complete_message = 1 }
        kill_start_key_binding
        wait \{ 1 seconds }
        DoCompletionMessages
    endif
endscript

script CheckNeedCompletionMessages 
    if NOT IsTrue \{ want_game_complete_message }
        if NOT IsTrue \{ want_goal_complete_message }
            if NOT IsTrue \{ want_gaps_complete_message }
                if NOT IsTrue \{ want_piece_goal_complete_message }
                    return 
                endif
            endif
        endif
    endif
    return \{ need_completion_messages = need_completion_messages }
endscript
waiting_for_complete_message = 0

script DoCompletionMessages 
    CheckNeedCompletionMessages
    if GotParam \{ need_completion_messages }
        spawnscriptnow \{ DoCompletionMessagesNow notsessionspecific = 1 }
    endif
endscript

script DoCompletionMessagesNow 
    pausegame
    PauseStream 1
    hide_all_hud_items
    igc_immediately_start_rendering
    if IsTrue want_gaps_complete_message
        AllGapsCompleteMessage
        WaitForEvent type = message_accept
        change want_gaps_complete_message = 0
    endif
    if IsTrue want_piece_goal_complete_message
        PieceGoalCompleteMessage
        WaitForEvent type = message_accept
        change want_piece_goal_complete_message = 0
    endif
    if IsTrue want_goal_complete_message
        GoalCompleteMessage
        WaitForEvent type = message_accept
    endif
    if IsTrue want_game_complete_message
        GameCompleteMessage
        WaitForEvent type = message_accept
        if GameModeEquals is_career
            SetGlobalFlag flag = CAREER_SEEN_GAME_COMPLETE_MESSAGE
        else
            SetGlobalFlag flag = CLASSIC_SEEN_GAME_COMPLETE_MESSAGE
        endif
    endif
    change waiting_for_complete_message = 0
    if NOT IsTrue want_completion_movie
        KillChapterMenu inside_run need_unpause_streams
        return 
    endif
    ingame_pre_movie_cleanup
    if IsTrue want_game_complete_message
        GetEndMovieParams
        if GotParam movie
            PlayMovie <movie>
            last_movie = <movie>
        endif
    endif
    if IsTrue want_goal_complete_message
        GetGoalMovieParams
        if GotParam last_movie
            if StringEquals a = <movie> b = <last_movie>
                RemoveParameter movie
            endif
        endif
        if GotParam movie
            PlayMovie <movie>
        endif
    endif
    MaybePlayCreditsMovie
    change want_game_complete_message = 0
    change want_goal_complete_message = 0
    change want_completion_movie = 0
    if GameModeEquals is_career
        CareerFunc func = GetLastLevelPlayed
        <level> = <last_level>
    endif
    ingame_post_movie_cleanup <...> 
endscript

script MaybePlayCreditsMovie 
    if IsTrue \{ want_game_complete_message }
        GetDifficultyLevelRewards
        if GotParam \{ play_credits }
            PlayMovie \{ 'movies\credits' }
        endif
    endif
endscript

script GameCompleteMessage 
    StopAudioStreams
    PlayStream FoundAllGaps vol = 150
    GetDifficultyLevelRewards
    if GameModeEquals is_career
        Title = 'GLÜCKWUNSCH!'
    else
        Title = 'GLÜCKWUNSCH!'
    endif
    create_snazzy_dialog_box {
        Title = <Title>
        text = <message>
        text_dims = (500.0, 0.0)
        no_bg
        z_priority = 20
        buttons = [{font = small text = 'Weiter' pad_choose_script = dialog_box_accept}]
        style = special_dialog_style
        delay_input
        use_shrek_logo = <use_shrek_logo>
    }
endscript

script GoalCompleteMessage 
    StopAudioStreams
    PlayStream FoundAllGaps vol = 150
    GetGoalRewards
    if IsTrue want_goal_alt_message
        message = <already_got_message>
    endif
    if GameModeEquals is_career
        Title = 'GLÜCKWUNSCH!'
        SetGlobalFlag flag = CAREER_SEEN_GOAL_COMPLETE_MESSAGE
    else
        Title = 'GLÜCKWUNSCH!'
        SetGlobalFlag flag = CLASSIC_SEEN_GOAL_COMPLETE_MESSAGE
    endif
    create_snazzy_dialog_box {
        Title = <Title>
        text = <message>
        text_dims = (500.0, 0.0)
        no_bg
        buttons = [{font = small text = 'Weiter' pad_choose_script = dialog_box_accept}]
        delay_input
        style = special_dialog_style
    }
endscript

script PieceGoalCompleteMessage 
    StopAudioStreams
    PlayStream \{ FoundAllGaps vol = 150 }
    GetPieceGoalRewards
    Title = 'GLÜCKWUNSCH!'
    SetGlobalFlag \{ flag = CAREER_SEEN_PIECE_GOAL_COMPLETE_MESSAGE }
    create_snazzy_dialog_box {
        Title = <Title>
        text = <message>
        text_dims = (500.0, 0.0)
        no_bg
        buttons = [{font = small text = 'Weiter' pad_choose_script = dialog_box_accept}]
        delay_input
        style = special_dialog_style
    }
endscript

script AllGapsCompleteMessage 
    StopAudioStreams
    PlayStream \{ FoundAllGaps vol = 150 }
    create_dialog_box {Title = 'GLÜCKWUNSCH!'
        text = (all_gaps_complete_rewards.message)
        Pos = (320.0, 240.0)
        just = [ center center ]
        text_rgba = [ 88 105 112 128 ]
        text_dims = (440.0, 0.0)
        style = special_dialog_style
        buttons = [{font = small text = 'Weiter' pad_choose_script = dialog_box_accept}]
        delay_input
    }
endscript

script GetEndMovieParams 
    GetDifficultyLevelRewards
    return {movie = <movie> level = <level>}
endscript

script GetGoalMovieParams 
    GetGoalRewards
    return movie = <movie>
endscript

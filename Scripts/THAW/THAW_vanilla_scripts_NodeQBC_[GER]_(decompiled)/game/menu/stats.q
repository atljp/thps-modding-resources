bump_stats = 0
level_stats = 0
stat_names = [
    { name = Air string = 'Air' description = 'Deine Sprunghöhe aus einer Halfpipe' }
    { name = lip_balance string = 'Lip' description = 'Dein Gleichgewicht während Lip-Trick-Stalls' }
    { name = run string = 'Lauf' description = 'Wie viel Zeit du für deinen Lauf hast' }
    { name = flip_speed string = 'Flip-Tempo' description = 'Dein Drehtempo während Flip-Tricks' short_string = 'Flip' }
    { name = rail_balance string = 'Rail' description = 'Dein Gleichgewicht auf Rails' }
    { name = spin string = 'Spin' description = 'Wie schnell du dich in der Luft drehst' }
    { name = ollie string = 'Ollie' description = 'Wie hoch du vom Boden aus springst' }
    { name = Speed string = 'Tempo' description = 'Deine Höchstgeschwindigkeit am Boden' short_string = 'Tempo' }
    { name = Switch string = 'Switch' description = 'Bei voller Anzeige skatest du gleich gut in Switch und Regular' short_string = 'Swt.' }
    { name = manual_balance string = 'Manual' description = 'Dein Gleichgewicht während Manuals' short_string = 'Man.' }
]
stats_groups = [
    { name = 'Stats 1' used = 0 }
    { name = 'Stats 2' used = 0 }
    { name = 'Stats 3' used = 0 }
    { name = 'Stats 4' used = 0 }
    { name = 'Stats 5' used = 0 }
    { name = 'Stats 6' used = 0 }
    { name = 'Stats 7' used = 0 }
    { name = 'Stats 8' used = 0 }
    { name = 'Stats 9' used = 0 }
    { name = 'Stats 10' used = 0 }
    { name = 'Stats 11' used = 0 }
    { name = 'Stats 12' used = 0 }
    { name = 'Stats 13' used = 0 }
    { name = 'Stats 14' used = 0 }
    { name = 'Stats 15' used = 0 }
    { name = 'Stats 16' used = 0 }
    { name = 'Stats 17' used = 0 }
    { name = 'Stats 18' used = 0 }
    { name = 'Stats 19' used = 0 }
    { name = 'Stats 20' used = 0 }
]
stats_spots = [
    z_ho
    z_bh
    z_dt
    z_sm
    z_el
]
stats_spot_values = {
    z_ho = { start = 0 end = 12 }
    z_bh = { start = 13 end = 25 }
    z_dt = { start = 26 end = 39 }
    z_sm = { start = 40 end = 53 }
    z_el = { start = 54 end = 69 }
}
manual_increase_text = 'Manual'
rail_increase_text = 'Rail'
lip_increase_text = 'Lip'
speed_increase_text = 'Tempo'
ollie_increase_text = 'Ollie'
air_increase_text = 'Air'
flip_increase_text = 'Flip'
switch_increase_text = 'Switch'
spin_increase_text = 'Spin'
run_increase_text = 'Lauf'
stats_goals = [
    {
        group_num = 1
        stattype = rail_balance
        ability = None
        goaltype = grindtime
        value = [ 1 2 4 ]
        text = 'Grinde %i Sekunden lang'
    }
    {
        group_num = 1
        stattype = Speed
        ability = None
        goaltype = combo
        value = [ 1000 2000 5000 ]
        text = 'Lande eine %i-Punkte-Kombo'
    }
    {
        group_num = 1
        stattype = run
        ability = caveman
        goaltype = stringcount
        value = [ 1 1 2 ]
        text = 'Zeig einen %s %i Mal in Kombo'
        value_string = [ 'Caveman' 'Caveman' 'Caveman' ]
    }
    {
        group_num = 1
        stattype = ollie
        ability = None
        goaltype = highollie
        value = [ 3 5 10 ]
        text = 'Mach einen %i-Fuß-Ollie nach oben'
    }
    {
        group_num = 2
        stattype = manual_balance
        ability = Manual
        goaltype = manualtime
        value = [ 2 4 6 ]
        text = 'Mach einen Manual über %i Sekunden'
    }
    {
        group_num = 2
        stattype = ollie
        ability = None
        goaltype = olliedrop
        value = [ 15 20 35 ]
        text = 'Mach einen %i-Fuß-Ollie nach unten'
    }
    {
        group_num = 2
        stattype = Switch
        ability = None
        goaltype = multiplier
        value = [ 2 3 5 ]
        text = 'Lande eine %i-Trick-Kombo'
    }
    {
        group_num = 2
        stattype = spin
        ability = None
        goaltype = numgrabs
        value = [ 2 3 5 ]
        text = 'Mach %i Grabs in einer Kombo'
    }
    {
        group_num = 3
        stattype = Air
        ability = None
        goaltype = vertdist
        value = [ 15 30 35 ]
        text = 'Mach einen Air-Transfer über %i Fuß'
    }
    {
        group_num = 3
        stattype = spin
        ability = None
        goaltype = vertspin
        value = [ 360 540 720 ]
        text = 'Lande %i-Grab oder Flip in einer HP'
        no_commas
    }
    {
        group_num = 3
        stattype = ollie
        ability = None
        goaltype = olliedist
        value = [ 30 45 50 ]
        text = 'Ollie über %s Fuß'
        value_string = [ '15' '20' '30' ]
    }
    {
        group_num = 3
        stattype = Speed
        ability = None
        goaltype = combo
        value = [ 5000 10000 40000 ]
        text = 'Lande eine %i-Punkte-Kombo'
    }
    {
        group_num = 4
        stattype = spin
        ability = None
        goaltype = numgrabs
        value = [ 2 3 5 ]
        text = 'Mach %i Grabs in einer Kombo'
    }
    {
        group_num = 4
        stattype = Switch
        ability = None
        goaltype = vertheight
        value = [ 20 30 50 ]
        text = 'Spring %i Fuß hoch'
    }
    {
        group_num = 4
        stattype = rail_balance
        ability = None
        goaltype = stringcount
        value = [ 2 3 5 ]
        text = 'Zeig einen %s %i Mal in Kombo'
        value_string = [ '50-50' '50-50' 'Crooked' ]
    }
    {
        group_num = 4
        stattype = run
        ability = None
        goaltype = stringcount
        value = [ 1 1 1 ]
        text = 'Sei genervt und krieg einen \'Freak Out\'.'
        value_string = [ 'FREAK\_OUT!' 'FREAK\_OUT!' 'FREAK\_OUT!' ]
        value_trick = [ #"Freak Out!" #"Freak Out!" #"Freak Out!" ]
        value_taps = [ 1 1 1 ]
    }
    {
        group_num = 5
        stattype = Speed
        ability = spine
        goaltype = stringcount
        value = [ 1 2 3 ]
        text = '%i %s in einer Kombo'
        value_string = [ 'Spine\_Transfer' 'Spine\_Transfer' 'Spine\_Transfer' ]
        alt_text = '%s %i in einer Kombo'
    }
    {
        group_num = 5
        stattype = rail_balance
        ability = Natas
        goaltype = trickcount
        value = [ 1 2 4 ]
        text = '%i Natas Spins in einer Kombo'
        alt_text = 'Natas Spin - %i Mal in einer Kombo'
        value_trick = [ #"Natas Spin" #"Natas Spin" #"Natas Spin" ]
    }
    {
        group_num = 5
        stattype = Air
        ability = flipandroll
        goaltype = stringcount
        value = [ 1 1 2 ]
        text = 'Mach %i %s Grabs in einer Kombo'
        value_string = [ 'Backflip' 'Backflip' 'Backflip' ]
        alt_text = 'Lande %i %s-Grab'
    }
    {
        group_num = 5
        stattype = manual_balance
        ability = Manual
        goaltype = manualtime
        value = [ 2 4 6 ]
        text = 'Mach einen Manual über %i Sekunden'
    }
    {
        group_num = 6
        stattype = rail_balance
        ability = None
        goaltype = grindtime
        value = [ 3 4 6 ]
        text = 'Grinde %i Sekunden lang'
    }
    {
        group_num = 6
        stattype = manual_balance
        ability = Manual
        goaltype = manualtime
        value = [ 6 8 10 ]
        text = 'Mach einen Manual über %i Sekunden'
    }
    {
        group_num = 6
        stattype = Switch
        ability = None
        goaltype = multiplier
        value = [ 5 8 15 ]
        text = 'Lande eine %i-Trick-Kombo'
    }
    {
        group_num = 6
        stattype = run
        ability = wallrunup
        goaltype = trickcount
        value = [ 1 2 2 ]
        text = 'Mach %i Wall Run-Ups in einer Kombo.'
        alt_text = 'Mach %i Wall-Run-Up in einer Kombo.'
        value_trick = [ #"Wall Run-Up" #"Wall Run-Up" #"Wall Run-Up" ]
    }
    {
        group_num = 7
        stattype = Speed
        ability = None
        goaltype = combo
        value = [ 10000 50000 75000 ]
        text = 'Lande eine %i-Punkte-Kombo'
    }
    {
        group_num = 7
        stattype = run
        ability = wallflip
        goaltype = stringcount
        value = [ 1 2 3 ]
        text = 'Zeig einen %s %i Mal in Kombo'
        value_string = [ 'Wall\_flip' 'Wall\_flip' 'Wall\_flip' ]
    }
    {
        group_num = 7
        stattype = lip_balance
        ability = lip
        goaltype = liptime
        value = [ 1 2 3 ]
        text = 'Halte einen Lip-Trick %i Sekunden lang'
        alt_text = 'Halte einen Lip-Trick %i Sekunden lang'
    }
    {
        group_num = 7
        stattype = flip_speed
        ability = None
        goaltype = numfliptricks
        value = [ 2 3 5 ]
        text = 'Mach %i Flip-Tricks in einer Kombo'
    }
    {
        group_num = 8
        stattype = run
        ability = tag
        goaltype = trickcount
        value = [ 1 2 3 ]
        text = 'Zeig einen %s %i Mal in Kombo'
        value_trick = [ #"Graffiti Tag" #"Graffiti Tag" #"Graffiti Tag" ]
        value_string = [ 'Graffiti Tag' 'Graffiti Tag' 'Graffiti Tag' ]
        alt_text = '%s %i in einer Kombo'
        value_taps = [ 1 1 1 ]
    }
    {
        group_num = 8
        stattype = Air
        ability = None
        goaltype = vertdist
        value = [ 20 40 60 ]
        text = 'Mach einen Air-Transfer über %i Fuß'
    }
    {
        group_num = 8
        stattype = Switch
        ability = spine
        goaltype = stringcount
        value = [ 1 2 4 ]
        text = '%i %s in einer Kombo'
        value_string = [ 'Acid\_Drop' 'Acid\_Drop' 'Acid\_Drop' ]
        alt_text = '%s %i in einer Kombo'
    }
    {
        group_num = 8
        stattype = spin
        ability = None
        goaltype = numgrabs
        value = [ 3 4 10 ]
        text = 'Mach %i Grabs in einer Kombo'
    }
    {
        group_num = 9
        stattype = ollie
        ability = wallplant
        goaltype = trickcount
        value = [ 1 2 4 ]
        text = '%i %s in einer Kombo'
        alt_text = '%s %i in einer Kombo'
        value_trick = [ #"Sticker Slap" #"Sticker Slap" #"Sticker Slap" ]
        value_string = [ 'Sticker Slap' 'Sticker Slap' 'Sticker Slap' ]
        value_taps = [ 1 1 1 ]
    }
    {
        group_num = 9
        stattype = run
        ability = boardthrow
        goaltype = trickcount
        value = [ 1 1 2 ]
        text = 'Hau in einer Kombo %i Fußgänger um.'
        alt_text = 'Hau in einer Kombo %i Fußgänger um.'
        value_trick = [ Gotcha! Gotcha! Gotcha! ]
    }
    {
        group_num = 9
        stattype = lip_balance
        ability = stall
        goaltype = stringcount
        value = [ 1 2 3 ]
        text = '%i %s in einer Kombo'
        value_string = [ 'Stall' 'Stall' 'Stall' ]
        alt_text = '%s %i in einer Kombo'
    }
    {
        group_num = 9
        stattype = flip_speed
        ability = None
        goaltype = numfliptricks
        value = [ 3 4 10 ]
        text = 'Mach %i Flip-Tricks in einer Kombo'
    }
    {
        group_num = 10
        stattype = manual_balance
        ability = None
        goaltype = trickcount
        value = [ 1 3 5 ]
        text = 'Zeig einen %s %i Mal in Kombo'
        alt_text = '%s %i in einer Kombo'
        value_trick = [ Manual Manual Manual ]
        value_string = [ 'Manual' 'Manual' 'Manual' ]
        value_taps = [ 1 1 1 ]
    }
    {
        group_num = 10
        stattype = run
        ability = walkingflip
        goaltype = stringcount
        value = [ 1 2 4 ]
        text = 'Zeig einen %s %i Mal in Kombo'
        value_string = [ 'Front\_Tuck' 'Front\_Tuck' 'Front\_Tuck' ]
    }
    {
        group_num = 10
        stattype = ollie
        ability = None
        goaltype = highollie
        value = [ 10 20 25 ]
        text = 'Mach einen %i-Fuß-Ollie nach oben'
    }
    {
        group_num = 11
        stattype = ollie
        ability = None
        goaltype = olliedrop
        value = [ 10 15 25 ]
        text = 'Mach einen %i-Fuß-Ollie nach unten'
    }
    {
        group_num = 11
        stattype = Air
        ability = None
        goaltype = vertscore
        value = [ 1000 10000 20000 ]
        text = 'Lande einen %i-Punkte-Air'
    }
    {
        group_num = 11
        stattype = lip_balance
        ability = lip
        goaltype = liptime
        value = [ 3 4 5 ]
        text = 'Halte einen Lip-Trick %i Sekunden lang'
    }
    {
        group_num = 11
        stattype = ollie
        ability = wallplant
        goaltype = trickcount
        value = [ 1 2 3 ]
        text = 'Zeig einen %s %i Mal in Kombo'
        value_trick = [ wallplant wallplant wallplant ]
        value_string = [ 'Wallplant' 'Wallplant' 'Wallplant' ]
        value_taps = [ 1 1 1 ]
    }
    {
        group_num = 12
        stattype = spin
        ability = None
        goaltype = vertspin
        value = [ 540 720 900 ]
        text = 'Lande %i-Grab oder Flip in einer HP'
        no_commas
    }
    {
        group_num = 12
        stattype = Speed
        ability = None
        goaltype = combo
        value = [ 20000 100000 150000 ]
        text = 'Lande eine %i-Punkte-Kombo'
    }
    {
        group_num = 12
        stattype = flip_speed
        ability = None
        goaltype = numfliptricks
        value = [ 4 5 15 ]
        text = 'Mach %i Flip-Tricks in einer Kombo'
    }
    {
        group_num = 13
        stattype = lip_balance
        ability = lip
        goaltype = liptime
        value = [ 4 5 8 ]
        text = 'Halte einen Lip-Trick %i Sekunden lang'
    }
    {
        group_num = 13
        stattype = flip_speed
        ability = None
        goaltype = numfliptricks
        value = [ 5 8 13 ]
        text = 'Mach %i Flip-Tricks in einer Kombo'
    }
    {
        group_num = 13
        stattype = rail_balance
        ability = None
        goaltype = grindtime
        value = [ 4 5 10 ]
        text = 'Grinde %i Sekunden lang'
    }
    {
        group_num = 14
        stattype = manual_balance
        ability = freestyle
        goaltype = trickcount
        value = [ 2 5 6 ]
        text = 'Zeig einen %s %i Mal in Kombo'
        value_trick = [ Manual Manual Casper ]
        value_string = [ 'Manual' 'Manual' 'Casper' ]
        value_taps = [ 1 1 1 ]
    }
    {
        group_num = 14
        stattype = Switch
        ability = None
        goaltype = vertheight
        value = [ 30 70 100 ]
        text = 'Spring %i Fuß hoch'
    }
    {
        group_num = 14
        stattype = manual_balance
        ability = Manual
        goaltype = manualtime
        value = [ 8 10 12 ]
        text = 'Mach einen Manual über %i Sekunden'
    }
    {
        group_num = 15
        stattype = lip_balance
        ability = lip
        goaltype = liptime
        value = [ 6 7 10 ]
        text = 'Halte einen Lip-Trick %i Sekunden lang'
    }
    {
        group_num = 15
        stattype = Speed
        ability = None
        goaltype = combo
        value = [ 30000 250000 300000 ]
        text = 'Lande eine %i-Punkte-Kombo'
    }
    {
        group_num = 15
        stattype = run
        ability = caveman
        goaltype = stringcount
        value = [ 2 3 4 ]
        text = 'Zeig einen %s %i Mal in Kombo'
        value_string = [ 'Caveman' 'Caveman' 'Caveman' ]
    }
    {
        group_num = 16
        stattype = Air
        ability = flipandroll
        goaltype = stringcount
        value = [ 1 1 3 ]
        text = 'Mach %i %s Grabs in einer Kombo'
        value_string = [ 'BS\_Roll' 'BS\_Roll' 'BS\_Roll' ]
        alt_text = 'Lande %i %s-Grab'
    }
    {
        group_num = 16
        stattype = manual_balance
        ability = freestyle
        goaltype = trickcount
        value = [ 3 2 6 ]
        text = 'Zeig einen %s %i Mal in Kombo'
        value_trick = [ Manual Pogo #"Half Cab Impossible" ]
        value_string = [ 'Manual' 'Pogo' 'Half Cab Impossible' ]
        value_taps = [ 1 1 1 ]
    }
    {
        group_num = 16
        stattype = Switch
        ability = None
        goaltype = multiplier
        value = [ 7 10 25 ]
        text = 'Lande eine %i-Trick-Kombo'
    }
    {
        group_num = 17
        stattype = flip_speed
        ability = None
        goaltype = numfliptricks
        value = [ 6 10 50 ]
        text = 'Mach %i Flip-Tricks in einer Kombo'
    }
    {
        group_num = 17
        stattype = lip_balance
        ability = lip
        goaltype = liptime
        value = [ 5 8 10 ]
        text = 'Halte einen Lip-Trick %i Sekunden lang'
    }
    {
        group_num = 17
        stattype = spin
        ability = None
        goaltype = numgrabs
        value = [ 4 6 9 ]
        text = 'Mach %i Grabs in einer Kombo'
    }
    {
        group_num = 18
        stattype = Air
        ability = None
        goaltype = vertscore
        value = [ 2000 15000 20000 ]
        text = 'Lande einen %i-Punkte-Air'
    }
    {
        group_num = 18
        stattype = Speed
        ability = spine
        goaltype = stringcount
        value = [ 2 4 6 ]
        text = '%i %s in einer Kombo'
        value_string = [ 'Spine\_Transfer' 'Spine\_Transfer' 'Spine\_Transfer' ]
        alt_text = '%s %i in einer Kombo'
    }
    {
        group_num = 18
        stattype = rail_balance
        ability = None
        goaltype = grindtime
        value = [ 6 10 20 ]
        text = 'Grinde %i Sekunden lang'
    }
    {
        group_num = 19
        stattype = flip_speed
        ability = doubletapflip
        goaltype = trickcount
        value = [ 1 2 4 ]
        text = 'Zeig einen %s %i Mal in Kombo'
        alt_text = '%s %i in einer Kombo'
        value_trick = [ Trick_Kickflip Trick_Kickflip Trick_Heelflip ]
        value_string = [ 'Double Kickflip' 'Double Kickflip' 'Double Heelflip' ]
        value_taps = [ 2 2 2 ]
    }
    {
        group_num = 19
        stattype = lip_balance
        ability = lip
        goaltype = stringcount
        value = [ 1 2 3 ]
        text = '%i %s an einem Rail in einer Kombo'
        value_string = [ 'Stall' 'Stall' 'Stall' ]
        alt_text = '%s %i in einer Kombo'
    }
    {
        group_num = 19
        stattype = Switch
        ability = None
        goaltype = multiplier
        value = [ 9 15 40 ]
        text = 'Lande eine %i-Trick-Kombo'
    }
    {
        group_num = 20
        stattype = rail_balance
        ability = None
        goaltype = stringcount
        value = [ 4 3 5 ]
        text = 'Zeig einen %s %i Mal in Kombo'
        value_string = [ '50-50' 'Crooked' 'Darkslide' ]
    }
    {
        group_num = 20
        stattype = spin
        ability = None
        goaltype = vertspin
        value = [ 720 900 1080 ]
        text = 'Lande %i-Grab oder Flip in einer HP'
        no_commas
    }
    {
        group_num = 20
        stattype = flip_speed
        ability = tripletapflip
        goaltype = trickcount
        value = [ 2 2 3 ]
        text = 'Zeig einen %s %i Mal in Kombo'
        value_trick = [ Trick_Kickflip Trick_Kickflip Trick_Kickflip ]
        value_string = [ 'Double Kickflip' 'Triple Kickflip' 'Triple Kickflip' ]
        value_taps = [ 2 3 3 ]
    }
]

script show_stats_message 
    if GotParam got_it
        SpawnScriptLater game_progress_process_status params = { wait_time = 2 }
        rgba = [ 0 90 0 128 ]
        wait_and_die = wait_and_die
        if GotParam stat_increase
            FormatText textname = text '%i +%j' i = <text> j = <stat_increase>
        endif
    else
        rgba = [ 100 100 100 128 ]
        dont_die = dont_die
    endif
    if GotParam value
        if NOT StructureContains structure = (stats_goals [ <index> ])no_commas
            FormatText textname = text <string> i = <value> s = <vstring> usecommas
        else
            FormatText textname = text <string> i = <value> s = <vstring>
        endif
    endif
    create_console_message text = <text> rgba = <rgba> wait_and_die = <wait_and_die> dont_die = <dont_die> time = 3
endscript

script stats_message_bail 
    if NOT InNetGame
        console_clear
    endif
endscript

script stats_message_land 
    index = 0
    begin 
    id = {console_message_vmenu child = <index>}
    if ScreenElementExists id = <id>
        RunScriptOnScreenElement id = <id> console_message_wait_and_die params = { time = 2 }
    else
        break 
    endif
    index = (<index> + 1)
    repeat 
endscript

script beat_first_stat_goal 
    printf 'beat_first_stat_goal-----------------------------'
    return 
    pausegame
    wait 1 gameframe
    PauseMusicAndStreams 1
    pause_trick_text
    pause_balance_meter
    pause_run_timer
    kill_blur
    if ObjectExists id = speech_box_anchor
        RunScriptOnScreenElement id = speech_box_anchor hide_screen_element
    endif
    if ScreenElementExists id = goal_start_dialog
        DestroyScreenElement id = goal_start_dialog
    endif
    if ObjectExists id = ped_speech_dialog
        DestroyScreenElement id = ped_speech_dialog
    endif
    if ObjectExists id = goal_retry_anchor
        DestroyScreenElement id = goal_retry_anchor
    endif
    hide_goal_panel_messages
    GoalManager_PauseAllGoals
    create_dialog_box {
        Title = 'Stat verbessert!'
        text = 'Wenn du die Stat-Challenges meisterst, kannst du deine Skate-Fähigkeiten verbessern. Pausiere das Spiel und sieh dir im Menü \'Stats ansehen\' Challenges an.'
        buttons = [{font = small text = 'OK' pad_choose_script = kill_stat_goal_dialog}]
    }
    SpawnScriptLater stats_message_kill_vibration
endscript

script stats_message_kill_vibration 
    wait \{ 3 gameframes }
    skater ::vibrate \{ Off }
endscript

script kill_stat_goal_dialog 
    dialog_box_exit
    KillSpawnedScript \{ name = stats_message_kill_vibration }
    unpause_trick_text
    Unpause_Balance_Meter
    unpause_run_timer
    show_goal_panel_messages
    GoalManager_UnPauseAllGoals
    UnPauseGame
    wait \{ 1 gameframe }
    UnpauseMusicAndStreams
endscript

script show_vert_combo_message 
    FormatText textname = text '%i-Punkte-Air-Kombo' i = <Score>
    create_console_message text = <text> rgba = [ 50 50 90 128 ] wait_and_die = wait_and_die time = 3
endscript

script stat_play_win_sound 
    if GameModeEquals \{ is_classic }
        classic_stat_message_popup
    else
        stat_message_popup
    endif
    SpawnSound \{ stat_goal_success }
endscript

script stat_update_complete 
    if GameModeEquals \{ is_career }
        CareerFunc \{ func = CompleteStoryStatChallenge }
    endif
endscript

script showed_stat_message_sound 
    SpawnSound \{ stat_goal_appear }
endscript

script stat_message_popup 
    FormatText \{ textname = message 'STATS VERBESSERT!' }
    create_panel_message {
        id = stat_completed_message
        text = <message>
        style = goal_message_stat_up
    }
endscript

script classic_stat_message_popup 
    FormatText \{ textname = message 'DU HAST EINEN STAT-PUNKT!' }
    create_panel_message {
        id = stat_completed_message
        text = <message>
        style = goal_message_stat_up
    }
endscript

script hide_stat_message 
    if ObjectExists \{ id = stat_completed_message }
        DoScreenElementMorph \{ id = stat_completed_message time = 0 alpha = 0 }
    endif
endscript

script unhide_stat_message 
    if ObjectExists \{ id = stat_completed_message }
        DoScreenElementMorph \{ id = stat_completed_message time = 0 restore_alpha }
    endif
endscript

script startup_handle_stats 
    if cd
        change \{ level_stats = 0 }
        change \{ bump_stats = 1 }
    else
        if InFrontend
            change \{ entered_from_autolaunch = 0 }
        endif
        if GameModeEquals \{ is_career }
            change \{ level_stats = 0 }
            change \{ bump_stats = 1 }
        endif
        if GameModeEquals \{ is_classic }
            change \{ level_stats = 0 }
            change \{ bump_stats = 0 }
        endif
    endif
endscript

script setup_classic_stat_nodes 
    max_num_level_stats = 12
    start_index = 380
    printf '* Looking for classic stat nodes...'
    index = 1
    begin 
    FormatText textname = stat_node_text '%l_TRG_Classic_Stat_%i' l = <level> i = <index> integer_width = 2
    FormatText checksumname = stat_node '%l_TRG_Classic_Stat_%i' l = <level> i = <index> integer_width = 2
    stat_node_flag = (<index> + <start_index>)
    if IsInNodeArray <stat_node>
        GetNode <stat_node>
        creation_params = {
            <node>
            triggerscript = classic_stat_node_behavior
            params = { flag = <stat_node_flag> }
        }
        if IsCreated <stat_node>
            <stat_node> ::Die
        endif
        if GameModeEquals is_classic
            if NOT GetFlag flag = <stat_node_flag>
                CreateFromStructure <creation_params>
                printf '%a created with level flag %b' a = <stat_node_text> b = <stat_node_flag>
            else
                printf '%a (%b) already got' a = <stat_node_text> b = <stat_node_flag>
            endif
        else
        endif
    endif
    index = (<index> + 1)
    repeat <max_num_level_stats>
endscript

script classic_stat_node_behavior 
    Obj_ClearExceptions
    Obj_SetException Ex = anyobjectinradius scr = classic_stat_node_get params = { flag = <flag> }
    obj_setinnerradius \{ 12 }
    obj_roty \{ Speed = 250 }
    obj_hover \{ amp = 10 freq = 1 }
endscript

script classic_stat_node_get 
    Obj_ClearExceptions
    AwardStatPoint
    printf 'Got stat point, setting level flag %a' a = <flag>
    SetFlag flag = <flag>
    Die
endscript

script sponsor_goals_warn_end 
    GetLevelStructureName
    FormatText checksumname = level_checksum '%l' l = (<level_structure_name>.level)
    skater ::StatsManager_GetGroupNumFromLevel <level_checksum>
    if GotParam group_num
        <show_message> = 0
        GetArraySize stats_goals
        <index> = 0
        begin 
        if ((stats_goals [ <index> ].group_num)= <group_num>)
            skater ::StatsManager_GetGoalStatus num = <index>
            if NOT ChecksumEquals a = <status> b = complete
                <show_message> = 1
                break 
            endif
        endif
        <index> = (<index> + 1)
        repeat <array_size>
        if ((igc_playing)= 1)
            <show_message> = 0
        endif
        if ((cat_pak_is_loaded)= 1)
            <show_message> = 0
        endif
        if ((in_telescope_cam)= 1)
            <show_message> = 0
        endif
        if (<show_message> = 1)
            create_console_message text = 'Tägliche Sponsoren-Challenges\nenden um Mitternacht!\n\nBesuch den Skateshop!' rgba = [ 60 60 128 110 ] wait_and_die = wait_and_die time = 5
            goal_got_flag_sound
        endif
    endif
endscript

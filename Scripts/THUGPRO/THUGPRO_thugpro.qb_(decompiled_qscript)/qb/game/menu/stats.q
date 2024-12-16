
bump_stats = 0 
level_stats = 0 
stat_names = [ { name = air string = "Air" description = "Your jump height out of a half pipe" } 
	{ name = lip_balance string = "Lip" description = "How well you balance during lip trick stalls" } 
	{ name = run string = "Run" description = "How long your run timer will last" } 
	{ name = flip_speed string = "Flip Speed" short_string = "Flip" description = "How fast your flip tricks will turn" } 
	{ name = rail_balance string = "Rail" description = "How well you balance on rails" } 
	{ name = spin string = "Spin" description = "How fast you spin in the air" } 
	{ name = ollie string = "Ollie" description = "How high you jump on flat ground" } 
	{ name = speed string = "Speed" description = "Your top speed on the ground" } 
	{ name = switch string = "Switch" description = "When maxed, skate equally well switch and regular" } 
	{ name = manual_balance string = "Manual" description = "How well you balance during manuals" } 
] 
manual_increase_text = "Manual +1" 
rail_increase_text = "Rail +1" 
lip_increase_text = "Lip +1" 
speed_increase_text = "Speed +1" 
ollie_increase_text = "Ollie +1" 
air_increase_text = "Air +1" 
flip_increase_text = "Flip +1" 
switch_increase_text = "Switch +1" 
spin_increase_text = "Spin +1" 
run_increase_text = "Run +1" 
stats_goals = [ 
	{ stattype = manual_balance goaltype = manualtime value = [ 2 , 4 , 6 ] complete = 0 text = "Manual for %i seconds" } 
	{ stattype = manual_balance goaltype = manualtime value = [ 4 , 6 , 10 ] complete = 0 text = "Manual for %i seconds" } 
	{ stattype = manual_balance goaltype = manualtime value = [ 6 , 8 , 14 ] complete = 0 text = "Manual for %i seconds" } 
	{ stattype = manual_balance goaltype = manualtime value = [ 8 , 10 , 17 ] complete = 2 text = "Manual for %i seconds" } 
	{ stattype = manual_balance goaltype = trickcount value = [ 1 , 3 , 5 ] complete = 2 text = "%s %i times in one combo" alt_text = "%s %i time in a combo" value_trick = [ Manual , Manual , Pogo ] value_string = [ "Manual" , "Manual" , "Pogo" ] value_taps = [ 1 , 1 , 1 ] } 
	{ stattype = manual_balance goaltype = trickcount value = [ 2 , 5 , 6 ] complete = 3 text = "%s %i times in one combo" value_trick = [ Manual , Manual , Casper ] value_string = [ "Manual" , "Manual" , "Casper" ] value_taps = [ 1 , 1 , 1 ] } 
	{ stattype = manual_balance goaltype = trickcount value = [ 3 , 2 , 6 ] complete = 3 text = "%s %i times in one combo" value_trick = [ Manual , Pogo , %"Half Cab Impossible" ] value_string = [ "Manual" , "Pogo" , "Half Cab Impossible" ] value_taps = [ 1 , 1 , 1 ] } 
	{ stattype = rail_balance goaltype = grindtime value = [ 2 , 5 , 10 ] complete = 0 text = "Grind for %i seconds" } 
	{ stattype = rail_balance goaltype = grindtime value = [ 4 , 10 , 15 ] complete = 0 text = "Grind for %i seconds" } 
	{ stattype = rail_balance goaltype = grindtime value = [ 8 , 15 , 20 ] complete = 0 text = "Grind for %i seconds" } 
	{ stattype = rail_balance goaltype = grindtime value = [ 10 , 20 , 25 ] complete = 2 text = "Grind for %i seconds" } 
	{ stattype = rail_balance goaltype = trickcount value = [ 1 , 3 , 5 ] complete = 0 text = "Natas Spin %i times in one combo" alt_text = "Natas Spin %i time in a combo" value_trick = [ %"Natas Spin" , %"Natas Spin" , %"Natas Spin" ] } 
	{ stattype = rail_balance goaltype = stringcount value = [ 2 , 3 , 5 ] complete = 2 text = "%s %i times in one combo" value_string = [ "50-50" , "50-50" , "Crooked" ] } 
	{ stattype = rail_balance goaltype = stringcount value = [ 4 , 3 , 5 ] complete = 3 text = "%s %i times in one combo" value_string = [ "50-50" , "Crooked" , "Darkslide" ] } 
	{ stattype = lip_balance goaltype = liptime value = [ 1 , 2 , 3 ] complete = 0 text = "Hold a liptrick for %i seconds" alt_text = "Hold a liptrick for %i second" } 
	{ stattype = lip_balance goaltype = liptime value = [ 3 , 4 , 5 ] complete = 0 text = "Hold a liptrick for %i seconds" } 
	{ stattype = lip_balance goaltype = liptime value = [ 4 , 5 , 8 ] complete = 2 text = "Hold a liptrick for %i seconds" } 
	{ stattype = lip_balance goaltype = liptime value = [ 6 , 7 , 10 ] complete = 3 text = "Hold a liptrick for %i seconds" } 
	{ stattype = lip_balance goaltype = liptime value = [ 7 , 8 , 13 ] complete = 3 text = "Hold a liptrick for %i seconds" } 
	{ stattype = lip_balance goaltype = stringcount value = [ 1 , 2 , 3 ] complete = 0 text = "%s on a lip %i times in a combo" value_string = [ "Nose\\_Stall" , "Nose\\_Stall" , "BS\\_Boneless" ] alt_text = "%s %i time in a combo" } 
	{ stattype = lip_balance goaltype = stringcount value = [ 2 , 2 , 3 ] complete = 0 text = "%s on a lip %i times in a combo" value_string = [ "Nose\\_Stall" , "FS\\_Noseblunt" , "Gymnast\\_Plant" ] } 
	{ stattype = speed goaltype = combo value = [ 1000 , 10000 , 100000 ] complete = 0 text = "Land a %i point combo" } 
	{ stattype = speed goaltype = combo value = [ 7500 , 30000 , 400000 ] complete = 0 text = "Land a %i point combo" } 
	{ stattype = speed goaltype = combo value = [ 10000 , 50000 , 750000 ] complete = 2 text = "Land a %i point combo" } 
	{ stattype = speed goaltype = combo value = [ 20000 , 100000 , 1500000 ] complete = 3 text = "Land a %i point combo" } 
	{ stattype = speed goaltype = combo value = [ 30000 , 250000 , 3000000 ] complete = 3 text = "Land a %i point combo" } 
	{ stattype = speed goaltype = stringcount value = [ 1 , 2 , 3 ] complete = 0 text = "%s %i times in a combo" value_string = [ "Spine\\_Transfer" , "Spine\\_Transfer" , "Spine\\_Transfer" ] alt_text = "%s %i time in one combo" } 
	{ stattype = speed goaltype = stringcount value = [ 2 , 4 , 6 ] complete = 0 text = "%s %i times in a combo" value_string = [ "Spine\\_Transfer" , "Spine\\_Transfer" , "Spine\\_Transfer" ] alt_text = "%s %i time in one combo" } 
	{ stattype = air goaltype = vertdist value = [ 15 , 30 , 40 ] complete = 0 text = "Air transfer %i feet" } 
	{ stattype = air goaltype = vertdist value = [ 20 , 40 , 60 ] complete = 0 text = "Air transfer %i feet" } 
	{ stattype = air goaltype = stringcount value = [ 1 , 1 , 2 ] complete = 0 text = "Land %i %s grabs in one combo" value_string = [ "Backflip" , "Backflip" , "Backflip" ] alt_text = "Land %i %s grab" } 
	{ stattype = air goaltype = stringcount value = [ 1 , 1 , 3 ] complete = 0 text = "Land %i %s grabs in one combo" value_string = [ "BS\\_Roll" , "BS\\_Roll" , "BS\\_Roll" ] alt_text = "Land %i %s grab" } 
	{ stattype = air goaltype = vertscore value = [ 500 , 5000 , 10000 ] complete = 2 text = "Land a %i point air" } 
	{ stattype = air goaltype = vertscore value = [ 1000 , 10000 , 20000 ] complete = 3 text = "Land a %i point air" } 
	{ stattype = air goaltype = vertscore value = [ 2000 , 15000 , 40000 ] complete = 3 text = "Land a %i point air" } 
	{ stattype = run goaltype = stringcount value = [ 1 , 2 , 3 ] complete = 0 text = "%s %i times in one combo" value_string = [ "Caveman" , "Caveman" , "Caveman" ] alt_text = "%s %i time in a combo" } 
	{ stattype = run goaltype = stringcount value = [ 2 , 3 , 4 ] complete = 0 text = "%s %i times in one combo" value_string = [ "Caveman" , "Caveman" , "Caveman" ] } 
	{ stattype = run goaltype = trickcount value = [ 1 , 2 , 4 ] complete = 0 text = "Throw something at %i pedestrians in one combo" alt_text = "Throw something at %i pedestrian in one combo" value_trick = [ %"Gotcha!" , %"Gotcha!" , %"Gotcha!" ] } 
	{ stattype = run goaltype = trickcount value = [ 2 , 4 , 7 ] complete = 0 text = "Throw something at %i pedestrians in one combo" value_trick = [ %"Gotcha!" , %"Gotcha!" , %"Gotcha!" ] } 
	{ stattype = run goaltype = trickcount value = [ 1 , 2 , 2 ] complete = 0 text = "%s %i times in one combo" value_trick = [ %"Graffiti Tag" , %"Graffiti Tag" , %"Graffiti Tag" ] value_string = [ "Graffiti Tag" , "Graffiti Tag" , "Graffiti Tag" ] alt_text = "%s %i time in a combo" value_taps = [ 1 , 1 , 1 ] } 
	{ stattype = run goaltype = trickcount value = [ 2 , 3 , 3 ] complete = 0 text = "%s %i times in one combo" value_trick = [ %"Graffiti Tag" , %"Graffiti Tag" , %"Graffiti Tag" ] value_string = [ "Graffiti Tag" , "Graffiti Tag" , "Graffiti Tag" ] alt_text = "%s %i time in a combo" value_taps = [ 1 , 1 , 1 ] } 
	{ stattype = run goaltype = stringcount value = [ 1 , 1 , 1 ] complete = 0 text = "Get mad and Freak Out" value_string = [ "FREAK\\_OUT!" , "FREAK\\_OUT!" , "FREAK\\_OUT!" ] value_trick = [ %"Freak Out!" , %"Freak Out!" , %"Freak Out!" ] value_taps = [ 1 , 1 , 1 ] } 
	{ stattype = switch goaltype = stringcount value = [ 1 , 2 , 4 ] complete = 0 text = "%s %i times in a combo" value_string = [ "Acid\\_Drop" , "Acid\\_Drop" , "Acid\\_Drop" ] alt_text = "%s %i time in a combo" } 
	{ stattype = switch goaltype = vertheight value = [ 20 , 40 , 60 ] complete = 3 text = "Air %i feet high" } 
	{ stattype = switch goaltype = vertheight value = [ 30 , 70 , 100 ] complete = 3 text = "Air %i feet high" } 
	{ stattype = switch goaltype = multiplier value = [ 3 , 4 , 25 ] complete = 0 text = "Land a %i trick combo" } 
	{ stattype = switch goaltype = multiplier value = [ 5 , 6 , 50 ] complete = 0 text = "Land a %i trick combo" } 
	{ stattype = switch goaltype = multiplier value = [ 7 , 10 , 75 ] complete = 2 text = "Land a %i trick combo" } 
	{ stattype = switch goaltype = multiplier value = [ 9 , 20 , 100 ] complete = 3 text = "Land a %i trick combo" } 
	{ stattype = spin goaltype = vertspin value = [ 360 , 540 , 720 ] complete = 0 text = "Land a %i grab or fliptrick in a halfpipe" no_commas } 
	{ stattype = spin goaltype = vertspin value = [ 540 , 720 , 900 ] complete = 0 text = "Land a %i grab or fliptrick in a halfpipe" no_commas } 
	{ stattype = spin goaltype = vertspin value = [ 720 , 900 , 1080 ] complete = 0 text = "Land a %i grab or fliptrick in a halfpipe" no_commas } 
	{ stattype = spin goaltype = numgrabs value = [ 2 , 3 , 5 ] complete = 2 text = "Do %i grabs in one combo" } 
	{ stattype = spin goaltype = numgrabs value = [ 3 , 4 , 10 ] complete = 2 text = "Do %i grabs in one combo" } 
	{ stattype = spin goaltype = numgrabs value = [ 4 , 6 , 20 ] complete = 3 text = "Do %i grabs in one combo" } 
	{ stattype = spin goaltype = numgrabs value = [ 5 , 8 , 30 ] complete = 3 text = "Do %i grabs in one combo" } 
	{ stattype = ollie goaltype = olliedist value = [ 30 , 45 , 60 ] complete = 0 text = "Ollie %s feet" value_string = [ "15" , "20" , "30" ] } 
	{ stattype = ollie goaltype = highollie value = [ 5 , 10 , 20 ] complete = 2 text = "Ollie up %i feet" } 
	{ stattype = ollie goaltype = highollie value = [ 10 , 20 , 25 ] complete = 2 text = "Ollie up %i feet" } 
	{ stattype = ollie goaltype = olliedrop value = [ 10 , 15 , 25 ] complete = 3 text = "Ollie down %i feet" } 
	{ stattype = ollie goaltype = olliedrop value = [ 15 , 20 , 35 ] complete = 3 text = "Ollie down %i feet" } 
	{ stattype = ollie goaltype = trickcount value = [ 1 , 2 , 4 ] complete = 2 text = "%s %i times in a combo" alt_text = "%s %i time in a combo" value_trick = [ %"Sticker Slap" , %"Sticker Slap" , %"Sticker Slap" ] value_string = [ "Sticker Slap" , "Sticker Slap" , "Sticker Slap" ] value_taps = [ 1 , 1 , 1 ] } 
	{ stattype = ollie goaltype = trickcount value = [ 2 , 4 , 6 ] complete = 2 text = "%s %i times in one combo" value_trick = [ %"Sticker Slap" , %"Sticker Slap" , %"Sticker Slap" ] value_string = [ "Sticker Slap" , "Sticker Slap" , "Sticker Slap" ] value_taps = [ 1 , 1 , 1 ] } 
	{ stattype = flip_speed goaltype = numfliptricks value = [ 2 , 3 , 5 ] complete = 0 text = "Do %i fliptricks in one combo" } 
	{ stattype = flip_speed goaltype = numfliptricks value = [ 3 , 4 , 10 ] complete = 0 text = "Do %i fliptricks in one combo" } 
	{ stattype = flip_speed goaltype = numfliptricks value = [ 4 , 5 , 20 ] complete = 2 text = "Do %i fliptricks in one combo" } 
	{ stattype = flip_speed goaltype = numfliptricks value = [ 5 , 8 , 30 ] complete = 3 text = "Do %i fliptricks in one combo" } 
	{ stattype = flip_speed goaltype = numfliptricks value = [ 6 , 10 , 50 ] complete = 3 text = "Do %i fliptricks in one combo" } 
	{ stattype = flip_speed goaltype = trickcount value = [ 1 , 2 , 4 ] complete = 0 text = "%s %i times in one combo" alt_text = "%s %i time in a combo" value_trick = [ Trick_Kickflip , Trick_Kickflip , Trick_Heelflip ] value_string = [ "Double Kickflip" , "Double Kickflip" , "Double Heelflip" ] value_taps = [ 2 , 2 , 2 ] } 
	{ stattype = flip_speed goaltype = trickcount value = [ 2 , 2 , 3 ] complete = 2 text = "%s %i times in one combo" value_trick = [ Trick_Kickflip , Trick_Kickflip , Trick_Kickflip ] value_string = [ "Double Kickflip" , "Triple Kickflip" , "Triple Kickflip" ] value_taps = [ 2 , 3 , 3 ] } 
] 
SCRIPT show_stats_message 
	SpawnScript show_stats_message2 params = { <...> } 
ENDSCRIPT

SCRIPT show_stats_message2 
	IF GotParam got_it 
		rgba = [ 0 90 0 128 ] 
		wait_and_die = wait_and_die 
	ELSE 
		rgba = [ 100 100 100 128 ] 
		dont_die = dont_die 
	ENDIF 
	IF GotParam value 
		IF NOT StructureContains structure = ( stats_goals [ <index> ] ) no_commas 
			FormatText textname = text <string> i = <value> s = <vstring> UseCommas 
		ELSE 
			FormatText textname = text <string> i = <value> s = <vstring> 
		ENDIF 
	ENDIF 
	create_console_message text = <text> rgba = <rgba> wait_and_die = <wait_and_die> dont_die = <dont_die> time = 3 
ENDSCRIPT

SCRIPT stats_message_bail 
	IF NOT InNetGame 
		console_clear 
	ENDIF 
ENDSCRIPT

SCRIPT stats_message_land 
	SpawnScript stats_message_land2 params = { <...> } 
ENDSCRIPT

SCRIPT stats_message_land2 
	index = 0 
	BEGIN 
		id = { console_message_vmenu child = <index> } 
		IF ScreenElementExists id = <id> 
			RunScriptOnScreenElement id = <id> console_message_wait_and_die params = { time = 2 } 
		ELSE 
			BREAK 
		ENDIF 
		index = ( <index> + 1 ) 
	REPEAT 
ENDSCRIPT

SCRIPT beat_first_stat_goal 
	printf "beat_first_stat_goal-----------------------------" 
	IF ( bump_stats = 0 ) 
		RETURN 
	ENDIF 
	PauseGame 
	wait 1 gameframe 
	PauseMusicAndStreams 1 
	pause_trick_text 
	pause_balance_meter 
	pause_run_timer 
	kill_blur 
	IF ObjectExists id = speech_box_anchor 
		RunScriptOnScreenElement id = speech_box_anchor hide_screen_element 
	ENDIF 
	IF ScreenElementExists id = goal_start_dialog 
		DestroyScreenElement id = goal_start_dialog 
	ENDIF 
	IF ObjectExists id = ped_speech_dialog 
		DestroyScreenElement id = ped_speech_dialog 
	ENDIF 
	IF ObjectExists id = goal_retry_anchor 
		DestroyScreenElement id = goal_retry_anchor 
	ENDIF 
	hide_goal_panel_messages 
	GoalManager_PauseAllGoals 
	create_dialog_box { 
		title = "Stat Increased!" 
		text = "Beating Stat Challenges will increase your skating abilities. Pause the game and go to the View Stats menu to see a list of challenges." 
		buttons = [ { font = small text = "Ok" pad_choose_script = kill_stat_goal_dialog } ] 
	} 
	SpawnScript stats_message_kill_vibration 
ENDSCRIPT

SCRIPT stats_message_kill_vibration 
	wait 3 gameframes 
	Skater : Vibrate off 
ENDSCRIPT

SCRIPT kill_stat_goal_dialog 
	dialog_box_exit 
	KillSpawnedScript name = stats_message_kill_vibration 
	unpause_trick_text 
	unpause_balance_meter 
	unpause_run_timer 
	show_goal_panel_messages 
	GoalManager_UnpauseAllGoals 
	UnpauseGame 
	wait 1 gameframe 
	UnpauseMusicAndStreams 
ENDSCRIPT

SCRIPT show_vert_combo_message 
	FormatText textname = text "%i Point Air Combo" i = <score> 
	create_console_message text = <text> rgba = [ 50 50 90 128 ] wait_and_die = wait_and_die time = 3 
ENDSCRIPT

SCRIPT stat_play_win_sound 
	IF GameModeEquals is_classic 
		classic_stat_message_popup 
	ELSE 
		stat_message_popup 
	ENDIF 
	spawnsound stat_goal_success 
ENDSCRIPT

SCRIPT showed_stat_message_sound 
	spawnsound stat_goal_appear 
ENDSCRIPT

SCRIPT stat_message_popup 
	FormatText textname = message "STATS INCREASED!" 
	create_panel_message { 
		id = stat_completed_message 
		text = <message> 
		style = goal_message_stat_up 
	} 
ENDSCRIPT

SCRIPT classic_stat_message_popup 
	FormatText textname = message "YOU GOT A STAT POINT!" 
	create_panel_message { 
		id = stat_completed_message 
		text = <message> 
		style = goal_message_stat_up 
	} 
ENDSCRIPT

SCRIPT hide_stat_message 
	IF ObjectExists id = stat_completed_message 
		DoScreenElementMorph id = stat_completed_message time = 0 alpha = 0 
	ENDIF 
ENDSCRIPT

SCRIPT unhide_stat_message 
	IF ObjectExists id = stat_completed_message 
		DoScreenElementMorph id = stat_completed_message time = 0 restore_alpha 
	ENDIF 
ENDSCRIPT

SCRIPT startup_handle_stats 
	IF cd 
		change level_stats = 0 
		change bump_stats = 1 
	ELSE 
		IF GotParam frontend_level 
			change entered_from_autolaunch = 0 
		ENDIF 
		IF ( entered_from_autolaunch = 1 ) 
			change level_stats = 1 
		ELSE 
			IF GameModeEquals is_career 
				change level_stats = 0 
				change bump_stats = 1 
			ENDIF 
			IF GameModeEquals is_classic 
				change level_stats = 0 
				change bump_stats = 0 
			ENDIF 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT setup_classic_stat_nodes 
	max_level_flag = 255 
	max_num_level_stats = 5 
	start_index = ( <max_level_flag> - <max_num_level_stats> ) 
	printf "* Looking for classic stat nodes..." 
	index = 1 
	BEGIN 
		FormatText textname = stat_node_text "TRG_%l_Classic_Stat_%i" l = <level> i = <index> integer_width = 2 
		FormatText checksumname = stat_node "TRG_%l_Classic_Stat_%i" l = <level> i = <index> integer_width = 2 
		stat_node_flag = ( <index> + <start_index> ) 
		IF NodeExists <stat_node> 
			AppendNodeParams node = <stat_node> params = { TriggerScript = classic_stat_node_behavior params = { flag = <stat_node_flag> } } 
			IF IsAlive name = <stat_node> 
				<stat_node> : Die 
			ENDIF 
			IF GameModeEquals is_classic 
				IF NOT GetFlag level = <level_num> flag = <stat_node_flag> 
					Create name = <stat_node> 
					printf "%a created with level flag %b" a = <stat_node_text> b = <stat_node_flag> 
				ELSE 
					printf "%a (%b) already got" a = <stat_node_text> b = <stat_node_flag> 
				ENDIF 
			ELSE 
			ENDIF 
		ENDIF 
		index = ( <index> + 1 ) 
	REPEAT <max_num_level_stats> 
ENDSCRIPT

SCRIPT classic_stat_node_behavior 
	Obj_ClearExceptions 
	Obj_SetException ex = ObjectInRadius scr = classic_stat_node_get params = { flag = <flag> } 
	Obj_SetInnerRadius 12 
	Obj_RotY speed = 250 
	Obj_Hover Amp = 10 Freq = 1 
ENDSCRIPT

SCRIPT classic_stat_node_get 
	Obj_ClearExceptions 
	AwardStatPoint 
	printf "Got stat point, setting level flag %a" a = <flag> 
	SetFlag flag = <flag> 
	Die 
ENDSCRIPT




SentObjectPlacements = 0 
SentStartMessage = 0 
goal_scavenger_genericParams = { 
	goal_text = "Collect All Objects to Win!" 
	time = 10 
	net 
	dont_deactivate_upon_expiration 
	game_continues_after_expiration 
	init = goal_scavenger_init 
	active = goal_scavenger_active 
	activate = goal_scavenger_activate 
	deactivate = goal_scavenger_deactivate 
	expire = goal_scavenger_expire 
	goal_description = "Scavenger Hunt!" 
} 
SCRIPT goal_scavenger_init 
ENDSCRIPT

SCRIPT goal_scavenger_active 
ENDSCRIPT

SCRIPT goal_scavenger_activate 
	change SentObjectPlacements = 0 
	change SentStartMessage = 0 
	FormatText TextName = msg_text "\\c2Scavenger Hunt:\\c0\\n\\b7 + \\b1 to place objects!" 
	msg_pos = PAIR(620.00000000000, 27.00000000000) 
	IF InSplitScreenGame 
		ScriptGetScreenMode 
		IF ( <screen_mode> = split_vertical ) 
			msg_pos = PAIR(400.00000000000, 44.00000000000) 
		ELSE 
			msg_pos = PAIR(640.00000000000, 204.00000000000) 
		ENDIF 
	ENDIF 
	IF ObjectExists id = mp_goal_text 
		DestroyScreenElement id = mp_goal_text 
	ENDIF 
	create_panel_block parent = root_window id = mp_goal_text text = <msg_text> style = panel_message_goal final_pos = <msg_pos> font_face = testtitle dims = PAIR(300.00000000000, 0.00000000000) 
	IF ScreenElementExists id = the_time 
		SetScreenElementProps { 
			id = the_time 
			unhide 
		} 
	ENDIF 
	RunScriptOnScreenElement id = the_time clock_morph 
	IF NOT IsObserving 
		bind_scavenger_tricks 
	ENDIF 
	IF InSplitScreenGame 
		bind_scavenger_tricks_player_2 
	ENDIF 
ENDSCRIPT

SCRIPT goal_scavenger_deactivate 
	IF NOT GoalManager_GoalIsActive name = scavenger_collect_period 
		IF NOT GoalManager_GoalIsActive name = scavenger_interval 
			IF ObjectExists id = mp_goal_text 
				DestroyScreenElement id = mp_goal_text 
			ENDIF 
		ENDIF 
	ENDIF 
	IF NOT IsObserving 
		unbind_scavenger_tricks 
	ENDIF 
	IF InSplitScreenGame 
		unbind_scavenger_tricks_player_2 
	ENDIF 
ENDSCRIPT

SCRIPT goal_scavenger_add_time 
	create_net_panel_message text = "You must place at least one object!" style = net_team_panel_message msg_time = 3000 
	GoalManager_AddTime name = scavenger 15 
ENDSCRIPT

SCRIPT goal_scavenger_expire 
	IF AtLeastOneObjectPlaced 
		GoalManager_DeactivateGoal name = scavenger 
		IF OnServer 
			StartGoal_Scavenger_Interval time = 6 
		ELSE 
			StartGoal_Scavenger_Interval unlimited_time 
		ENDIF 
	ELSE 
		IF OnServer 
			AnnounceNeedToPlaceObjects 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT AddGoal_Scavenger 
	GoalManager_AddGoal name = scavenger { 
		params = { goal_scavenger_genericParams 
		} 
	} 
ENDSCRIPT

SCRIPT StartGoal_Scavenger 
	GoalManager_EditGoal name = scavenger params = <...> 
	GoalManager_ActivateGoal name = scavenger 
	GoalManager_SetGoalTimer name = scavenger 
ENDSCRIPT

goal_scavenger_collect_genericParams = { 
	goal_text = "" 
	time = 60 
	net 
	init = goal_scavenger_collect_init 
	activate = goal_scavenger_collect_activate 
	deactivate = goal_scavenger_collect_deactivate 
	expire = goal_scavenger_collect_expire 
	goal_description = "" 
} 
SCRIPT goal_scavenger_collect_init 
ENDSCRIPT

SCRIPT goal_scavenger_collect_active 
ENDSCRIPT

SCRIPT goal_scavenger_collect_activate 
	IF GoalManager_GoalIsActive name = scavenger_interval 
		GoalManager_DeactivateGoal name = scavenger_interval 
	ENDIF 
	ResetSkaters 
	show_all_objects 
	FormatText TextName = msg_text "\\c2Scavenger Hunt:\\c0\\nCollect objects!" 
	msg_pos = PAIR(620.00000000000, 27.00000000000) 
	IF InSplitScreenGame 
		ScriptGetScreenMode 
		IF ( <screen_mode> = split_vertical ) 
			msg_pos = PAIR(400.00000000000, 44.00000000000) 
		ELSE 
			msg_pos = PAIR(640.00000000000, 204.00000000000) 
		ENDIF 
	ENDIF 
	IF ObjectExists id = mp_goal_text 
		DestroyScreenElement id = mp_goal_text 
	ENDIF 
	create_panel_block parent = root_window id = mp_goal_text text = <msg_text> style = panel_message_goal final_pos = <msg_pos> font_face = testtitle 
	IF ScreenElementExists id = the_time 
		SetScreenElementProps { 
			id = the_time 
			unhide 
		} 
	ENDIF 
	RunScriptOnScreenElement id = the_time clock_morph 
ENDSCRIPT

SCRIPT goal_scavenger_collect_deactivate 
	IF ObjectExists id = mp_goal_text 
		DestroyScreenElement id = mp_goal_text 
	ENDIF 
ENDSCRIPT

SCRIPT goal_scavenger_finished 
	IF ObjectExists id = mp_goal_text 
		DestroyScreenElement id = mp_goal_text 
	ENDIF 
	SpawnScript wait_then_create_rankings 
ENDSCRIPT

SCRIPT goal_scavenger_collect_expire 
	goal_scavenger_finished 
ENDSCRIPT

goal_scavenger_interval_genericParams = { 
	goal_text = "" 
	time = 6 
	net 
	init = goal_scavenger_interval_init 
	activate = goal_scavenger_interval_activate 
	deactivate = goal_scavenger_interval_deactivate 
	expire = goal_scavenger_interval_expire 
	active = goal_scavenger_interval_active 
	goal_description = "" 
	game_continues_after_expiration 
} 
SCRIPT goal_scavenger_interval_init 
ENDSCRIPT

SCRIPT goal_scavenger_interval_active 
	IF NOT InSplitScreenGame 
		IF OnServer 
			GoalManager_GetTimeLeftInNetGame 
			IF NOT IsTrue SentObjectPlacements 
				IF GotParam time_left 
					IF ( <time_left> < 3000 ) 
						BroadcastObjectPlacements 
						change SentObjectPlacements = 1 
					ENDIF 
				ENDIF 
			ENDIF 
			IF NOT IsTrue SentStartMessage 
				IF GotParam time_left 
					IF ( <time_left> < 500 ) 
						AnnounceHuntStarted 
						change SentStartMessage = 1 
					ENDIF 
				ENDIF 
			ENDIF 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT goal_scavenger_interval_activate 
	IF ScreenElementExists id = the_time 
		SetScreenElementProps { 
			id = the_time 
			hide 
		} 
	ENDIF 
	IF ObjectExists id = mp_goal_text 
		DestroyScreenElement id = mp_goal_text 
	ENDIF 
	FormatText TextName = msg_text "\\c2Scavenger Hunt:\\c0\\nGet Ready...!" 
	IF InSplitScreenGame 
		ScriptGetScreenMode 
		IF ( <screen_mode> = split_vertical ) 
			msg_pos = PAIR(400.00000000000, 44.00000000000) 
		ELSE 
			msg_pos = PAIR(640.00000000000, 204.00000000000) 
		ENDIF 
	ENDIF 
	create_panel_block parent = root_window id = mp_goal_text text = <msg_text> style = panel_message_goal final_pos = <msg_pos> font_face = testtitle 
ENDSCRIPT

SCRIPT goal_scavenger_interval_deactivate 
	IF ScreenElementExists id = the_time 
		SetScreenElementProps { 
			id = the_time 
			unhide 
		} 
	ENDIF 
	IF NOT GoalManager_GoalIsActive name = scavenger 
		IF NOT GoalManager_GoalIsActive name = scavenger_collect_period 
			IF ObjectExists id = mp_goal_text 
				DestroyScreenElement id = mp_goal_text 
			ENDIF 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT goal_scavenger_interval_expire 
	StartGoal_Scavenger_Collect 
ENDSCRIPT

SCRIPT AddGoal_Scavenger_Interval 
	GoalManager_AddGoal name = scavenger_interval { 
		params = { goal_scavenger_interval_genericParams 
		} 
	} 
ENDSCRIPT

SCRIPT StartGoal_Scavenger_Interval 
	GoalManager_EditGoal name = scavenger_interval params = <...> 
	GoalManager_ActivateGoal name = scavenger_interval 
ENDSCRIPT

SCRIPT AddGoal_Scavenger_Collect 
	GoalManager_AddGoal name = scavenger_collect_period { 
		params = { goal_scavenger_collect_genericParams 
		} 
	} 
ENDSCRIPT

SCRIPT ForceStartScavengerCollect 
	IF GoalManager_GoalIsActive name = scavenger 
		GoalManager_DeactivateGoal name = scavenger 
	ENDIF 
	IF GoalManager_GoalIsActive name = scavenger_interval 
		GoalManager_DeactivateGoal name = scavenger_interval 
	ENDIF 
	StartGoal_Scavenger_Collect 
ENDSCRIPT

SCRIPT StartGoal_Scavenger_Collect 
	GetTimeLimit 
	GoalManager_EditGoal name = scavenger_collect_period params = { time = <time_limit> } 
	GoalManager_ActivateGoal name = scavenger_collect_period 
ENDSCRIPT

SCRIPT ScavengerHunt_GotObject 
	ReportObjectPickup <...> 
	PlaySound goaldone vol = 150 
	<id> : Die 
ENDSCRIPT

SCRIPT ScavengerHunt_KillObject 
	IF ObjectExists id = <id> 
		<id> : Die 
	ENDIF 
ENDSCRIPT

SCRIPT ScavengerHunt_GotObject2P 
	<id> : GetTags 
	IF GotParam player_retrieved 
		IF ( <player_retrieved> = <colObjId> ) 
		ELSE 
			ReportObjectPickup <...> 
			PlaySound goaldone vol = 150 
			<id> : Die 
		ENDIF 
	ELSE 
		ReportObjectPickup <...> 
		PlaySound goaldone vol = 150 
		<id> : SetTags player_retrieved = <colObjId> 
		IF ( <intId> = 0 ) 
			Obj_ClearVisibility viewport = 0 
		ELSE 
			Obj_ClearVisibility viewport = 1 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT ScavengerHunt_InitObjectExceptions 
	Obj_ClearExceptions 
	Obj_SetInnerRadius 8 
	IF InSplitScreenGame 
		Obj_SetException { 
			ex = AnyObjectInRadius 
			scr = ScavengerHunt_GotObject2P 
			params = { id = <id> } 
		} 
	ELSE 
		Obj_SetException { 
			ex = ObjectInRadius 
			scr = ScavengerHunt_GotObject 
			params = { id = <id> } 
		} 
	ENDIF 
ENDSCRIPT

SCRIPT ScavengerHunt_InitObject 
	IF InSplitScreenGame 
		Obj_ClearVisibility viewport = 0 
		Obj_ClearVisibility viewport = 1 
	ENDIF 
	Obj_Invisible 
	Obj_RotY speed = 200 
	Obj_Hover Amp = 6 Freq = 2 
ENDSCRIPT

SCRIPT ScavengerHunt_ShowObject 
	Obj_Visible 
	IF InSplitScreenGame 
		Obj_SetVisibility viewport = 0 
		Obj_SetVisibility viewport = 1 
	ENDIF 
ENDSCRIPT

SCRIPT DropSHObject 
	FormatText ChecksumName = id "sh_object_%i_%j" i = <objId> j = <index> 
	CreateCompositeObject { 
		Components = sh_object_composite_structure 
		params = { name = <id> 
			pos = <pos> 
			NeverSuspend 
			model = "GameObjects\\scavenger_coin\\scavenger_coin.mdl" 
		} 
	} 
	IF InTeamGame 
		GetPlayersTeam objId = <objId> 
		SWITCH <team> 
			CASE 0 
				<id> : Obj_SetColorRGB r = 102 g = 26 b = 8 
			CASE 1 
				<id> : Obj_SetColorRGB r = 17 g = 64 b = 116 
			CASE 2 
				<id> : Obj_SetColorRGB r = 9 g = 107 b = 36 
			CASE 3 
				<id> : Obj_SetColorRGB r = 123 g = 99 b = 3 
		ENDSWITCH 
	ELSE 
		SWITCH <objId> 
			CASE 0 
				<id> : Obj_SetColorRGB r = 102 g = 26 b = 8 
			CASE 1 
				<id> : Obj_SetColorRGB r = 17 g = 64 b = 116 
			CASE 2 
				<id> : Obj_SetColorRGB r = 9 g = 107 b = 36 
			CASE 3 
				<id> : Obj_SetColorRGB r = 123 g = 99 b = 3 
			CASE 4 
				<id> : Obj_SetColorRGB r = 0 g = 128 b = 128 
			CASE 5 
				<id> : Obj_SetColorRGB r = 128 g = 0 b = 128 
			CASE 6 
				<id> : Obj_SetColorRGB r = 80 g = 80 b = 116 
			CASE 7 
				<id> : Obj_SetColorRGB r = 80 g = 105 b = 112 
		ENDSWITCH 
	ENDIF 
	RunScriptOnObject { 
		id = <id> 
		ScavengerHunt_InitObject 
		params = { id = <id> } 
	} 
	IF GotParam show_now 
		RunScriptOnObject { 
			id = <id> 
			ScavengerHunt_ShowObject 
			params = { id = <id> } 
		} 
	ENDIF 
ENDSCRIPT

SCRIPT ClientDropSHObject 
	IF NOT GameModeEquals is_scavenger_hunt 
		RETURN 
	ENDIF 
	GetSkaterPosition 
	GetCurrentSkaterId 
	new_y = ( <y> + 24 ) 
	<y> = <new_y> 
	new_pos = ( <x> * VECTOR(1.00000000000, 0.00000000000, 0.00000000000) + <y> * VECTOR(0.00000000000, 1.00000000000, 0.00000000000) + <z> * VECTOR(0.00000000000, 0.00000000000, 1.00000000000) ) 
	PlaceObject pos = <new_pos> 
	ReportObjectPlacement objId = <objId> pos = <new_pos> 
	IF InNetGame 
		DropSHObject pos = <new_pos> objId = <intId> index = <index> show_now 
	ELSE 
		DropSHObject pos = <new_pos> objId = <intId> index = <index> 
	ENDIF 
	IF NOT PlacedLessThan 5 
		IF InSplitScreenGame 
			GetCurrentSkaterId 
			IF ( <intId> = 0 ) 
				unbind_scavenger_tricks 
			ELSE 
				unbind_scavenger_tricks_player_2 
			ENDIF 
		ELSE 
			unbind_scavenger_tricks 
		ENDIF 
	ENDIF 
ENDSCRIPT

sh_object_composite_structure = 
[ 
	{ component = motion } 
	{ component = model } 
	{ component = objectproximity } 
] 
SCRIPT bind_scavenger_tricks 
	GoalManager_GetTrickFromKeyCombo key_combo = Air_SquareU 
	IF GotParam cat_num 
		skater : SetTags old_scavengerf_checksum = <cat_num> 
	ELSE 
		skater : SetTags old_scavengerf_checksum = <trick_checksum> 
	ENDIF 
	BindTrickToKeyCombo { 
		key_combo = Air_SquareU 
		trick = ScavengerF 
		update_mappings = 1 
	} 
	UpdateTrickMappings skater = 0 
ENDSCRIPT

SCRIPT bind_scavenger_tricks_player_2 
	SetCurrentSkaterProfile 1 
	GoalManager_GetTrickFromKeyCombo key_combo = Air_SquareU 
	IF GotParam cat_num 
		skater2 : SetTags old_scavengerf_checksum = <cat_num> 
	ELSE 
		skater2 : SetTags old_scavengerf_checksum = <trick_checksum> 
	ENDIF 
	BindTrickToKeyCombo { 
		key_combo = Air_SquareU 
		trick = ScavengerF 
		update_mappings = 1 
	} 
	UpdateTrickMappings skater = 1 
	SetCurrentSkaterProfile 0 
ENDSCRIPT

SCRIPT unbind_scavenger_tricks 
	skater : GetTags 
	IF GotParam old_scavengerf_checksum 
		old_trick_int = <old_scavengerf_checksum> 
		CastToInteger old_trick_int 
		IF ( 12 > <old_trick_int> ) 
			trick = <old_trick_int> 
		ELSE 
			trick = <old_scavengerf_checksum> 
		ENDIF 
		BindTrickToKeyCombo { 
			key_combo = Air_SquareU 
			trick = <trick> 
			update_mappings = 1 
		} 
	ENDIF 
	UpdateTrickMappings skater = 0 
ENDSCRIPT

SCRIPT unbind_scavenger_tricks_player_2 
	SetCurrentSkaterProfile 1 
	skater2 : GetTags 
	IF GotParam old_scavengerf_checksum 
		old_trick_int = <old_scavengerf_checksum> 
		CastToInteger old_trick_int 
		IF ( 12 > <old_trick_int> ) 
			trick = <old_trick_int> 
		ELSE 
			trick = <old_scavengerf_checksum> 
		ENDIF 
		BindTrickToKeyCombo { 
			key_combo = Air_SquareU 
			trick = <trick> 
			update_mappings = 2 
		} 
	ENDIF 
	UpdateTrickMappings skater = 1 
	SetCurrentSkaterProfile 0 
ENDSCRIPT

SCRIPT show_all_objects 
	objId = 0 
	BEGIN 
		index = 0 
		BEGIN 
			FormatText ChecksumName = name "sh_object_%i_%j" i = <objId> j = <index> 
			IF ObjectExists id = <name> 
				RunScriptOnObject { 
					id = <name> 
					ScavengerHunt_ShowObject 
					params = { id = <name> } 
				} 
				RunScriptOnObject { 
					id = <name> 
					ScavengerHunt_InitObjectExceptions 
					params = { id = <name> } 
				} 
			ENDIF 
			index = ( <index> + 1 ) 
			IF ( <index> = 5 ) 
				BREAK 
			ENDIF 
		REPEAT 
		objId = ( <objId> + 1 ) 
		IF ( <objId> = 8 ) 
			BREAK 
		ENDIF 
	REPEAT 
ENDSCRIPT



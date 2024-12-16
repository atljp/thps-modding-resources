
pager_window_title_color = [ 60 128 60 128 ] 
pager_window_message_color = [ 50 90 128 128 ] 
pager_window_bg_alpha = 0.15000000596 
pager_message_count_pos = PAIR(25.00000000000, 18.00000000000) 
SCRIPT pager_message_list_changed 
	IF ScreenElementExists id = pager_anchor 
		pager_window_refresh_content changed 
	ELSE 
		IF GotParam deleted 
			update_pager_icon stop_flash 
			RETURN 
		ENDIF 
		IF GotParam priority_message 
			Obj_GetID 
			WaitUntilScreenClear object = <ObjID> callback = pager_window_create 
			RETURN 
		ENDIF 
		update_pager_icon flash 
	ENDIF 
ENDSCRIPT

SCRIPT pager_window_create object = skater 
	update_pager_icon stop_flash 
	hide_current_goal 
	IF ScreenElementExists id = current_menu_anchor 
		IF NOT InNetGame 
			IF InInternetMode 
				IF ObjectExists id = console_message_vmenu 
					DoScreenElementMorph id = console_message_vmenu alpha = 0 
				ENDIF 
			ENDIF 
		ENDIF 
		DestroyScreenElement id = current_menu_anchor 
		spawnscript menu3d_animate_out params = { die } 
		pause_menu_gradient off 
	ELSE 
		IF NOT InNetGame 
			PauseGame 
		ENDIF 
		GoalManager_PauseAllGoals 
		hide_all_hud_items 
	ENDIF 
	KillSpawnedScript name = TemporarilyDisableInput 
	spawnscript TemporarilyDisableInput params = { time = 500 } 
	SetScreenElementLock id = root_window off 
	root_window : SetTags menu_state = on 
	CreateScreenElement { 
		type = ContainerElement 
		parent = root_window 
		id = pager_anchor 
	} 
	AssignAlias id = pager_anchor alias = current_menu_anchor 
	create_helper_text generic_helper_text 
	Theme_GetAltColor return_value = grad_color 
	CreateScreenElement { 
		type = SpriteElement 
		parent = current_menu_anchor 
		id = grad_bar 
		texture = goal_grad 
		rgba = <grad_color> 
		scale = PAIR(19.00000000000, 1.00000000000) 
		pos = PAIR(0.00000000000, 83.00000000000) 
		just = [ left top ] 
		z_priority = 35 
	} 
	CreateScreenElement { 
		type = ContainerElement 
		parent = pager_anchor 
		id = pager_box_anchor 
		pos = PAIR(100.00000000000, 83.00000000000) 
		just = [ left top ] 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = pager_box_anchor 
		id = pager_bg 
		texture = white2 
		pos = PAIR(0.00000000000, 0.00000000000) 
		just = [ left top ] 
		scale = PAIR(55.00000000000, 38.00000000000) 
		rgba = [ 0 0 0 80 ] 
		z_priority = -10 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = pager_box_anchor 
		texture = white2 
		pos = PAIR(0.00000000000, 0.00000000000) 
		just = [ right top ] 
		scale = PAIR(0.50000000000, 38.50000000000) 
		rgba = pager_window_title_color 
		alpha = 0.20000000298 
		z_priority = -10 
	} 
	GetScreenElementDims id = pager_bg 
	CreateScreenElement { 
		type = SpriteElement 
		parent = pager_box_anchor 
		texture = white2 
		pos = ( <height> * PAIR(0.00000000000, 1.00000000000) ) 
		just = [ left top ] 
		scale = PAIR(55.00000000000, 0.50000000000) 
		rgba = pager_window_title_color 
		alpha = 0.20000000298 
		z_priority = -10 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = pager_box_anchor 
		texture = white2 
		pos = ( <width> * PAIR(1.00000000000, 0.00000000000) ) 
		just = [ left top ] 
		scale = PAIR(0.50000000000, 38.50000000000) 
		rgba = pager_window_title_color 
		alpha = 0.20000000298 
		z_priority = -10 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = pager_box_anchor 
		id = moto_phone 
		texture = nokia_phone 
		pos = PAIR(40.00000000000, 65.00000000000) 
		just = [ center center ] 
		scale = 1 
		rgba = [ 128 128 128 128 ] 
	} 
	RunScriptOnScreenElement id = moto_phone pager_window_animate_phone 
	CreateScreenElement { 
		type = SpriteElement 
		parent = pager_box_anchor 
		id = moto_logo 
		texture = motorola 
		pos = PAIR(438.00000000000, 4.00000000000) 
		just = [ right top ] 
		scale = 1.04999995232 
		rgba = [ 128 128 128 128 ] 
	} 
	CreateScreenElement { 
		type = TextElement 
		parent = pager_box_anchor 
		id = pager_message_title 
		font = dialog 
		pos = PAIR(140.00000000000, 29.00000000000) 
		just = [ left top ] 
		text = "" 
		rgba = pager_window_title_color 
		scale = 1 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = pager_box_anchor 
		texture = white2 
		pos = PAIR(0.00000000000, 30.00000000000) 
		just = [ left top ] 
		scale = PAIR(55.00000000000, 2.75000000000) 
		rgba = pager_window_title_color 
		alpha = pager_window_bg_alpha 
		z_priority = -5 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = pager_box_anchor 
		texture = white2 
		pos = PAIR(0.00000000000, 50.00000000000) 
		just = [ left top ] 
		scale = PAIR(55.00000000000, 0.50000000000) 
		rgba = pager_window_title_color 
		alpha = ( pager_window_bg_alpha * 3 ) 
		z_priority = -5 
	} 
	CreateScreenElement { 
		type = TextBlockElement 
		parent = pager_box_anchor 
		id = pager_message_box 
		font = dialog 
		dims = PAIR(360.00000000000, 0.00000000000) 
		pos = PAIR(80.00000000000, 53.00000000000) 
		just = [ left top ] 
		text = "" 
		internal_scale = 0.89999997616 
		line_spacing = 0.69999998808 
		internal_just = [ left top ] 
		rgba = pager_window_message_color 
		scale = 1 
		allow_expansion 
	} 
	CreateScreenElement { 
		type = TextElement 
		parent = pager_box_anchor 
		id = pager_message_count 
		font = dialog 
		pos = pager_message_count_pos 
		just = [ center center ] 
		text = "" 
		rgba = pager_window_title_color 
		scale = 1 
		z_priority = 5 
	} 
	IF InInternetMode 
		IF AnyBuddyMessagesLeft 
			ShowNextBuddyMessage 
		ENDIF 
	ENDIF 
	pager_window_build_menu <...> 
	pager_window_refresh_content <...> 
	generic_menu_animate_in menu = pager_box_anchor force 
ENDSCRIPT

SCRIPT pager_window_add_menu_item { focus_script = pager_window_focus_menu_item 
		unfocus_script = pager_window_unfocus_menu_item 
		pad_choose_sound = theme_menu_pad_choose_sound 
		pad_choose_params = { } 
	} 
	CreateScreenElement { 
		type = ContainerElement 
		parent = current_menu 
		local_id = <id> 
		dims = PAIR(400.00000000000, 20.00000000000) 
		just = [ center center ] 
		event_handlers = [ 
			{ focus <focus_script> params = { id = <id> } } 
			{ unfocus <unfocus_script> params = { id = <id> } } 
			{ pad_start <pad_choose_sound> } 
			{ pad_choose <pad_choose_sound> } 
			{ pad_choose <pad_choose_script> params = <pad_choose_params> } 
			{ pad_start <pad_choose_script> params = <pad_choose_params> } 
		] 
	} 
	container_id = <id> 
	CreateScreenElement { 
		type = TextElement 
		parent = <container_id> 
		local_id = text 
		font = dialog 
		text = <text> 
		rgba = pager_window_title_color 
		scale = 1 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = <container_id> 
		local_id = bg 
		texture = white2 
		just = [ center center ] 
		rgba = [ 0 0 0 128 ] 
		alpha = 0 
		scale = PAIR(55.00000000000, 2.50000000000) 
	} 
ENDSCRIPT

SCRIPT pager_window_focus_menu_item 
	DoScreenElementMorph id = { current_menu child = { <id> child = bg } } alpha = 1 
ENDSCRIPT

SCRIPT pager_window_unfocus_menu_item 
	DoScreenElementMorph id = { current_menu child = { <id> child = bg } } alpha = 0 
ENDSCRIPT

SCRIPT pager_window_next_message 
	IF InInternetMode 
		IF AnyBuddyMessagesLeft 
			ShowNextBuddyMessage 
		ENDIF 
	ENDIF 
	current_menu : GetSingleTag CurrentMessageNum 
	current_menu : SetTags CurrentMessageNum = ( <CurrentMessageNum> + 1 ) 
	pager_window_refresh_content <...> 
ENDSCRIPT

SCRIPT pager_window_prev_message 
	current_menu : GetSingleTag CurrentMessageNum 
	current_menu : SetTags CurrentMessageNum = ( <CurrentMessageNum> -1 ) 
	pager_window_refresh_content 
ENDSCRIPT

SCRIPT pager_window_context_reply 
	current_menu : GetSingleTag reply_script 
	DestroyScreenElement id = current_menu_anchor 
	<reply_script> 
ENDSCRIPT

SCRIPT pager_window_context_reply_highlight 
	SetProps rgba = [ 128 128 0 128 ] 
	DoMorph time = 0.30000001192 scale = 0.50000000000 relative_scale alpha = 0 
	DoMorph time = 0.20000000298 scale = 1.50000000000 relative_scale alpha = 1 
	BEGIN 
		rot_angle = RANDOM_RANGE PAIR(-2.00000000000, 2.00000000000) 
		DoMorph time = 0.10000000149 scale = 1.10000002384 relative_scale alpha = 1 
		DoMorph time = 0.10000000149 scale = 0.89999997616 relative_scale alpha = 0.69999998808 
	REPEAT 5 
	DoMorph time = 0.05000000075 rot_angle = 0 scale = 1 relative_scale alpha = 1 
ENDSCRIPT

SCRIPT pager_window_maybe_play_sound 
	IF NOT ScreenElementExists id = current_menu 
		RETURN 
	ENDIF 
	current_menu : GetSingleTag target_object 
	IF GotParam target_object 
		<target_object> : GetPagerMessageCount 
		IF ( <PagerMessageCount> < 2 ) 
			IF NOT current_menu : GetSingleTag reply_script 
				RETURN 
			ENDIF 
		ENDIF 
		generic_menu_up_or_down_sound <...> 
	ENDIF 
ENDSCRIPT

SCRIPT pager_window_build_menu 
	CreateScreenElement { 
		type = VMenu 
		parent = pager_box_anchor 
		id = pager_box_menu 
		pos = PAIR(220.00000000000, 230.00000000000) 
		font = dialog 
		just = [ left top ] 
	} 
	SetScreenElementProps { 
		id = pager_box_menu 
		event_handlers = [ { pad_back generic_pause_exit_sound } 
			{ pad_back pager_window_destroy params = <pad_back_params> } 
			{ pad_up pager_window_maybe_play_sound params = { up } } 
			{ pad_down pager_window_maybe_play_sound params = { down } } 
		] 
	} 
	AssignAlias id = pager_box_menu alias = current_menu 
	IF NOT InInternetMode 
		pager_window_add_menu_item text = "CONTEXT REPLY BUTTON" id = context_reply pad_choose_script = pager_window_context_reply 
		pager_window_add_menu_item text = "READ PREVIOUS MESSAGE" id = prev pad_choose_script = pager_window_prev_message 
	ENDIF 
	pager_window_add_menu_item text = "READ NEXT MESSAGE" id = next pad_choose_script = pager_window_next_message 
	IF InInternetMode 
		IF GotParam nick 
			pager_window_add_menu_item text = "REPLY" id = reply pad_choose_script = message_buddy pad_choose_params = { <...> from_buddy_message } 
		ENDIF 
	ENDIF 
	pager_window_add_menu_item text = "EXIT" id = exit pad_choose_script = pager_window_destroy 
	spawnscript SK6_SFX_IncomingBeeper 
	PauseMusic 1 
	CreateScreenElement { 
		type = SpriteElement 
		parent = pager_box_anchor 
		texture = white2 
		pos = PAIR(0.00000000000, 215.00000000000) 
		just = [ left top ] 
		scale = PAIR(55.00000000000, 11.50000000000) 
		rgba = pager_window_title_color 
		alpha = pager_window_bg_alpha 
		z_priority = -5 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = pager_box_anchor 
		texture = white2 
		pos = PAIR(0.00000000000, 215.00000000000) 
		just = [ left top ] 
		scale = PAIR(55.00000000000, 0.50000000000) 
		rgba = pager_window_title_color 
		alpha = ( pager_window_bg_alpha * 3 ) 
		z_priority = -5 
	} 
	current_menu : SetTags target_object = <object> 
	IF NOT InInternetMode 
		<object> : GetPagerMessageCount 
		current_menu : SetTags CurrentMessageNum = <PagerMessageCount> 
	ELSE 
		<object> : GetFirstUnreadMessageNum 
		current_menu : SetTags CurrentMessageNum = <FirstUnreadMessageNum> 
	ENDIF 
ENDSCRIPT

SCRIPT pager_window_update_buttons 
	IF InInternetMode 
		IF NOT AnyBuddyMessagesLeft 
			SetScreenElementProps { 
				id = { current_menu child = next } 
				not_focusable 
			} 
			DoScreenElementMorph { 
				id = { current_menu child = { next child = text } } 
				alpha = 0.20000000298 
			} 
		ELSE 
			SetScreenElementProps { 
				id = { current_menu child = next } 
				focusable 
			} 
			DoScreenElementMorph { 
				id = { current_menu child = { next child = text } } 
				alpha = 1 
			} 
		ENDIF 
	ELSE 
		IF NOT ( <CurrentMessageNum> > 1 ) 
			SetScreenElementProps { 
				id = { current_menu child = prev } 
				not_focusable 
			} 
			DoScreenElementMorph { 
				id = { current_menu child = { prev child = text } } 
				alpha = 0.20000000298 
			} 
		ELSE 
			SetScreenElementProps { 
				id = { current_menu child = prev } 
				focusable 
			} 
			DoScreenElementMorph { 
				id = { current_menu child = { prev child = text } } 
				alpha = 1 
			} 
		ENDIF 
		IF NOT ( <CurrentMessageNum> < <PagerMessageCount> ) 
			SetScreenElementProps { 
				id = { current_menu child = next } 
				not_focusable 
			} 
			DoScreenElementMorph { 
				id = { current_menu child = { next child = text } } 
				alpha = 0.20000000298 
			} 
		ELSE 
			SetScreenElementProps { 
				id = { current_menu child = next } 
				focusable 
			} 
			DoScreenElementMorph { 
				id = { current_menu child = { next child = text } } 
				alpha = 1 
			} 
		ENDIF 
		IF current_menu : GetSingleTag reply_script 
			SetScreenElementProps { 
				id = { current_menu child = context_reply } 
				focusable 
			} 
			current_menu : GetSingleTag reply_text 
			SetScreenElementProps { 
				id = { current_menu child = { context_reply child = text } } 
				text = <reply_text> 
			} 
			RunScriptOnScreenElement id = { current_menu child = { context_reply child = text } } pager_window_context_reply_highlight 
		ELSE 
			SetScreenElementProps { 
				id = { current_menu child = context_reply } 
				not_focusable 
			} 
			SetScreenElementProps { 
				id = { current_menu child = { context_reply child = text } } 
				text = "" 
			} 
			TerminateObjectsScripts id = { current_menu child = { context_reply child = text } } script_name = pager_window_context_reply_highlight 
		ENDIF 
	ENDIF 
	FireEvent type = unfocus target = current_menu 
	FireEvent type = focus target = current_menu 
ENDSCRIPT

SCRIPT pager_window_destroy 
	IF ScreenElementExists id = pager_anchor 
		generic_menu_animate_out menu = pager_box_anchor 
		DestroyScreenElement id = pager_anchor 
		PauseMusic 0 
		PauseStream 1 
	ENDIF 
	IF InInternetMode 
		IF NOT GotParam hide_ui 
			IF InNetGame 
				create_pause_menu 
			ELSE 
				destroy_onscreen_keyboard 
				IF ObjectExists id = console_message_vmenu 
					DoScreenElementMorph id = console_message_vmenu alpha = 1 
				ENDIF 
				create_network_select_games_menu 
			ENDIF 
		ENDIF 
	ELSE 
		create_pause_menu 
	ENDIF 
ENDSCRIPT

SCRIPT pager_window_get_message 
	IF ( <PagerMessageCount> = 0 ) 
		RETURN 
	ENDIF 
	<target_object> : GetPagerMessage message_num = <CurrentMessageNum> 
	RETURN <PagerMessage> 
ENDSCRIPT

SCRIPT pager_window_update_message_title 
	IF NOT InInternetMode 
		IF ( <PagerMessageCount> = 0 ) 
			title = " " 
		ELSE 
			FormatText TextName = title "TEXT MESSAGE %a:" a = <CurrentMessageNum> 
		ENDIF 
	ENDIF 
	IF ScreenElementExists id = pager_message_title 
		SetScreenElementProps { 
			id = pager_message_title 
			text = <title> 
		} 
	ENDIF 
ENDSCRIPT

SCRIPT pager_window_update_message_pane 
	IF InInternetMode 
		IF NOT GotParam nick 
			message = "*** NO MESSAGES RECEIVED ***" 
		ENDIF 
	ELSE 
		IF ( <PagerMessageCount> = 0 ) 
			message = "*** NO MESSAGES RECEIVED ***" 
		ELSE 
			pager_window_get_message <...> 
			IF GotParam from 
				FormatText TextName = message "FROM: <%a>\\n\\n%b" a = <from> b = <message> 
			ENDIF 
		ENDIF 
	ENDIF 
	IF ScreenElementExists id = pager_message_box 
		SetScreenElementProps { 
			id = pager_message_box 
			text = <message> 
		} 
	ENDIF 
	IF ScreenElementExists id = current_menu 
		IF GotParam reply_script 
			current_menu : SetTags reply_script = <reply_script> 
		ELSE 
			current_menu : RemoveTags tags = [ reply_script ] 
		ENDIF 
		IF GotParam reply_text 
			current_menu : SetTags reply_text = <reply_text> 
		ELSE 
			current_menu : SetTags reply_text = "REPLY" 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT pager_window_update_message_count 
	IF ( <PagerMessageCount> = 0 ) 
		counter = " " 
	ELSE 
		FormatText TextName = counter "%a/%b" a = <CurrentMessageNum> b = <PagerMessageCount> 
	ENDIF 
	IF ScreenElementExists id = pager_message_count 
		SetScreenElementProps { 
			id = pager_message_count 
			text = <counter> 
		} 
	ENDIF 
	IF GotParam changed 
		flash_message_count <...> 
	ENDIF 
ENDSCRIPT

SCRIPT pager_window_refresh_content 
	IF InInternetMode 
		FormatText TextName = title "Message from %s" s = <nick> 
		FormatText TextName = message "%s" s = <msg_body> 
	ELSE 
		current_menu : GetSingleTag CurrentMessageNum 
		current_menu : GetSingleTag target_object 
		<target_object> : GetPagerMessageCount 
		IF ( <CurrentMessageNum> > <PagerMessageCount> ) 
			CurrentMessageNum = <PagerMessageCount> 
		ENDIF 
		IF NOT ( <CurrentMessageNum> > 0 ) 
			CurrentMessageNum = 1 
		ENDIF 
	ENDIF 
	pager_window_update_message_title <...> 
	pager_window_update_message_pane <...> 
	IF NOT InInternetMode 
		pager_window_update_message_count <...> 
	ENDIF 
	pager_window_update_buttons <...> 
	IF NOT InInternetMode 
		current_menu : SetTags CurrentMessageNum = <CurrentMessageNum> 
	ENDIF 
ENDSCRIPT

SCRIPT pager_window_animate_phone 
	BEGIN 
		DoMorph scale = 0.94999998808 relative_scale time = 0.50000000000 rot_angle = RANDOM_RANGE PAIR(-7.00000000000, 7.00000000000) 
		DoMorph scale = 0.77999997139 relative_scale time = 0.50000000000 rot_angle = RANDOM_RANGE PAIR(-7.00000000000, 7.00000000000) 
	REPEAT 
ENDSCRIPT

SCRIPT update_pager_icon 
	IF GotParam create 
		update_pager_icon kill 
		SetScreenElementLock id = root_window off 
		CreateScreenElement { 
			type = SpriteElement 
			parent = root_window 
			id = pager_new_message_icon 
			texture = nokia_phone 
			pos = PAIR(205.00000000000, 85.00000000000) 
			just = [ center center ] 
			scale = 0 
			rgba = [ 128 128 128 128 ] 
			z_priority = 50 
			rot_angle = 15 
		} 
	ENDIF 
	IF NOT ScreenElementExists id = pager_new_message_icon 
		RETURN 
	ENDIF 
	IF GotParam kill 
		DestroyScreenElement id = pager_new_message_icon 
	ENDIF 
	IF GotParam hide 
		DoScreenElementMorph id = pager_new_message_icon alpha = 0 
	ENDIF 
	IF GotParam show 
		DoScreenElementMorph id = pager_new_message_icon alpha = 1 
	ENDIF 
	IF GotParam flash 
		TerminateObjectsScripts id = pager_new_message_icon script_name = flash_pager_icon 
		RunScriptOnScreenElement id = pager_new_message_icon flash_pager_icon 
		root_window : GetSingleTag menu_state 
		IF ( <menu_state> = off ) 
			spawnscript SK6_SFX_IncomingBeeper 
		ENDIF 
	ENDIF 
	IF GotParam stop_flash 
		TerminateObjectsScripts id = pager_new_message_icon script_name = flash_pager_icon 
		DoScreenElementMorph id = pager_new_message_icon scale = 0 
	ENDIF 
ENDSCRIPT

SCRIPT flash_message_count 
	SetScreenElementLock id = pager_box_anchor off 
	IF ScreenElementExists id = pager_message_count_ghost 
		DestroyScreenElement id = pager_message_count_ghost 
	ENDIF 
	CreateScreenElement { 
		type = TextElement 
		parent = pager_box_anchor 
		id = pager_message_count_ghost 
		font = dialog 
		pos = pager_message_count_pos 
		just = [ center center ] 
		text = <counter> 
		rgba = pager_window_title_color 
		scale = 1 
		z_priority = 6 
	} 
	RunScriptOnScreenElement id = pager_message_count_ghost message_count_animate 
ENDSCRIPT

SCRIPT flash_pager_icon 
	BEGIN 
		DoMorph scale = 0.40000000596 
		wait 0.80000001192 seconds 
		DoMorph scale = 0 
		wait 0.50000000000 seconds 
	REPEAT 
ENDSCRIPT

SCRIPT message_count_animate 
	DoMorph scale = 1.10000002384 alpha = 0.30000001192 
	DoMorph scale = 1.70000004768 alpha = 0 time = 0.50000000000 
	die 
ENDSCRIPT



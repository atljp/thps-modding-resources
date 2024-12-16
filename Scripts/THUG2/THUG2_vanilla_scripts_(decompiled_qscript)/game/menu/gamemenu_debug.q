
SCRIPT create_debug_menu 
	IF ObjectExists id = current_menu_anchor 
		DestroyScreenElement id = current_menu_anchor 
	ENDIF 
	pause_menu_gradient off 
	make_new_menu { 
		menu_id = debug_menu 
		vmenu_id = debug_vmenu 
		menu_title = "DEBUG" 
		type = VScrollingMenu 
		dims = PAIR(200.00000000000, 350.00000000000) 
		padding_scale = 0.94999998808 
		pos = PAIR(243.00000000000, 50.00000000000) 
	} 
	SetScreenElementProps { id = debug_menu 
		event_handlers = [ 
			{ pad_back generic_menu_pad_back params = { callback = create_debug_options_menu } } 
		] 
	} 
	make_text_sub_menu_item text = "Auto Rail Level" id = menu_autoraillevel pad_choose_script = autorail_level 
	make_text_sub_menu_item text = "Time Of Day" id = menu_timeofday pad_choose_script = launch_timeofday_menu 
	make_text_sub_menu_item text = "Lighting Tool" id = menu_lighting pad_choose_script = launch_lighttool_sub_menu 
	make_text_sub_menu_item text = "Rail Display Toggle" pad_choose_script = toggle_rails 
	make_text_sub_menu_item text = "Bouncy Object Debug Display Toggle" pad_choose_script = toggle_rigidbody 
	make_text_sub_menu_item text = "Toggle Profiler" id = menu_profiler pad_choose_script = launch_toggle_profiler 
	make_text_sub_menu_item text = "Toggle FPS Display" id = menu_fps pad_choose_script = launch_toggle_fps 
	make_text_sub_menu_item text = "Toggle Anim Times" id = menu_anim_times pad_choose_script = launch_toggle_anim_times 
	make_text_sub_menu_item text = "Toggle Particle Times" id = menu_particle_times pad_choose_script = launch_toggle_particle_times 
	make_text_sub_menu_item text = "Toggle Particle Emit Dir Display" id = menu_emit pad_choose_script = launch_toggle_emit_dir 
	make_text_sub_menu_item text = "Toggle Model Scene Light Display" id = menu_light_model pad_choose_script = launch_toggle_lights pad_choose_params = { light_type = model } 
	make_text_sub_menu_item text = "Toggle Geom Scene Light Display" id = menu_light_geom pad_choose_script = launch_toggle_lights pad_choose_params = { light_type = geom } 
	make_text_sub_menu_item text = "Toggle Active Scene Light Display" id = menu_light_active pad_choose_script = launch_toggle_lights pad_choose_params = { light_type = active } 
	make_text_sub_menu_item text = "Toggle Geom Stats" id = menu_geom_stats pad_choose_script = launch_toggle_geom_stats 
	make_text_sub_menu_item text = "Toggle Poly Count" id = menu_poly pad_choose_script = show_poly_count 
	make_text_sub_menu_item text = "Toggle Free Memory" id = menu_mem pad_choose_script = show_free_mem 
	make_text_sub_menu_item text = "Defrag Animation Cache" id = menu_defrag_anim pad_choose_script = show_defrag_anim_cache 
	IF CD 
		make_text_sub_menu_item text = "Start AutoTest" id = menu_start_autotest pad_choose_script = menu_start_autotest 
		make_text_sub_menu_item text = "Stop AutoTest" id = menu_stop_autotest pad_choose_script = menu_stop_autotest 
	ENDIF 
	make_text_sub_menu_item text = "Wireframe Toggle" pad_choose_script = toggle_wireframe 
	make_text_sub_menu_item text = "Wireframe Skins Toggle" pad_choose_script = toggle_wireframe_skins 
	make_text_sub_menu_item text = "Show Vert Polys" pad_choose_script = toggle_show_polys pad_choose_params = { showscript = show_vert } 
	make_text_sub_menu_item text = "Show Wallride Polys" pad_choose_script = toggle_show_polys pad_choose_params = { showscript = show_wallride } 
	make_text_sub_menu_item text = "Show Trigger Polys" pad_choose_script = toggle_show_polys pad_choose_params = { showscript = show_trigger } 
	make_text_sub_menu_item text = "Show Camera Polys" pad_choose_script = toggle_show_polys pad_choose_params = { showscript = show_camera_collide } 
	make_text_sub_menu_item text = "Show Not Skateable" pad_choose_script = toggle_show_polys pad_choose_params = { showscript = show_not_skatable } 
	make_text_sub_menu_item text = "Show skater shadow" pad_choose_script = toggle_show_polys pad_choose_params = { showscript = show_skater_shadow } 
	make_text_sub_menu_item text = "Show no skater shadow" pad_choose_script = toggle_show_polys pad_choose_params = { showscript = show_no_skater_shadow } 
	make_text_sub_menu_item text = "Show no skater shadow wall" pad_choose_script = toggle_show_polys pad_choose_params = { showscript = show_no_skater_shadow_wall } 
	make_text_sub_menu_item text = "CheckForHoles (Slow)" pad_choose_script = hole_check 
	make_text_sub_menu_item text = "Hide HUD" pad_choose_script = debug_menu_hide_hud 
	make_text_sub_menu_item text = "Done" id = menu_done pad_choose_script = create_debug_options_menu 
	RunScriptOnScreenElement id = current_menu_anchor animate_in params = { final_pos = PAIR(320.00000000000, 134.00000000000) } 
ENDSCRIPT

SCRIPT launch_lighttool_sub_menu 
	IF ObjectExists id = current_menu_anchor 
		DestroyScreenElement id = current_menu_anchor 
	ENDIF 
	pause_menu_gradient off 
	make_new_menu { 
		menu_id = debug_menu 
		vmenu_id = debug_vmenu 
		menu_title = "LIGHT TOOL SUBMENU" 
		type = VScrollingMenu 
		dims = PAIR(200.00000000000, 350.00000000000) 
		padding_scale = 0.94999998808 
		pos = PAIR(243.00000000000, 50.00000000000) 
	} 
	SetScreenElementProps { id = debug_menu 
		event_handlers = [ 
			{ pad_back generic_menu_pad_back params = { callback = create_pause_menu } } 
		] 
	} 
	make_text_sub_menu_item text = "Character Lights" id = menu_charlights pad_choose_script = launch_lighting_tool pad_choose_params = { set = character } 
	make_text_sub_menu_item text = "Level Lights" id = menu_levellights pad_choose_script = launch_lighting_tool pad_choose_params = { set = level } 
	make_text_sub_menu_item text = "Done" id = menu_done pad_choose_script = create_debug_menu 
	RunScriptOnScreenElement id = current_menu_anchor animate_in params = { final_pos = PAIR(320.00000000000, 134.00000000000) } 
ENDSCRIPT

SCRIPT debug_menu_hide_hud 
	UnpauseGame 
	exit_pause_menu 
	hide_root_window 
ENDSCRIPT

SCRIPT exit_test_menu 
	IF ( IsTrue UsePlayerPosForViewerObjPos ) 
		Skater : unhide 
	ENDIF 
	create_debug_options_menu 
ENDSCRIPT

SCRIPT create_test_menu 
	IF ObjectExists id = current_menu_anchor 
		DestroyScreenElement id = current_menu_anchor 
	ENDIF 
	pause_menu_gradient off 
	dialog_box_exit 
	make_new_menu { 
		menu_id = debug_menu 
		vmenu_id = debug_vmenu 
		menu_title = "TEST" 
		type = VScrollingMenu 
		dims = PAIR(200.00000000000, 350.00000000000) 
		padding_scale = 0.94999998808 
		pos = PAIR(243.00000000000, 50.00000000000) 
	} 
	SetScreenElementProps { id = debug_menu 
		event_handlers = [ 
			{ pad_back exit_test_menu } 
		] 
	} 
	make_text_sub_menu_item text = "View Humans" id = menu_view_human_models pad_choose_script = launch_view_models_menu pad_choose_params = { model_set = human } 
	make_text_sub_menu_item text = "View Cutscene Heads" id = menu_view_cutscene_heads pad_choose_script = launch_view_models_menu pad_choose_params = { model_set = cutscene_heads } 
	make_text_sub_menu_item text = "View Animals" id = menu_view_animal_models pad_choose_script = launch_view_models_menu pad_choose_params = { model_set = animal } 
	make_text_sub_menu_item text = "View Cars" id = menu_view_car_models pad_choose_script = launch_view_models_menu pad_choose_params = { model_set = car } 
	make_text_sub_menu_item text = "View Cutscenes" id = menu_view_cutscenes pad_choose_script = launch_view_cutscenes_menu 
	make_text_sub_menu_item text = "Set Pro Skater" id = menu_set_pro_skater pad_choose_script = create_set_pro_skater_menu 
	make_text_sub_menu_item text = "Set Pre-Made Skater" id = menu_set_premade_skater pad_choose_script = create_set_premade_skater_menu 
	make_text_sub_menu_item text = "Edit Appearance" id = menu_edit_appearance pad_choose_script = pause_launch_level pad_choose_params = { level = load_cas } 
	make_text_sub_menu_item text = "dialog box" id = menu_dialog pad_choose_script = create_test_dialog 
	make_text_sub_menu_item text = "Scrolling Menu" id = menu_scroll pad_choose_script = test_scrolling_menu 
	make_text_sub_menu_item text = "Face Texture Test" id = menu_face_texture pad_choose_script = face_texture_test 
	make_text_sub_menu_item text = "View High Scores" id = menu_hs_displaye pad_choose_script = high_scores_menu_create pad_choose_params = { new_initials = "ABC" } 
	make_text_sub_menu_item text = "Keyboard" pad_choose_script = launch_keyboard 
	make_text_sub_menu_item text = "Done" id = menu_done pad_choose_script = create_debug_options_menu 
	RunScriptOnScreenElement id = current_menu_anchor animate_in params = { final_pos = PAIR(320.00000000000, 134.00000000000) } 
ENDSCRIPT

SCRIPT autorail_level 
	Autorail 
ENDSCRIPT

SCRIPT hole_check 
	checkforholes 
	create_pause_menu 
ENDSCRIPT

SCRIPT launch_toggle_profiler 
	ToggleMetrics 
	create_pause_menu 
ENDSCRIPT

SCRIPT launch_toggle_fps 
	ToggleFPS 
	create_pause_menu 
ENDSCRIPT

SCRIPT launch_toggle_anim_times 
	ToggleAnimTimes 
	create_pause_menu 
ENDSCRIPT

SCRIPT launch_toggle_particle_times 
	ToggleParticleTimes 
	create_pause_menu 
ENDSCRIPT

SCRIPT launch_toggle_emit_dir 
	ToggleDrawEmitDir 
	create_pause_menu 
ENDSCRIPT

SCRIPT launch_toggle_lights 
	ToggleDrawLights <...> 
	create_pause_menu 
ENDSCRIPT

SCRIPT launch_toggle_geom_stats 
	ToggleGeomStats 
	create_pause_menu 
ENDSCRIPT

SCRIPT toggle_rails 
	ToggleRails 
	pulse_item 
ENDSCRIPT

SCRIPT toggle_rigidbody 
	ToggleRigidBodyDebug 
	pulse_item 
ENDSCRIPT

SCRIPT toggle_wireframe 
	togglerendermode 
	show_all 
	pulse_item 
ENDSCRIPT

toggled_geom_stats_on = 0 
SCRIPT ToggleGeomStats 
	IF ( toggled_geom_stats_on = 1 ) 
		change toggled_geom_stats_on = 0 
		KillSpawnedScript name = RefreshGeomStatsDisplay 
		wait 0.20000000298 seconds 
		IF ObjectExists id = geom_stats_anchor 
			DestroyScreenElement id = geom_stats_anchor 
		ENDIF 
	ELSE 
		change toggled_geom_stats_on = 1 
		SetScreenElementLock id = root_window off 
		IF ObjectExists id = geom_stats_anchor 
			DestroyScreenElement id = geom_stats_anchor 
		ENDIF 
		CreateScreenElement { 
			type = ContainerElement 
			parent = root_window 
			id = geom_stats_anchor 
			pos = PAIR(430.00000000000, 80.00000000000) 
			just = [ center center ] 
			internal_just = [ left center ] 
		} 
		CreateScreenElement { 
			type = TextBlockElement 
			parent = geom_stats_anchor 
			id = geom_stats_text 
			pos = PAIR(0.00000000000, -47.00000000000) 
			dims = PAIR(300.00000000000, 100.00000000000) 
			allow_expansion 
			text = "blah" 
			font = dialog 
			rgba = [ 60 60 100 100 ] 
			just = [ left center ] 
			scale = 0.69999998808 
			line_spacing = 0.80000001192 
		} 
		SetScreenElementLock id = root_window on 
		SpawnScript RefreshGeomStatsDisplay 
	ENDIF 
ENDSCRIPT

SCRIPT RefreshGeomStatsDisplay interval = 0.10000000149 
	BEGIN 
		IF ObjectExists id = geom_stats_anchor 
			GetCurrentGeomStats 
			FormatText { textname = gstat 
				"Total=%a\\nInactive=%b\\nSky=%c\\nTransformed=%d\\nInstances=%%instance\\nSkeletal=%e\\nCameraSphere=%f\\nClipCull=%g\\nCulled=%h\\nLeafCulled=%i\\nBoxCheck=%j\\nBocCheckCulled=%k\\nOccludeCheck=%l\\nOccludedObject=%m\\nnOccludedLeaf=%%occluded_leaf\\nColored=%n\\nLeaf=%o\\nMinLeaf=%p\\nWibbleUV=%q\\nWibbleVC=%r\\nEnvMapped=%s\\nSendContext=%t\\nSorted=%u\\nShadow=%v\\nBillboard=%w\\nFastParticles=%x\\nFastParticleSys=%%fast_sys\\nFlexParticles=%y\\nFlexParticleSys=%z\\nFlexParticlePrims=%_" 
				a = <geom_stats_total> 
				b = <geom_stats_inactive> 
				c = <geom_stats_sky> 
				d = <geom_stats_transformed> 
				instance = <geom_stats_instance> 
				e = <geom_stats_skeletal> 
				f = <geom_stats_camera_sphere> 
				g = <geom_stats_clipcull> 
				h = <geom_stats_culled> 
				i = <geom_stats_leaf_culled> 
				j = <geom_stats_boxcheck> 
				k = <geom_stats_boxcheck_culled> 
				l = <geom_stats_occludecheck> 
				m = <geom_stats_occluded_object> 
				occluded_leaf = <geom_stats_occluded_leaf> 
				n = <geom_stats_colored> 
				o = <geom_stats_leaf> 
				p = <geom_stats_minimal_leaf> 
				q = <geom_stats_wibbleUV> 
				r = <geom_stats_wibbleVC> 
				s = <geom_stats_envmapped> 
				t = <geom_stats_sendcontext> 
				u = <geom_stats_sorted> 
				v = <geom_stats_shadow> 
				w = <geom_stats_billboard> 
				x = <geom_stats_new_particles> 
				fast_sys = <geom_stats_new_particle_systems> 
				y = <geom_stats_old_particles> 
				z = <geom_stats_old_particle_systems> 
				_ = <geom_stats_old_particle_prims> 
			} 
			SetScreenElementProps id = geom_stats_text text = <gstat> 
		ELSE 
			KillSpawnedScript id = RefreshGeomStatsDisplay 
			change toggled_geom_stats_on = 0 
		ENDIF 
		wait <interval> seconds 
	REPEAT 
ENDSCRIPT

DrawEmitLines = 0 
SCRIPT ToggleDrawEmitDir 
	IF ( DrawEmitLines = 1 ) 
		change DrawEmitLines = 0 
	ELSE 
		change DrawEmitLines = 1 
	ENDIF 
ENDSCRIPT

DrawModelLights = 0 
DrawGeomLights = 0 
DrawActiveLights = 0 
SCRIPT ToggleDrawLights 
	SWITCH <light_type> 
		CASE model 
			IF ( ( DrawModelLights ) = 1 ) 
				change DrawModelLights = 0 
				DestroyLightCountDisplay <...> 
			ELSE 
				change DrawModelLights = 1 
				CreateLightCountDisplay <...> 
			ENDIF 
		CASE geom 
			IF ( ( DrawGeomLights ) = 1 ) 
				change DrawGeomLights = 0 
				DestroyLightCountDisplay <...> 
			ELSE 
				change DrawGeomLights = 1 
				CreateLightCountDisplay <...> 
			ENDIF 
		CASE active 
			IF ( ( DrawActiveLights ) = 1 ) 
				change DrawActiveLights = 0 
				DestroyLightCountDisplay <...> 
			ELSE 
				change DrawActiveLights = 1 
				CreateLightCountDisplay <...> 
			ENDIF 
	ENDSWITCH 
ENDSCRIPT

SCRIPT CreateLightCountDisplay 
	SWITCH <light_type> 
		CASE model 
			<root_id> = mlight_anchor 
			<text_id> = mlight_text 
			<text> = "Model Lights" 
			<pos> = PAIR(400.00000000000, 40.00000000000) 
			<rgba> = [ 255 255 0 255 ] 
		CASE geom 
			<root_id> = glight_anchor 
			<text_id> = glight_text 
			<text> = "Geom Lights" 
			<pos> = PAIR(400.00000000000, 55.00000000000) 
			<rgba> = [ 255 0 255 255 ] 
		CASE active 
			<root_id> = alight_anchor 
			<text_id> = alight_text 
			<text> = "Active Lights" 
			<pos> = PAIR(400.00000000000, 70.00000000000) 
			<rgba> = [ 255 0 0 255 ] 
	ENDSWITCH 
	SetScreenElementLock id = root_window off 
	CreateScreenElement { 
		type = ContainerElement 
		parent = root_window 
		id = <root_id> 
		pos = <pos> 
		just = [ center center ] 
		internal_just = [ left center ] 
	} 
	CreateScreenElement { 
		type = TextElement 
		parent = <root_id> 
		id = <text_id> 
		pos = PAIR(0.00000000000, 0.00000000000) 
		text = <text> 
		font = dialog 
		rgba = <rgba> 
		just = [ left center ] 
		scale = 1.00000000000 
	} 
	SetScreenElementLock id = root_window on 
ENDSCRIPT

SCRIPT ModifyLightCountDisplay 
	SWITCH <light_type> 
		CASE model 
			<text_id> = mlight_text 
			FormatText textname = text "Model Lights: %d/%e" e = <count> d = <active> 
		CASE geom 
			<text_id> = glight_text 
			FormatText textname = text "Geom Lights: %d/%e" e = <count> d = <active> 
		CASE active 
			<text_id> = alight_text 
			FormatText textname = text "Active Lights" 
	ENDSWITCH 
	IF ObjectExists id = <text_id> 
		SetScreenElementProps id = <text_id> text = <text> 
	ENDIF 
ENDSCRIPT

SCRIPT DestroyLightCountDisplay 
	SWITCH <light_type> 
		CASE model 
			<root_id> = mlight_anchor 
		CASE geom 
			<root_id> = glight_anchor 
		CASE active 
			<root_id> = alight_anchor 
	ENDSWITCH 
	IF ObjectExists id = <root_id> 
		DestroyScreenElement id = <root_id> 
	ENDIF 
ENDSCRIPT

toggled_fps_on = 0 
framerate_warning = 60.00000000000 
SCRIPT ToggleFPS 
	IF ( toggled_fps_on = 1 ) 
		change toggled_fps_on = 0 
		KillSpawnedScript name = RefreshFPSDisplay 
		wait 0.20000000298 seconds 
		IF ObjectExists id = fps_anchor 
			DestroyScreenElement id = fps_anchor 
		ENDIF 
	ELSE 
		change toggled_fps_on = 1 
		SetScreenElementLock id = root_window off 
		IF ObjectExists id = fps_anchor 
			DestroyScreenElement id = fps_anchor 
		ENDIF 
		CreateScreenElement { 
			type = ContainerElement 
			parent = root_window 
			id = fps_anchor 
			pos = PAIR(30.00000000000, 240.00000000000) 
			just = [ center center ] 
			internal_just = [ left center ] 
		} 
		CreateScreenElement { 
			type = TextElement 
			parent = fps_anchor 
			id = fps_text 
			pos = PAIR(0.00000000000, -15.00000000000) 
			text = "FPS" 
			font = dialog 
			rgba = [ 60 60 100 100 ] 
			just = [ left center ] 
			scale = 1.00000000000 
		} 
		SetScreenElementLock id = root_window on 
		SpawnScript RefreshFPSDisplay 
	ENDIF 
ENDSCRIPT

toggled_anim_times_on = 0 
SCRIPT ToggleAnimTimes 
	IF ( toggled_anim_times_on = 1 ) 
		change toggled_anim_times_on = 0 
		KillSpawnedScript name = RefreshAnimTimesDisplay 
		wait 0.20000000298 seconds 
		IF ObjectExists id = anim_times_anchor 
			DestroyScreenElement id = anim_times_anchor 
		ENDIF 
		change min_anim_boned_frame_pcnt_1 = 999.00000000000 
		change min_anim_boned_frame_pcnt_2 = 999.00000000000 
		change max_anim_boned_frame_pcnt_1 = 0.00000000000 
		change max_anim_boned_frame_pcnt_2 = 0.00000000000 
		change min_anim_channel_frame_pcnt_1 = 999.00000000000 
		change min_anim_channel_frame_pcnt_2 = 999.00000000000 
		change max_anim_channel_frame_pcnt_1 = 0.00000000000 
		change max_anim_channel_frame_pcnt_2 = 0.00000000000 
		change min_anim_subset_frame_pcnt_1 = 999.00000000000 
		change min_anim_subset_frame_pcnt_2 = 999.00000000000 
		change max_anim_subset_frame_pcnt_1 = 0.00000000000 
		change max_anim_subset_frame_pcnt_2 = 0.00000000000 
	ELSE 
		change toggled_anim_times_on = 1 
		SetScreenElementLock id = root_window off 
		IF ObjectExists id = anim_times_anchor 
			DestroyScreenElement id = anim_times_anchor 
		ENDIF 
		CreateScreenElement { 
			type = ContainerElement 
			parent = root_window 
			id = anim_times_anchor 
			pos = PAIR(30.00000000000, 180.00000000000) 
			just = [ center center ] 
			internal_just = [ left center ] 
		} 
		CreateScreenElement { 
			type = TextElement 
			parent = anim_times_anchor 
			id = anim_times_text 
			pos = PAIR(0.00000000000, -75.00000000000) 
			text = "Animation Blending (pcnt/frame):" 
			font = dialog 
			rgba = [ 0 60 100 100 ] 
			just = [ left center ] 
			scale = 0.80000001192 
		} 
		CreateScreenElement { 
			type = TextElement 
			parent = anim_times_anchor 
			id = anim_times_p_text 
			pos = PAIR(0.00000000000, -60.00000000000) 
			text = "Primary (hero+horse):" 
			font = dialog 
			rgba = [ 60 0 100 100 ] 
			just = [ left center ] 
			scale = 0.80000001192 
		} 
		CreateScreenElement { 
			type = TextElement 
			parent = anim_times_anchor 
			id = anim_times_boned_text 
			pos = PAIR(0.00000000000, -45.00000000000) 
			text = "Boned Frames" 
			font = dialog 
			rgba = [ 60 60 100 100 ] 
			just = [ left center ] 
			scale = 0.80000001192 
		} 
		CreateScreenElement { 
			type = TextElement 
			parent = anim_times_anchor 
			id = anim_times_channel_text 
			pos = PAIR(0.00000000000, -30.00000000000) 
			text = "Channels" 
			font = dialog 
			rgba = [ 60 60 100 100 ] 
			just = [ left center ] 
			scale = 0.80000001192 
		} 
		CreateScreenElement { 
			type = TextElement 
			parent = anim_times_anchor 
			id = anim_times_subset_text 
			pos = PAIR(0.00000000000, -15.00000000000) 
			text = "Subset" 
			font = dialog 
			rgba = [ 60 60 100 100 ] 
			just = [ left center ] 
			scale = 0.80000001192 
		} 
		CreateScreenElement { 
			type = TextElement 
			parent = anim_times_anchor 
			id = anim_times_total_text 
			pos = PAIR(0.00000000000, 0.00000000000) 
			text = "Total" 
			font = dialog 
			rgba = [ 60 60 100 100 ] 
			just = [ left center ] 
			scale = 0.80000001192 
		} 
		CreateScreenElement { 
			type = TextElement 
			parent = anim_times_anchor 
			id = anim_times_break_text 
			pos = PAIR(0.00000000000, 15.00000000000) 
			text = "--------------------------" 
			font = dialog 
			rgba = [ 60 60 100 100 ] 
			just = [ left center ] 
			scale = 0.80000001192 
		} 
		CreateScreenElement { 
			type = TextElement 
			parent = anim_times_anchor 
			id = anim_times_s_text 
			pos = PAIR(0.00000000000, 30.00000000000) 
			text = "Secondary (peds):" 
			font = dialog 
			rgba = [ 60 0 100 100 ] 
			just = [ left center ] 
			scale = 0.80000001192 
		} 
		CreateScreenElement { 
			type = TextElement 
			parent = anim_times_anchor 
			id = anim_times_boned_text_2 
			pos = PAIR(0.00000000000, 45.00000000000) 
			text = "Boned Frames" 
			font = dialog 
			rgba = [ 60 60 100 100 ] 
			just = [ left center ] 
			scale = 0.80000001192 
		} 
		CreateScreenElement { 
			type = TextElement 
			parent = anim_times_anchor 
			id = anim_times_channel_text_2 
			pos = PAIR(0.00000000000, 60.00000000000) 
			text = "Channels" 
			font = dialog 
			rgba = [ 60 60 100 100 ] 
			just = [ left center ] 
			scale = 0.80000001192 
		} 
		CreateScreenElement { 
			type = TextElement 
			parent = anim_times_anchor 
			id = anim_times_subset_text_2 
			pos = PAIR(0.00000000000, 75.00000000000) 
			text = "Subset" 
			font = dialog 
			rgba = [ 60 60 100 100 ] 
			just = [ left center ] 
			scale = 0.80000001192 
		} 
		CreateScreenElement { 
			type = TextElement 
			parent = anim_times_anchor 
			id = anim_times_total_text_2 
			pos = PAIR(0.00000000000, 90.00000000000) 
			text = "Total" 
			font = dialog 
			rgba = [ 60 60 100 100 ] 
			just = [ left center ] 
			scale = 0.80000001192 
		} 
		SetScreenElementLock id = root_window on 
		SpawnScript RefreshAnimTimesDisplay 
	ENDIF 
ENDSCRIPT

min_anim_boned_frame_pcnt_1 = 999.00000000000 
min_anim_boned_frame_pcnt_2 = 999.00000000000 
max_anim_boned_frame_pcnt_1 = 0.00000000000 
max_anim_boned_frame_pcnt_2 = 0.00000000000 
min_anim_channel_frame_pcnt_1 = 999.00000000000 
min_anim_channel_frame_pcnt_2 = 999.00000000000 
max_anim_channel_frame_pcnt_1 = 0.00000000000 
max_anim_channel_frame_pcnt_2 = 0.00000000000 
min_anim_subset_frame_pcnt_1 = 999.00000000000 
min_anim_subset_frame_pcnt_2 = 999.00000000000 
max_anim_subset_frame_pcnt_1 = 0.00000000000 
max_anim_subset_frame_pcnt_2 = 0.00000000000 
SCRIPT RefreshAnimTimesDisplay 
	BEGIN 
		IF ObjectExists id = anim_times_anchor 
			GetCurrentAnimTimes 
			IF ( <primary_boned_time> > ( max_anim_boned_frame_pcnt_1 ) ) 
				IF ( <primary_boned_time> < 100.00000000000 ) 
					change max_anim_boned_frame_pcnt_1 = <primary_boned_time> 
				ENDIF 
			ELSE 
				IF ( <primary_boned_time> < ( min_anim_boned_frame_pcnt_1 ) ) 
					change min_anim_boned_frame_pcnt_1 = <primary_boned_time> 
				ENDIF 
			ENDIF 
			IF ( <secondary_boned_time> > ( max_anim_boned_frame_pcnt_2 ) ) 
				IF ( <secondary_boned_time> < 100.00000000000 ) 
					change max_anim_boned_frame_pcnt_2 = <secondary_boned_time> 
				ENDIF 
			ELSE 
				IF ( <secondary_boned_time> < ( min_anim_boned_frame_pcnt_2 ) ) 
					change min_anim_boned_frame_pcnt_2 = <secondary_boned_time> 
				ENDIF 
			ENDIF 
			IF ( <primary_channel_time> > ( max_anim_channel_frame_pcnt_1 ) ) 
				IF ( <primary_channel_time> < 100.00000000000 ) 
					change max_anim_channel_frame_pcnt_1 = <primary_channel_time> 
				ENDIF 
			ELSE 
				IF ( <primary_channel_time> < ( min_anim_channel_frame_pcnt_1 ) ) 
					change min_anim_channel_frame_pcnt_1 = <primary_channel_time> 
				ENDIF 
			ENDIF 
			IF ( <secondary_channel_time> > ( max_anim_channel_frame_pcnt_2 ) ) 
				IF ( <secondary_channel_time> < 100.00000000000 ) 
					change max_anim_channel_frame_pcnt_2 = <secondary_channel_time> 
				ENDIF 
			ELSE 
				IF ( <secondary_channel_time> < ( min_anim_channel_frame_pcnt_2 ) ) 
					change min_anim_channel_frame_pcnt_2 = <secondary_channel_time> 
				ENDIF 
			ENDIF 
			IF ( <primary_subset_time> > ( max_anim_subset_frame_pcnt_1 ) ) 
				IF ( <primary_subset_time> < 100.00000000000 ) 
					change max_anim_subset_frame_pcnt_1 = <primary_subset_time> 
				ENDIF 
			ELSE 
				IF ( <primary_subset_time> < ( min_anim_subset_frame_pcnt_1 ) ) 
					change min_anim_subset_frame_pcnt_1 = <primary_subset_time> 
				ENDIF 
			ENDIF 
			IF ( <secondary_subset_time> > ( max_anim_subset_frame_pcnt_2 ) ) 
				IF ( <secondary_subset_time> < 100.00000000000 ) 
					change max_anim_subset_frame_pcnt_2 = <secondary_subset_time> 
				ENDIF 
			ELSE 
				IF ( <secondary_subset_time> < ( min_anim_subset_frame_pcnt_2 ) ) 
					change min_anim_subset_frame_pcnt_2 = <secondary_subset_time> 
				ENDIF 
			ENDIF 
			FormatText textname = test1 "Boned: \\c5%d \\c0(\\c4%e, \\c2%f\\c0)" d = <primary_boned_time> e = ( min_anim_boned_frame_pcnt_1 ) f = ( max_anim_boned_frame_pcnt_1 ) 
			SetScreenElementProps id = anim_times_boned_text text = <test1> 
			FormatText textname = test2 "Channel: \\c5%d \\c0(\\c4%e, \\c2%f\\c0)" d = <primary_channel_time> e = ( min_anim_channel_frame_pcnt_1 ) f = ( max_anim_channel_frame_pcnt_1 ) 
			SetScreenElementProps id = anim_times_channel_text text = <test2> 
			FormatText textname = test3 "Subset: \\c5%d \\c0(\\c4%e, \\c2%f\\c0)" d = <primary_subset_time> e = ( min_anim_subset_frame_pcnt_1 ) f = ( max_anim_subset_frame_pcnt_1 ) 
			SetScreenElementProps id = anim_times_subset_text text = <test3> 
			FormatText { 
				textname = test4 "Total: \\c5%d \\c0(\\c4%e, \\c2%f\\c0)" 
				d = ( <primary_boned_time> + <primary_channel_time> + <primary_subset_time> ) 
				e = ( ( min_anim_boned_frame_pcnt_1 ) + ( min_anim_channel_frame_pcnt_1 ) + ( min_anim_subset_frame_pcnt_1 ) ) 
				f = ( ( max_anim_boned_frame_pcnt_1 ) + ( max_anim_channel_frame_pcnt_1 ) + ( max_anim_subset_frame_pcnt_1 ) ) 
			} 
			SetScreenElementProps id = anim_times_total_text text = <test4> 
			FormatText textname = test5 "Boned: \\c5%d \\c0(\\c4%e, \\c2%f\\c0)" d = <secondary_boned_time> e = ( min_anim_boned_frame_pcnt_2 ) f = ( max_anim_boned_frame_pcnt_2 ) 
			SetScreenElementProps id = anim_times_boned_text_2 text = <test5> 
			FormatText textname = test6 "Channel: \\c5%d \\c0(\\c4%e, \\c2%f\\c0)" d = <secondary_channel_time> e = ( min_anim_channel_frame_pcnt_2 ) f = ( max_anim_channel_frame_pcnt_2 ) 
			SetScreenElementProps id = anim_times_channel_text_2 text = <test6> 
			FormatText textname = test7 "Subset: \\c5%d \\c0(\\c4%e, \\c2%f\\c0)" d = <secondary_subset_time> e = ( min_anim_subset_frame_pcnt_2 ) f = ( max_anim_subset_frame_pcnt_2 ) 
			SetScreenElementProps id = anim_times_subset_text_2 text = <test7> 
			FormatText { 
				textname = test8 "Total: \\c5%d \\c0(\\c4%e, \\c2%f\\c0)" 
				d = ( <secondary_boned_time> + <secondary_channel_time> + <secondary_subset_time> ) 
				e = ( ( min_anim_boned_frame_pcnt_2 ) + ( min_anim_channel_frame_pcnt_2 ) + ( min_anim_subset_frame_pcnt_2 ) ) 
				f = ( ( max_anim_boned_frame_pcnt_2 ) + ( max_anim_channel_frame_pcnt_2 ) + ( max_anim_subset_frame_pcnt_2 ) ) 
			} 
			SetScreenElementProps id = anim_times_total_text_2 text = <test8> 
		ELSE 
			KillSpawnedScript id = RefreshAnimTimesDisplay 
			change toggled_anim_times_on = 0 
		ENDIF 
		wait <interval> seconds 
	REPEAT 
ENDSCRIPT

toggled_particle_times_on = 0 
SCRIPT ToggleParticleTimes 
	IF ( toggled_particle_times_on = 1 ) 
		change toggled_particle_times_on = 0 
		KillSpawnedScript name = RefreshParticleTimesDisplay 
		wait 0.20000000298 seconds 
		IF ObjectExists id = particle_times_anchor 
			DestroyScreenElement id = particle_times_anchor 
		ENDIF 
		IF ObjectExists id = new_particle_times_anchor 
			DestroyScreenElement id = new_particle_times_anchor 
		ENDIF 
		change min_particle_process_frame_pcnt = 999.00000000000 
		change max_particle_process_frame_pcnt = 0.00000000000 
		change min_particle_render_frame_pcnt = 999.00000000000 
		change max_particle_render_frame_pcnt = 0.00000000000 
		change min_particle_sys_count = 99999 
		change max_particle_sys_count = 0 
		change min_particle_num_count = 99999 
		change max_particle_num_count = 0 
		change min_particle_prim_count = 99999 
		change max_particle_prim_count = 0 
		change min_new_particle_process_frame_pcnt = 999.00000000000 
		change max_new_particle_process_frame_pcnt = 0.00000000000 
		change min_new_particle_render_frame_pcnt = 999.00000000000 
		change max_new_particle_render_frame_pcnt = 0.00000000000 
		change min_new_particle_sys_count = 99999 
		change max_new_particle_sys_count = 0 
		change min_new_particle_num_count = 99999 
		change max_new_particle_num_count = 0 
	ELSE 
		change toggled_particle_times_on = 1 
		SetScreenElementLock id = root_window off 
		IF ObjectExists id = particle_times_anchor 
			DestroyScreenElement id = particle_times_anchor 
		ENDIF 
		IF ObjectExists id = new_particle_times_anchor 
			DestroyScreenElement id = new_particle_times_anchor 
		ENDIF 
		CreateScreenElement { 
			type = ContainerElement 
			parent = root_window 
			id = particle_times_anchor 
			pos = PAIR(30.00000000000, 150.00000000000) 
			just = [ center center ] 
			internal_just = [ left center ] 
		} 
		CreateScreenElement { 
			type = TextElement 
			parent = particle_times_anchor 
			id = particle_times_text 
			pos = PAIR(0.00000000000, -60.00000000000) 
			text = "Flexible Particles (pcnt/frame):" 
			font = dialog 
			rgba = [ 60 60 100 100 ] 
			just = [ left center ] 
			scale = 0.80000001192 
		} 
		CreateScreenElement { 
			type = TextElement 
			parent = particle_times_anchor 
			id = particle_times_process_text 
			pos = PAIR(0.00000000000, -45.00000000000) 
			text = "Process" 
			font = dialog 
			rgba = [ 60 60 100 100 ] 
			just = [ left center ] 
			scale = 0.80000001192 
		} 
		CreateScreenElement { 
			type = TextElement 
			parent = particle_times_anchor 
			id = particle_times_render_text 
			pos = PAIR(0.00000000000, -30.00000000000) 
			text = "Render" 
			font = dialog 
			rgba = [ 60 60 100 100 ] 
			just = [ left center ] 
			scale = 0.80000001192 
		} 
		CreateScreenElement { 
			type = TextElement 
			parent = particle_times_anchor 
			id = particle_times_total_text 
			pos = PAIR(0.00000000000, -15.00000000000) 
			text = "Total" 
			font = dialog 
			rgba = [ 60 60 100 100 ] 
			just = [ left center ] 
			scale = 0.80000001192 
		} 
		CreateScreenElement { 
			type = TextElement 
			parent = particle_times_anchor 
			id = particle_times_break_text 
			pos = PAIR(0.00000000000, 0.00000000000) 
			text = "--------------------------" 
			font = dialog 
			rgba = [ 60 60 100 100 ] 
			just = [ left center ] 
			scale = 0.80000001192 
		} 
		CreateScreenElement { 
			type = TextElement 
			parent = particle_times_anchor 
			id = particle_times_sys_text 
			pos = PAIR(0.00000000000, 15.00000000000) 
			text = "ParticleSys" 
			font = dialog 
			rgba = [ 60 60 100 100 ] 
			just = [ left center ] 
			scale = 0.80000001192 
		} 
		CreateScreenElement { 
			type = TextElement 
			parent = particle_times_anchor 
			id = particle_times_num_text 
			pos = PAIR(0.00000000000, 30.00000000000) 
			text = "ParticleNum" 
			font = dialog 
			rgba = [ 60 60 100 100 ] 
			just = [ left center ] 
			scale = 0.80000001192 
		} 
		CreateScreenElement { 
			type = TextElement 
			parent = particle_times_anchor 
			id = particle_times_prims_text 
			pos = PAIR(0.00000000000, 45.00000000000) 
			text = "ParticlePrims" 
			font = dialog 
			rgba = [ 60 60 100 100 ] 
			just = [ left center ] 
			scale = 0.80000001192 
		} 
		CreateScreenElement { 
			type = ContainerElement 
			parent = root_window 
			id = new_particle_times_anchor 
			pos = PAIR(30.00000000000, 280.00000000000) 
			just = [ center center ] 
			internal_just = [ left center ] 
		} 
		CreateScreenElement { 
			type = TextElement 
			parent = new_particle_times_anchor 
			id = new_particle_times_text 
			pos = PAIR(0.00000000000, -60.00000000000) 
			text = "Fast Particles (pcnt/frame):" 
			font = dialog 
			rgba = [ 60 100 60 100 ] 
			just = [ left center ] 
			scale = 0.80000001192 
		} 
		CreateScreenElement { 
			type = TextElement 
			parent = new_particle_times_anchor 
			id = new_particle_times_process_text 
			pos = PAIR(0.00000000000, -45.00000000000) 
			text = "Process" 
			font = dialog 
			rgba = [ 60 100 60 100 ] 
			just = [ left center ] 
			scale = 0.80000001192 
		} 
		CreateScreenElement { 
			type = TextElement 
			parent = new_particle_times_anchor 
			id = new_particle_times_render_text 
			pos = PAIR(0.00000000000, -30.00000000000) 
			text = "Render" 
			font = dialog 
			rgba = [ 60 100 60 100 ] 
			just = [ left center ] 
			scale = 0.80000001192 
		} 
		CreateScreenElement { 
			type = TextElement 
			parent = new_particle_times_anchor 
			id = new_particle_times_total_text 
			pos = PAIR(0.00000000000, -15.00000000000) 
			text = "Total" 
			font = dialog 
			rgba = [ 60 100 60 100 ] 
			just = [ left center ] 
			scale = 0.80000001192 
		} 
		CreateScreenElement { 
			type = TextElement 
			parent = new_particle_times_anchor 
			id = new_particle_times_break_text 
			pos = PAIR(0.00000000000, 0.00000000000) 
			text = "--------------------------" 
			font = dialog 
			rgba = [ 60 100 60 1000 ] 
			just = [ left center ] 
			scale = 0.80000001192 
		} 
		CreateScreenElement { 
			type = TextElement 
			parent = new_particle_times_anchor 
			id = new_particle_times_sys_text 
			pos = PAIR(0.00000000000, 15.00000000000) 
			text = "ParticleSys" 
			font = dialog 
			rgba = [ 60 100 60 100 ] 
			just = [ left center ] 
			scale = 0.80000001192 
		} 
		CreateScreenElement { 
			type = TextElement 
			parent = new_particle_times_anchor 
			id = new_particle_times_num_text 
			pos = PAIR(0.00000000000, 30.00000000000) 
			text = "ParticleNum" 
			font = dialog 
			rgba = [ 60 100 60 100 ] 
			just = [ left center ] 
			scale = 0.80000001192 
		} 
		SetScreenElementLock id = root_window on 
		SpawnScript RefreshParticleTimesDisplay 
	ENDIF 
ENDSCRIPT

SCRIPT FlexParticleWarning 
	SetScreenElementLock id = root_window off 
	IF ObjectExists id = particle_warn_anchor 
		DestroyScreenElement id = particle_warn_anchor 
	ENDIF 
	CreateScreenElement { 
		type = ContainerElement 
		parent = root_window 
		id = particle_warn_anchor 
		pos = PAIR(25.00000000000, 80.00000000000) 
		just = [ center center ] 
		internal_just = [ left center ] 
	} 
	CreateScreenElement { 
		type = TextElement 
		parent = particle_warn_anchor 
		id = particle_warn_text 
		pos = PAIR(0.00000000000, 0.00000000000) 
		text = "Particle failed: Too many at once" 
		font = dialog 
		rgba = [ 255 0 0 255 ] 
		just = [ left top ] 
	} 
	SetScreenElementLock id = root_window on 
	wait 2 seconds 
	IF ObjectExists id = particle_warn_anchor 
		DestroyScreenElement id = particle_warn_anchor 
	ENDIF 
ENDSCRIPT

SCRIPT RefreshFPSDisplay interval = 0.10000000149 
	BEGIN 
		IF ObjectExists id = fps_anchor 
			FormatText textname = fps "FPS: %d" d = ( framerate_value ) 
			SetScreenElementProps id = fps_text text = <fps> 
			IF ( ( framerate_value ) < framerate_warning ) 
				SetScreenElementProps id = fps_text rgba = [ 255 0 0 255 ] 
			ELSE 
				SetScreenElementProps id = fps_text rgba = [ 0 255 0 100 ] 
			ENDIF 
		ELSE 
			KillSpawnedScript id = RefreshFPSDisplay 
			change toggled_fps_on = 0 
		ENDIF 
		wait <interval> seconds 
	REPEAT 
ENDSCRIPT

min_particle_process_frame_pcnt = 999.00000000000 
max_particle_process_frame_pcnt = 0.00000000000 
min_particle_render_frame_pcnt = 999.00000000000 
max_particle_render_frame_pcnt = 0.00000000000 
min_particle_sys_count = 99999 
max_particle_sys_count = 0 
min_particle_num_count = 99999 
max_particle_num_count = 0 
min_particle_prim_count = 99999 
max_particle_prim_count = 0 
min_new_particle_process_frame_pcnt = 999.00000000000 
max_new_particle_process_frame_pcnt = 0.00000000000 
min_new_particle_render_frame_pcnt = 999.00000000000 
max_new_particle_render_frame_pcnt = 0.00000000000 
min_new_particle_sys_count = 99999 
max_new_particle_sys_count = 0 
min_new_particle_num_count = 99999 
max_new_particle_num_count = 0 
SCRIPT RefreshParticleTimesDisplay 
	BEGIN 
		IF ObjectExists id = particle_times_anchor 
			GetCurrentParticleTimes 
			IF ( <particle_process_frame_pcnt> > ( max_particle_process_frame_pcnt ) ) 
				IF ( <particle_process_frame_pcnt> < 100.00000000000 ) 
					change max_particle_process_frame_pcnt = <particle_process_frame_pcnt> 
				ENDIF 
			ELSE 
				IF ( <particle_process_frame_pcnt> < ( min_particle_process_frame_pcnt ) ) 
					change min_particle_process_frame_pcnt = <particle_process_frame_pcnt> 
				ENDIF 
			ENDIF 
			IF ( <particle_render_frame_pcnt> > ( max_particle_render_frame_pcnt ) ) 
				IF ( <particle_render_frame_pcnt> < 100.00000000000 ) 
					change max_particle_render_frame_pcnt = <particle_render_frame_pcnt> 
				ENDIF 
			ELSE 
				IF ( <particle_render_frame_pcnt> < ( min_particle_render_frame_pcnt ) ) 
					change min_particle_render_frame_pcnt = <particle_render_frame_pcnt> 
				ENDIF 
			ENDIF 
			IF ( <geom_stats_old_particle_systems> > ( max_particle_sys_count ) ) 
				change max_particle_sys_count = <geom_stats_old_particle_systems> 
			ELSE 
				IF ( <geom_stats_old_particle_systems> < ( min_particle_sys_count ) ) 
					change min_particle_sys_count = <geom_stats_old_particle_systems> 
				ENDIF 
			ENDIF 
			IF ( <geom_stats_old_particles> > ( max_particle_num_count ) ) 
				change max_particle_num_count = <geom_stats_old_particles> 
			ELSE 
				IF ( <geom_stats_old_particles> < ( min_particle_num_count ) ) 
					change min_particle_num_count = <geom_stats_old_particles> 
				ENDIF 
			ENDIF 
			IF ( <geom_stats_old_particle_prims> > ( max_particle_prim_count ) ) 
				change max_particle_prim_count = <geom_stats_old_particle_prims> 
			ELSE 
				IF ( <geom_stats_old_particle_prims> < ( min_particle_prim_count ) ) 
					change min_particle_prim_count = <geom_stats_old_particle_prims> 
				ENDIF 
			ENDIF 
			FormatText textname = test1 "Process: \\c5%d \\c0(\\c4%e, \\c2%f\\c0)" d = <particle_process_frame_pcnt> e = ( min_particle_process_frame_pcnt ) f = ( max_particle_process_frame_pcnt ) 
			SetScreenElementProps id = particle_times_process_text text = <test1> 
			FormatText textname = test2 "Render: \\c5%d \\c0(\\c4%e, \\c2%f\\c0)" d = <particle_render_frame_pcnt> e = ( min_particle_render_frame_pcnt ) f = ( max_particle_render_frame_pcnt ) 
			SetScreenElementProps id = particle_times_render_text text = <test2> 
			FormatText textname = test3 "Total: \\c5%d \\c0(\\c4%e, \\c2%f\\c0)" d = ( <particle_process_frame_pcnt> + <particle_render_frame_pcnt> ) e = ( ( min_particle_process_frame_pcnt ) + ( min_particle_render_frame_pcnt ) ) f = ( ( max_particle_process_frame_pcnt ) + ( max_particle_render_frame_pcnt ) ) 
			SetScreenElementProps id = particle_times_total_text text = <test3> 
			FormatText textname = test4 "Particle Systems: \\c5%d \\c0(\\c4%e, \\c2%f\\c0)" d = <geom_stats_old_particle_systems> e = ( min_particle_sys_count ) f = ( max_particle_sys_count ) 
			SetScreenElementProps id = particle_times_sys_text text = <test4> 
			FormatText textname = test5 "Particle Count: \\c5%d \\c0(\\c4%e, \\c2%f\\c0)" d = <geom_stats_old_particles> e = ( min_particle_num_count ) f = ( max_particle_num_count ) 
			SetScreenElementProps id = particle_times_num_text text = <test5> 
			FormatText textname = test6 "Particle Primitives: \\c5%d \\c0(\\c4%e, \\c2%f\\c0)" d = <geom_stats_old_particle_prims> e = ( min_particle_prim_count ) f = ( max_particle_prim_count ) 
			SetScreenElementProps id = particle_times_prims_text text = <test6> 
			IF ( <new_particle_process_frame_pcnt> > ( max_new_particle_process_frame_pcnt ) ) 
				IF ( <new_particle_process_frame_pcnt> < 100.00000000000 ) 
					change max_new_particle_process_frame_pcnt = <new_particle_process_frame_pcnt> 
				ENDIF 
			ELSE 
				IF ( <new_particle_process_frame_pcnt> < ( min_new_particle_process_frame_pcnt ) ) 
					change min_new_particle_process_frame_pcnt = <new_particle_process_frame_pcnt> 
				ENDIF 
			ENDIF 
			IF ( <new_particle_render_frame_pcnt> > ( max_new_particle_render_frame_pcnt ) ) 
				IF ( <new_particle_render_frame_pcnt> < 100.00000000000 ) 
					change max_new_particle_render_frame_pcnt = <new_particle_render_frame_pcnt> 
				ENDIF 
			ELSE 
				IF ( <new_particle_render_frame_pcnt> < ( min_new_particle_render_frame_pcnt ) ) 
					change min_new_particle_render_frame_pcnt = <new_particle_render_frame_pcnt> 
				ENDIF 
			ENDIF 
			IF ( <geom_stats_new_particle_systems> > ( max_new_particle_sys_count ) ) 
				change max_new_particle_sys_count = <geom_stats_new_particle_systems> 
			ELSE 
				IF ( <geom_stats_new_particle_systems> < ( min_new_particle_sys_count ) ) 
					change min_new_particle_sys_count = <geom_stats_new_particle_systems> 
				ENDIF 
			ENDIF 
			IF ( <geom_stats_new_particles> > ( max_new_particle_num_count ) ) 
				change max_new_particle_num_count = <geom_stats_new_particles> 
			ELSE 
				IF ( <geom_stats_new_particles> < ( min_new_particle_num_count ) ) 
					change min_new_particle_num_count = <geom_stats_new_particles> 
				ENDIF 
			ENDIF 
			FormatText textname = test1 "Process: \\c5%d \\c0(\\c4%e, \\c2%f\\c0)" d = <new_particle_process_frame_pcnt> e = ( min_new_particle_process_frame_pcnt ) f = ( max_new_particle_process_frame_pcnt ) 
			SetScreenElementProps id = new_particle_times_process_text text = <test1> 
			FormatText textname = test2 "Render: \\c5%d \\c0(\\c4%e, \\c2%f\\c0)" d = <new_particle_render_frame_pcnt> e = ( min_new_particle_render_frame_pcnt ) f = ( max_new_particle_render_frame_pcnt ) 
			SetScreenElementProps id = new_particle_times_render_text text = <test2> 
			FormatText textname = test3 "Total: \\c5%d \\c0(\\c4%e, \\c2%f\\c0)" d = ( <new_particle_process_frame_pcnt> + <new_particle_render_frame_pcnt> ) e = ( ( min_new_particle_process_frame_pcnt ) + ( min_new_particle_render_frame_pcnt ) ) f = ( ( max_new_particle_process_frame_pcnt ) + ( max_new_particle_render_frame_pcnt ) ) 
			SetScreenElementProps id = new_particle_times_total_text text = <test3> 
			FormatText textname = test4 "Particle Systems: \\c5%d \\c0(\\c4%e, \\c2%f\\c0)" d = <geom_stats_new_particle_systems> e = ( min_new_particle_sys_count ) f = ( max_new_particle_sys_count ) 
			SetScreenElementProps id = new_particle_times_sys_text text = <test4> 
			FormatText textname = test5 "Particle Count: \\c5%d \\c0(\\c4%e, \\c2%f\\c0)" d = <geom_stats_new_particles> e = ( min_new_particle_num_count ) f = ( max_new_particle_num_count ) 
			SetScreenElementProps id = new_particle_times_num_text text = <test5> 
		ELSE 
			KillSpawnedScript id = RefreshParticleTimesDisplay 
			change toggled_particle_times_on = 0 
		ENDIF 
		wait <interval> seconds 
	REPEAT 
ENDSCRIPT

SCRIPT toggle_wireframe_skins 
	IF ( wireframe_skins = 1 ) 
		change wireframe_skins = 0 
	ELSE 
		change wireframe_skins = 1 
	ENDIF 
ENDSCRIPT

free_mem_on = 0 
SCRIPT show_free_mem 
	IF ( free_mem_on = 0 ) 
		change free_mem_on = 1 
		DoScreenElementMorph { 
			id = the_score_sprite 
			scale = 0 
		} 
		DoScreenElementMorph { 
			id = the_score 
			scale = 0 
		} 
		DoScreenElementMorph { 
			id = goal_points_text 
			scale = 0 
		} 
		IF ScreenElementExists id = goal_points_display 
			DoScreenElementMorph id = goal_points_display scale = 0 
		ENDIF 
		SetScreenElementLock id = root_window off 
		IF ObjectExists id = free_mem_anchor 
			DestroyScreenElement id = free_mem_anchor 
			wait 0.20000000298 seconds 
		ENDIF 
		CreateScreenElement { 
			type = ContainerElement 
			parent = root_window 
			id = free_mem_anchor 
			pos = PAIR(30.00000000000, 40.00000000000) 
			just = [ center center ] 
			internal_just = [ left center ] 
		} 
		CreateScreenElement { 
			type = TextElement 
			parent = free_mem_anchor 
			pos = PAIR(0.00000000000, -15.00000000000) 
			text = "Free Memory" 
			font = dialog 
			rgba = [ 60 60 100 100 ] 
			just = [ left center ] 
			scale = 0.80000001192 
		} 
		CreateScreenElement { 
			type = TextElement 
			parent = free_mem_anchor 
			id = topdown_heap_text 
			pos = PAIR(0.00000000000, 0.00000000000) 
			text = "" 
			font = dialog 
			rgba = [ 58 108 58 100 ] 
			just = [ left center ] 
			scale = 0.80000001192 
		} 
		CreateScreenElement { 
			type = TextElement 
			parent = free_mem_anchor 
			id = script_heap_text 
			pos = PAIR(0.00000000000, 15.00000000000) 
			text = "" 
			font = dialog 
			rgba = [ 58 108 58 100 ] 
			just = [ left center ] 
			scale = 0.80000001192 
		} 
		SetScreenElementLock id = root_window on 
		SpawnScript RefreshFreeMemoryDisplay 
	ELSE 
		change free_mem_on = 0 
		KillSpawnedScript name = RefreshFreeMemoryDisplay 
		wait 0.20000000298 seconds 
		IF ObjectExists id = free_mem_anchor 
			DestroyScreenElement id = free_mem_anchor 
		ENDIF 
		DoScreenElementMorph { 
			id = the_score_sprite 
			scale = 1 
		} 
		DoScreenElementMorph { 
			id = the_score 
			scale = 1 
		} 
		DoScreenElementMorph { 
			id = goal_points_text 
			scale = 1 
		} 
		IF ScreenElementExists id = goal_points_display 
			DoScreenElementMorph id = goal_points_display scale = 1 
		ENDIF 
	ENDIF 
ENDSCRIPT

freemem_script_lowest = 999999999 
freemem_main_lowest = 999999999 
SCRIPT RefreshFreeMemoryDisplay interval = 1.00000000000 
	BEGIN 
		DisplayFreeMem 
		wait <interval> seconds 
	REPEAT 
ENDSCRIPT

SCRIPT UpdateDisplayFreeMemory 
	IF ObjectExists id = free_mem_anchor 
		FormatText ChecksumName = context_name "Script" 
		IF ( <id> = <context_name> ) 
			FormatText textname = script_heap "Script: %m (%nK) low: %o (%pK)" m = <free_mem> n = ( <free_mem> / 1024 ) o = min_free_mem p = ( <min_free_mem> / 1024 ) UseCommas 
			SetScreenElementProps id = script_heap_text text = <script_heap> 
		ENDIF 
		FormatText ChecksumName = context_name "Top Down" 
		IF ( <id> = <context_name> ) 
			FormatText textname = main_heap "Main: %m (%nK) low: %o (%pK)" m = <free_mem> n = ( <free_mem> / 1024 ) o = min_free_mem p = ( <min_free_mem> / 1024 ) UseCommas 
			SetScreenElementProps id = topdown_heap_text text = <main_heap> 
		ENDIF 
	ELSE 
		KillSpawnedScript id = RefreshFreeMemoryDisplay 
		change free_mem_on = 0 
	ENDIF 
ENDSCRIPT

SCRIPT show_defrag_anim_cache 
	printf "\\n\\n\\n************Before:***********************" 
	dumpheaps 
	UpdateAnimCache defrag 
	printf "\\n************After:***********************" 
	dumpheaps 
ENDSCRIPT

SCRIPT toggle_show_all 
	show_all 
ENDSCRIPT

SCRIPT toggle_show_polys showscript = show_vert 
	<showscript> 
	pulse_item 
ENDSCRIPT

SCRIPT launch_keyboard 
	DestroyScreenElement id = current_menu_anchor 
	create_onscreen_keyboard 
ENDSCRIPT

SCRIPT launch_cheats_menu 
	RunScriptOnScreenElement id = current_menu_anchor animate_out callback = create_cheats_menu 
ENDSCRIPT

SCRIPT create_cheats_menu 
	GoalManager_HidePoints 
	GoalManager_HideGoalPoints 
	make_new_menu { 
		padding_scale = 1 
		menu_id = cheats_menu 
		vmenu_id = cheats_vmenu 
		menu_title = "CHEATS" 
		padding_scale = 0.89999997616 
		pos = PAIR(230.00000000000, 40.00000000000) 
		helper_text = generic_helper_text 
	} 
	kill_start_key_binding 
	SetScreenElementProps { id = cheats_menu 
		event_handlers = [ { pad_back create_debug_options_menu } ] 
	} 
	make_text_sub_menu_item text = "Time of Day" pad_choose_script = launch_timeofday_menu 
	make_text_sub_menu_item text = "View Cutscenes" pad_choose_script = launch_view_cutscenes_menu 
	make_toggle_menu_item id = cheats_menu_level_lock text = "Levels unlocked: " pad_choose_script = cheats_menu_change_level_lock 
	IF GameModeEquals is_career 
		make_text_sub_menu_item text = "Advance Stage" pad_choose_script = cheats_menu_advance_stage 
		make_text_sub_menu_item text = "Give 50 cheat points for this session" pad_choose_script = give_cheat_points 
		make_text_sub_menu_item text = "Reset cheat points for this session" pad_choose_script = reset_cheat_points 
	ENDIF 
	IF GameModeEquals is_classic 
		make_toggle_menu_item id = classic_cheat_points text = "Goals to complete bracket:" pad_choose_script = cheats_menu_change_classic_points 
		RunScriptOnScreenElement id = classic_cheat_points cheats_menu_refresh_classic_points 
	ENDIF 
	make_text_sub_menu_item text = "100 Stat Points" pad_choose_script = cheats_menu_100_stat_points 
	IF GoalManager_HasActiveGoals 
		make_text_sub_menu_item text = "Beat current goal" pad_choose_script = cheats_menu_beat_current_goal 
	ENDIF 
	make_text_sub_menu_item text = "Unlock all chapters" pad_choose_script = unlock_all_chapters 
	make_text_sub_menu_item text = "Unlock all stats goals" pad_choose_script = cheats_menu_UnlockAllStatsGoals 
	make_text_sub_menu_item text = "Score 5 million points" pad_choose_script = cheats_menu_score5mil 
	make_text_sub_menu_item text = "Mark all goals unbeaten" pad_choose_script = cheats_menu_UnBeatAllGoals 
	make_text_sub_menu_item text = "Set Difficulty Level" pad_choose_script = launch_cheats_menu_select_difficulty 
	RunScriptOnScreenElement id = cheats_menu_level_lock cheats_menu_check_level_lock 
	FireEvent type = focus target = cheats_menu 
ENDSCRIPT

SCRIPT cheats_menu_change_flag 
	GetTags 
	IF GetGlobalFlag flag = <flag> 
		UnSetGlobalFlag flag = <flag> 
		toggle_menu_item_off id = <id> 
	ELSE 
		SetGlobalFlag flag = <flag> 
		toggle_menu_item_on id = <id> 
	ENDIF 
ENDSCRIPT

SCRIPT cheats_menu_check_flag 
	GetTags 
	IF GetGlobalFlag flag = <flag> 
		toggle_menu_item_on id = <id> 
	ELSE 
		toggle_menu_item_off id = <id> 
	ENDIF 
ENDSCRIPT

SCRIPT cheats_menu_check_level_lock 
	GetTags 
	IF IntegerEquals a = all_levels_unlocked b = 1 
		toggle_menu_item_on id = <id> 
	ELSE 
		toggle_menu_item_off id = <id> 
	ENDIF 
ENDSCRIPT

SCRIPT cheats_menu_change_level_lock 
	GetTags 
	IF IntegerEquals a = all_levels_unlocked b = 1 
		toggle_menu_item_off id = <id> 
		change all_levels_unlocked = 0 
	ELSE 
		IF IntegerEquals a = all_levels_unlocked b = 0 
			toggle_menu_item_on id = <id> 
			change all_levels_unlocked = 1 
			change DEMO_BUILD = 0 
			printf "changing demo build to 0" 
		ENDIF 
	ENDIF 
	pulse_item 
ENDSCRIPT

SCRIPT cheats_menu_refresh_classic_points 
	GetTags 
	IF IsTrue classic_mode_use_cheat_points 
		SetScreenElementProps { 
			id = { <id> child = 0 } 
			text = "     1" 
		} 
	ELSE 
		GetClassicModeTargetGoalsComplete 
		FormatText textname = goals "     %g" g = <target_goals_complete> 
		SetScreenElementProps { 
			id = { <id> child = 0 } 
			text = <goals> 
		} 
	ENDIF 
ENDSCRIPT

SCRIPT cheats_menu_change_classic_points 
	GetTags 
	IF IntegerEquals a = classic_mode_use_cheat_points b = 1 
		change classic_mode_use_cheat_points = 0 
		cheats_menu_refresh_classic_points <...> 
	ELSE 
		change classic_mode_use_cheat_points = 1 
		cheats_menu_refresh_classic_points <...> 
	ENDIF 
	pulse_item 
ENDSCRIPT

SCRIPT cheats_menu_100_stat_points 
	AwardStatPoint 100 
	pulse_item 
ENDSCRIPT

SCRIPT cheats_menu_UnlockAllGoals 
	GoalManager_UnlockAllGoals 
	pulse_item 
ENDSCRIPT

SCRIPT cheats_menu_UnlockAllStatsGoals 
	Skater : StatsManager_UnlockAmGoals 
	Skater : StatsManager_UnlockProGoals 
	pulse_item 
ENDSCRIPT

SCRIPT cheats_menu_score5mil 
	Skater : SetTrickName "You cheat like Kurt" 
	Skater : SetTrickScore 5000000 
	Skater : display 
ENDSCRIPT

SCRIPT cheats_menu_UnBeatAllGoals 
	GoalManager_UnBeatAllGoals 
	GoalManager_UninitializeAllGoals 
	GoalManager_InitializeAllGoals 
ENDSCRIPT

SCRIPT cheats_menu_beat_current_goal 
	IF GoalManager_GetActiveGoalId 
		exit_pause_menu 
		GoalManager_WinGoal name = <goal_id> 
	ENDIF 
ENDSCRIPT

SCRIPT cheats_menu_advance_stage 
	exit_pause_menu 
	wait 1 gameframes 
	change total_cheat_points = 1000 
	GotoNextChapter 
ENDSCRIPT

SCRIPT launch_cheats_menu_select_difficulty 
	IF ScreenElementExists id = current_menu_anchor 
		DestroyScreenElement id = current_menu_anchor 
	ENDIF 
	make_new_menu { 
		menu_id = cheats_select_difficulty_menu 
		vmenu_id = cheats_select_difficulty_vmenu 
		menu_title = "SET DIFFICULTY" 
		helper_text = generic_helper_text_left_right 
	} 
	make_text_sub_menu_item { 
		text = "Easy" 
		id = cheats_difficulty_easy 
		pad_choose_script = cheats_menu_set_difficulty 
		pad_choose_params = { difficulty = 0 } 
	} 
	make_text_sub_menu_item { 
		text = "Normal" 
		id = cheats_difficulty_normal 
		pad_choose_script = cheats_menu_set_difficulty 
		pad_choose_params = { difficulty = 1 } 
	} 
	make_text_sub_menu_item { 
		text = "Sick" 
		id = cheats_difficulty_sick 
		pad_choose_script = cheats_menu_set_difficulty 
		pad_choose_params = { difficulty = 2 } 
	} 
	FireEvent type = focus target = cheats_select_difficulty_menu 
ENDSCRIPT

SCRIPT cheats_menu_set_difficulty 
	GoalManager_SetDifficultyLevel <difficulty> 
	GoalManager_UninitializeAllGoals 
	GoalManager_InitializeAllGoals 
	launch_cheats_menu 
ENDSCRIPT

SCRIPT create_set_premade_skater_menu 
	IF ObjectExists id = current_menu_anchor 
		DestroyScreenElement id = current_menu_anchor 
	ENDIF 
	make_new_menu { 
		menu_id = set_premade_skater_menu 
		vmenu_id = set_premade_skater_vmenu 
		menu_title = "PRE-MADE SKATERS" 
		type = VScrollingMenu 
		scrolling_menu_title_id = set_premade_skater_title 
		num_items_to_show = 6 
		dims = PAIR(200.00000000000, 180.00000000000) 
	} 
	SetScreenElementProps { 
		id = set_premade_skater_menu 
		event_handlers = [ { pad_back create_test_menu } ] 
		replace_handlers 
	} 
	GetArraySize custom_male_appearances 
	index = 0 
	BEGIN 
		<text> = ( ( custom_male_appearances [ <index> ] ) . name ) 
		FormatText ChecksumName = id "%i" i = <text> 
		make_text_sub_menu_item { 
			text = <text> 
			id = <id> 
			pad_choose_script = set_premade_skater 
			pad_choose_params = { 
				appearance = ( ( custom_male_appearances [ <index> ] ) . struct ) 
				female = ( ( custom_male_appearances [ <index> ] ) . female ) 
			} 
		} 
		index = ( <index> + 1 ) 
	REPEAT <array_size> 
	RunScriptOnScreenElement id = current_menu_anchor animate_in params = { final_pos = PAIR(320.00000000000, 134.00000000000) } 
ENDSCRIPT

SCRIPT set_premade_skater 
	GetCurrentSkaterProfileIndex 
	IF NOT GotParam female 
		SetSkaterProfileProperty player = <currentSkaterProfileIndex> is_male 1 
	ELSE 
		SetSkaterProfileProperty player = <currentSkaterProfileIndex> is_male 0 
	ENDIF 
	SetPlayerAppearance appearance_structure = <appearance> player = <currentSkaterProfileIndex> 
	RefreshSkaterModel Skater = 0 profile = <currentSkaterProfileIndex> 
	exit_pause_menu 
ENDSCRIPT



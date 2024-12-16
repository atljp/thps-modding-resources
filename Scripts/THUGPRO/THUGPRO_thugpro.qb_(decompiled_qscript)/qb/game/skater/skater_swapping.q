skater_swapping_teammate_name = none 
SCRIPT swap_skaters_get_current_name 
	GetCurrentSkaterProfileIndex 
	GetSkaterProfileInfo player = <currentSkaterProfileIndex> 
	IF ( <skater_family> = family_pro ) 
		RETURN name = pro_teammate 
	ENDIF 
	RETURN name = <name> 
ENDSCRIPT

SCRIPT swap_skaters_setup 
	Obj_ClearExceptions 
	Obj_GetId 
	setup_ped_speech { 
		ped_id = <objId> 
		accept_text = "Press \\m5 to switch." 
		swap_skaters 
		swap_skaters_params = { 
			objId = <objId> 
			profile_name = <profile_name> 
			restart_node = <restart_node> 
			activation_script = <activation_script> 
			activation_script_params = <activation_script_params> 
		} 
		activation_script = <activation_script> 
		activation_script_params = <activation_script_params> 
	} 
	<objId> : Obj_SpawnScript swap_skaters_set_avoid_exception 
ENDSCRIPT

SCRIPT swap_skaters obj_1 = skater 
	GoalManager_ClearLastGoal 
	TerminateObjectsScripts id = <objId> script_name = setup_ped_speech 
	TerminateObjectsScripts id = <objId> script_name = ped_speech_got_trigger 
	TerminateObjectsScripts id = <objId> script_name = swap_skaters_set_avoid_exception 
	<objId> : Obj_ClearException ObjectOutofRadius 
	<objId> : Obj_ClearException ObjectInRadius 
	IF ScreenElementExists id = ped_speech_dialog 
		DestroyScreenElement id = ped_speech_dialog 
	ENDIF 
	IF IsSkaterOnVehicle 
		GetTags 
		IF ( <racemode> = gurney ) 
			reset_gurney no_ai show_gurney 
		ELSE 
			was_on_vehicle = 1 
		ENDIF 
		segway_reenable_gurney 
		SkaterVehicleOff 
		SkaterLoopingSound_TurnOn 
	ENDIF 
	remove_all_anim_subsets 
	TurnOffLevelParticles 
	SwapObjectModels obj_1 = <obj_1> obj_2 = <objId> 
	IF ( <profile_name> = custom ) 
		<objId> : ped_disable_bones 
	ELSE 
		<objId> : ped_enable_bones 
	ENDIF 
	SetSwappedSkaterName profile_name = <profile_name> return_params 
	RefreshSwappedSkaterData return_params 
	IF GotParam restart_node 
		ResetSkaters node_name = <restart_node> 
		skater : RemoveSkaterFromWorld 
		wait 1 frame 
		skater : AddSkaterToWorld 
	ENDIF 
	IF GotParam motoskateboard 
		MotoSkateboardOn 
		IF walking 
			CleanUp_WalkingtoSkating 
			SwitchToSkatingPhysics 
			MakeSkaterGoto OnGroundAI 
		ENDIF 
	ELSE 
		MotoSkateboardOff 
	ENDIF 
	IF GotParam vehicle_params 
		Vehicle_Start Params = <vehicle_params> 
	ELSE 
		IF GotParam was_on_vehicle 
			KillObjectAnim current 
			MakeSkaterGoto OnGroundAI 
		ENDIF 
	ENDIF 
	IF NOT GotParam no_ped_setup 
		IF GotParam was_on_vehicle 
			TerminateObjectsScripts id = <objId> 
			get_skater_index_from_name name = <old_profile_name> 
			IF StructureContains vehicle_params structure = ( master_skater_list [ <skater_index> ] ) 
				old_vehicle_params = ( master_skater_list [ <skater_index> ] . vehicle_params ) 
				<objId> : Obj_PlayAnim anim = ( <old_vehicle_params> . idle_anim ) cycle 
			ENDIF 
		ELSE 
			IF <objId> : Obj_HasComponent PedLogic 
				RunScriptOnObject { 
					id = <objId> 
					Ped_InitAI 
					Params = { 
						Stand 
						GetAttention 
						should_look_at_skater = 0 
					} 
				} 
				<objId> : Ped_SetLogicState STATE_standing 
			ELSE 
				<objId> : Obj_PlayAnim anim = Ped_M_SkateIdle1 cycle 
			ENDIF 
		ENDIF 
		RunScriptOnObject { 
			id = <objId> 
			setup_ped_speech 
			Params = { 
				ped_id = <objId> 
				accept_text = "Press \\m5 to switch." 
				swap_skaters 
				swap_skaters_params = { 
					objId = <objId> 
					profile_name = <old_profile_name> 
					restart_node = <restart_node> 
					activation_script = <activation_script> 
					activation_script_params = <activation_script_params> 
				} 
				activation_script = <activation_script> 
				activation_script_params = <activation_script_params> 
			} 
		} 
		<objId> : Obj_SpawnScript swap_skaters_set_avoid_exception 
	ENDIF 
	<objId> : SetTags profile_name = <old_profile_name> 
	UnPauseSkaters 
	restore_start_key_binding 
ENDSCRIPT

SCRIPT SetSwappedSkaterName 
	get_current_skater_name 
	<old_profile_name> = <name> 
	SelectCurrentSkater name = ( <profile_name> ) 
	IF GotParam return_params 
		RemoveParameter return_params 
		RETURN <...> 
	ENDIF 
ENDSCRIPT

SCRIPT RefreshSwappedSkaterData 
	GetCurrentSkaterProfileIndex 
	UpdateTrickMappings skater = <currentSkaterProfileIndex> 
	GetSkaterProfileInfo player = <currentSkaterProfileIndex> 
	set_correct_graffiti_textures <...> 
	IF GotParam return_params 
		RemoveParameter return_params 
		RETURN <...> 
	ENDIF 
ENDSCRIPT

SCRIPT ResetSkaterToCustom 
	printf "Resetting Skater" 
	IF IsSkaterOnVehicle 
		GetTags 
		IF ( <racemode> = gurney ) 
			reset_gurney no_ai show_gurney 
			SkaterVehicleOff 
		ELSE 
			was_on_vehicle = 1 
		ENDIF 
		IF NodeExists TRG_Gurney_Ghost 
			segway_reenable_gurney 
		ENDIF 
		SkaterVehicleOff 
		remove_all_anim_subsets 
		SkaterLoopingSound_TurnOn 
	ENDIF 
	RestoreAllSwappedObjectModels 
	SelectCurrentSkater name = custom 
	RefreshSwappedSkaterData 
	ResetSkaters 
ENDSCRIPT

SCRIPT swap_skaters_wait_and_reset_avoid_exception 
	wait 20 gameframes 
	swap_skaters_set_avoid_exception 
ENDSCRIPT

SCRIPT swap_skaters_set_avoid_exception 
	Obj_SetInnerAvoidRadius 3 
	Obj_GetId 
	SetEventHandlerOnObject { 
		object = <objId> 
		exception 
		ex = ObjectInAvoidRadius 
		scr = goal_pro_bounce_skater 
		Params = { reset_script = swap_skaters_wait_and_reset_avoid_exception } 
	} 
ENDSCRIPT

SCRIPT swap_skaters_get_current_skater_name 
	<objId> : GetTags 
	IF GotParam model_name 
		RETURN model_name = <model_name> 
	ENDIF 
ENDSCRIPT

SCRIPT swap_skaters_get_vehicle_params 
	skater : GetTags 
	RETURN skater_vehicle_params = <vehicle_params> 
ENDSCRIPT

SCRIPT play_swappable_pro_intro_cameras 
	IF NOT IsAlive name = TRG_Ped_TeammateIntroPro 
		Create name = TRG_Ped_TeammateIntroPro 
	ENDIF 
	IF CompositeObjectExists name = TRG_Ped_TeammateIntroPro 
		SwapObjectModels obj_1 = TRG_Ped_TeammateIntroPro obj_2 = skater 
	ENDIF 
	IF NOT GotParam intro_cameras 
		script_assert "no intro_cameras specified" 
	ENDIF 
	PlayIntroCameras goal_intro_cameras = <intro_cameras> letterbox 
	IF CompositeObjectExists name = TRG_Ped_TeammateIntroPro 
		SwapObjectModels obj_1 = TRG_Ped_TeammateIntroPro obj_2 = skater 
	ENDIF 
	Kill name = TRG_Ped_TeammateIntroPro 
ENDSCRIPT



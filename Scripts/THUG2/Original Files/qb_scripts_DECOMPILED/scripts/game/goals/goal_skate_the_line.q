Goal_SkateTheLine_GenericParams = { 
	goal_text = "Skate the line!" 
	view_goals_text = "Generic skate the line text" 
	time = 120 
	init = goal_skate_the_line_init 
	uninit = goal_uninit 
	activate = goal_skate_the_line_activate 
	deactivate = goal_skate_the_line_deactivate 
	expire = goal_skate_the_line_expire 
	fail = goal_skate_the_line_fail 
	success = goal_skate_the_line_success 
	restart_node = TRG_G_SKATETHELINE_RestartNode 
	trigger_obj_id = TRG_G_SKATETHELINE_Pro 
	record_type = score 
	play_goal_start_sound 
	SkateTheLine 
} 
SCRIPT goal_skate_the_line_init 
	IF NOT GotParam goal_objects 
		script_assert "goal_objects array not defined for %s" s = <goal_id> 
	ENDIF 
	goal_init <...> 
ENDSCRIPT

SCRIPT goal_skate_the_line_activate 
	IF GotParam no_cam_anim 
		goal_passive_start goal_id = <goal_id> 
	ELSE 
		goal_start goal_id = <goal_id> 
	ENDIF 
ENDSCRIPT

SCRIPT goal_skate_the_line_deactivate 
	goal_deactivate <...> 
	goal_skate_the_line_colors_stop <...> stop_all 
	IF ScreenElementExists id = skate_the_line_message 
		DestroyScreenElement id = skate_the_line_message 
	ENDIF 
ENDSCRIPT

SCRIPT goal_skate_the_line_expire 
	goal_expire <...> 
	GoalManager_LoseGoal name = <goal_id> 
ENDSCRIPT

SCRIPT goal_skate_the_line_fail 
	goal_fail <...> 
ENDSCRIPT

SCRIPT goal_skate_the_line_success 
	goal_success <...> 
ENDSCRIPT

SCRIPT goal_skate_the_line_next_cluster 
	IF NOT GotParam keep_last 
		goal_skate_the_line_colors_stop <...> 
		IF GotParam text 
			IF ScreenElementExists id = current_goal 
				DestroyScreenElement id = current_goal 
			ENDIF 
			create_panel_block id = skate_the_line_message text = <text> style = panel_message_goal 
		ENDIF 
	ENDIF 
	goal_skate_the_line_spawn_blinking <...> 
	IF GotParam first_spot_params 
		goal_skate_the_line_spawn_blinking <...> <first_spot_params> goal_objects_index = 0 
	ENDIF 
ENDSCRIPT

SCRIPT goal_skate_the_line_spawn_blinking 
	IF GotParam trick_objects 
		GetArraySize <trick_objects> 
		<index> = 0 
		BEGIN 
			FormatText { 
				ChecksumName = colors_script_id 
				"%s_goal_skate_the_line_colors_%i.%d" 
				s = <goal_name> 
				i = <goal_objects_index> 
				d = <index> 
			} 
			<script_params> = ( <trick_objects> [ <index> ] ) 
			SpawnScript { 
				goal_skate_the_line_colors 
				id = <colors_script_id> 
				params = <script_params> 
			} 
			<index> = ( <index> + 1 ) 
		REPEAT <array_size> 
	ELSE 
		IF NOT ( ( GotParam name ) | ( GotParam prefix ) ) 
			RETURN 
		ENDIF 
		FormatText ChecksumName = colors_script_id "%s_goal_skate_the_line_colors" s = <goal_name> 
		SpawnScript { 
			goal_skate_the_line_colors 
			id = <colors_script_id> 
			params = <script_params> 
		} 
	ENDIF 
ENDSCRIPT

SCRIPT goal_skate_the_line_colors_stop 
	GetArraySize <goal_objects> 
	<goal_objects_array_size> = <array_size> 
	<goal_objects_index> = 0 
	BEGIN 
		<goal_object> = ( <goal_objects> [ <goal_objects_index> ] ) 
		IF StructureContains structure = <goal_object> trick_objects 
			<trick_objects> = ( <goal_object> . trick_objects ) 
			GetArraySize <trick_objects> 
			<index> = 0 
			<should_stop> = 0 
			IF GotParam stop_all 
				<should_stop> = 1 
			ELSE 
				<num_flags_set> = 0 
				GoalManager_GetGoalParams name = <goal_id> 
				IF NOT ( <goal_objects_index> = ( <num_flags_set> - 1 ) ) 
					<should_stop> = 1 
				ENDIF 
			ENDIF 
			IF ( <should_stop> = 1 ) 
				BEGIN 
					FormatText { 
						ChecksumName = colors_script_id 
						"%s_goal_skate_the_line_colors_%i.%d" 
						s = <goal_name> 
						i = <goal_objects_index> 
						d = <index> 
					} 
					KillSpawnedScript id = <colors_script_id> 
					<script_params> = ( <trick_objects> [ <index> ] ) 
					SetLightGroup <script_params> 
					SetObjectColor_CurrentTOD <script_params> 
					<index> = ( <index> + 1 ) 
				REPEAT <array_size> 
			ENDIF 
		ELSE 
			<should_stop> = 0 
			IF GotParam stop_all 
				<should_stop> = 1 
			ELSE 
				<num_flags_set> = 0 
				GoalManager_GetGoalParams name = <goal_id> 
				IF NOT ( <goal_objects_index> = ( <num_flags_set> - 1 ) ) 
					<should_stop> = 1 
				ENDIF 
			ENDIF 
			IF ( <should_stop> = 1 ) 
				FormatText ChecksumName = colors_script_id "%s_goal_skate_the_line_colors" s = <goal_name> 
				KillSpawnedScript id = <colors_script_id> 
				SetLightGroup <goal_object> 
				SetObjectColor_CurrentTOD <goal_object> 
			ENDIF 
		ENDIF 
		<goal_objects_index> = ( <goal_objects_index> + 1 ) 
	REPEAT <goal_objects_array_size> 
ENDSCRIPT

SCRIPT goal_skate_the_line_colors 
	SetLightGroup <...> light_group = goal_skate_the_line_colors 
	BEGIN 
		
		SetObjectColor color = ( 255 + ( 255 * 256 ) + ( 120 * 65536 ) ) <...> 
		wait 0.50000000000 seconds 
		SetObjectColor color = ( 254 + ( 163 * 256 ) + ( 90 * 65536 ) ) <...> 
		wait 0.50000000000 seconds 
	REPEAT 
ENDSCRIPT



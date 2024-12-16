
SCRIPT Ped_Utils_SetupHintSpeech { 
		hint_text = "Hint!" 
		hint_text_time = 3 
		inner_radius = 8 
		outer_radius = 24 
		activation_script = ped_utils_default_hint_dialog 
	} 
	ClearEventHandler AnyObjectInRadius 
	ClearEventHandler ObjectOutofRadius 
	Obj_SetInnerRadius <inner_radius> 
	SetEventHandler ex = AnyObjectInRadius scr = ped_speech_got_trigger params = { <...> activation_script_params = <...> } 
ENDSCRIPT

SCRIPT Ped_Utils_CancelHintSpeech 
	ClearEventHandler AnyObjectInRadius 
	ClearEventHandler ObjectOutofRadius 
ENDSCRIPT

SCRIPT ped_utils_default_hint_dialog 
	IF ObjectExists id = <ped_id> 
		<ped_id> : Ped_SetLogicState STATE_standing 
	ENDIF 
	IF ObjectExists id = ped_speech_dialog 
		DestroyScreenElement id = ped_speech_dialog 
	ENDIF 
	UnPauseSkaters 
	create_speech_box { 
		anchor_id = ped_hint_dialog 
		text = <hint_text> 
		no_pad_choose 
		no_pad_start 
		bg_rgba = [ 100 100 100 128 ] 
		text_rgba = [ 128 128 128 128 ] 
		pos = PAIR(320.00000000000, 400.00000000000) 
		bg_x_scale = 1.39999997616 
		z_priority = 5 
	} 
	IF GotParam VO 
		IF ObjectExists id = <ped_id> 
			<ped_id> : Obj_StopStream ThisPedHintStream 
			wait 1 gameframe 
			IF StreamExists <VO> 
				IF ( CheckForPedStreamExistence = 1 ) 
					
				ENDIF 
				IF GotParam Volume 
					
					<ped_id> : Obj_PlayStream <VO> vol = <Volume> priority = 101 dropoff = GlobalHintVODropoff id = ThisPedHintStream 
				ELSE 
					
					<ped_id> : Obj_PlayStream <VO> vol = GlobalHintVOVol priority = 101 dropoff = GlobalHintVODropoff id = ThisPedHintStream 
				ENDIF 
			ELSE 
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				IF ( CheckForPedStreamExistence = 1 ) 
					BEGIN 
						PlaySound GUI_buzzer01 vol = 200 
						wait 0.20000000298 seconds 
					REPEAT 10 
				ENDIF 
			ENDIF 
		ENDIF 
	ENDIF 
	IF GotParam hint_text_script 
		IF ObjectExists id = <ped_id> 
			<ped_id> : Obj_SpawnScript <hint_text_script> params = <...> 
		ENDIF 
	ENDIF 
	wait <hint_text_time> seconds 
	IF ObjectExists id = <ped_id> 
		<ped_id> : Ped_Utils_SetMiscEventHandlers 
		<ped_id> : Ped_StateLogic_SetDefaultState 
	ENDIF 
	IF ObjectExists id = ped_hint_dialog 
		DestroyScreenElement id = ped_hint_dialog 
	ENDIF 
ENDSCRIPT

SCRIPT ped_utils_hint_dialog_refuse 
	IF ObjectExists id = <ped_id> 
		<ped_id> : Ped_Utils_SetMiscEventHandlers 
	ENDIF 
	IF ObjectExists id = ped_hint_dialog 
		DestroyScreenElement id = ped_hint_dialog 
	ENDIF 
ENDSCRIPT

SCRIPT Ped_Utils_SetCollisionResponse Type = ignore 
	GetArraySize ( Ped_StateLogic_CollisionTypes ) 
	<index> = 0 
	BEGIN 
		IF ( <Type> = ( Ped_StateLogic_CollisionTypes [ <index> ] . Tag ) ) 
			SetTags collision_mode = ( Ped_StateLogic_CollisionTypes [ <index> ] . Set_mode ) 
			ClearEventHandler ObjectInAvoidRadius 
			Obj_SetInnerAvoidRadius 0 
		ENDIF 
		<index> = ( <index> + 1 ) 
	REPEAT <array_size> 
	ped_initialize_collision_exceptions 
ENDSCRIPT

SCRIPT Ped_Utils_SetMiscEventHandlers 
	GetTags 
	GetArraySize ( Ped_StateLogic_EventHandlers ) 
	<index> = 0 
	BEGIN 
		IF GotParam ( Ped_StateLogic_EventHandlers [ <index> ] . Tag ) 
			SetEventHandler { 
				ex = ( Ped_StateLogic_EventHandlers [ <index> ] . Hook_event ) 
				scr = ( Ped_StateLogic_EventHandlers [ <index> ] . scr ) 
				params = { 
					SetState = ( Ped_StateLogic_EventHandlers [ <index> ] . State ) 
					event = ( Ped_StateLogic_EventHandlers [ <index> ] . Hook_event ) 
				} 
			} 
			Obj_SetAttentionRadius 30 ifZero 
		ENDIF 
		<index> = ( <index> + 1 ) 
	REPEAT <array_size> 
ENDSCRIPT

SCRIPT Ped_Utils_EventHandler 
	PED_DEBUGEVENT { params = <...> } 
	IF NOT GotParam SetState 
		script_assert "Missing <SetState> param" 
	ENDIF 
	IF GotParam event 
		ClearEventHandler <event> 
	ENDIF 
	Ped_SetLogicState <SetState> StateParams = <...> 
ENDSCRIPT

SCRIPT Ped_Utils_PlayStream 
	IF GotParam Type 
		IF Ped_GetVoicePrefix 
			BEGIN 
				<which> = RANDOM_PERMUTE(1, 1, 1, 1, 1, 1, 1) RANDOMCASE 1 RANDOMCASE 2 RANDOMCASE 3 RANDOMCASE 4 RANDOMCASE 5 RANDOMCASE 6 RANDOMCASE 7 RANDOMEND 
				SWITCH <Type> 
					CASE Avoid 
						FormatText checksumname = stream "%p_Avoid0%w" p = <VoicePrefix> w = <which> 
						FormatText textname = streams_text_name "%p_Avoid0%w" p = <VoicePrefix> w = <which> 
					CASE Far 
						FormatText checksumname = stream "%p_Far0%w" p = <VoicePrefix> w = <which> 
						FormatText textname = streams_text_name "%p_Far0%w" p = <VoicePrefix> w = <which> 
					CASE TrickBail 
						FormatText checksumname = stream "%p_TrickBail0%w" p = <VoicePrefix> w = <which> 
						FormatText textname = streams_text_name "%p_TrickBail0%w" p = <VoicePrefix> w = <which> 
					CASE TrickPositive 
						FormatText checksumname = stream "%p_TrickPositive0%w" p = <VoicePrefix> w = <which> 
						FormatText textname = streams_text_name "%p_TrickPositive0%w" p = <VoicePrefix> w = <which> 
				ENDSWITCH 
				IF NOT StreamExists <stream> 
				ELSE 
					BREAK 
				ENDIF 
				wait 0.00100000005 seconds 
			REPEAT 7 
			IF NOT StreamExists <stream> 
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				IF ( CheckForPedStreamExistence = 1 ) 
					BEGIN 
						PlaySound GUI_buzzer01 vol = 200 
						wait 0.20000000298 seconds 
					REPEAT 10 
				ENDIF 
			ELSE 
				IF ( CheckForPedStreamExistence = 1 ) 
					
					
					
				ENDIF 
				SWITCH <Type> 
					CASE Avoid 
						IF ( CheckForPedStreamExistence = 1 ) 
							
						ENDIF 
						Obj_StopStream InGamePedObjStreamLine 
						Obj_StopStream ThisPedHintStream 
						RANDOM_NO_REPEAT(4, 1) 
							RANDOMCASE 
							RANDOMCASE Obj_PlayStream <stream> vol = GlobalAvoidVOVol dropoff = GlobalAvoidVODropoff id = InGamePedObjStreamLine priority = StreamPriorityLowMid 
						RANDOMEND 
					CASE Far 
						IF ( CheckForPedStreamExistence = 1 ) 
							
						ENDIF 
						IF NOT IsStreamPlaying ThisPedHintStream 
							IF NOT IsStreamPlaying InGamePedObjStreamLine 
								Obj_PlayStream <stream> vol = GlobalFarVOVol dropoff = GlobalFarVODropoff id = InGamePedObjStreamLine priority = StreamPriorityLow 
							ENDIF 
						ENDIF 
					CASE TrickBail 
						IF ( CheckForPedStreamExistence = 1 ) 
							
						ENDIF 
						IF NOT IsStreamPlaying ThisPedHintStream 
							Obj_StopStream InGamePedObjStreamLine 
							Obj_PlayStream <stream> vol = GlobalTrickBailVOVol dropoff = GlobalTrickBailVODropoff id = InGamePedObjStreamLine priority = StreamPriorityLowMid 
						ENDIF 
					CASE TrickPositive 
						IF ( CheckForPedStreamExistence = 1 ) 
							
						ENDIF 
						IF NOT IsStreamPlaying ThisPedHintStream 
							Obj_StopStream InGamePedObjStreamLine 
							Obj_PlayStream <stream> vol = GlobalTrickPositiveVOVol dropoff = GlobalTrickPositiveVODropoff id = InGamePedObjStreamLine priority = StreamPriorityLowMid 
						ENDIF 
				ENDSWITCH 
			ENDIF 
		ENDIF 
	ELSE 
		IF NOT GotParam name 
			script_assert "Missing <name> param" 
		ENDIF 
		GetSingleTag VO_Types 
		IF NOT GotParam VO_Types 
			AddParams default_M_audio_assets 
		ENDIF 
		IF GotParam VO_Types 
			IF StructureContains <name> structure = <VO_Types> 
				IF IsArray ( <VO_Types> . <name> ) 
					IF GotParam index 
						Obj_PlayStream ( <VO_Types> . <name> [ <index> ] ) vol = 200 
					ELSE 
						GetRandomArrayElement ( <VO_Types> . <name> ) 
						Obj_PlayStream ( <element> ) vol = 200 
					ENDIF 
				ELSE 
					Obj_PlayStream ( <VO_Types> . <name> ) vol = 200 
				ENDIF 
			ENDIF 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT Ped_Utils_GetAnimName 
	IF NOT GotParam Type 
		script_assert "Missing <Type> Param" 
	ENDIF 
	IF GetSingleTag Anim_Types 
		IF StructureContains <Type> structure = ( <Anim_Types> ) 
			<AnimAssets> = ( <Anim_Types> . <Type> ) 
		ENDIF 
	ENDIF 
	IF NOT GotParam AnimAssets 
		Ped_GetGender 
		GetSingleTag move_type 
		IF ( <move_type> = skate ) 
			IF StructureContains <Type> structure = ( default_M_skater_anim_assets . Anim_Types ) 
				<AnimAssets> = ( default_M_skater_anim_assets . Anim_Types . <Type> ) 
			ENDIF 
		ELSE 
			IF ( <Gender> = male ) 
				IF StructureContains <Type> structure = ( default_M_anim_assets . Anim_Types ) 
					<AnimAssets> = ( default_M_anim_assets . Anim_Types . <Type> ) 
				ENDIF 
			ELSE 
				IF StructureContains <Type> structure = ( default_F_anim_assets . Anim_Types ) 
					<AnimAssets> = ( default_F_anim_assets . Anim_Types . <Type> ) 
				ENDIF 
			ENDIF 
		ENDIF 
	ENDIF 
	<AnimName> = default 
	IF GotParam AnimAssets 
		IF IsArray ( <AnimAssets> ) 
			IF GotParam index 
				<AnimName> = ( <AnimAssets> [ <index> ] ) 
			ELSE 
				GetRandomArrayElement ( <AnimAssets> ) 
				<AnimName> = <element> 
			ENDIF 
		ELSE 
			<AnimName> = <AnimAssets> 
		ENDIF 
	ENDIF 
	IF GotParam index 
		RETURN AnimName = <AnimName> index = <index> 
	ENDIF 
	RETURN AnimName = <AnimName> 
ENDSCRIPT

SCRIPT Ped_Utils_GetStateAnimName Table = Ped_StateLogic_Table 
	IF NOT GotParam Type 
		script_assert "Missing <Type> Param" 
	ENDIF 
	GetSingleTag move_type 
	IF ( move_type = skater ) 
		<m_assets> = skater 
	ELSE 
		Ped_GetGender 
		IF ( <Gender> = male ) 
			<m_assets> = male 
			IF ( <move_type> = stand ) 
				<m_stand_assets> = male_stand 
			ENDIF 
		ELSE 
			<m_assets> = female 
			IF ( <move_type> = stand ) 
				<m_stand_assets> = female_stand 
			ENDIF 
		ENDIF 
	ENDIF 
	IF NOT GotParam LogicState 
		Ped_GetLogicState 
	ENDIF 
	IF StructureContains ( <LogicState> ) structure = ( <Table> ) 
		IF StructureContains ( anim_assets ) structure = ( <Table> . <LogicState> ) 
			
			IF StructureContains ( <m_assets> ) structure = ( <Table> . <LogicState> . anim_assets ) 
				<state_assets> = ( <Table> . <LogicState> . anim_assets . <m_assets> ) 
				
				IF StructureContains ( Anim_Types ) structure = ( <state_assets> ) 
					IF StructureContains ( <Type> ) structure = ( <state_assets> . Anim_Types ) 
						<AnimName> = ( <state_assets> . Anim_Types . <Type> ) 
						FormatText textname = msg "Got <AnimName>=%s for male" s = <AnimName> 
						
					ENDIF 
				ENDIF 
			ENDIF 
		ENDIF 
	ENDIF 
	RETURN <AnimName> 
ENDSCRIPT

SCRIPT Ped_Utils_BeginPlayerChase MaxHomeDist = 0 CatchScript = NullScript Table = Ped_StateLogic_Table 
	<MaxHomeDist> = ( <MaxHomeDist> * 12 ) 
	Ped_StateLogic_RegisterTempDefaultState { State = STATE_chase Table = <Table> } 
	SetTags MaxHomeDist = <MaxHomeDist> CatchScript = <CatchScript> 
	Ped_SetLogicState STATE_chase 
ENDSCRIPT

SCRIPT Ped_Utils_EndPlayerChase 
	RemoveTags Tags = [ CatchScript ] 
	Ped_StateLogic_UnregisterTempDefaultState 
	goto Ped_Utils_BeginReturnHome 
ENDSCRIPT

SCRIPT Ped_Utils_BeginReturnHome 
	Ped_StateLogic_RegisterTempDefaultState { State = STATE_gohome Table = Ped_StateLogic_Table } 
	Ped_SetLogicState STATE_gohome 
ENDSCRIPT

SCRIPT Ped_Utils_EndReturnHome 
	Ped_StateLogic_UnregisterTempDefaultState 
	Ped_StateLogic_SetDefaultState 
ENDSCRIPT

SCRIPT Ped_Utils_GetVectorToPlayer 
	skater : Obj_GetPosition 
	<VecToPlayer> = <pos> 
	Obj_GetPosition 
	<VecToPlayer> = ( <VecToPlayer> - <pos> ) 
	NormalizeVector <VecToPlayer> 
	RETURN VecToPlayer = <norm> 
ENDSCRIPT



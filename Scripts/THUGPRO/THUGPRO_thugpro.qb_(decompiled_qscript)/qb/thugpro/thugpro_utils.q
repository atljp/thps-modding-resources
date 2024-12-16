
SCRIPT TRG_TP_SkaterDropIn_Script 
	MakeSkaterGoto dropin 
ENDSCRIPT

SCRIPT Jnk_Gap_Buoy 
	GetTriggerArray grind onto 
	IF Triggertype <trigger_array> 
		Obj_PlaySound SK6_BA_HitBuoyBell 
	ENDIF 
ENDSCRIPT

SCRIPT SK3_KillSkater_sand 
	IF Obj_FlagNotSet FLAG_SKATER_KILLING 
		Obj_SetFlag FLAG_SKATER_KILLING 
		IF GotParam DeathSound 
			PlaySound <DeathSound> 
		ELSE 
			PlaySound Smashcake 
		ENDIF 
		IF NOT InSplitScreenGame 
			IF NOT GetGlobalFlag flag = NO_DISPLAY_HUD 
				IF GotParam Message1 
					create_panel_message { 
						style = panel_message_death 
						id = death_message 
						text = RANDOM(1, 1, 1, 1) RANDOMCASE <Message1> RANDOMCASE <message2> RANDOMCASE <message3> RANDOMCASE <message4> RANDOMEND 
					} 
				ELSE 
					create_panel_message { 
						style = panel_message_death 
						id = death_message 
						text = RANDOM(1, 1, 1, 1, 1, 1) RANDOMCASE "EEK! Crabs!" RANDOMCASE "Litter Box Dive!" RANDOMCASE "Beach Comber!" RANDOMCASE "Sand In Your Shoes!" RANDOMCASE "The Seagulls Are Laughing!" RANDOMCASE "Stop Doing That!" RANDOMEND 
					} 
				ENDIF 
			ENDIF 
		ENDIF 
		SK3_Killskater_Finish sand r = 100 g = 100 b = 200 <...> 
	ENDIF 
ENDSCRIPT

SCRIPT THUGPRO_SpinkeyDebounce 
	SWITCH ( GLOBAL_ShoulderSpinButtons ) 
		CASE L2_R2 
			Debounce L2 time = 0.10000000149 clear = 1 
			Debounce R2 time = 0.10000000149 clear = 1 
		CASE L1_R1 
			Debounce L1 time = 0.10000000149 clear = 1 
			Debounce R1 time = 0.10000000149 clear = 1 
		CASE R1_R2 
			Debounce R1 time = 0.10000000149 clear = 1 
			Debounce R2 time = 0.10000000149 clear = 1 
		CASE L1_L2 
			Debounce L1 time = 0.10000000149 clear = 1 
			Debounce L2 time = 0.10000000149 clear = 1 
	ENDSWITCH 
ENDSCRIPT

SCRIPT THUGPRO_Televator 
	IF GotParam text 
		IF NOT GotParam cut 
			IF NOT InSplitScreenGame 
				create_panel_message id = leaving_message text = <text> pos = PAIR(320.00000000000, 300.00000000000) rgba = [ 118 , 110 , 14 , 128 ] 
			ENDIF 
		ENDIF 
	ENDIF 
	IF GotParam sound 
		PlaySound <sound> 
	ELSE 
		IF GotParam stream 
			IF NOT IsStreamPlaying <stream> 
				PlayStream <stream> vol = 100 priority = 101 
			ENDIF 
		ENDIF 
	ENDIF 
	IF GotParam freezeskater 
		MakeSkaterGoto freezeskater 
	ENDIF 
	IF GotParam node 
		sk3_teleporttonode nodename = <node> 
	ENDIF 
	IF GotParam jumpboost 
		IF walking 
			CleanUp_WalkingtoSkating 
		ENDIF 
		IF NOT IsSkaterOnVehicle 
			MakeSkaterGoto GroundGone 
		ENDIF 
		Debounce x clear = 1 
		THUGPRO_AutoKick Off 
		SetSpeed <ForWardPush> 
		jump 
		trigger_jump_boost multi = <Boost> 
		THUGPRO_AutoKick On 
	ENDIF 
ENDSCRIPT

THUGPRO_G_HighScore = 400000 
THUGPRO_G_ProScore = 800000 
THUGPRO_G_SickScore = 1250000 
THUGPRO_G_AmScore = THUGPRO_G_HighScore 
SCRIPT index_next_wraparound { index = 0 } 
	IF NOT GotParam max 
		RETURN 0 
	ENDIF 
	<index> = ( <index> + 1 ) 
	IF ( <index> = <max> ) 
		<index> = 0 
	ENDIF 
	RETURN index = <index> 
ENDSCRIPT

SCRIPT index_previous_wraparound { index = 0 } 
	IF NOT GotParam max 
		RETURN 0 
	ENDIF 
	<index> = ( <index> - 1 ) 
	IF ( <index> = -1 ) 
		<index> = ( <max> - 1 ) 
	ENDIF 
	RETURN index = <index> 
ENDSCRIPT

SCRIPT index_next_wraparound_2 { index = 0 min = 0 } 
	IF NOT GotParam max 
		RETURN 
	ENDIF 
	IF ( <index> > ( <max> - 1 ) ) 
		RETURN new_index = <min> 
	ELSE 
		<index> = ( <index> + 1 ) 
		RETURN new_index = <index> 
	ENDIF 
ENDSCRIPT

SCRIPT index_previous_wraparound_2 { index = 0 min = 0 } 
	IF NOT GotParam max 
		RETURN 
	ENDIF 
	IF ( <index> < ( <min> + 1 ) ) 
		RETURN new_index = <max> 
	ELSE 
		<index> = ( <index> - 1 ) 
		RETURN new_index = <index> 
	ENDIF 
ENDSCRIPT

SCRIPT GetIndexOfItemContainingInt 
	IF NOT GotParam array 
		RETURN 
	ENDIF 
	GetArraySize <array> 
	i = 0 
	BEGIN 
		IF StructureContains structure = ( <array> [ <i> ] ) <name> 
			IF StringEquals a = ( ( <array> [ ( <i> ) ] ) . key ) b = <value> 
				RETURN index = <i> 
				BREAK 
			ENDIF 
		ENDIF 
		<i> = ( <i> + 1 ) 
	REPEAT <array_size> 
ENDSCRIPT

SCRIPT get_index_of_struct_array_containing 
	IF NOT GotParam array 
		RETURN 
	ENDIF 
	IF NOT GotParam name 
		RETURN 
	ENDIF 
	IF NOT GotParam value 
		RETURN 
	ENDIF 
	IF NOT GotParam type 
		type = checksum 
	ENDIF 
	GetArraySize <array> 
	index = 0 
	BEGIN 
		IF StructureContains structure = ( <array> [ <index> ] ) <name> 
			SWITCH <type> 
				CASE checksum 
					IF ChecksumEquals a = ( ( <array> [ ( <index> ) ] ) . <name> ) b = <value> 
						RETURN item_index = <index> 
					ENDIF 
			ENDSWITCH 
		ENDIF 
		<index> = ( <index> + 1 ) 
	REPEAT <array_size> 
ENDSCRIPT

SCRIPT get_index_of_item_in_array 
	IF NOT GotParam array 
		RETURN 
	ENDIF 
	IF NOT GotParam item 
		RETURN 
	ENDIF 
	IF NOT GotParam type 
		type = checksum 
	ENDIF 
	GetArraySize <array> 
	i = 0 
	BEGIN 
		SWITCH <type> 
			CASE checksum 
				IF ChecksumEquals a = <item> b = ( <array> [ <i> ] ) 
					RETURN item_index = <i> 
				ENDIF 
			CASE String 
				IF StringEquals a = <item> b = ( <array> [ <i> ] ) 
					RETURN item_index = <i> 
				ENDIF 
			CASE Int 
				IF IntegerEquals a = <item> b = ( <array> [ <i> ] ) 
					RETURN item_index = <i> 
				ENDIF 
			DEFAULT 
				FormatText ChecksumName = a "%a" a = <item> 
				FormatText ChecksumName = b "%a" a = ( <array> [ <i> ] ) 
				IF ChecksumEquals a = <a> b = <b> 
					RETURN item_index = <i> 
				ENDIF 
		ENDSWITCH 
		<i> = ( <i> + 1 ) 
	REPEAT <array_size> 
ENDSCRIPT

SCRIPT Ding 
	PlaySound GoalGood vol = 100 
ENDSCRIPT

SCRIPT THUGPRO_SafeKill 
	IF GotParam name 
		IF IsAlive name = <name> 
			Kill name = <name> 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT THUGPRO_SafeCreate 
	IF GotParam name 
		IF NOT IsAlive name = <name> 
			Create name = <name> 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT THUGPRO_ForceCreate 
	IF GotParam name 
		IF NOT IsAlive name = <name> 
			Create name = <name> 
		ELSE 
			Kill name = <name> 
			Create name = <name> 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT UnsetFlagsFromArray 
	IF GotParam flags 
		GetArraySize <flags> 
		i = 0 
		BEGIN 
			UnSetGlobalFlag flag = ( <flags> [ <i> ] ) 
			IF NOT GotParam no_broadcast 
				IF IsHost 
					BroadcastOmnigon cheat_flag = ( <flags> [ <i> ] ) Off 
				ENDIF 
			ENDIF 
			<i> = ( <i> + 1 ) 
		REPEAT <array_size> 
	ELSE 
		RETURN 
	ENDIF 
ENDSCRIPT

SCRIPT UnsetFlagsExcept 
	IF GotParam flags 
		GetArraySize <flags> 
		i = 0 
		BEGIN 
			IF NOT ChecksumEquals a = <ex_flag> b = ( <flags> [ <i> ] ) 
				printf "these are not the flags we\'re looking for" 
				UnSetGlobalFlag flag = ( <flags> [ <i> ] ) 
				IF NOT GotParam no_broadcast 
					IF IsHost 
						BroadcastOmnigon cheat_flag = ( <flags> [ <i> ] ) Off 
					ENDIF 
				ENDIF 
			ELSE 
				IF GotParam toggle_flag 
					SetGlobalFlag flag = <ex_flag> 
					IF NOT GotParam no_broadcast 
						IF IsHost 
							BroadcastOmnigon cheat_flag = <ex_flag> On 
						ENDIF 
					ENDIF 
				ENDIF 
			ENDIF 
			<i> = ( <i> + 1 ) 
		REPEAT <array_size> 
	ELSE 
		RETURN 
	ENDIF 
ENDSCRIPT

SCRIPT GetNumFlagsSetFromArray 
	IF GotParam flags 
		GetArraySize <flags> 
		i = 0 
		num_flags = 0 
		BEGIN 
			IF GetGlobalFlag flag = ( <flags> [ <i> ] ) 
				<num_flags> = ( <num_flags> + 1 ) 
			ENDIF 
			<i> = ( <i> + 1 ) 
		REPEAT <array_size> 
	ELSE 
		RETURN num_flags = 0 
	ENDIF 
	RETURN num_flags = <num_flags> 
ENDSCRIPT

SCRIPT GetIndexOfSetFlag 
	IF GotParam flags 
		GetArraySize <flags> 
		i = 0 
		flag_index = 0 
		BEGIN 
			IF GetGlobalFlag flag = ( <flags> [ <i> ] ) 
				<flag_index> = <i> 
				BREAK 
			ENDIF 
			<i> = ( <i> + 1 ) 
		REPEAT <array_size> 
	ELSE 
		RETURN flag_index = -1 
	ENDIF 
	RETURN flag_index = <flag_index> 
ENDSCRIPT

SCRIPT StringSplitNameMessage 
	StringToCharArray String = <String> 
	GetArraySize <char_array> 
	item_index = 0 
	split_index = 0 
	BEGIN 
		IF ( <char_array> [ <item_index> ] = " " ) 
			FormatText TextName = split_chars "%a" a = ( ( <char_array> [ ( <item_index> ) ] ) + ( <char_array> [ ( <item_index> + 1 ) ] ) + ( <char_array> [ ( <item_index> + 2 ) ] ) ) 
			IF StringEquals a = <split_chars> b = " : " 
				<split_index> = <item_index> 
				BREAK 
			ENDIF 
		ENDIF 
		<item_index> = ( <item_index> + 1 ) 
	REPEAT <array_size> 
	IF ( <split_index> > 0 ) 
		<item_index> = 0 
		name_string = "" 
		BEGIN 
			FormatText TextName = name "%a" a = ( ( <name_string> ) + ( <char_array> [ ( <item_index> ) ] ) ) 
			<name_string> = <name> 
			<item_index> = ( <item_index> + 1 ) 
		REPEAT <split_index> 
		msg_len = ( ( <array_size> ) - ( <split_index> + 3 ) ) 
		<item_index> = ( <split_index> + 3 ) 
		msg_string = "" 
		BEGIN 
			FormatText TextName = msg "%a" a = ( ( <msg_string> ) + ( <char_array> [ ( <item_index> ) ] ) ) 
			<msg_string> = <msg> 
			<item_index> = ( <item_index> + 1 ) 
		REPEAT <msg_len> 
		RETURN name = <name_string> msg = <msg_string> 
	ENDIF 
ENDSCRIPT

SCRIPT THUGPRO_OutputNodeData 
ENDSCRIPT

SCRIPT TeleportSkaterToNodeAndScatter 
	IF NOT NodeExists <node_name> 
		ResetSkaters 
		edmsg text = "node does not exist! %n" params = { n = <node_name> } bad caller = TeleportSkaterToNodeAndScatter 
		RETURN 
	ENDIF 
	ResetSkaters node_name = <node_name> 
	IF NOT GotParam radius 
		RETURN 
	ENDIF 
	Obj_GetPosition 
	posx = ( <pos> . VECTOR(1.00000000000, 0.00000000000, 0.00000000000) ) 
	posz = ( <pos> . VECTOR(0.00000000000, 0.00000000000, 1.00000000000) ) 
	resx = ( ( ( <posx> ) + ( <radius> ) ) - ( ( <posx> ) - ( <radius> ) ) ) 
	resz = ( ( ( <posz> ) + ( <radius> ) ) - ( ( <posz> ) - ( <radius> ) ) ) 
	GetRandomValue name = newX a = ( ( <posx> ) - ( <radius> ) ) b = ( ( <posx> ) + ( <radius> ) ) Resolution = <resx> 
	GetRandomValue name = newZ a = ( ( <posz> ) - ( <radius> ) ) b = ( ( <posz> ) + ( <radius> ) ) Resolution = <resz> 
	edmsg text = "respawn offsets: x%x, z%z" params = { x = <newX> z = <newZ> } log_only 
	newpos = ( ( VECTOR(1.00000000000, 0.00000000000, 0.00000000000) * <newX> ) + ( VECTOR(0.00000000000, 1.00000000000, 0.00000000000) * ( <pos> . VECTOR(0.00000000000, 1.00000000000, 0.00000000000) ) ) + ( VECTOR(0.00000000000, 0.00000000000, 1.00000000000) * <newZ> ) ) 
	Obj_MoveToPos <newpos> 
ENDSCRIPT

SCRIPT THUGPRO_GetLevelInfo 
	GetLevelStructureName 
	RETURN load_script = ( <level_structure_name> . load_script ) 
ENDSCRIPT

SCRIPT DestroyIfObjectExist 
	IF ObjectExists id = <id> 
		DestroyScreenElement id = <id> 
	ENDIF 
ENDSCRIPT

SCRIPT SetScreenElementProps_IfExists 
	IF ScreenElementExists id = <id> 
		SetScreenElementProps <...> 
	ENDIF 
ENDSCRIPT

NET_PLAYER_IDS = [ 
	%0x0% 
	%0x1% 
	%0x2% 
	%0x3% 
	%0x4% 
	%0x5% 
	%0x6% 
	%0x7% 
	%0x8% 
	%0x9% 
	%0xa% 
	%0xb% 
	%0xc% 
	%0xd% 
	%0xe% 
	%0xf% 
	%0x10% 
] 
SCRIPT get_skater_number 
	SkaterNum = 0 
	temp = 0 
	BEGIN 
		IF SkaterExists Skater = <SkaterNum> 
			IF ( ( NET_PLAYER_IDS ) [ <SkaterNum> ] ) : IsLocalSkater 
				<temp> = <SkaterNum> 
				BREAK 
			ENDIF 
		ENDIF 
		<SkaterNum> = ( <SkaterNum> + 1 ) 
	REPEAT 8 
	RETURN skater_number = <temp> 
ENDSCRIPT

SCRIPT THUGPRO_ResetPhysics_or_ResetSkaters 
	IF IsTrue GameRunRespawns 
		ResetSkaters 
	ELSE 
		IF Skater : walking 
			ResetPhysics Walk 
		ELSE 
			ResetPhysics 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT THUGPRO_EnablePlayerInput 
	EnablePlayerInput 
ENDSCRIPT

SCRIPT thugpro_DisablePlayerInput 
	DisablePlayerInput 
ENDSCRIPT

SCRIPT Rail_Booster_Accelerate 
	Obj_GetId 
	Rail_Booster_Accelerate2 name = Rail_Booster_Accelerate2 
	<ObjId> : Obj_SpawnScript Rail_Booster_Accelerate2 params = <...> 
ENDSCRIPT

SCRIPT Rail_Booster_Accelerate2 { direction = "up" rate = 0.05000000075 DownhillMulti = 5 } 
	<OldPos> = 0 
	BEGIN 
		Skater : Obj_GetPosition 
		IF Skater : OnRail 
			Skater : GetSpeed 
			IF ( <pos> . VECTOR(0.00000000000, 1.00000000000, 0.00000000000) > <OldPos> ) 
				Skater : SetSpeed ( <speed> * ( 1.00000000000 + ( <rate> * 2.00000000000 ) ) ) 
			ENDIF 
			wait 1 frames 
			<OldPos> = ( <pos> . VECTOR(0.00000000000, 1.00000000000, 0.00000000000) ) 
		ELSE 
			<OldPos> = 0 
			KillSpawnedScript name = Rail_Booster_Accelerate2 
		ENDIF 
	REPEAT 
ENDSCRIPT

SCRIPT Accelerate 
	GetTriggerArray onto 
	IF Triggertype <trigger_array> 
		Obj_GetId 
		IF NOT <ObjId> : walking 
			IF NOT GetGlobalFlag { 
					flag = FLAG_SKATER_ACCELERATING 
				} 
				SetGlobalFlag { 
					flag = FLAG_SKATER_ACCELERATING 
				} 
				<ObjId> : Obj_SpawnScript Accelerate2 params = <...> 
			ENDIF 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT Accelerate2 { direction = "up" rate = 0.05000000075 DownhillMulti = 5 min_speed = 675 max = 1100 overrideTime = 5 } 
	OnExitRun killaccelerate 
	<OldPos> = 0 
	<was_just_on_rail> = 0 
	overridelimits max = <max> friction = 0 time = <overrideTime> gravity = 0 
	BEGIN 
		IF OnLip 
			UnSetGlobalFlag flag = FLAG_SKATER_ACCELERATING 
			RETURN 
		ENDIF 
		Obj_GetPosition 
		IF OnRail 
			GetSpeed 
			IF ( <speed> < 1.00000000000 ) 
				<OldPos> = 0 
				UnSetGlobalFlag flag = FLAG_SKATER_ACCELERATING 
				RETURN 
			ENDIF 
			IF ( <pos> . VECTOR(0.00000000000, 1.00000000000, 0.00000000000) > <OldPos> ) 
				SetSpeed ( <speed> * ( 1.00000000000 + <rate> ) ) 
			ENDIF 
			wait 1 frames 
			<OldPos> = ( <pos> . VECTOR(0.00000000000, 1.00000000000, 0.00000000000) ) 
			<was_just_on_rail> = 1 
		ELSE 
			IF ( <was_just_on_rail> = 0 ) 
				IF Skater : OnGround 
					IF GotParam BoostNoRail 
						GetSpeed 
						IF ( <speed> < <min_speed> ) 
							IF ( <pos> . VECTOR(0.00000000000, 1.00000000000, 0.00000000000) > <OldPos> ) 
								SetSpeed ( <speed> * ( 1.00000000000 + ( <rate> * 1.25000000000 ) ) ) 
							ENDIF 
						ENDIF 
						wait 1 frames 
						<OldPos> = ( <pos> . VECTOR(0.00000000000, 1.00000000000, 0.00000000000) ) 
					ENDIF 
				ELSE 
					<OldPos> = 0 
					UnSetGlobalFlag flag = FLAG_SKATER_ACCELERATING 
					RETURN 
				ENDIF 
			ELSE 
				<OldPos> = 0 
				UnSetGlobalFlag flag = FLAG_SKATER_ACCELERATING 
				RETURN 
			ENDIF 
			<OldPos> = ( <pos> . VECTOR(0.00000000000, 1.00000000000, 0.00000000000) ) 
		ENDIF 
		wait 1 frame 
	REPEAT 
ENDSCRIPT

SCRIPT killaccelerate 
	UnSetGlobalFlag { 
		flag = FLAG_SKATER_ACCELERATING 
	} 
ENDSCRIPT

SCRIPT Shaba_Boost_No_Rail 
	GetTriggerArray array = [ { jump Off } { grind Off } ] 
	IF Triggertype <trigger_array> 
		IF GotParam jump_speed 
			IF GotParam jump_multi 
				trigger_jump_boost speed = <jump_speed> multi = <jump_multi> 
				printf "triggering jump boost with jump speed AND multiplier" 
			ELSE 
				trigger_jump_boost speed = <jump_speed> 
			ENDIF 
		ELSE 
			IF GotParam jump_multi 
				trigger_jump_boost multi = <jump_multi> 
				printf "triggering jump boost with multiplier" 
			ELSE 
				printf "no jump boosts!" 
			ENDIF 
		ENDIF 
		IF GotParam set_speed 
			IF GotParam speed_multi 
				IF NOT Skater : walking 
					trigger_speed_boost speed = <set_speed> multi = <speed_multi> 
					printf "triggering speed boost with set speed AND multiplier" 
				ENDIF 
			ELSE 
				IF NOT Skater : walking 
					trigger_speed_boost speed = <set_speed> 
				ENDIF 
			ENDIF 
		ELSE 
			IF GotParam speed_multi 
				IF NOT Skater : walking 
					trigger_speed_boost multi = <speed_multi> 
					printf "triggering speed boost with multiplier" 
				ENDIF 
			ELSE 
				printf "no speed boosts!" 
			ENDIF 
		ENDIF 
	ENDIF 
ENDSCRIPT

_randLastStream = none 
SCRIPT Obj_PlayRandomStream 
	IF GotParam streams 
		IF IsArray <streams> 
			GetRandomArrayElement <streams> 
			Obj_PlayStream ( <element> ) <...> 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT PlayRandomStream 
	IF GotParam streams 
		IF IsArray <streams> 
			GetRandomArrayElement <streams> 
			PlayStream ( <element> ) <...> 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT Obj_PlayRandomSound 
	IF GotParam sounds 
		IF IsArray <sounds> 
			GetRandomArrayElement <sounds> 
			Obj_PlaySound ( <element> ) <...> 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT Obj_PlayRandomAnim 
	IF GotParam anims 
		IF IsArray <anims> 
			GetRandomArrayElement <anims> 
			Obj_PlayAnim anim = ( <element> ) <...> 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT Obj_CycleRandomAnim 
	IF GotParam anims 
		IF IsArray <anims> 
			GetRandomArrayElement <anims> 
			Obj_CycleAnim anim = ( <element> ) <...> 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT WaitRandom 
	IF GotParam a 
		IF GotParam b 
			GetRandomValue name = rand a = <a> b = <b> 
			wait <rand> <...> 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT Bird_Generic 
	Obj_GetId 
	IF GotParam randomize_orient 
		Obj_SetOrientation y = RANDOM_RANGE PAIR(-15.00000000000, 15.00000000000) 
		RemoveParameter randomize_orient 
	ENDIF 
	IF GotParam bird_type 
		SWITCH <bird_type> 
			CASE nosound 
				<ObjId> : SetTags _bird_type = nosound 
				<ObjId> : SetTags _nosound 
			CASE seagull 
				<ObjId> : SetTags _bird_type = seagull 
			CASE pigeon 
				<ObjId> : SetTags _bird_type = pigeon 
			CASE can_bird 
				<ObjId> : SetTags _bird_type = can_bird 
			DEFAULT 
				<ObjId> : SetTags _bird_type = nosound 
				<ObjId> : SetTags _nosound 
		ENDSWITCH 
		RemoveParameter bird_type 
	ENDIF 
	Obj_ShadowOff 
	Obj_ClearExceptions 
	Obj_SetException Ex = ObjectInRadius Scr = Bird_Generic_Fly params = <...> 
	Obj_SetInnerRadius 15 
	BEGIN 
		Obj_CycleAnim anim = Peck NumCycles = RANDOM(1, 1, 1, 1, 1, 1, 1, 1) RANDOMCASE 3 RANDOMCASE 4 RANDOMCASE 5 RANDOMCASE 6 RANDOMCASE 7 RANDOMCASE 8 RANDOMCASE 9 RANDOMCASE 10 RANDOMEND 
		Obj_CycleAnim anim = FlyHop NumCycles = RANDOM(1, 1, 1) RANDOMCASE 1 RANDOMCASE 2 RANDOMCASE 3 RANDOMEND 
	REPEAT 
ENDSCRIPT

SCRIPT Bird_Generic_Fly 
	Obj_GetId 
	Obj_ClearExceptions 
	<ObjId> : GetSingleTag _nosound 
	IF NOT GotParam _nosound 
		<ObjId> : GetSingleTag _bird_type 
		SWITCH <_bird_type> 
			CASE nosound 
			CASE seagull 
				StopStream SeagullFlyUpStream 
				wait 1 gameframe 
				IF NOT IsStreamPlaying SeagullFlyUpStream 
					Obj_PlayRandomStream streams = [ AU_Seagull_Fly_Up_01 AU_Seagull_Fly_Up_02 ] vol = 150 id = SeagullFlyUpStream 
				ENDIF 
			CASE pigeon 
				IF NOT IsStreamPlaying PigeonFlyUpSound 
					Obj_PlayStream NY_PigeonFly id = PigeonFlyUpSound vol = 150 dropoff = 200 
				ENDIF 
			CASE can_bird 
				IF NOT IsStreamPlaying BirdFlyUpSound 
					Obj_PlayRandomStream streams = [ Can_Bird1 Can_Bird2 ] vol = 150 pitch = 70 id = BirdFlyUpSound 
				ENDIF 
			DEFAULT 
		ENDSWITCH 
	ENDIF 
	Obj_PlayAnim anim = Fly Cycle 
	Obj_MoveToRelPos VECTOR(0.00000000000, 250.00000000000, 0.00000000000) speed = 12 Acceleration = 2 
	Obj_WaitMove 
	Obj_SetOuterRadius 50 
	Obj_SetException Ex = ObjectOutOfRadius Scr = Bird_Generic_Return params = <...> 
ENDSCRIPT

SCRIPT Bird_Generic_Return 
	Obj_ClearExceptions 
	Obj_PlayAnim anim = Fly Cycle 
	Obj_MoveToRelPos VECTOR(0.00000000000, -250.00000000000, 0.00000000000) speed = 8 Acceleration = 2 
	Obj_WaitMove 
	RemoveParameter randomize_orientation 
	GoToPreserveParams Bird_Generic 
ENDSCRIPT

SCRIPT SHARED_CPF_LA_BlownLeaf 
	Obj_RotX speed = RANDOM(1, 1, 1, 1, 1) RANDOMCASE -240 RANDOMCASE -140 RANDOMCASE 0 RANDOMCASE 140 RANDOMCASE 240 RANDOMEND 
	Obj_RotY speed = RANDOM(1, 1, 1, 1, 1) RANDOMCASE -240 RANDOMCASE -140 RANDOMCASE 0 RANDOMCASE 140 RANDOMCASE 240 RANDOMEND 
	Obj_RotZ speed = RANDOM(1, 1, 1, 1, 1) RANDOMCASE -240 RANDOMCASE -140 RANDOMCASE 0 RANDOMCASE 140 RANDOMCASE 240 RANDOMEND 
	RANDOM(1, 1, 1, 1) RANDOMCASE 
		Obj_MoveToRelPos VECTOR(0.00000000000, 20.00000000000, 0.00000000000) time = 0.10000000149 
		wait 0.10000000149 seconds 
		Obj_MoveToRelPos VECTOR(0.00000000000, 16.00000000000, 0.00000000000) time = 0.10000000149 
		wait 0.10000000149 seconds 
		Obj_MoveToRelPos VECTOR(0.00000000000, 12.00000000000, 0.00000000000) time = 0.10000000149 
		wait 0.10000000149 seconds 
		Obj_MoveToRelPos VECTOR(0.00000000000, 8.00000000000, 0.00000000000) time = 0.10000000149 
		wait 0.10000000149 seconds 
		Obj_MoveToRelPos VECTOR(0.00000000000, 4.00000000000, 0.00000000000) time = 0.10000000149 
		wait 0.10000000149 seconds 
		Obj_MoveToRelPos VECTOR(0.00000000000, -4.00000000000, 0.00000000000) time = 0.10000000149 
		wait 0.10000000149 seconds 
		Obj_MoveToRelPos VECTOR(0.00000000000, -8.00000000000, 0.00000000000) time = 0.10000000149 
		wait 0.10000000149 seconds 
		Obj_MoveToRelPos VECTOR(0.00000000000, -12.00000000000, 0.00000000000) time = 0.10000000149 
		wait 0.10000000149 seconds 
		Obj_MoveToRelPos VECTOR(0.00000000000, -16.00000000000, 0.00000000000) time = 0.10000000149 
		wait 0.10000000149 seconds 
		Obj_MoveToRelPos VECTOR(0.00000000000, -20.00000000000, 0.00000000000) time = 0.10000000149 
		wait 0.10000000149 seconds RANDOMCASE 
		Obj_MoveToRelPos VECTOR(0.00000000000, 30.00000000000, 0.00000000000) time = 0.11999999732 
		wait 0.11999999732 seconds 
		Obj_MoveToRelPos VECTOR(0.00000000000, 20.00000000000, 0.00000000000) time = 0.11999999732 
		wait 0.11999999732 seconds 
		Obj_MoveToRelPos VECTOR(0.00000000000, 12.00000000000, 0.00000000000) time = 0.11999999732 
		wait 0.11999999732 seconds 
		Obj_MoveToRelPos VECTOR(0.00000000000, 5.00000000000, 0.00000000000) time = 0.11999999732 
		wait 0.11999999732 seconds 
		Obj_MoveToRelPos VECTOR(0.00000000000, 2.00000000000, 0.00000000000) time = 0.11999999732 
		wait 0.11999999732 seconds 
		Obj_MoveToRelPos VECTOR(0.00000000000, -2.00000000000, 0.00000000000) time = 0.11999999732 
		wait 0.11999999732 seconds 
		Obj_MoveToRelPos VECTOR(0.00000000000, -5.00000000000, 0.00000000000) time = 0.11999999732 
		wait 0.11999999732 seconds 
		Obj_MoveToRelPos VECTOR(0.00000000000, -12.00000000000, 0.00000000000) time = 0.11999999732 
		wait 0.11999999732 seconds 
		Obj_MoveToRelPos VECTOR(0.00000000000, -20.00000000000, 0.00000000000) time = 0.11999999732 
		wait 0.11999999732 seconds 
		Obj_MoveToRelPos VECTOR(0.00000000000, -30.00000000000, 0.00000000000) time = 0.11999999732 
		wait 0.11999999732 seconds RANDOMCASE 
		Obj_MoveToRelPos VECTOR(0.00000000000, 15.00000000000, 0.00000000000) time = 0.05000000075 
		wait 0.05000000075 seconds 
		Obj_MoveToRelPos VECTOR(0.00000000000, 12.00000000000, 0.00000000000) time = 0.05000000075 
		wait 0.05000000075 seconds 
		Obj_MoveToRelPos VECTOR(0.00000000000, 8.00000000000, 0.00000000000) time = 0.05000000075 
		wait 0.05000000075 seconds 
		Obj_MoveToRelPos VECTOR(0.00000000000, 4.00000000000, 0.00000000000) time = 0.05000000075 
		wait 0.05000000075 seconds 
		Obj_MoveToRelPos VECTOR(0.00000000000, 2.00000000000, 0.00000000000) time = 0.05000000075 
		wait 0.05000000075 seconds 
		Obj_MoveToRelPos VECTOR(0.00000000000, -2.00000000000, 0.00000000000) time = 0.05000000075 
		wait 0.05000000075 seconds 
		Obj_MoveToRelPos VECTOR(0.00000000000, -4.00000000000, 0.00000000000) time = 0.05000000075 
		wait 0.05000000075 seconds 
		Obj_MoveToRelPos VECTOR(0.00000000000, -8.00000000000, 0.00000000000) time = 0.05000000075 
		wait 0.05000000075 seconds 
		Obj_MoveToRelPos VECTOR(0.00000000000, -12.00000000000, 0.00000000000) time = 0.05000000075 
		wait 0.05000000075 seconds 
		Obj_MoveToRelPos VECTOR(0.00000000000, -15.00000000000, 0.00000000000) time = 0.05000000075 
		wait 0.05000000075 seconds RANDOMCASE 
		Obj_MoveToRelPos VECTOR(0.00000000000, 19.00000000000, 0.00000000000) time = 0.07999999821 
		wait 0.07999999821 seconds 
		Obj_MoveToRelPos VECTOR(0.00000000000, 13.00000000000, 0.00000000000) time = 0.07999999821 
		wait 0.07999999821 seconds 
		Obj_MoveToRelPos VECTOR(0.00000000000, 7.00000000000, 0.00000000000) time = 0.07999999821 
		wait 0.07999999821 seconds 
		Obj_MoveToRelPos VECTOR(0.00000000000, 4.00000000000, 0.00000000000) time = 0.07999999821 
		wait 0.07999999821 seconds 
		Obj_MoveToRelPos VECTOR(0.00000000000, 2.00000000000, 0.00000000000) time = 0.07999999821 
		wait 0.07999999821 seconds 
		Obj_MoveToRelPos VECTOR(0.00000000000, -2.00000000000, 0.00000000000) time = 0.07999999821 
		wait 0.07999999821 seconds 
		Obj_MoveToRelPos VECTOR(0.00000000000, -4.00000000000, 0.00000000000) time = 0.07999999821 
		wait 0.07999999821 seconds 
		Obj_MoveToRelPos VECTOR(0.00000000000, -7.00000000000, 0.00000000000) time = 0.07999999821 
		wait 0.07999999821 seconds 
		Obj_MoveToRelPos VECTOR(0.00000000000, -13.00000000000, 0.00000000000) time = 0.07999999821 
		wait 0.07999999821 seconds 
		Obj_MoveToRelPos VECTOR(0.00000000000, -19.00000000000, 0.00000000000) time = 0.07999999821 
	wait 0.07999999821 seconds RANDOMEND 
	Die 
ENDSCRIPT

SCRIPT TP_Ped_Sit_Idle 
	BEGIN 
		BEGIN 
			GetRandomValue name = RepeatCount a = 5 b = 15 Resolution = 10 Integer 
			RANDOM(1, 1, 1, 1, 1) RANDOMCASE GetRandomValue name = RepeatIdle a = 5 b = 50 Resolution = 45 Integer 
				Obj_CycleAnim anim = Ped_SIT_Idle NumCycles = <RepeatIdle> RANDOMCASE PlayAnimWithPartialAnimIfExists anim = PED_SIT_Tap RANDOMCASE PlayAnimWithPartialAnimIfExists anim = PED_SIT_LookR RANDOMCASE PlayAnimWithPartialAnimIfExists anim = PED_SIT_LookL RANDOMCASE PlayAnimWithPartialAnimIfExists anim = Ped_SIt2SITB 
				Obj_WaitAnimFinished 
				BEGIN 
					RANDOM(1, 1, 1) RANDOMCASE GetRandomValue name = RepeatIdleB a = 2 b = 10 Resolution = 8 Integer 
					Obj_CycleAnim anim = Ped_sitB_idle NumCycles = <RepeatIdleB> RANDOMCASE PlayAnimWithPartialAnimIfExists anim = Ped_sitB_lookL RANDOMCASE PlayAnimWithPartialAnimIfExists anim = Ped_sitB_LookR RANDOMEND 
					Obj_WaitAnimFinished 
				REPEAT 5 
				PlayAnimWithPartialAnimIfExists anim = Ped_SIt2SITB From = end To = Start 
			Obj_WaitAnimFinished RANDOMEND 
		REPEAT <RepeatCount> 
	REPEAT 
ENDSCRIPT

SCRIPT TP_DoFlash 
	SpawnScript Real_TP_DoFlash params = { <...> } 
ENDSCRIPT

SCRIPT Real_TP_DoFlash On time = 0.50000000000 alpha = 1.00000000000 texture = white rgba = [ 128 128 128 64 ] FadeOffTime = 0.50000000000 
	IF GotParam duration 
		time = <duration> 
	ENDIF 
	IF GotParam type 
		SWITCH <type> 
			CASE red 
				rgba = [ 128 0 0 64 ] 
			CASE blue 
				rgba = [ 0 0 128 64 ] 
			CASE black 
				rgba = [ 0 0 0 128 ] 
		ENDSWITCH 
	ELSE 
		<tmp_start_rgba> = [ 128 128 128 128 ] 
		IF GotParam start_r 
			SetArrayElement arrayname = tmp_start_rgba index = 0 newvalue = <start_r> 
		ENDIF 
		IF GotParam start_g 
			SetArrayElement arrayname = tmp_start_rgba index = 1 newvalue = <start_g> 
		ENDIF 
		IF GotParam start_b 
			SetArrayElement arrayname = tmp_start_rgba index = 2 newvalue = <start_b> 
		ENDIF 
		IF GotParam start_a 
			SetArrayElement arrayname = tmp_start_rgba index = 3 newvalue = <start_a> 
		ENDIF 
		<tmp_end_rgba> = [ 0 0 0 0 ] 
		IF GotParam end_r 
			SetArrayElement arrayname = tmp_end_rgba index = 0 newvalue = <end_r> 
		ENDIF 
		IF GotParam end_g 
			SetArrayElement arrayname = tmp_end_rgba index = 1 newvalue = <end_g> 
		ENDIF 
		IF GotParam end_b 
			SetArrayElement arrayname = tmp_end_rgba index = 2 newvalue = <end_b> 
		ENDIF 
		IF GotParam end_a 
			SetArrayElement arrayname = tmp_end_rgba index = 3 newvalue = <end_a> 
		ENDIF 
	ENDIF 
	IF GotParam tmp_start_rgba 
		rgba = <tmp_start_rgba> 
	ENDIF 
	IF GotParam tmp_end_rgba 
		end_rgba = <tmp_end_rgba> 
	ELSE 
		end_rgba = <rgba> 
	ENDIF 
	fadetoblack On time = <time> alpha = <alpha> rgba = <rgba> end_rgba = <end_rgba> texture = <texture> z_priority = 0 id = screenflash 
	wait <time> second 
	fadetoblack Off time = <FadeOffTime> id = screenflash 
ENDSCRIPT

CARPLANT_ENABLED = 1 
SCRIPT THUGPRO_TriggerCarPlant 
	IF IsTrue CARPLANT_ENABLED 
		Obj_GetId 
		LaunchEvent type = Carplant target = <ObjId> 
	ENDIF 
ENDSCRIPT

SCRIPT THUGPRO_LaunchPanelMessage 
	IF GetScriptString 
		FormatText TextName = text <...> 
		create_panel_message id = sk3_panel_message_text text = <text> style = panel_message_generic2 
	ENDIF 
ENDSCRIPT

SCRIPT sk3_panel_message_style 
	DoMorph time = 0.00000000000 pos = PAIR(320.00000000000, 240.00000000000) 
	wait 1.50000000000 seconds 
	DoMorph time = 0.50000000000 scale = 0.00000000000 
	wait 0.60000002384 seconds 
	Die 
ENDSCRIPT

G_THAW_GRIND_COUNT_LOCAL = 0 
G_THAW_GRIND_COUNT = [ 
	0 
	0 
	0 
	0 
	0 
	0 
	0 
] 
SCRIPT grind_count_text 
	goal_collect_text <...> 
ENDSCRIPT

SCRIPT THAW_Grind_Counter 
	IF IsLocalSkater 
		IF OnRail 
			Change G_THAW_GRIND_COUNT_LOCAL = ( ( G_THAW_GRIND_COUNT_LOCAL ) + 1 ) 
			IF NOT ( ( G_THAW_GRIND_COUNT_LOCAL ) = 1 ) 
				IF ( ( G_THAW_GRIND_COUNT_LOCAL ) = 2 ) 
					FormatText TextName = THAW_Grind_Counter_Text "%a time around" a = ( ( G_THAW_GRIND_COUNT_LOCAL ) -1 ) 
				ELSE 
					FormatText TextName = THAW_Grind_Counter_Text "%a times around" a = ( ( G_THAW_GRIND_COUNT_LOCAL ) -1 ) 
				ENDIF 
				pos = PAIR(320.00000000000, 100.00000000000) 
				create_panel_message id = message_THAW_Grind_Count text = <THAW_Grind_Counter_Text> style = goal_collect_text pos = <pos> 
			ENDIF 
			KillSpawnedScript id = THAW_Grind_Counter 
			SpawnScript THAW_Grind_Counter_End_Checker id = THAW_Grind_Counter 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT THAW_Grind_Counter_End_Checker 
	ClearExceptionGroup { 
		THAW_Grind_Counter 
	} 
	SetException { 
		Ex = SkaterEnterAir 
		Scr = THUG3_Grind_Counter_Reset 
		Group = THAW_Grind_Counter 
	} 
	SetException { 
		Ex = SkaterEnterBail 
		Scr = THUG3_Grind_Counter_Reset 
		Group = THAW_Grind_Counter 
	} 
	block 
ENDSCRIPT

SCRIPT THUG3_Grind_Counter_Reset 
	Change G_THAW_GRIND_COUNT_LOCAL = 0 
ENDSCRIPT

SCRIPT RailAccelerate 
	KillSpawnedScript name = RailAccelerate2 
	Obj_GetId 
	<ObjId> : Obj_SpawnScript RailAccelerate2 params = <...> 
ENDSCRIPT

SCRIPT RailAccelerate2 rate = 0.05000000075 
	<OldPos> = 0 
	BEGIN 
		IF OnRail 
			Obj_GetPosition 
			<newpos> = ( <pos> . VECTOR(0.00000000000, 1.00000000000, 0.00000000000) ) 
			IF ( <newpos> > <OldPos> ) 
				GetSpeed 
				SetSpeed ( <speed> * ( 1.00000000000 + <rate> ) ) 
			ENDIF 
			<OldPos> = <newpos> 
			wait 1 frames 
		ELSE 
			BREAK 
		ENDIF 
	REPEAT 
ENDSCRIPT

SCRIPT THUG3_RailBoost Boost = 1.10000002384 MaxSpeed = 1200 
	GetTriggerArray array = [ land onto ] 
	IF Triggertype <trigger_array> 
		KillSpawnedScript name = THUG3_RailBoost_Spawn 
		Obj_GetId 
		<ObjId> : Obj_SpawnScript THUG3_RailBoost_Spawn params = { Boost = <Boost> MaxSpeed = <MaxSpeed> } 
	ENDIF 
ENDSCRIPT

SCRIPT THUG3_RailBoost_Spawn 
	BEGIN 
		IF OnRail 
			GetSpeed 
			speed = ( <speed> * <Boost> ) 
			IF ( <speed> < <MaxSpeed> ) 
				SetSpeed <speed> 
			ELSE 
				SetSpeed <MaxSpeed> 
			ENDIF 
		ELSE 
			BREAK 
		ENDIF 
		wait 2 frames 
	REPEAT 
ENDSCRIPT

SCRIPT Ped_Stand_Script 
	Ped_InitAI Stand avoid 
ENDSCRIPT

SCRIPT Ped_TP_SkaterFlatland 
	BEGIN 
		RANDOM(1, 1, 1, 1, 1, 1) 
			RANDOMCASE printf "#### casper ####" 
			Obj_CycleAnim anim = Casper_Init 
			Obj_CycleAnim anim = Casper_Range 
			Obj_CycleAnim anim = Casper_Range 
			Obj_CycleAnim anim = Casper_Range 
			Obj_CycleAnim anim = CasperFlip 
			Obj_CycleAnim anim = Casper_Out 
			RANDOMCASE printf "#### anti casper ####" 
			Obj_CycleAnim anim = AntiCasper_Init 
			Obj_CycleAnim anim = AntiCasper_Range 
			Obj_CycleAnim anim = AntiCasper_Range 
			Obj_CycleAnim anim = AntiCasper_Range 
			Obj_CycleAnim anim = AntiCasperFlip 
			Obj_CycleAnim anim = AntiCasper_Out 
			RANDOMCASE printf "#### one foot ####" 
			Obj_CycleAnim anim = OneFootManual_Init 
			Obj_CycleAnim anim = OneFootManual_Range 
			Obj_CycleAnim anim = OneFootManual_Range 
			Obj_CycleAnim anim = PutDownManual 
			RANDOMCASE printf "#### one foot nose ####" 
			Obj_CycleAnim anim = OneFootNoseManual_Init 
			Obj_CycleAnim anim = OneFootNoseManual_Range 
			Obj_CycleAnim anim = OneFootNoseManual_Range 
			Obj_CycleAnim anim = PutDownNosemanual 
			RANDOMCASE printf "#### truckstand ####" 
			Obj_CycleAnim anim = Truckstand_Init 
			Obj_CycleAnim anim = Truckstand_Range 
			Obj_CycleAnim anim = Truckstand_Range 
			Obj_CycleAnim anim = Truckstand_Out 
			RANDOMCASE printf "#### mullen ####" 
			Obj_CycleAnim anim = MullenStart 
		RANDOMEND 
		BEGIN 
			Obj_CycleAnim anim = idle 
		REPEAT RANDOM_RANGE PAIR(1.00000000000, 3.00000000000) 
	REPEAT 
ENDSCRIPT

SCRIPT THUGPRO_Skater_BoardOnFire 
	IF <colObjId> : Obj_FlagNotSet FLAG_SKATER_IS_ON_FIRE 
		<colObjId> : Obj_SetFlag FLAG_SKATER_IS_ON_FIRE 
		<colObjId> : Obj_SpawnScript TP_FireParticlesOff 
		<colObjId> : Obj_SpawnScript TP_SmokeParticlesOff 
		wait 1 frame 
		<colObjId> : Obj_SpawnScript TP_FireParticlesOn 
		<colObjId> : Obj_SpawnScript TP_SmokeParticlesOn 
		wait 20 seconds 
		<colObjId> : Obj_SpawnScript TP_FireParticlesOff 
		wait 3 seconds 
		<colObjId> : Obj_ClearFlag FLAG_SKATER_IS_ON_FIRE 
		<colObjId> : Obj_SpawnScript TP_SmokeParticlesOff 
	ENDIF 
ENDSCRIPT

SCRIPT TP_FireParticlesOn 
	printf "Fire" 
	SpawnSound TP_SFX_Skater_Ignite 
	CreateFlexibleParticleSystem name = BurnMoFo params_script = APM_flamingBOARD_particle_params 
ENDSCRIPT

SCRIPT TP_FireParticlesOff 
	SpawnSound TP_SFX_Skater_Put_Out_Fire 
	DestroyFlexibleParticleSystem name = BurnMoFo 
ENDSCRIPT

SCRIPT TP_SmokeParticlesOn 
	printf "Fire" 
	CreateFlexibleParticleSystem name = SmokeyMoFo params_script = apm_OILYsmoke_particle_params 
ENDSCRIPT

SCRIPT TP_SmokeParticlesOff 
	DestroyFlexibleParticleSystem name = SmokeyMoFo 
ENDSCRIPT

SCRIPT TP_AllFireParticlesOff 
	<colObjId> : Obj_ClearFlag FLAG_SKATER_IS_ON_FIRE 
	SpawnSound BO_SFX_Skater_Put_Out_Fire 
	<colObjId> : Obj_SpawnScript TP_FireParticlesOff 
	<colObjId> : Obj_SpawnScript TP_SmokeParticlesOff 
ENDSCRIPT

SCRIPT TP_SFX_Skater_Ignite 
	<colObjId> : Obj_PlayStream SK6_BO_SkaterIgnite vol = 300 
	<colObjId> : Obj_PlaySound SK6_BO_FireLoop vol = 110 pitch = 120 
ENDSCRIPT

SCRIPT TP_SFX_Skater_Put_Out_Fire 
	<colObjId> : Obj_StopSound SK6_BO_FireLoop 
ENDSCRIPT

SCRIPT UTILS_CREATE_BASIC_MENU base_name = "test" menu_title = "test" menu_pos = PAIR(353.79998779297, 143.50000000000) menu_dims = PAIR(640.00000000000, 180.00000000000) 
	IF ObjectExists id = current_menu_anchor 
		DestroyScreenElement id = current_menu_anchor 
	ENDIF 
	IF ObjectExists id = current_menu 
		DestroyScreenElement id = current_menu 
	ENDIF 
	destroy_menu_background_title 
	FormatText ChecksumName = menu_id "%a_menu" a = <base_name> 
	FormatText ChecksumName = vmenu_id "%a_vmenu" a = <base_name> 
	FormatText ChecksumName = scrolling_menu_id "%a_scrollingmenu" a = <base_name> 
	make_new_menu { 
		pos = <menu_pos> 
		internal_just = [ left top ] 
		dims = <menu_dims> 
		menu_id = <menu_id> 
		vmenu_id = <vmenu_id> 
		scrolling_menu_id = <scrolling_menu_id> 
		type = VScrollingMenu 
		<menu_params> 
	} 
	DoScreenElementMorph id = <vmenu_id> alpha = 0 
	create_helper_text generic_helper_text 
	IF NOT GotParam NO_BACKGROUND 
		create_menu_background_title title = <menu_title> bg_just = right_scroll no_grain scrolling_arrows 
	ENDIF 
	SetScreenElementProps { 
		id = <vmenu_id> 
		event_handlers = [ 
			{ pad_back generic_menu_pad_back params = { callback = <callback_script> } } 
		] 
	} 
ENDSCRIPT

SCRIPT UTILS_FOCUS_MENU_ITEM_BY_ID 
	IF GotParam id 
		IF ObjectExists id = <id> 
			FireEvent type = focus target = current_menu data = { child_id = <id> } 
			wait 1 gameframes 
			FireEvent type = pad_up target = current_menu 
			wait 1 gameframes 
			FireEvent type = pad_down target = current_menu 
		ELSE 
			FireEvent type = focus target = current_menu 
		ENDIF 
	ELSE 
		FireEvent type = focus target = current_menu 
	ENDIF 
ENDSCRIPT

SCRIPT UTILS_FINALIZE_BASIC_MENU base_name = "test" 
	FormatText ChecksumName = menu_id "%a_menu" a = <base_name> 
	FormatText ChecksumName = vmenu_id "%a_vmenu" a = <base_name> 
	AssignAlias id = <vmenu_id> alias = current_menu 
	IF GotParam last_selected_item 
		IF ObjectExists id = <last_selected_item> 
			FireEvent type = focus target = current_menu data = { child_id = <last_selected_item> } 
			wait 1 gameframes 
			FireEvent type = pad_up target = current_menu 
			wait 1 gameframes 
			FireEvent type = pad_down target = current_menu 
		ELSE 
			FireEvent type = focus target = current_menu 
		ENDIF 
	ELSE 
		FireEvent type = focus target = current_menu 
	ENDIF 
	wait 2 gameframes 
	DoScreenElementMorph id = <vmenu_id> alpha = 1 
ENDSCRIPT

SCRIPT get_sick_score_text 
	RETURN sick_score_text = "\\c2MISSING TEXT (sick_score_text)" 
ENDSCRIPT

SCRIPT get_sick_score_easy_text 
	RETURN sick_score_easy_text = "\\c2MISSING TEXT (sick_score_easy_text)" 
ENDSCRIPT

SCRIPT get_pro_score_text 
	RETURN pro_score_text = "\\c2MISSING TEXT (pro_score_text)" 
ENDSCRIPT

SCRIPT get_pro_score_easy_text 
	RETURN pro_score_easy_text = "\\c2MISSING TEXT (pro_score_easy_text)" 
ENDSCRIPT

SCRIPT get_high_score_text 
	RETURN high_score_text = "\\c2MISSING TEXT (high_score_text)" 
ENDSCRIPT

SCRIPT get_high_score_easy_text 
	RETURN high_score_easy_text = "\\c2MISSING TEXT (high_score_easy_text)" 
ENDSCRIPT

SCRIPT get_high_combo_text 
	RETURN high_combo_text = "\\c2MISSING TEXT (high_combo_text)" 
ENDSCRIPT

SCRIPT get_high_combo_easy_text 
	RETURN high_combo_easy_text = "\\c2MISSING TEXT (high_combo_easy_text)" 
ENDSCRIPT



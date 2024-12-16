
SCRIPT cas_handle_disqualifications 
	cas_disq_remove_logo part = <part> desc_id = <desc_id> 
	cas_disq_resolve_bare_torso part = <part> desc_id = <desc_id> 
	cas_disq_add_sleeves part = <part> desc_id = <desc_id> 
	cas_disq_set_eye_color part = <part> desc_id = <desc_id> 
	cas_disq_handle_remaining_problems part = <part> desc_id = <desc_id> 
ENDSCRIPT

SCRIPT cas_disq_add_sleeves 
	<just_changed_torso> = 0 
	IF ( ChecksumEquals a = <part> b = skater_m_torso ) 
		<just_changed_torso> = 1 
	ENDIF 
	IF ( ChecksumEquals a = <part> b = skater_f_torso ) 
		<just_changed_torso> = 1 
	ENDIF 
	IF ( <just_changed_torso> = 1 ) 
		GetActualCASOptionStruct part = <part> desc_id = <desc_id> 
		EditPlayerAppearance { 
			profile = <currentSkaterProfileIndex> 
			target = SetPart 
			targetParams = { part = sleeves desc_id = None } 
		} 
	ENDIF 
ENDSCRIPT

SCRIPT cas_disq_resolve_bare_torso 
	IF ChecksumEquals a = <part> b = skater_m_torso 
		GetCurrentSkaterProfileIndex 
		GetActualCASOptionStruct part = <part> desc_id = <desc_id> 
		IF GotParam force_bare_torso 
			EditPlayerAppearance { 
				profile = <currentSkaterProfileIndex> 
				target = SetPart 
				targetParams = { part = bare_torso desc_id = %"bare torso" } 
			} 
		ELSE 
			EditPlayerAppearance { 
				profile = <currentSkaterProfileIndex> 
				target = SetPart 
				targetParams = { part = bare_torso desc_id = None } 
			} 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT cas_disq_set_eye_color 
	IF ( ( ChecksumEquals a = <part> b = skater_m_head ) | ( ChecksumEquals a = <part> b = skater_f_head ) ) 
		GetActualCASOptionStruct part = <part> desc_id = <desc_id> 
		IF GotParam eyecolor 
			GetCurrentSkaterProfileIndex 
			EditPlayerAppearance { 
				profile = <currentSkaterProfileIndex> 
				target = SetPart 
				targetParams = { part = eyes desc_id = ( ( eyes [ <eyecolor> ] ) . desc_id ) } 
			} 
		ENDIF 
	ENDIF 
ENDSCRIPT

incompatible_female_pants = [ Leather Jogger ] 
incompatible_male_pants = [ denim %"Denim Dirty" Khaki %"Baggy Cargo" %"Baggy CargoCamo" %"Baggy Cargo 2" %"Hawk Joe Cargo" ] 
SCRIPT cas_disq_handle_remaining_problems 
	IF ( ( ChecksumEquals a = <part> b = skater_m_torso ) | ( ChecksumEquals a = <part> b = skater_f_torso ) ) 
		GetActualCASOptionStruct part = <part> desc_id = <desc_id> 
		IF GotParam not_with_skeleton_arms 
			GetCurrentSkaterProfileIndex 
			IF GetPlayerAppearancePart player = <currentSkaterProfileIndex> part = accessory3 
				IF ChecksumEquals a = <desc_id> b = Skeletonarms 
					EditPlayerAppearance { 
						profile = <currentSkaterProfileIndex> 
						target = SetPart 
						targetParams = { part = accessory3 desc_id = None } 
					} 
				ENDIF 
			ENDIF 
		ENDIF 
	ELSE 
		IF ( ( ChecksumEquals a = <part> b = skater_m_legs ) | ( ChecksumEquals a = <part> b = skater_f_legs ) ) 
			IF ChecksumEquals a = <part> b = skater_m_legs 
				<incompatible_array> = incompatible_male_pants 
				<not_with_flag> = not_with_certain_male_pants 
			ELSE 
				<incompatible_array> = incompatible_female_pants 
				<not_with_flag> = not_with_certain_female_pants 
			ENDIF 
			<wearing_incompatible_pants> = 0 
			<index> = 0 
			GetArraySize <incompatible_array> 
			BEGIN 
				IF ChecksumEquals a = <desc_id> b = ( <incompatible_array> [ <index> ] ) 
					<wearing_incompatible_pants> = 1 
					BREAK 
				ENDIF 
				<index> = ( <index> + 1 ) 
			REPEAT <array_size> 
			IF ( <wearing_incompatible_pants> ) 
				GetCurrentSkaterProfileIndex 
				IF GetPlayerAppearancePart player = <currentSkaterProfileIndex> part = shoes 
					GetActualCASOptionStruct part = shoes desc_id = <desc_id> 
					IF GotParam <not_with_flag> 
						EditPlayerAppearance { 
							profile = <currentSkaterProfileIndex> 
							target = SetPart 
							targetParams = { part = shoes desc_id = BareFeet } 
						} 
					ENDIF 
				ENDIF 
			ENDIF 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT cas_disq_remove_logo 
	GetActualCASOptionStruct part = <part> desc_id = <desc_id> 
	GetCurrentSkaterProfileIndex 
	IF ( ( ChecksumEquals a = <part> b = skater_m_torso ) | ( ChecksumEquals a = <part> b = skater_f_torso ) ) 
		IF NOT GotParam supports_logo 
			GetCurrentSkaterProfileIndex 
			EditPlayerAppearance { 
				profile = <currentSkaterProfileIndex> 
				target = ClearPart 
				targetParams = { part = front_logo } 
			} 
			EditPlayerAppearance { 
				profile = <currentSkaterProfileIndex> 
				target = ClearPart 
				targetParams = { part = back_logo } 
			} 
		ELSE 
			IF GotParam no_back_logo 
				EditPlayerAppearance { 
					profile = <currentSkaterProfileIndex> 
					target = ClearPart 
					targetParams = { part = back_logo } 
				} 
			ENDIF 
		ENDIF 
	ENDIF 
	IF ( ChecksumEquals a = <part> b = hat ) 
		IF NOT GotParam supports_logo 
			EditPlayerAppearance { 
				profile = <currentSkaterProfileIndex> 
				target = ClearPart 
				targetParams = { part = hat_logo } 
			} 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT cas_temp_disq_remove_longsleeve_parts 
	IF NOT GotParam open_skin 
		ClearPart part = chest_tattoo 
	ENDIF 
	ClearPart part = back_tattoo 
	ClearPart part = left_sleeve_tattoo 
	ClearPart part = left_bicep_tattoo 
	ClearPart part = left_forearm_tattoo 
	ClearPart part = right_sleeve_tattoo 
	ClearPart part = right_bicep_tattoo 
	ClearPart part = right_forearm_tattoo 
	ClearPart part = accessory1 
	ClearPart part = accessory2 
	IF GotParam hoody_up 
		ClearPart part = hat 
		ClearPart part = skater_f_hat_hair 
		ClearPart part = skater_f_hair 
		ClearPart part = skater_m_hat_hair 
		ClearPart part = skater_m_hair 
		ClearPart part = elbowpads 
	ENDIF 
	IF GotParam hoody_down 
		ClearPart part = skater_f_backpack 
		ClearPart part = skater_m_backpack 
		ClearPart part = elbowpads 
	ENDIF 
	IF GotParam all_accessories 
		ClearPart part = accessory3 
	ENDIF 
ENDSCRIPT

SCRIPT cas_temp_disq_remove_accessories 
	ClearPart part = accessory1 
	ClearPart part = accessory2 
ENDSCRIPT

SCRIPT cas_temp_disq_set_lower_legs 
	<should_force_lower_legs> = 0 
	IF GotPart part = skater_m_legs 
		<should_force_lower_legs> = 1 
		<leg_part> = skater_m_legs 
		<lower_leg_part> = skater_m_lower_legs 
	ENDIF 
	IF GotPart part = skater_f_legs 
		<should_force_lower_legs> = 1 
		<leg_part> = skater_f_legs 
		<lower_leg_part> = skater_f_lower_legs 
	ENDIF 
	IF ( <should_force_lower_legs> ) 
		IF PartGotFlag part = <leg_part> flag = force_lower_legs_none 
			<lower_leg_desc> = None 
		ELSE 
			IF PartGotFlag part = <leg_part> flag = force_lower_legs_calves 
				<lower_leg_desc> = Calves 
			ELSE 
				IF PartGotFlag part = <leg_part> flag = force_lower_legs_full 
					<lower_leg_desc> = %"Full Legs" 
				ENDIF 
			ENDIF 
		ENDIF 
		IF GotParam lower_leg_desc 
			SetPart part = <lower_leg_part> desc_id = <lower_leg_desc> 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT cas_temp_disq_force_big_kneepads 
	<should_force_big_kneepads> = 0 
	IF GotPart part = skater_m_legs 
		IF PartGotFlag part = skater_m_legs flag = force_big_kneepads 
			<should_force_big_kneepads> = 1 
		ENDIF 
	ENDIF 
	IF GotPart part = skater_f_legs 
		IF PartGotFlag part = skater_f_legs flag = force_big_kneepads 
			<should_force_big_kneepads> = 1 
		ENDIF 
	ENDIF 
	IF ( <should_force_big_kneepads> ) 
		GetPart part = kneepads 
		GetActualCASOptionStruct part = kneepads desc_id = <desc_id> 
		<use_default_hsv> = 1 
		GetPart part = kneepads 
		IF ( <use_default_hsv> = 1 ) 
			IF GotParam default_h 
				<use_default_hsv> = 0 
				<h> = <default_h> 
				<s> = <default_s> 
				<v> = <default_v> 
				IF NOT GotParam default_s 
					script_assert "missing default_s parameter" 
				ENDIF 
				IF NOT GotParam default_v 
					script_assert "missing default_v parameter" 
				ENDIF 
			ENDIF 
		ENDIF 
		SetPart part = kneepads desc_id = %"Knee Pads Big" use_default_hsv = <use_default_hsv> h = <h> s = <s> v = <v> 
	ENDIF 
ENDSCRIPT

SCRIPT cas_temp_disq_force_big_elbowpads 
	<should_replace_elbowpads> = 0 
	IF GotPart part = skater_m_torso 
		IF PartGotFlag part = skater_m_torso flag = force_big_elbowpads 
			<should_replace_elbowpads> = 1 
		ENDIF 
	ENDIF 
	IF GotPart part = skater_f_torso 
		IF PartGotFlag part = skater_f_torso flag = force_big_elbowpads 
			<should_replace_elbowpads> = 1 
		ENDIF 
	ENDIF 
	<index> = 1 
	BEGIN 
		FormatText ChecksumName = accessory "accessory%n" n = <index> 
		IF GotPart part = <accessory> 
			IF PartGotFlag part = <accessory> flag = force_big_elbowpads 
				<should_replace_elbowpads> = 1 
				BREAK 
			ENDIF 
		ENDIF 
		<index> = ( <index> + 1 ) 
	REPEAT 3 
	IF ( <should_replace_elbowpads> ) 
		GetPart part = elbowpads 
		IF NOT GotParam desc_id 
			script_assert "GetPart didn\'t return an appropriate value" 
		ENDIF 
		AppendSuffixToChecksum Base = <desc_id> SuffixString = " Big" 
		GetActualCASOptionStruct part = elbowpads desc_id = <desc_id> 
		<use_default_hsv> = 1 
		GetPart part = elbowpads 
		IF ( <use_default_hsv> = 1 ) 
			IF GotParam default_h 
				<use_default_hsv> = 0 
				<h> = <default_h> 
				<s> = <default_s> 
				<v> = <default_v> 
				IF NOT GotParam default_s 
					script_assert "missing default_s parameter" 
				ENDIF 
				IF NOT GotParam default_v 
					script_assert "missing default_v parameter" 
				ENDIF 
			ENDIF 
		ENDIF 
		SetPart part = elbowpads desc_id = <appended_id> use_default_hsv = <use_default_hsv> h = <h> s = <s> v = <v> 
	ENDIF 
ENDSCRIPT

SCRIPT check_for_non_standard_parts 
	<clear_ok> = 1 
	GetPlayerAppearancePart player = <player> part = <part> 
	IF GotParam desc_id 
		GetArraySize skater_non_standard_parts 
		<index> = 0 
		BEGIN 
			IF ChecksumEquals a = <desc_id> b = ( skater_non_standard_parts [ <index> ] . desc_id ) 
				<clear_ok> = 0 
				IF GotParam side 
					IF StructureContains structure = ( skater_non_standard_parts [ <index> ] ) side 
						IF ChecksumEquals a = <side> b = ( skater_non_standard_parts [ <index> ] . side ) 
							<clear_ok> = 0 
						ELSE 
							<clear_ok> = 1 
						ENDIF 
					ENDIF 
				ENDIF 
				IF NOT ( <clear_ok> ) 
					BREAK 
				ENDIF 
			ENDIF 
			<index> = ( <index> + 1 ) 
		REPEAT <array_size> 
	ENDIF 
	RETURN clear_ok = <clear_ok> 
ENDSCRIPT

SCRIPT currently_editing_female 
	GetCurrentSkaterProfileIndex 
	GetSkaterSex player = <currentSkaterProfileIndex> 
	RETURN is_enabled = ( <is_male> = 0 ) 
ENDSCRIPT

SCRIPT currently_editing_male 
	GetCurrentSkaterProfileIndex 
	GetSkaterSex player = <currentSkaterProfileIndex> 
	RETURN is_enabled = ( <is_male> = 1 ) 
ENDSCRIPT

SCRIPT get_lockout_parts 
	GetCurrentSkaterProfileIndex 
	GetArraySize <parts> 
	<index> = 0 
	<found_parts> = [ ] 
	<found> = 0 
	BEGIN 
		IF GetPlayerAppearancePart player = <currentSkaterProfileIndex> part = ( <parts> [ <index> ] ) 
			GetActualCASOptionStruct part = ( <parts> [ <index> ] ) desc_id = <desc_id> 
			IF GotParam lockout_parts 
				<found_parts> = ( <found_parts> + <lockout_parts> ) 
				<found> = 1 
			ENDIF 
		ENDIF 
		<index> = ( <index> + 1 ) 
	REPEAT <array_size> 
	IF ( <found> ) 
		RETURN lockout_parts = <found_parts> 
	ENDIF 
ENDSCRIPT

SCRIPT check_for_lockout_parts 
	<ret_val> = 1 
	IF ( ( GotParam parts ) & ( GotParam menu_parts ) ) 
		get_lockout_parts parts = <parts> 
		IF GotParam lockout_parts 
			GetArraySize <lockout_parts> 
			<num_lockout_parts> = <array_size> 
			GetArraySize <menu_parts> 
			<num_menu_parts> = <array_size> 
			<index> = 0 
			BEGIN 
				IF ( <ret_val> = 0 ) 
					BREAK 
				ENDIF 
				<index2> = 0 
				BEGIN 
					IF ChecksumEquals a = ( <menu_parts> [ <index2> ] ) b = ( <lockout_parts> [ <index> ] ) 
						<ret_val> = 0 
						BREAK 
					ENDIF 
					<index2> = ( <index2> + 1 ) 
				REPEAT <num_menu_parts> 
				<index> = ( <index> + 1 ) 
			REPEAT <num_lockout_parts> 
		ENDIF 
	ENDIF 
	RETURN is_enabled = <ret_val> 
ENDSCRIPT

SCRIPT check_if_group_editable 
	<retVal> = 1 
	IF GotParam not_with_scaling_cheats 
		IF GetGlobalFlag flag = CHEAT_GORILLA 
			<retVal> = 0 
		ENDIF 
		IF GetGlobalFlag flag = CHEAT_KID 
			<retVal> = 0 
		ENDIF 
		IF GetGlobalFlag flag = CHEAT_BIGHEAD 
			<retVal> = 0 
		ENDIF 
	ENDIF 
	RETURN is_enabled = <retVal> 
ENDSCRIPT

SCRIPT check_if_part_editable 
	<retVal> = 0 
	IF GotParam part 
		GetCurrentSkaterProfileIndex 
		IF GetPlayerAppearancePart player = <currentSkaterProfileIndex> part = <part> 
			IF ( <desc_id> = None ) 
				<retVal> = 0 
			ELSE 
				<retVal> = 1 
			ENDIF 
		ENDIF 
	ENDIF 
	IF ( <retVal> ) 
		IF GotParam extra_script 
			<extra_script> <extra_script_params> 
			<retVal> = <is_enabled> 
		ENDIF 
	ENDIF 
	RETURN is_enabled = <retVal> 
ENDSCRIPT

SCRIPT check_if_hands_selected parts = [ skater_m_hands skater_f_hands ] 
	<retVal> = 0 
	GetCurrentSkaterProfileIndex 
	<index> = 0 
	BEGIN 
		IF GetPlayerAppearancePart player = <currentSkaterProfileIndex> part = ( <parts> [ <index> ] ) 
			IF ( <desc_id> = Hands ) 
				<retVal> = 0 
			ELSE 
				<retVal> = 1 
			ENDIF 
		ENDIF 
		<index> = ( <index> + 1 ) 
	REPEAT 2 
	RETURN is_enabled = <retVal> 
ENDSCRIPT

SCRIPT check_if_parts_editable 
	<retVal> = 0 
	IF GotParam parts 
		GetArraySize <parts> 
		<index> = 0 
		GetCurrentSkaterProfileIndex 
		BEGIN 
			IF GetPlayerAppearancePart player = <currentSkaterProfileIndex> part = ( <parts> [ <index> ] ) 
				IF ( <desc_id> = None ) 
					<retVal> = 0 
				ELSE 
					<retVal> = 1 
					BREAK 
				ENDIF 
			ENDIF 
			<index> = ( <index> + 1 ) 
		REPEAT <array_size> 
	ENDIF 
	RETURN is_enabled = <retVal> 
ENDSCRIPT

SCRIPT check_if_part_logoable 
	<retVal> = 0 
	IF GotParam extra_script 
		<extra_script> <extra_script_params> 
		IF ( <is_enabled> = 0 ) 
			RETURN is_enabled = <is_enabled> 
		ENDIF 
	ENDIF 
	IF GotParam parts 
		GetArraySize <parts> 
		<index> = 0 
		BEGIN 
			GetCurrentSkaterProfileIndex 
			IF GetPlayerAppearancePart player = <currentSkaterProfileIndex> part = ( <parts> [ <index> ] ) 
				GetActualCASOptionStruct part = ( <parts> [ <index> ] ) desc_id = <desc_id> 
				IF GotParam supports_logo 
					<retVal> = 1 
					BREAK 
				ELSE 
					<retVal> = 0 
					BREAK 
				ENDIF 
			ENDIF 
			<index> = ( <index> + 1 ) 
		REPEAT <array_size> 
	ENDIF 
	RETURN is_enabled = <retVal> 
ENDSCRIPT

SCRIPT check_if_part_back_logoable 
	IF GotParam extra_script 
		<extra_script> <extra_script_params> 
		IF ( <is_enabled> = 0 ) 
			RETURN is_enabled = <is_enabled> 
		ENDIF 
	ENDIF 
	check_if_part_logoable <...> 
	IF ( <is_enabled> = 1 ) 
		IF GotParam parts 
			GetArraySize <parts> 
			<index> = 0 
			BEGIN 
				GetCurrentSkaterProfileIndex 
				IF GetPlayerAppearancePart player = <currentSkaterProfileIndex> part = ( <parts> [ <index> ] ) 
					GetActualCASOptionStruct part = ( <parts> [ <index> ] ) desc_id = <desc_id> 
					IF GotParam no_back_logo 
						RETURN is_enabled = 0 
					ENDIF 
				ENDIF 
				<index> = ( <index> + 1 ) 
			REPEAT <array_size> 
		ENDIF 
	ENDIF 
	RETURN is_enabled = <is_enabled> 
ENDSCRIPT

SCRIPT check_if_item_accessible 
	<retVal> = 1 
	GetCurrentSkaterProfileIndex 
	GetSkaterProfileInfo player = <currentSkaterProfileIndex> 
	GetActualCASOptionStruct part = <part> desc_id = <desc_id> 
	IF GotParam lockout_flags 
		GetArraySize <lockout_flags> 
		<index> = 0 
		BEGIN 
			IF GotParam ( <lockout_flags> [ <index> ] ) 
				<retVal> = 0 
				BREAK 
			ENDIF 
			<index> = ( <index> + 1 ) 
		REPEAT <array_size> 
	ENDIF 
	RETURN is_enabled = <retVal> 
ENDSCRIPT

SCRIPT check_if_part_colorable 
	<retVal> = 0 
	IF GotParam extra_script 
		<extra_script> <extra_script_params> 
		IF ( <is_enabled> = 0 ) 
			RETURN is_enabled = <is_enabled> 
		ENDIF 
	ENDIF 
	IF GotParam parts 
		GetArraySize <parts> 
		<index> = 0 
		BEGIN 
			GetCurrentSkaterProfileIndex 
			IF GetPlayerAppearancePart player = <currentSkaterProfileIndex> part = ( <parts> [ <index> ] ) 
				IF ( <desc_id> = None ) 
					<retVal> = 0 
					BREAK 
				ELSE 
					GetActualCASOptionStruct part = ( <parts> [ <index> ] ) desc_id = <desc_id> 
					IF GotParam no_color 
						<retVal> = 0 
						BREAK 
					ELSE 
						<retVal> = 1 
						BREAK 
					ENDIF 
				ENDIF 
			ENDIF 
			<index> = ( <index> + 1 ) 
		REPEAT <array_size> 
	ENDIF 
	RETURN is_enabled = <retVal> 
ENDSCRIPT

SCRIPT check_if_sleeve_colorable 
	check_if_part_colorable <...> 
	IF ( <is_enabled> = 0 ) 
		RETURN is_enabled = <is_enabled> 
	ENDIF 
	IF GotParam parts 
		GetArraySize <parts> 
		<index> = 0 
		BEGIN 
			GetCurrentSkaterProfileIndex 
			IF GetPlayerAppearancePart player = <currentSkaterProfileIndex> part = ( <parts> [ <index> ] ) 
				GetActualCASOptionStruct part = ( <parts> [ <index> ] ) desc_id = <desc_id> 
				IF GotParam multicolor 
					<retVal> = <multicolor> 
					BREAK 
				ELSE 
					<retVal> = 0 
					BREAK 
				ENDIF 
			ENDIF 
			<index> = ( <index> + 1 ) 
		REPEAT <array_size> 
	ENDIF 
	RETURN is_enabled = <retVal> 
ENDSCRIPT




SCRIPT cas_add_item 
	
	IF GotParam play_deck_sound 
		StopSound ThisMenuSelectSound 
		PlaySound SK6_Menu_Select vol = 100 id = ThisMenuSelectSound 
	ENDIF 
	edit_skater_update_selected_cas_item 
	cas_handle_disqualifications part = <part> desc_id = <desc_id> 
	GetCurrentSkaterProfileIndex 
	IF ( ( LevelIs load_cas ) | ( LevelIs Load_MainMenu ) ) 
		player = 0 
	ELSE 
		player = <currentSkaterProfileIndex> 
	ENDIF 
	<update_head> = 0 
	IF ChecksumEquals a = <part> b = skater_m_head 
		<update_head> = 1 
	ENDIF 
	IF ChecksumEquals a = <part> b = skater_f_head 
		<update_head> = 1 
	ENDIF 
	IF ( <update_head> ) 
		clear_face_texture_from_profile 
		EditPlayerAppearance profile = <currentSkaterProfileIndex> target = ClearPart targetParams = { part = headtop_bone_group } 
		EditPlayerAppearance profile = <currentSkaterProfileIndex> target = ClearPart targetParams = { part = head_bone_group } 
		EditPlayerAppearance profile = <currentSkaterProfileIndex> target = ClearPart targetParams = { part = nose_bone_group } 
		EditPlayerAppearance profile = <currentSkaterProfileIndex> target = ClearPart targetParams = { part = Jaw_bone_group } 
	ENDIF 
	EditPlayerAppearance profile = <currentSkaterProfileIndex> target = SetPart targetParams = { part = <part> desc_id = <desc_id> } 
	IF NOT ChecksumEquals a = <part> b = deck_graphic 
		IF NOT ChecksumEquals a = <part> b = griptape 
			no_board = no_board 
			update_options_menu 
		ENDIF 
	ENDIF 
	RefreshSkaterModel skater = <player> profile = <currentSkaterProfileIndex> no_board = <no_board> 
	IF IsTrue cas_debug 
		DumpHeaps 
	ENDIF 
ENDSCRIPT

SCRIPT cas_apply_sex apply_male = 1 
	GetCurrentSkaterProfileIndex 
	GetSkaterProfileInfo player = <currentSkaterProfileIndex> 
	IF ( <is_male> = 1 ) 
		<success> = 1 
	ELSE 
		<success> = 0 
	ENDIF 
	IF ( <success> = <apply_male> ) 
		
	ELSE 
		IF ( <apply_male> = 1 ) 
			SetPlayerAppearance player = <currentSkaterProfileIndex> appearance_structure = appearance_custom_skater_male_06 
			SetSkaterProfileProperty player = <currentSkaterProfileIndex> is_male 1 
		ELSE 
			SetPlayerAppearance player = <currentSkaterProfileIndex> appearance_structure = appearance_custom_skater_female 
			SetSkaterProfileProperty player = <currentSkaterProfileIndex> is_male 0 
		ENDIF 
		RefreshSkaterModel skater = 0 profile = <currentSkaterProfileIndex> 
	ENDIF 
ENDSCRIPT



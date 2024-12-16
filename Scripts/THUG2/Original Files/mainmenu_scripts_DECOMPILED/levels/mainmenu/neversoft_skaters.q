
master_neversoft_skater_list = [ 
	{ 
		face_texture = "textures\\skater_ns\\NS_Head_Ralph" 
		name = "NS TEST SKATER" 
		alias = "nstestskater" 
		profile = 
		{ 
			sleeves = { desc_id = None h = 0 s = 0 v = 16 use_default_hsv = 0 } 
			shoe_laces = { desc_id = None } 
			skater_m_lower_legs = { desc_id = None h = 0 s = 50 v = 50 use_default_hsv = 1 } 
			skater_f_lower_legs = { desc_id = None } 
			body = { desc_id = MaleBody } 
			skater_m_head = { desc_id = %"Light Head 1" } 
			hat = { desc_id = Trucker_Dark h = 0 s = 0 v = 60 use_default_hsv = 0 } 
			skater_m_torso = { desc_id = %"T-Shirt Layerd" h = 210 s = 29 v = 36 use_default_hsv = 0 } 
			skater_m_legs = { desc_id = %"Cargo Shorts" h = 40 s = 23 v = 42 use_default_hsv = 0 } 
			skater_m_hands = { desc_id = Hands h = 0 s = 50 v = 50 use_default_hsv = 1 } 
			board = { desc_id = default } 
			griptape = { desc_id = %"Generic 1" } 
			accessory2 = { desc_id = %"Spike 2 Band R" } 
			accessory1 = { desc_id = %"Watch L Nixon 01" } 
			shoes = { desc_id = %"Adio Anderson V4" } 
			skater_m_jaw = { desc_id = %"Sideburns 1" } 
			socks = { desc_id = Medium } 
			right_leg_tattoo = { desc_id = %"Tattoo 11" } 
			back_logo = { desc_id = CreatedGraphic uv_u = 0.00000000000 uv_v = -1.55844104290 uv_scale = 59.99999618530 uv_rot = 0.00000000000 use_default_uv = 0 } 
			skater_m_hat_hair = { desc_id = Hair_MediumHAT3 h = 40 s = 47 v = 36 use_default_hsv = 0 } 
			left_sleeve_tattoo = { desc_id = %"Sleeve 1" } 
			left_bicep_tattoo = { desc_id = None } 
			right_sleeve_tattoo = { desc_id = None } 
			right_bicep_tattoo = { desc_id = None } 
			right_forearm_tattoo = { desc_id = None } 
			left_forearm_tattoo = { desc_id = None } 
		} 
		face_points = { 
			left_eye = [ 42 , 49 ] 
			right_eye = [ 82 , 49 ] 
			nose = [ 60 , 76 ] 
			lips = [ 61 , 95 ] 
			h = 0.10899999738 
			s = 1.00000000000 
			v = 0.93000000715 
		} 
		face_overlay = "faces\\CS_NSN_Head_wht_alpha" 
		info = { 
			stance = Regular 
			pushstyle = never_mongo 
			trickstyle = vert 
			age = 34 
			hometown = "Quaglietta, IT" 
			is_male = 1 
			voice = male1 
		} 
	} 
] 
SCRIPT get_is_neversoft_skater 
	GetCurrentSkaterProfileIndex 
	GetSkaterProfileInfo player = <currentSkaterProfileIndex> 
	IF ( <name> = custom ) 
		RETURN is_neversoft_skater = <is_head_locked> 
	ELSE 
		RETURN is_neversoft_skater = 0 
	ENDIF 
ENDSCRIPT

SCRIPT check_for_neversoft_skaters 
	IF NOT IsPs2 
		RETURN 
	ENDIF 
	IF NOT ( give_neversoft_skaters = 0 ) 
		GetCurrentSkaterProfileIndex 
		SetSkaterProfileInfo player = <currentSkaterProfileIndex> params = { is_head_locked = 0 is_locked = 0 } 
		GetArraySize master_neversoft_skater_list 
		<index> = 0 
		BEGIN 
			IF StringEquals a = ( master_neversoft_skater_list [ <index> ] . alias ) b = <name> 
				GetCurrentSkaterProfileIndex 
				SetPlayerAppearance player = <currentSkaterProfileIndex> appearance_structure = ( master_neversoft_skater_list [ <index> ] . profile ) 
				clear_face_texture_from_profile 
				<face_texture_string> = ( master_neversoft_skater_list [ <index> ] . face_texture ) 
				IF GotParam face_texture_string 
					SetPlayerFaceTexture { 
						player = <currentSkaterProfileIndex> 
						texture = <face_texture_string> 
						fullPathIncluded 
					} 
				ENDIF 
				face_overlay = ( master_neversoft_skater_list [ <index> ] . face_overlay ) 
				IF GotParam face_overlay 
					GetCurrentSkaterProfileIndex 
					SetPlayerFaceOverlayTexture { 
						player = <currentSkaterProfileIndex> 
						texture = <face_overlay> 
					} 
				ENDIF 
				SetPlayerFacePoints { 
					player = <currentSkaterProfileIndex> 
					face_points = ( master_neversoft_skater_list [ <index> ] . face_points ) 
					width = 128 
					height = 128 
				} 
				SetPlayerAppearance player = <currentSkaterProfileIndex> appearance_structure = ( master_neversoft_skater_list [ <index> ] . profile ) 
				<face_texture_string> = ( master_neversoft_skater_list [ <index> ] . face_texture ) 
				IF GotParam face_texture_string 
					SetPlayerFaceTexture { 
						player = <currentSkaterProfileIndex> 
						texture = <face_texture_string> 
						fullPathIncluded 
					} 
				ENDIF 
				SetPlayerFacePoints { 
					player = <currentSkaterProfileIndex> 
					face_points = ( master_neversoft_skater_list [ <index> ] . face_points ) 
					width = 128 
					height = 128 
				} 
				RefreshSkaterModel skater = 0 profile = <currentSkaterProfileIndex> 
				SetSkaterProfileInfo player = <currentSkaterProfileIndex> params = { display_name = ( master_neversoft_skater_list [ <index> ] . name ) is_head_locked = 1 is_locked = 1 ( master_neversoft_skater_list [ <index> ] . info ) } 
				MakeSkaterGoto CasAI 
				BREAK 
			ELSE 
			ENDIF 
			<index> = ( <index> + 1 ) 
		REPEAT <array_size> 
	ENDIF 
ENDSCRIPT



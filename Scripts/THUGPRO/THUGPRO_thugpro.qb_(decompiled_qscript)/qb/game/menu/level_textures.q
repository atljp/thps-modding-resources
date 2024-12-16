SCRIPT display_current_level_texture_values 
	IF ScreenElementExists id = texture_list 
		DestroyScreenElement id = texture_list 
	ENDIF 
	initials = [ "af" "jg" "tb" "jku" "apm" "cp" "jo" "as" "hj" "jm" "tz" "tw" "cs" "tc" "cr" "cg" "jt" "jh" ] 
	IF levelIs load_BO 
		IF GotParam BO 
			level = <BO> 
		ELSE 
			RETURN 
		ENDIF 
	ENDIF 
	IF levelIs load_BE 
		IF GotParam BE 
			level = <BE> 
		ELSE 
			RETURN 
		ENDIF 
	ENDIF 
	IF levelIs load_BA 
		IF GotParam BA 
			level = <BA> 
		ELSE 
			RETURN 
		ENDIF 
	ENDIF 
	IF levelIs load_AU 
		IF GotParam AU 
			level = <AU> 
		ELSE 
			RETURN 
		ENDIF 
	ENDIF 
	IF levelIs load_NO 
		IF GotParam NO 
			level = <NO> 
		ELSE 
			RETURN 
		ENDIF 
	ENDIF 
	IF levelIs load_SE 
		IF GotParam SE 
			level = <SE> 
		ELSE 
			RETURN 
		ENDIF 
	ENDIF 
	IF levelIs load_default 
		IF GotParam Def_Lev 
			level = <Def_Lev> 
		ELSE 
			RETURN 
		ENDIF 
	ENDIF 
	IF NOT GotParam level 
		RETURN 
	ENDIF 
	SetScreenElementLock id = root_window off 
	GetArraySize <initials> 
	index = 0 
	shift = 0 
	BEGIN 
		FormatText checksumname = checksum "%i" i = ( <initials> [ <index> ] ) 
		IF ( <level> . <checksum> > 0 ) 
			FormatText textname = text "%i = %t KB" i = ( <initials> [ <index> ] ) t = ( ( <level> . <checksum> ) / 1024 ) 
			CreateScreenElement { 
				type = TextElement 
				parent = tex_count_anchor 
				pos = ( ( PAIR(0.00000000000, 15.00000000000) * <shift> ) + PAIR(0.00000000000, 30.00000000000) ) 
				text = <text> 
				font = dialog 
				rgba = [ 60 60 100 100 ] 
				just = [ left center ] 
				scale = 0.80000001192 
			} 
			shift = ( <shift> + 1 ) 
		ENDIF 
		index = ( <index> + 1 ) 
	REPEAT <array_size> 
ENDSCRIPT



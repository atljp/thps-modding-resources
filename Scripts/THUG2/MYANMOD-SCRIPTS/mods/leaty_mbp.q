
SCRIPT COMMUNITY_leaty_ManualBP 
	IF ( E9_ENABLE_BOOSTPLANTS = 1 ) 
		SpawnSkaterScript COMMUNITY_leaty_ManualBPstart 
	ENDIF 
ENDSCRIPT

SCRIPT COMMUNITY_leaty_ManualBPstart 
	ManualBPCount = 0 
	ManualBPCountUp = 0 
	ManualBPCountX = 0 
	HasPressedUp = 0 
	HasPressedX = 0 
	BEGIN 
		IF Pressed Up 
			<HasPressedUp> = 1 
		ENDIF 
		IF IsTrue <HasPressedUp> 
			IF Released Up 
				<ManualBPCountUp> = ( <ManualBPCountUp> + 1 ) 
				<HasPressedUp> = 0 
			ENDIF 
		ENDIF 
		IF Pressed X 
			<HasPressedX> = 1 
		ENDIF 
		IF IsTrue <HasPressedX> 
			IF Released X 
				<ManualBPCountX> = ( <ManualBPCountX> + 1 ) 
				<HasPressedX> = 0 
			ENDIF 
		ENDIF 
		IF Onrail 
			Goto COMMUNITY_leaty_cancelManualBP 
		ENDIF 
		IF OnWall 
			ClearEventBuffer Buttons = [ X ] OlderThan = 0 
			IF ( <ManualBPCountX> < <ManualBPCountUp> ) 
				<ManualBPCount> = <ManualBPCountX> 
			ELSE 
				<ManualBPCount> = <ManualBPCountUp> 
			ENDIF 
			IF ( <ManualBPCount> < 1 ) 
				Goto COMMUNITY_leaty_cancelManualBP 
			ENDIF 
			ClearEventHandler SkaterEnterManual 
			SetEventHandler Ex = SkaterEnterManual Scr = COMMUNITY_leaty_manualBPEnterManual params = { ManualBPCount = <ManualBPCount> } 
			SetEventHandler Ex = SkaterExitWall Scr = e9_leaty_regularBPExitWall params = { BPCount = <ManualBPCount> } 
			BEGIN 
				IF Inair 
					ClearEventHandler SkaterEnterManual 
					Goto COMMUNITY_leaty_cancelManualBP 
				ENDIF 
				IF OnGround 
					wait 15 gameframes 
					ClearEventHandler SkaterEnterManual 
					Goto COMMUNITY_leaty_cancelManualBP 
				ENDIF 
				wait 1 
			REPEAT 
		ENDIF 
		IF OnGround 
			Goto COMMUNITY_leaty_cancelManualBP 
		ENDIF 
		waitonegameframe 
	REPEAT 
ENDSCRIPT

SCRIPT e9_leaty_regularBPExitWall 
	BEGIN 
		BEGIN 
			IF IsInBail 
				Goto COMMUNITY_leaty_cancelManualBPEnterManual 
			ENDIF 
			IF OnGround 
				Goto e9_leaty_cancelregularBPExitWall 
			ENDIF 
			IF Released X 
				IF ( <BPCount> = 0 ) 
					Goto COMMUNITY_leaty_cancelManualBPEnterManual 
					ENDIF BEGIN 
					BoostPlant_Spam 
					Jump BonelessHeight 
				REPEAT <BPCount> 
				PlayAnim Anim = Boneless BlendPeriod = 0.20000000298 
				Create_Panel_Message text = "Boostplant!" id = buttslap rgba = [ 50 120 200 128 ] pos = PAIR(530.00000000000, 340.00000000000) Style = perfect_style 
				FormatText textname = counttext "x %a" a = <BPCount> 
				Create_Panel_Message text = <counttext> id = buttslap2 rgba = [ 50 120 200 128 ] pos = PAIR(512.00000000000, 360.00000000000) Style = perfect_style 
				Goto COMMUNITY_leaty_cancelManualBPEnterManual 
			ENDIF 
			IF Inair 
				IF ( <BPCount> = 0 ) 
					Goto COMMUNITY_leaty_cancelManualBPEnterManual 
					ENDIF BEGIN 
					BoostPlant_Spam 
					Jump BonelessHeight 
				REPEAT <BPCount> 
				PlayAnim Anim = Boneless BlendPeriod = 0.20000000298 
				Create_Panel_Message text = "Boostplant!" id = buttslap rgba = [ 50 120 200 128 ] pos = PAIR(530.00000000000, 340.00000000000) Style = perfect_style 
				FormatText textname = counttext "x %a" a = <BPCount> 
				Create_Panel_Message text = <counttext> id = buttslap2 rgba = [ 50 120 200 128 ] pos = PAIR(512.00000000000, 360.00000000000) Style = perfect_style 
				Goto COMMUNITY_leaty_cancelManualBPEnterManual 
			ENDIF 
			wait 1 
		REPEAT 
		wait 1 
	REPEAT 
ENDSCRIPT

SCRIPT COMMUNITY_leaty_manualBPEnterManual 
	BonelessCount = 0 
	BEGIN 
		IF NOT Inair 
			IF IsInBail 
				Goto COMMUNITY_leaty_cancelManualBPEnterManual 
			ENDIF 
			IF NOT CurrentScorePotGreaterThan 0 
				Goto COMMUNITY_leaty_cancelManualBPEnterManual 
			ENDIF 
			IF HeldLongerThan Button = X 0.20000000298 
				PlaySound PerfectLanding_11 
				IF NOT InSplitscreenGame 
					FormatText textname = text2 "x %a" a = <ManualBPCount> 
					Create_Panel_Message text = "Manual BoostPlant!" id = perfect rgba = [ 50 150 50 128 ] pos = PAIR(110.00000000000, 340.00000000000) Style = perfect_style 
				ENDIF 
				BEGIN 
					IF IsInBail 
						Goto COMMUNITY_leaty_cancelManualBPEnterManual 
					ENDIF 
					IF NOT CurrentScorePotGreaterThan 0 
						Goto COMMUNITY_leaty_cancelManualBPEnterManual 
					ENDIF 
					IF Released X 
						IF ( <ManualBPCount> = 0 ) 
							Goto COMMUNITY_leaty_cancelManualBPEnterManual 
							ENDIF BEGIN 
							BoostPlant_Spam 
							Jump BonelessHeight 
						REPEAT <ManualBPCount> 
						PlayAnim Anim = Boneless BlendPeriod = 0.20000000298 
						Create_Panel_Message text = "Boostplant!" id = buttslap rgba = [ 50 120 200 128 ] pos = PAIR(530.00000000000, 340.00000000000) Style = perfect_style 
						FormatText textname = counttext "x %a" a = <ManualBPCount> 
						Create_Panel_Message text = <counttext> id = buttslap2 rgba = [ 50 120 200 128 ] pos = PAIR(512.00000000000, 360.00000000000) Style = perfect_style 
						Goto COMMUNITY_leaty_cancelManualBPEnterManual 
					ENDIF 
					IF Inair 
						IF ( <ManualBPCount> = 0 ) 
							Goto COMMUNITY_leaty_cancelManualBPEnterManual 
							ENDIF BEGIN 
							BoostPlant_Spam 
							Jump BonelessHeight 
						REPEAT <ManualBPCount> 
						PlayAnim Anim = Boneless BlendPeriod = 0.20000000298 
						Create_Panel_Message text = "Boostplant!" id = buttslap rgba = [ 50 120 200 128 ] pos = PAIR(530.00000000000, 340.00000000000) Style = perfect_style 
						FormatText textname = counttext "x %a" a = <ManualBPCount> 
						Create_Panel_Message text = <counttext> id = buttslap2 rgba = [ 50 120 200 128 ] pos = PAIR(512.00000000000, 360.00000000000) Style = perfect_style 
						Goto COMMUNITY_leaty_cancelManualBPEnterManual 
					ENDIF 
					wait 1 
				REPEAT 
			ENDIF 
		ELSE 
			Goto COMMUNITY_leaty_cancelManualBPEnterManual 
		ENDIF 
		wait 1 
	REPEAT 
ENDSCRIPT

SCRIPT BoostPlant_Spam 
	SetTrickName #"WalliePlant" 
	Display 
ENDSCRIPT

SCRIPT COMMUNITY_leaty_cancelManualBP 
	KillSpawnedScript name = COMMUNITY_leaty_ManualBPstart 
	ClearEventHandler SkaterEnterManual 
	ClearEventHandler SkaterExitWall 
ENDSCRIPT

SCRIPT COMMUNITY_leaty_cancelManualBPEnterManual 
	KillSpawnedScript name = COMMUNITY_leaty_manualBPEnterManual 
	ClearEventHandler SkaterEnterManual 
	ClearEventHandler SkaterExitWall 
ENDSCRIPT

SCRIPT e9_leaty_cancelregularBPExitWall 
	ClearEventHandler SkaterExitWall 
ENDSCRIPT



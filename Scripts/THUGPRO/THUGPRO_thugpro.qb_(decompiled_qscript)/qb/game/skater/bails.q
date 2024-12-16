
SCRIPT DoingTrickBail 
	printf "TRICKBAIL" 
	Goto YawBail 
ENDSCRIPT

SCRIPT YawBail 
	printf "YawBail ---------------------------" 
	IF IsSkaterOnVehicle 
		Goto vehicle_bail 
	ENDIF 
	dir = forward 
	GetActualSpin 
	IF ( 0 > <spin> ) 
		spin = ( <spin> * -1 ) 
	ENDIF 
	IF LandedFromVert 
		spin = ( <spin> + 180 ) 
	ENDIF 
	BEGIN 
		IF ( <spin> > 360 ) 
			spin = ( <spin> - 360 ) 
		ELSE 
			BREAK 
		ENDIF 
	REPEAT 
	IF ( 45 > <spin> ) 
		dir = nose 
	ELSE 
		IF ( <spin> > 135 & 225 > <spin> ) 
			dir = tail 
		ELSE 
			IF YawingLeft 
				printf "left" 
				IF Flipped 
					dir = face 
				ELSE 
					dir = back 
				ENDIF 
			ELSE 
				printf "right" 
				IF Flipped 
					dir = back 
				ELSE 
					dir = face 
				ENDIF 
			ENDIF 
		ENDIF 
	ENDIF 
	SWITCH <dir> 
		CASE nose 
			printf "nose" 
			Goto Bail_spin_FWD 
		CASE tail 
			printf "tail" 
			Goto Bail_Spin_BCK 
		CASE back 
			printf "back" 
			Goto Bail_spin_CW 
		CASE face 
			printf "face" 
			Goto Bail_spin_CCW 
	ENDSWITCH 
ENDSCRIPT

SCRIPT Bail_spin_FWD 
	IF LandedFromVert 
		printf "Vert" 
		IF AirTimeLessThan 1.25000000000 second 
			printf "Regular, Ramp_Ft" 
			GotoRandomScript [ Bail_Ramp_Ft ] 
		ELSE 
			printf "Hard, Ramp_Ft_Hd" 
			GotoRandomScript [ Bail_Ramp_Ft_Hd ] 
		ENDIF 
	ELSE 
		IF SpeedLessThan 500 
			IF AirTimeLessThan 1 second 
				printf "Runnout" 
				Goto Runout 
			ENDIF 
		ENDIF 
		IF SpeedLessThan 600 
			printf "Slow" 
			IF AirTimeLessThan 1 second 
				printf "Regular Forward" 
				GotoRandomScript [ Bail_Spin_FWD_Regular ] 
			ELSE 
				printf "Hard Forward" 
				GotoRandomScript [ Bail_Spin_FWD_Hard ] 
			ENDIF 
		ELSE 
			printf "Fast" 
			IF AirTimeLessThan 1 second 
				printf "Fast Forward" 
				GotoRandomScript [ Bail_Spin_FWD_Fast ] 
			ELSE 
				printf "Hard Forward" 
				GotoRandomScript [ Bail_Spin_FWD_Hard ] 
			ENDIF 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT Bail_Spin_BCK 
	IF LandedFromVert 
		printf "Vert" 
		IF AirTimeLessThan 1.25000000000 second 
			printf "Regular - Ramp_Bk" 
			GotoRandomScript [ Bail_Ramp_Bk ] 
		ELSE 
			printf "Hard - Ramp_Bk_Hd" 
			GotoRandomScript [ Bail_Ramp_Bk_Hd ] 
		ENDIF 
	ELSE 
		IF SpeedLessThan 500 
			IF AirTimeLessThan 1 second 
				printf "Runnout" 
				Goto Runout 
			ENDIF 
		ENDIF 
		IF SpeedLessThan 650 
			printf "Slow" 
			IF AirTimeLessThan 1 second 
				printf "Regular Back" 
				GotoRandomScript [ Bail_Spin_BCK_Regular ] 
			ELSE 
				printf "Hard Back" 
				GotoRandomScript [ Bail_Spin_BCK_Hard ] 
			ENDIF 
		ELSE 
			printf "Fast" 
			IF AirTimeLessThan 1 second 
				printf "Fast Back" 
				GotoRandomScript [ Bail_Spin_BCK_Fast ] 
			ELSE 
				printf "Hard Back" 
				GotoRandomScript [ Bail_Spin_BCK_Hard ] 
			ENDIF 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT Bail_spin_CW 
	IF LandedFromVert 
		printf "Vert" 
		IF AirTimeLessThan 1.25000000000 second 
			printf "Regular - ramp left or front" 
			GotoRandomScript [ Bail_Ramp_Lt Bail_Ramp_Ft_Med ] 
		ELSE 
			printf "Hard - ramp left" 
			GotoRandomScript [ Bail_Ramp_Lt_Med Bail_Ramp_Lt_Hd ] 
		ENDIF 
	ELSE 
		IF SpeedLessThan 500 
			IF AirTimeLessThan 1 second 
				printf "Runnout" 
				Goto Runout 
			ENDIF 
		ENDIF 
		IF SpeedLessThan 600 
			printf "Slow" 
			IF AirTimeLessThan 1 second 
				printf "Regular" 
				RANDOM(4, 1) RANDOMCASE Goto Bail_Spin_CW_Hard_A RANDOMCASE Goto Nutsac RANDOMEND 
			ELSE 
				printf "Hard" 
				GotoRandomScript [ Bail_Spin_CW_Hard_B ] 
			ENDIF 
		ELSE 
			printf "Fast" 
			IF AirTimeLessThan 1 second 
				printf "Regular" 
				RANDOM(4, 1) RANDOMCASE Goto Bail_Spin_CW_Hard RANDOMCASE Goto Nutsac RANDOMEND 
			ELSE 
				printf "Hard" 
				GotoRandomScript [ Bail_Spin_CW_Hard_B ] 
			ENDIF 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT Bail_spin_CCW 
	IF LandedFromVert 
		printf "Vert" 
		IF AirTimeLessThan 1.25000000000 second 
			printf "Regular - ramp front or right, or spin back regular" 
			GotoRandomScript [ Bail_Ramp_Ft Bail_Ramp_Rt Bail_Spin_BCK_Regular ] 
		ELSE 
			printf "Hard - front or right" 
			GotoRandomScript [ Bail_Ramp_Ft_Hd Bail_Ramp_Rt_Hd ] 
		ENDIF 
	ELSE 
		IF SpeedLessThan 500 
			IF AirTimeLessThan 1 second 
				printf "Runnout" 
				Goto Runout 
			ENDIF 
		ENDIF 
		IF SpeedLessThan 600 
			printf "Slow" 
			IF AirTimeLessThan 1 second 
				printf "Regular" 
				RANDOM(4, 1) RANDOMCASE Goto Bail_Spin_CCW_Hard RANDOMCASE Goto Nutsac RANDOMEND 
			ELSE 
				printf "Hard" 
				GotoRandomScript [ Bail_Spin_CCW_Hard_B ] 
			ENDIF 
		ELSE 
			printf "Fast" 
			GotoRandomScript [ Bail_Spin_CCW_Hard_C ] 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT PitchBail 
	IF IsSkaterOnVehicle 
		Goto vehicle_bail 
	ENDIF 
	tail_script = Bail_Pitch_Tail 
	face_script = Bail_Pitch_Face 
	back_script = Bail_Pitch_Back 
	nose_script = Bail_Pitch_Nose 
	IF NOT InSplitscreenGame 
		IF GetGlobalFlag Flag = TAP_BUTTONS_EXPLAINED 
			IF NOT GetGlobalFlag Flag = RECOVERY_BUTTONS_EXPLAINED 
				Create_Panel_Message { text = "Tip: press \\ml in the air to level out" 
					id = skater_hint 
					style = skater_hint_style 
					pos = PAIR(320.00000000000, 170.00000000000) 
					rgba = [ 32 75 102 100 ] 
				} 
				SetGlobalFlag Flag = RECOVERY_BUTTONS_EXPLAINED 
				thugpro_save_key_value Key = "RECOVERY_BUTTONS_EXPLAINED" value = 1 
			ENDIF 
		ENDIF 
	ENDIF 
	TurnToFaceVelocity 
	GetLastGroundHeading 
	GetHeading 
	dif = ( <heading> - <last_heading> ) 
	BEGIN 
		IF ( <dif> > 180 ) 
			dif = ( 360 - <dif> ) 
		ELSE 
			IF ( -180 > <dif> ) 
				dif = ( 360 + <dif> ) 
			ELSE 
				BREAK 
			ENDIF 
		ENDIF 
	REPEAT 
	printf "heading=%i last_heading=%j" i = <heading> j = <last_heading> 
	printf "dif =============== %k" k = <dif> 
	IF Flipped 
		IF ( 0 > <dif> ) 
			printf "flip1" 
			Flip 
			flipped_skater = 1 
		ENDIF 
	ELSE 
		IF ( <dif> > 0 ) 
			printf "flip2" 
			Flip 
			flipped_skater = 1 
		ENDIF 
	ENDIF 
	GetPitchBailDir 
	SWITCH <pitch_bail_dir> 
		CASE nose 
			pitch_script = <nose_script> 
		CASE tail 
			pitch_script = <tail_script> 
		CASE left 
			IF Flipped 
				pitch_script = <back_script> 
			ELSE 
				pitch_script = <face_script> 
			ENDIF 
		CASE right 
			IF Flipped 
				pitch_script = <face_script> 
			ELSE 
				pitch_script = <back_script> 
			ENDIF 
		DEFAULT 
			pitch_script = <face_script> 
	ENDSWITCH 
	IF GotParam flipped_skater 
		SWITCH <pitch_script> 
			CASE <back_script> 
				pitch_script = <face_script> 
			CASE <face_script> 
				pitch_script = <back_script> 
		ENDSWITCH 
	ENDIF 
	IF GotParam pitch_script 
		MakeSkaterGoto <pitch_script> 
	ENDIF 
ENDSCRIPT

SCRIPT FiftyFiftyFall 
	printf "Grind Bail 50-50" 
	SWITCH <dir> 
		CASE forward 
			printf "bailed Left" 
			GotoRandomScript [ Bail_Falling_LT ] 
		CASE backward 
			printf "bailed Right" 
			GotoRandomScript [ Bail_Falling_RT ] 
		DEFAULT 
			printf "Default" 
			GotoRandomScript [ Bail_Falling_Fwd ] 
	ENDSWITCH 
ENDSCRIPT

SCRIPT GrindFallLR 
	IF Obj_GetCollision down distance = 0 height = 0 length = 2.50000000000 shift = 0.50000000000 
		printf "too low" 
		no_nutter = 1 
	ENDIF 
	IF Ledge 
		printf "Ledge" 
		no_nutter = 1 
	ENDIF 
	IF GotParam no_nutter 
		Goto GrindBailFacingForwards params = { dir = <dir> } 
	ELSE 
		RANDOM(1, 3) RANDOMCASE Goto GrindBailFacingForwards params = { dir = <dir> } RANDOMCASE Goto Nutter RANDOMEND 
	ENDIF 
ENDSCRIPT

SCRIPT GrindBailFacingForwards 
	printf "Grind Bail Forwards" 
	SWITCH <dir> 
		CASE forward 
			printf "bailed left" 
			GotoRandomScript [ Bail_Falling_Slide_FWD_lt ] 
		CASE backward 
			printf "bailed right" 
			GotoRandomScript [ Bail_Falling_Slide_FWD_rt ] 
		DEFAULT 
			printf "Default" 
			GotoRandomScript [ Bail_Falling_Slide_FWD_lt ] 
	ENDSWITCH 
ENDSCRIPT

SCRIPT BackwardsGrindBails 
	IF Obj_GetCollision down distance = 0 height = 0 length = 2.50000000000 shift = 0.50000000000 
		printf "too low" 
		no_nutter = 1 
	ENDIF 
	IF Ledge 
		printf "Ledge" 
		no_nutter = 1 
	ENDIF 
	IF GotParam no_nutter 
		Goto GrindBailFacingBackwards params = { dir = <dir> } 
	ELSE 
		RANDOM(1, 3) RANDOMCASE Goto GrindBailFacingBackwards params = { dir = <dir> } RANDOMCASE Goto NutterBackwards RANDOMEND 
	ENDIF 
ENDSCRIPT

SCRIPT GrindBailFacingBackwards 
	printf "Grind Bail Backwards " 
	SWITCH <dir> 
		CASE forward 
			printf "bailed left" 
			GotoRandomScript [ Bail_Falling_Slide_BCK_lt ] 
		CASE backward 
			printf "bailed right" 
			GotoRandomScript [ Bail_Falling_Slide_BCK_rt ] 
		DEFAULT 
			printf "Default" 
			GotoRandomScript [ Bail_Falling_Slide_BCK_lt ] 
	ENDSWITCH 
ENDSCRIPT

SCRIPT Nutter 
	printf "Nutter Forwards" 
	GotoRandomScript [ Bail_Nutter_FWD ] 
ENDSCRIPT

SCRIPT NutterBackwards 
	printf "Nutter Backwards" 
	GotoRandomScript [ Bail_Nutter_BCK ] 
ENDSCRIPT

SCRIPT Runout 
	IF SpeedLessThan 350 
		printf "RunOut Quick" 
		GotoRandomScript [ RunOutQuick ] 
	ELSE 
		printf "RunOut Regular" 
		RANDOM(2, 1) RANDOMCASE Goto Bail_RunOut_New_A RANDOMCASE Goto Bail_RunOut_Old RANDOMEND 
	ENDIF 
ENDSCRIPT

SCRIPT ManualBail 
	IF SpeedLessThan 600 
		Goto ManualBailSlow 
	ELSE 
		Goto ManualBailFast 
	ENDIF 
ENDSCRIPT

SCRIPT NoseManualBail 
	IF SpeedLessThan 550 
		Goto NoseManualBailSlow 
	ELSE 
		Goto NoseManualBailFast 
	ENDIF 
ENDSCRIPT

FallForwardAnims = { 
	AnimFall1 = Bail_Falling_Idle_FWD 
	AnimFall2 = Bail_falling_hit_med_Fwd 
	AnimFall2Hard = Bail_falling_hit_hard_FWD 
	AnimFallEnd = Getup_HK_BK 
	XMove = 150 
	MoveFrames = 60 
} 
FallBackwardAnims = { 
	AnimFall1 = Bail_Falling_Idle_BCK 
	AnimFall2 = Bail_falling_hit_med_BCK 
	AnimFall2Hard = Bail_falling_hit_hard_BCK 
	AnimFallEnd = Getup_HK_BK 
	XMove = 150 
	MoveFrames = 60 
} 
FallRightAnims = { 
	AnimFall1 = Bail_Falling_Idle_RT 
	AnimFall2 = Bail_falling_hit_med 
	AnimFall2Hard = Bail_falling_hit_hard 
	AnimFallEnd = Getup_HK_Rt 
	XMove = 150 
	MoveFrames = 60 
} 
FallLeftAnims = { 
	AnimFall1 = Bail_Falling_Idle_LT 
	AnimFall2 = Bail_falling_hit_hard 
	AnimFall2Hard = Bail_falling_hit_hard 
	AnimFallEnd = Getup_HK_Lt 
	XMove = -165 
	MoveFrames = 30 
} 
FallForwardRightAnims = { 
	AnimFall1 = Bail_Falling_Slide_Idle_RTf 
	AnimFall2 = Bail_Falling_Slide_HitM_RTf 
	AnimFall2Hard = Bail_Falling_Slide_HitH_RTf 
	AnimFallEnd = Getup_HK_Lt 
	XMove = 150 
	MoveFrames = 60 
} 
FallForwardLeftAnims = { 
	AnimFall1 = Bail_Falling_Slide_Idle_LTf 
	AnimFall2 = Bail_Falling_Slide_HitM_LTf 
	AnimFall2Hard = Bail_Falling_Slide_HitH_LTf 
	AnimFallEnd = Getup_HK_Lt 
	XMove = -150 
	MoveFrames = 60 
} 
FallBackwardLeftAnims = { 
	AnimFall1 = Bail_Falling_Slide_Idle_LTb 
	AnimFall2 = Bail_Falling_Slide_HitM_LTb 
	AnimFall2Hard = Bail_Falling_Slide_HitH_LTb 
	AnimFallEnd = Getup_HK_Rt 
	XMove = -150 
	MoveFrames = 60 
} 
FallBackwardRightAnims = { 
	AnimFall1 = Bail_Falling_Slide_Idle_RTb 
	AnimFall2 = Bail_Falling_Slide_HitM_RTb 
	AnimFall2Hard = Bail_Falling_Slide_HitH_RTb 
	AnimFallEnd = Getup_HK_Rt 
	XMove = 150 
	MoveFrames = 60 
} 
FallBackwardSlideAnims = { 
	AnimFall1 = Bail_Falling_Slide_Idle_BCK 
	AnimFall2 = Bail_Falling_Slide_HitM_BCK 
	AnimFall2Hard = Bail_Falling_Slide_HitH_BCK 
	AnimFallEnd = Getup_HK_FT 
} 
FallStandingAnims = { 
	AnimFall1 = RunOut_Drop_Idle 
	AnimFall2 = RunOut_Drop_Land_Med 
	AnimFall2Hard = RunOut_Drop_Land_Med 
	AnimFallEnd = Getup_HK_FT 
	SplatBloodFrame = 6 
} 
FallSpinAnims = { 
	AnimFall1 = Bail_Spin_CCW_Hard_C 
	AnimFall2 = Bail_falling_hit_med_Fwd 
	AnimFall2Hard = Bail_falling_hit_hard_FWD 
	AnimFallEnd = Getup_HK_FT 
} 
BAILSCRIPT = Kneeslide 
SCRIPT RunOutQuick 
	GeneralBail { Anim1 = RunOutQuick IntoAirFrame = 1 Friction = 11 BoardAlwaysOn BashOff NoBlood 
		BoardAlwaysOn 
		Sound = Bailrunoutflip NoScuff 
		GroundGoneBail = GroundGoneBail 
		FallBlendPeriod = 1 
		FallStandingAnims 
	} 
ENDSCRIPT

SCRIPT Bail_RunOut_Old 
	GeneralBail { Anim1 = Bail_RunOut_Old IntoAirFrame = 1 SmackAnim = Bail_Wall_FWD_Regular Friction = 13 BoardAlwaysOn BashOff NoBlood 
		BoardAlwaysOn 
		Sound = Bailrunoutflip NoScuff 
		GroundGoneBail = GroundGoneBail 
		FallBlendPeriod = 1 
		FallStandingAnims 
	} 
ENDSCRIPT

SCRIPT Bail_RunOut_New_A 
	GeneralBail { Anim1 = Bail_RunOut_New_A IntoAirFrame = 1 SmackAnim = Bail_Wall_FWD_Regular Friction = 17 BoardAlwaysOn BashOff NoBlood 
		BoardAlwaysOn 
		Sound = Bailrunoutflip NoScuff 
		GroundGoneBail = GroundGoneBail 
		FallBlendPeriod = 0.40000000596 
		FallStandingAnims 
		BoardHideFix 
	} 
ENDSCRIPT

SCRIPT RunOut_Drop_Land_Med 
	GeneralBail { Anim1 = RunOut_Drop_Land_Med IntoAirFrame = 1 SmackAnim = Bail_Wall_FWD_Low Friction = 13 BoardAlwaysOn BashOff 
		Sound = bail_knee1 FoleySound BloodFrame = 6 
		GroundGoneBail = GroundGoneBail 
		FallBlendPeriod = 1 
		FallStandingAnims 
	} 
ENDSCRIPT

SCRIPT Bail_Ramp_Ft 
	GeneralBail { Anim1 = Bail_Ramp_Ft NoBlending Endpose = Getup_HK_FT 
		IntoAirFrame = 1 Friction = 11 SmackAnim = Bail_Wall_FWD_Regular 
		BoardOffFrame = 10 BoardVel = VECTOR(-10.00000000000, 0.00000000000, 0.00000000000) BoardRotVel = VECTOR(0.00000000000, 0.00000000000, 0.00000000000) BoardSkaterVel = 0 
		Sound = bail_knee1 FoleySound BloodFrame = 18 
		GroundGoneBail = GroundGoneBail 
		FallBlendPeriod = 1 
		FallForwardAnims 
	} 
ENDSCRIPT

SCRIPT Bail_Ramp_Ft_Med 
	GeneralBail { Anim1 = Bail_Ramp_Ft_Med NoBlending Endpose = Getup_HK_FT 
		IntoAirFrame = 1 Friction = 10 SmackAnim = Bail_Wall_FWD_Regular 
		BoardOffFrame = 6 BoardVel = VECTOR(-10.00000000000, 0.00000000000, 0.00000000000) BoardRotVel = VECTOR(0.00000000000, 0.00000000000, 0.00000000000) BoardSkaterVel = 0 
		Sound = bail_knee1 FoleySound BloodFrame = 13 
		GroundGoneBail = GroundGoneBail 
		FallBlendPeriod = 1 
		FallForwardAnims 
	} 
ENDSCRIPT

SCRIPT Bail_Ramp_Ft_Hd 
	GeneralBail { Anim1 = Bail_Ramp_Ft_Hd NoBlending Endpose = Getup_HK_FT 
		IntoAirFrame = 1 Friction = 6 SmackAnim = Bail_Wall_FWD_Regular 
		BoardOffFrame = 8 BoardVel = VECTOR(-10.00000000000, 0.00000000000, 0.00000000000) BoardRotVel = VECTOR(0.00000000000, 0.00000000000, 0.00000000000) BoardSkaterVel = 0 
		Sound = bail_knee1 FoleySound BloodFrame = 10 
		GroundGoneBail = GroundGoneBail 
		FallBlendPeriod = 0.75000000000 
		FallForwardAnims 
	} 
ENDSCRIPT

SCRIPT Bail_Ramp_Bk 
	GeneralBail { Anim1 = Bail_Ramp_Bk NoBlending Endpose = Getup_HK_FT 
		IntoAirFrame = 1 Friction = 17 SmackAnim = Bail_Wall_BCK_Regular 
		BoardOffFrame = 3 BoardVel = VECTOR(-10.00000000000, 0.00000000000, 0.00000000000) BoardRotVel = VECTOR(0.00000000000, 0.00000000000, 0.00000000000) BoardSkaterVel = 0 
		Sound = bail_knee1 FoleySound BloodFrame = 11 
		GroundGoneBail = GroundGoneBail 
		FallBlendPeriod = 1 
		FallBackwardSlideAnims 
	} 
ENDSCRIPT

SCRIPT Bail_Ramp_Bk_Hd 
	GeneralBail { Anim1 = Bail_Ramp_Bk_Hd NoBlending Endpose = Getup_HK_Rt 
		IntoAirFrame = 1 Friction = 14 SmackAnim = Bail_Wall_BCK_Regular 
		BoardOffFrame = 10 BoardVel = VECTOR(-10.00000000000, 0.00000000000, 0.00000000000) BoardRotVel = VECTOR(0.00000000000, 0.00000000000, 0.00000000000) BoardSkaterVel = 0 
		Sound = bail_knee1 FoleySound BloodFrame = 12 
		GroundGoneBail = GroundGoneBail 
		FallBlendPeriod = 1.50000000000 
		FallBackwardSlideAnims 
	} 
ENDSCRIPT

SCRIPT Bail_Ramp_Lt 
	GeneralBail { Anim1 = Bail_Ramp_Lt NoBlending Endpose = Getup_HK_FT 
		IntoAirFrame = 1 Friction = 16 SmackAnim = Bail_Wall_FWD_Regular 
		BoardOffFrame = 10 BoardVel = VECTOR(-10.00000000000, 0.00000000000, 0.00000000000) BoardRotVel = VECTOR(0.00000000000, 0.00000000000, 0.00000000000) BoardSkaterVel = 0 
		Sound = bail_knee1 FoleySound BloodFrame = 18 
		GroundGoneBail = GroundGoneBail 
		FallBlendPeriod = 1.00000000000 
		FallForwardAnims 
	} 
ENDSCRIPT

SCRIPT Bail_Ramp_Lt_Med 
	GeneralBail { Anim1 = Bail_Ramp_Lt_Med NoBlending Endpose = Getup_HK_Lt 
		IntoAirFrame = 1 Friction = 20 SmackAnim = Bail_Wall_FWD_Low 
		BoardOffFrame = 10 BoardVel = VECTOR(-10.00000000000, 0.00000000000, 0.00000000000) BoardRotVel = VECTOR(0.00000000000, 0.00000000000, 0.00000000000) BoardSkaterVel = 0 
		Sound = bail_knee1 FoleySound BloodFrame = 16 
		GroundGoneBail = GroundGoneBail 
		FallBlendPeriod = 1 
		FallLeftAnims 
	} 
ENDSCRIPT

SCRIPT Bail_Ramp_Lt_Hd 
	GeneralBail { Anim1 = Bail_Ramp_Lt_Hd NoBlending Endpose = Getup_HK_Lt 
		IntoAirFrame = 1 Friction = 10 
		SmackAnim = Bail_Wall_LT_Low 
		BoardOffFrame = 5 BoardVel = VECTOR(-10.00000000000, 0.00000000000, 0.00000000000) BoardRotVel = VECTOR(0.00000000000, 0.00000000000, 0.00000000000) BoardSkaterVel = 10 
		Sound = bail_knee1 FoleySound BloodFrame = 19 
		GroundGoneBail = GroundGoneBail 
		FallBlendPeriod = 1.50000000000 
		FallLeftAnims 
	} 
ENDSCRIPT

SCRIPT Bail_Ramp_Rt 
	GeneralBail { Anim1 = Bail_Ramp_Rt NoBlending Endpose = Getup_HK_FT 
		IntoAirFrame = 1 Friction = 20 SmackAnim = Bail_Wall_RT_Low 
		BoardOffFrame = 10 BoardVel = VECTOR(-10.00000000000, 0.00000000000, 0.00000000000) BoardRotVel = VECTOR(0.00000000000, 0.00000000000, 0.00000000000) BoardSkaterVel = 0 
		Sound = bail_knee1 FoleySound BloodFrame = 18 
		GroundGoneBail = GroundGoneBail 
		FallBlendPeriod = 1 
		FallForwardAnims 
	} 
ENDSCRIPT

SCRIPT Bail_Ramp_Rt_Med 
	GeneralBail { Anim1 = Bail_Ramp_Rt_Med NoBlending Endpose = Getup_HK_BK 
		IntoAirFrame = 1 Friction = 1 SmackAnim = Bail_Wall_RT_Low 
		BoardOffFrame = 10 BoardVel = VECTOR(-10.00000000000, 0.00000000000, 0.00000000000) BoardRotVel = VECTOR(0.00000000000, 0.00000000000, 0.00000000000) BoardSkaterVel = 0 
		Sound = bail_knee1 FoleySound BloodFrame = 18 
		GroundGoneBail = GroundGoneBail 
		FallBlendPeriod = 1 
		FallBackwardAnims 
	} 
ENDSCRIPT

SCRIPT Bail_Ramp_Rt_Hd 
	GeneralBail { Anim1 = Bail_Ramp_Rt_Hd NoBlending Endpose = Getup_HK_FT 
		IntoAirFrame = 1 Friction = 20 SmackAnim = Bail_Wall_RT_Low 
		BoardOffFrame = 10 BoardVel = VECTOR(-10.00000000000, 0.00000000000, 0.00000000000) BoardRotVel = VECTOR(0.00000000000, 0.00000000000, 0.00000000000) BoardSkaterVel = 0 
		Sound = bail_knee1 FoleySound BloodFrame = 18 
		GroundGoneBail = GroundGoneBail 
		FallBlendPeriod = 1 
		FallBackwardSlideAnims 
	} 
ENDSCRIPT

SCRIPT Bail_Spin_CW_Hard 
	GeneralBail { Anim1 = Bail_Spin_CW_Hard NoBlending Endpose = Getup_HK_FT 
		IntoAirFrame = 1 Friction = 20 SmackAnim = Bail_Wall_FWD_Low 
		BoardOffFrame = 10 BoardVel = VECTOR(-10.00000000000, 0.00000000000, 0.00000000000) BoardRotVel = VECTOR(0.00000000000, 0.00000000000, 0.00000000000) BoardSkaterVel = 0 
		Sound = bail_knee1 FoleySound BloodFrame = 18 
		GroundGoneBail = GroundGoneBail 
		FallBlendPeriod = 1.50000000000 
		FallBackwardSlideAnims 
	} 
ENDSCRIPT

SCRIPT Bail_Spin_CCW_Hard 
	GeneralBail { Anim1 = Bail_Spin_CCW_Hard NoBlending Endpose = Getup_HK_FT 
		IntoAirFrame = 1 Friction = 20 SmackAnim = Bail_Wall_FWD_Low 
		BoardOffFrame = 10 BoardVel = VECTOR(-10.00000000000, 0.00000000000, 0.00000000000) BoardRotVel = VECTOR(0.00000000000, 0.00000000000, 0.00000000000) BoardSkaterVel = 0 
		Sound = bail_knee1 FoleySound BloodFrame = 20 
		GroundGoneBail = GroundGoneBail 
		FallBlendPeriod = 1.50000000000 
		FallForwardAnims 
	} 
ENDSCRIPT

SCRIPT Bail_Spin_CW_Hard_A 
	GeneralBail { Anim1 = Bail_Spin_CW_Hard_A NoBlending Endpose = Getup_HK_FT 
		IntoAirFrame = 1 Friction = 23 SmackAnim = Bail_Wall_FWD_Low 
		BoardOffFrame = 5 BoardVel = VECTOR(-10.00000000000, 0.00000000000, 0.00000000000) BoardRotVel = VECTOR(0.00000000000, 0.00000000000, 0.00000000000) BoardSkaterVel = 0 
		Sound = bail_knee1 FoleySound BloodFrame = 12 
		GroundGoneBail = GroundGoneBail 
		FallBlendPeriod = 1.50000000000 
		FallBackwardSlideAnims 
	} 
ENDSCRIPT

SCRIPT Bail_Spin_CCW_Hard_B 
	GeneralBail { Anim1 = Bail_Spin_CCW_Hard_B NoBlending Endpose = Getup_HK_FT 
		IntoAirFrame = 1 Friction = 20 SmackAnim = Bail_Wall_RT_Low 
		BoardOffFrame = 10 BoardVel = VECTOR(-10.00000000000, 0.00000000000, 0.00000000000) BoardRotVel = VECTOR(0.00000000000, 0.00000000000, 0.00000000000) BoardSkaterVel = 0 
		Sound = bail_knee1 FoleySound BloodFrame = 25 
		GroundGoneBail = GroundGoneBail 
		FallBlendPeriod = 1.50000000000 
		FallForwardAnims 
	} 
ENDSCRIPT

SCRIPT Bail_Spin_CCW_Hard_C 
	GeneralBail { 
		FallSpinAnims 
		FoleySound 
		NoBlending 
		Anim1 = Bail_Spin_CCW_Hard_C 
		BloodFrame = 25 
		BoardOffFrame = 2 
		BoardRotVel = VECTOR(0.00000000000, 0.00000000000, 0.00000000000) 
		BoardSkaterVel = 0 
		BoardVel = VECTOR(-30.00000000000, 0.00000000000, 0.00000000000) 
		Endpose = Getup_HK_FT 
		FallBlendPeriod = 1 
		Friction = 13.50000000000 
		GroundGoneBail = GroundGoneBail 
		IntoAirFrame = 1 
		SmackAnim = Bail_Wall_LT_Low 
		Sound = bail_knee1 
	} 
ENDSCRIPT

SCRIPT Bail_Spin_CW_Hard_B 
	GeneralBail { Anim1 = Bail_Spin_CW_Hard_B NoBlending Endpose = Getup_HK_Rt 
		IntoAirFrame = 1 HeavyFriction = 10 Friction = 10 Friction2 = 17.50000000000 SmackAnim = Bail_Wall_FWD_Low 
		BoardOffFrame = 2 BoardVel = VECTOR(-30.00000000000, 0.00000000000, 0.00000000000) BoardRotVel = VECTOR(0.00000000000, 0.00000000000, 0.00000000000) BoardSkaterVel = 0 
		Sound = bail_knee1 FoleySound BloodFrame = 20 
		GroundGoneBail = GroundGoneBail 
		FallBlendPeriod = 1.50000000000 
		FallRightAnims 
	} 
ENDSCRIPT

SCRIPT Bail_Spin_FWD_Regular 
	GeneralBail { Anim1 = Bail_Spin_FWD_Regular NoBlending Endpose = GetUp_Sit_FT 
		IntoAirFrame = 1 Friction = 14 SmackAnim = Bail_Wall_FWD_Low 
		BoardOffFrame = 10 BoardVel = VECTOR(-10.00000000000, 0.00000000000, 0.00000000000) BoardRotVel = VECTOR(0.00000000000, 0.00000000000, 0.00000000000) BoardSkaterVel = 0 
		Sound = bail_knee1 FoleySound BloodFrame = 13 
		GroundGoneBail = GroundGoneBail 
		FallBlendPeriod = 1 
		FallForwardAnims 
	} 
ENDSCRIPT

SCRIPT Bail_Spin_FWD_Hard 
	GeneralBail { Anim1 = Bail_Spin_FWD_Hard NoBlending Endpose = Getup_HK_FT 
		IntoAirFrame = 1 Friction = 18 SmackAnim = Bail_Wall_FWD_Low 
		BoardOffFrame = 10 BoardVel = VECTOR(-10.00000000000, 0.00000000000, 0.00000000000) BoardRotVel = VECTOR(0.00000000000, 0.00000000000, 0.00000000000) BoardSkaterVel = 0 
		Sound = bail_knee1 FoleySound BloodFrame = 24 
		GroundGoneBail = GroundGoneBail 
		FallBlendPeriod = 1 
		FallForwardAnims 
	} 
ENDSCRIPT

SCRIPT Bail_Spin_FWD_Fast 
	GeneralBail { Anim1 = Bail_Spin_FWD_Fast NoBlending Endpose = Getup_HK_Lt 
		IntoAirFrame = 1 Friction = 14 SmackAnim = Bail_Wall_FWD_Low 
		BoardOffFrame = 10 BoardVel = VECTOR(-10.00000000000, 0.00000000000, 0.00000000000) BoardRotVel = VECTOR(0.00000000000, 0.00000000000, 0.00000000000) BoardSkaterVel = 0 
		Sound = bail_knee1 FoleySound BloodFrame = 12 
		GroundGoneBail = GroundGoneBail 
		FallBlendPeriod = 1 
		FallForwardAnims 
	} 
ENDSCRIPT

SCRIPT Bail_Spin_BCK_Regular 
	GeneralBail { Anim1 = Bail_Spin_BCK_Regular NoBlending Endpose = Getup_HK_BK 
		IntoAirFrame = 1 Friction = 12 SmackAnim = Bail_Wall_FWD_Low 
		BoardOffFrame = 10 BoardVel = VECTOR(-10.00000000000, 0.00000000000, 0.00000000000) BoardRotVel = VECTOR(0.00000000000, 0.00000000000, 0.00000000000) BoardSkaterVel = 0 
		Sound = bail_knee1 FoleySound BloodFrame = 5 
		GroundGoneBail = GroundGoneBail 
		FallBlendPeriod = 0.30000001192 
		FallBackwardSlideAnims 
	} 
ENDSCRIPT

SCRIPT Bail_Spin_BCK_Hard 
	GeneralBail { Anim1 = Bail_Spin_BCK_Hard NoBlending Endpose = Getup_HK_FT 
		IntoAirFrame = 1 Friction = 19 SmackAnim = Bail_Wall_FWD_Low 
		BoardOffFrame = 10 BoardVel = VECTOR(-10.00000000000, 0.00000000000, 0.00000000000) BoardRotVel = VECTOR(0.00000000000, 0.00000000000, 0.00000000000) BoardSkaterVel = 0 
		Sound = bail_knee1 FoleySound BloodFrame = 10 
		GroundGoneBail = GroundGoneBail 
		FallBlendPeriod = 1 
		FallBackwardSlideAnims 
	} 
ENDSCRIPT

SCRIPT Bail_Spin_BCK_Fast 
	GeneralBail { Anim1 = Bail_Spin_BCK_Fast NoBlending Endpose = Getup_HK_FT 
		IntoAirFrame = 1 Friction2 = 50 Friction = 28 SmackAnim = Bail_Wall_FWD_Low 
		BoardOffFrame = 10 BoardVel = VECTOR(-10.00000000000, 0.00000000000, 0.00000000000) BoardRotVel = VECTOR(0.00000000000, 0.00000000000, 0.00000000000) BoardSkaterVel = -10 
		Sound = bail_knee1 FoleySound BloodFrame = 56 
		GroundGoneBail = GroundGoneBail 
		FallBlendPeriod = 1 
		FallBackwardSlideAnims 
	} 
ENDSCRIPT

SCRIPT Bail_Pitch_Back 
	printf "Bail_Pitch_Back" 
	GeneralBail { Anim1 = Bail_Pitch_Back Endpose = Getup_HK_Lt 
		IntoAirFrame = 1 Friction = 100 SmackAnim = Bail_Wall_BCK_Low 
		Sound = Bail04 FoleySound NoBlending 
		BoardOffFrame = 1 BoardVel = VECTOR(25.00000000000, 150.00000000000, 0.00000000000) BoardRotVel = VECTOR(0.50000000000, 3.00000000000, 2.00000000000) BoardSkaterVel = 0 BloodFrame = 8 
		GroundGoneBail = GroundGoneBail 
		FallBackwardSlideAnims 
		dont_face_vel = <dont_face_vel> 
	} 
ENDSCRIPT

SCRIPT Bail_Pitch_Tail 
	printf "Bail_Pitch_Tail" 
	GeneralBail { Anim1 = Bail_Pitch_Tail Endpose = Getup_HK_Lt 
		IntoAirFrame = 1 Friction = 100 SmackAnim = Bail_Wall_BCK_Regular 
		Sound = Bail04 FoleySound NoBlending 
		BoardOffFrame = 1 BoardVel = VECTOR(25.00000000000, 150.00000000000, 0.00000000000) BoardRotVel = VECTOR(0.50000000000, 3.00000000000, 2.00000000000) BoardSkaterVel = 0 BloodFrame = 6 
		GroundGoneBail = GroundGoneBail 
		FallBackwardSlideAnims 
	} 
ENDSCRIPT

SCRIPT Bail_Pitch_Face 
	printf "Bail_Pitch_Face" 
	GeneralBail { Anim1 = Bail_Pitch_Face Endpose = Getup_HK_Lt 
		IntoAirFrame = 1 BloodFrame = 5 SmackAnim = Bail_Wall_FWD_Low 
		BoardOffFrame = 0 BoardVel = VECTOR(0.00000000000, 100.00000000000, -300.00000000000) BoardRotVel = VECTOR(0.00000000000, 5.00000000000, 0.00000000000) BoardSkaterVel = 1 
		Sound = bail_knee1 FoleySound NoBlending 
		GroundGoneBail = GroundGoneBail 
		FallForwardAnims 
		dont_face_vel = <dont_face_vel> 
	} 
ENDSCRIPT

SCRIPT Bail_Pitch_Nose 
	printf "Bail_Pitch_Nose" 
	GeneralBail { Anim1 = Bail_Pitch_Nose NoBlending Endpose = Getup_HK_Lt 
		IntoAirFrame = 20 Friction = 100 SmackAnim = Bail_Wall_FWD_Low 
		BoardOffFrame = 1 BoardVel = VECTOR(-100.00000000000, 50.00000000000, -250.00000000000) BoardRotVel = VECTOR(10.00000000000, 2.00000000000, -2.00000000000) BoardSkaterVel = 1 
		Sound = BoardBail01 FoleySound BloodFrame = 4 NoBlending 
		GroundGoneBail = GroundGoneBail 
		FallForwardAnims 
	} 
ENDSCRIPT

SCRIPT Nutsac 
	GeneralBail { Anim1 = Nutsac NoBlending Endpose = Getup_HK_Lt 
		IntoAirFrame = 1 Friction = 20 SmackAnim = Bail_Wall_RT_Low 
		BoardOffFrame = 0 BoardVel = VECTOR(0.00000000000, 50.00000000000, 0.00000000000) BoardRotVel = VECTOR(0.00000000000, 0.00000000000, 0.00000000000) BoardSkaterVel = 1 
		Sound = bail_knee1 FoleySound 
		GroundGoneBail = GroundGoneBail 
		FallBlendPeriod = 1 
		FallForwardAnims 
	} 
ENDSCRIPT

SCRIPT Bail_Falling_Fwd 
	GeneralBail { Anim1 = Bail_Falling_Fwd Endpose = Getup_HK_Lt 
		IntoAirFrame = 26 ForceFall Friction = 0 BloodFrame = 50 SmackAnim = Bail_Wall_BCK_Low Sound = Bail04 
		BoardOffFrame = 1 BoardVel = VECTOR(-50.00000000000, 20.00000000000, 0.00000000000) BoardRotVel = VECTOR(0.00000000000, 1.00000000000, -1.00000000000) BoardSkaterVel = 1 
		FoleySound FallBlendPeriod = 0 SplatFriction = 20 
		GroundGoneBail = GroundGoneBail 
		FallForwardAnims 
	} 
ENDSCRIPT

SCRIPT Bail_Falling_Bck 
	GeneralBail { Anim1 = Bail_Falling_Bck Endpose = Getup_HK_BK 
		IntoAirFrame = 33 ForceFall Friction = 10 Friction2 = 100 BloodFrame = 50 SmackAnim = Bail_Wall_BCK_Low Sound = Bail04 
		BoardOffFrame = 1 BoardVel = VECTOR(-50.00000000000, 20.00000000000, 0.00000000000) BoardRotVel = VECTOR(0.00000000000, 1.00000000000, -1.00000000000) BoardSkaterVel = 1 
		FoleySound FallBlendPeriod = 0 SplatFriction = 20 
		GroundGoneBail = GroundGoneBail 
		FallBackwardAnims 
	} 
ENDSCRIPT

SCRIPT Bail_Falling_RT 
	GeneralBail { Anim1 = Bail_Falling_RT Endpose = Getup_HK_Rt 
		IntoAirFrame = 36 ForceFall Friction = 0 BloodFrame = 50 SmackAnim = Bail_Wall_RT_Low Sound = Bail04 
		BoardOffFrame = 1 BoardVel = VECTOR(-50.00000000000, 20.00000000000, 0.00000000000) BoardRotVel = VECTOR(0.00000000000, 1.00000000000, -1.00000000000) BoardSkaterVel = 1 
		FoleySound FallBlendPeriod = 0 SplatFriction = 20 
		GroundGoneBail = GroundGoneBail 
		FallRightAnims 
	} 
ENDSCRIPT

SCRIPT Bail_Falling_LT 
	GeneralBail { Anim1 = Bail_Falling_LT Endpose = Getup_HK_Lt 
		IntoAirFrame = 16 ForceFall Friction = 0 BloodFrame = 7 SmackAnim = Bail_Wall_LT_Low Sound = Bail04 
		BoardOffFrame = 1 BoardVel = VECTOR(-50.00000000000, 20.00000000000, 0.00000000000) BoardRotVel = VECTOR(0.00000000000, 1.00000000000, -1.00000000000) BoardSkaterVel = 1 
		FoleySound FallBlendPeriod = 0 SplatFriction = 20 
		GroundGoneBail = GroundGoneBail 
		FallLeftAnims 
	} 
ENDSCRIPT

SCRIPT Bail_Falling_Slide_BCK 
	GeneralBail { Anim1 = Bail_Falling_Slide_BCK Endpose = Getup_HK_FT 
		IntoAirFrame = 28 ForceFall Friction = 0 BloodFrame = 50 SmackAnim = Bail_Wall_BCK_Low Sound = Bail04 
		BoardOffFrame = 3 BoardVel = VECTOR(-50.00000000000, 20.00000000000, 0.00000000000) BoardRotVel = VECTOR(0.00000000000, 1.00000000000, -1.00000000000) BoardSkaterVel = 1 
		FoleySound FallBlendPeriod = 0 SplatFriction = 20 
		GroundGoneBail = GroundGoneBail 
		FallBackwardSlideAnims 
	} 
ENDSCRIPT

SCRIPT Bail_Falling_Slide_BCK_lt 
	GeneralBail { Anim1 = Bail_Falling_Slide_LTb Endpose = Getup_HK_Rt 
		IntoAirFrame = 26 ForceFall Friction = 0 BloodFrame = 50 SmackAnim = Bail_Wall_LT_Low Sound = Bail04 
		BoardOffFrame = 1 BoardVel = VECTOR(-50.00000000000, 20.00000000000, 0.00000000000) BoardRotVel = VECTOR(0.00000000000, 1.00000000000, -1.00000000000) BoardSkaterVel = 1 
		FoleySound FallBlendPeriod = 0 SplatFriction = 20 
		GroundGoneBail = GroundGoneBail 
		FallBackwardLeftAnims 
	} 
ENDSCRIPT

SCRIPT Bail_Falling_Slide_BCK_rt 
	GeneralBail { Anim1 = Bail_Falling_Slide_RTb Endpose = Getup_HK_Rt 
		IntoAirFrame = 34 ForceFall Friction = 0 BloodFrame = 50 SmackAnim = Bail_Wall_RT_Low Sound = Bail04 
		BoardOffFrame = 1 BoardVel = VECTOR(-50.00000000000, 20.00000000000, 0.00000000000) BoardRotVel = VECTOR(0.00000000000, 1.00000000000, -1.00000000000) BoardSkaterVel = 1 
		FoleySound FallBlendPeriod = 0 SplatFriction = 20 
		GroundGoneBail = GroundGoneBail 
		FallBackwardRightAnims 
	} 
ENDSCRIPT

SCRIPT Bail_Falling_Slide_FWD_lt 
	GeneralBail { 
		FoleySound 
		ForceFall 
		FallForwardLeftAnims 
		Anim1 = Bail_Falling_Slide_LTf 
		BloodFrame = 50 
		BoardOffFrame = 1 
		BoardRotVel = VECTOR(0.00000000000, 1.00000000000, -1.00000000000) 
		BoardSkaterVel = 1 
		BoardVel = VECTOR(-50.00000000000, 20.00000000000, 0.00000000000) 
		Endpose = Getup_HK_Lt 
		FallBlendPeriod = 0 
		Friction = 0 
		GroundGoneBail = GroundGoneBail 
		IntoAirFrame = 26 
		SmackAnim = Bail_Wall_LT_Low 
		Sound = Bail04 
		SplatFriction = 20 
	} 
ENDSCRIPT

SCRIPT Bail_Falling_Slide_FWD_rt 
	GeneralBail { Anim1 = Bail_Falling_Slide_RTf Endpose = Getup_HK_Lt 
		IntoAirFrame = 26 ForceFall Friction = 0 BloodFrame = 50 SmackAnim = Bail_Wall_RT_Low Sound = Bail04 
		BoardOffFrame = 1 BoardVel = VECTOR(-50.00000000000, 20.00000000000, 0.00000000000) BoardRotVel = VECTOR(0.00000000000, 1.00000000000, -1.00000000000) BoardSkaterVel = 1 
		FoleySound FallBlendPeriod = 0 SplatFriction = 20 
		GroundGoneBail = GroundGoneBail 
		FallForwardRightAnims 
	} 
ENDSCRIPT

SCRIPT Bail_Nutter_FWD 
	GeneralBail { Anim1 = Bail_Nutter_FWD Endpose = Getup_HK_FT IntoAirFrame = 47 Friction = 0 SmackAnim = Bail_Wall_FWD_Regular Sound = Bail04 
		BoardOffFrame = 5 BoardVel = VECTOR(20.00000000000, 0.00000000000, 0.00000000000) BoardRotVel = VECTOR(0.00000000000, 1.00000000000, 1.00000000000) BoardSkaterVel = 1 
		FoleySound BonkSound 
		GroundGoneBail = GroundGoneBail 
		Nutter 
	} 
ENDSCRIPT

SCRIPT Bail_Nutter_BCK 
	GeneralBail { Anim1 = Bail_Nutter_BCK Endpose = Getup_HK_FT IntoAirFrame = 37 Friction = 0 SmackAnim = Bail_Wall_BCK_Regular Sound = Bail04 
		BoardOffFrame = 1 BoardVel = VECTOR(20.00000000000, 0.00000000000, 0.00000000000) BoardRotVel = VECTOR(0.00000000000, 1.00000000000, 1.00000000000) BoardSkaterVel = 1 
		FoleySound BonkSound 
		GroundGoneBail = GroundGoneBail 
		FallBackwardSlideAnims 
		Nutter 
	} 
ENDSCRIPT

SCRIPT ManualBailSlow 
	GeneralBail { Anim1 = Bail_Manual_BK Endpose = GetUp_Sit_FT IntoAirFrame = 30 Friction = 20 NoBlending BloodFrame = 15 SmackAnim = Bail_Wall_BCK_Low Sound = Bail04 
		BoardOffFrame = 6 BoardVel = VECTOR(0.00000000000, 50.00000000000, 400.00000000000) BoardRotVel = VECTOR(0.00000000000, 0.00000000000, 0.00000000000) BoardSkaterVel = 1 
		GroundGoneBail = GroundGoneBail 
		FallBlendPeriod = 1 
		FallBackwardAnims 
	} 
ENDSCRIPT

SCRIPT ManualBailFast 
	GeneralBail { Anim1 = Bail_Manual_BK_fast Endpose = Getup_HK_FT IntoAirFrame = 30 NoBlending Friction = 5 BloodFrame = 15 SmackAnim = Bail_Wall_BCK_Low Sound = Bail04 
		BoardOffFrame = 6 BoardVel = VECTOR(0.00000000000, 50.00000000000, 400.00000000000) BoardRotVel = VECTOR(0.00000000000, 0.00000000000, 0.00000000000) BoardSkaterVel = 1 
		GroundGoneBail = GroundGoneBail 
		FallBlendPeriod = 1.50000000000 
		FallForwardAnims 
	} 
ENDSCRIPT

SCRIPT NoseManualBailSlow 
	GeneralBail { Anim1 = Bail_Manual_FT Endpose = Getup_HK_FT IntoAirFrame = 30 NoBlending Friction = 10 BloodFrame = 13 SmackAnim = Bail_Wall_FWD_Regular Sound = BoardBail01 
		BoardOffFrame = 10 BoardVel = VECTOR(0.00000000000, 50.00000000000, -400.00000000000) BoardRotVel = VECTOR(0.00000000000, 0.00000000000, 0.00000000000) BoardSkaterVel = 0 
		GroundGoneBail = GroundGoneBail 
		FallBlendPeriod = 1.50000000000 
		FallForwardAnims 
	} 
ENDSCRIPT

SCRIPT NoseManualBailFast 
	GeneralBail { Anim1 = Bail_Manual_FT_fast Endpose = Getup_HK_Lt IntoAirFrame = 30 NoBlending Friction = 10 BloodFrame = 15 SmackAnim = Bail_Wall_FWD_Regular Sound = BoardBail01 
		BoardOffFrame = 10 BoardVel = VECTOR(0.00000000000, 50.00000000000, -400.00000000000) BoardRotVel = VECTOR(0.00000000000, 0.00000000000, 0.00000000000) BoardSkaterVel = 0 
		GroundGoneBail = GroundGoneBail 
		FallBlendPeriod = 1.50000000000 
		FallForwardAnims 
	} 
ENDSCRIPT

SCRIPT Trolley_BailB 
	GeneralBail { Anim1 = Trolley_BailB BoardOffFrame = 11 Anim2 = GetUpForwards IntoAirFrame = 20 Friction = 15 SmackAnim = Bail_Wall_FWD_Regular 
		Sound = BoardBail01 FoleySound BloodFrame = 20 
		FallBlendPeriod = 1.50000000000 
		FallForwardAnims 
	} 
ENDSCRIPT

SCRIPT GurneyBail 
	GeneralBail { Anim1 = Bail_Manual_BK Endpose = GetUp_Sit_FT IntoAirFrame = 30 Friction = 20 NoBlending BloodFrame = 15 SmackAnim = Bail_Wall_BCK_Low Sound = Bail04 
		BoardOffFrame = 1 BoardVel = VECTOR(0.00000000000, 0.00000000000, 0.00000000000) BoardRotVel = VECTOR(0.00000000000, 0.00000000000, 0.00000000000) BoardSkaterVel = 1 gurney = gurney 
		GroundGoneBail = GroundGoneBail 
		FallBlendPeriod = 1 
		FallBackwardAnims 
	} 
ENDSCRIPT

SCRIPT GeneralBail Friction = 18 Friction2 = 20 HeavyFriction = 100 
	Obj_GetType 
	IF ( <ObjType> = OBJECT_TYPE_PED ) 
		Goto Ped_Skater_BeginBail params = <...> 
		RETURN 
	ENDIF 
	THUGPRO_NetEndRun 
	IF GotParam BoardHideFix 
		SwitchOffBoard 
	ENDIF 
	Obj_SetBoundingSphere 100 
	IF GotParam UnrotateBoardFirst 
		IF BoardIsRotated 
			BoardRotate 
		ENDIF 
	ENDIF 
	IF GotParam NoBailBoard 
		NoBailBoard = 1 
	ENDIF 
	NollieOff 
	PressureOff 
	KillSpecial 
	created_trick_cleanup 
	IF NOT IsTrue GLOBAL_SkaterVoiceOff 
		IF NOT GotParam NoScuff 
			IF SkaterIsNamed skater_shrek 
				PlaySkaterStream type = "bail_" 
			ELSE 
				PlaySkaterStream type = "bail" 
			ENDIF 
		ENDIF 
	ENDIF 
	InBail 
	LaunchStateChangeEvent State = Skater_InBail 
	SetExtraPush radius = 48 speed = 100 rotate = 6 
	IF NOT GotParam dont_face_vel 
		TurnToFaceVelocity 
	ENDIF 
	IF NOT GotParam BoardAlwaysOn 
		IF NOT ( nobails = 1 ) 
			Obj_Spawnscript BailBoardControl params = { BoardOffFrame = <BoardOffFrame> BoardVel = <BoardVel> BoardRotVel = <BoardRotVel> BoardSkaterVel = <BoardSkaterVel> NoBailBoard = <NoBailBoard> gurney = <gurney> } 
		ENDIF 
	ENDIF 
	IF AnimEquals Special_GrafPunk_Idle 
		HandleDoubleCanOff 
	ENDIF 
	SparksOff 
	VibrateOff 
	ClearExceptions 
	DisablePlayerInput AllowCameraControl 
	BailSkaterTricks 
	StopBalanceTrick 
	SetException Ex = CarBail Scr = CarBail 
	IF ( nobails = 1 ) 
		Goto Baildone 
	ENDIF 
	IF GotParam Endpose 
		SetCurrentBailEndpose <Endpose> 
	ELSE 
		SetCurrentBailEndpose 
	ENDIF 
	IF GotParam GroundGoneBail 
		SetException Ex = GroundGone Scr = <GroundGoneBail> params = { <...> } 
	ENDIF 
	IF GotParam SmackAnim 
		SetException Ex = FlailHitWall Scr = BailSmack params = { SmackAnim = <SmackAnim> } 
		SetException Ex = FlailLeft Scr = BailSmack params = { SmackAnim = <SmackAnim> } 
		SetException Ex = FlailRight Scr = BailSmack params = { SmackAnim = <SmackAnim> } 
	ENDIF 
	IF InSlapGame 
		SetException Ex = SkaterCollideBail Scr = SkaterCollideBail 
	ELSE 
		IF GameModeEquals is_firefight 
			SetEventHandler Ex = SkaterCollideBail Scr = Bail_FireFight_SkaterCollideBail 
		ENDIF 
	ENDIF 
	IF GotParam Sound 
	ELSE 
		PlayBonkSound 
	ENDIF 
	IF GotParam NoBlending 
		PlayAnim Anim = <Anim1> NoRestart Blendperiod = 0.00000000000 
	ELSE 
		PlayAnim Anim = <Anim1> NoRestart Blendperiod = 0.30000001192 
	ENDIF 
	IF NOT InSplitscreenGame 
		IF NOT GetGlobalFlag Flag = TAP_BUTTONS_EXPLAINED 
			Create_Panel_Message { text = "Tip: tap buttons to get up faster" 
				id = skater_hint 
				style = skater_hint_style 
				pos = PAIR(320.00000000000, 170.00000000000) 
				rgba = [ 32 75 102 100 ] 
			} 
			SetGlobalFlag Flag = TAP_BUTTONS_EXPLAINED 
			thugpro_save_key_value Key = "TAP_BUTTONS_EXPLAINED" value = 1 
		ENDIF 
	ENDIF 
	IF OnRail 
		Obj_Spawnscript FallOffRail params = { XMove = <XMove> MoveFrames = <MoveFrames> } 
		WaitAnim <IntoAirFrame> frames 
		ClearException GroundGone 
		Vibrate Actuator = 1 Percent = 100 Duration = 0.20000000298 
		IF GotParam BonkSound 
			PlayBonkSound 
		ENDIF 
		IF GotParam Nutter 
			GetSidewaysVector 
			SetSpeed 0 
			BEGIN 
				IF NOT OnRail 
					SetState Air 
					Goto GroundGoneBail params = { <...> } 
				ENDIF 
				wait 1 gameframe 
			REPEAT 20 
			IF Flipped 
				boost = -100 
			ELSE 
				boost = 100 
			ENDIF 
			SetSkaterVelocity vel_x = ( <vel_x> * <boost> ) vel_y = <vel_y> vel_z = ( <vel_z> * <boost> ) 
		ENDIF 
		SetState Air 
		move y = 2.00000000000 
		rotate y = RANDOM_RANGE PAIR(1.00000000000, 20.00000000000) 
		IF GotParam ForceFall 
			Goto GroundGoneBail params = { <...> } 
		ENDIF 
	ENDIF 
	WaitOnGround 
	IF NOT GetGlobalFlag Flag = BLOOD_OFF 
		IF NOT GotParam NoScuff 
			Scuff_skater 
		ENDIF 
		IF GotParam BloodFrame 
			WaitAnim frame <BloodFrame> 
			Obj_Spawnscript BloodSmall 
			Playsound RANDOM(1, 1, 1) RANDOMCASE hitblood01 RANDOMCASE hitblood02 RANDOMCASE hitblood03 RANDOMEND 
		ENDIF 
	ENDIF 
	Vibrate Actuator = 1 Percent = 100 Duration = 0.20000000298 
	SetRollingFriction <HeavyFriction> 
	IF GotParam HitBody 
		Spawnscript HitBody params = { <...> } 
	ENDIF 
	IF NOT GotParam BashOff 
		BashOn 
		IF NOT GoalManager_GoalShouldExpire 
			TantrumOn 
		ENDIF 
	ENDIF 
	wait 3 frames 
	SetRollingFriction <Friction> 
	WaitAnim 30 Percent 
	SpeedCheckStop 
	SetRollingFriction <Friction2> 
	WaitAnim 50 Percent 
	SpeedCheckStop 
	IF GotParam BoardEarlyOn 
		BoardRotate normal 
		SwitchOnBoard 
	ENDIF 
	WaitAnim 75 Percent 
	IF GotParam BoardHideFix 
		SwitchOnBoard 
	ENDIF 
	SpeedCheckStop 
	IF GotParam FoleySound 
	ENDIF 
	Obj_WaitAnimFinished 
	SpeedCheckStop 
	NoQuickGetup 
	IF GotParam Endpose 
		GetTags 
		IF GotParam waitfortantrum 
			RemoveTags tags = [ waitfortantrum ] 
			RETURN 
		ENDIF 
		printf "No tantrum detected heading to endpose" 
		TantrumOff 
		Goto <Endpose> 
	ENDIF 
	Goto Baildone 
ENDSCRIPT

SCRIPT GetSidewaysVector 
	GetSkaterVelocity 
	IF NOT ( <vel_x> = 0 ) 
		atan ( ( <vel_z> * 1.00000000000 ) / ( <vel_x> * 1.00000000000 ) ) 
		angle = <atan> 
		sin ( 90.00000000000 - <angle> ) 
		new_z = <sin> 
		cos ( 90.00000000000 - <angle> ) 
		new_x = <cos> 
	ELSE 
		IF NOT ( <vel_z> = 0 ) 
			new_z = 0.00000000000 
			new_x = 1.00000000000 
		ELSE 
			new_z = 0.00000000000 
			new_x = 0.00000000000 
		ENDIF 
	ENDIF 
	printstruct <...> 
	RETURN { vel_z = <new_z> vel_x = <new_x> vel_y = <vel_y> } 
ENDSCRIPT

SCRIPT bail_quick_getup 
	IF IsTrue THUGPRO_ObserveOn 
		RETURN 
	ENDIF 
	IF ( ( GameModeEquals is_firefight ) | ( GameModeEquals is_king ) | ( GameModeEquals is_ctf ) | ( IsTrue AlreadyEndedRun ) ) 
		RETURN 
	ENDIF 
	Obj_Spawnscript bail_quick_getup2 
ENDSCRIPT

SCRIPT bail_quick_getup2 
	IF NOT Inair 
		SetRollingFriction 40 
		GetCurrentBailEndpose 
		IF NOT ( <current_bail_endpose> = none ) 
			SetCurrentBailEndpose 
			MakeSkaterGoto <current_bail_endpose> params = { Quick = True } 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT TantrumOn 
	EnableInputEvents 
	Obj_Spawnscript TantrumCheck 
ENDSCRIPT

TANTRUM_PRESSES = 0 
SCRIPT TantrumCheck presses = 0 triangle = 0 
	IF ( GetGlobalFlag Flag = TANTRUM_OFF ) 
		RETURN 
	ENDIF 
	root_window : GetSingleTag menu_state 
	IF ( <menu_state> = on ) 
		RETURN 
	ENDIF 
	max = 0 
	count = 0 
	total = 0 
	spazzfactor = 0 
	got_button = 0 
	GetCurrentBailEndpose 
	IF ( <current_bail_endpose> = none ) 
		RETURN 
	ENDIF 
	tantrum_draw_meter 
	OnExitRun kill_tantrum_meter 
	min_spaz = 5 
	max_spaz = 10 
	tantrum_draw_and_update_spazzfactors min = <min_spaz> max = <max_spaz> 
	cleared_bash = 0 
	BEGIN 
		last_spazzfactor = <spazzfactor> 
		GetSpazzFactor 
		IF NOT ( <last_spazzfactor> = <spazzfactor> ) 
			tantrum_meter_update_tags spazzfactor = <spazzfactor> 
		ENDIF 
		IF Held triangle 
			IF NOT ( <got_button> = 1 ) 
				tantrum_meter_maybe_play_sound 
				got_button = 1 
			ENDIF 
			IF ( <cleared_bash> = 0 ) 
				BashOff 
				cleared_bash = 1 
			ENDIF 
		ELSE 
			got_button = 0 
		ENDIF 
		count = ( <count> + 1 ) 
		total = ( <total> + <spazzfactor> ) 
		average = ( ( <total> * 1.00000000000 ) / ( <count> * 1.00000000000 ) ) 
		tantrum_update_meter current = ( <average> * 2.00000000000 ) max = <max_spaz> 
		IF ( <spazzfactor> > <max> ) 
			max = <spazzfactor> 
			ShakeCamera { Duration = 0.10000000149 
				vert_amp = 3.00000000000 
				horiz_amp = 2.00000000000 
				vert_vel = 5 
				horiz_vel = 5 
			} 
		ENDIF 
		IF ( ( <average> * 2.00000000000 ) > <max_spaz> ) 
			SetTags waitfortantrum = 1 
			tantrum_update_meter current = ( <average> * 2.00000000000 ) max = <max_spaz> maxedOut 
			Obj_WaitAnimFinished 
			BREAK 
		ENDIF 
		IF AnimFinished 
			BREAK 
		ENDIF 
		wait 1 gameframe 
	REPEAT 
	final_spazz = ( <average> * 2.00000000000 ) 
	GetHighestTantrumReached spazzfactor = <final_spazz> 
	IF NOT ( <tantrum> < 0 ) 
		Goto TantrumStart params = { spazzfactor = <tantrum> } 
	ENDIF 
ENDSCRIPT

SCRIPT kill_tantrum_meter 
	tantrum_draw_meter die 
ENDSCRIPT

SCRIPT TantrumStart 
	printf "TantrumStart" 
	BashOff 
	RemoveTags tags = [ waitfortantrum ] 
	SpawnSound ALL_SFX_Wait_Before_Tantrum_Stream 
	IF NOT IsStreamPlaying SK6_Teapot_Sign_Whistle 
		PlayStream SK6_Teapot_Sign_Whistle vol = 50 priority = StreamPriorityHigh 
	ENDIF 
	ShakeCamera { Duration = 0.50000000000 
		vert_amp = 10.00000000000 
		horiz_amp = 10.00000000000 
		vert_vel = 5 
		horiz_vel = 5 
	} 
	SetSkaterCamOverride heading = 2 tilt = -0.30000001192 time = 1 zoom = 1.29999995232 
	Playsound GotStat04 Pitch = 80 vol = 500 
	IF SkaterLastScoreLandedLessThan 5000 
		maxscore = 2000.00000000000 
		minscore = 1000.00000000000 
	ELSE 
		maxscore = 3500.00000000000 
		minscore = 2000.00000000000 
	ENDIF 
	IF ( <spazzfactor> = 99 ) 
		GetArraySize tantrum_array 
		rank = ( tantrum_array [ ( <array_size> -1 ) ] . spazzfactor ) 
	ELSE 
		rank = <spazzfactor> 
	ENDIF 
	score = ( <minscore> + ( ( <rank> / 5.00000000000 ) * ( <maxscore> - <minscore> ) ) ) 
	CastToInteger score 
	SetTrickScore <score> 
	SetTrickName ( spazz_out_text ) 
	Display BlockSpin 
	SkaterGetScoreInfo 
	IF ( <scorepot> > 3000 ) 
		ForceSpecial 
	ENDIF 
	GetCurrentBailEndpose 
	IF NOT ( <current_bail_endpose> = none ) 
		SetCurrentBailEndpose 
		MakeSkaterGoto <current_bail_endpose> params = { tantrum = True spazzfactor = <spazzfactor> score = <scorepot> } 
	ENDIF 
ENDSCRIPT

SCRIPT tantrum_maybe_force_land 
	Obj_Spawnscript tantrum_maybe_force_land2 params = { score = <score> } 
ENDSCRIPT

SCRIPT tantrum_maybe_force_land2 
	BEGIN 
		IF CurrentScorePotGreaterThan <score> 
			RETURN 
		ENDIF 
		IF DoingTrick 
			RETURN 
		ENDIF 
		wait 1 gameframe 
	REPEAT 120 
	LandSkaterTricks 
ENDSCRIPT

SCRIPT TantrumOff 
	Obj_GetId 
	TerminateObjectsScripts id = <Objid> script_name = TantrumCheck 
	ClearSkaterCamOverride 
	tantrum_draw_meter die 
ENDSCRIPT

SCRIPT Getup_HK_FT 
	printf "Get up from HK_FT" 
	NoQuickGetup 
	IF GotParam Quick 
		printf "Got a Quick Getup Signal" 
		Goto startskate params = { Quick = GetUp_HK_FT_Q rolling_Fr = 3 wait_percent = 50 } 
	ENDIF 
	IF GotParam tantrum 
		Choose_Tantrum getup = Ft spazzfactor = <spazzfactor> score = <score> 
	ENDIF 
	printf "No Tantrum Signal" 
	PlayAnim Anim = Getup_HK_FT Blendperiod = 0.00000000000 
	Obj_WaitAnimFinished 
	Goto startskate 
ENDSCRIPT

SCRIPT Getup_HK_BK 
	printf "Get up from HK_BK" 
	NoQuickGetup 
	IF GotParam Quick 
		printf "Got a Quick Getup Signal" 
		Goto startskate params = { Quick = GetUp_S_RunJump rolling_Fr = 3 wait_percent = 40 } 
	ENDIF 
	IF GotParam tantrum 
		Choose_Tantrum getup = Bk spazzfactor = <spazzfactor> score = <score> 
	ENDIF 
	printf "No Tantrum Signal" 
	PlayAnim Anim = Getup_HK_BK Blendperiod = 0.00000000000 
	Obj_WaitAnimFinished 
	Goto startskate 
ENDSCRIPT

SCRIPT Getup_HK_Rt 
	printf "Get up from HK_RT" 
	NoQuickGetup 
	IF GotParam Quick 
		printf "Got a Quick Getup Signal" 
		Goto startskate params = { Quick = GetUp_S_RunJump rolling_Fr = 3 wait_percent = 40 } 
	ENDIF 
	IF GotParam tantrum 
		Choose_Tantrum getup = Rt spazzfactor = <spazzfactor> score = <score> 
	ELSE 
		printf "No Tantrum Signal" 
		PlayAnim Anim = Getup_HK_Rt Blendperiod = 0.00000000000 
		Obj_WaitAnimFinished 
		Goto startskate 
	ENDIF 
ENDSCRIPT

SCRIPT Getup_HK_Lt 
	printf "Get up from HK_LT" 
	NoQuickGetup 
	IF GotParam Quick 
		printf "Got a Quick Getup Signal" 
		Goto startskate params = { Quick = GetUp_S_BoardCatch1 rolling_Fr = 3 wait_percent = 66 } 
	ENDIF 
	IF GotParam tantrum 
		Choose_Tantrum getup = Lt spazzfactor = <spazzfactor> score = <score> 
	ELSE 
		printf "No Tantrum Signal" 
		PlayAnim Anim = Getup_HK_Lt Blendperiod = 0.00000000000 
		Obj_WaitAnimFinished 
		Goto startskate 
	ENDIF 
ENDSCRIPT

SCRIPT GetUp_Sit_FT 
	printf "Get up from Sit_Ft" 
	NoQuickGetup 
	IF GotParam Quick 
		printf "Got a Quick Getup Signal" 
		Goto startskate params = { Quick = GetUp_Sit_Ft_Q rolling_Fr = 3 wait_percent = 50 } 
	ENDIF 
	IF GotParam tantrum 
		Choose_Tantrum getup = Sit_Ft spazzfactor = <spazzfactor> score = <score> 
	ELSE 
		printf "No Tantrum Signal" 
		PlayAnim Anim = GetUp_Sit_FT Blendperiod = 0.00000000000 
		Obj_WaitAnimFinished 
		Goto startskate 
	ENDIF 
ENDSCRIPT

StartSkateExceptionTable = [ 
	{ Exception Ex = FlailHitWall Scr = FlailHitWall } 
	{ Exception Ex = GroundGone Scr = BailGroundGone } 
] 
SCRIPT startskate 
	printf "StartSkating" 
	NoQuickGetup 
	TantrumOff 
	ExitTantrum 
	IF NOT ProfileEquals is_named = maul 
		SwitchOnBoard 
	ELSE 
		IF NOT GotParam Quick 
			SwitchOnBoard 
		ENDIF 
	ENDIF 
	BoardRotate normal 
	IF ObjectExists id = BurnMoFo 
		BurnMoFo : Unhide 
	ENDIF 
	IF ObjectExists id = SmokeyMoFo 
		SmokeyMoFo : Unhide 
	ENDIF 
	OnExceptionRun 
	ResetEventHandlersFromTable StartSkateExceptionTable 
	IF IsTrue AlreadyEndedRun 
		Goto SlowSkaterToStop 
	ENDIF 
	IF Obj_FlagSet FLAG_SKATER_IN_NEUROPLANT 
		drop = 1 
		gotoBrake = gotoBrake 
	ENDIF 
	IF GotParam Quick 
		printf "Starting Quick" 
		IF ProfileEquals is_named = maul 
			PlayAnim Anim = GetUpDarthMaul Blendperiod = 0.00000000000 
			WaitAnim 50 Percent 
			SwitchOnBoard 
		ELSE 
			PlayAnim Anim = <Quick> Blendperiod = 0.00000000000 
		ENDIF 
		wait_percent = <wait_percent> 
		rolling_Fr = <rolling_Fr> 
	ELSE 
		IF GotParam drop 
			PlayAnim Anim = GetUp_S_NoPushOff Blendperiod = 0.00000000000 
			rolling_Fr = 15 
		ELSE 
			IF IsFacingVert 
				printf "Facing Vert" 
				PlayAnim Anim = GetUp_S_RunJump Blendperiod = 0.00000000000 
				wait_percent = 30 
				rolling_Fr = 6 
			ELSE 
				printf "Starting Regular" 
				RANDOM_NO_REPEAT(1, 1, 1) 
					RANDOMCASE PlayAnim Anim = GetUp_S_RunJump Blendperiod = 0.00000000000 
					wait_percent = 40 
					rolling_Fr = 6 
					RANDOMCASE PlayAnim Anim = GetUp_S_BoardFlip1 Blendperiod = 0.00000000000 
					wait_percent = 95 
					rolling_Fr = 6 
					RANDOMCASE PlayAnim Anim = GetUp_S_BoardCatch1 Blendperiod = 0.00000000000 
					wait_percent = 66 
					rolling_Fr = 6 
				RANDOMEND 
			ENDIF 
		ENDIF 
	ENDIF 
	IF GotParam wait_percent 
		printf "Start Waiting wait_percent = %i" i = <wait_percent> 
		WaitAnim <wait_percent> Percent 
		printf "End Waiting" 
	ELSE 
		IF GotParam wait_frames 
			animfinished_or_waitedframes frames = <wait_frames> 
		ELSE 
			Obj_WaitAnimFinished 
		ENDIF 
	ENDIF 
	IF GotParam rolling_Fr 
		printf "Rolling_FR" 
		SetRollingFriction <rolling_Fr> 
	ELSE 
		SetRollingFriction default 
	ENDIF 
	VibrateOff 
	EnablePlayerInput 
	Obj_WaitAnimFinished 
	IF GotParam tantrum_score 
		tantrum_maybe_force_land score = <tantrum_score> 
	ENDIF 
	Goto Baildone 
ENDSCRIPT

SCRIPT animfinished_or_waitedframes 
	BEGIN 
		IF AnimFinished 
			BREAK 
		ENDIF 
		wait 1 gameframe 
	REPEAT <frames> 
ENDSCRIPT

SCRIPT Choose_Tantrum 
	printf "Got a Tantrum Signal" 
	EnterTantrum 
	IF NOT GotParam spazzfactor 
		printf "Choose_Tantrum missing spazzfactor param" 
		RETURN 
	ENDIF 
	SWITCH <getup> 
		CASE Ft 
			Anim1 = Getup_HK_FT 
			Anim2 = GetUp_HK_FT_T 
		CASE Bk 
			Anim1 = Getup_HK_BK 
			Anim2 = GetUp_HK_Bk_T 
		CASE Rt 
			Anim1 = Getup_HK_Rt 
			Anim2 = GetUp_HK_Rt_T 
		CASE Lt 
			Anim1 = Getup_HK_Lt 
			Anim2 = GetUp_HK_Lt_T 
		CASE Sit_Ft 
			Anim1 = GetUp_Sit_FT 
			Anim2 = GetUp_Sit_Ft_T 
		DEFAULT 
			printf "Choose_Tantrum missing getup param" 
	ENDSWITCH 
	IF ( ( <spazzfactor> = 1 ) | ( <spazzfactor> = 4 ) | ( <spazzfactor> = 5 ) ) 
		IF NOT ArrayContains array = board_allow_break contains = ( g_current_skater_board_type ) 
			<spazzfactor> = 0 
		ENDIF 
	ENDIF 
	IF ( <spazzfactor> > 1 ) 
		SwitchOnBoard 
		PlayAnim Anim = <Anim2> Blendperiod = 0.00000000000 
	ELSE 
		PlayAnim Anim = <Anim1> Blendperiod = 0.00000000000 
	ENDIF 
	Obj_WaitAnimFinished 
	SwitchOnBoard 
	BoardRotate normal 
	IF ( <spazzfactor> = 99 ) 
		Goto RANDOM(1, 1) RANDOMCASE skaterExplode RANDOMCASE skaterLoseHead RANDOMEND params = { score = <score> } 
	ELSE 
		IF StructureContains structure = ( ( tantrum_array ) [ <spazzfactor> ] ) name 
			Goto ( ( tantrum_array [ <spazzfactor> ] ) . name ) params = { score = <score> } 
		ENDIF 
	ENDIF 
ENDSCRIPT

tantrum_array = [ 
	{ name = KickBoard } 
	{ name = BoardFocus } 
	{ name = Slingshot } 
	{ name = DiscusThrow } 
	{ name = PileDriver } 
	{ name = HeadButt } 
] 
SCRIPT DiscusThrow 
	PlayAnim Anim = Tantrum_DiscusStart Blendperiod = 0.00000000000 
	Obj_WaitAnimFinished 
	PlayAnim Anim = Tantrum_DiscusFinish Blendperiod = 0.00000000000 
	Obj_Spawnscript BailBoardControl params = { BoardOffFrame = 38 BoardVel = VECTOR(0.00000000000, 500.00000000000, 1000.00000000000) BoardRotVel = VECTOR(0.00000000000, 15.00000000000, 0.00000000000) BoardSkaterVel = 0 tantrum = tantrum } 
	Obj_WaitAnimFinished 
	Goto startskate params = { tantrum_score = <score> } 
ENDSCRIPT

SCRIPT HeadButt 
	IF SkaterIsNamed chainsawskater 
		Goto DiscusThrow params = <...> 
		RETURN 
	ENDIF 
	PlayAnim Anim = Tantrum_HeadButt Blendperiod = 0.00000000000 
	Obj_WaitAnimFinished 
	Goto startskate params = { tantrum_score = <score> } 
ENDSCRIPT

SCRIPT PileDriver 
	IF SkaterIsNamed chainsawskater 
		Goto Slingshot params = <...> 
		RETURN 
	ENDIF 
	PlayAnim Anim = Tantrum_PileDriver Blendperiod = 0.00000000000 
	Obj_WaitAnimFinished 
	Goto startskate params = { tantrum_score = <score> } 
ENDSCRIPT

SCRIPT Slingshot 
	PlayAnim Anim = Tantrum_slingshot Blendperiod = 0.00000000000 
	IF Flipped 
		Obj_Spawnscript BailBoardControl params = { BoardOffFrame = 42 BoardVel = VECTOR(-800.00000000000, 400.00000000000, -600.00000000000) BoardRotVel = VECTOR(10.00000000000, 0.00000000000, 0.00000000000) BoardSkaterVel = 0 tantrum = tantrum } 
	ELSE 
		Obj_Spawnscript BailBoardControl params = { BoardOffFrame = 42 BoardVel = VECTOR(800.00000000000, 400.00000000000, -600.00000000000) BoardRotVel = VECTOR(-10.00000000000, 0.00000000000, 0.00000000000) BoardSkaterVel = 0 tantrum = tantrum } 
	ENDIF 
	Obj_WaitAnimFinished 
	Goto startskate params = { tantrum_score = <score> } 
ENDSCRIPT

SCRIPT BoardFocus 
	IF SkaterIsNamed chainsawskater 
		Goto KickBoard params = <...> 
		RETURN 
	ENDIF 
	PlayAnim Anim = Tantrum_BoardFocus Blendperiod = 0.00000000000 
	Obj_WaitAnimFinished 
	Goto startskate params = { tantrum_score = <score> } 
ENDSCRIPT

SCRIPT KickBoard 
	PlayAnim Anim = Tantrum_KickBoard Blendperiod = 0.00000000000 
	wait 50 gameframes 
	Obj_Spawnscript BailBoardControl params = { BoardOffFrame = 0 BoardVel = VECTOR(0.00000000000, 500.00000000000, 1000.00000000000) BoardRotVel = VECTOR(0.00000000000, 15.00000000000, -10.00000000000) BoardSkaterVel = 0 tantrum = tantrum } 
	Obj_WaitAnimFinished 
	Goto startskate params = { tantrum_score = <score> } 
ENDSCRIPT

SCRIPT skaterExplode 
	PlayAnim Anim = WStandIdle1 speed = 2.00000000000 
	Obj_WaitAnimFinished 
	Obj_Spawnscript BailBoardControl params = { BoardOffFrame = 0 BoardVel = VECTOR(0.00000000000, 0.00000000000, 0.00000000000) BoardRotVel = VECTOR(0.00000000000, 0.00000000000, 0.00000000000) BoardSkaterVel = 0 tantrum = tantrum } 
	make_skater_explode 
	Obj_GetId 
	MangleChecksums a = TantrumBoard b = <Objid> 
	IF ObjectExists id = <mangled_id> 
		<mangled_id> : die 
	ENDIF 
	Goto startskate params = { tantrum_score = <score> } 
ENDSCRIPT

SCRIPT skaterLoseHead 
	IF SkaterIsNamed chainsawskater 
		Goto skaterExplode params = <...> 
		RETURN 
	ENDIF 
	PlayAnim Anim = Tantrum_HeadButt 
	WaitAnim 22 Percent 
	Obj_Spawnscript BailBoardControl params = { BoardOffFrame = 0 BoardVel = VECTOR(0.00000000000, 0.00000000000, 0.00000000000) BoardRotVel = VECTOR(0.00000000000, 0.00000000000, 0.00000000000) BoardSkaterVel = 0 tantrum = tantrum } 
	make_skater_lose_head 
	Obj_GetId 
	MangleChecksums a = TantrumBoard b = <Objid> 
	IF ObjectExists id = <mangled_id> 
		<mangled_id> : die 
	ENDIF 
	Goto startskate params = { tantrum_score = <score> } 
ENDSCRIPT

SCRIPT FallOffRail XMove = 5 MoveFrames = 0 
	BEGIN 
		IF Flipped 
			length = ( <XMove> / 12 ) 
		ELSE 
			length = ( -1 * ( <XMove> / 12 ) ) 
		ENDIF 
		IF NOT Obj_GetCollision height = 3 length = <length> side 
			IF NOT Obj_GetCollision height = 0.50000000000 length = <length> side 
				BREAK 
			ENDIF 
		ENDIF 
		XMove = ( <XMove> / 2 ) 
		IF ( 12 > <XMove> ) 
			RETURN 
		ENDIF 
	REPEAT 
	movetime = ( <MoveFrames> * 1.00000000000 ) 
	IF ( <MoveFrames> > 0 ) 
		slicedmove = ( <XMove> / <movetime> ) 
		IF NOT Flipped 
			slicedmove = ( <slicedmove> * -1.00000000000 ) 
		ENDIF 
		BEGIN 
			move x = <slicedmove> 
			wait 1 frame 
		REPEAT <MoveFrames> 
	ELSE 
		move x = <XMove> 
	ENDIF 
ENDSCRIPT

SCRIPT Scuff_skater 
	<scuffspot> = RANDOM_RANGE PAIR(0.00000000000, 4.00000000000) 
	IF ( <scuffspot> > 3 ) 
	ELSE 
		IF ( <scuffspot> = 3 ) 
			Scuff_DoReplacement src = "CS_NH_scar_armR.png" scuffspot = <scuffspot> 
		ELSE 
			IF ( <scuffspot> = 2 ) 
				Scuff_DoReplacement src = "CS_NH_scar_armL.png" scuffspot = <scuffspot> 
			ELSE 
				IF ( <scuffspot> = 1 ) 
					Scuff_DoReplacement src = "CS_NH_scar_legR.png" src2 = "CS_NH_scuff_legR.png" scuffspot = <scuffspot> 
				ELSE 
					Scuff_DoReplacement src = "CS_NH_scar_legL.png" src2 = "CS_NH_scuff_legL.png" scuffspot = <scuffspot> 
				ENDIF 
			ENDIF 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT Scuff_DoReplacement leftknee = 0 rightknee = 0 rightelbow = 0 leftelbow = 0 
	GetTags 
	SWITCH <scuffspot> 
		CASE 0 
			leftknee = ( <leftknee> + 1 ) 
			bailcount = <leftknee> 
		CASE 1 
			rightknee = ( <rightknee> + 1 ) 
			bailcount = <rightknee> 
		CASE 2 
			leftelbow = ( <leftelbow> + 1 ) 
			bailcount = <leftelbow> 
		CASE 3 
			rightelbow = ( <rightelbow> + 1 ) 
			bailcount = <rightelbow> 
	ENDSWITCH 
	SetTags leftknee = <leftknee> rightknee = <rightknee> leftelbow = <leftelbow> rightelbow = <rightelbow> 
	IF GetGlobalFlag Flag = CHEAT_SUPER_BLOOD 
		bailcount = ( <bailcount> + 5 ) 
	ENDIF 
	IF GotParam src2 
		IF ( <bailcount> > 4 ) 
			Obj_ReplaceTexture src = <src> dest = "textures/scuffs/CS_NH_scar_06" 
		ELSE 
			IF ( <bailcount> > 10 ) 
				Obj_ReplaceTexture src = <src> dest = "textures/scuffs/CS_NH_scar_05" 
			ELSE 
				IF ( <bailcount> > 9 ) 
					Obj_ReplaceTexture src = <src> dest = "textures/scuffs/CS_NH_scar_04" 
					Obj_ReplaceTexture src = <src2> dest = "textures/scuffs/CS_NH_scuff_05" 
				ELSE 
					IF ( <bailcount> > 7 ) 
						Obj_ReplaceTexture src = <src> dest = "textures/scuffs/CS_NH_scar_03" 
					ELSE 
						IF ( <bailcount> > 6 ) 
							Obj_ReplaceTexture src = <src2> dest = "textures/scuffs/CS_NH_scar_02" 
						ELSE 
							IF ( <bailcount> > 5 ) 
								Obj_ReplaceTexture src = <src2> dest = "textures/scuffs/CS_NH_scuff_04" 
								Obj_ReplaceTexture src = <src> dest = "textures/scuffs/CS_NH_scar_01" 
							ELSE 
								IF ( <bailcount> > 3 ) 
									Obj_ReplaceTexture src = <src2> dest = "textures/scuffs/CS_NH_scuff_03" 
								ELSE 
									IF ( <bailcount> > 1 ) 
										Obj_ReplaceTexture src = <src2> dest = "textures/scuffs/CS_NH_scuff_02" 
									ELSE 
										Obj_ReplaceTexture src = <src2> dest = "textures/scuffs/CS_NH_scuff_01" 
									ENDIF 
								ENDIF 
							ENDIF 
						ENDIF 
					ENDIF 
				ENDIF 
			ENDIF 
		ENDIF 
	ELSE 
		IF ( <bailcount> > 11 ) 
			Obj_ReplaceTexture src = <src> dest = "textures/scuffs/CS_NH_scar_06" 
		ELSE 
			IF ( <bailcount> > 9 ) 
				Obj_ReplaceTexture src = <src> dest = "textures/scuffs/CS_NH_scar_05" 
			ELSE 
				IF ( <bailcount> > 7 ) 
					Obj_ReplaceTexture src = <src> dest = "textures/scuffs/CS_NH_scar_04" 
				ELSE 
					IF ( <bailcount> > 5 ) 
						Obj_ReplaceTexture src = <src> dest = "textures/scuffs/CS_NH_scar_03" 
					ELSE 
						IF ( <bailcount> > 3 ) 
							Obj_ReplaceTexture src = <src> dest = "textures/scuffs/CS_NH_scar_02" 
						ELSE 
							Obj_ReplaceTexture src = <src> dest = "textures/scuffs/CS_NH_scar_01" 
						ENDIF 
					ENDIF 
				ENDIF 
			ENDIF 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT CleanUp_Scuffs 
	Obj_ReplaceTexture src = "CS_NH_scar_armR.png" dest = "textures/scuffs/CS_NH_scar_armR" 
	Obj_ReplaceTexture src = "CS_NH_scar_armL.png" dest = "textures/scuffs/CS_NH_scar_armL" 
	Obj_ReplaceTexture src = "CS_NH_scar_legR.png" dest = "textures/scuffs/CS_NH_scar_legR" 
	Obj_ReplaceTexture src = "CS_NH_scar_legL.png" dest = "textures/scuffs/CS_NH_scar_legL" 
	Obj_ReplaceTexture src = "CS_NH_scuff_legR.png" dest = "textures/scuffs/CS_NH_scuff_legR" 
	Obj_ReplaceTexture src = "CS_NH_scuff_legL.png" dest = "textures/scuffs/CS_NH_scuff_legL" 
	Obj_ReplaceTexture src = "CS_NN_board_trans01.png" dest = "textures/scuffs/CS_NN_board_trans01" 
	SetTags leftknee = 0 rightknee = 0 rightelbow = 0 leftelbow = 0 
ENDSCRIPT

SCRIPT DoBoardScuff 
	SWITCH <boardscuff> 
		CASE 10 
			Obj_ReplaceTexture src = "CS_NN_board_trans01.png" dest = "textures/scuffs/CS_NN_boardscuff_01" 
		CASE 20 
			Obj_ReplaceTexture src = "CS_NN_board_trans01.png" dest = "textures/scuffs/CS_NN_boardscuff_02" 
		CASE 30 
			Obj_ReplaceTexture src = "CS_NN_board_trans01.png" dest = "textures/scuffs/CS_NN_boardscuff_03" 
		CASE 40 
			Obj_ReplaceTexture src = "CS_NN_board_trans01.png" dest = "textures/scuffs/CS_NN_boardscuff_04" 
		DEFAULT 
	ENDSWITCH 
ENDSCRIPT

SCRIPT BailBoardControl BoardOffFrame = 5 
	wait <BoardOffFrame> frames 
	SwitchOffBoard 
	IF ObjectExists id = BurnMoFo 
		BurnMoFo : Hide 
	ENDIF 
	IF ObjectExists id = SmokeyMoFo 
		SmokeyMoFo : Hide 
	ENDIF 
	IF NOT GotParam NoBailBoard 
		CreateBailBoard vel = <BoardVel> rotvel = <BoardRotVel> object_vel_factor = <BoardSkaterVel> gurney = <gurney> tantrum = <tantrum> 
	ENDIF 
ENDSCRIPT

SCRIPT SpeedCheckStop 
	IF SpeedLessThan 300 
		SetRollingFriction 100 
	ENDIF 
ENDSCRIPT

SCRIPT HitBody hitbodyframe = 15 
	wait <hitbodyframe> frames 
ENDSCRIPT

SCRIPT BailSmack SmackAnim = Bail_Wall_FWD_Regular SmackFriction = 55 
	printf "Bail Smack" 
	IF InSlapGame 
		SetException Ex = SkaterCollideBail Scr = SkaterCollideBail 
	ELSE 
		IF GameModeEquals is_firefight 
			SetEventHandler Ex = SkaterCollideBail Scr = Bail_FireFight_SkaterCollideBail 
		ENDIF 
	ENDIF 
	SwitchOffBoard 
	SetRollingFriction <SmackFriction> 
	PlayAnim Anim = <SmackAnim> Blendperiod = 0.10000000149 
	Obj_Spawnscript BloodTiny 
	Vibrate Actuator = 1 Percent = 100 Duration = 0.20000000298 
	Obj_WaitAnimFinished 
	SWITCH <SmackAnim> 
		CASE Bail_Wall_FWD_Regular 
			printf "WallSmack FWD" 
			Goto GetUp_Sit_FT 
		CASE Bail_Wall_FWD_Low 
			printf "WallSmack FWD_Low" 
			Goto Getup_HK_Rt 
		CASE Bail_Wall_BCK_Regular 
			printf "WallSmack BCK" 
			Goto Getup_HK_BK 
		CASE Bail_Wall_BCK_Low 
			printf "WallSmack BCK_Low" 
			Goto Getup_HK_BK 
		CASE Bail_Wall_LT_Low 
			printf "WallSmack LT" 
			Goto Getup_HK_Lt 
		CASE Bail_Wall_RT_Low 
			printf "WallSmack RT" 
			Goto Getup_HK_Rt 
	ENDSWITCH 
	printf "*******************If you see this Tell Jason G YOu got an Old Smack Wall Anim**********************" 
	IF AnimEquals Smackwall 
		PlayAnim Anim = GetUpFacesmash Blendperiod = 0.10000000149 
	ELSE 
		IF AnimEquals Smackwallupright 
			PlayAnim Anim = GetUpBackwards Blendperiod = 0.10000000149 
		ELSE 
			PlayAnim Anim = GetUpFacing Blendperiod = 0.10000000149 
		ENDIF 
	ENDIF 
	SetRollingFriction 15 
	WaitAnim 80 Percent 
	SwitchOnBoard 
	BoardRotate normal 
	Obj_WaitAnimFinished 
	Goto Baildone 
ENDSCRIPT

SCRIPT GroundGoneBail SplatFriction = 100 FallBlendPeriod = 0.30000001192 
	IF NOT GotParam AnimFall1 
		AnimFall1 = Bail_Falling_Idle_FWD 
	ENDIF 
	IF NOT GotParam AnimFall2 
		AnimFall2 = Bail_falling_hit_med_Fwd 
	ENDIF 
	InBail 
	ClearExceptions 
	IF InSlapGame 
		SetException Ex = SkaterCollideBail Scr = SkaterCollideBail 
	ELSE 
		IF GameModeEquals is_firefight 
			SetEventHandler Ex = SkaterCollideBail Scr = Bail_FireFight_SkaterCollideBail 
		ENDIF 
	ENDIF 
	DisablePlayerInput AllowCameraControl 
	SetExtraPush radius = 48 speed = 100 rotate = 6 
	SwitchOffBoard 
	PlayAnim Anim = <AnimFall1> NoRestart Blendperiod = <FallBlendPeriod> 
	BEGIN 
		IF AnimFinished 
			PlayAnim Anim = <AnimFall1> PingPong From = End To = 20 speed = 0.50000000000 Blendperiod = 0.10000000149 
		ENDIF 
		IF OnGround 
			BREAK 
		ENDIF 
		WaitOneGameFrame 
	REPEAT 
	Vibrate Actuator = 1 Percent = 100 Duration = 0.20000000298 
	IF NOT GotParam NoBlood 
		Obj_Spawnscript BloodTiny 
	ENDIF 
	SetRollingFriction <SplatFriction> 
	IF AirTimeLessThan 0.85000002384 second 
		printf "Soft Landing" 
		PlayAnim Anim = <AnimFall2> NoRestart Blendperiod = 0.10000000149 
		Vibrate Actuator = 1 Percent = 100 Duration = 0.20000000298 
		IF NOT GetGlobalFlag Flag = BLOOD_OFF 
			IF GotParam SplatBloodFrame 
				WaitAnim frame <SplatBloodFrame> 
			ENDIF 
			Obj_Spawnscript BloodSmall 
			Playsound RANDOM(1, 1, 1) RANDOMCASE hitblood01 RANDOMCASE hitblood02 RANDOMCASE hitblood03 RANDOMEND 
		ENDIF 
	ELSE 
		printf "Hard Landing" 
		IF GotParam AnimFall2Hard 
			PlayAnim Anim = <AnimFall2Hard> NoRestart Blendperiod = 0.10000000149 
		ELSE 
			PlayAnim Anim = <AnimFall2> NoRestart Blendperiod = 0.10000000149 
		ENDIF 
		Vibrate Actuator = 1 Percent = 100 Duration = 0.30000001192 
		IF NOT GetGlobalFlag Flag = BLOOD_OFF 
			IF GotParam SplatBloodFrame 
				WaitAnim frame <SplatBloodFrame> 
			ENDIF 
			Obj_Spawnscript BloodSmall 
			Playsound RANDOM(1, 1, 1) RANDOMCASE hitblood01 RANDOMCASE hitblood02 RANDOMCASE hitblood03 RANDOMEND 
		ENDIF 
	ENDIF 
	BashOn 
	IF GotParam AnimFallEnd 
		Obj_WaitAnimFinished 
		Goto <AnimFallEnd> 
	ENDIF 
	IF GotParam AnimFall3 
		printf ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>--- If you see this tell Jason G you got an AnimFall3!!! ---<<<<<<<<<<<<<<<<<<<<<<<<<<<<" 
		Obj_WaitAnimFinished 
		PlayAnim Anim = <AnimFall3> NoRestart Blendperiod = 0.10000000149 
	ENDIF 
	WaitAnim 20 frames fromend 
	BoardRotate normal 
	SwitchOnBoard 
	Obj_WaitAnimFinished 
	Goto Baildone 
ENDSCRIPT

SCRIPT Baildone 
	printf "BailDone" 
	Obj_RestoreBoundingSphere 
	ClearLipCombos 
	NotifyBailDone 
	SetExtraPush radius = 0 
	SetRollingFriction default 
	ClearTrickQueue 
	ClearEventBuffer 
	ClearManualTrick 
	BashOff 
	ClearQuickGetup 
	TantrumOff 
	KillExtraTricks 
	EnablePlayerInput 
	NotInBail 
	ClearGapTricks 
	ClearSkaterFlags 
	LockVelocityDirection Off 
	RestoreAutoKick 
	CanBrakeOn 
	FireEvent type = finished_bailing 
	IF IsTrue AlreadyEndedRun 
		Goto SlowSkaterToStop 
	ENDIF 
	IF NOT Walking 
		Goto OnGroundAI 
	ENDIF 
ENDSCRIPT

SCRIPT BloodOn size = 1 radius = 1 name = blood_01 
	TextureSplat radius = RANDOM_RANGE PAIR(1.00000000000, 40.00000000000) size = <size> bone = bone_head name = <name> lifetime = 20 
ENDSCRIPT

SCRIPT BloodOn_Down size = 1 radius = 1 name = blood_01 
	TextureSplat radius = RANDOM_RANGE PAIR(10.00000000000, 300.00000000000) size = <size> bone = bone_head name = <name> dropdown_length = 100 dropdown_vertical lifetime = 20 
ENDSCRIPT

SCRIPT BloodCar 
	wait 30 frames 
	TextureSplat radius = 2 size = 20 bone = bone_head name = blood_01 lifetime = 20 
ENDSCRIPT

SCRIPT BloodJackAss 
	IF NOT GetGlobalFlag Flag = BLOOD_OFF 
		wait 30 frames 
		printf "MAKING SOME BIG BLOOD..............." 
		BloodOn_Down size = RANDOM_RANGE PAIR(8.00000000000, 15.00000000000) 
		BloodOn_Down size = RANDOM_RANGE PAIR(8.00000000000, 15.00000000000) 
		wait RANDOM_RANGE PAIR(1.00000000000, 8.00000000000) frames 
		BloodOn_Down <...> size = RANDOM_RANGE PAIR(6.00000000000, 12.00000000000) 
		BloodOn_Down <...> size = RANDOM_RANGE PAIR(6.00000000000, 12.00000000000) 
		wait RANDOM_RANGE PAIR(1.00000000000, 8.00000000000) frames 
		BloodOn_Down <...> size = RANDOM_RANGE PAIR(4.00000000000, 8.00000000000) 
		BloodOn_Down <...> size = RANDOM_RANGE PAIR(4.00000000000, 8.00000000000) 
		wait RANDOM_RANGE PAIR(1.00000000000, 8.00000000000) frames 
		BloodOn_Down size = RANDOM_RANGE PAIR(2.00000000000, 6.00000000000) 
	ENDIF 
ENDSCRIPT

SCRIPT BloodSmall 
	IF NOT GetGlobalFlag Flag = BLOOD_OFF 
		IF NOT GetGlobalFlag Flag = CHEAT_SUPER_BLOOD 
			IF OnGround 
				Obj_Spawnscript BloodSplat 
			ENDIF 
			wait 14 frames 
			BloodOn <...> size = RANDOM_RANGE PAIR(8.00000000000, 12.00000000000) freq = 2.00000000000 rnd_radius = 36 
			wait RANDOM_RANGE PAIR(1.00000000000, 3.00000000000) frames 
			BloodOn <...> size = RANDOM_RANGE PAIR(6.00000000000, 10.00000000000) freq = 2.00000000000 rnd_radius = 36 
			wait RANDOM_RANGE PAIR(1.00000000000, 3.00000000000) frames 
			BloodOn <...> size = RANDOM_RANGE PAIR(4.00000000000, 8.00000000000) freq = 0.80000001192 rnd_radius = 36 
			wait RANDOM_RANGE PAIR(1.00000000000, 3.00000000000) frames 
			BloodOn size = RANDOM_RANGE PAIR(2.00000000000, 6.00000000000) 
		ELSE 
			Obj_Spawnscript BloodSplat 
			wait 14 frames 
			Obj_Spawnscript BloodSplat 
			TextureSplat radius = RANDOM_RANGE PAIR(20.00000000000, 40.00000000000) size = RANDOM_RANGE PAIR(30.00000000000, 40.00000000000) bone = bone_head name = blood_01 lifetime = 20 
			wait 5 frame 
			BloodOn <...> size = RANDOM_RANGE PAIR(15.00000000000, 20.00000000000) 
			wait 4 frame 
			BloodOn <...> size = RANDOM_RANGE PAIR(10.00000000000, 15.00000000000) 
			wait 4 frame 
			BloodOn <...> size = RANDOM_RANGE PAIR(10.00000000000, 15.00000000000) 
			wait 3 frames 
			BloodOn size = RANDOM_RANGE PAIR(6.00000000000, 10.00000000000) 
			wait 2 frame 
			BloodOn size = RANDOM_RANGE PAIR(6.00000000000, 10.00000000000) 
			wait 1 frame 
			BloodOn size = RANDOM_RANGE PAIR(6.00000000000, 10.00000000000) 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT BloodTiny 
	IF NOT GetGlobalFlag Flag = BLOOD_OFF 
		Obj_Spawnscript BloodSplat 
		BloodOn <...> size = 5.00000000000 freq = 2.00000000000 rnd_radius = 12 
		wait 4 frames 
		BloodOn <...> size = 2.00000000000 freq = 0.80000001192 rnd_radius = 12 
		wait 3 frames 
	ENDIF 
ENDSCRIPT

SCRIPT BloodSuperTiny 
	Obj_Spawnscript BloodSplat 
	BloodOn <...> size = 1.00000000000 freq = 2.00000000000 rnd_radius = 12 
	wait 4 frames 
	BloodOn <...> size = 0.50000000000 freq = 0.80000001192 rnd_radius = 12 
	wait 3 frames 
ENDSCRIPT

SCRIPT BloodSplat 
	IF NOT GetGlobalFlag Flag = BLOOD_OFF 
		BloodParticlesOn name = "blood_01.png" start_col = -16777046 end_col = 570425514 num = 10 emit_w = 2.00000000000 emit_h = 2.00000000000 angle = 10 size = 2.00000000000 bone = bone_head growth = 1.50000000000 time = 0.30000001192 speed = 250 grav = -900 life = 0.30000001192 
	ENDIF 
ENDSCRIPT

SCRIPT SwitchOnBoard 
	IF NOT IsLocalSkater 
		RETURN 
	ENDIF 
	AtomicIsHidden Board 
	IF IsForceWalkOn 
		IF ( <hidden> = 1 ) 
			SwitchOnAtomic Board 
		ENDIF 
	ELSE 
		IF NOT IsBoardMissing 
			IF ( <hidden> = 1 ) 
				SwitchOnAtomic Board 
			ENDIF 
		ELSE 
			SwitchOffBoard 
		ENDIF 
	ENDIF 
	Obj_GetId 
	MangleChecksums a = BailBoard b = <Objid> 
	IF ObjectExists id = <mangled_id> 
		<mangled_id> : die 
	ENDIF 
ENDSCRIPT

BailBoardComponents = [ 
	{ 
		component = suspend 
	} 
	{ 
		component = rigidbody 
		coeff_friction = 0.69999998808 
		coeff_restitution = 0.15000000596 
		const_acc = -500 
		mass_over_moment = 0.00700000022 
		center_of_mass = VECTOR(0.00000000000, 3.00000000000, 0.00000000000) 
		spring_const = 10 
		linear_velocity_sleep_point = 3 
		angular_velocity_sleep_point = 0.10000000149 
		skater_collision_radius = 28 
		skater_collision_application_radius = 8 
		skater_collision_impulse_factor = 1.00000000000 
		contacts = [ 
			VECTOR(6.00000000000, 7.00000000000, 18.00000000000) 
			VECTOR(6.00000000000, 7.00000000000, -18.00000000000) 
			VECTOR(-6.00000000000, 7.00000000000, 18.00000000000) 
			VECTOR(-6.00000000000, 7.00000000000, -18.00000000000) 
			VECTOR(6.00000000000, 0.00000000000, 13.00000000000) 
			VECTOR(6.00000000000, 0.00000000000, -13.00000000000) 
			VECTOR(-6.00000000000, 0.00000000000, 13.00000000000) 
			VECTOR(-6.00000000000, 0.00000000000, -13.00000000000) 
		] 
		directed_friction = [ 
			{ none } 
			{ none } 
			{ none } 
			{ none } 
			{ VECTOR(1.00000000000, 0.00000000000, 0.00000000000) } 
			{ VECTOR(1.00000000000, 0.00000000000, 0.00000000000) } 
			{ VECTOR(1.00000000000, 0.00000000000, 0.00000000000) } 
			{ VECTOR(1.00000000000, 0.00000000000, 0.00000000000) } 
		] 
		SoundType = SkaterBoardWhenBail 
	} 
	{ 
		component = skeleton 
		skeletonName = thps6_human 
	} 
	{ 
		component = model 
		UseModelLights 
		model = "board_default/board_default.mdl" 
	} 
	{ 
		component = modellightupdate 
	} 
	{ 
		component = Sound 
	} 
	{ 
		component = objectproximity 
	} 
] 
BailGurneyComponents = [ 
	{ 
		component = motion 
	} 
	{ 
		component = suspend 
	} 
	{ 
		component = skeleton 
		skeletonName = thps6_human 
	} 
	{ 
		component = model 
		UseModelLights 
	} 
	{ 
		component = animblender 
		AnimName = animload_THPS6_human 
		skeletonName = thps6_human 
	} 
	{ 
		component = rigidbody 
		coeff_friction = 0.69999998808 
		coeff_restitution = 0.05000000075 
		const_acc = -500 
		mass_over_moment = 0.00700000022 
		center_of_mass = VECTOR(0.00000000000, 0.00000000000, 0.00000000000) 
		spring_const = 10 
		linear_velocity_sleep_point = 3 
		angular_velocity_sleep_point = 0.10000000149 
		skater_collision_radius = 28 
		skater_collision_application_radius = 8 
		skater_collision_impulse_factor = 1.00000000000 
		contacts = [ 
			VECTOR(16.00000000000, 40.00000000000, 28.00000000000) 
			VECTOR(16.00000000000, 40.00000000000, -28.00000000000) 
			VECTOR(-16.00000000000, 40.00000000000, 28.00000000000) 
			VECTOR(-16.00000000000, 40.00000000000, -28.00000000000) 
			VECTOR(16.00000000000, 0.00000000000, 23.00000000000) 
			VECTOR(16.00000000000, 0.00000000000, -23.00000000000) 
			VECTOR(-16.00000000000, 0.00000000000, 23.00000000000) 
			VECTOR(-16.00000000000, 0.00000000000, -23.00000000000) 
		] 
		directed_friction = [ 
			{ none } 
			{ none } 
			{ none } 
			{ none } 
			{ VECTOR(1.00000000000, 0.00000000000, 0.00000000000) } 
			{ VECTOR(1.00000000000, 0.00000000000, 0.00000000000) } 
			{ VECTOR(1.00000000000, 0.00000000000, 0.00000000000) } 
			{ VECTOR(1.00000000000, 0.00000000000, 0.00000000000) } 
		] 
		SoundType = SkaterBoardWhenBail 
	} 
	{ 
		component = modellightupdate 
	} 
	{ 
		component = Sound 
	} 
] 
SCRIPT CreateBailBoard vel = VECTOR(0.00000000000, 0.00000000000, 0.00000000000) rotvel = VECTOR(0.00000000000, 0.00000000000, 0.00000000000) object_vel_factor = 1 
	Obj_GetId 
	IF GotParam gurney 
		MangleChecksums a = BailGurney b = <Objid> 
	ELSE 
		IF GotParam tantrum 
			MangleChecksums a = TantrumBoard b = <Objid> 
		ELSE 
			MangleChecksums a = BailBoard b = <Objid> 
		ENDIF 
	ENDIF 
	IF ObjectExists id = <mangled_id> 
		<mangled_id> : die 
	ENDIF 
	IF GetPlayerAppearancePart player = <Objid> part = Board 
		board_ok = 1 
	ENDIF 
	IF GotParam gurney 
		board_ok = 1 
	ENDIF 
	IF GotParam board_ok 
		IF GotParam gurney 
			animload_THPS6_Veh_Gurney 
			Skeleton_SpawnCompositeObject <...> offset = VECTOR(0.00000000000, -3.00000000000, 2.00000000000) bone = Bone_Board_Root components = BailGurneyComponents params = { name = <mangled_id> XcloneFrom = <Objid> Xgeoms = [ Board ] } 
			IF NOT ObjectExists id = <mangled_id> 
				RETURN 
			ENDIF 
		ELSE 
			Skeleton_SpawnCompositeObject <...> offset = VECTOR(0.00000000000, -3.00000000000, 2.00000000000) bone = Bone_Board_Root components = BailBoardComponents params = { name = <mangled_id> cloneFrom = <Objid> geoms = [ Board ] } 
			IF NOT ObjectExists id = <mangled_id> 
				RETURN 
			ENDIF 
		ENDIF 
		<mangled_id> : RigidBody_IgnoreSkater 15 frames 
		<mangled_id> : RigidBody_Wake 
		IF GotParam tantrum 
			Spawnscript waitandkilltantrumboard params = { id = <mangled_id> } 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT waitandkilltantrumboard 
	wait 6 seconds 
	BailBoard_cleanup id = <id> 
ENDSCRIPT

SCRIPT BailBoard_cleanup id = BailBoard 
	IF ObjectExists id = <id> 
		<id> : die 
	ENDIF 
ENDSCRIPT

SCRIPT SwitchOffBoard 
	AtomicIsHidden Board 
	IF ( <hidden> = 0 ) 
		SwitchOffAtomic Board 
	ENDIF 
ENDSCRIPT

SCRIPT CleanUpSpecialItems 
	SwitchOffAtomic special_item 
	SwitchOnAtomic special_item_2 
ENDSCRIPT

SCRIPT skater_play_bail_stream 
	IF NOT IsTrue GLOBAL_SkaterVoiceOff 
		Obj_PlayStream <stream_checksum> vol = 200 priority = 49 
	ENDIF 
ENDSCRIPT

SCRIPT skater_hint_style 
	DoMorph time = 0 scale = PAIR(0.00000000000, 0.00000000000) 
	DoMorph time = 0.10000000149 scale = PAIR(2.50000000000, 2.50000000000) 
	DoMorph time = 0.10000000149 scale = PAIR(0.75000000000, 0.75000000000) 
	DoMorph time = 0.10000000149 scale = PAIR(1.29999995232, 1.29999995232) 
	DoMorph time = 0.10000000149 scale = PAIR(1.10000002384, 1.10000002384) 
	DoMorph time = 0.05000000075 alpha = 0.60000002384 
	DoMorph time = 0.05000000075 alpha = 1 
	DoMorph time = 0.05000000075 alpha = 0.60000002384 
	DoMorph time = 0.05000000075 alpha = 1 
	DoMorph time = 0.05000000075 alpha = 0.60000002384 
	DoMorph time = 0.05000000075 alpha = 1 
	DoMorph time = 0.05000000075 alpha = 0.60000002384 
	DoMorph time = 0.05000000075 alpha = 1 
	DoMorph time = 0.05000000075 alpha = 0.60000002384 
	DoMorph time = 0.05000000075 alpha = 1 
	DoMorph time = 0.05000000075 alpha = 0.60000002384 
	DoMorph time = 0.05000000075 alpha = 1 
	DoMorph time = 0.05000000075 alpha = 0.60000002384 
	DoMorph time = 0.05000000075 alpha = 1 
	DoMorph time = 0.05000000075 alpha = 0.60000002384 
	DoMorph time = 0.05000000075 alpha = 1 
	DoMorph time = 0.05000000075 alpha = 0.60000002384 
	DoMorph time = 0.05000000075 alpha = 1 
	DoMorph time = 0.05000000075 alpha = 0.60000002384 
	DoMorph time = 0.05000000075 alpha = 1 
	DoMorph time = 0.05000000075 alpha = 0.60000002384 
	DoMorph time = 0.05000000075 alpha = 1 
	DoMorph time = 0.05000000075 alpha = 0.60000002384 
	DoMorph time = 0.05000000075 alpha = 1 
	DoMorph time = 0.05000000075 alpha = 0.60000002384 
	DoMorph time = 0.05000000075 alpha = 1 
	DoMorph time = 0.05000000075 alpha = 0.60000002384 
	DoMorph time = 0.05000000075 alpha = 1 
	DoMorph time = 0.05000000075 alpha = 0.60000002384 
	DoMorph time = 0.05000000075 alpha = 1 
	DoMorph time = 0.05000000075 alpha = 0.60000002384 
	DoMorph time = 0.05000000075 alpha = 1 
	DoMorph time = 0.05000000075 alpha = 0.60000002384 
	DoMorph time = 0.05000000075 alpha = 1 
	DoMorph time = 0.05000000075 alpha = 0.60000002384 
	DoMorph time = 0.05000000075 alpha = 1 
	DoMorph time = 0.05000000075 alpha = 0.60000002384 
	DoMorph time = 0.05000000075 alpha = 1 
	DoMorph time = 0.05000000075 alpha = 0.60000002384 
	DoMorph time = 0.05000000075 alpha = 1 
	DoMorph time = 0.05000000075 alpha = 0.60000002384 
	DoMorph time = 0.05000000075 alpha = 1 
	DoMorph time = 0.05000000075 alpha = 0.60000002384 
	DoMorph time = 0.05000000075 alpha = 1 
	DoMorph time = 0.05000000075 alpha = 0.60000002384 
	DoMorph time = 0.05000000075 alpha = 1 
	DoMorph time = 0.05000000075 alpha = 0.60000002384 
	DoMorph time = 0.05000000075 alpha = 1 
	DoMorph time = 0.05000000075 alpha = 0.60000002384 
	DoMorph time = 0.05000000075 alpha = 1 
	DoMorph time = 0.10000000149 scale = PAIR(2.50000000000, 2.50000000000) 
	DoMorph time = 0.20000000298 scale = PAIR(12.00000000000, 0.00000000000) alpha = 0 
	die 
ENDSCRIPT

SCRIPT skater_bail_style 
	DoMorph time = 0 scale = PAIR(0.00000000000, 0.00000000000) alpha = 0 rot_angle = 0 
	DoMorph time = 0.10000000149 scale = 2.00000000000 alpha = 1 rot_angle = 2 
	DoMorph time = 0.07000000030 scale = 0.89999997616 rot_angle = -2 alpha = 1 
	DoMorph time = 0.05999999866 scale = 1.60000002384 rot_angle = 3 
	DoMorph time = 0.02999999933 scale = 1.20000004768 rot_angle = 0 
	DoMorph time = 0.02999999933 scale = 1.25000000000 rot_angle = 0 
	DoMorph time = 0.10000000149 scale = 1.20000004768 rot_angle = 0 
	DoMorph time = 0.10000000149 scale = 1.21000003815 rot_angle = 0 alpha = 1 
	DoMorph time = 0.10000000149 scale = 1.20000004768 rot_angle = 0 alpha = 0.80000001192 
	DoMorph time = 0.10000000149 scale = 1.21000003815 rot_angle = 0 alpha = 1 
	DoMorph time = 0.10000000149 scale = 1.20000004768 rot_angle = 0 
	DoMorph time = 0.10000000149 scale = 1.21000003815 rot_angle = 0 
	DoMorph time = 0.10000000149 scale = 1.20000004768 rot_angle = 0 
	DoMorph time = 0.10000000149 scale = 1.21000003815 rot_angle = 0 alpha = 1 
	DoMorph time = 0.10000000149 scale = 1.20000004768 rot_angle = 0 alpha = 0.69999998808 
	DoMorph time = 0.10000000149 scale = 1.21000003815 rot_angle = 0 alpha = 1 
	DoMorph time = 0.10000000149 scale = 1.20000004768 rot_angle = 0 
	DoMorph time = 0.10000000149 scale = 1.21000003815 rot_angle = 0 
	DoMorph time = 0.10000000149 scale = 1.20000004768 rot_angle = 0 
	DoMorph time = 0.10000000149 scale = 1.21000003815 rot_angle = 0 alpha = 1 
	DoMorph time = 0.10000000149 scale = 1.20000004768 rot_angle = 0 alpha = 0.80000001192 
	DoMorph time = 0.10000000149 scale = 1.21000003815 rot_angle = 0 alpha = 1 
	DoMorph time = 0.10000000149 scale = 1.20000004768 rot_angle = 0 
	DoMorph time = 0.10000000149 scale = 1.70000004768 rot_angle = -3 
	DoMorph time = 0.30000001192 scale = 0 alpha = 0 rot_angle = 180 
	die 
ENDSCRIPT




MusicVolume = 50 
MusicStreamVolume = 100 
AmbientTrackNum = 0 
ForceAmbientSFXToMusicVolume = 0 
MusicChangedAtStartup = 0 
MusicStartupVolume = 50.00000000000 
MusicVolOutsideBox = 50.00000000000 
FadeMusicInRunning = 0 
FadeMusicOutRunning = 0 
FadeTempMusicVol = 50.00000000000 
DontAdjustMusicViaProximNode = 0 
InsideAdjacentReverbBox01 = 0 
InsideAdjacentReverbBox02 = 0 
InsideAdjacentReverbBox03 = 0 
SloMoMusicPaused = 0 
InsideMusicAdjustmentBox = 0 
InsideSmallBox = 0 
OutterBoxesExist = 0 
StaticMusicBoxesOn = 1 
StaticMusicBoxState = off 
SFX_FootStepWalk01 = WalkStepConc01_11 
SFX_FootStepWalk02 = WalkStepConc03_11 
SFX_FootStepWalk03 = WalkStepConc05_11 
SFX_FootStepRun01 = RunStepConc01_11 
SFX_FootStepRun02 = RunStepConc02_11 
SFX_FootStepRun03 = RunStepConc03_11 
SFX_FootStepRun04 = RunStepConc03_11 
SFX_FootStepRun05 = RunStepConc03_11 
GlobalGoalVOVol = 200 
GlobalHintVOVol = 200 
GlobalHintVODropoff = 150 
GlobalIntroVOVol = 160 
GlobalFarVOVol = 150 
GlobalFarVODropoff = 150 
GlobalFarWaitTime = 8 
GlobalAvoidVOVol = 200 
GlobalAvoidVODropoff = 150 
GlobalTrickBailVOVol = 250 
GlobalTrickBailVODropoff = 150 
GlobalTrickPositiveVOVol = 200 
GlobalTrickPositiveVODropoff = 150 
CheckForPedStreamExistence = 0 
SCRIPT SetThisLevelSoundBanks 
ENDSCRIPT

SCRIPT LoadPermSounds 
	LoadPermSFX 
	LoadPermSongs 
ENDSCRIPT

SCRIPT LoadPermSFX 
	LoadPreFile "skater_sounds.pre" 
	LoadSound "Skater\\foleymove01" FLAG_PERM vol = 50 
	LoadSound "Skater\\hitblood01" FLAG_PERM vol = 50 
	LoadSound "Skater\\hitblood02" FLAG_PERM vol = 50 
	LoadSound "Skater\\hitblood03" FLAG_PERM vol = 50 
	LoadSound "Skater\\Bails\\BailBodyPunch01_11" FLAG_PERM vol = 100 
	LoadSound "Skater\\Bails\\BailBodyPunch02_11" FLAG_PERM vol = 100 
	LoadSound "Skater\\Bails\\BailBodyPunch03_11" FLAG_PERM vol = 100 
	LoadSound "Skater\\Bails\\BailBodyPunch04_11" FLAG_PERM vol = 100 
	LoadSound "Skater\\Bails\\BailBodyPunch05_11" FLAG_PERM vol = 100 
	LoadSound "Skater\\Bails\\BailBodyFall01" FLAG_PERM vol = 100 
	LoadSound "Skater\\Bails\\BailBodyFall02" FLAG_PERM vol = 100 
	LoadSound "Skater\\Bails\\BailBodyFall03" FLAG_PERM vol = 100 
	LoadSound "Skater\\Bails\\BailBodyFall04" FLAG_PERM vol = 100 
	LoadSound "Skater\\Bails\\BailBodyFall05" FLAG_PERM vol = 100 
	LoadSound "Skater\\Bails\\BailCrack01" FLAG_PERM vol = 100 
	LoadSound "Skater\\Bails\\BailSlap01" FLAG_PERM vol = 100 
	LoadSound "Skater\\Bails\\BailSlap02" FLAG_PERM vol = 100 
	LoadSound "Skater\\Bails\\BailSlap03" FLAG_PERM vol = 100 
	LoadSound "Skater\\Bails\\BailBoard01" FLAG_PERM vol = 100 
	LoadSound "Skater\\Bails\\BailBoard02" FLAG_PERM vol = 100 
	LoadSound "Skater\\Bails\\BailBoard03" FLAG_PERM vol = 100 
	LoadSound "Skater\\Bails\\BailBoard04" FLAG_PERM vol = 100 
	LoadSound "Skater\\Bails\\BailBoard05" FLAG_PERM vol = 100 
	LoadSound "Skater\\Bails\\SK6_BoardGrab01" FLAG_PERM 
	LoadSound "Skater\\SK6_BoardScrapeLong02_11" FLAG_PERM 
	LoadSound "Skater\\SK6_BoardRollIn01_11" FLAG_PERM 
	LoadSound "Terrains\\OllieConc19" FLAG_PERM 
	LoadSound "Skater\\Bails\\SK6_BoardSplit01" FLAG_PERM 
	LoadSound "Skater\\Walking\\WalkStepConc01_11" FLAG_PERM vol = 100 
	LoadSound "Skater\\Walking\\WalkStepConc03_11" FLAG_PERM vol = 100 
	LoadSound "Skater\\Walking\\WalkStepConc05_11" FLAG_PERM vol = 100 
	LoadSound "Skater\\Walking\\RunStepConc01_11" FLAG_PERM vol = 100 
	LoadSound "Skater\\Walking\\RunStepConc02_11" FLAG_PERM vol = 100 
	LoadSound "Skater\\Walking\\RunStepConc03_11" FLAG_PERM vol = 100 
	LoadSound "Skater\\Walking\\RunStepConc04_11" FLAG_PERM vol = 100 
	LoadSound "Skater\\Walking\\RunStepConc05_11" FLAG_PERM vol = 100 
	LoadSound "Skater\\Walking\\ScuffStepConc01" FLAG_PERM vol = 100 
	LoadSound "Skater\\Walking\\ScuffStepConc02" FLAG_PERM vol = 100 
	LoadSound "Skater\\Walking\\LandStepConc02_11" FLAG_PERM vol = 100 
	LoadSound "Shared\\Menu\\menu03" FLAG_PERM NOREVERB 
	LoadSound "Shared\\Menu\\GUI_buzzer01" FLAG_PERM vol = 100 NOREVERB 
	LoadSound "Shared\\Menu\\MenuUp" FLAG_PERM NOREVERB 
	LoadSound "Shared\\Menu\\SK6_Menu_Fly_In" FLAG_PERM NOREVERB 
	LoadSound "Shared\\Menu\\DE_PauseFlyIn" FLAG_PERM NOREVERB vol = 80 
	LoadSound "Shared\\Menu\\DE_MenuBack" FLAG_PERM NOREVERB vol = 80 
	LoadSound "Shared\\Menu\\SK6_Menu_Move" FLAG_PERM vol = 100 NOREVERB 
	LoadSound "Shared\\Menu\\SK6_Menu_Select" FLAG_PERM vol = 80 NOREVERB 
	LoadSound "Shared\\Menu\\SK6_Menu_Back" FLAG_PERM vol = 100 NOREVERB 
	LoadSound "Skater\\boneless09" FLAG_PERM 
	LoadSound "Skater\\copinghit3_11" FLAG_PERM vol = 100 
	LoadSound "Shared\\Menu\\timeoutA" FLAG_PERM vol = 50 NOREVERB 
	LoadSound "Shared\\Goals\\GapSound_11" FLAG_PERM vol = 100 dropoff = 0 NOREVERB 
	LoadSound "Shared\\Goals\\GoalDone" FLAG_PERM vol = 100 dropoff = 0 NOREVERB 
	LoadSound "Shared\\Goals\\TetrisAway" FLAG_PERM NOREVERB 
	LoadSound "Shared\\Goals\\GoalGood02" FLAG_PERM NOREVERB 
	LoadSound "Shared\\Goals\\GoalFail" FLAG_PERM NOREVERB 
	LoadSound "Shared\\Goals\\GoalMidGood" FLAG_PERM NOREVERB 
	LoadSound "Shared\\Goals\\ExtraTrick" FLAG_PERM NOREVERB vol = 80 
	LoadSound "Shared\\Goals\\PerfectLanding_11" FLAG_PERM NOREVERB vol = 110 
	LoadSound "Shared\\Goals\\HUDtrickslopC" FLAG_PERM NOREVERB 
	LoadSound "Shared\\Goals\\HUD_jumpgap" FLAG_PERM NOREVERB 
	LoadSound "Shared\\Goals\\HUD_specialtrickAA" FLAG_PERM NOREVERB 
	LoadSound "Shared\\Goals\\LandCombo01" FLAG_PERM NOREVERB 
	LoadSound "Shared\\Goals\\GotStat04" FLAG_PERM NOREVERB vol = 80 
	LoadSound "Skater\\Sk6_JumpFar_01" FLAG_PERM NOREVERB 
	LoadSound "Skater\\BoardBounce01" FLAG_PERM 
	LoadSound "Skater\\SK6_BulletZoomIn" FLAG_PERM NOREVERB 
	LoadSound "Skater\\SK6_BulletZoomOut" FLAG_PERM NOREVERB 
	LoadSound "Skater\\SK6_BulletHeart_11" FLAG_PERM NOREVERB 
	LoadSound "Skater\\SK6_Wind_Test_11" FLAG_PERM NOREVERB 
	LoadSound "Shared\\Misc\\FlipTransitionUp01" FLAG_PERM 
	LoadSound "Shared\\Misc\\FlipTransitionDown01" FLAG_PERM 
	LoadSound "Shared\\Goals\\ClockTickUp" FLAG_PERM NOREVERB 
	LoadSound "Shared\\Goals\\ClockTickDown" FLAG_PERM NOREVERB 
	LoadSound "Shared\\Goals\\FlamingFireBall01" FLAG_PERM 
	LoadSound "Skater\\SK6_Walk_Spray_Tag_01" FLAG_PERM 
	LoadSound "Skater\\SK6_StickerSlap_01" FLAG_PERM 
	UnloadPreFile "skater_sounds.pre" 
ENDSCRIPT

locked_track1 = -1 
locked_track2 = -2 
SCRIPT LoadPermSongs 
	IF ( ( isTrue TestMusicFromHost ) | ( CD ) ) 
		LoadMusicHeader "music\\music" 
		GetArraySize playlist_tracks 
		index = 0 
		BEGIN 
			path = ( ( playlist_tracks [ <index> ] ) . path ) 
			FormatText textname = tracktitle "%b: %t" b = ( ( playlist_tracks [ <index> ] ) . band ) t = ( ( playlist_tracks [ <index> ] ) . track_title ) 
			AddMusicTrack <path> FLAG_PERM tracktitle = <tracktitle> 
			index = ( <index> + 1 ) 
		REPEAT <array_size> 
	ENDIF 
ENDSCRIPT

playlist_tracks = [ 
	{ band = "25 Ta Life" track_title = "Over the Years" genre = 2 path = "music\\vag\\songs\\25TaLife" } 
	{ band = "Aesop Rock" track_title = "No Jumper Cables(re-mix)" genre = 1 path = "music\\vag\\songs\\Aesop" } 
	{ band = "Atmosphere" track_title = "Trying to Find a Balance" genre = 1 path = "music\\vag\\songs\\Atmosphere" } 
	{ band = "Audio Two" track_title = "Top Billin\'" genre = 1 path = "music\\vag\\songs\\AudioTwo" } 
	{ band = "Brand Nubian" track_title = "Punks Jump Up To Get Beat Down" genre = 1 path = "music\\vag\\songs\\Nubian" } 
	{ band = "Camaros" track_title = "Cheesecake" genre = 0 path = "music\\vag\\songs\\Camaros" } 
	{ band = "Cut Chemist" track_title = "Drums of Fire" genre = 1 path = "music\\vag\\songs\\CutChemist" } 
	{ band = "Das Oath" track_title = "Awesome R***" genre = 2 path = "music\\vag\\songs\\Oath" } 
	{ band = "Dead Boys" track_title = "Sonic Reducer" genre = 0 path = "music\\vag\\songs\\DeadBoys" } 
	{ band = "Dead End Road" track_title = "Sin City" genre = 2 path = "music\\vag\\songs\\DeadEndRoad" } 
	{ band = "Disturbed" track_title = "Liberate" genre = 2 path = "music\\vag\\songs\\Disturbed" } 
	{ band = "Diverse" track_title = "Certified" genre = 1 path = "music\\vag\\songs\\Diverse" } 
	{ band = "Faith No More" track_title = "Midlife Crisis" genre = 2 path = "music\\vag\\songs\\FaithNoMore" } 
	{ band = "Fear" track_title = "I Love Livin\' In The City" genre = 0 path = "music\\vag\\songs\\Fear" } 
	{ band = "Frank Sinatra" track_title = "That\'s Life" genre = 2 path = "music\\vag\\songs\\Frank" } 
	{ band = "Grand Puba" track_title = "I Like It" genre = 1 path = "music\\vag\\songs\\GrandPuba" } 
	{ band = "Handsome Boy...School" track_title = "Holy Calamity" genre = 1 path = "music\\vag\\songs\\HandsomeBoy" } 
	{ band = "Iggy & The Stooges" track_title = "1970" genre = 0 path = "music\\vag\\songs\\TheStooges" } 
	{ band = "Jimmy Eat World" track_title = "Pain" genre = 0 path = "music\\vag\\songs\\Jimmy" } 
	{ band = "Johnny Cash" track_title = "Ring of Fire" genre = 2 path = "music\\vag\\songs\\JohnnyCash" } 
	{ band = "Joy Division" track_title = "Warsaw" genre = 0 path = "music\\vag\\songs\\JoyD" } 
	{ band = "Lamb of God" track_title = "Black Label" genre = 2 path = "music\\vag\\songs\\LambofGod" } 
	{ band = "Less Than Jake" track_title = "That\'s Why They...Union" genre = 0 path = "music\\vag\\songs\\Jake" } 
	{ band = "Libretto" track_title = "Volume" genre = 1 path = "music\\vag\\songs\\Libretto" } 
	{ band = "Living Legends" track_title = "Night Prowler" genre = 1 path = "music\\vag\\songs\\LivingL" } 
	{ band = "Melbeatz f.Kool Savas" track_title = "Grind on" genre = 1 path = "music\\vag\\songs\\Melbeatz" } 
	{ band = "Melvins" track_title = "Sweet Willie Rollbar" genre = 0 path = "music\\vag\\songs\\Melvins" } 
	{ band = "Metallica" track_title = "Whiplash" genre = 2 path = "music\\vag\\songs\\Metallica" } 
	{ band = "Mike V and The Rats" track_title = "Never Give Up" genre = 0 path = "music\\vag\\songs\\MikeV" } 
	{ band = "Ministry" track_title = "No    " genre = 2 path = "music\\vag\\songs\\Ministry" } 
	{ band = "Nebula" track_title = "So it Goes" genre = 2 path = "music\\vag\\songs\\Nebula" } 
	{ band = "Operatic" track_title = "Interested In Madness" genre = 2 path = "music\\vag\\songs\\Operatic" } 
	{ band = "Pete Rock&CL Smooth" track_title = "Soul Brother #1" genre = 1 path = "music\\vag\\songs\\PeteRock" } 
	{ band = "Rancid" track_title = "Fall Back Down" genre = 0 path = "music\\vag\\songs\\Rancid" } 
	{ band = "Red Hot Chili Peppers" track_title = "The Power of Equality" genre = 0 path = "music\\vag\\songs\\RedHots" } 
	{ band = "Steel Pulse" track_title = "Born Fe Rebel" genre = 2 path = "music\\vag\\songs\\SteelPulse" } 
	{ band = "Suicide Machines" track_title = "High Anxiety" genre = 0 path = "music\\vag\\songs\\SuicideMachines" } 
	{ band = "The Casualties" track_title = "Unknown Soldier" genre = 0 path = "music\\vag\\songs\\TheCasualties" } 
	{ band = "The D.O.C." track_title = "Whirlwind Pyramid" genre = 1 path = "music\\vag\\songs\\DOC" } 
	{ band = "The Distillers" track_title = "Beat Your Heart Out" genre = 0 path = "music\\vag\\songs\\Distillers" } 
	{ band = "The Doors" track_title = "Break On Through" genre = 2 path = "music\\vag\\songs\\TheDoors" } 
	{ band = "The Explosion" track_title = "Here I Am" genre = 0 path = "music\\vag\\songs\\TheExplosion" } 
	{ band = "The Germs" track_title = "Lexicon Devil" genre = 0 path = "music\\vag\\songs\\TheGerms" } 
	{ band = "The Hiss" track_title = "Back on the Radio" genre = 2 path = "music\\vag\\songs\\Hiss" } 
	{ band = "The Living End" track_title = "End of the World" genre = 2 path = "music\\vag\\songs\\LivingEnd" } 
	{ band = "The Ramones" track_title = "Rock \'n Roll High School" genre = 0 path = "music\\vag\\songs\\TheRamones" } 
	{ band = "The Sugarhill Gang" track_title = "Rapper\'s Delight" genre = 1 path = "music\\vag\\songs\\TheSugarhill" } 
	{ band = "Three Inches of Blood" track_title = "Deadly Sinners" genre = 2 path = "music\\vag\\songs\\ThreeInches" } 
	{ band = "Ultramagnetic MC\'s" track_title = "Ego Trippin\'" genre = 1 path = "music\\vag\\songs\\Ultramagnetic" } 
	{ band = "Violent Femmes" track_title = "Add It Up" genre = 2 path = "music\\vag\\songs\\VFemmes" } 
	{ band = "Ween" track_title = "It\'s Gonna Be a Long Night" genre = 2 path = "music\\vag\\songs\\Ween" } 
	{ band = "X" track_title = "Los Angeles" genre = 2 path = "music\\vag\\songs\\XLA" } 
	{ band = "ZEKE" track_title = "Long Train Runnin\'" genre = 2 path = "music\\vag\\songs\\ZEKE" } 
] 
StreamPriorityLow = 10 
StreamPriorityLowMid = 30 
StreamPriorityMid = 50 
StreamPriorityMidHigh = 70 
StreamPriorityHigh = 90 
StreamPriorityHighest = 100 
SCRIPT stat_goal_appear 
	PlaySound menu03 pitch = 50 volL = 160 volR = 80 
	wait 0.08900000155 seconds 
	PlaySound menu03 pitch = 62.99599838257 volL = 160 volR = 80 
	wait 0.08900000155 seconds 
	PlaySound menu03 pitch = 74.91500091553 volL = 160 volR = 80 
	wait 0.08900000155 seconds 
	PlaySound menu03 pitch = 100 volL = 160 volR = 80 
ENDSCRIPT

SCRIPT stat_goal_success 
	PlaySound GotStat04 vol = 150 
ENDSCRIPT

SCRIPT found_gap_success_sound 
	PlaySound DE_PauseFlyIn pitch = 200 
	wait 1.79999995232 seconds 
	found_gap_away_sound 
ENDSCRIPT

SCRIPT found_gap_away_sound 
	PlaySound DE_PauseFlyIn pitch = 180 vol = 80 
ENDSCRIPT

SCRIPT LandPointsSound 
	PlaySound LandCombo01 vol = 250 
ENDSCRIPT

Paused_Light_Rain = 0 
Paused_Heavy_Rain = 0 
Inside_Light_Rain = 0 
Inside_Heavy_Rain = 0 
LightRainVolume = 100 
MediumRainVolume = 66 
SCRIPT Light_Rain_SFX_On 
	IF NOT IsSoundPlaying TestLight01 
		IF NOT IsSoundPlaying TestLight02 
			printf "*********TURNING LIGHT RAIN SFX ON - DO NOT TURN ON AGAIN BEFORE STOPPING!********" 
			PlaySound Weather_Rain_Light01 vol = LightRainVolume id = TestLight01 
			change Inside_Light_Rain = 0 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT Heavy_Rain_SFX_On 
	printf "*********TURNING LIGHT and MEDIUM RAIN SFX ON - DO NOT TURN ON AGAIN BEFORE STOPPING!********" 
	IF NOT IsSoundPlaying TestLight02 
		IF NOT IsSoundPlaying TestLight01 
			printf "*********TURNING LIGHT RAIN SFX ON - DO NOT TURN ON AGAIN BEFORE STOPPING!********" 
			PlaySound Weather_Rain_Light01 vol = LightRainVolume id = TestLight02 
			change Inside_Heavy_Rain = 0 
		ENDIF 
	ENDIF 
	IF NOT IsSoundPlaying TestMedium02 
		printf "*********TURNING MEDIUM RAIN SFX ON - DO NOT TURN ON AGAIN BEFORE STOPPING!********" 
		PlaySound Weather_Rain_Medium01 vol = MediumRainVolume id = TestMedium02 
	ENDIF 
ENDSCRIPT

SCRIPT wait_and_start_rain 
	SWITCH <type> 
		CASE 1 
			BEGIN 
				wait 1 
				IF NOT IsSoundPlaying TestLight01 
					BREAK 
				ENDIF 
			REPEAT 
			Light_Rain_SFX_On 
			change Paused_Light_Rain = 0 
		CASE 2 
			BEGIN 
				wait 1 
				IF NOT IsSoundPlaying TestLight02 
					BREAK 
				ENDIF 
			REPEAT 
			BEGIN 
				wait 1 
				IF NOT IsSoundPlaying TestMedium02 
					BREAK 
				ENDIF 
			REPEAT 
			Heavy_Rain_SFX_On 
			change Paused_Heavy_Rain = 0 
	ENDSWITCH 
	printf <type> 
	KillSpawnedScript type = wait_and_start_rain 
ENDSCRIPT

SCRIPT Ped_Skater_Grind_Bail_Sound 
	Temp_Ped_Fall_Sound 
	wait 0.50000000000 seconds 
	RANDOM_NO_REPEAT(1, 1, 1, 1, 1) 
		RANDOMCASE Obj_PlaySound BailBoard01 pitch = RANDOM_RANGE PAIR(100.00000000000, 102.00000000000) vol = RANDOM_RANGE PAIR(40.00000000000, 50.00000000000) 
		RANDOMCASE Obj_PlaySound BailBoard02 pitch = RANDOM_RANGE PAIR(100.00000000000, 102.00000000000) vol = RANDOM_RANGE PAIR(40.00000000000, 50.00000000000) 
		RANDOMCASE Obj_PlaySound BailBoard03 pitch = RANDOM_RANGE PAIR(100.00000000000, 102.00000000000) vol = RANDOM_RANGE PAIR(40.00000000000, 50.00000000000) 
		RANDOMCASE Obj_PlaySound BailBoard04 pitch = RANDOM_RANGE PAIR(100.00000000000, 102.00000000000) vol = RANDOM_RANGE PAIR(40.00000000000, 50.00000000000) 
		RANDOMCASE Obj_PlaySound BailBoard05 pitch = RANDOM_RANGE PAIR(100.00000000000, 102.00000000000) vol = RANDOM_RANGE PAIR(40.00000000000, 50.00000000000) 
	RANDOMEND 
	RANDOM_NO_REPEAT(1, 1, 1, 1, 1) 
		RANDOMCASE Obj_PlaySound BailBodyFall01 pitch = RANDOM_RANGE PAIR(95.00000000000, 105.00000000000) vol = RANDOM_RANGE PAIR(60.00000000000, 80.00000000000) 
		RANDOMCASE Obj_PlaySound BailBodyFall02 pitch = RANDOM_RANGE PAIR(95.00000000000, 105.00000000000) vol = RANDOM_RANGE PAIR(60.00000000000, 80.00000000000) 
		RANDOMCASE Obj_PlaySound BailBodyFall03 pitch = RANDOM_RANGE PAIR(95.00000000000, 105.00000000000) vol = RANDOM_RANGE PAIR(60.00000000000, 80.00000000000) 
		RANDOMCASE Obj_PlaySound BailBodyFall04 pitch = RANDOM_RANGE PAIR(95.00000000000, 105.00000000000) vol = RANDOM_RANGE PAIR(60.00000000000, 80.00000000000) 
		RANDOMCASE Obj_PlaySound BailBodyFall05 pitch = RANDOM_RANGE PAIR(95.00000000000, 105.00000000000) vol = RANDOM_RANGE PAIR(60.00000000000, 80.00000000000) 
	RANDOMEND 
ENDSCRIPT

SCRIPT projectile_hit_ped_sounds 
	SpawnSound HandleBailBodyPunchSoundEffect 
	SpawnSound HandleBailSlapSoundEffect 
ENDSCRIPT

SCRIPT Temp_Ped_Fall_Sound 
	RANDOM_NO_REPEAT(1, 1, 1, 1, 1) 
		RANDOMCASE Obj_PlaySound BailBodyPunch01_11 pitch = RANDOM_RANGE PAIR(80.00000000000, 102.00000000000) vol = RANDOM_RANGE PAIR(100.00000000000, 120.00000000000) 
		RANDOMCASE Obj_PlaySound BailBodyPunch02_11 pitch = RANDOM_RANGE PAIR(80.00000000000, 102.00000000000) vol = RANDOM_RANGE PAIR(100.00000000000, 120.00000000000) 
		RANDOMCASE Obj_PlaySound BailBodyPunch03_11 pitch = RANDOM_RANGE PAIR(80.00000000000, 102.00000000000) vol = RANDOM_RANGE PAIR(100.00000000000, 120.00000000000) 
		RANDOMCASE Obj_PlaySound BailBodyPunch04_11 pitch = RANDOM_RANGE PAIR(80.00000000000, 102.00000000000) vol = RANDOM_RANGE PAIR(100.00000000000, 120.00000000000) 
		RANDOMCASE Obj_PlaySound BailBodyPunch05_11 pitch = RANDOM_RANGE PAIR(80.00000000000, 102.00000000000) vol = RANDOM_RANGE PAIR(100.00000000000, 120.00000000000) 
	RANDOMEND 
	RANDOM_NO_REPEAT(1, 1, 1) 
		RANDOMCASE Obj_PlaySound BailSlap01 pitch = RANDOM_RANGE PAIR(95.00000000000, 115.00000000000) vol = RANDOM_RANGE PAIR(100.00000000000, 120.00000000000) 
		RANDOMCASE Obj_PlaySound BailSlap02 pitch = RANDOM_RANGE PAIR(95.00000000000, 115.00000000000) vol = RANDOM_RANGE PAIR(100.00000000000, 120.00000000000) 
		RANDOMCASE Obj_PlaySound BailSlap03 pitch = RANDOM_RANGE PAIR(95.00000000000, 115.00000000000) vol = RANDOM_RANGE PAIR(100.00000000000, 120.00000000000) 
	RANDOMEND 
ENDSCRIPT

SCRIPT Goal_Success_Message_Sound 
	PlaySound GoalGood02 vol = 200 
	PlayStream GoalSuccessStream vol = 150 priority = StreamPriorityHighest 
ENDSCRIPT

SCRIPT SK6_SFX_BulletTime_In 
	change SloMoMusicPaused = 1 
	PauseMusic 1 
	StopSound SK6_BulletZoomIn 
	StopSound SK6_BulletZoomOut 
	IF NOT IsSoundPlaying SK6_BulletZoomIn 
		PlaySound SK6_BulletZoomIn vol = 130 
	ENDIF 
	IF NOT IsSoundPlaying SK6_Wind_Test_11 
		PlaySound SK6_Wind_Test_11 
	ENDIF 
	wait 0.15000000596 seconds 
	SpawnScript SK6_SFX_BulletTime_Heart 
ENDSCRIPT

SCRIPT SK6_SFX_BulletTime_Heart 
	HeartWaitTime = 0.34999999404 
	HeartPitch = 105 
	HeartVol = 150 
	BEGIN 
		PlaySound SK6_BulletHeart_11 pitch = <HeartPitch> vol = <HeartVol> 
		wait <HeartWaitTime> seconds 
	REPEAT 
ENDSCRIPT

SCRIPT SK6_SFX_BulletTime_Out 
	StopSound SK6_BulletZoomOut 
	StopSound SK6_BulletZoomIn 
	IF NOT IsSoundPlaying SK6_BulletZoomOut 
		PlaySound SK6_BulletZoomOut vol = 180 
	ENDIF 
	StopSound SK6_BulletHeart_11 
	StopSound SK6_Wind_Test_11 
	KillSpawnedScript name = SK6_SFX_BulletTime_Heart 
	wait 0.33000001311 seconds 
	change SloMoMusicPaused = 0 
	SFX_Music_Volume_Box_Restore_State 
ENDSCRIPT

SCRIPT THUG2_SFX_Tag_Spray_Wallplant 
	PlaySound SK6_Walk_Spray_Tag_01 
ENDSCRIPT

SCRIPT SK6_SFX_Jump_Booster_Sound 
	IF ( LevelIs load_bo ) 
	ELSE 
		IF NOT ( IsSoundPlaying ThisBoostSound ) 
			PlaySound Sk6_JumpFar_01 id = ThisBoostSound vol = 100 
		ENDIF 
		wait 0.20000000298 seconds 
	ENDIF 
ENDSCRIPT

SCRIPT SK6_SFX_Roll_Booster_Sound DefBoostSound = 1 DefSkaterVO = 0 
	IF ( <DefBoostSound> = 1 ) 
		IF NOT ( IsSoundPlaying ThisBoostSound ) 
			PlaySound Sk6_JumpFar_01 id = ThisBoostSound vol = 100 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT StartupMusicVol MusicVol = 50 
	change MusicChangedAtStartup = 1 
	change MusicStartupVolume = <MusicVol> 
ENDSCRIPT

SCRIPT SFX_SetOutsideVolAtTopOfLevel 
	IF ( MusicChangedAtStartup = 1 ) 
		SetMusicVolume MusicStartupVolume 
		change MusicVolOutsideBox = MusicStartupVolume 
		change FadeTempMusicVol = ( MusicVolOutsideBox ) 
		change MusicChangedAtStartup = 0 
	ELSE 
		GetValueFromVolume cdvol 
		change MusicVolOutsideBox = ( <value> * 10 ) 
		change FadeTempMusicVol = ( MusicVolOutsideBox ) 
	ENDIF 
ENDSCRIPT

SCRIPT SFX_refresh_music_box_triggers 
	Kill prefix = TRG_SFX_TrigBox_LG 
	Kill prefix = TRG_SFX_TrigBox_MS 
	IF GetGlobalFlag flag = SOUNDS_MUSICBOXES_OFF 
		RETURN 
	ENDIF 
	IF GotParam wait 
		wait 1 gameframe 
	ENDIF 
	Create prefix = TRG_SFX_TrigBox_MS 
ENDSCRIPT

SCRIPT SFX_Music_Volume_Box 
	IF skatercamanimfinished 
		IF NOT isTrue cutscene_is_playing 
			IF ( inside ) 
				SpawnScript SK6_Music_Fade_Out 
				change StaticMusicBoxState = on 
			ELSE 
				SpawnScript SK6_Music_Fade_In 
				change StaticMusicBoxState = off 
			ENDIF 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT SFX_Music_Volume_Box_Restore_State 
	IF LevelIs load_mainmenu 
		RETURN 
	ENDIF 
	IF ( StaticMusicBoxState = off ) 
		IF NOT GotParam sound_options 
			IF NOT ( MusicVolOutsideBox = FadeTempMusicVol ) 
				SpawnScript SK6_Music_Fade_In params = { DoQuick = 1 } 
			ELSE 
				IF NOT ( MusicVolOutsideBox = ( FadeTempMusicVol - 1 ) ) 
					SpawnScript SK6_Music_Fade_In params = { DoQuick = 1 } 
				ENDIF 
			ENDIF 
		ENDIF 
	ELSE 
		KillSpawnedScript name = SK6_Music_Fade_In 
		KillSpawnedScript name = SK6_Music_Fade_Out 
		IF GotParam sound_options 
			GetValueFromVolume cdvol 
			change MusicVolOutsideBox = ( <value> * 10 ) 
		ENDIF 
		SetMusicVolume 0 
	ENDIF 
ENDSCRIPT

SCRIPT SFX_Music_Volume_Box_Kill_State 
	IF ( StaticMusicBoxState = on ) 
		change SloMoMusicPaused = 0 
		SK6_Music_Fade_In DoQuick = 1 
		change StaticMusicBoxState = off 
	ENDIF 
	change SloMoMusicPaused = 0 
ENDSCRIPT

SCRIPT SK6_Music_Fade_Out 
	IF ( SloMoMusicPaused = 1 ) 
		RETURN 
	ENDIF 
	IF NOT ( DontAdjustMusicViaProximNode = 1 ) 
		IF ( FadeMusicOutRunning = 0 ) 
			change FadeMusicOutRunning = 1 
			GetValueFromVolume cdvol 
			IF NOT ( <value> = 0 ) 
				IF ( FadeMusicInRunning = 0 ) 
					GetValueFromVolume cdvol 
					change MusicVolOutsideBox = ( <value> * 10 ) 
					change FadeTempMusicVol = ( MusicVolOutsideBox ) 
					KillSpawnedScript name = SK6_Music_Fade_In 
					change FadeMusicInRunning = 0 
				ELSE 
					KillSpawnedScript name = SK6_Music_Fade_In 
					change FadeMusicInRunning = 0 
				ENDIF 
				BEGIN 
					IF ( FadeTempMusicVol < 0.00000000000 ) 
						FadeTempMusicVol = 0.00000000000 
						BREAK 
					ENDIF 
					IF ( FadeTempMusicVol < 0 ) 
						change FadeTempMusicVol = 0 
					ENDIF 
					IF ( FadeTempMusicVol > 100 ) 
						change FadeTempMusicVol = 100 
					ENDIF 
					SetMusicVolume FadeTempMusicVol 
					IF ( MusicVolOutsideBox > 50 ) 
						change FadeTempMusicVol = ( FadeTempMusicVol - ( MusicVolOutsideBox / 50 ) ) 
					ELSE 
						change FadeTempMusicVol = ( FadeTempMusicVol - 1 ) 
					ENDIF 
					wait 1 gameframe 
				REPEAT 101 
				PauseMusic 1 
			ELSE 
				KillSpawnedScript name = SK6_Music_Fade_In 
				change FadeMusicInRunning = 0 
				BEGIN 
					IF ( FadeTempMusicVol < 0.00000000000 ) 
						FadeTempMusicVol = 0.00000000000 
						BREAK 
					ENDIF 
					IF ( FadeTempMusicVol < 0 ) 
						change FadeTempMusicVol = 0 
					ENDIF 
					IF ( FadeTempMusicVol > 100 ) 
						change FadeTempMusicVol = 100 
					ENDIF 
					SetMusicVolume FadeTempMusicVol 
					change FadeTempMusicVol = ( FadeTempMusicVol - 1 ) 
					wait 1 gameframe 
				REPEAT 
			ENDIF 
			change FadeMusicOutRunning = 0 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT SK6_Music_Fade_In { DoQuick = 0 } 
	IF ( SloMoMusicPaused = 1 ) 
		RETURN 
	ENDIF 
	IF NOT ( DontAdjustMusicViaProximNode = 1 ) 
		IF ( FadeMusicInRunning = 0 ) 
			change FadeMusicInRunning = 1 
			IF NOT ( FadeTempMusicVol = ( MusicVolOutsideBox + 1 ) ) 
				IF ( FadeMusicOutRunning = 0 ) 
					SetMusicVolume 0 
					change FadeTempMusicVol = 0.00000000000 
					KillSpawnedScript name = SK6_Music_Fade_Out 
					change FadeMusicOutRunning = 0 
				ELSE 
					KillSpawnedScript name = SK6_Music_Fade_Out 
					change FadeMusicOutRunning = 0 
				ENDIF 
				IF ( <DoQuick> = 0 ) 
					wait 2 gameframes 
				ENDIF 
				PauseMusic 0 
				IF ( <DoQuick> = 1 ) 
					change FadeTempMusicVol = MusicVolOutsideBox 
					IF ( FadeTempMusicVol < 0 ) 
						change FadeTempMusicVol = 0 
					ENDIF 
					IF ( FadeTempMusicVol > 100 ) 
						change FadeTempMusicVol = 100 
					ENDIF 
					SetMusicVolume FadeTempMusicVol 
				ELSE 
					BEGIN 
						IF ( FadeTempMusicVol > MusicVolOutsideBox ) 
							change FadeTempMusicVol = MusicVolOutsideBox 
							BREAK 
						ENDIF 
						IF ( FadeTempMusicVol < 0 ) 
							change FadeTempMusicVol = 0 
						ENDIF 
						IF ( FadeTempMusicVol > 100 ) 
							change FadeTempMusicVol = 100 
						ENDIF 
						SetMusicVolume FadeTempMusicVol 
						IF ( MusicVolOutsideBox > 50 ) 
							change FadeTempMusicVol = ( FadeTempMusicVol + ( MusicVolOutsideBox / 50 ) ) 
						ELSE 
							change FadeTempMusicVol = ( FadeTempMusicVol + 1 ) 
						ENDIF 
						wait 1 gameframe 
					REPEAT 102 
				ENDIF 
				PauseMusic 0 
				GetValueFromVolume cdvol 
				IF ( <DoQuick> = 0 ) 
					wait 2 gameframes 
				ENDIF 
			ENDIF 
			change FadeMusicInRunning = 0 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT Menu_SFX_Wheel_Click_Short 
	PlaySound MenuUp pitch = RANDOM_RANGE PAIR(98.00000000000, 102.00000000000) vol = RANDOM_RANGE PAIR(50.00000000000, 60.00000000000) 
	wait 0.10000000149 seconds 
	PlaySound MenuUp pitch = RANDOM_RANGE PAIR(98.00000000000, 102.00000000000) vol = RANDOM_RANGE PAIR(50.00000000000, 60.00000000000) 
ENDSCRIPT

SCRIPT Menu_SFX_Wheel_Click_Long 
	PlaySound MenuUp pitch = RANDOM_RANGE PAIR(105.00000000000, 110.00000000000) vol = RANDOM_RANGE PAIR(50.00000000000, 60.00000000000) 
	wait 0.05000000075 seconds 
	PlaySound MenuUp pitch = RANDOM_RANGE PAIR(100.00000000000, 107.00000000000) vol = RANDOM_RANGE PAIR(50.00000000000, 60.00000000000) 
	wait 0.05000000075 seconds 
	PlaySound MenuUp pitch = RANDOM_RANGE PAIR(98.00000000000, 105.00000000000) vol = RANDOM_RANGE PAIR(50.00000000000, 60.00000000000) 
	wait 0.05000000075 seconds 
	PlaySound MenuUp pitch = RANDOM_RANGE PAIR(98.00000000000, 102.00000000000) vol = RANDOM_RANGE PAIR(50.00000000000, 60.00000000000) 
	wait 0.05000000075 seconds 
	PlaySound MenuUp pitch = RANDOM_RANGE PAIR(90.00000000000, 95.00000000000) vol = RANDOM_RANGE PAIR(50.00000000000, 60.00000000000) 
	wait 0.05000000075 seconds 
	PlaySound MenuUp pitch = RANDOM_RANGE PAIR(90.00000000000, 95.00000000000) vol = RANDOM_RANGE PAIR(50.00000000000, 60.00000000000) 
	wait 0.05000000075 seconds 
	PlaySound MenuUp pitch = RANDOM_RANGE PAIR(90.00000000000, 95.00000000000) vol = RANDOM_RANGE PAIR(50.00000000000, 60.00000000000) 
	wait 0.05000000075 seconds 
	PlaySound MenuUp pitch = RANDOM_RANGE PAIR(87.00000000000, 89.00000000000) vol = RANDOM_RANGE PAIR(50.00000000000, 60.00000000000) 
	wait 0.05000000075 seconds 
ENDSCRIPT

SCRIPT SK6_SFX_OutOfAmmoBuzzer 
	wait 0.30000001192 seconds 
ENDSCRIPT

SCRIPT Auto_SFX_Car_Tire_Squeal 
	IF NOT ( IsStreamPlaying LA_Skid ) 
		Obj_PlayStream LA_Skid vol = RANDOM_RANGE PAIR(30.00000000000, 60.00000000000) 
	ENDIF 
ENDSCRIPT

SCRIPT Auto_SFX_CarBrakeSqueal 
	IF NOT ( IsStreamPlaying CarBrakeSqueal ) 
		Obj_PlayStream CarBrakeSqueal vol = RANDOM_RANGE PAIR(5.00000000000, 20.00000000000) pitch = RANDOM_RANGE PAIR(80.00000000000, 100.00000000000) priority = StreamPriorityLow 
	ENDIF 
ENDSCRIPT

SCRIPT Auto_SFX_Car_Horn_Stream 
	IF NOT ( IsStreamPlaying CarHorn ) 
		wait RANDOM(1, 1, 1) RANDOMCASE 0.20000000298 RANDOMCASE 0.40000000596 RANDOMCASE 0.60000002384 RANDOMEND seconds 
		Obj_PlayStream CarHorn vol = RANDOM_RANGE PAIR(50.00000000000, 60.00000000000) pitch = RANDOM_RANGE PAIR(80.00000000000, 100.00000000000) dropoff = 120 
	ENDIF 
ENDSCRIPT

SCRIPT SK6_SFX_ShowClassicGoals 
	PlaySound DE_PauseFlyIn pitch = 200 
	wait 0.20000000298 seconds 
	PlaySound BailSlap02 
ENDSCRIPT

SCRIPT SK6_SFX_ShowPointsFromGoal 
	wait 12 gameframes 
	PlaySound boneless09 pitch = 30 
ENDSCRIPT

SCRIPT SK6_SFX_IncomingBeeper 
	wait 1 gameframe 
	PauseStream 0 
	PlayStream SK6_Motorola_Ringtone vol = 150 priority = 101 
ENDSCRIPT

SCRIPT SK6_SFX_Get_Throwing_Item 
	IF LevelIs load_bo 
		PlayStream Sk6_Pickup_Apples vol = 120 
	ENDIF 
	IF LevelIs load_ba 
		PlayStream Sk6_Pickup_Tomatoes vol = 120 
	ENDIF 
	IF LevelIs load_be 
		PlayStream Sk6_Pickup_SprayCans vol = 120 
	ENDIF 
	IF LevelIs load_au 
		PlayStream Sk6_Pickup_Shrimp vol = 120 
	ENDIF 
	IF LevelIs load_no 
		PlayStream Sk6_Pickup_Beads vol = 120 
	ENDIF 
	IF LevelIs load_st 
		PlayStream Sk6_Pickup_SmokeBombs vol = 150 
	ENDIF 
	IF LevelIs load_se 
	ENDIF 
ENDSCRIPT

SCRIPT ALL_Levels_SFX_PlayThrowingSound 
	IF LevelIs load_be 
		skater : Obj_PlaySound SK6_Throw_SprayCan_11 vol = 400 pitch = 120 
	ENDIF 
ENDSCRIPT

SCRIPT ALL_Levels_SFX_Arcade_Game 
	wait 1 gameframe 
	IF skatercamanimfinished 
		BEGIN 
			IF NOT IsStreamPlaying ArcadeGameStream 
				RANDOM_NO_REPEAT(6, 6, 1, 6, 6) 
					RANDOMCASE Obj_PlayStream SK6_Arcade_Beeps_01 vol = 200 emitter = TRG_SFX_SOB_Arcade_Game priority = StreamPriorityLow dropoff_function = exponential id = ArcadeGameStream 
					wait 28 seconds 
					RANDOMCASE Obj_PlayStream SK6_Arcade_Beeps_02 vol = 200 emitter = TRG_SFX_SOB_Arcade_Game priority = StreamPriorityLow dropoff_function = exponential id = ArcadeGameStream 
					wait 38 seconds 
					RANDOMCASE Obj_PlayStream SK6_Arcade_Beeps_03 vol = 200 emitter = TRG_SFX_SOB_Arcade_Game priority = StreamPriorityLow dropoff_function = exponential id = ArcadeGameStream 
					wait 10 seconds 
					RANDOMCASE Obj_PlayStream SK6_Arcade_Beeps_04 vol = 200 emitter = TRG_SFX_SOB_Arcade_Game priority = StreamPriorityLow dropoff_function = exponential id = ArcadeGameStream 
					wait 11 seconds 
					RANDOMCASE Obj_PlayStream SK6_Arcade_Beeps_05 vol = 200 emitter = TRG_SFX_SOB_Arcade_Game priority = StreamPriorityLow dropoff_function = exponential id = ArcadeGameStream 
					wait 35 seconds 
				RANDOMEND 
			ENDIF 
			wait 1 second 
		REPEAT 
	ENDIF 
ENDSCRIPT

SCRIPT SFX_Arcade_Goal_Win 
	printf "PLAYING SFX for WINNING Arcade goal" 
	PauseMusic 1 
	StopSound GoalGood02 
	StopStream GoalSuccessStream 
	IF NOT IsStreamPlaying WinArcadeGoal 
		PlayStream SK6_Arcade_Beeps_WIN vol = 80 priority = 101 id = WinArcadeGoal 
	ENDIF 
	wait 1 gameframe 
	StopStream GoalSuccessStream 
	BEGIN 
		IF NOT IsStreamPlaying WinArcadeGoal 
			BREAK 
		ENDIF 
		wait 1 gameframe 
	REPEAT 
	SK6_Music_Fade_In 
ENDSCRIPT

SCRIPT SFX_Arcade_Goal_Lose 
	PauseMusic 1 
	printf "PLAYING SFX for LOSING Arcade goal" 
	IF NOT IsStreamPlaying LoseArcadeGoal 
		PlayStream SK6_Arcade_Beeps_LOSE vol = 80 priority = 101 id = LoseArcadeGoal 
	ENDIF 
	wait 1 gameframe 
	StopStream GoalSuccessStream 
	BEGIN 
		IF NOT IsStreamPlaying LoseArcadeGoal 
			BREAK 
		ENDIF 
		wait 1 gameframe 
	REPEAT 
	SK6_Music_Fade_In 
ENDSCRIPT

SCRIPT ALL_Levels_Going_Through_Tree 
	printf "GOING THROUGH TREE SOUNDS!!!!!!!!!!!!!!!!!!!!!!" 
	IF NOT IsStreamPlaying SK6_ThroughTrees 
		PlayStream SK6_ThroughTrees vol = 140 
	ENDIF 
ENDSCRIPT

SCRIPT ALL_Levels_SFX_Start_Goal 
	PlayStream SK6_StartAGoal vol = 125 priority = 101 
ENDSCRIPT

SCRIPT Franklin_Grind_SFX 
	IF IsStreamPlaying FranklinGrindThunder 
		printf "STOPPING THUNDER!" 
		StopStream FranklinGrindThunder 
		StopStream FranklinGrindThunder 
	ENDIF 
	wait 1 gameframe 
	PlayStream SK6_BE_LightningAndThunder01 vol = 130 id = FranklinGrindThunder priority = StreamPriorityHigh 
ENDSCRIPT

SCRIPT load_level_handle_ambient_sfx 
	IF ( ( CD ) | ( isTrue TestMusicFromHost ) ) 
		ClearMusicTrackList 
		change ForceAmbientSFXToMusicVolume = 0 
		change AmbientTrackNum = 0 
		IF GotParam ambient_track 
			IF IsArray <ambient_track> 
				GetArraySize <ambient_track> 
				i = 0 
				BEGIN 
					AddMusicTrack ( <ambient_track> [ <i> ] ) 
					i = ( <i> + 1 ) 
				REPEAT <array_size> 
			ELSE 
				AddMusicTrack <ambient_track> 
			ENDIF 
		ENDIF 
		set_music_ambient_state 
	ENDIF 
ENDSCRIPT

SCRIPT set_music_ambient_state 
	IF LevelIs load_mainmenu 
		SetCDToMusic 
		RETURN 
	ENDIF 
	IF GotParam force 
		StopMusic 
	ENDIF 
	IF isTrue ForceAmbientSFXToMusicVolume 
		SetCDToAmbient 
	ELSE 
		IF ( ( MusicVolOutsideBox ) = 0 ) 
			SetCDToAmbient 
		ELSE 
			SetCDToMusic 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT set_se2_ambient_zone 
	IF InSplitScreenGame 
		RETURN 
	ENDIF 
	IF NOT GotParam zone 
		zone = hell 
	ENDIF 
	SWITCH <zone> 
		CASE spaceport 
			change ForceAmbientSFXToMusicVolume = 1 
			change AmbientTrackNum = 1 
			set_music_ambient_state force 
		CASE temple 
			change ForceAmbientSFXToMusicVolume = 1 
			change AmbientTrackNum = 2 
			set_music_ambient_state force 
		CASE hell 
			change ForceAmbientSFXToMusicVolume = 0 
			change AmbientTrackNum = 0 
			set_music_ambient_state force 
	ENDSWITCH 
ENDSCRIPT

SCRIPT SFX_Change_Footstep_Sounds_To_Default 
	change SFX_FootStepWalk01 = WalkStepConc01_11 
	change SFX_FootStepWalk02 = WalkStepConc03_11 
	change SFX_FootStepWalk03 = WalkStepConc05_11 
	change SFX_FootStepRun01 = RunStepConc01_11 
	change SFX_FootStepRun02 = RunStepConc02_11 
	change SFX_FootStepRun03 = RunStepConc03_11 
	change SFX_FootStepRun04 = RunStepConc03_11 
	change SFX_FootStepRun05 = RunStepConc03_11 
ENDSCRIPT

SCRIPT Paulie_TalkShit line = 0 
	IF NOT IsStreamPlaying ThisPaulieLine 
		RANDOM(50, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1) 
			RANDOMCASE 
			RANDOMCASE PlayStream Paulie_Wild01 vol = 200 id = ThisPaulieLine 
			RANDOMCASE PlayStream Paulie_Wild02 vol = 200 id = ThisPaulieLine 
			RANDOMCASE PlayStream Paulie_Wild03 vol = 200 id = ThisPaulieLine 
			RANDOMCASE PlayStream Paulie_Wild04 vol = 200 id = ThisPaulieLine 
			RANDOMCASE PlayStream Paulie_Wild05 vol = 200 id = ThisPaulieLine 
			RANDOMCASE PlayStream Paulie_Wild07 vol = 200 id = ThisPaulieLine 
			RANDOMCASE PlayStream Paulie_Wild08 vol = 200 id = ThisPaulieLine 
			RANDOMCASE PlayStream Paulie_Wild09 vol = 200 id = ThisPaulieLine 
			RANDOMCASE PlayStream Paulie_Wild10 vol = 200 id = ThisPaulieLine 
			RANDOMCASE PlayStream Paulie_Wild11 vol = 200 id = ThisPaulieLine 
			RANDOMCASE PlayStream Paulie_Wild12 vol = 200 id = ThisPaulieLine 
			RANDOMCASE PlayStream Paulie_Wild13 vol = 200 id = ThisPaulieLine 
			RANDOMCASE PlayStream Paulie_Wild14 vol = 200 id = ThisPaulieLine 
			RANDOMCASE PlayStream Paulie_Wild16 vol = 200 id = ThisPaulieLine 
			RANDOMCASE PlayStream Paulie_Wild17 vol = 200 id = ThisPaulieLine 
			RANDOMCASE PlayStream Paulie_Wild18 vol = 200 id = ThisPaulieLine 
			RANDOMCASE PlayStream Paulie_Wild19 vol = 200 id = ThisPaulieLine 
			RANDOMCASE PlayStream Paulie_Wild20 vol = 200 id = ThisPaulieLine 
			RANDOMCASE PlayStream Paulie_Wild21 vol = 200 id = ThisPaulieLine 
			RANDOMCASE PlayStream Paulie_Wild22 vol = 200 id = ThisPaulieLine 
			RANDOMCASE PlayStream Paulie_Wild23 vol = 200 id = ThisPaulieLine 
			RANDOMCASE PlayStream Paulie_Wild25 vol = 200 id = ThisPaulieLine 
			RANDOMCASE PlayStream Paulie_Wild26 vol = 200 id = ThisPaulieLine 
		RANDOMEND 
	ENDIF 
ENDSCRIPT

SCRIPT ALL_SFX_Wait_Before_Tantrum_Stream 
	wait 0.50000000000 seconds 
	PlaySkaterStream type = "tantrum" 
ENDSCRIPT



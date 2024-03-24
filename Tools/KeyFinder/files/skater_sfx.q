
MusicVolume = 50
MusicStreamVolume = 100
ambienttracknum = 0
forceambientsfxtomusicvolume = 0
MusicChangedAtStartup = 0
MusicStartupVolume = 50.0
MusicVolOutsideBox = 50.0
FadeMusicInRunning = 0
FadeMusicOutRunning = 0
FadeTempMusicVol = 50.0
DontAdjustMusicViaProximNode = 0
InsideAdjacentReverbBox01 = 0
InsideAdjacentReverbBox02 = 0
InsideAdjacentReverbBox03 = 0
SloMoMusicPaused = 0
InsideMusicAdjustmentBox = 0
InsideSmallBox = 0
OutterBoxesExist = 0
StaticMusicBoxesOn = 1
StaticMusicBoxState = Off
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

script SetThisLevelSoundBanks 
endscript


script LoadPermSounds 
    LoadPermSFX
    LoadPermSongs
endscript


script LoadPermSFX 
    LoadPreFile 'skater_sounds.pre'
    LoadSound 'Skater\foleymove01' FLAG_PERM vol = 50
    LoadSound 'Skater\hitblood01' FLAG_PERM vol = 50
    LoadSound 'Skater\hitblood02' FLAG_PERM vol = 50
    LoadSound 'Skater\hitblood03' FLAG_PERM vol = 50
    LoadSound 'Skater\Bails\BailBodyPunch01_11' FLAG_PERM vol = 100
    LoadSound 'Skater\Bails\BailBodyPunch02_11' FLAG_PERM vol = 100
    LoadSound 'Skater\Bails\BailBodyPunch03_11' FLAG_PERM vol = 100
    LoadSound 'Skater\Bails\BailBodyPunch04_11' FLAG_PERM vol = 100
    LoadSound 'Skater\Bails\BailBodyPunch05_11' FLAG_PERM vol = 100
    LoadSound 'Skater\Bails\BailBodyFall01' FLAG_PERM vol = 100
    LoadSound 'Skater\Bails\BailBodyFall02' FLAG_PERM vol = 100
    LoadSound 'Skater\Bails\BailBodyFall03' FLAG_PERM vol = 100
    LoadSound 'Skater\Bails\BailBodyFall04' FLAG_PERM vol = 100
    LoadSound 'Skater\Bails\BailBodyFall05' FLAG_PERM vol = 100
    LoadSound 'Skater\Bails\BailCrack01' FLAG_PERM vol = 100
    LoadSound 'Skater\Bails\BailSlap01' FLAG_PERM vol = 100
    LoadSound 'Skater\Bails\BailSlap02' FLAG_PERM vol = 100
    LoadSound 'Skater\Bails\BailSlap03' FLAG_PERM vol = 100
    LoadSound 'Skater\Bails\BailBoard01' FLAG_PERM vol = 100
    LoadSound 'Skater\Bails\BailBoard02' FLAG_PERM vol = 100
    LoadSound 'Skater\Bails\BailBoard03' FLAG_PERM vol = 100
    LoadSound 'Skater\Bails\BailBoard04' FLAG_PERM vol = 100
    LoadSound 'Skater\Bails\BailBoard05' FLAG_PERM vol = 100
    LoadSound 'Skater\Bails\SK6_BoardGrab01' FLAG_PERM
    LoadSound 'Skater\SK6_BoardScrapeLong02_11' FLAG_PERM
    LoadSound 'Skater\SK6_BoardRollIn01_11' FLAG_PERM
    LoadSound 'Terrains\OllieConc19' FLAG_PERM
    LoadSound 'Skater\Bails\SK6_BoardSplit01' FLAG_PERM
    LoadSound 'Skater\Walking\WalkStepConc01_11' FLAG_PERM vol = 100
    LoadSound 'Skater\Walking\WalkStepConc03_11' FLAG_PERM vol = 100
    LoadSound 'Skater\Walking\WalkStepConc05_11' FLAG_PERM vol = 100
    LoadSound 'Skater\Walking\RunStepConc01_11' FLAG_PERM vol = 100
    LoadSound 'Skater\Walking\RunStepConc02_11' FLAG_PERM vol = 100
    LoadSound 'Skater\Walking\RunStepConc03_11' FLAG_PERM vol = 100
    LoadSound 'Skater\Walking\RunStepConc04_11' FLAG_PERM vol = 100
    LoadSound 'Skater\Walking\RunStepConc05_11' FLAG_PERM vol = 100
    LoadSound 'Skater\Walking\ScuffStepConc01' FLAG_PERM vol = 100
    LoadSound 'Skater\Walking\ScuffStepConc02' FLAG_PERM vol = 100
    LoadSound 'Skater\Walking\LandStepConc02_11' FLAG_PERM vol = 100
    LoadSound 'Shared\Menu\menu03' FLAG_PERM NoReverb
    LoadSound 'Shared\Menu\GUI_buzzer01' FLAG_PERM vol = 100 NoReverb
    LoadSound 'Shared\Menu\MenuUp' FLAG_PERM NoReverb
    LoadSound 'Shared\Menu\SK6_Menu_Fly_In' FLAG_PERM NoReverb
    LoadSound 'Shared\Menu\DE_PauseFlyIn' FLAG_PERM NoReverb vol = 80
    LoadSound 'Shared\Menu\DE_MenuBack' FLAG_PERM NoReverb vol = 80
    LoadSound 'Shared\Menu\SK6_Menu_Move' FLAG_PERM vol = 100 NoReverb
    LoadSound 'Shared\Menu\SK6_Menu_Select' FLAG_PERM vol = 80 NoReverb
    LoadSound 'Shared\Menu\SK6_Menu_Back' FLAG_PERM vol = 100 NoReverb
    LoadSound 'Skater\boneless09' FLAG_PERM
    LoadSound 'Skater\copinghit3_11' FLAG_PERM vol = 100
    LoadSound 'Shared\Menu\timeoutA' FLAG_PERM vol = 50 NoReverb
    LoadSound 'Shared\Goals\GapSound_11' FLAG_PERM vol = 100 dropoff = 0 NoReverb
    LoadSound 'Shared\Goals\GoalDone' FLAG_PERM vol = 100 dropoff = 0 NoReverb
    LoadSound 'Shared\Goals\TetrisAway' FLAG_PERM NoReverb
    LoadSound 'Shared\Goals\GoalGood02' FLAG_PERM NoReverb
    LoadSound 'Shared\Goals\GoalFail' FLAG_PERM NoReverb
    LoadSound 'Shared\Goals\GoalMidGood' FLAG_PERM NoReverb
    LoadSound 'Shared\Goals\ExtraTrick' FLAG_PERM NoReverb vol = 80
    LoadSound 'Shared\Goals\PerfectLanding_11' FLAG_PERM NoReverb vol = 110
    LoadSound 'Shared\Goals\HUDtrickslopC' FLAG_PERM NoReverb
    LoadSound 'Shared\Goals\HUD_jumpgap' FLAG_PERM NoReverb
    LoadSound 'Shared\Goals\HUD_specialtrickAA' FLAG_PERM NoReverb
    LoadSound 'Shared\Goals\LandCombo01' FLAG_PERM NoReverb
    LoadSound 'Shared\Goals\GotStat04' FLAG_PERM NoReverb vol = 80
    LoadSound 'Skater\Sk6_JumpFar_01' FLAG_PERM NoReverb
    LoadSound 'Skater\BoardBounce01' FLAG_PERM
    LoadSound 'Skater\SK6_BulletZoomIn' FLAG_PERM NoReverb
    LoadSound 'Skater\SK6_BulletZoomOut' FLAG_PERM NoReverb
    LoadSound 'Skater\SK6_BulletHeart_11' FLAG_PERM NoReverb
    LoadSound 'Skater\SK6_Wind_Test_11' FLAG_PERM NoReverb
    LoadSound 'Shared\Misc\FlipTransitionUp01' FLAG_PERM
    LoadSound 'Shared\Misc\FlipTransitionDown01' FLAG_PERM
    LoadSound 'Shared\Goals\ClockTickUp' FLAG_PERM NoReverb
    LoadSound 'Shared\Goals\ClockTickDown' FLAG_PERM NoReverb
    LoadSound 'Shared\Goals\FlamingFireBall01' FLAG_PERM
    LoadSound 'Skater\SK6_Walk_Spray_Tag_01' FLAG_PERM
    LoadSound 'Skater\SK6_StickerSlap_01' FLAG_PERM
    UnloadPreFile 'skater_sounds.pre'
endscript

locked_track1 = -1
locked_track2 = -2

script LoadPermSongs 
    if ((IsTrue TestMusicFromHost)|| (cd))
        LoadMusicHeader 'music\music'
        GetArraySize playlist_tracks
        index = 0
        begin 
        path = ((playlist_tracks [ <index> ]).path)
        FormatText textname = tracktitle '%b: %t' b = ((playlist_tracks [ <index> ]).band)t = ((playlist_tracks [ <index> ]).track_title)
        AddMusicTrack <path> FLAG_PERM tracktitle = <tracktitle>
        index = (<index> + 1)
        repeat <array_size>
    endif
endscript

playlist_tracks = [
    {band = '25 Ta Life' track_title = 'Over the Years' genre = 2 path = 'music\vag\songs\25TaLife'}
    {band = 'Aesop Rock' track_title = 'No Jumper Cables(re-mix)' genre = 1 path = 'music\vag\songs\Aesop'}
    {band = 'Atmosphere  ' track_title = 'Trying to Find a Balance' genre = 1 path = 'music\vag\songs\Atmosphere'}
    {band = 'Audio Two' track_title = 'Top Billin\'' genre = 1 path = 'music\vag\songs\AudioTwo'}
    {band = 'Brand Nubian' track_title = 'Punks Jump Up To Get Beat Down' genre = 1 path = 'music\vag\songs\Nubian'}
    {band = 'Camaros' track_title = 'Cheesecake' genre = 0 path = 'music\vag\songs\Camaros'}
    {band = 'Cut Chemist' track_title = 'Drums of Fire' genre = 1 path = 'music\vag\songs\CutChemist'}
    {band = 'Das Oath' track_title = 'Awesome R***' genre = 2 path = 'music\vag\songs\Oath'}
    {band = 'Dead Boys' track_title = 'Sonic Reducer' genre = 0 path = 'music\vag\songs\DeadBoys'}
    {band = 'Dead End Road' track_title = 'Sin City' genre = 2 path = 'music\vag\songs\DeadEndRoad'}
    {band = 'Disturbed' track_title = 'Liberate' genre = 2 path = 'music\vag\songs\Disturbed'}
    {band = 'Diverse' track_title = 'Certified' genre = 1 path = 'music\vag\songs\Diverse'}
    {band = 'Faith No More' track_title = 'Midlife Crisis' genre = 2 path = 'music\vag\songs\FaithNoMore'}
    {band = 'Fear' track_title = 'I Love Livin\' In The City' genre = 0 path = 'music\vag\songs\Fear'}
    {band = 'Frank Sinatra' track_title = 'That\'s Life' genre = 2 path = 'music\vag\songs\Frank'}
    {band = 'Grand Puba' track_title = 'I Like It' genre = 1 path = 'music\vag\songs\GrandPuba'}
    {band = 'Handsome Boy...School' track_title = 'Holy Calamity' genre = 1 path = 'music\vag\songs\HandsomeBoy'}
    {band = 'Iggy & The Stooges' track_title = '1970' genre = 0 path = 'music\vag\songs\TheStooges'}
    {band = 'Jimmy Eat World' track_title = 'Pain' genre = 0 path = 'music\vag\songs\Jimmy'}
    {band = 'Johnny Cash' track_title = 'Ring of Fire' genre = 2 path = 'music\vag\songs\JohnnyCash'}
    {band = 'Joy Division' track_title = 'Warsaw' genre = 0 path = 'music\vag\songs\JoyD'}
    {band = 'Lamb of God' track_title = 'Black Label' genre = 2 path = 'music\vag\songs\LambofGod'}
    {band = 'Less Than Jake' track_title = 'That\'s Why They...Union' genre = 0 path = 'music\vag\songs\Jake'}
    {band = 'Libretto' track_title = 'Volume' genre = 1 path = 'music\vag\songs\Libretto'}
    {band = 'Living Legends' track_title = 'Night Prowler' genre = 1 path = 'music\vag\songs\LivingL'}
    {band = 'Melbeatz f.Kool Savas' track_title = 'Grind on' genre = 1 path = 'music\vag\songs\Melbeatz'}
    {band = 'Melvins' track_title = 'Sweet Willie Rollbar' genre = 0 path = 'music\vag\songs\Melvins'}
    {band = 'Metallica' track_title = 'Whiplash' genre = 2 path = 'music\vag\songs\Metallica'}
    {band = 'Mike V and The Rats' track_title = 'Never Give Up' genre = 0 path = 'music\vag\songs\MikeV'}
    {band = 'Ministry' track_title = 'No    ' genre = 2 path = 'music\vag\songs\Ministry'}
    {band = 'Nebula' track_title = 'So it Goes' genre = 2 path = 'music\vag\songs\Nebula'}
    {band = 'Operatic' track_title = 'Interested In Madness' genre = 2 path = 'music\vag\songs\Operatic'}
    {band = 'Pete Rock&CL Smooth' track_title = 'Soul Brother #1' genre = 1 path = 'music\vag\songs\PeteRock'}
    {band = 'Rancid' track_title = 'Fall Back Down' genre = 0 path = 'music\vag\songs\Rancid'}
    {band = 'Red Hot Chili Peppers' track_title = 'The Power of Equality' genre = 0 path = 'music\vag\songs\RedHots'}
    {band = 'Steel Pulse' track_title = 'Born Fe Rebel' genre = 2 path = 'music\vag\songs\SteelPulse'}
    {band = 'Suicide Machines' track_title = 'High Anxiety' genre = 0 path = 'music\vag\songs\SuicideMachines'}
    {band = 'The Casualties  ' track_title = 'Unknown Soldier' genre = 0 path = 'music\vag\songs\TheCasualties'}
    {band = 'The D.O.C.' track_title = 'Whirlwind Pyramid' genre = 1 path = 'music\vag\songs\DOC'}
    {band = 'The Distillers' track_title = 'Beat Your Heart Out' genre = 0 path = 'music\vag\songs\Distillers'}
    {band = 'The Doors' track_title = 'Break On Through' genre = 2 path = 'music\vag\songs\TheDoors'}
    {band = 'The Explosion' track_title = 'Here I Am' genre = 0 path = 'music\vag\songs\TheExplosion'}
    {band = 'The Germs' track_title = 'Lexicon Devil' genre = 0 path = 'music\vag\songs\TheGerms'}
    {band = 'The Hiss' track_title = 'Back on the Radio' genre = 2 path = 'music\vag\songs\Hiss'}
    {band = 'The Living End' track_title = 'End of the World' genre = 2 path = 'music\vag\songs\LivingEnd'}
    {band = 'The Ramones' track_title = 'Rock \'n Roll High School' genre = 0 path = 'music\vag\songs\TheRamones'}
    {band = 'The Sugarhill Gang' track_title = 'Rapper\'s Delight' genre = 1 path = 'music\vag\songs\TheSugarhill'}
    {band = 'Three Inches of Blood' track_title = 'Deadly Sinners' genre = 2 path = 'music\vag\songs\ThreeInches'}
    {band = 'Ultramagnetic MC\'s' track_title = 'Ego Trippin\'' genre = 1 path = 'music\vag\songs\Ultramagnetic'}
    {band = 'Violent Femmes' track_title = 'Add It Up' genre = 2 path = 'music\vag\songs\VFemmes'}
    {band = 'Ween' track_title = 'It\'s Gonna Be a Long Night' genre = 2 path = 'music\vag\songs\Ween'}
    {band = 'X' track_title = 'Los Angeles' genre = 2 path = 'music\vag\songs\XLA'}
    {band = 'ZEKE' track_title = 'Long Train Runnin\'' genre = 2 path = 'music\vag\songs\ZEKE'}
]
StreamPriorityLow = 10
StreamPriorityLowMid = 30
StreamPriorityMid = 50
StreamPriorityMidHigh = 70
StreamPriorityHigh = 90
StreamPriorityHighest = 100

script stat_goal_appear 
    playsound menu03 pitch = 50 volL = 160 volR = 80
    wait 0.08900 seconds
    playsound menu03 pitch = 63.00 volL = 160 volR = 80
    wait 0.08900 seconds
    playsound menu03 pitch = 74.92 volL = 160 volR = 80
    wait 0.08900 seconds
    playsound menu03 pitch = 100 volL = 160 volR = 80
endscript


script stat_goal_success 
    playsound GotStat04 vol = 150
endscript


script found_gap_success_sound 
    playsound DE_PauseFlyIn pitch = 200
    wait 1.800 seconds
    found_gap_away_sound
endscript


script found_gap_away_sound 
    playsound DE_PauseFlyIn pitch = 180 vol = 80
endscript


script LandPointsSound 
    playsound LandCombo01 vol = 250
endscript

Paused_Light_Rain = 0
Paused_Heavy_Rain = 0
Inside_Light_Rain = 0
Inside_Heavy_Rain = 0
LightRainVolume = 100
MediumRainVolume = 66

script Light_Rain_SFX_On 
    if NOT issoundplaying TestLight01
        if NOT issoundplaying TestLight02
            
            playsound Weather_Rain_Light01 vol = LightRainVolume id = TestLight01
            change Inside_Light_Rain = 0
        endif
    endif
endscript


script Heavy_Rain_SFX_On 
    
    if NOT issoundplaying TestLight02
        if NOT issoundplaying TestLight01
            
            playsound Weather_Rain_Light01 vol = LightRainVolume id = TestLight02
            change Inside_Heavy_Rain = 0
        endif
    endif
    if NOT issoundplaying TestMedium02
        
        playsound Weather_Rain_Medium01 vol = MediumRainVolume id = TestMedium02
    endif
endscript


script wait_and_start_rain 
    switch <type>
        case 1
        begin 
        wait 1
        if NOT issoundplaying TestLight01
            break 
        endif
        repeat 
        Light_Rain_SFX_On
        change Paused_Light_Rain = 0
        case 2
        begin 
        wait 1
        if NOT issoundplaying TestLight02
            break 
        endif
        repeat 
        begin 
        wait 1
        if NOT issoundplaying TestMedium02
            break 
        endif
        repeat 
        Heavy_Rain_SFX_On
        change Paused_Heavy_Rain = 0
    endswitch
    
    KillSpawnedScript type = wait_and_start_rain
endscript


script Ped_Skater_Grind_Bail_Sound 
    Temp_Ped_Fall_Sound
    wait 0.5000 seconds
    RandomNoRepeat (
        @ obj_playsound BailBoard01 pitch = randomrange (100.0, 102.0) vol = randomrange (40.0, 50.0)
        @ obj_playsound BailBoard02 pitch = randomrange (100.0, 102.0) vol = randomrange (40.0, 50.0)
        @ obj_playsound BailBoard03 pitch = randomrange (100.0, 102.0) vol = randomrange (40.0, 50.0)
        @ obj_playsound BailBoard04 pitch = randomrange (100.0, 102.0) vol = randomrange (40.0, 50.0)
        @ obj_playsound BailBoard05 pitch = randomrange (100.0, 102.0) vol = randomrange (40.0, 50.0)
    )
    RandomNoRepeat (
        @ obj_playsound BailBodyFall01 pitch = randomrange (95.0, 105.0) vol = randomrange (60.0, 80.0)
        @ obj_playsound BailBodyFall02 pitch = randomrange (95.0, 105.0) vol = randomrange (60.0, 80.0)
        @ obj_playsound BailBodyFall03 pitch = randomrange (95.0, 105.0) vol = randomrange (60.0, 80.0)
        @ obj_playsound BailBodyFall04 pitch = randomrange (95.0, 105.0) vol = randomrange (60.0, 80.0)
        @ obj_playsound BailBodyFall05 pitch = randomrange (95.0, 105.0) vol = randomrange (60.0, 80.0)
    )
endscript


script projectile_hit_ped_sounds 
    SpawnSound HandleBailBodyPunchSoundEffect
    SpawnSound HandleBailSlapSoundEffect
endscript


script Temp_Ped_Fall_Sound 
    RandomNoRepeat (
        @ obj_playsound BailBodyPunch01_11 pitch = randomrange (80.0, 102.0) vol = randomrange (100.0, 120.0)
        @ obj_playsound BailBodyPunch02_11 pitch = randomrange (80.0, 102.0) vol = randomrange (100.0, 120.0)
        @ obj_playsound BailBodyPunch03_11 pitch = randomrange (80.0, 102.0) vol = randomrange (100.0, 120.0)
        @ obj_playsound BailBodyPunch04_11 pitch = randomrange (80.0, 102.0) vol = randomrange (100.0, 120.0)
        @ obj_playsound BailBodyPunch05_11 pitch = randomrange (80.0, 102.0) vol = randomrange (100.0, 120.0)
    )
    RandomNoRepeat (
        @ obj_playsound BailSlap01 pitch = randomrange (95.0, 115.0) vol = randomrange (100.0, 120.0)
        @ obj_playsound BailSlap02 pitch = randomrange (95.0, 115.0) vol = randomrange (100.0, 120.0)
        @ obj_playsound BailSlap03 pitch = randomrange (95.0, 115.0) vol = randomrange (100.0, 120.0)
    )
endscript


script Goal_Success_Message_Sound 
    playsound GoalGood02 vol = 200
    PlayStream GoalSuccessStream vol = 150 priority = StreamPriorityHighest
endscript


script SK6_SFX_BulletTime_In 
    change SloMoMusicPaused = 1
    PauseMusic 1
    StopSound SK6_BulletZoomIn
    StopSound SK6_BulletZoomOut
    if NOT issoundplaying SK6_BulletZoomIn
        playsound SK6_BulletZoomIn vol = 130
    endif
    if NOT issoundplaying SK6_Wind_Test_11
        playsound SK6_Wind_Test_11
    endif
    wait 0.1500 seconds
    SpawnScript SK6_SFX_BulletTime_Heart
endscript


script SK6_SFX_BulletTime_Heart 
    HeartWaitTime = 0.3500
    HeartPitch = 105
    HeartVol = 150
    begin 
    playsound SK6_BulletHeart_11 pitch = <HeartPitch> vol = <HeartVol>
    wait <HeartWaitTime> seconds
    repeat 
endscript


script SK6_SFX_BulletTime_Out 
    StopSound SK6_BulletZoomOut
    StopSound SK6_BulletZoomIn
    if NOT issoundplaying SK6_BulletZoomOut
        playsound SK6_BulletZoomOut vol = 180
    endif
    StopSound SK6_BulletHeart_11
    StopSound SK6_Wind_Test_11
    KillSpawnedScript name = SK6_SFX_BulletTime_Heart
    wait 0.3300 seconds
    change SloMoMusicPaused = 0
    SFX_Music_Volume_Box_Restore_State
endscript


script THUG2_SFX_Tag_Spray_Wallplant 
    playsound SK6_Walk_Spray_Tag_01
endscript


script SK6_SFX_Jump_Booster_Sound 
    if (LevelIs load_bo)
    else
        if NOT (issoundplaying ThisBoostSound)
            playsound Sk6_JumpFar_01 id = ThisBoostSound vol = 100
        endif
        wait 0.2000 seconds
    endif
endscript


script SK6_SFX_Roll_Booster_Sound DefBoostSound = 1 DefSkaterVO = 0
    if (<DefBoostSound> = 1)
        if NOT (issoundplaying ThisBoostSound)
            playsound Sk6_JumpFar_01 id = ThisBoostSound vol = 100
        endif
    endif
endscript


script StartupMusicVol MusicVol = 50
    change MusicChangedAtStartup = 1
    change MusicStartupVolume = <MusicVol>
endscript


script SFX_SetOutsideVolAtTopOfLevel 
    if (MusicChangedAtStartup = 1)
        SetMusicVolume MusicStartupVolume
        change MusicVolOutsideBox = MusicStartupVolume
        change FadeTempMusicVol = (MusicVolOutsideBox)
        change MusicChangedAtStartup = 0
    else
        GetValueFromVolume cdvol
        change MusicVolOutsideBox = (<value> * 10)
        change FadeTempMusicVol = (MusicVolOutsideBox)
    endif
endscript


script SFX_refresh_music_box_triggers 
    Kill prefix = TRG_SFX_TrigBox_LG
    Kill prefix = TRG_SFX_TrigBox_MS
    if GetGlobalFlag flag = SOUNDS_MUSICBOXES_OFF
        return 
    endif
    if GotParam wait
        wait 1 gameframe
    endif
    Create prefix = TRG_SFX_TrigBox_MS
endscript


script SFX_Music_Volume_Box 
    if SkaterCamAnimFinished
        if NOT IsTrue cutscene_is_playing
            if (inside)
                SpawnScript SK6_Music_Fade_Out
                change StaticMusicBoxState = on
            else
                SpawnScript SK6_Music_Fade_In
                change StaticMusicBoxState = Off
            endif
        endif
    endif
endscript


script SFX_Music_Volume_Box_Restore_State 
    if LevelIs load_mainmenu
        return 
    endif
    if (StaticMusicBoxState = Off)
        if NOT GotParam sound_options
            if NOT (MusicVolOutsideBox = FadeTempMusicVol)
                SpawnScript SK6_Music_Fade_In params = { DoQuick = 1 }
            else
                if NOT (MusicVolOutsideBox = (FadeTempMusicVol - 1))
                    SpawnScript SK6_Music_Fade_In params = { DoQuick = 1 }
                endif
            endif
        endif
    else
        KillSpawnedScript name = SK6_Music_Fade_In
        KillSpawnedScript name = SK6_Music_Fade_Out
        if GotParam sound_options
            GetValueFromVolume cdvol
            change MusicVolOutsideBox = (<value> * 10)
        endif
        SetMusicVolume 0
    endif
endscript


script SFX_Music_Volume_Box_Kill_State 
    if (StaticMusicBoxState = on)
        change SloMoMusicPaused = 0
        SK6_Music_Fade_In DoQuick = 1
        change StaticMusicBoxState = Off
    endif
    change SloMoMusicPaused = 0
endscript


script SK6_Music_Fade_Out 
    if (SloMoMusicPaused = 1)
        return 
    endif
    if NOT (DontAdjustMusicViaProximNode = 1)
        if (FadeMusicOutRunning = 0)
            change FadeMusicOutRunning = 1
            GetValueFromVolume cdvol
            if NOT (<value> = 0)
                if (FadeMusicInRunning = 0)
                    GetValueFromVolume cdvol
                    change MusicVolOutsideBox = (<value> * 10)
                    change FadeTempMusicVol = (MusicVolOutsideBox)
                    KillSpawnedScript name = SK6_Music_Fade_In
                    change FadeMusicInRunning = 0
                else
                    KillSpawnedScript name = SK6_Music_Fade_In
                    change FadeMusicInRunning = 0
                endif
                begin 
                if (FadeTempMusicVol < 0.0)
                    FadeTempMusicVol = 0.0
                    break 
                endif
                if (FadeTempMusicVol < 0)
                    change FadeTempMusicVol = 0
                endif
                if (FadeTempMusicVol > 100)
                    change FadeTempMusicVol = 100
                endif
                SetMusicVolume FadeTempMusicVol
                if (MusicVolOutsideBox > 50)
                    change FadeTempMusicVol = (FadeTempMusicVol - (MusicVolOutsideBox / 50))
                else
                    change FadeTempMusicVol = (FadeTempMusicVol - 1)
                endif
                wait 1 gameframe
                repeat 101
                PauseMusic 1
            else
                KillSpawnedScript name = SK6_Music_Fade_In
                change FadeMusicInRunning = 0
                begin 
                if (FadeTempMusicVol < 0.0)
                    FadeTempMusicVol = 0.0
                    break 
                endif
                if (FadeTempMusicVol < 0)
                    change FadeTempMusicVol = 0
                endif
                if (FadeTempMusicVol > 100)
                    change FadeTempMusicVol = 100
                endif
                SetMusicVolume FadeTempMusicVol
                change FadeTempMusicVol = (FadeTempMusicVol - 1)
                wait 1 gameframe
                repeat 
            endif
            change FadeMusicOutRunning = 0
        endif
    endif
endscript


script SK6_Music_Fade_In { DoQuick = 0 }
    if (SloMoMusicPaused = 1)
        return 
    endif
    if NOT (DontAdjustMusicViaProximNode = 1)
        if (FadeMusicInRunning = 0)
            change FadeMusicInRunning = 1
            if NOT (FadeTempMusicVol = (MusicVolOutsideBox + 1))
                if (FadeMusicOutRunning = 0)
                    SetMusicVolume 0
                    change FadeTempMusicVol = 0.0
                    KillSpawnedScript name = SK6_Music_Fade_Out
                    change FadeMusicOutRunning = 0
                else
                    KillSpawnedScript name = SK6_Music_Fade_Out
                    change FadeMusicOutRunning = 0
                endif
                if (<DoQuick> = 0)
                    wait 2 gameframes
                endif
                PauseMusic 0
                if (<DoQuick> = 1)
                    change FadeTempMusicVol = MusicVolOutsideBox
                    if (FadeTempMusicVol < 0)
                        change FadeTempMusicVol = 0
                    endif
                    if (FadeTempMusicVol > 100)
                        change FadeTempMusicVol = 100
                    endif
                    SetMusicVolume FadeTempMusicVol
                else
                    begin 
                    if (FadeTempMusicVol > MusicVolOutsideBox)
                        change FadeTempMusicVol = MusicVolOutsideBox
                        break 
                    endif
                    if (FadeTempMusicVol < 0)
                        change FadeTempMusicVol = 0
                    endif
                    if (FadeTempMusicVol > 100)
                        change FadeTempMusicVol = 100
                    endif
                    SetMusicVolume FadeTempMusicVol
                    if (MusicVolOutsideBox > 50)
                        change FadeTempMusicVol = (FadeTempMusicVol + (MusicVolOutsideBox / 50))
                    else
                        change FadeTempMusicVol = (FadeTempMusicVol + 1)
                    endif
                    wait 1 gameframe
                    repeat 102
                endif
                PauseMusic 0
                GetValueFromVolume cdvol
                if (<DoQuick> = 0)
                    wait 2 gameframes
                endif
            endif
            change FadeMusicInRunning = 0
        endif
    endif
endscript


script Menu_SFX_Wheel_Click_Short 
    playsound MenuUp pitch = randomrange (98.0, 102.0) vol = randomrange (50.0, 60.0)
    wait 0.1000 seconds
    playsound MenuUp pitch = randomrange (98.0, 102.0) vol = randomrange (50.0, 60.0)
endscript


script Menu_SFX_Wheel_Click_Long 
    playsound MenuUp pitch = randomrange (105.0, 110.0) vol = randomrange (50.0, 60.0)
    wait 0.05000 seconds
    playsound MenuUp pitch = randomrange (100.0, 107.0) vol = randomrange (50.0, 60.0)
    wait 0.05000 seconds
    playsound MenuUp pitch = randomrange (98.0, 105.0) vol = randomrange (50.0, 60.0)
    wait 0.05000 seconds
    playsound MenuUp pitch = randomrange (98.0, 102.0) vol = randomrange (50.0, 60.0)
    wait 0.05000 seconds
    playsound MenuUp pitch = randomrange (90.0, 95.0) vol = randomrange (50.0, 60.0)
    wait 0.05000 seconds
    playsound MenuUp pitch = randomrange (90.0, 95.0) vol = randomrange (50.0, 60.0)
    wait 0.05000 seconds
    playsound MenuUp pitch = randomrange (90.0, 95.0) vol = randomrange (50.0, 60.0)
    wait 0.05000 seconds
    playsound MenuUp pitch = randomrange (87.0, 89.0) vol = randomrange (50.0, 60.0)
    wait 0.05000 seconds
endscript


script SK6_SFX_OutOfAmmoBuzzer 
    wait 0.3000 seconds
endscript


script Auto_SFX_Car_Tire_Squeal 
    if NOT (IsStreamPlaying LA_Skid)
        obj_playstream LA_Skid vol = randomrange (30.0, 60.0)
    endif
endscript


script Auto_SFX_CarBrakeSqueal 
    if NOT (IsStreamPlaying CarBrakeSqueal)
        obj_playstream CarBrakeSqueal vol = randomrange (5.0, 20.0) pitch = randomrange (80.0, 100.0) priority = StreamPriorityLow
    endif
endscript


script Auto_SFX_Car_Horn_Stream 
    if NOT (IsStreamPlaying CarHorn)
        wait Random (@ 0.2000 @ 0.4000 @ 0.6000) seconds
        obj_playstream CarHorn vol = randomrange (50.0, 60.0) pitch = randomrange (80.0, 100.0) dropoff = 120
    endif
endscript


script SK6_SFX_ShowClassicGoals 
    playsound DE_PauseFlyIn pitch = 200
    wait 0.2000 seconds
    playsound BailSlap02
endscript


script SK6_SFX_ShowPointsFromGoal 
    wait 12 gameframes
    playsound boneless09 pitch = 30
endscript


script SK6_SFX_IncomingBeeper 
    wait 1 gameframe
    PauseStream 0
    PlayStream SK6_Motorola_Ringtone vol = 150 priority = 101
endscript


script SK6_SFX_Get_Throwing_Item 
    if LevelIs load_bo
        PlayStream Sk6_Pickup_Apples vol = 120
    endif
    if LevelIs load_ba
        PlayStream Sk6_Pickup_Tomatoes vol = 120
    endif
    if LevelIs load_be
        PlayStream Sk6_Pickup_SprayCans vol = 120
    endif
    if LevelIs load_au
        PlayStream Sk6_Pickup_Shrimp vol = 120
    endif
    if LevelIs load_NO
        PlayStream Sk6_Pickup_Beads vol = 120
    endif
    if LevelIs load_st
        PlayStream Sk6_Pickup_SmokeBombs vol = 150
    endif
    if LevelIs load_se
    endif
endscript


script ALL_Levels_SFX_PlayThrowingSound 
    if LevelIs load_be
        skater ::obj_playsound SK6_Throw_SprayCan_11 vol = 400 pitch = 120
    endif
endscript


script ALL_Levels_SFX_Arcade_Game 
    wait 1 gameframe
    if SkaterCamAnimFinished
        begin 
        if NOT IsStreamPlaying ArcadeGameStream
            RandomNoRepeat (
                @*6 obj_playstream SK6_Arcade_Beeps_01 vol = 200 emitter = TRG_SFX_SOB_Arcade_Game priority = StreamPriorityLow dropoff_function = exponential id = ArcadeGameStream
                wait 28 seconds
                @*6 obj_playstream SK6_Arcade_Beeps_02 vol = 200 emitter = TRG_SFX_SOB_Arcade_Game priority = StreamPriorityLow dropoff_function = exponential id = ArcadeGameStream
                wait 38 seconds
                @ obj_playstream SK6_Arcade_Beeps_03 vol = 200 emitter = TRG_SFX_SOB_Arcade_Game priority = StreamPriorityLow dropoff_function = exponential id = ArcadeGameStream
                wait 10 seconds
                @*6 obj_playstream SK6_Arcade_Beeps_04 vol = 200 emitter = TRG_SFX_SOB_Arcade_Game priority = StreamPriorityLow dropoff_function = exponential id = ArcadeGameStream
                wait 11 seconds
                @*6 obj_playstream SK6_Arcade_Beeps_05 vol = 200 emitter = TRG_SFX_SOB_Arcade_Game priority = StreamPriorityLow dropoff_function = exponential id = ArcadeGameStream
                wait 35 seconds
            )
        endif
        wait 1 second
        repeat 
    endif
endscript


script SFX_Arcade_Goal_Win 
    
    PauseMusic 1
    StopSound GoalGood02
    StopStream GoalSuccessStream
    if NOT IsStreamPlaying WinArcadeGoal
        PlayStream SK6_Arcade_Beeps_WIN vol = 80 priority = 101 id = WinArcadeGoal
    endif
    wait 1 gameframe
    StopStream GoalSuccessStream
    begin 
    if NOT IsStreamPlaying WinArcadeGoal
        break 
    endif
    wait 1 gameframe
    repeat 
    SK6_Music_Fade_In
endscript


script SFX_Arcade_Goal_Lose 
    PauseMusic 1
    
    if NOT IsStreamPlaying LoseArcadeGoal
        PlayStream SK6_Arcade_Beeps_LOSE vol = 80 priority = 101 id = LoseArcadeGoal
    endif
    wait 1 gameframe
    StopStream GoalSuccessStream
    begin 
    if NOT IsStreamPlaying LoseArcadeGoal
        break 
    endif
    wait 1 gameframe
    repeat 
    SK6_Music_Fade_In
endscript


script ALL_Levels_Going_Through_Tree 
    
    if NOT IsStreamPlaying SK6_ThroughTrees
        PlayStream SK6_ThroughTrees vol = 140
    endif
endscript


script ALL_Levels_SFX_Start_Goal 
    PlayStream SK6_StartAGoal vol = 125 priority = 101
endscript


script Franklin_Grind_SFX 
    if IsStreamPlaying FranklinGrindThunder
        
        StopStream FranklinGrindThunder
        StopStream FranklinGrindThunder
    endif
    wait 1 gameframe
    PlayStream SK6_BE_LightningAndThunder01 vol = 130 id = FranklinGrindThunder priority = StreamPriorityHigh
endscript


script load_level_handle_ambient_sfx 
    if ((cd)|| (IsTrue TestMusicFromHost))
        ClearMusicTrackList
        change forceambientsfxtomusicvolume = 0
        change ambienttracknum = 0
        if GotParam ambient_track
            if IsArray <ambient_track>
                GetArraySize <ambient_track>
                i = 0
                begin 
                AddMusicTrack (<ambient_track> [ <i> ])
                i = (<i> + 1)
                repeat <array_size>
            else
                AddMusicTrack <ambient_track>
            endif
        endif
        set_music_ambient_state
    endif
endscript


script set_music_ambient_state 
    if LevelIs load_mainmenu
        SetCDToMusic
        return 
    endif
    if GotParam force
        StopMusic
    endif
    if IsTrue forceambientsfxtomusicvolume
        SetCDToAmbient
    else
        if ((MusicVolOutsideBox)= 0)
            SetCDToAmbient
        else
            SetCDToMusic
        endif
    endif
endscript


script set_se2_ambient_zone 
    if InSplitScreenGame
        return 
    endif
    if NOT GotParam zone
        zone = hell
    endif
    switch <zone>
        case spaceport
        change forceambientsfxtomusicvolume = 1
        change ambienttracknum = 1
        set_music_ambient_state force
        case Temple
        change forceambientsfxtomusicvolume = 1
        change ambienttracknum = 2
        set_music_ambient_state force
        case hell
        change forceambientsfxtomusicvolume = 0
        change ambienttracknum = 0
        set_music_ambient_state force
    endswitch
endscript


script SFX_Change_Footstep_Sounds_To_Default 
    change SFX_FootStepWalk01 = WalkStepConc01_11
    change SFX_FootStepWalk02 = WalkStepConc03_11
    change SFX_FootStepWalk03 = WalkStepConc05_11
    change SFX_FootStepRun01 = RunStepConc01_11
    change SFX_FootStepRun02 = RunStepConc02_11
    change SFX_FootStepRun03 = RunStepConc03_11
    change SFX_FootStepRun04 = RunStepConc03_11
    change SFX_FootStepRun05 = RunStepConc03_11
endscript


script Paulie_TalkShit Line = 0
    if NOT IsStreamPlaying ThisPaulieLine
        Random (
            @*50 
            @ PlayStream Paulie_Wild01 vol = 200 id = ThisPaulieLine
            @ PlayStream Paulie_Wild02 vol = 200 id = ThisPaulieLine
            @ PlayStream Paulie_Wild03 vol = 200 id = ThisPaulieLine
            @ PlayStream Paulie_Wild04 vol = 200 id = ThisPaulieLine
            @ PlayStream Paulie_Wild05 vol = 200 id = ThisPaulieLine
            @ PlayStream Paulie_Wild07 vol = 200 id = ThisPaulieLine
            @ PlayStream Paulie_Wild08 vol = 200 id = ThisPaulieLine
            @ PlayStream Paulie_Wild09 vol = 200 id = ThisPaulieLine
            @ PlayStream Paulie_Wild10 vol = 200 id = ThisPaulieLine
            @ PlayStream Paulie_Wild11 vol = 200 id = ThisPaulieLine
            @ PlayStream Paulie_Wild12 vol = 200 id = ThisPaulieLine
            @ PlayStream Paulie_Wild13 vol = 200 id = ThisPaulieLine
            @ PlayStream Paulie_Wild14 vol = 200 id = ThisPaulieLine
            @ PlayStream Paulie_Wild16 vol = 200 id = ThisPaulieLine
            @ PlayStream Paulie_Wild17 vol = 200 id = ThisPaulieLine
            @ PlayStream Paulie_Wild18 vol = 200 id = ThisPaulieLine
            @ PlayStream Paulie_Wild19 vol = 200 id = ThisPaulieLine
            @ PlayStream Paulie_Wild20 vol = 200 id = ThisPaulieLine
            @ PlayStream Paulie_Wild21 vol = 200 id = ThisPaulieLine
            @ PlayStream Paulie_Wild22 vol = 200 id = ThisPaulieLine
            @ PlayStream Paulie_Wild23 vol = 200 id = ThisPaulieLine
            @ PlayStream Paulie_Wild25 vol = 200 id = ThisPaulieLine
            @ PlayStream Paulie_Wild26 vol = 200 id = ThisPaulieLine
        )
    endif
endscript


script ALL_SFX_Wait_Before_Tantrum_Stream 
    wait 0.5000 seconds
    PlaySkaterStream type = 'tantrum'
endscript


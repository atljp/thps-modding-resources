
SCRIPT animload_AnchorMan_HEAD LoadFunction = LoadAnim 
	SetReferenceChecksum AnchorMan_HEAD 
	IF <LoadFunction> <...> name = "anims\\AnchorMan_HEAD\\default.ska" descChecksum = default 
		<LoadFunction> <...> name = "anims\\AnchorMan_HEAD\\idle.ska" descChecksum = idle 
	ENDIF 
	SetReferenceChecksum 0 
ENDSCRIPT

SCRIPT animload_anl_bat LoadFunction = LoadAnim 
	SetReferenceChecksum anl_pigeon 
	IF <LoadFunction> <...> name = "anims\\anl_bat\\default.ska" descChecksum = default 
		<LoadFunction> <...> name = "anims\\anl_bat\\Idle.ska" descChecksum = idle 
	ENDIF 
	SetReferenceChecksum 0 
ENDSCRIPT

SCRIPT animload_Anl_Bull LoadFunction = LoadAnim 
	SetReferenceChecksum Anl_Bull 
	IF <LoadFunction> <...> name = "anims\\anl_bull\\default.ska" descChecksum = default 
		<LoadFunction> <...> name = "anims\\anl_bull\\Idle.ska" descChecksum = idle 
		<LoadFunction> <...> name = "anims\\anl_bull\\Bull_Run.ska" descChecksum = Bull_Run 
	ENDIF 
	SetReferenceChecksum 0 
ENDSCRIPT

SCRIPT animload_anl_Cat LoadFunction = LoadAnim 
	SetReferenceChecksum anl_Cat 
	IF <LoadFunction> <...> name = "anims\\anl_Cat\\Idle.ska" descChecksum = idle 
		<LoadFunction> <...> name = "anims\\anl_Cat\\WalkFromIdle.ska" descChecksum = WalkFromIdle 
		<LoadFunction> <...> name = "anims\\anl_Cat\\Walk.ska" descChecksum = Walk 
		<LoadFunction> <...> name = "anims\\anl_Cat\\WalkToIdle.ska" descChecksum = WalkToIdle 
		<LoadFunction> <...> name = "anims\\anl_Cat\\LayIdle.ska" descChecksum = LayIdle 
		<LoadFunction> <...> name = "anims\\anl_Cat\\LayIdleToIdle.ska" descChecksum = LayIdleToIdle 
		<LoadFunction> <...> name = "anims\\anl_Cat\\RunFromWalk.ska" descChecksum = RunFromWalk 
		<LoadFunction> <...> name = "anims\\anl_Cat\\Run.ska" descChecksum = Run 
		<LoadFunction> <...> name = "anims\\anl_Cat\\RunToWalk.ska" descChecksum = RunToWalk 
		<LoadFunction> <...> name = "anims\\anl_Cat\\RunFromIdle.ska" descChecksum = RunFromIdle 
		<LoadFunction> <...> name = "anims\\anl_Cat\\RunToIdle.ska" descChecksum = RunToIdle 
		<LoadFunction> <...> name = "anims\\anl_Cat\\Pounce.ska" descChecksum = Pounce 
		<LoadFunction> <...> name = "anims\\anl_Cat\\default.ska" descChecksum = default 
		<LoadFunction> <...> name = "anims\\anl_Cat\\Attack.ska" descChecksum = Attack 
		<LoadFunction> <...> name = "anims\\anl_Cat\\SitIdle1.ska" descChecksum = SitIdle1 
		<LoadFunction> <...> name = "anims\\anl_Cat\\SitIdle2.ska" descChecksum = SitIdle2 
		<LoadFunction> <...> name = "anims\\anl_Cat\\SitIdle3.ska" descChecksum = SitIdle3 
		<LoadFunction> <...> name = "anims\\anl_Cat\\SitFromIdle.ska" descChecksum = SitFromIdle 
	ENDIF 
	SetReferenceChecksum 0 
ENDSCRIPT

SCRIPT animload_anl_dog LoadFunction = LoadAnim 
	SetReferenceChecksum anl_dog 
	IF <LoadFunction> <...> name = "anims\\anl_dog\\BarkIdle.ska" descChecksum = BarkIdle 
		<LoadFunction> <...> name = "anims\\anl_dog\\WalkFromIdle.ska" descChecksum = WalkFromIdle 
		<LoadFunction> <...> name = "anims\\anl_dog\\Walk.ska" descChecksum = Walk 
		<LoadFunction> <...> name = "anims\\anl_dog\\WalkToIdle.ska" descChecksum = WalkToIdle 
		<LoadFunction> <...> name = "anims\\anl_dog\\RunFromIdle.ska" descChecksum = RunFromIdle 
		<LoadFunction> <...> name = "anims\\anl_dog\\Run.ska" descChecksum = Run 
		<LoadFunction> <...> name = "anims\\anl_dog\\RunToIdle.ska" descChecksum = RunToIdle 
		<LoadFunction> <...> name = "anims\\anl_dog\\LiftLeg.ska" descChecksum = LiftLeg 
		<LoadFunction> <...> name = "anims\\anl_dog\\default.ska" descChecksum = default 
		<LoadFunction> <...> name = "anims\\anl_dog\\Idle.ska" descChecksum = idle 
		<LoadFunction> <...> name = "anims\\anl_dog\\Idle2.ska" descChecksum = Idle2 
	ENDIF 
	SetReferenceChecksum 0 
ENDSCRIPT

SCRIPT animload_anl_pigeon LoadFunction = LoadAnim 
	SetReferenceChecksum anl_pigeon 
	IF <LoadFunction> <...> name = "anims\\anl_pigeon\\Idle.ska" descChecksum = idle 
		<LoadFunction> <...> name = "anims\\anl_pigeon\\PeckFromIdle.ska" descChecksum = PeckFromIdle 
		<LoadFunction> <...> name = "anims\\anl_pigeon\\Peck.ska" descChecksum = Peck 
		<LoadFunction> <...> name = "anims\\anl_pigeon\\PeckToIdle.ska" descChecksum = PeckToIdle 
		<LoadFunction> <...> name = "anims\\anl_pigeon\\WalkFromIdle.ska" descChecksum = WalkFromIdle 
		<LoadFunction> <...> name = "anims\\anl_pigeon\\Walk.ska" descChecksum = Walk 
		<LoadFunction> <...> name = "anims\\anl_pigeon\\WalkToIdle.ska" descChecksum = WalkToIdle 
		<LoadFunction> <...> name = "anims\\anl_pigeon\\RunFromIdle.ska" descChecksum = RunFromIdle 
		<LoadFunction> <...> name = "anims\\anl_pigeon\\Run.ska" descChecksum = Run 
		<LoadFunction> <...> name = "anims\\anl_pigeon\\RunToIdle.ska" descChecksum = RunToIdle 
		<LoadFunction> <...> name = "anims\\anl_pigeon\\Flyhop.ska" descChecksum = Flyhop 
		<LoadFunction> <...> name = "anims\\anl_pigeon\\Preen.ska" descChecksum = Preen 
		<LoadFunction> <...> name = "anims\\anl_pigeon\\FlyFromIdle.ska" descChecksum = FlyFromIdle 
		<LoadFunction> <...> name = "anims\\anl_pigeon\\Fly.ska" descChecksum = Fly 
		<LoadFunction> <...> name = "anims\\anl_pigeon\\FlyToIdle.ska" descChecksum = FlyToIdle 
		<LoadFunction> <...> name = "anims\\anl_pigeon\\default.ska" descChecksum = default 
	ENDIF 
	SetReferenceChecksum 0 
ENDSCRIPT

SCRIPT animload_anl_seagull LoadFunction = LoadAnim 
	SetReferenceChecksum anl_seagull 
	IF <LoadFunction> <...> name = "anims\\anl_seagull\\Idle.ska" descChecksum = idle 
		<LoadFunction> <...> name = "anims\\anl_seagull\\FlyFromIdle.ska" descChecksum = FlyFromIdle 
		<LoadFunction> <...> name = "anims\\anl_seagull\\Fly.ska" descChecksum = Fly 
		<LoadFunction> <...> name = "anims\\anl_seagull\\FlyToIdle.ska" descChecksum = FlyToIdle 
		<LoadFunction> <...> name = "anims\\anl_seagull\\Glide.ska" descChecksum = Glide 
		<LoadFunction> <...> name = "anims\\anl_seagull\\GlideToIdle.ska" descChecksum = GlideToIdle 
		<LoadFunction> <...> name = "anims\\anl_seagull\\FlyHop.ska" descChecksum = Flyhop 
		<LoadFunction> <...> name = "anims\\anl_seagull\\default.ska" descChecksum = default 
	ENDIF 
	SetReferenceChecksum 0 
ENDSCRIPT

SCRIPT animload_anl_shark LoadFunction = LoadAnim 
	SetReferenceChecksum anl_shark 
	IF <LoadFunction> <...> name = "anims\\anl_shark\\Swim.ska" descChecksum = Swim 
		<LoadFunction> <...> name = "anims\\anl_shark\\Chomp.ska" descChecksum = Chomp 
		<LoadFunction> <...> name = "anims\\anl_shark\\Hit.ska" descChecksum = Hit 
		<LoadFunction> <...> name = "anims\\anl_shark\\default.ska" descChecksum = default 
	ENDIF 
	SetReferenceChecksum 0 
ENDSCRIPT

SCRIPT animload_anl_w_gorilla LoadFunction = LoadAnim 
	SetReferenceChecksum anl_w_gorilla 
	IF <LoadFunction> <...> name = "anims\\anl_w_gorilla\\default.ska" descChecksum = default 
		<LoadFunction> <...> name = "anims\\anl_w_gorilla\\idle.ska" descChecksum = idle 
	ENDIF 
	SetReferenceChecksum 0 
ENDSCRIPT

SCRIPT animload_BostonGuy_HEAD LoadFunction = LoadAnim 
	SetReferenceChecksum BostonGuy_HEAD 
	IF <LoadFunction> <...> name = "anims\\BostonGuy_HEAD\\default.ska" descChecksum = default 
		<LoadFunction> <...> name = "anims\\BostonGuy_HEAD\\idle.ska" descChecksum = idle 
	ENDIF 
	SetReferenceChecksum 0 
ENDSCRIPT

SCRIPT animload_Burnquist_Head LoadFunction = LoadAnim 
	SetReferenceChecksum Burnquist_Head 
	IF <LoadFunction> <...> name = "anims\\Burnquist_Head\\default.ska" descChecksum = default 
		<LoadFunction> <...> name = "anims\\Burnquist_Head\\idle.ska" descChecksum = idle 
	ENDIF 
	SetReferenceChecksum 0 
ENDSCRIPT

SCRIPT animload_Hawk_Head LoadFunction = LoadAnim 
	SetReferenceChecksum Hawk_Head 
	IF <LoadFunction> <...> name = "anims\\Hawk_Head\\default.ska" descChecksum = default 
		<LoadFunction> <...> name = "anims\\Hawk_Head\\idle.ska" descChecksum = idle 
	ENDIF 
	SetReferenceChecksum 0 
ENDSCRIPT

SCRIPT animload_Head_CAS_Female01 LoadFunction = LoadAnim 
	SetReferenceChecksum Head_CAS_Female01 
	IF <LoadFunction> <...> name = "anims\\Head_CAS_Female01\\default.ska" descChecksum = default 
		<LoadFunction> <...> name = "anims\\Head_CAS_Female01\\idle.ska" descChecksum = idle 
	ENDIF 
	SetReferenceChecksum 0 
ENDSCRIPT

SCRIPT animload_Head_Cas_Male01 LoadFunction = LoadAnim 
	SetReferenceChecksum Head_Cas_Male01 
	IF <LoadFunction> <...> name = "anims\\Head_Cas_Male01\\default.ska" descChecksum = default 
		<LoadFunction> <...> name = "anims\\Head_Cas_Male01\\idle.ska" descChecksum = idle 
	ENDIF 
	SetReferenceChecksum 0 
ENDSCRIPT

SCRIPT animload_Koston_Head LoadFunction = LoadAnim 
	SetReferenceChecksum Koston_Head 
	IF <LoadFunction> <...> name = "anims\\Koston_Head\\default.ska" descChecksum = default 
		<LoadFunction> <...> name = "anims\\Koston_Head\\idle.ska" descChecksum = idle 
	ENDIF 
	SetReferenceChecksum 0 
ENDSCRIPT

SCRIPT animload_Margera_Head LoadFunction = LoadAnim 
	SetReferenceChecksum Margera_Head 
	IF <LoadFunction> <...> name = "anims\\Margera_Head\\default.ska" descChecksum = default 
		<LoadFunction> <...> name = "anims\\Margera_Head\\idle.ska" descChecksum = idle 
	ENDIF 
	SetReferenceChecksum 0 
ENDSCRIPT

SCRIPT animload_Mullen_Head LoadFunction = LoadAnim 
	SetReferenceChecksum Mullen_Head 
	IF <LoadFunction> <...> name = "anims\\Mullen_Head\\default.ska" descChecksum = default 
		<LoadFunction> <...> name = "anims\\Mullen_Head\\idle.ska" descChecksum = idle 
	ENDIF 
	SetReferenceChecksum 0 
ENDSCRIPT

SCRIPT animload_Muska_Head LoadFunction = LoadAnim 
	SetReferenceChecksum Muska_Head 
	IF <LoadFunction> <...> name = "anims\\Muska_Head\\default.ska" descChecksum = default 
		<LoadFunction> <...> name = "anims\\Muska_Head\\idle.ska" descChecksum = idle 
	ENDIF 
	SetReferenceChecksum 0 
ENDSCRIPT

SCRIPT animload_Nigel_Head LoadFunction = LoadAnim 
	SetReferenceChecksum Nigel_Head 
	IF <LoadFunction> <...> name = "anims\\Nigel_Head\\default.ska" descChecksum = default 
		<LoadFunction> <...> name = "anims\\Nigel_Head\\idle.ska" descChecksum = idle 
	ENDIF 
	SetReferenceChecksum 0 
ENDSCRIPT

SCRIPT animload_NODrunk1_HEAD LoadFunction = LoadAnim 
	SetReferenceChecksum NODrunk1_HEAD 
	IF <LoadFunction> <...> name = "anims\\NODrunk1_HEAD\\default.ska" descChecksum = default 
		<LoadFunction> <...> name = "anims\\NODrunk1_HEAD\\idle.ska" descChecksum = idle 
	ENDIF 
	SetReferenceChecksum 0 
ENDSCRIPT

SCRIPT animload_NODrunk2_HEAD LoadFunction = LoadAnim 
	SetReferenceChecksum NODrunk2_HEAD 
	IF <LoadFunction> <...> name = "anims\\NODrunk2_HEAD\\default.ska" descChecksum = default 
		<LoadFunction> <...> name = "anims\\NODrunk2_HEAD\\idle.ska" descChecksum = idle 
	ENDIF 
	SetReferenceChecksum 0 
ENDSCRIPT

SCRIPT animload_Ped_Alien LoadFunction = LoadAnim 
	SetReferenceChecksum THPS6_human 
	IF <LoadFunction> <...> name = "anims\\Ped_Alien\\Ped_Alien_Idle.ska" descChecksum = Ped_Alien_Idle 
		<LoadFunction> <...> name = "anims\\Ped_Alien\\Ped_Alien_Avoid.ska" descChecksum = Ped_Alien_Avoid 
		<LoadFunction> <...> name = "anims\\Ped_Alien\\Ped_Alien_Avoid_Idle.ska" descChecksum = Ped_Alien_Avoid_Idle 
	ENDIF 
	SetReferenceChecksum 0 
ENDSCRIPT

SCRIPT animload_Ped_Baha LoadFunction = LoadAnim 
	SetReferenceChecksum THPS6_human 
	IF <LoadFunction> <...> name = "anims\\Ped_Baha\\Ped_Baha_Drive.ska" descChecksum = Ped_Baha_Drive 
	ENDIF 
	SetReferenceChecksum 0 
ENDSCRIPT

SCRIPT animload_Ped_Bikini LoadFunction = LoadAnim 
	SetReferenceChecksum Ped_Female 
	IF <LoadFunction> <...> name = "anims\\Ped_Bikini\\Ped_Bikini_LyingFront.ska" descChecksum = Ped_Bikini_LyingFront 
		<LoadFunction> <...> name = "anims\\Ped_Bikini\\Ped_Bikini_LyingBack.ska" descChecksum = Ped_Bikini_LyingBack 
		<LoadFunction> <...> name = "anims\\Ped_Bikini\\Ped_Bikini_Sit1.ska" descChecksum = Ped_Bikini_Sit1 
		<LoadFunction> <...> name = "anims\\Ped_Bikini\\Ped_Bikini_Sit2.ska" descChecksum = Ped_Bikini_Sit2 
		<LoadFunction> <...> name = "anims\\Ped_Bikini\\Ped_Bikini_Sit3.ska" descChecksum = Ped_Bikini_Sit3 
		<LoadFunction> <...> name = "anims\\Ped_Bikini\\Ped_Bikini_LyingFrontToBack.ska" descChecksum = Ped_Bikini_LyingFrontToBack 
		<LoadFunction> <...> name = "anims\\Ped_Bikini\\Ped_Bikini_LyingFrontFromBack.ska" descChecksum = Ped_Bikini_LyingFrontFromBack 
		<LoadFunction> <...> name = "anims\\Ped_Bikini\\Ped_Bikini_Sit1ToSunblock.ska" descChecksum = Ped_Bikini_Sit1ToSunblock 
		<LoadFunction> <...> name = "anims\\Ped_Bikini\\Ped_Bikini_Sunblock.ska" descChecksum = Ped_Bikini_Sunblock 
		<LoadFunction> <...> name = "anims\\Ped_Bikini\\Ped_Bikini_Sit1FromSunblock.ska" descChecksum = Ped_Bikini_Sit1FromSunblock 
		<LoadFunction> <...> name = "anims\\Ped_Bikini\\Ped_Bikini_Sit1ToSit2.ska" descChecksum = Ped_Bikini_Sit1ToSit2 
		<LoadFunction> <...> name = "anims\\Ped_Bikini\\Ped_Bikini_Sit1FromSit2.ska" descChecksum = Ped_Bikini_Sit1FromSit2 
		<LoadFunction> <...> name = "anims\\Ped_Bikini\\Ped_Bikini_Sit2ToSit3.ska" descChecksum = Ped_Bikini_Sit2ToSit3 
		<LoadFunction> <...> name = "anims\\Ped_Bikini\\Ped_Bikini_Sit1ToSit3.ska" descChecksum = Ped_Bikini_Sit1ToSit3 
		<LoadFunction> <...> name = "anims\\Ped_Bikini\\Ped_Bikini_Sit1FromSit3.ska" descChecksum = Ped_Bikini_Sit1FromSit3 
		<LoadFunction> <...> name = "anims\\Ped_Bikini\\Ped_Bikini_LyingBackToSit1.ska" descChecksum = Ped_Bikini_LyingBackToSit1 
		<LoadFunction> <...> name = "anims\\Ped_Bikini\\Ped_Bikini_LyingBackFromSit1.ska" descChecksum = Ped_Bikini_LyingBackFromSit1 
		<LoadFunction> <...> name = "anims\\Ped_Bikini\\Ped_Bikini_ChairToSit1.ska" descChecksum = Ped_Bikini_ChairToSit1 
		<LoadFunction> <...> name = "anims\\Ped_Bikini\\Ped_Bikini_ChairFromSit1.ska" descChecksum = Ped_Bikini_ChairFromSit1 
		<LoadFunction> <...> name = "anims\\Ped_Bikini\\Ped_Bikini_Chair.ska" descChecksum = Ped_Bikini_Chair 
	ENDIF 
	SetReferenceChecksum 0 
ENDSCRIPT

SCRIPT animload_Ped_Female LoadFunction = LoadAnim 
	SetReferenceChecksum Ped_Female 
	IF <LoadFunction> <...> name = "anims\\Ped_Bitches\\Ped_Bitches_Knockdown.ska" descChecksum = Ped_Bitches_Knockdown 
		<LoadFunction> <...> name = "anims\\Ped_Bitches\\Ped_Bitches_GetUp.ska" descChecksum = Ped_Bitches_GetUp 
		<LoadFunction> <...> name = "anims\\Ped_Bitches\\Ped_Bitches_LyingIdle.ska" descChecksum = Ped_Bitches_LyingIdle 
		<LoadFunction> <...> name = "anims\\Ped_Female\\Ped_F_Angry.ska" descChecksum = Ped_F_Angry 
		<LoadFunction> <...> name = "anims\\Ped_Female\\Ped_F_Idle1.ska" descChecksum = Ped_F_Idle1 
		<LoadFunction> <...> name = "anims\\Ped_Female\\Ped_F_Idle1ToIdle2.ska" descChecksum = Ped_F_Idle1ToIdle2 
		<LoadFunction> <...> name = "anims\\Ped_Female\\Ped_F_Idle2.ska" descChecksum = Ped_F_Idle2 
		<LoadFunction> <...> name = "anims\\Ped_Female\\Ped_F_Idle2ToIdle1.ska" descChecksum = Ped_F_Idle2ToIdle1 
		<LoadFunction> <...> name = "anims\\Ped_Female\\Ped_F_Idle1ToIdle3.ska" descChecksum = Ped_F_Idle1ToIdle3 
		<LoadFunction> <...> name = "anims\\Ped_Female\\Ped_F_Idle3.ska" descChecksum = Ped_F_Idle3 
		<LoadFunction> <...> name = "anims\\Ped_Female\\Ped_F_Idle4.ska" descChecksum = Ped_F_Idle4 
		<LoadFunction> <...> name = "anims\\Ped_Female\\default.ska" descChecksum = default 
		<LoadFunction> <...> name = "anims\\Ped_Female\\Ped_F_Idle5.ska" descChecksum = Ped_F_Idle5 
		<LoadFunction> <...> name = "anims\\Ped_Female\\Ped_F_Idle6.ska" descChecksum = Ped_F_Idle6 
		<LoadFunction> <...> name = "anims\\Ped_Female\\Ped_F_Idle7.ska" descChecksum = Ped_F_Idle7 
		<LoadFunction> <...> name = "anims\\Ped_Female\\Ped_F_Idle8.ska" descChecksum = Ped_F_Idle8 
		<LoadFunction> <...> name = "anims\\Ped_Female\\Ped_F_RotateLFromIdle1.ska" descChecksum = Ped_F_RotateLFromIdle1 
		<LoadFunction> <...> name = "anims\\Ped_Female\\Ped_F_RotateLFromIdle2.ska" descChecksum = Ped_F_RotateLFromIdle2 
		<LoadFunction> <...> name = "anims\\Ped_Female\\Ped_F_RotateLFromIdle3.ska" descChecksum = Ped_F_RotateLFromIdle3 
		<LoadFunction> <...> name = "anims\\Ped_Female\\Ped_F_JumpBack.ska" descChecksum = Ped_F_JumpBack 
		<LoadFunction> <...> name = "anims\\Ped_Female\\Ped_F_JumpForward.ska" descChecksum = Ped_F_JumpForward 
		<LoadFunction> <...> name = "anims\\Ped_Female\\Ped_F_JumpRight.ska" descChecksum = Ped_F_JumpRight 
		<LoadFunction> <...> name = "anims\\Ped_Female\\Ped_F_Push.ska" descChecksum = Ped_F_Push 
		<LoadFunction> <...> name = "anims\\Ped_Female\\Ped_F_Run.ska" descChecksum = Ped_F_Run 
		<LoadFunction> <...> name = "anims\\Ped_Female\\Ped_F_RunToIdle1.ska" descChecksum = Ped_F_RunToIdle1 
		<LoadFunction> <...> name = "anims\\Ped_Female\\Ped_F_RunToIdle2.ska" descChecksum = Ped_F_RunToIdle2 
		<LoadFunction> <...> name = "anims\\Ped_Female\\Ped_F_Talk1.ska" descChecksum = Ped_F_Talk1 
		<LoadFunction> <...> name = "anims\\Ped_Female\\Ped_F_Talk2.ska" descChecksum = Ped_F_Talk2 
		<LoadFunction> <...> name = "anims\\Ped_Female\\Ped_F_Talk3.ska" descChecksum = Ped_F_Talk3 
		<LoadFunction> <...> name = "anims\\Ped_Female\\Ped_F_Talk4.ska" descChecksum = Ped_F_Talk4 
		<LoadFunction> <...> name = "anims\\Ped_Female\\Ped_F_Talk5.ska" descChecksum = Ped_F_Talk5 
		<LoadFunction> <...> name = "anims\\Ped_Female\\Ped_F_Talk6.ska" descChecksum = Ped_F_Talk6 
		<LoadFunction> <...> name = "anims\\Ped_Female\\Ped_F_WalkFromIdle1.ska" descChecksum = Ped_F_WalkFromIdle1 
		<LoadFunction> <...> name = "anims\\Ped_Female\\Ped_F_Walk.ska" descChecksum = Ped_F_Walk 
		<LoadFunction> <...> name = "anims\\Ped_Female\\Ped_F_WalkToIdle1.ska" descChecksum = Ped_F_WalkToIdle1 
		<LoadFunction> <...> name = "anims\\Ped_Female\\Ped_F_WalkingWave.ska" descChecksum = Ped_F_WalkingWave 
		<LoadFunction> <...> name = "anims\\Ped_Female\\Ped_F_Wave.ska" descChecksum = Ped_F_Wave 
	ENDIF 
	SetReferenceChecksum 0 
ENDSCRIPT

SCRIPT animload_Ped_Blocker LoadFunction = LoadAnim 
	SetReferenceChecksum THPS6_human 
	IF <LoadFunction> <...> name = "anims\\Ped_Blocker\\Ped_Blocker_idle.ska" descChecksum = Ped_Blocker_idle 
		<LoadFunction> <...> name = "anims\\Ped_Blocker\\Ped_Blocker_idle02.ska" descChecksum = Ped_Blocker_idle02 
		<LoadFunction> <...> name = "anims\\Ped_Blocker\\Ped_Blocker_idletoBlockA.ska" descChecksum = Ped_Blocker_idletoBlockA 
		<LoadFunction> <...> name = "anims\\Ped_Blocker\\Ped_Blocker_BlockA_idle.ska" descChecksum = Ped_Blocker_BlockA_idle 
		<LoadFunction> <...> name = "anims\\Ped_Blocker\\Ped_Blocker_BlockA2BlockB.ska" descChecksum = Ped_Blocker_BlockA2BlockB 
		<LoadFunction> <...> name = "anims\\Ped_Blocker\\Ped_Blocker_BlockB_idle.ska" descChecksum = Ped_Blocker_BlockB_idle 
		<LoadFunction> <...> name = "anims\\Ped_Blocker\\Ped_Blocker_BllockB2BlockA.ska" descChecksum = Ped_Blocker_BllockB2BlockA 
		<LoadFunction> <...> name = "anims\\Ped_Blocker\\Ped_Blocker_BlockA2idle.ska" descChecksum = Ped_Blocker_BlockA2idle 
		<LoadFunction> <...> name = "anims\\Ped_Blocker\\Ped_Blocker_idletoBlockB.ska" descChecksum = Ped_Blocker_idletoBlockB 
		<LoadFunction> <...> name = "anims\\Ped_Blocker\\Ped_Blocker_BlockB2idle.ska" descChecksum = Ped_Blocker_BlockB2idle 
		<LoadFunction> <...> name = "anims\\Ped_Blocker\\Ped_Blocker_ShuffleBlockLeft.ska" descChecksum = Ped_Blocker_ShuffleBlockLeft 
		<LoadFunction> <...> name = "anims\\Ped_Blocker\\Ped_Blocker_ShuffleBlockRight.ska" descChecksum = Ped_Blocker_ShuffleBlockRight 
	ENDIF 
	SetReferenceChecksum 0 
ENDSCRIPT

SCRIPT animload_PED_M_Pissed LoadFunction = LoadAnim 
	SetReferenceChecksum THPS6_human 
	IF <LoadFunction> <...> name = "anims\\Ped_CopClipboard\\Ped_CopClipboard_Stand.ska" descChecksum = Ped_CopClipboard_Stand 
		<LoadFunction> <...> name = "anims\\Ped_CopClipboard\\Ped_CopClipboard_Stand2Idle.ska" descChecksum = Ped_CopClipboard_Stand2Idle 
		<LoadFunction> <...> name = "anims\\Ped_CopClipboard\\Ped_CopClipboard1.ska" descChecksum = Ped_CopClipboard1 
		<LoadFunction> <...> name = "anims\\Ped_CopClipboard\\Ped_CopClipboard2.ska" descChecksum = Ped_CopClipboard2 
		<LoadFunction> <...> name = "anims\\Ped_CopClipboard\\Ped_CopClipboard3.ska" descChecksum = Ped_CopClipboard3 
		<LoadFunction> <...> name = "anims\\Ped_CopClipboard\\Ped_CopClipboard4.ska" descChecksum = Ped_CopClipboard4 
		<LoadFunction> <...> name = "anims\\PED_M_Pissed\\PED_M_Pissed01.ska" descChecksum = PED_M_Pissed01 
		<LoadFunction> <...> name = "anims\\PED_M_Pissed\\PED_M_Pissed02.ska" descChecksum = PED_M_Pissed02 
		<LoadFunction> <...> name = "anims\\PED_M_Pissed\\PED_M_Pissed03.ska" descChecksum = PED_M_Pissed03 
		<LoadFunction> <...> name = "anims\\PED_M_Pissed\\PED_M_Pissed04.ska" descChecksum = PED_M_Pissed04 
	ENDIF 
	SetReferenceChecksum 0 
ENDSCRIPT

SCRIPT animload_Ped_CraneOperator LoadFunction = LoadAnim 
	SetReferenceChecksum THPS6_human 
	IF <LoadFunction> <...> name = "anims\\Ped_CraneOperator\\Ped_CraneOperator.ska" descChecksum = Ped_CraneOperator 
	ENDIF 
	SetReferenceChecksum 0 
ENDSCRIPT

SCRIPT animload_Ped_Dancer LoadFunction = LoadAnim 
	SetReferenceChecksum Ped_Female 
	IF <LoadFunction> <...> name = "anims\\Ped_Dancer\\Ped_Dancer_Pole1.ska" descChecksum = Ped_Dancer_Pole1 
		<LoadFunction> <...> name = "anims\\Ped_Dancer\\Ped_Dancer_Pole2.ska" descChecksum = Ped_Dancer_Pole2 
		<LoadFunction> <...> name = "anims\\Ped_Dancer\\Ped_Dancer_Pole3.ska" descChecksum = Ped_Dancer_Pole3 
		<LoadFunction> <...> name = "anims\\Ped_Dancer\\Ped_Dancer_Pole1ToPole2.ska" descChecksum = Ped_Dancer_Pole1ToPole2 
		<LoadFunction> <...> name = "anims\\Ped_Dancer\\Ped_Dancer_Pole2ToPole3.ska" descChecksum = Ped_Dancer_Pole2ToPole3 
		<LoadFunction> <...> name = "anims\\Ped_Dancer\\Ped_Dancer_Pole4.ska" descChecksum = Ped_Dancer_Pole4 
		<LoadFunction> <...> name = "anims\\Ped_Dancer\\Ped_Dancer_Pole3ToPole4.ska" descChecksum = Ped_Dancer_Pole3ToPole4 
		<LoadFunction> <...> name = "anims\\Ped_Dancer\\Ped_Dancer_Pole4ToPole1.ska" descChecksum = Ped_Dancer_Pole4ToPole1 
	ENDIF 
	SetReferenceChecksum 0 
ENDSCRIPT

SCRIPT animload_Ped_DJQBert LoadFunction = LoadAnim 
	SetReferenceChecksum THPS6_human 
	IF <LoadFunction> <...> name = "anims\\Ped_DJQBert\\Ped_DJQBert_Scratch1.ska" descChecksum = Ped_DJQBert_Scratch1 
		<LoadFunction> <...> name = "anims\\Ped_DJQBert\\Ped_DJQBert_Scratch2.ska" descChecksum = Ped_DJQBert_Scratch2 
		<LoadFunction> <...> name = "anims\\Ped_DJQBert\\Ped_DJQBert_Scratch6.ska" descChecksum = Ped_DJQBert_Scratch6 
	ENDIF 
	SetReferenceChecksum 0 
ENDSCRIPT

SCRIPT animload_Ped_Driver LoadFunction = LoadAnim 
	SetReferenceChecksum THPS6_human 
	IF <LoadFunction> <...> name = "anims\\Ped_Driver\\Ped_Driver_Turn_Range.ska" descChecksum = Ped_Driver_Turn_Range 
		<LoadFunction> <...> name = "anims\\Ped_Driver\\Ped_Driver_Forklift.ska" descChecksum = Ped_Driver_Forklift 
	ENDIF 
	SetReferenceChecksum 0 
ENDSCRIPT

SCRIPT animload_THPS6_human LoadFunction = LoadAnim 
	animload_THPS6_human_0 <...> 
	animload_THPS6_human_1 <...> 
ENDSCRIPT

SCRIPT animload_THPS6_human_0 LoadFunction = LoadAnim 
	SetReferenceChecksum THPS6_human 
	IF <LoadFunction> <...> name = "anims\\Ped_M\\Ped_M_CheerIdle6.ska" descChecksum = Ped_M_CheerIdle6 
		<LoadFunction> <...> name = "anims\\Ped_M\\Ped_M_CheerIdle5.ska" descChecksum = Ped_M_CheerIdle5 
		<LoadFunction> <...> name = "anims\\Ped_M\\Ped_M_CheerIdle2.ska" descChecksum = Ped_M_CheerIdle2 
		<LoadFunction> <...> name = "anims\\Ped_M\\Ped_M_CheerIdle3.ska" descChecksum = Ped_M_CheerIdle3 
		<LoadFunction> <...> name = "anims\\Ped_M\\Ped_M_CheerIdle4.ska" descChecksum = Ped_M_CheerIdle4 
		<LoadFunction> <...> name = "anims\\Ped_M\\Ped_M_CheerIdle1.ska" descChecksum = Ped_M_CheerIdle1 
		<LoadFunction> <...> name = "anims\\Ped_M\\Ped_M_CheerIdleFlip.ska" descChecksum = Ped_M_CheerIdleFlip 
		<LoadFunction> <...> name = "anims\\Ped_M\\Ped_M_Cheering.ska" descChecksum = Ped_M_Cheering 
		<LoadFunction> <...> name = "anims\\Ped_M\\Ped_M_Cheer1.ska" descChecksum = Ped_M_Cheer1 
		<LoadFunction> <...> name = "anims\\Ped_M\\Ped_M_Cheer5.ska" descChecksum = Ped_M_Cheer5 
		<LoadFunction> <...> name = "anims\\Ped_M\\Ped_M_Cheer6.ska" descChecksum = Ped_M_Cheer6 
		<LoadFunction> <...> name = "anims\\Ped_M\\Ped_M_Cheer7.ska" descChecksum = Ped_M_Cheer7 
		<LoadFunction> <...> name = "anims\\Ped_M\\Ped_M_Cheer_KneelingIdle.ska" descChecksum = Ped_M_Cheer_KneelingIdle 
		<LoadFunction> <...> name = "anims\\Ped_M\\Ped_M_Cheer_Kneeling1.ska" descChecksum = Ped_M_Cheer_Kneeling1 
		<LoadFunction> <...> name = "anims\\Ped_M\\Ped_M_Cheer_Kneeling2.ska" descChecksum = Ped_M_Cheer_Kneeling2 
		<LoadFunction> <...> name = "anims\\Ped_M\\Ped_M_Cheer_Kneeling3.ska" descChecksum = Ped_M_Cheer_Kneeling3 
		<LoadFunction> <...> name = "anims\\Ped_M\\Ped_M_Cheer_KneelingIdle2.ska" descChecksum = Ped_M_Cheer_KneelingIdle2 
		<LoadFunction> <...> name = "anims\\Ped_M\\Ped_M_Cheer_Sitting1.ska" descChecksum = Ped_M_Cheer_Sitting1 
		<LoadFunction> <...> name = "anims\\Ped_M\\Ped_M_Cheer_Sitting2.ska" descChecksum = Ped_M_Cheer_Sitting2 
		<LoadFunction> <...> name = "anims\\Ped_M\\Ped_M_Cheer_Sitting3.ska" descChecksum = Ped_M_Cheer_Sitting3 
		<LoadFunction> <...> name = "anims\\Ped_M\\Ped_M_Cheer_Sitting4.ska" descChecksum = Ped_M_Cheer_Sitting4 
		<LoadFunction> <...> name = "anims\\Ped_M\\Ped_M_Cheer_Sitting5.ska" descChecksum = Ped_M_Cheer_Sitting5 
		<LoadFunction> <...> name = "anims\\Ped_M\\Ped_M_Cheer_SittingFlip.ska" descChecksum = Ped_M_Cheer_SittingFlip 
		<LoadFunction> <...> name = "anims\\Ped_M\\Ped_M_Cheer_SittingIdle.ska" descChecksum = Ped_M_Cheer_SittingIdle 
		<LoadFunction> <...> name = "anims\\Ped_M\\Ped_M_Cheer_SittingIdle2.ska" descChecksum = Ped_M_Cheer_SittingIdle2 
		<LoadFunction> <...> name = "anims\\Ped_M\\Ped_M_Cheer_SittingIdle3.ska" descChecksum = Ped_M_Cheer_SittingIdle3 
		<LoadFunction> <...> name = "anims\\Ped_M\\Ped_M_Cheer_SittingLeft.ska" descChecksum = Ped_M_Cheer_SittingLeft 
		<LoadFunction> <...> name = "anims\\Ped_M\\Ped_M_Clap.ska" descChecksum = Ped_M_Clap 
		<LoadFunction> <...> name = "anims\\Ped_M_Idles\\Ped_M_Idle1.ska" descChecksum = Ped_M_Idle1 
		<LoadFunction> <...> name = "anims\\Ped_M\\Ped_M_SkateIdle1.ska" descChecksum = Ped_M_SkateIdle1 
		<LoadFunction> <...> name = "anims\\Ped_M\\Ped_M_SkateIdle2.ska" descChecksum = Ped_M_SkateIdle2 
		<LoadFunction> <...> name = "anims\\Ped_M\\Ped_M_SkateIdle3.ska" descChecksum = Ped_M_SkateIdle3 
		<LoadFunction> <...> name = "anims\\Ped_M\\Ped_M_SkateIdle4.ska" descChecksum = Ped_M_SkateIdle4 
		<LoadFunction> <...> name = "anims\\Ped_M\\Ped_M_SkateIdle5.ska" descChecksum = Ped_M_SkateIdle5 
		<LoadFunction> <...> name = "anims\\Ped_M\\Ped_M_SkateIdle6.ska" descChecksum = Ped_M_SkateIdle6 
		<LoadFunction> <...> name = "anims\\Ped_M\\Ped_M_SkateIdle7.ska" descChecksum = Ped_M_SkateIdle7 
		<LoadFunction> <...> name = "anims\\Ped_M\\Ped_M_SkateIdleA.ska" descChecksum = Ped_M_SkateIdleA 
		<LoadFunction> <...> name = "anims\\Ped_M\\Ped_M_SkateIdleB.ska" descChecksum = Ped_M_SkateIdleB 
		<LoadFunction> <...> name = "anims\\Ped_M\\Ped_M_SkateIdleC.ska" descChecksum = Ped_M_SkateIdleC 
		<LoadFunction> <...> name = "anims\\Ped_M\\Ped_M_SkateIdleD.ska" descChecksum = Ped_M_SkateIdleD 
		<LoadFunction> <...> name = "anims\\Ped_M\\Ped_M_Talk2_Idle.ska" descChecksum = Ped_M_Talk2_Idle 
		<LoadFunction> <...> name = "anims\\Ped_M\\Ped_M_Talk2_Idle2.ska" descChecksum = Ped_M_Talk2_Idle2 
		<LoadFunction> <...> name = "anims\\Ped_M\\Ped_M_Talk2_RightHere.ska" descChecksum = Ped_M_Talk2_RightHere 
		<LoadFunction> <...> name = "anims\\Ped_M\\Ped_M_Talk2_MixIt.ska" descChecksum = Ped_M_Talk2_MixIt 
		<LoadFunction> <...> name = "anims\\Ped_M\\Ped_M_Talk2_SureThing.ska" descChecksum = Ped_M_Talk2_SureThing 
		<LoadFunction> <...> name = "anims\\Ped_M\\Ped_M_Talk2_Maybe.ska" descChecksum = Ped_M_Talk2_Maybe 
		<LoadFunction> <...> name = "anims\\Ped_M\\Ped_M_Talk2_WhatDoYouThink.ska" descChecksum = Ped_M_Talk2_WhatDoYouThink 
		<LoadFunction> <...> name = "anims\\Ped_M\\Ped_M_Talk2_OfCourse.ska" descChecksum = Ped_M_Talk2_OfCourse 
		<LoadFunction> <...> name = "anims\\Ped_M\\Ped_M_Talk2_BackThere.ska" descChecksum = Ped_M_Talk2_BackThere 
		<LoadFunction> <...> name = "anims\\Ped_M\\Ped_M_Talk2_RoundAndRound.ska" descChecksum = Ped_M_Talk2_RoundAndRound 
	ENDIF 
	SetReferenceChecksum 0 
ENDSCRIPT

SCRIPT animload_THPS6_human_1 LoadFunction = LoadAnim 
	SetReferenceChecksum THPS6_human 
	IF <LoadFunction> <...> name = "anims\\Ped_M\\Ped_M_Talk2_UpAbove.ska" descChecksum = Ped_M_Talk2_UpAbove 
		<LoadFunction> <...> name = "anims\\Ped_M\\Ped_M_Talk2_KnowWhatIMean.ska" descChecksum = Ped_M_Talk2_KnowWhatIMean 
		<LoadFunction> <...> name = "anims\\Ped_M\\Ped_M_Talk2_GoAhead.ska" descChecksum = Ped_M_Talk2_GoAhead 
		<LoadFunction> <...> name = "anims\\Ped_M\\Ped_M_Talk2_TheyllTellYou.ska" descChecksum = Ped_M_Talk2_TheyllTellYou 
		<LoadFunction> <...> name = "anims\\Ped_M\\Ped_M_ThumbUp.ska" descChecksum = Ped_M_ThumbUp 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\Cheer1.ska" descChecksum = Cheer1 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\Cheer2.ska" descChecksum = Cheer2 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\Idle.ska" descChecksum = idle 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\Prop.ska" descChecksum = Prop 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\Taunt1.ska" descChecksum = Taunt1 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\Taunt2.ska" descChecksum = Taunt2 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\Taunt3.ska" descChecksum = Taunt3 
		<LoadFunction> <...> name = "anims\\THPS6_Basics\\Default.ska" descChecksum = default 
		<LoadFunction> <...> name = "anims\\thps6_skater_OnFoot_partial\\WStandIdle1_Partial.ska" descChecksum = WStandIdle1_Partial 
		<LoadFunction> <...> name = "anims\\thps6_skater_OnFoot_partial\\WStandIdle2_Partial.ska" descChecksum = WStandIdle2_Partial 
		<LoadFunction> <...> name = "anims\\thps6_skater_OnFoot_partial\\WStandIdle3_Partial.ska" descChecksum = WStandIdle3_Partial 
		<LoadFunction> <...> name = "anims\\thps6_skater_OnFoot_partial\\WStandIdle4_Partial.ska" descChecksum = WStandIdle4_Partial 
		<LoadFunction> <...> name = "anims\\thps6_skater_OnFoot_partial\\WStandIdle5_Partial.ska" descChecksum = WStandIdle5_Partial 
		<LoadFunction> <...> name = "anims\\thps6_skater_OnFoot_partial\\WStandIdle6_Partial.ska" descChecksum = WStandIdle6_Partial 
		<LoadFunction> <...> name = "anims\\thps6_skater_OnFoot_partial\\LadderFastClimb_Partial.ska" descChecksum = LadderFastClimb_Partial 
		<LoadFunction> <...> name = "anims\\thps6_skater_OnFoot_partial\\JumpLandToWalk_Partial.ska" descChecksum = JumpLandToWalk_Partial 
		<LoadFunction> <...> name = "anims\\THPS6_Skater_Basics\\Throw_Sidearm.ska" descChecksum = Throw_Sidearm 
		<LoadFunction> <...> name = "anims\\thps6_skater_OnFoot\\WalkingSlap.ska" descChecksum = WalkingSlap 
		<LoadFunction> <...> name = "anims\\thps6_skater_OnFoot\\WStandIdle1.ska" descChecksum = WStandIdle1 
		<LoadFunction> <...> name = "anims\\thps6_skater_OnFoot\\WStandIdle2.ska" descChecksum = WStandIdle2 
		<LoadFunction> <...> name = "anims\\thps6_skater_OnFoot\\WStandIdle3.ska" descChecksum = WStandIdle3 
		<LoadFunction> <...> name = "anims\\thps6_skater_OnFoot\\WStandIdle4.ska" descChecksum = WStandIdle4 
		<LoadFunction> <...> name = "anims\\thps6_skater_OnFoot\\WStandIdle5.ska" descChecksum = WStandIdle5 
		<LoadFunction> <...> name = "anims\\thps6_skater_OnFoot\\WStandIdle6.ska" descChecksum = WStandIdle6 
	ENDIF 
	SetReferenceChecksum 0 
ENDSCRIPT

SCRIPT animload_THPS6_human_unloadable LoadFunction = LoadAnim 
	animload_THPS6_human_unloadable_0 <...> 
	animload_THPS6_human_unloadable_1 <...> 
	animload_THPS6_human_unloadable_2 <...> 
	animload_THPS6_human_unloadable_3 <...> 
	animload_THPS6_human_unloadable_4 <...> 
	animload_THPS6_human_unloadable_5 <...> 
	animload_THPS6_human_unloadable_6 <...> 
	animload_THPS6_human_unloadable_7 <...> 
	animload_THPS6_human_unloadable_8 <...> 
	animload_THPS6_human_unloadable_9 <...> 
	animload_THPS6_human_unloadable_10 <...> 
	animload_THPS6_human_unloadable_11 <...> 
	animload_THPS6_human_unloadable_12 <...> 
	animload_THPS6_human_unloadable_13 <...> 
	animload_THPS6_human_unloadable_14 <...> 
	animload_THPS6_human_unloadable_15 <...> 
	animload_THPS6_human_unloadable_16 <...> 
	animload_THPS6_human_unloadable_17 <...> 
	animload_THPS6_human_unloadable_18 <...> 
	animload_THPS6_human_unloadable_19 <...> 
	animload_THPS6_human_unloadable_20 <...> 
ENDSCRIPT

SCRIPT animload_THPS6_human_unloadable_0 LoadFunction = LoadAnim 
	SetReferenceChecksum THPS6_human 
	IF <LoadFunction> <...> name = "anims\\Ped_FatGuy\\Ped_FatGuy_idle1.ska" descChecksum = Ped_FatGuy_idle1 
		<LoadFunction> <...> name = "anims\\Ped_FatGuy\\Ped_FatGuy_Idle1toHandsWaist.ska" descChecksum = Ped_FatGuy_Idle1toHandsWaist 
		<LoadFunction> <...> name = "anims\\Ped_FatGuy\\Ped_FatGuy_HandsWaistIdle.ska" descChecksum = Ped_FatGuy_HandsWaistIdle 
		<LoadFunction> <...> name = "anims\\Ped_FatGuy\\Ped_FatGuy_HandsWaist2Idle.ska" descChecksum = Ped_FatGuy_HandsWaist2Idle 
		<LoadFunction> <...> name = "anims\\Ped_FatGuy\\Ped_FatGuy_Idle1toWipeHead.ska" descChecksum = Ped_FatGuy_Idle1toWipeHead 
		<LoadFunction> <...> name = "anims\\Ped_FatGuy\\Ped_FatGuy_Run.ska" descChecksum = Ped_FatGuy_Run 
		<LoadFunction> <...> name = "anims\\Ped_FatGuy\\Ped_FatGuy_IdletoWalk.ska" descChecksum = Ped_FatGuy_IdletoWalk 
		<LoadFunction> <...> name = "anims\\Ped_FatGuy\\Ped_FatGuy_Walk.ska" descChecksum = Ped_FatGuy_Walk 
		<LoadFunction> <...> name = "anims\\Ped_FatGuy\\Ped_FatGuy_WalktoIdle.ska" descChecksum = Ped_FatGuy_WalktoIdle 
		<LoadFunction> <...> name = "anims\\Ped_FatGuy\\Ped_FatGuy_Push.ska" descChecksum = Ped_FatGuy_Push 
		<LoadFunction> <...> name = "anims\\Ped_FatGuy\\Ped_FatGuy_Avoid.ska" descChecksum = Ped_FatGuy_Avoid 
		<LoadFunction> <...> name = "anims\\Ped_FatGuy\\Ped_FatGuy_IdletoKnockdown.ska" descChecksum = Ped_FatGuy_IdletoKnockdown 
		<LoadFunction> <...> name = "anims\\Ped_FatGuy\\Ped_FatGuy_KnockdownIdle.ska" descChecksum = Ped_FatGuy_KnockdownIdle 
		<LoadFunction> <...> name = "anims\\Ped_FatGuy\\Ped_FatGuy_KnockdowntoIdle.ska" descChecksum = Ped_FatGuy_KnockdowntoIdle 
		<LoadFunction> <...> name = "anims\\Ped_FatGuy\\Ped_FatGuy_ScratchButt.ska" descChecksum = Ped_FatGuy_ScratchButt 
		<LoadFunction> <...> name = "anims\\Ped_FatGuy\\Ped_FatGuy_GetAttention01.ska" descChecksum = Ped_FatGuy_GetAttention01 
		<LoadFunction> <...> name = "anims\\Ped_FatGuy\\Ped_FatGuy_GetAttention02.ska" descChecksum = Ped_FatGuy_GetAttention02 
		<LoadFunction> <...> name = "anims\\Ped_M\\Ped_Guide_Idle1.ska" descChecksum = Ped_Guide_Idle1 
		<LoadFunction> <...> name = "anims\\Ped_M\\Ped_Guide_Idle2.ska" descChecksum = Ped_Guide_Idle2 
		<LoadFunction> <...> name = "anims\\Ped_M\\Ped_M_Cheer_KneelingLeft.ska" descChecksum = Ped_M_Cheer_KneelingLeft 
		<LoadFunction> <...> name = "anims\\Ped_M\\Ped_M_Cheer_KneelingFlip.ska" descChecksum = Ped_M_Cheer_KneelingFlip 
		<LoadFunction> <...> name = "anims\\Ped_M\\Ped_M_Disgust.ska" descChecksum = Ped_M_Disgust 
		<LoadFunction> <...> name = "anims\\Ped_M_Idles_02\\Ped_M_Idle1toArcade.ska" descChecksum = Ped_M_Idle1toArcade 
		<LoadFunction> <...> name = "anims\\Ped_M_Idles_02\\Ped_M_ArcadeIdle.ska" descChecksum = Ped_M_ArcadeIdle 
		<LoadFunction> <...> name = "anims\\Ped_M_Idles_02\\Ped_M_Arcade1.ska" descChecksum = Ped_M_Arcade1 
		<LoadFunction> <...> name = "anims\\Ped_M_Idles_02\\Ped_M_Arcade2.ska" descChecksum = Ped_M_Arcade2 
		<LoadFunction> <...> name = "anims\\Ped_M_Idles_02\\Ped_M_ArcadetoIdle.ska" descChecksum = Ped_M_ArcadetoIdle 
		<LoadFunction> <...> name = "anims\\Ped_M_Idles_02\\Ped_M_IdletoATM.ska" descChecksum = Ped_M_IdletoATM 
		<LoadFunction> <...> name = "anims\\Ped_M_Idles_02\\Ped_M_ATM1.ska" descChecksum = Ped_M_ATM1 
		<LoadFunction> <...> name = "anims\\Ped_M_Idles_02\\Ped_M_ATM2.ska" descChecksum = Ped_M_ATM2 
		<LoadFunction> <...> name = "anims\\Ped_M_Idles_02\\Ped_M_ATMtoIdle.ska" descChecksum = Ped_M_ATMtoIdle 
		<LoadFunction> <...> name = "anims\\Ped_M_Idles_02\\Ped_M_IdletoObserve.ska" descChecksum = Ped_M_IdletoObserve 
		<LoadFunction> <...> name = "anims\\Ped_M_Idles_02\\Ped_M_ObserveIdle.ska" descChecksum = Ped_M_ObserveIdle 
		<LoadFunction> <...> name = "anims\\Ped_M_Idles_02\\Ped_M_ObserveScratch.ska" descChecksum = Ped_M_ObserveScratch 
		<LoadFunction> <...> name = "anims\\Ped_M_Idles_02\\Ped_M_ObservetoIdle.ska" descChecksum = Ped_M_ObservetoIdle 
		<LoadFunction> <...> name = "anims\\Ped_M_Idles_02\\Ped_M_ArcadeFistAir.ska" descChecksum = Ped_M_ArcadeFistAir 
		<LoadFunction> <...> name = "anims\\Ped_M_Idles_02\\Ped_M_ObserveWipe.ska" descChecksum = Ped_M_ObserveWipe 
		<LoadFunction> <...> name = "anims\\Ped_M_Idles_02\\Ped_M_Observe02.ska" descChecksum = Ped_M_Observe02 
		<LoadFunction> <...> name = "anims\\Ped_M\\Ped_M_JumpBack.ska" descChecksum = Ped_M_JumpBack 
		<LoadFunction> <...> name = "anims\\Ped_M\\Ped_M_JumpForward.ska" descChecksum = Ped_M_JumpForward 
		<LoadFunction> <...> name = "anims\\Ped_M\\Ped_M_JumpLeft.ska" descChecksum = Ped_M_JumpLeft 
		<LoadFunction> <...> name = "anims\\Ped_M\\Ped_M_FalldownA.ska" descChecksum = Ped_M_FalldownA 
		<LoadFunction> <...> name = "anims\\Ped_M\\Ped_M_GetUpA.ska" descChecksum = Ped_M_GetUpA 
		<LoadFunction> <...> name = "anims\\Ped_M\\Ped_M_FalldownB.ska" descChecksum = Ped_M_FalldownB 
		<LoadFunction> <...> name = "anims\\Ped_M\\Ped_M_GetUpB.ska" descChecksum = Ped_M_GetUpB 
		<LoadFunction> <...> name = "anims\\Ped_M\\Ped_M_FalldownC.ska" descChecksum = Ped_M_FalldownC 
		<LoadFunction> <...> name = "anims\\Ped_M\\Ped_M_GetUpC.ska" descChecksum = Ped_M_GetUpC 
		<LoadFunction> <...> name = "anims\\Ped_M\\Ped_M_FalldownD.ska" descChecksum = Ped_M_FalldownD 
		<LoadFunction> <...> name = "anims\\Ped_M\\Ped_M_GetUpD.ska" descChecksum = Ped_M_GetUpD 
		<LoadFunction> <...> name = "anims\\Ped_M\\Ped_M_FalldownE.ska" descChecksum = Ped_M_FalldownE 
	ENDIF 
	SetReferenceChecksum 0 
ENDSCRIPT

SCRIPT animload_THPS6_human_unloadable_1 LoadFunction = LoadAnim 
	SetReferenceChecksum THPS6_human 
	IF <LoadFunction> <...> name = "anims\\Ped_M\\Ped_M_GetUpE.ska" descChecksum = Ped_M_GetUpE 
		<LoadFunction> <...> name = "anims\\Ped_M\\Ped_M_LayIdleA.ska" descChecksum = Ped_M_LayIdleA 
		<LoadFunction> <...> name = "anims\\Ped_M\\Ped_M_LayIdleB.ska" descChecksum = Ped_M_LayIdleB 
		<LoadFunction> <...> name = "anims\\Ped_M\\Ped_M_LayIdleC.ska" descChecksum = Ped_M_LayIdleC 
		<LoadFunction> <...> name = "anims\\Ped_M\\Ped_M_LayIdleD.ska" descChecksum = Ped_M_LayIdleD 
		<LoadFunction> <...> name = "anims\\Ped_M\\Ped_M_LayIdleE.ska" descChecksum = Ped_M_LayIdleE 
		<LoadFunction> <...> name = "anims\\Ped_M\\Ped_M_LookAround.ska" descChecksum = Ped_M_LookAround 
		<LoadFunction> <...> name = "anims\\Ped_M\\Ped_M_LookAtWatch.ska" descChecksum = Ped_M_LookAtWatch 
		<LoadFunction> <...> name = "anims\\Ped_M\\Ped_M_LookAtWatch2.ska" descChecksum = Ped_M_LookAtWatch2 
		<LoadFunction> <...> name = "anims\\Ped_M\\Ped_M_LookLeftDown.ska" descChecksum = Ped_M_LookLeftDown 
		<LoadFunction> <...> name = "anims\\Ped_M\\Ped_M_LookLeftRight.ska" descChecksum = Ped_M_LookLeftRight 
		<LoadFunction> <...> name = "anims\\Ped_M\\Ped_M_Lookright.ska" descChecksum = Ped_M_Lookright 
		<LoadFunction> <...> name = "anims\\Ped_M\\Ped_M_PlayerWave.ska" descChecksum = Ped_M_PlayerWave 
		<LoadFunction> <...> name = "anims\\Ped_M\\Ped_M_Punch.ska" descChecksum = Ped_M_Punch 
		<LoadFunction> <...> name = "anims\\Ped_M\\Ped_M_Push.ska" descChecksum = Ped_M_Push 
		<LoadFunction> <...> name = "anims\\Ped_M\\Ped_M_RunFromIdle.ska" descChecksum = Ped_M_RunFromIdle 
		<LoadFunction> <...> name = "anims\\Ped_M\\Ped_M_Run.ska" descChecksum = Ped_M_Run 
		<LoadFunction> <...> name = "anims\\Ped_M\\Ped_M_RunToIdle.ska" descChecksum = Ped_M_RunToIdle 
		<LoadFunction> <...> name = "anims\\Ped_M\\Ped_M_Run1.ska" descChecksum = Ped_M_Run1 
		<LoadFunction> <...> name = "anims\\Ped_M\\Ped_M_ScratchChin.ska" descChecksum = Ped_M_ScratchChin 
		<LoadFunction> <...> name = "anims\\Ped_M\\Ped_M_ShakeFist.ska" descChecksum = Ped_M_ShakeFist 
		<LoadFunction> <...> name = "anims\\Ped_M\\Ped_M_Talk_Dull.ska" descChecksum = Ped_M_Talk_Dull 
		<LoadFunction> <...> name = "anims\\Ped_M\\Ped_M_Talk_ISupposeSo.ska" descChecksum = Ped_M_Talk_ISupposeSo 
		<LoadFunction> <...> name = "anims\\Ped_M\\Ped_M_Talk_RaiseArn.ska" descChecksum = Ped_M_Talk_RaiseArn 
		<LoadFunction> <...> name = "anims\\Ped_M\\Ped_M_Talk_Shrug.ska" descChecksum = Ped_M_Talk_Shrug 
		<LoadFunction> <...> name = "anims\\Ped_M\\Ped_M_Talk_WhoKnows.ska" descChecksum = Ped_M_Talk_WhoKnows 
		<LoadFunction> <...> name = "anims\\Ped_M\\Ped_M_RotateLFromIdle1.ska" descChecksum = Ped_M_RotateLFromIdle1 
		<LoadFunction> <...> name = "anims\\Ped_M\\Ped_M_Idle1TurnL.ska" descChecksum = Ped_M_Idle1TurnL 
		<LoadFunction> <...> name = "anims\\Ped_M\\Ped_M_Walk1FromIdle.ska" descChecksum = Ped_M_Walk1FromIdle 
		<LoadFunction> <...> name = "anims\\Ped_M\\Ped_M_Walk1.ska" descChecksum = Ped_M_Walk1 
		<LoadFunction> <...> name = "anims\\Ped_M\\Ped_M_Walk1ToIdle.ska" descChecksum = Ped_M_Walk1ToIdle 
		<LoadFunction> <...> name = "anims\\Ped_M\\Ped_M_WalkingWave.ska" descChecksum = Ped_M_WalkingWave 
		<LoadFunction> <...> name = "anims\\Ped_M\\Ped_M_Walk2.ska" descChecksum = Ped_M_Walk2 
		<LoadFunction> <...> name = "anims\\Ped_M\\Ped_M_Walk2ToIdle.ska" descChecksum = Ped_M_Walk2ToIdle 
		<LoadFunction> <...> name = "anims\\Ped_M\\Ped_M_Run1.ska" descChecksum = Ped_M_Run1 
		<LoadFunction> <...> name = "anims\\Ped_M\\Ped_M_Run1ToIdle.ska" descChecksum = Ped_M_Run1ToIdle 
		<LoadFunction> <...> name = "anims\\Ped_M\\Ped_M_Run2.ska" descChecksum = Ped_M_Run2 
		<LoadFunction> <...> name = "anims\\Ped_M\\Ped_M_Walk3.ska" descChecksum = Ped_M_Walk3 
		<LoadFunction> <...> name = "anims\\Ped_M\\Ped_M_Walk4.ska" descChecksum = Ped_M_Walk4 
		<LoadFunction> <...> name = "anims\\Ped_M\\Ped_M_WalkCool.ska" descChecksum = Ped_M_WalkCool 
		<LoadFunction> <...> name = "anims\\Ped_M\\Ped_M_WalkTired.ska" descChecksum = Ped_M_WalkTired 
		<LoadFunction> <...> name = "anims\\Ped_M\\Ped_M_Wave.ska" descChecksum = Ped_M_Wave 
		<LoadFunction> <...> name = "anims\\Ped_Sitting\\PED_STND2SIT.ska" descChecksum = PED_STND2SIT 
		<LoadFunction> <...> name = "anims\\Ped_Sitting\\PED_SIT_Tap.ska" descChecksum = PED_SIT_Tap 
		<LoadFunction> <...> name = "anims\\Ped_Sitting\\PED_SIT_LookR.ska" descChecksum = PED_SIT_LookR 
		<LoadFunction> <...> name = "anims\\Ped_Sitting\\PED_SIT_Idle.ska" descChecksum = PED_SIT_Idle 
		<LoadFunction> <...> name = "anims\\Ped_Sitting\\PED_SIT2STND.ska" descChecksum = PED_SIT2STND 
		<LoadFunction> <...> name = "anims\\Ped_Sitting\\PED_SIT_LookL.ska" descChecksum = PED_SIT_LookL 
		<LoadFunction> <...> name = "anims\\Ped_Sitting\\PED_SIT2SITB.ska" descChecksum = PED_SIT2SITB 
		<LoadFunction> <...> name = "anims\\Ped_Sitting\\PED_SITB_Idle.ska" descChecksum = PED_SITB_Idle 
	ENDIF 
	SetReferenceChecksum 0 
ENDSCRIPT

SCRIPT animload_THPS6_human_unloadable_2 LoadFunction = LoadAnim 
	SetReferenceChecksum THPS6_human 
	IF <LoadFunction> <...> name = "anims\\Ped_Sitting\\PED_SITB_LookR.ska" descChecksum = PED_SITB_LookR 
		<LoadFunction> <...> name = "anims\\Ped_Sitting\\PED_SITB_LookL.ska" descChecksum = PED_SITB_LookL 
		<LoadFunction> <...> name = "anims\\Ped_Sitting\\PED_SITB2SITBL.ska" descChecksum = PED_SITB2SITBL 
		<LoadFunction> <...> name = "anims\\Ped_Sitting\\PED_SITBL_Idle.ska" descChecksum = PED_SITBL_Idle 
		<LoadFunction> <...> name = "anims\\Ped_Sitting\\PED_SITBL_Tap.ska" descChecksum = PED_SITBL_Tap 
		<LoadFunction> <...> name = "anims\\Ped_Sitting\\PED_SITBL_LookL.ska" descChecksum = PED_SITBL_LookL 
		<LoadFunction> <...> name = "anims\\Ped_Sitting\\PED_SITBL_Shake.ska" descChecksum = PED_SITBL_Shake 
		<LoadFunction> <...> name = "anims\\Ped_Sitting\\PED_SITBL2SIT.ska" descChecksum = PED_SITBL2SIT 
		<LoadFunction> <...> name = "anims\\THPS6_skater_bails\\RunOutQuick.ska" descChecksum = RunOutQuick 
		<LoadFunction> <...> name = "anims\\THPS6_skater_bails\\Bail_Falling_BCK.ska" descChecksum = Bail_Falling_BCK 
		<LoadFunction> <...> name = "anims\\THPS6_skater_bails\\Bail_Falling_FWD.ska" descChecksum = Bail_Falling_FWD 
		<LoadFunction> <...> name = "anims\\THPS6_skater_bails\\Bail_Falling_Hit_Hard_BCK.ska" descChecksum = Bail_Falling_Hit_Hard_BCK 
		<LoadFunction> <...> name = "anims\\THPS6_skater_bails\\Bail_Falling_Hit_Hard_FWD.ska" descChecksum = Bail_Falling_Hit_Hard_FWD 
		<LoadFunction> <...> name = "anims\\THPS6_skater_bails\\Bail_Falling_Hit_Med_BCK.ska" descChecksum = Bail_Falling_Hit_Med_BCK 
		<LoadFunction> <...> name = "anims\\THPS6_skater_bails\\Bail_Falling_Hit_Med_FWD.ska" descChecksum = Bail_Falling_Hit_Med_FWD 
		<LoadFunction> <...> name = "anims\\THPS6_skater_bails\\Bail_Falling_Idle_BCK.ska" descChecksum = Bail_Falling_Idle_BCK 
		<LoadFunction> <...> name = "anims\\THPS6_skater_bails\\Bail_Falling_Idle_FWD.ska" descChecksum = Bail_Falling_Idle_FWD 
		<LoadFunction> <...> name = "anims\\THPS6_skater_bails\\Bail_Falling_Idle_RT.ska" descChecksum = Bail_Falling_Idle_RT 
		<LoadFunction> <...> name = "anims\\THPS6_skater_bails\\Bail_Falling_RT.ska" descChecksum = Bail_Falling_RT 
		<LoadFunction> <...> name = "anims\\THPS6_skater_bails\\Bail_Falling_Slide_HitH_LTb.ska" descChecksum = Bail_Falling_Slide_HitH_LTb 
		<LoadFunction> <...> name = "anims\\THPS6_skater_bails\\Bail_Falling_Slide_HitH_LTf.ska" descChecksum = Bail_Falling_Slide_HitH_LTf 
		<LoadFunction> <...> name = "anims\\THPS6_skater_bails\\Bail_Falling_Slide_HitH_RTb.ska" descChecksum = Bail_Falling_Slide_HitH_RTb 
		<LoadFunction> <...> name = "anims\\THPS6_skater_bails\\Bail_Falling_Slide_HitH_RTf.ska" descChecksum = Bail_Falling_Slide_HitH_RTf 
		<LoadFunction> <...> name = "anims\\THPS6_skater_bails\\Bail_Falling_Slide_HitM_LTb.ska" descChecksum = Bail_Falling_Slide_HitM_LTb 
		<LoadFunction> <...> name = "anims\\THPS6_skater_bails\\Bail_Falling_Slide_HitM_LTf.ska" descChecksum = Bail_Falling_Slide_HitM_LTf 
		<LoadFunction> <...> name = "anims\\THPS6_skater_bails\\Bail_Falling_Slide_HitM_RTb.ska" descChecksum = Bail_Falling_Slide_HitM_RTb 
		<LoadFunction> <...> name = "anims\\THPS6_skater_bails\\Bail_Falling_Slide_HitM_RTf.ska" descChecksum = Bail_Falling_Slide_HitM_RTf 
		<LoadFunction> <...> name = "anims\\THPS6_skater_bails\\Bail_Falling_Slide_Idle_LTb.ska" descChecksum = Bail_Falling_Slide_Idle_LTb 
		<LoadFunction> <...> name = "anims\\THPS6_skater_bails\\Bail_Falling_Slide_Idle_LTf.ska" descChecksum = Bail_Falling_Slide_Idle_LTf 
		<LoadFunction> <...> name = "anims\\THPS6_skater_bails\\Bail_Falling_Slide_Idle_RTb.ska" descChecksum = Bail_Falling_Slide_Idle_RTb 
		<LoadFunction> <...> name = "anims\\THPS6_skater_bails\\Bail_Falling_Slide_Idle_RTf.ska" descChecksum = Bail_Falling_Slide_Idle_RTf 
		<LoadFunction> <...> name = "anims\\THPS6_skater_bails\\Bail_Falling_Slide_LTb.ska" descChecksum = Bail_Falling_Slide_LTb 
		<LoadFunction> <...> name = "anims\\THPS6_skater_bails\\Bail_Falling_Slide_LTf.ska" descChecksum = Bail_Falling_Slide_LTf 
		<LoadFunction> <...> name = "anims\\THPS6_skater_bails\\Bail_Falling_Slide_RTb.ska" descChecksum = Bail_Falling_Slide_RTb 
		<LoadFunction> <...> name = "anims\\THPS6_skater_bails\\Bail_Falling_Slide_RTf.ska" descChecksum = Bail_Falling_Slide_RTf 
		<LoadFunction> <...> name = "anims\\THPS6_skater_bails\\Bail_Falling_Slide_BCK.ska" descChecksum = Bail_Falling_Slide_BCK 
		<LoadFunction> <...> name = "anims\\THPS6_skater_bails\\Bail_Falling_Slide_Idle_BCK.ska" descChecksum = Bail_Falling_Slide_Idle_BCK 
		<LoadFunction> <...> name = "anims\\THPS6_skater_bails\\Bail_Falling_Slide_HitM_BCK.ska" descChecksum = Bail_Falling_Slide_HitM_BCK 
		<LoadFunction> <...> name = "anims\\THPS6_skater_bails\\Bail_Falling_Slide_HitH_BCK.ska" descChecksum = Bail_Falling_Slide_HitH_BCK 
		<LoadFunction> <...> name = "anims\\THPS6_skater_bails\\Bail_Falling_LT.ska" descChecksum = Bail_Falling_LT 
		<LoadFunction> <...> name = "anims\\THPS6_skater_bails\\Bail_Falling_Idle_LT.ska" descChecksum = Bail_Falling_Idle_LT 
		<LoadFunction> <...> name = "anims\\THPS6_skater_bails\\Bail_Falling_Hit_Hard.ska" descChecksum = Bail_Falling_Hit_Hard 
		<LoadFunction> <...> name = "anims\\THPS6_skater_bails\\Bail_Falling_Hit_Med.ska" descChecksum = Bail_Falling_Hit_Med 
		<LoadFunction> <...> name = "anims\\THPS6_Bail_GetUp\\GetUp_HK_Ft.ska" descChecksum = GetUp_HK_Ft 
		<LoadFunction> <...> name = "anims\\THPS6_Bail_GetUp\\GetUp_S_BoardCatch1.ska" descChecksum = GetUp_S_BoardCatch1 
		<LoadFunction> <...> name = "anims\\THPS6_Bail_GetUp\\GetUp_S_RunJump.ska" descChecksum = GetUp_S_RunJump 
		<LoadFunction> <...> name = "anims\\THPS6_Bail_GetUp\\GetUp_S_BoardFlip1.ska" descChecksum = GetUp_S_BoardFlip1 
		<LoadFunction> <...> name = "anims\\THPS6_Bail_GetUp\\GetUp_HK_Ft_Q.ska" descChecksum = GetUp_HK_Ft_Q 
		<LoadFunction> <...> name = "anims\\THPS6_Bail_GetUp\\GetUp_Sit_Ft.ska" descChecksum = GetUp_Sit_Ft 
		<LoadFunction> <...> name = "anims\\THPS6_Bail_GetUp\\GetUp_Sit_Ft_T.ska" descChecksum = GetUp_Sit_Ft_T 
	ENDIF 
	SetReferenceChecksum 0 
ENDSCRIPT

SCRIPT animload_THPS6_human_unloadable_3 LoadFunction = LoadAnim 
	SetReferenceChecksum THPS6_human 
	IF <LoadFunction> <...> name = "anims\\THPS6_Bail_GetUp\\GetUp_Sit_Ft_Q.ska" descChecksum = GetUp_Sit_Ft_Q 
		<LoadFunction> <...> name = "anims\\THPS6_Bail_GetUp\\GetUp_HK_Lt.ska" descChecksum = GetUp_HK_Lt 
		<LoadFunction> <...> name = "anims\\THPS6_Bail_GetUp\\GetUp_HK_Lt_T.ska" descChecksum = GetUp_HK_Lt_T 
		<LoadFunction> <...> name = "anims\\THPS6_Bail_GetUp\\GetUp_HK_Lt_Q.ska" descChecksum = GetUp_HK_Lt_Q 
		<LoadFunction> <...> name = "anims\\THPS6_Bail_GetUp\\GetUp_HK_Bk.ska" descChecksum = GetUp_HK_Bk 
		<LoadFunction> <...> name = "anims\\THPS6_Bail_GetUp\\GetUp_HK_Bk_T.ska" descChecksum = GetUp_HK_Bk_T 
		<LoadFunction> <...> name = "anims\\THPS6_Bail_GetUp\\GetUp_HK_Bk_Q.ska" descChecksum = GetUp_HK_Bk_Q 
		<LoadFunction> <...> name = "anims\\THPS6_Bail_GetUp\\GetUp_HK_Rt_T.ska" descChecksum = GetUp_HK_Rt_T 
		<LoadFunction> <...> name = "anims\\THPS6_Bail_GetUp\\GetUp_HK_Rt_Q.ska" descChecksum = GetUp_HK_Rt_Q 
		<LoadFunction> <...> name = "anims\\THPS6_Bail_GetUp\\GetUp_HK_Rt.ska" descChecksum = GetUp_HK_Rt 
		<LoadFunction> <...> name = "anims\\THPS6_Bail_GetUp\\GetUp_S_Turn180.ska" descChecksum = GetUp_S_Turn180 
		<LoadFunction> <...> name = "anims\\THPS6_Bail_GetUp\\GetUp_S_NoPushOff.ska" descChecksum = GetUp_S_NoPushOff 
		<LoadFunction> <...> name = "anims\\THPS6_skater_bails\\Bail_Manual_BK.ska" descChecksum = Bail_Manual_BK 
		<LoadFunction> <...> name = "anims\\THPS6_skater_bails\\Bail_Manual_BK_fast.ska" descChecksum = Bail_Manual_BK_fast 
		<LoadFunction> <...> name = "anims\\THPS6_skater_bails\\Bail_Manual_FT.ska" descChecksum = Bail_Manual_FT 
		<LoadFunction> <...> name = "anims\\THPS6_skater_bails\\Bail_Manual_FT_fast.ska" descChecksum = Bail_Manual_FT_fast 
		<LoadFunction> <...> name = "anims\\THPS6_skater_bails\\Nutsac.ska" descChecksum = Nutsac 
		<LoadFunction> <...> name = "anims\\THPS6_skater_bails\\Bail_Nutter_FWD.ska" descChecksum = Bail_Nutter_FWD 
		<LoadFunction> <...> name = "anims\\THPS6_skater_bails\\Bail_Nutter_BCK.ska" descChecksum = Bail_Nutter_BCK 
		<LoadFunction> <...> name = "anims\\THPS6_skater_bails\\Bail_Pitch_Nose.ska" descChecksum = Bail_Pitch_Nose 
		<LoadFunction> <...> name = "anims\\THPS6_skater_bails\\Bail_Pitch_Back.ska" descChecksum = Bail_Pitch_Back 
		<LoadFunction> <...> name = "anims\\THPS6_skater_bails\\Bail_Pitch_Face.ska" descChecksum = Bail_Pitch_Face 
		<LoadFunction> <...> name = "anims\\THPS6_skater_bails\\Bail_Pitch_Tail.ska" descChecksum = Bail_Pitch_Tail 
		<LoadFunction> <...> name = "anims\\THPS6_skater_bails\\Bail_Ramp_Lt.ska" descChecksum = Bail_Ramp_Lt 
		<LoadFunction> <...> name = "anims\\THPS6_skater_bails\\Bail_Ramp_Rt.ska" descChecksum = Bail_Ramp_Rt 
		<LoadFunction> <...> name = "anims\\THPS6_skater_bails\\Bail_Ramp_Bk_Hd.ska" descChecksum = Bail_Ramp_Bk_Hd 
		<LoadFunction> <...> name = "anims\\THPS6_skater_bails\\Bail_Ramp_Rt_Med.ska" descChecksum = Bail_Ramp_Rt_Med 
		<LoadFunction> <...> name = "anims\\THPS6_skater_bails\\Bail_Ramp_Lt_Med.ska" descChecksum = Bail_Ramp_Lt_Med 
		<LoadFunction> <...> name = "anims\\THPS6_skater_bails\\Bail_Ramp_Bk.ska" descChecksum = Bail_Ramp_Bk 
		<LoadFunction> <...> name = "anims\\THPS6_skater_bails\\Bail_Ramp_Ft_Hd.ska" descChecksum = Bail_Ramp_Ft_Hd 
		<LoadFunction> <...> name = "anims\\THPS6_skater_bails\\Bail_Ramp_Ft_Med.ska" descChecksum = Bail_Ramp_Ft_Med 
		<LoadFunction> <...> name = "anims\\THPS6_skater_bails\\Bail_Ramp_Ft.ska" descChecksum = Bail_Ramp_Ft 
		<LoadFunction> <...> name = "anims\\THPS6_Skater_bails\\Bail_Ramp_Lt_Hd.ska" descChecksum = Bail_Ramp_Lt_Hd 
		<LoadFunction> <...> name = "anims\\THPS6_skater_bails\\Bail_Ramp_Rt_Hd.ska" descChecksum = Bail_Ramp_Rt_Hd 
		<LoadFunction> <...> name = "anims\\THPS6_skater_bails\\Bail_RunOut_Old.ska" descChecksum = Bail_RunOut_Old 
		<LoadFunction> <...> name = "anims\\THPS6_skater_bails\\Bail_RunOut_New_A.ska" descChecksum = Bail_RunOut_New_A 
		<LoadFunction> <...> name = "anims\\THPS6_skater_bails\\RunOut_Drop_Idle.ska" descChecksum = RunOut_Drop_Idle 
		<LoadFunction> <...> name = "anims\\THPS6_skater_bails\\RunOut_Drop_Land_Med.ska" descChecksum = RunOut_Drop_Land_Med 
		<LoadFunction> <...> name = "anims\\THPS6_skater_bails\\Bail_Spin_CCW_Hard.ska" descChecksum = Bail_Spin_CCW_Hard 
		<LoadFunction> <...> name = "anims\\THPS6_skater_bails\\Bail_Spin_CW_Hard.ska" descChecksum = Bail_Spin_CW_Hard 
		<LoadFunction> <...> name = "anims\\THPS6_skater_bails\\Bail_Spin_CCW_Hard_B.ska" descChecksum = Bail_Spin_CCW_Hard_B 
		<LoadFunction> <...> name = "anims\\THPS6_skater_bails\\Bail_Spin_CCW_Hard_C.ska" descChecksum = Bail_Spin_CCW_Hard_C 
		<LoadFunction> <...> name = "anims\\THPS6_skater_bails\\Bail_Spin_CW_Hard_B.ska" descChecksum = Bail_Spin_CW_Hard_B 
		<LoadFunction> <...> name = "anims\\THPS6_skater_bails\\Bail_Spin_CW_Hard_A.ska" descChecksum = Bail_Spin_CW_Hard_A 
		<LoadFunction> <...> name = "anims\\THPS6_skater_bails\\Bail_Spin_FWD_Regular.ska" descChecksum = Bail_Spin_FWD_Regular 
		<LoadFunction> <...> name = "anims\\THPS6_skater_bails\\Bail_Spin_FWD_Hard.ska" descChecksum = Bail_Spin_FWD_Hard 
		<LoadFunction> <...> name = "anims\\THPS6_skater_bails\\Bail_Spin_FWD_Fast.ska" descChecksum = Bail_Spin_FWD_Fast 
		<LoadFunction> <...> name = "anims\\THPS6_skater_bails\\Bail_Spin_BCK_Regular.ska" descChecksum = Bail_Spin_BCK_Regular 
		<LoadFunction> <...> name = "anims\\THPS6_skater_bails\\Bail_Spin_BCK_Fast.ska" descChecksum = Bail_Spin_BCK_Fast 
		<LoadFunction> <...> name = "anims\\THPS6_skater_bails\\Bail_Spin_BCK_Hard.ska" descChecksum = Bail_Spin_BCK_Hard 
	ENDIF 
	SetReferenceChecksum 0 
ENDSCRIPT

SCRIPT animload_THPS6_human_unloadable_4 LoadFunction = LoadAnim 
	SetReferenceChecksum THPS6_human 
	IF <LoadFunction> <...> name = "anims\\THPS6_skater_tantrums\\Tantrum_DiscusStart.ska" descChecksum = Tantrum_DiscusStart 
		<LoadFunction> <...> name = "anims\\THPS6_skater_tantrums\\Tantrum_DiscusFinish.ska" descChecksum = Tantrum_DiscusFinish 
		<LoadFunction> <...> name = "anims\\THPS6_skater_tantrums\\Tantrum_KickBoard.ska" descChecksum = Tantrum_KickBoard 
		<LoadFunction> <...> name = "anims\\THPS6_skater_tantrums\\Tantrum_HeadButt.ska" descChecksum = Tantrum_HeadButt 
		<LoadFunction> <...> name = "anims\\THPS6_skater_tantrums\\Tantrum_SlingShot.ska" descChecksum = Tantrum_SlingShot 
		<LoadFunction> <...> name = "anims\\THPS6_skater_tantrums\\Tantrum_PileDriver.ska" descChecksum = Tantrum_PileDriver 
		<LoadFunction> <...> name = "anims\\THPS6_skater_tantrums\\Tantrum_BoardFocus.ska" descChecksum = Tantrum_BoardFocus 
		<LoadFunction> <...> name = "anims\\thps6_skater_OnFoot\\WalkingBail.ska" descChecksum = WalkingBail 
		<LoadFunction> <...> name = "anims\\thps6_skater_OnFoot\\WalkingBailGetUp.ska" descChecksum = WalkingBailGetUp 
		<LoadFunction> <...> name = "anims\\THPS6_Skater_Bails\\Bail_Wall_FWD_Regular.ska" descChecksum = Bail_Wall_FWD_Regular 
		<LoadFunction> <...> name = "anims\\THPS6_Skater_Bails\\Bail_Wall_FWD_Low.ska" descChecksum = Bail_Wall_FWD_Low 
		<LoadFunction> <...> name = "anims\\THPS6_Skater_Bails\\Bail_Wall_BCK_Regular.ska" descChecksum = Bail_Wall_BCK_Regular 
		<LoadFunction> <...> name = "anims\\THPS6_Skater_Bails\\Bail_Wall_BCK_Low.ska" descChecksum = Bail_Wall_BCK_Low 
		<LoadFunction> <...> name = "anims\\THPS6_Skater_Bails\\Bail_Wall_LT_Low.ska" descChecksum = Bail_Wall_LT_Low 
		<LoadFunction> <...> name = "anims\\THPS6_Skater_Bails\\Bail_Wall_RT_Low.ska" descChecksum = Bail_Wall_RT_Low 
		<LoadFunction> <...> name = "anims\\THPS6_skater_misc\\GrabBar_accel_Fwd.ska" descChecksum = GrabBar_accel_Fwd 
		<LoadFunction> <...> name = "anims\\THPS6_skater_misc\\GrabBar_idle_Fwd.ska" descChecksum = GrabBar_idle_Fwd 
		<LoadFunction> <...> name = "anims\\THPS6_skater_misc\\GrabBar_Release_Fwd.ska" descChecksum = GrabBar_Release_Fwd 
		<LoadFunction> <...> name = "anims\\THPS6_skater_misc\\GrabBar_accel_Up.ska" descChecksum = GrabBar_accel_Up 
		<LoadFunction> <...> name = "anims\\THPS6_skater_misc\\GrabBar_Idle_up.ska" descChecksum = GrabBar_Idle_up 
		<LoadFunction> <...> name = "anims\\THPS6_skater_misc\\GrabBar_Release_Up.ska" descChecksum = GrabBar_Release_Up 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\AirIdle.ska" descChecksum = AirIdle 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\AirTurnLeft.ska" descChecksum = AirTurnLeft 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\AirTurnRight.ska" descChecksum = AirTurnRight 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\Beanplant.ska" descChecksum = Beanplant 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\Boneless.ska" descChecksum = Boneless 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\Brake.ska" descChecksum = Brake 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\BrakeDefeat.ska" descChecksum = BrakeDefeat 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\BrakeIdle.ska" descChecksum = BrakeIdle 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\BSPowerslide.ska" descChecksum = BSPowerslide 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\CessSlide180_BS.ska" descChecksum = CessSlide180_BS 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\CessSlide180_FS.ska" descChecksum = CessSlide180_FS 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\CessSlide180_FS2.ska" descChecksum = CessSlide180_FS2 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\Crouch.ska" descChecksum = Crouch 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\Crouch2InAir.ska" descChecksum = Crouch2InAir 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\CrouchBumpDown.ska" descChecksum = CrouchBumpDown 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\CrouchBumpUp.ska" descChecksum = CrouchBumpUp 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\CrouchCessSlide180_BS.ska" descChecksum = CrouchCessSlide180_BS 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\CrouchCessSlide180_FS.ska" descChecksum = CrouchCessSlide180_FS 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\CrouchedLand.ska" descChecksum = CrouchedLand 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\CrouchIdle.ska" descChecksum = CrouchIdle 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\CrouchIdle2.ska" descChecksum = CrouchIdle2 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\CrouchIdle4.ska" descChecksum = CrouchIdle4 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\CrouchIdleAdjustFeet.ska" descChecksum = CrouchIdleAdjustFeet 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\CrouchIdleFromIdle.ska" descChecksum = CrouchIdleFromIdle 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\CrouchIdleToIdle.ska" descChecksum = CrouchIdleToIdle 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\CrouchLookDown.ska" descChecksum = CrouchLookDown 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\CrouchLookLeft.ska" descChecksum = CrouchLookLeft 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\CrouchLookRight.ska" descChecksum = CrouchLookRight 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\CrouchPush1.ska" descChecksum = CrouchPush1 
	ENDIF 
	SetReferenceChecksum 0 
ENDSCRIPT

SCRIPT animload_THPS6_human_unloadable_5 LoadFunction = LoadAnim 
	SetReferenceChecksum THPS6_human 
	IF <LoadFunction> <...> name = "anims\\THPS6_skater_basics\\CrouchShiftFoot.ska" descChecksum = CrouchShiftFoot 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\CrouchToNollie.ska" descChecksum = CrouchToNollie 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\CrouchTurnLeft.ska" descChecksum = CrouchTurnLeft 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\CrouchTurnLeft2.ska" descChecksum = CrouchTurnLeft2 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\CrouchTurnLeftIdle.ska" descChecksum = CrouchTurnLeftIdle 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\CrouchTurnLeftIdle2.ska" descChecksum = CrouchTurnLeftIdle2 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\CrouchTurnRight.ska" descChecksum = CrouchTurnRight 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\CrouchTurnRight2.ska" descChecksum = CrouchTurnRight2 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\CrouchTurnRightIdle.ska" descChecksum = CrouchTurnRightIdle 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\CrouchTurnRightIdle2.ska" descChecksum = CrouchTurnRightIdle2 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\DropIn.ska" descChecksum = DropIn 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\Fastplant.ska" descChecksum = Fastplant 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\FlailLeft.ska" descChecksum = FlailLeft 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\FlailLeft2.ska" descChecksum = FlailLeft2 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\FlailLeftCrouched2.ska" descChecksum = FlailLeftCrouched2 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\FlailLeftCrouched3.ska" descChecksum = FlailLeftCrouched3 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\FlailLeftCrouched_Small.ska" descChecksum = FlailLeftCrouched_Small 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\FlailRight.ska" descChecksum = FlailRight 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\FlailRight2.ska" descChecksum = FlailRight2 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\FlailRightCrouched2.ska" descChecksum = FlailRightCrouched2 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\FlailRightCrouched3.ska" descChecksum = FlailRightCrouched3 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\FlailRightCrouched_Small.ska" descChecksum = FlailRightCrouched_Small 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\FSPowerslide.ska" descChecksum = FSPowerslide 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\Idle2InAir.ska" descChecksum = Idle2InAir 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\Land.ska" descChecksum = Land 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\Land2.ska" descChecksum = Land2 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\Land3.ska" descChecksum = Land3 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\Manual.ska" descChecksum = Manual 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\Manual_Range.ska" descChecksum = Manual_Range 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\Manual_Range2.ska" descChecksum = Manual_Range2 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\Manual_Range3.ska" descChecksum = Manual_Range3 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\ManualFromAir.ska" descChecksum = ManualFromAir 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\MongoBrakeIdle.ska" descChecksum = MongoBrakeIdle 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\MongoPush.ska" descChecksum = MongoPush 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\MongoPushCycle.ska" descChecksum = MongoPushCycle 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\MullenStart.ska" descChecksum = MullenStart 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\NewBrake.ska" descChecksum = NewBrake 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\NewBrake_Mongo.ska" descChecksum = NewBrake_Mongo 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\NewBrakeIdle.ska" descChecksum = NewBrakeIdle 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\NewBrakeIdle2.ska" descChecksum = NewBrakeIdle2 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\NewBrakeIdle3.ska" descChecksum = NewBrakeIdle3 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\NewBrakeIdle4.ska" descChecksum = NewBrakeIdle4 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\NewBrakeIdle6.ska" descChecksum = NewBrakeIdle6 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\NewBrakeIdle7.ska" descChecksum = NewBrakeIdle7 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\NewBrakeIdle8.ska" descChecksum = NewBrakeIdle8 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\NewBrakeIdleToIdle.ska" descChecksum = NewBrakeIdleToIdle 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\NewBrakeTurnLeft.ska" descChecksum = NewBrakeTurnLeft 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\NewBrakeTurnRight.ska" descChecksum = NewBrakeTurnRight 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\NoComply.ska" descChecksum = NoComply 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\Nollie.ska" descChecksum = Nollie 
	ENDIF 
	SetReferenceChecksum 0 
ENDSCRIPT

SCRIPT animload_THPS6_human_unloadable_6 LoadFunction = LoadAnim 
	SetReferenceChecksum THPS6_human 
	IF <LoadFunction> <...> name = "anims\\THPS6_skater_basics\\NollieCrouchIdle.ska" descChecksum = NollieCrouchIdle 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\NollieCrouchTurnLeft.ska" descChecksum = NollieCrouchTurnLeft 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\NollieCrouchTurnRight.ska" descChecksum = NollieCrouchTurnRight 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\NollieSkatingIdle.ska" descChecksum = NollieSkatingIdle 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\NollieSkatingTurnLeft.ska" descChecksum = NollieSkatingTurnLeft 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\NollieSkatingTurnRight.ska" descChecksum = NollieSkatingTurnRight 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\NoseManual.ska" descChecksum = NoseManual 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\NoseManual_range.ska" descChecksum = NoseManual_range 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\NoseManual_Range2.ska" descChecksum = NoseManual_Range2 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\NoseManualFromAir.ska" descChecksum = NoseManualFromAir 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\Ollie.ska" descChecksum = Ollie 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\Push.ska" descChecksum = Push 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\PushCycle.ska" descChecksum = PushCycle 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\PushCycleArms1.ska" descChecksum = PushCycleArms1 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\PushCycleArms2.ska" descChecksum = PushCycleArms2 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\PushCycleArms3.ska" descChecksum = PushCycleArms3 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\PushCycleArms4.ska" descChecksum = PushCycleArms4 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\PushCycleArms5.ska" descChecksum = PushCycleArms5 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\PushIdle.ska" descChecksum = PushIdle 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\PutDownManual.ska" descChecksum = PutDownManual 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\PutDownNoseManual.ska" descChecksum = PutDownNoseManual 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\RevertBS.ska" descChecksum = RevertBS 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\RevertFS.ska" descChecksum = RevertFS 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\SkatingToNollie.ska" descChecksum = SkatingToNollie 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\SketchyCrouchLand.ska" descChecksum = SketchyCrouchLand 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\SketchyLand.ska" descChecksum = SketchyLand 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\SketchyLand1.ska" descChecksum = SketchyLand1 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\SkitchInit.ska" descChecksum = SkitchInit 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\SkitchRange.ska" descChecksum = SkitchRange 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\SlapAir.ska" descChecksum = SlapAir 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\SlapRight.ska" descChecksum = SlapRight 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\SlowDownBrake.ska" descChecksum = SlowDownBrake 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\SlowDownBrake_Mongo.ska" descChecksum = SlowDownBrake_Mongo 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\SpineTransfer.ska" descChecksum = SpineTransfer 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\StandingLandTurn.ska" descChecksum = StandingLandTurn 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\StartSkating1.ska" descChecksum = StartSkating1 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\StretchLegsInit.ska" descChecksum = StretchLegsInit 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\TurnLeft.ska" descChecksum = TurnLeft 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\TurnLeftIdle.ska" descChecksum = TurnLeftIdle 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\TurnRight.ska" descChecksum = TurnRight 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\TurnRightIdle.ska" descChecksum = TurnRightIdle 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\WallRideBackLoop.ska" descChecksum = WallRideBackLoop 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\WallRideBackTrans.ska" descChecksum = WallRideBackTrans 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\WallRideFrontLoop.ska" descChecksum = WallRideFrontLoop 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\WallRideFrontTrans.ska" descChecksum = WallRideFrontTrans 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\ToTail_In.ska" descChecksum = ToTail_In 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\ToTail_Out.ska" descChecksum = ToTail_Out 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\ToTail_Idle.ska" descChecksum = ToTail_Idle 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\WallPlant_Crouched.ska" descChecksum = WallPlant_Crouched 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\WallPlant_Standing.ska" descChecksum = WallPlant_Standing 
	ENDIF 
	SetReferenceChecksum 0 
ENDSCRIPT

SCRIPT animload_THPS6_human_unloadable_7 LoadFunction = LoadAnim 
	SetReferenceChecksum THPS6_human 
	IF <LoadFunction> <...> name = "anims\\THPS6_skater_basics\\WallPlant_Manual.ska" descChecksum = WallPlant_Manual 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\WallPlant_NoseManual.ska" descChecksum = WallPlant_NoseManual 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\CrouchToPressure.ska" descChecksum = CrouchToPressure 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\SkateToPressure.ska" descChecksum = SkateToPressure 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\AirIdleCAT.ska" descChecksum = AirIdleCAT 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\BrakeIdle_Start.ska" descChecksum = BrakeIdle_Start 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\BrakeIdle_Start_Mongo.ska" descChecksum = BrakeIdle_Start_Mongo 
		<LoadFunction> <...> name = "anims\\Cloth\\Cloth_Land_Partial.ska" descChecksum = Cloth_Land_Partial 
		<LoadFunction> <...> name = "anims\\Cloth\\Cloth_AIrFlow_Partial.ska" descChecksum = Cloth_AIrFlow_Partial 
		<LoadFunction> <...> name = "anims\\PED_CrappySkate\\CrouchIdle_Crappy.ska" descChecksum = CrouchIdle_Crappy 
		<LoadFunction> <...> name = "anims\\PED_CrappySkate\\CrouchTurnLeft_Crappy.ska" descChecksum = CrouchTurnLeft_Crappy 
		<LoadFunction> <...> name = "anims\\PED_CrappySkate\\CrouchTurnLeftIdle_Crappy.ska" descChecksum = CrouchTurnLeftIdle_Crappy 
		<LoadFunction> <...> name = "anims\\PED_CrappySkate\\CrouchTurnRight_Crappy.ska" descChecksum = CrouchTurnRight_Crappy 
		<LoadFunction> <...> name = "anims\\PED_CrappySkate\\CrouchTurnRightIdle_Crappy.ska" descChecksum = CrouchTurnRightIdle_Crappy 
		<LoadFunction> <...> name = "anims\\PED_CrappySkate\\TurnLeft_Crappy.ska" descChecksum = TurnLeft_Crappy 
		<LoadFunction> <...> name = "anims\\PED_CrappySkate\\TurnLeftIdle_Crappy.ska" descChecksum = TurnLeftIdle_Crappy 
		<LoadFunction> <...> name = "anims\\PED_CrappySkate\\TurnRight_Crappy.ska" descChecksum = TurnRight_Crappy 
		<LoadFunction> <...> name = "anims\\PED_CrappySkate\\TurnRightIdle_Crappy.ska" descChecksum = TurnRightIdle_Crappy 
		<LoadFunction> <...> name = "anims\\PED_CrappySkate\\CrouchBumpDown_Crappy.ska" descChecksum = CrouchBumpDown_Crappy 
		<LoadFunction> <...> name = "anims\\PED_CrappySkate\\CrouchBumpUp_Crappy.ska" descChecksum = CrouchBumpUp_Crappy 
		<LoadFunction> <...> name = "anims\\THPS6_skater_flatland\\_360FlipNoseManual.ska" descChecksum = _360FlipNoseManual 
		<LoadFunction> <...> name = "anims\\THPS6_skater_flatland\\AntiCasper_Init.ska" descChecksum = AntiCasper_Init 
		<LoadFunction> <...> name = "anims\\THPS6_skater_flatland\\AntiCasper_Out.ska" descChecksum = AntiCasper_Out 
		<LoadFunction> <...> name = "anims\\THPS6_skater_flatland\\AntiCasper_Range.ska" descChecksum = AntiCasper_Range 
		<LoadFunction> <...> name = "anims\\THPS6_skater_flatland\\AntiCasperFlip.ska" descChecksum = AntiCasperFlip 
		<LoadFunction> <...> name = "anims\\THPS6_skater_flatland\\Casper_Init.ska" descChecksum = Casper_Init 
		<LoadFunction> <...> name = "anims\\THPS6_skater_flatland\\Casper_Out.ska" descChecksum = Casper_Out 
		<LoadFunction> <...> name = "anims\\THPS6_skater_flatland\\Casper_Range.ska" descChecksum = Casper_Range 
		<LoadFunction> <...> name = "anims\\THPS6_skater_flatland\\CasperFlip.ska" descChecksum = CasperFlip 
		<LoadFunction> <...> name = "anims\\THPS6_skater_flatland\\GTurn.ska" descChecksum = GTurn 
		<LoadFunction> <...> name = "anims\\THPS6_skater_flatland\\GTurn2.ska" descChecksum = GTurn2 
		<LoadFunction> <...> name = "anims\\THPS6_skater_flatland\\HalfCabImpossible.ska" descChecksum = HalfCabImpossible 
		<LoadFunction> <...> name = "anims\\THPS6_skater_flatland\\HandstandHandFlip_Init.ska" descChecksum = HandstandHandFlip_Init 
		<LoadFunction> <...> name = "anims\\THPS6_skater_flatland\\HandstandHandFlip_Out.ska" descChecksum = HandstandHandFlip_Out 
		<LoadFunction> <...> name = "anims\\THPS6_skater_flatland\\HandstandHandFlip_Range.ska" descChecksum = HandstandHandFlip_Range 
		<LoadFunction> <...> name = "anims\\THPS6_skater_flatland\\HStandFliptoHstand.ska" descChecksum = HStandFliptoHstand 
		<LoadFunction> <...> name = "anims\\THPS6_skater_flatland\\OneFootManual_Init.ska" descChecksum = OneFootManual_Init 
		<LoadFunction> <...> name = "anims\\THPS6_skater_flatland\\OneFootManual_Range.ska" descChecksum = OneFootManual_Range 
		<LoadFunction> <...> name = "anims\\THPS6_skater_flatland\\OneFootNoseManual_Init.ska" descChecksum = OneFootNoseManual_Init 
		<LoadFunction> <...> name = "anims\\THPS6_skater_flatland\\OneFootNoseManual_Range.ska" descChecksum = OneFootNoseManual_Range 
		<LoadFunction> <...> name = "anims\\THPS6_skater_flatland\\Pogo_Bounce.ska" descChecksum = Pogo_Bounce 
		<LoadFunction> <...> name = "anims\\THPS6_skater_flatland\\Pogo_Init.ska" descChecksum = Pogo_Init 
		<LoadFunction> <...> name = "anims\\THPS6_skater_flatland\\Pogo_Kickfoot.ska" descChecksum = Pogo_Kickfoot 
		<LoadFunction> <...> name = "anims\\THPS6_skater_flatland\\Pogo_Out.ska" descChecksum = Pogo_Out 
		<LoadFunction> <...> name = "anims\\THPS6_skater_flatland\\RailFlip.ska" descChecksum = RailFlip 
		<LoadFunction> <...> name = "anims\\THPS6_skater_flatland\\TruckRun.ska" descChecksum = TruckRun 
		<LoadFunction> <...> name = "anims\\THPS6_skater_flatland\\TruckRun_Init.ska" descChecksum = TruckRun_Init 
		<LoadFunction> <...> name = "anims\\THPS6_skater_flatland\\TruckRun_Out.ska" descChecksum = TruckRun_Out 
		<LoadFunction> <...> name = "anims\\THPS6_skater_flatland\\TruckRunFlip.ska" descChecksum = TruckRunFlip 
		<LoadFunction> <...> name = "anims\\THPS6_skater_flatland\\Truckstand_Flip.ska" descChecksum = Truckstand_Flip 
	ENDIF 
	SetReferenceChecksum 0 
ENDSCRIPT

SCRIPT animload_THPS6_human_unloadable_8 LoadFunction = LoadAnim 
	SetReferenceChecksum THPS6_human 
	IF <LoadFunction> <...> name = "anims\\THPS6_skater_flatland\\Truckstand_Init.ska" descChecksum = Truckstand_Init 
		<LoadFunction> <...> name = "anims\\THPS6_skater_flatland\\Truckstand_Out.ska" descChecksum = Truckstand_Out 
		<LoadFunction> <...> name = "anims\\THPS6_skater_flatland\\Truckstand_Range.ska" descChecksum = Truckstand_Range 
		<LoadFunction> <...> name = "anims\\THPS6_skater_flipgrab\\KickFlipBlendFS.ska" descChecksum = KickFlipBlendFS 
		<LoadFunction> <...> name = "anims\\THPS6_skater_flipgrab\\KickFlipBlendBS.ska" descChecksum = KickFlipBlendBS 
		<LoadFunction> <...> name = "anims\\THPS6_skater_flipgrab\\HeelFlipVarialLien.ska" descChecksum = HeelFlipVarialLien 
		<LoadFunction> <...> name = "anims\\THPS6_skater_flipgrab\\_180Varial.ska" descChecksum = _180Varial 
		<LoadFunction> <...> name = "anims\\THPS6_skater_flipgrab\\_360Varial.ska" descChecksum = _360Varial 
		<LoadFunction> <...> name = "anims\\THPS6_skater_flipgrab\\FingerFlipVert.ska" descChecksum = FingerFlipVert 
		<LoadFunction> <...> name = "anims\\THPS6_skater_flipgrab\\SalFlip.ska" descChecksum = SalFlip 
		<LoadFunction> <...> name = "anims\\THPS6_skater_flipgrab\\BenihanaFingerFlip.ska" descChecksum = BenihanaFingerFlip 
		<LoadFunction> <...> name = "anims\\THPS6_skater_flipgrab\\DoubleFingerFlipVert.ska" descChecksum = DoubleFingerFlipVert 
		<LoadFunction> <...> name = "anims\\THPS6_skater_flipgrab\\DoubleSalFlip.ska" descChecksum = DoubleSalFlip 
		<LoadFunction> <...> name = "anims\\THPS6_skater_fliptricks\\_360Flip.ska" descChecksum = _360Flip 
		<LoadFunction> <...> name = "anims\\THPS6_skater_fliptricks\\_360HardFlip.ska" descChecksum = _360HardFlip 
		<LoadFunction> <...> name = "anims\\THPS6_skater_fliptricks\\_360InwardHeelFlip.ska" descChecksum = _360InwardHeelFlip 
		<LoadFunction> <...> name = "anims\\THPS6_skater_fliptricks\\_360ShoveIt.ska" descChecksum = _360ShoveIt 
		<LoadFunction> <...> name = "anims\\THPS6_skater_fliptricks\\_540ShoveIt.ska" descChecksum = _540ShoveIt 
		<LoadFunction> <...> name = "anims\\THPS6_skater_fliptricks\\BigSpinFlip.ska" descChecksum = BigSpinFlip 
		<LoadFunction> <...> name = "anims\\THPS6_skater_fliptricks\\BSBigSpin.ska" descChecksum = BSBigSpin 
		<LoadFunction> <...> name = "anims\\THPS6_skater_fliptricks\\BSFlip.ska" descChecksum = BSFlip 
		<LoadFunction> <...> name = "anims\\THPS6_skater_fliptricks\\DoubleFrontFootImposs.ska" descChecksum = DoubleFrontFootImposs 
		<LoadFunction> <...> name = "anims\\THPS6_skater_fliptricks\\DoubleHeelFlip.ska" descChecksum = DoubleHeelFlip 
		<LoadFunction> <...> name = "anims\\THPS6_skater_fliptricks\\DoubleImpossible.ska" descChecksum = DoubleImpossible 
		<LoadFunction> <...> name = "anims\\THPS6_skater_fliptricks\\DoubleKickFlip.ska" descChecksum = DoubleKickFlip 
		<LoadFunction> <...> name = "anims\\THPS6_skater_fliptricks\\DoubleNollieHeelflip.ska" descChecksum = DoubleNollieHeelflip 
		<LoadFunction> <...> name = "anims\\THPS6_skater_fliptricks\\DoubleNollieKickflip.ska" descChecksum = DoubleNollieKickflip 
		<LoadFunction> <...> name = "anims\\THPS6_skater_fliptricks\\FrontFootImposs.ska" descChecksum = FrontFootImposs 
		<LoadFunction> <...> name = "anims\\THPS6_skater_fliptricks\\FS360ShoveIt.ska" descChecksum = FS360ShoveIt 
		<LoadFunction> <...> name = "anims\\THPS6_skater_fliptricks\\FS540ShoveIt.ska" descChecksum = FS540ShoveIt 
		<LoadFunction> <...> name = "anims\\THPS6_skater_fliptricks\\FSBigSpin.ska" descChecksum = FSBigSpin 
		<LoadFunction> <...> name = "anims\\THPS6_skater_fliptricks\\FSFlip.ska" descChecksum = FSFlip 
		<LoadFunction> <...> name = "anims\\THPS6_skater_fliptricks\\HardFlip.ska" descChecksum = HardFlip 
		<LoadFunction> <...> name = "anims\\THPS6_skater_fliptricks\\HeelFlip.ska" descChecksum = HeelFlip 
		<LoadFunction> <...> name = "anims\\THPS6_skater_fliptricks\\Impossible.ska" descChecksum = Impossible 
		<LoadFunction> <...> name = "anims\\THPS6_skater_fliptricks\\InwardHeelFlip.ska" descChecksum = InwardHeelFlip 
		<LoadFunction> <...> name = "anims\\THPS6_skater_fliptricks\\KickFlip.ska" descChecksum = KickFlip 
		<LoadFunction> <...> name = "anims\\THPS6_skater_fliptricks\\Nollie360Flip.ska" descChecksum = Nollie360Flip 
		<LoadFunction> <...> name = "anims\\THPS6_skater_fliptricks\\Nollie360ShoveIt.ska" descChecksum = Nollie360ShoveIt 
		<LoadFunction> <...> name = "anims\\THPS6_skater_fliptricks\\NollieBS360ShoveIt.ska" descChecksum = NollieBS360ShoveIt 
		<LoadFunction> <...> name = "anims\\THPS6_skater_fliptricks\\NollieBSShoveIt.ska" descChecksum = NollieBSShoveIt 
		<LoadFunction> <...> name = "anims\\THPS6_skater_fliptricks\\NollieFSShoveIt.ska" descChecksum = NollieFSShoveIt 
		<LoadFunction> <...> name = "anims\\THPS6_skater_fliptricks\\NollieHardFlip.ska" descChecksum = NollieHardFlip 
		<LoadFunction> <...> name = "anims\\THPS6_skater_fliptricks\\NollieHeelFlip.ska" descChecksum = NollieHeelFlip 
		<LoadFunction> <...> name = "anims\\THPS6_skater_fliptricks\\NollieImpossible.ska" descChecksum = NollieImpossible 
		<LoadFunction> <...> name = "anims\\THPS6_skater_fliptricks\\NollieInwardFlip.ska" descChecksum = NollieInwardFlip 
		<LoadFunction> <...> name = "anims\\THPS6_skater_fliptricks\\NollieKickFlip.ska" descChecksum = NollieKickFlip 
		<LoadFunction> <...> name = "anims\\THPS6_skater_fliptricks\\NollieVarialHeelflip.ska" descChecksum = NollieVarialHeelflip 
		<LoadFunction> <...> name = "anims\\THPS6_skater_fliptricks\\NollieVarialKickFlip.ska" descChecksum = NollieVarialKickFlip 
		<LoadFunction> <...> name = "anims\\THPS6_skater_fliptricks\\OllieAirWalk.ska" descChecksum = OllieAirWalk 
	ENDIF 
	SetReferenceChecksum 0 
ENDSCRIPT

SCRIPT animload_THPS6_human_unloadable_9 LoadFunction = LoadAnim 
	SetReferenceChecksum THPS6_human 
	IF <LoadFunction> <...> name = "anims\\THPS6_skater_fliptricks\\OllieAirwalkShoveIt.ska" descChecksum = OllieAirwalkShoveIt 
		<LoadFunction> <...> name = "anims\\THPS6_skater_fliptricks\\OllieNorth.ska" descChecksum = OllieNorth 
		<LoadFunction> <...> name = "anims\\THPS6_skater_fliptricks\\OllieNorthBackFootFlip.ska" descChecksum = OllieNorthBackFootFlip 
		<LoadFunction> <...> name = "anims\\THPS6_skater_fliptricks\\PopShoveIt.ska" descChecksum = PopShoveIt 
		<LoadFunction> <...> name = "anims\\THPS6_skater_fliptricks\\PopShoveitBS.ska" descChecksum = PopShoveitBS 
		<LoadFunction> <...> name = "anims\\THPS6_skater_fliptricks\\QuadrupleHeelFlip.ska" descChecksum = QuadrupleHeelFlip 
		<LoadFunction> <...> name = "anims\\THPS6_skater_fliptricks\\TripleHeelFlip.ska" descChecksum = TripleHeelFlip 
		<LoadFunction> <...> name = "anims\\THPS6_skater_fliptricks\\TripleImpossible.ska" descChecksum = TripleImpossible 
		<LoadFunction> <...> name = "anims\\THPS6_skater_fliptricks\\TripleKickFlip.ska" descChecksum = TripleKickFlip 
		<LoadFunction> <...> name = "anims\\THPS6_skater_fliptricks\\VarialHeelFlip.ska" descChecksum = VarialHeelFlip 
		<LoadFunction> <...> name = "anims\\THPS6_skater_fliptricks\\VarialKickFlip.ska" descChecksum = VarialKickFlip 
		<LoadFunction> <...> name = "anims\\THPS6_skater_fliptricks\\KickFlipOldSkool.ska" descChecksum = KickFlipOldSkool 
		<LoadFunction> <...> name = "anims\\THPS6_skater_freestyle\\Spacewalk.ska" descChecksum = Spacewalk 
		<LoadFunction> <...> name = "anims\\THPS6_skater_freestyle\\SkitchMoveRight.ska" descChecksum = SkitchMoveRight 
		<LoadFunction> <...> name = "anims\\THPS6_skater_freestyle\\SkitchMoveLeft.ska" descChecksum = SkitchMoveLeft 
		<LoadFunction> <...> name = "anims\\THPS6_skater_grabtricks\\AirWalk.ska" descChecksum = AirWalk 
		<LoadFunction> <...> name = "anims\\THPS6_skater_grabtricks\\AirWalk_Idle2.ska" descChecksum = AirWalk_Idle2 
		<LoadFunction> <...> name = "anims\\THPS6_skater_grabtricks\\BSShifty.ska" descChecksum = BSShifty 
		<LoadFunction> <...> name = "anims\\THPS6_skater_grabtricks\\BSShifty_Idle.ska" descChecksum = BSShifty_Idle 
		<LoadFunction> <...> name = "anims\\THPS6_skater_grabtricks\\Benihana.ska" descChecksum = Benihana 
		<LoadFunction> <...> name = "anims\\THPS6_skater_grabtricks\\Benihana_Idle.ska" descChecksum = Benihana_Idle 
		<LoadFunction> <...> name = "anims\\THPS6_skater_grabtricks\\Benihana_Out.ska" descChecksum = Benihana_Out 
		<LoadFunction> <...> name = "anims\\THPS6_skater_grabtricks\\BetweenTheLegs_Idle.ska" descChecksum = BetweenTheLegs_Idle 
		<LoadFunction> <...> name = "anims\\THPS6_skater_grabtricks\\BetweenTheLegs_In.ska" descChecksum = BetweenTheLegs_In 
		<LoadFunction> <...> name = "anims\\THPS6_skater_grabtricks\\BetweenTheLegs_Out.ska" descChecksum = BetweenTheLegs_Out 
		<LoadFunction> <...> name = "anims\\THPS6_skater_grabtricks\\CannonBall.ska" descChecksum = CannonBall 
		<LoadFunction> <...> name = "anims\\THPS6_skater_grabtricks\\CannonBall_Idle.ska" descChecksum = CannonBall_Idle 
		<LoadFunction> <...> name = "anims\\THPS6_skater_grabtricks\\CannonballFingerFlip.ska" descChecksum = CannonballFingerFlip 
		<LoadFunction> <...> name = "anims\\THPS6_skater_grabtricks\\ChristAir_Idle.ska" descChecksum = ChristAir_Idle 
		<LoadFunction> <...> name = "anims\\THPS6_skater_grabtricks\\ChristAir_Init.ska" descChecksum = ChristAir_Init 
		<LoadFunction> <...> name = "anims\\THPS6_skater_grabtricks\\ChristAir_Out.ska" descChecksum = ChristAir_Out 
		<LoadFunction> <...> name = "anims\\THPS6_skater_grabtricks\\Crail.ska" descChecksum = Crail 
		<LoadFunction> <...> name = "anims\\THPS6_skater_grabtricks\\Crail_Idle.ska" descChecksum = Crail_Idle 
		<LoadFunction> <...> name = "anims\\THPS6_skater_grabtricks\\CrookedCop.ska" descChecksum = CrookedCop 
		<LoadFunction> <...> name = "anims\\THPS6_skater_grabtricks\\CrookedCop_Idle.ska" descChecksum = CrookedCop_Idle 
		<LoadFunction> <...> name = "anims\\THPS6_skater_grabtricks\\CrossBone.ska" descChecksum = CrossBone 
		<LoadFunction> <...> name = "anims\\THPS6_skater_grabtricks\\CrossBone_Idle.ska" descChecksum = CrossBone_Idle 
		<LoadFunction> <...> name = "anims\\THPS6_skater_grabtricks\\Indy.ska" descChecksum = Indy 
		<LoadFunction> <...> name = "anims\\THPS6_skater_grabtricks\\IndyDelMar.ska" descChecksum = IndyDelMar 
		<LoadFunction> <...> name = "anims\\THPS6_skater_grabtricks\\IndyDelMar_Idle.ska" descChecksum = IndyDelMar_Idle 
		<LoadFunction> <...> name = "anims\\THPS6_skater_grabtricks\\Indy_Idle.ska" descChecksum = Indy_Idle 
		<LoadFunction> <...> name = "anims\\THPS6_skater_grabtricks\\JapanAir.ska" descChecksum = JapanAir 
		<LoadFunction> <...> name = "anims\\THPS6_skater_grabtricks\\JapanAir_Idle.ska" descChecksum = JapanAir_Idle 
		<LoadFunction> <...> name = "anims\\THPS6_skater_grabtricks\\JudoGrab.ska" descChecksum = JudoGrab 
		<LoadFunction> <...> name = "anims\\THPS6_skater_grabtricks\\JudoGrab_Idle.ska" descChecksum = JudoGrab_Idle 
		<LoadFunction> <...> name = "anims\\THPS6_skater_grabtricks\\Madonna.ska" descChecksum = Madonna 
		<LoadFunction> <...> name = "anims\\THPS6_skater_grabtricks\\Madonna_Idle.ska" descChecksum = Madonna_Idle 
		<LoadFunction> <...> name = "anims\\THPS6_skater_grabtricks\\MelonGrab.ska" descChecksum = MelonGrab 
		<LoadFunction> <...> name = "anims\\THPS6_skater_grabtricks\\MelonGrab_Idle.ska" descChecksum = MelonGrab_Idle 
		<LoadFunction> <...> name = "anims\\THPS6_skater_grabtricks\\Method.ska" descChecksum = Method 
	ENDIF 
	SetReferenceChecksum 0 
ENDSCRIPT

SCRIPT animload_THPS6_human_unloadable_10 LoadFunction = LoadAnim 
	SetReferenceChecksum THPS6_human 
	IF <LoadFunction> <...> name = "anims\\THPS6_skater_grabtricks\\Method_Idle.ska" descChecksum = Method_Idle 
		<LoadFunction> <...> name = "anims\\THPS6_skater_grabtricks\\MuteGrab.ska" descChecksum = MuteGrab 
		<LoadFunction> <...> name = "anims\\THPS6_skater_grabtricks\\MuteGrab_Idle.ska" descChecksum = MuteGrab_Idle 
		<LoadFunction> <...> name = "anims\\THPS6_skater_grabtricks\\NoseGrab.ska" descChecksum = NoseGrab 
		<LoadFunction> <...> name = "anims\\THPS6_skater_grabtricks\\NoseGrab_Idle.ska" descChecksum = NoseGrab_Idle 
		<LoadFunction> <...> name = "anims\\THPS6_skater_grabtricks\\Nosebone.ska" descChecksum = Nosebone 
		<LoadFunction> <...> name = "anims\\THPS6_skater_grabtricks\\Nosebone_Idle.ska" descChecksum = Nosebone_Idle 
		<LoadFunction> <...> name = "anims\\THPS6_skater_grabtricks\\OneFootJapan.ska" descChecksum = OneFootJapan 
		<LoadFunction> <...> name = "anims\\THPS6_skater_grabtricks\\OneFootJapan_Idle.ska" descChecksum = OneFootJapan_Idle 
		<LoadFunction> <...> name = "anims\\THPS6_skater_grabtricks\\OneFootTailGrab.ska" descChecksum = OneFootTailGrab 
		<LoadFunction> <...> name = "anims\\THPS6_skater_grabtricks\\OneFootTailGrab_Idle.ska" descChecksum = OneFootTailGrab_Idle 
		<LoadFunction> <...> name = "anims\\THPS6_skater_grabtricks\\RocketAir.ska" descChecksum = RocketAir 
		<LoadFunction> <...> name = "anims\\THPS6_skater_grabtricks\\RocketAir_Idle.ska" descChecksum = RocketAir_Idle 
		<LoadFunction> <...> name = "anims\\THPS6_skater_grabtricks\\SackTap.ska" descChecksum = SackTap 
		<LoadFunction> <...> name = "anims\\THPS6_skater_grabtricks\\SaranWrap.ska" descChecksum = SaranWrap 
		<LoadFunction> <...> name = "anims\\THPS6_skater_grabtricks\\SaranWrap_Idle.ska" descChecksum = SaranWrap_Idle 
		<LoadFunction> <...> name = "anims\\THPS6_skater_grabtricks\\SaranWrap_Out.ska" descChecksum = SaranWrap_Out 
		<LoadFunction> <...> name = "anims\\THPS6_skater_grabtricks\\SeatBelt.ska" descChecksum = SeatBelt 
		<LoadFunction> <...> name = "anims\\THPS6_skater_grabtricks\\SeatBelt_Idle.ska" descChecksum = SeatBelt_Idle 
		<LoadFunction> <...> name = "anims\\THPS6_skater_grabtricks\\Shifty.ska" descChecksum = Shifty 
		<LoadFunction> <...> name = "anims\\THPS6_skater_grabtricks\\Shifty_Idle.ska" descChecksum = Shifty_Idle 
		<LoadFunction> <...> name = "anims\\THPS6_skater_grabtricks\\Stalefish.ska" descChecksum = Stalefish 
		<LoadFunction> <...> name = "anims\\THPS6_skater_grabtricks\\Stalefish_Idle.ska" descChecksum = Stalefish_Idle 
		<LoadFunction> <...> name = "anims\\THPS6_skater_grabtricks\\Stalefish_Layback.ska" descChecksum = Stalefish_Layback 
		<LoadFunction> <...> name = "anims\\THPS6_skater_grabtricks\\Stalefish_Layback_Idle.ska" descChecksum = Stalefish_Layback_Idle 
		<LoadFunction> <...> name = "anims\\THPS6_skater_grabtricks\\Stiffy.ska" descChecksum = Stiffy 
		<LoadFunction> <...> name = "anims\\THPS6_skater_grabtricks\\Stiffy_Idle.ska" descChecksum = Stiffy_Idle 
		<LoadFunction> <...> name = "anims\\THPS6_skater_grabtricks\\TailGrab.ska" descChecksum = TailGrab 
		<LoadFunction> <...> name = "anims\\THPS6_skater_grabtricks\\TailGrab_Idle.ska" descChecksum = TailGrab_Idle 
		<LoadFunction> <...> name = "anims\\THPS6_skater_grabtricks\\TuckKnee.ska" descChecksum = TuckKnee 
		<LoadFunction> <...> name = "anims\\THPS6_skater_grabtricks\\TuckKnee_Idle.ska" descChecksum = TuckKnee_Idle 
		<LoadFunction> <...> name = "anims\\THPS6_skater_grind\\BSBluntSlide_Range.ska" descChecksum = BSBluntSlide_Range 
		<LoadFunction> <...> name = "anims\\THPS6_skater_grind\\BSBoardSlide_Range.ska" descChecksum = BSBoardSlide_Range 
		<LoadFunction> <...> name = "anims\\THPS6_skater_grind\\BSBoardslide_Out.ska" descChecksum = BSBoardslide_Out 
		<LoadFunction> <...> name = "anims\\THPS6_skater_grind\\BSCrooked_Range.ska" descChecksum = BSCrooked_Range 
		<LoadFunction> <...> name = "anims\\THPS6_skater_grind\\BSFeeble_Range.ska" descChecksum = BSFeeble_Range 
		<LoadFunction> <...> name = "anims\\THPS6_skater_grind\\BSHurricaneGrind_Init.ska" descChecksum = BSHurricaneGrind_Init 
		<LoadFunction> <...> name = "anims\\THPS6_skater_grind\\BSHurricaneGrind_Range.ska" descChecksum = BSHurricaneGrind_Range 
		<LoadFunction> <...> name = "anims\\THPS6_skater_grind\\BSNoseBlunt_Range.ska" descChecksum = BSNoseBlunt_Range 
		<LoadFunction> <...> name = "anims\\THPS6_skater_grind\\BSNoseSlide_Out.ska" descChecksum = BSNoseSlide_Out 
		<LoadFunction> <...> name = "anims\\THPS6_skater_grind\\BSOverCrook_Range.ska" descChecksum = BSOverCrook_Range 
		<LoadFunction> <...> name = "anims\\THPS6_skater_grind\\BSSaladGrind_Init.ska" descChecksum = BSSaladGrind_Init 
		<LoadFunction> <...> name = "anims\\THPS6_skater_grind\\BSSaladGrind_Range.ska" descChecksum = BSSaladGrind_Range 
		<LoadFunction> <...> name = "anims\\THPS6_skater_grind\\BSSmith_Range.ska" descChecksum = BSSmith_Range 
		<LoadFunction> <...> name = "anims\\THPS6_skater_grind\\BSTailSlide_Out.ska" descChecksum = BSTailSlide_Out 
		<LoadFunction> <...> name = "anims\\THPS6_skater_grind\\FSBluntSlide_Range.ska" descChecksum = FSBluntSlide_Range 
		<LoadFunction> <...> name = "anims\\THPS6_skater_grind\\FSBoardSlide_Out.ska" descChecksum = FSBoardSlide_Out 
		<LoadFunction> <...> name = "anims\\THPS6_skater_grind\\FSBoardSlide_Range.ska" descChecksum = FSBoardSlide_Range 
		<LoadFunction> <...> name = "anims\\THPS6_skater_grind\\FSCrooked_Range.ska" descChecksum = FSCrooked_Range 
		<LoadFunction> <...> name = "anims\\THPS6_skater_grind\\FSFeeble_Range.ska" descChecksum = FSFeeble_Range 
	ENDIF 
	SetReferenceChecksum 0 
ENDSCRIPT

SCRIPT animload_THPS6_human_unloadable_11 LoadFunction = LoadAnim 
	SetReferenceChecksum THPS6_human 
	IF <LoadFunction> <...> name = "anims\\THPS6_skater_grind\\FSHurricaneGrind_Init.ska" descChecksum = FSHurricaneGrind_Init 
		<LoadFunction> <...> name = "anims\\THPS6_skater_grind\\FSHurricaneGrind_Range.ska" descChecksum = FSHurricaneGrind_Range 
		<LoadFunction> <...> name = "anims\\THPS6_skater_grind\\FSNoseBlunt_Range.ska" descChecksum = FSNoseBlunt_Range 
		<LoadFunction> <...> name = "anims\\THPS6_skater_grind\\FSNoseSlide_Out.ska" descChecksum = FSNoseSlide_Out 
		<LoadFunction> <...> name = "anims\\THPS6_skater_grind\\FSNoseSlide_Range.ska" descChecksum = FSNoseSlide_Range 
		<LoadFunction> <...> name = "anims\\THPS6_skater_grind\\FSOverCrook_Range.ska" descChecksum = FSOverCrook_Range 
		<LoadFunction> <...> name = "anims\\THPS6_skater_grind\\FSSaladGrind_Init.ska" descChecksum = FSSaladGrind_Init 
		<LoadFunction> <...> name = "anims\\THPS6_skater_grind\\FSSaladGrind_Range.ska" descChecksum = FSSaladGrind_Range 
		<LoadFunction> <...> name = "anims\\THPS6_skater_grind\\FSSmith_Range.ska" descChecksum = FSSmith_Range 
		<LoadFunction> <...> name = "anims\\THPS6_skater_grind\\FSTailSlide_Out.ska" descChecksum = FSTailSlide_Out 
		<LoadFunction> <...> name = "anims\\THPS6_skater_grind\\FSTailSlide_Range.ska" descChecksum = FSTailSlide_Range 
		<LoadFunction> <...> name = "anims\\THPS6_skater_grind\\FiftyFifty2_Range.ska" descChecksum = FiftyFifty2_Range 
		<LoadFunction> <...> name = "anims\\THPS6_skater_grind\\FiftyFifty3_Range.ska" descChecksum = FiftyFifty3_Range 
		<LoadFunction> <...> name = "anims\\THPS6_skater_grind\\FiftyFifty_Range.ska" descChecksum = FiftyFifty_Range 
		<LoadFunction> <...> name = "anims\\THPS6_skater_grind\\Init_BSBluntSlide.ska" descChecksum = Init_BSBluntSlide 
		<LoadFunction> <...> name = "anims\\THPS6_skater_grind\\Init_BSBoardSlide.ska" descChecksum = Init_BSBoardSlide 
		<LoadFunction> <...> name = "anims\\THPS6_skater_grind\\Init_BSCrooked.ska" descChecksum = Init_BSCrooked 
		<LoadFunction> <...> name = "anims\\THPS6_skater_grind\\Init_BSFeeble.ska" descChecksum = Init_BSFeeble 
		<LoadFunction> <...> name = "anims\\THPS6_skater_grind\\Init_BSLipSlide.ska" descChecksum = Init_BSLipSlide 
		<LoadFunction> <...> name = "anims\\THPS6_skater_grind\\Init_BSNoseBlunt.ska" descChecksum = Init_BSNoseBlunt 
		<LoadFunction> <...> name = "anims\\THPS6_skater_grind\\Init_BSOverCrook.ska" descChecksum = Init_BSOverCrook 
		<LoadFunction> <...> name = "anims\\THPS6_skater_grind\\Init_BSSmith.ska" descChecksum = Init_BSSmith 
		<LoadFunction> <...> name = "anims\\THPS6_skater_grind\\Init_FSBluntSlide.ska" descChecksum = Init_FSBluntSlide 
		<LoadFunction> <...> name = "anims\\THPS6_skater_grind\\Init_FSBoardSlide.ska" descChecksum = Init_FSBoardSlide 
		<LoadFunction> <...> name = "anims\\THPS6_skater_grind\\Init_FSCrooked.ska" descChecksum = Init_FSCrooked 
		<LoadFunction> <...> name = "anims\\THPS6_skater_grind\\Init_FSFeeble.ska" descChecksum = Init_FSFeeble 
		<LoadFunction> <...> name = "anims\\THPS6_skater_grind\\Init_FSLipSlide.ska" descChecksum = Init_FSLipSlide 
		<LoadFunction> <...> name = "anims\\THPS6_skater_grind\\Init_FSNoseBlunt.ska" descChecksum = Init_FSNoseBlunt 
		<LoadFunction> <...> name = "anims\\THPS6_skater_grind\\Init_FSNoseSlide.ska" descChecksum = Init_FSNoseSlide 
		<LoadFunction> <...> name = "anims\\THPS6_skater_grind\\Init_FSOverCrook.ska" descChecksum = Init_FSOverCrook 
		<LoadFunction> <...> name = "anims\\THPS6_skater_grind\\Init_FSSmith.ska" descChecksum = Init_FSSmith 
		<LoadFunction> <...> name = "anims\\THPS6_skater_grind\\Init_FSTailSlide.ska" descChecksum = Init_FSTailSlide 
		<LoadFunction> <...> name = "anims\\THPS6_skater_grind\\Init_FiftyFifty.ska" descChecksum = Init_FiftyFifty 
		<LoadFunction> <...> name = "anims\\THPS6_skater_grind\\Init_NoseGrind.ska" descChecksum = Init_NoseGrind 
		<LoadFunction> <...> name = "anims\\THPS6_skater_grind\\Init_NoseSlide.ska" descChecksum = Init_NoseSlide 
		<LoadFunction> <...> name = "anims\\THPS6_skater_grind\\Init_TailGrind.ska" descChecksum = Init_TailGrind 
		<LoadFunction> <...> name = "anims\\THPS6_skater_grind\\Init_TailSlide.ska" descChecksum = Init_TailSlide 
		<LoadFunction> <...> name = "anims\\THPS6_skater_grind\\NoseGrind_Range.ska" descChecksum = NoseGrind_Range 
		<LoadFunction> <...> name = "anims\\THPS6_skater_grind\\NoseSlide_Range.ska" descChecksum = NoseSlide_Range 
		<LoadFunction> <...> name = "anims\\THPS6_skater_grind\\TailGrind_Range.ska" descChecksum = TailGrind_Range 
		<LoadFunction> <...> name = "anims\\THPS6_skater_grind\\TailSlide_Range.ska" descChecksum = TailSlide_Range 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\CrouchedLand4.ska" descChecksum = CrouchedLand4 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\CrouchedLand4_Small.ska" descChecksum = CrouchedLand4_Small 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\CrouchedLand_Tiny.ska" descChecksum = CrouchedLand_Tiny 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\StandingLand_Tiny.ska" descChecksum = StandingLand_Tiny 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\CrouchedLand5_Small.ska" descChecksum = CrouchedLand5_Small 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\CrouchedLand5.ska" descChecksum = CrouchedLand5 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\CrouchedLand6.ska" descChecksum = CrouchedLand6 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\CrouchedLandTurn4.ska" descChecksum = CrouchedLandTurn4 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\CrouchedLandTurn5.ska" descChecksum = CrouchedLandTurn5 
	ENDIF 
	SetReferenceChecksum 0 
ENDSCRIPT

SCRIPT animload_THPS6_human_unloadable_12 LoadFunction = LoadAnim 
	SetReferenceChecksum THPS6_human 
	IF <LoadFunction> <...> name = "anims\\THPS6_skater_basics\\StandingLandTurn1.ska" descChecksum = StandingLandTurn1 
		<LoadFunction> <...> name = "anims\\THPS6_skater_lip\\MuteInvert_Init.ska" descChecksum = MuteInvert_Init 
		<LoadFunction> <...> name = "anims\\THPS6_skater_lip\\MuteInvert_Range.ska" descChecksum = MuteInvert_Range 
		<LoadFunction> <...> name = "anims\\THPS6_skater_lip\\MuteInvert_Out.ska" descChecksum = MuteInvert_Out 
		<LoadFunction> <...> name = "anims\\THPS6_skater_lip\\EggPlant_Init.ska" descChecksum = EggPlant_Init 
		<LoadFunction> <...> name = "anims\\THPS6_skater_lip\\EggPlant_Range.ska" descChecksum = EggPlant_Range 
		<LoadFunction> <...> name = "anims\\THPS6_skater_lip\\EggPlant_Out.ska" descChecksum = EggPlant_Out 
		<LoadFunction> <...> name = "anims\\THPS6_skater_lip\\GymnastPlant_Init.ska" descChecksum = GymnastPlant_Init 
		<LoadFunction> <...> name = "anims\\THPS6_skater_lip\\GymnastPlant_Range.ska" descChecksum = GymnastPlant_Range 
		<LoadFunction> <...> name = "anims\\THPS6_skater_lip\\GymnastPlant_Out.ska" descChecksum = GymnastPlant_Out 
		<LoadFunction> <...> name = "anims\\THPS6_skater_lip\\FakieRockAndRoll_Init.ska" descChecksum = FakieRockAndRoll_Init 
		<LoadFunction> <...> name = "anims\\THPS6_skater_lip\\FakieRockAndRoll_Range.ska" descChecksum = FakieRockAndRoll_Range 
		<LoadFunction> <...> name = "anims\\THPS6_skater_lip\\FakieRockAndRoll_Out.ska" descChecksum = FakieRockAndRoll_Out 
		<LoadFunction> <...> name = "anims\\THPS6_skater_lip\\NoseTailStall_Init.ska" descChecksum = NoseTailStall_Init 
		<LoadFunction> <...> name = "anims\\THPS6_skater_lip\\NoseTailStall_Range.ska" descChecksum = NoseTailStall_Range 
		<LoadFunction> <...> name = "anims\\THPS6_skater_lip\\NoseTailStall_Out.ska" descChecksum = NoseTailStall_Out 
		<LoadFunction> <...> name = "anims\\THPS6_skater_lip\\BluntToFakie_Init.ska" descChecksum = BluntToFakie_Init 
		<LoadFunction> <...> name = "anims\\THPS6_skater_lip\\BluntToFakie_Range.ska" descChecksum = BluntToFakie_Range 
		<LoadFunction> <...> name = "anims\\THPS6_skater_lip\\BluntToFakie_Out.ska" descChecksum = BluntToFakie_Out 
		<LoadFunction> <...> name = "anims\\THPS6_skater_lip\\Disaster_Init.ska" descChecksum = Disaster_Init 
		<LoadFunction> <...> name = "anims\\THPS6_skater_lip\\Disaster_Range.ska" descChecksum = Disaster_Range 
		<LoadFunction> <...> name = "anims\\THPS6_skater_lip\\Disaster_Out.ska" descChecksum = Disaster_Out 
		<LoadFunction> <...> name = "anims\\THPS6_skater_lip\\AxleStall_Init.ska" descChecksum = AxleStall_Init 
		<LoadFunction> <...> name = "anims\\THPS6_skater_lip\\AxleStall_Range.ska" descChecksum = AxleStall_Range 
		<LoadFunction> <...> name = "anims\\THPS6_skater_lip\\AxleStall_Out.ska" descChecksum = AxleStall_Out 
		<LoadFunction> <...> name = "anims\\THPS6_skater_lip\\Invert_Init.ska" descChecksum = Invert_Init 
		<LoadFunction> <...> name = "anims\\THPS6_skater_lip\\Invert_Range.ska" descChecksum = Invert_Range 
		<LoadFunction> <...> name = "anims\\THPS6_skater_lip\\Invert_Out.ska" descChecksum = Invert_Out 
		<LoadFunction> <...> name = "anims\\THPS6_skater_lip\\OneFootInvert_Init.ska" descChecksum = OneFootInvert_Init 
		<LoadFunction> <...> name = "anims\\THPS6_skater_lip\\OneFootInvert_Range.ska" descChecksum = OneFootInvert_Range 
		<LoadFunction> <...> name = "anims\\THPS6_skater_lip\\OneFootInvert_Out.ska" descChecksum = OneFootInvert_Out 
		<LoadFunction> <...> name = "anims\\THPS6_skater_lip\\BSFootplant_Init.ska" descChecksum = BSFootplant_Init 
		<LoadFunction> <...> name = "anims\\THPS6_skater_lip\\BSFootplant_Range.ska" descChecksum = BSFootplant_Range 
		<LoadFunction> <...> name = "anims\\THPS6_skater_lip\\BSFootplant_Out.ska" descChecksum = BSFootplant_Out 
		<LoadFunction> <...> name = "anims\\THPS6_skater_lip\\BSFootplant_OllieOut.ska" descChecksum = BSFootplant_OllieOut 
		<LoadFunction> <...> name = "anims\\THPS6_skater_lip\\AxleStall_OllieOut.ska" descChecksum = AxleStall_OllieOut 
		<LoadFunction> <...> name = "anims\\THPS6_skater_lip\\FS180Noseblunt_Init.ska" descChecksum = FS180Noseblunt_Init 
		<LoadFunction> <...> name = "anims\\THPS6_skater_lip\\FS180Noseblunt_Range.ska" descChecksum = FS180Noseblunt_Range 
		<LoadFunction> <...> name = "anims\\THPS6_skater_lip\\FS180Noseblunt_Out.ska" descChecksum = FS180Noseblunt_Out 
		<LoadFunction> <...> name = "anims\\THPS6_skater_lip\\FSIndyNosePick_Init.ska" descChecksum = FSIndyNosePick_Init 
		<LoadFunction> <...> name = "anims\\THPS6_skater_lip\\FSIndyNosePick_Range.ska" descChecksum = FSIndyNosePick_Range 
		<LoadFunction> <...> name = "anims\\THPS6_skater_lip\\FSIndyNosePick_Out.ska" descChecksum = FSIndyNosePick_Out 
		<LoadFunction> <...> name = "anims\\THPS6_skater_lip\\AndrectInvert_Init.ska" descChecksum = AndrectInvert_Init 
		<LoadFunction> <...> name = "anims\\THPS6_skater_lip\\AndrectInvert_Out.ska" descChecksum = AndrectInvert_Out 
		<LoadFunction> <...> name = "anims\\THPS6_skater_lip\\AndrectInvert_Range.ska" descChecksum = AndrectInvert_Range 
		<LoadFunction> <...> name = "anims\\THPS6_skater_lip\\Switcheroo_Out.ska" descChecksum = Switcheroo_Out 
		<LoadFunction> <...> name = "anims\\THPS6_skater_lip\\Switcheroo_Init.ska" descChecksum = Switcheroo_Init 
		<LoadFunction> <...> name = "anims\\THPS6_skater_lip\\Switcheroo_Range.ska" descChecksum = Switcheroo_Range 
		<LoadFunction> <...> name = "anims\\THPS6_Skater_Basics\\Natas_Spin_Init.ska" descChecksum = Natas_Spin_Init 
		<LoadFunction> <...> name = "anims\\THPS6_Skater_Basics\\Natas_Spin_Range.ska" descChecksum = Natas_Spin_Range 
	ENDIF 
	SetReferenceChecksum 0 
ENDSCRIPT

SCRIPT animload_THPS6_human_unloadable_13 LoadFunction = LoadAnim 
	SetReferenceChecksum THPS6_human 
	IF <LoadFunction> <...> name = "anims\\THPS6_Skater_Basics\\Natas_Spin_Out.ska" descChecksum = Natas_Spin_Out 
		<LoadFunction> <...> name = "anims\\THPS6_Skater_Basics\\FS_PowerSlide_Init.ska" descChecksum = FS_PowerSlide_Init 
		<LoadFunction> <...> name = "anims\\THPS6_Skater_Basics\\FS_PowerSlide_Idle.ska" descChecksum = FS_PowerSlide_Idle 
		<LoadFunction> <...> name = "anims\\THPS6_Skater_Basics\\FS_PowerSlide_Out.ska" descChecksum = FS_PowerSlide_Out 
		<LoadFunction> <...> name = "anims\\THPS6_Skater_Basics\\FS_PowerSlide_180_Out.ska" descChecksum = FS_PowerSlide_180_Out 
		<LoadFunction> <...> name = "anims\\THPS6_Skater_Basics\\BS_PowerSlide_Init.ska" descChecksum = BS_PowerSlide_Init 
		<LoadFunction> <...> name = "anims\\THPS6_Skater_Basics\\BS_PowerSlide_Idle.ska" descChecksum = BS_PowerSlide_Idle 
		<LoadFunction> <...> name = "anims\\THPS6_Skater_Basics\\BS_PowerSlide_180_Out.ska" descChecksum = BS_PowerSlide_180_Out 
		<LoadFunction> <...> name = "anims\\THPS6_Skater_Basics\\BS_PowerSlide_Out.ska" descChecksum = BS_PowerSlide_Out 
		<LoadFunction> <...> name = "anims\\THPS6_Skater_PressureFlip\\BS180PressureFlip.ska" descChecksum = BS180PressureFlip 
		<LoadFunction> <...> name = "anims\\THPS6_Skater_PressureFlip\\BSToeFlip.ska" descChecksum = BSToeFlip 
		<LoadFunction> <...> name = "anims\\THPS6_Skater_PressureFlip\\BS360PressureFlip.ska" descChecksum = BS360PressureFlip 
		<LoadFunction> <...> name = "anims\\THPS6_Skater_PressureFlip\\FS360PressureFlip.ska" descChecksum = FS360PressureFlip 
		<LoadFunction> <...> name = "anims\\THPS6_skater_misc\\RunFromIdle.ska" descChecksum = RunFromIdle 
		<LoadFunction> <...> name = "anims\\THPS6_skater_misc\\Run.ska" descChecksum = Run 
		<LoadFunction> <...> name = "anims\\THPS6_skater_misc\\RunToIdle.ska" descChecksum = RunToIdle 
		<LoadFunction> <...> name = "anims\\THPS6_skater_misc\\RunJump.ska" descChecksum = RunJump 
		<LoadFunction> <...> name = "anims\\THPS6_skater_misc\\RunJumpIdle.ska" descChecksum = RunJumpIdle 
		<LoadFunction> <...> name = "anims\\THPS6_skater_misc\\RunJumpLand.ska" descChecksum = RunJumpLand 
		<LoadFunction> <...> name = "anims\\THPS6_Skater_Female\\NewBrake_Female.ska" descChecksum = NewBrake_Female 
		<LoadFunction> <...> name = "anims\\THPS6_Skater_Female\\NewBrakeIdle_Female.ska" descChecksum = NewBrakeIdle_Female 
		<LoadFunction> <...> name = "anims\\THPS6_Skater_Female\\NewBrakeIdle2_Female.ska" descChecksum = NewBrakeIdle2_Female 
		<LoadFunction> <...> name = "anims\\THPS6_Skater_Female\\NewBrakeIdle3_Female.ska" descChecksum = NewBrakeIdle3_Female 
		<LoadFunction> <...> name = "anims\\THPS6_Skater_Female\\NewBrakeIdle4_Female.ska" descChecksum = NewBrakeIdle4_Female 
		<LoadFunction> <...> name = "anims\\THPS6_Skater_Female\\NewBrakeIdle6_Female.ska" descChecksum = NewBrakeIdle6_Female 
		<LoadFunction> <...> name = "anims\\THPS6_Skater_Female\\NewBrakeIdle7_Female.ska" descChecksum = NewBrakeIdle7_Female 
		<LoadFunction> <...> name = "anims\\THPS6_Skater_Female\\NewBrakeIdle8_Female.ska" descChecksum = NewBrakeIdle8_Female 
		<LoadFunction> <...> name = "anims\\thps6_skater_OnFoot_partial\\HangLeft10_Partial.ska" descChecksum = HangLeft10_Partial 
		<LoadFunction> <...> name = "anims\\thps6_skater_OnFoot_partial\\HangRight10_Partial.ska" descChecksum = HangRight10_Partial 
		<LoadFunction> <...> name = "anims\\thps6_skater_OnFoot_partial\\HangLeft10_PartialUp.ska" descChecksum = HangLeft10_PartialUp 
		<LoadFunction> <...> name = "anims\\thps6_skater_OnFoot_partial\\HangRight10_PartialUp.ska" descChecksum = HangRight10_PartialUp 
		<LoadFunction> <...> name = "anims\\thps6_skater_OnFoot_partial\\HangLeft20_Partial.ska" descChecksum = HangLeft20_Partial 
		<LoadFunction> <...> name = "anims\\thps6_skater_OnFoot_partial\\HangRight20_Partial.ska" descChecksum = HangRight20_Partial 
		<LoadFunction> <...> name = "anims\\thps6_skater_OnFoot_partial\\HangLeft20_PartialUp.ska" descChecksum = HangLeft20_PartialUp 
		<LoadFunction> <...> name = "anims\\thps6_skater_OnFoot_partial\\HangRight20_PartialUp.ska" descChecksum = HangRight20_PartialUp 
		<LoadFunction> <...> name = "anims\\thps6_skater_OnFoot_partial\\HangLeft30_Partial.ska" descChecksum = HangLeft30_Partial 
		<LoadFunction> <...> name = "anims\\thps6_skater_OnFoot_partial\\HangRight30_Partial.ska" descChecksum = HangRight30_Partial 
		<LoadFunction> <...> name = "anims\\thps6_skater_OnFoot_partial\\HangLeft30_PartialUp.ska" descChecksum = HangLeft30_PartialUp 
		<LoadFunction> <...> name = "anims\\thps6_skater_OnFoot_partial\\HangRight30_PartialUp.ska" descChecksum = HangRight30_PartialUp 
		<LoadFunction> <...> name = "anims\\thps6_skater_OnFoot_partial\\HangLeft40_Partial.ska" descChecksum = HangLeft40_Partial 
		<LoadFunction> <...> name = "anims\\thps6_skater_OnFoot_partial\\HangRight40_Partial.ska" descChecksum = HangRight40_Partial 
		<LoadFunction> <...> name = "anims\\thps6_skater_OnFoot_partial\\HangLeft40_PartialUp.ska" descChecksum = HangLeft40_PartialUp 
		<LoadFunction> <...> name = "anims\\thps6_skater_OnFoot_partial\\HangRight40_PartialUp.ska" descChecksum = HangRight40_PartialUp 
		<LoadFunction> <...> name = "anims\\thps6_skater_OnFoot_partial\\WalkingSlap_Partial.ska" descChecksum = WalkingSlap_Partial 
		<LoadFunction> <...> name = "anims\\thps6_skater_OnFoot_partial\\FastRun_Partial.ska" descChecksum = FastRun_Partial 
		<LoadFunction> <...> name = "anims\\thps6_skater_OnFoot_partial\\HangIdleToDrop_Partial.ska" descChecksum = HangIdleToDrop_Partial 
		<LoadFunction> <...> name = "anims\\thps6_skater_OnFoot_partial\\HangOntoTheTop_Partial.ska" descChecksum = HangOntoTheTop_Partial 
		<LoadFunction> <...> name = "anims\\thps6_skater_OnFoot_partial\\JumpAir_Partial.ska" descChecksum = JumpAir_Partial 
		<LoadFunction> <...> name = "anims\\thps6_skater_OnFoot_partial\\JumpLandToRun_Partial.ska" descChecksum = JumpLandToRun_Partial 
		<LoadFunction> <...> name = "anims\\thps6_skater_OnFoot_partial\\JumpLandToStand_Partial.ska" descChecksum = JumpLandToStand_Partial 
	ENDIF 
	SetReferenceChecksum 0 
ENDSCRIPT

SCRIPT animload_THPS6_human_unloadable_14 LoadFunction = LoadAnim 
	SetReferenceChecksum THPS6_human 
	IF <LoadFunction> <...> name = "anims\\thps6_skater_OnFoot_partial\\LadderClimb_Partial.ska" descChecksum = LadderClimb_Partial 
		<LoadFunction> <...> name = "anims\\thps6_skater_OnFoot_partial\\LadderClimbFromStandIdle_Partial.ska" descChecksum = LadderClimbFromStandIdle_Partial 
		<LoadFunction> <...> name = "anims\\thps6_skater_OnFoot_partial\\LadderOntoTheTop_Partial.ska" descChecksum = LadderOntoTheTop_Partial 
		<LoadFunction> <...> name = "anims\\thps6_skater_OnFoot_partial\\RunToJump_Partial.ska" descChecksum = RunToJump_Partial 
		<LoadFunction> <...> name = "anims\\thps6_skater_OnFoot_partial\\StandToHang_Partial.ska" descChecksum = StandToHang_Partial 
		<LoadFunction> <...> name = "anims\\thps6_skater_OnFoot_partial\\StandToJump_Partial.ska" descChecksum = StandToJump_Partial 
		<LoadFunction> <...> name = "anims\\thps6_skater_OnFoot_partial\\WRun_Partial.ska" descChecksum = WRun_Partial 
		<LoadFunction> <...> name = "anims\\thps6_skater_OnFoot_partial\\WStand_Partial.ska" descChecksum = WStand_Partial 
		<LoadFunction> <...> name = "anims\\thps6_skater_OnFoot_partial\\WStandToRun_Partial.ska" descChecksum = WStandToRun_Partial 
		<LoadFunction> <...> name = "anims\\thps6_skater_OnFoot_partial\\WStandToWalk_Partial.ska" descChecksum = WStandToWalk_Partial 
		<LoadFunction> <...> name = "anims\\thps6_skater_OnFoot_partial\\WWalk_Partial.ska" descChecksum = WWalk_Partial 
		<LoadFunction> <...> name = "anims\\thps6_skater_OnFoot_partial\\WalkFast_Partial.ska" descChecksum = WalkFast_Partial 
		<LoadFunction> <...> name = "anims\\thps6_skater_OnFoot_partial\\WalkSlow_Partial.ska" descChecksum = WalkSlow_Partial 
		<LoadFunction> <...> name = "anims\\thps6_skater_OnFoot_partial\\_180RunSkid_Partial.ska" descChecksum = _180RunSkid_Partial 
		<LoadFunction> <...> name = "anims\\thps6_skater_OnFoot_partial\\JumpToSwingHang_Partial.ska" descChecksum = JumpToSwingHang_Partial 
		<LoadFunction> <...> name = "anims\\thps6_skater_OnFoot_partial\\JumpToWallHang_Partial.ska" descChecksum = JumpToWallHang_Partial 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\AirCasperFlip_Idle.ska" descChecksum = AirCasperFlip_Idle 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\AirCasperFlip_Init.ska" descChecksum = AirCasperFlip_Init 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\AirCasperFlip_Out.ska" descChecksum = AirCasperFlip_Out 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\BSNoseSlideLipSlide.ska" descChecksum = BSNoseSlideLipSlide 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\BarrelRoll.ska" descChecksum = BarrelRoll 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\BigHitter_Init.ska" descChecksum = BigHitter_Init 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\BigHitter_Out.ska" descChecksum = BigHitter_Out 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\BigHitter_Range.ska" descChecksum = BigHitter_Range 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\CoffinGrind_Init.ska" descChecksum = CoffinGrind_Init 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\CoffinGrind_Out.ska" descChecksum = CoffinGrind_Out 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\CoffinGrind_Range.ska" descChecksum = CoffinGrind_Range 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\CrailSlide_Init.ska" descChecksum = CrailSlide_Init 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\CrailSlide_Out.ska" descChecksum = CrailSlide_Out 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\CrailSlide_Range.ska" descChecksum = CrailSlide_Range 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\CrookBigSpinFlipCrook.ska" descChecksum = CrookBigSpinFlipCrook 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\DaffyBroken_Init.ska" descChecksum = DaffyBroken_Init 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\DaffyBroken_Range.ska" descChecksum = DaffyBroken_Range 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\DanceParty_Idle.ska" descChecksum = DanceParty_Idle 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\DanceParty_Init.ska" descChecksum = DanceParty_Init 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\DarkSlide_Init.ska" descChecksum = DarkSlide_Init 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\DarkSlide_Out.ska" descChecksum = DarkSlide_Out 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\DarkSlide_Range.ska" descChecksum = DarkSlide_Range 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\DoubleBlunt_Idle.ska" descChecksum = DoubleBlunt_Idle 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\DoubleBlunt_Init.ska" descChecksum = DoubleBlunt_Init 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\DoubleKFVarialIndy.ska" descChecksum = DoubleKFVarialIndy 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\ElbowSmash_Idle.ska" descChecksum = ElbowSmash_Idle 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\ElbowSmash_Init.ska" descChecksum = ElbowSmash_Init 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\ElbowSmash_Out.ska" descChecksum = ElbowSmash_Out 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\FS540.ska" descChecksum = FS540 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\FSBigSpinShifty_Idle.ska" descChecksum = FSBigSpinShifty_Idle 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\FSBigSpinShifty_Init.ska" descChecksum = FSBigSpinShifty_Init 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\FSBigSpinShifty_Out.ska" descChecksum = FSBigSpinShifty_Out 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\FSNoseSlideLipSlide.ska" descChecksum = FSNoseSlideLipSlide 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\Fandangle_Init.ska" descChecksum = Fandangle_Init 
	ENDIF 
	SetReferenceChecksum 0 
ENDSCRIPT

SCRIPT animload_THPS6_human_unloadable_15 LoadFunction = LoadAnim 
	SetReferenceChecksum THPS6_human 
	IF <LoadFunction> <...> name = "anims\\THPS6_skater_special\\Fandangle_Out.ska" descChecksum = Fandangle_Out 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\Fandangle_Range.ska" descChecksum = Fandangle_Range 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\FingerFlipAirWalk.ska" descChecksum = FingerFlipAirWalk 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\Flamingo_Idle.ska" descChecksum = Flamingo_Idle 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\Flamingo_Init.ska" descChecksum = Flamingo_Init 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\Flamingo_Out.ska" descChecksum = Flamingo_Out 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\GazelleUnderflip.ska" descChecksum = GazelleUnderflip 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\Ghettobird2.ska" descChecksum = Ghettobird2 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\GrindOverturn_Init.ska" descChecksum = GrindOverturn_Init 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\GrindOverturn_Range.ska" descChecksum = GrindOverturn_Range 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\HangTenNoseGrind_Init.ska" descChecksum = HangTenNoseGrind_Init 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\HangTenNoseGrind_Out.ska" descChecksum = HangTenNoseGrind_Out 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\HangTenNoseGrind_Range.ska" descChecksum = HangTenNoseGrind_Range 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\HardFlipBackFootFlip.ska" descChecksum = HardFlipBackFootFlip 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\HeelflipFSInvert_Init.ska" descChecksum = HeelflipFSInvert_Init 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\HeelflipFSInvert_Out.ska" descChecksum = HeelflipFSInvert_Out 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\HeelflipFSInvert_Range.ska" descChecksum = HeelflipFSInvert_Range 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\HoHoSadPlant_Idle.ska" descChecksum = HoHoSadPlant_Idle 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\HoHoSadPlant_Init.ska" descChecksum = HoHoSadPlant_Init 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\HoHoSadPlant_Out.ska" descChecksum = HoHoSadPlant_Out 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\HoHoStreetPlant_Idle.ska" descChecksum = HoHoStreetPlant_Idle 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\HoHoStreetPlant_Init.ska" descChecksum = HoHoStreetPlant_Init 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\HoHoStreetPlant_Out.ska" descChecksum = HoHoStreetPlant_Out 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\KickFlipBodyBackFlip.ska" descChecksum = KickFlipBodyBackFlip 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\KickFlipUnderFlip.ska" descChecksum = KickFlipUnderFlip 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\LaserFlip.ska" descChecksum = LaserFlip 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\McTwist.ska" descChecksum = McTwist 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\NoComplyLate360.ska" descChecksum = NoComplyLate360 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\NosegrindPivot_Init.ska" descChecksum = NosegrindPivot_Init 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\NosegrindPivot_Range.ska" descChecksum = NosegrindPivot_Range 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\OneFootOneWheel_Init.ska" descChecksum = OneFootOneWheel_Init 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\OneFootOneWheel_Range.ska" descChecksum = OneFootOneWheel_Range 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\Primo_Init.ska" descChecksum = Primo_Init 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\Primo_Out.ska" descChecksum = Primo_Out 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\Primo_Range.ska" descChecksum = Primo_Range 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\PutDownOneWheel.ska" descChecksum = PutDownOneWheel 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\Russian_Idle.ska" descChecksum = Russian_Idle 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\Russian_OllieOut.ska" descChecksum = Russian_OllieOut 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\Russian_Out.ska" descChecksum = Russian_Out 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\RustySlide_Init.ska" descChecksum = RustySlide_Init 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\RustySlide_Out.ska" descChecksum = RustySlide_Out 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\SackTap_Init.ska" descChecksum = SackTap_Init 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\SackTap_Out.ska" descChecksum = SackTap_Out 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\SackTap_Range.ska" descChecksum = SackTap_Range 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\SambaFlip.ska" descChecksum = SambaFlip 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\SemiFlip.ska" descChecksum = SemiFlip 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\SitDownAir_Idle.ska" descChecksum = SitDownAir_Idle 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\SitDownAir_Init.ska" descChecksum = SitDownAir_Init 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\SmithFS_Init.ska" descChecksum = SmithFS_Init 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\SmithFS_Range.ska" descChecksum = SmithFS_Range 
	ENDIF 
	SetReferenceChecksum 0 
ENDSCRIPT

SCRIPT animload_THPS6_human_unloadable_16 LoadFunction = LoadAnim 
	SetReferenceChecksum THPS6_human 
	IF <LoadFunction> <...> name = "anims\\THPS6_skater_special\\Smith_Init.ska" descChecksum = Smith_Init 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\Smith_Range.ska" descChecksum = Smith_Range 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\Sproing.ska" descChecksum = Sproing 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\Sweet.ska" descChecksum = Sweet 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\TailGrindFingerFlip.ska" descChecksum = TailGrindFingerFlip 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\TailblockSlide_Init.ska" descChecksum = TailblockSlide_Init 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\TailblockSlide_Range.ska" descChecksum = TailblockSlide_Range 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\_2KickMadonnaFlip_Init.ska" descChecksum = _2KickMadonnaFlip_Init 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\_2KickMadonnaFlip_Out.ska" descChecksum = _2KickMadonnaFlip_Out 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\_360VarialMcTwist.ska" descChecksum = _360VarialMcTwist 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\_540Boneless.ska" descChecksum = _540Boneless 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\_540Flip.ska" descChecksum = _540Flip 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\_540TailWhip.ska" descChecksum = _540TailWhip 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\BamBendAir_Idle.ska" descChecksum = BamBendAir_Idle 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\BamBendAir_Init.ska" descChecksum = BamBendAir_Init 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\FiftyFiftySwitcheroo_Idle.ska" descChecksum = FiftyFiftySwitcheroo_Idle 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\FiftyFiftySwitcheroo_Init.ska" descChecksum = FiftyFiftySwitcheroo_Init 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\GrindNBarf_Init.ska" descChecksum = GrindNBarf_Init 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\GrindNBarf_Out.ska" descChecksum = GrindNBarf_Out 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\GrindNBarf_Range.ska" descChecksum = GrindNBarf_Range 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\RodneyGrind_Init.ska" descChecksum = RodneyGrind_Init 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\RodneyGrind_Out.ska" descChecksum = RodneyGrind_Out 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\RodneyGrind_Range.ska" descChecksum = RodneyGrind_Range 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\Shortbus_Idle.ska" descChecksum = Shortbus_Idle 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\Shortbus_Init.ska" descChecksum = Shortbus_Init 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\Shortbus_Out.ska" descChecksum = Shortbus_Out 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\SlamSpinner.ska" descChecksum = SlamSpinner 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\YeahRight_Idle.ska" descChecksum = YeahRight_Idle 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\YeahRight_Init.ska" descChecksum = YeahRight_Init 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\YeahRight_Out.ska" descChecksum = YeahRight_Out 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\_360ShovItNoseGrind_Init.ska" descChecksum = _360ShovItNoseGrind_Init 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\_360ShovItNoseGrind_Out.ska" descChecksum = _360ShovItNoseGrind_Out 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\_360ShovItNoseGrind_Range.ska" descChecksum = _360ShovItNoseGrind_Range 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\BreakIn_Init.ska" descChecksum = BreakIn_Init 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\FSDarkSlide_Init.ska" descChecksum = FSDarkSlide_Init 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\FSDarkSlide_Out.ska" descChecksum = FSDarkSlide_Out 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\FSDarkSlide_Range.ska" descChecksum = FSDarkSlide_Range 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\FSFlipOneFootTailGrab_Idle.ska" descChecksum = FSFlipOneFootTailGrab_Idle 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\FSFlipOneFootTailGrab_Init.ska" descChecksum = FSFlipOneFootTailGrab_Init 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\FSFlipOneFootTailGrab_Out.ska" descChecksum = FSFlipOneFootTailGrab_Out 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\FSNollie360FlipCrook_Init.ska" descChecksum = FSNollie360FlipCrook_Init 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\FSNollie360FlipCrook_Out.ska" descChecksum = FSNollie360FlipCrook_Out 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\FSNollie360FlipCrook_Range.ska" descChecksum = FSNollie360FlipCrook_Range 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\HandStandCasper_Init.ska" descChecksum = HandStandCasper_Init 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\HandStandCasper_Out.ska" descChecksum = HandStandCasper_Out 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\HandStandCasper_Range.ska" descChecksum = HandStandCasper_Range 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\HCNHDF_Init.ska" descChecksum = HCNHDF_Init 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\HCNHDF_Out.ska" descChecksum = HCNHDF_Out 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\HCNHDF_Range.ska" descChecksum = HCNHDF_Range 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\KickFlipSwitchOneFootManual_Init.ska" descChecksum = KickFlipSwitchOneFootManual_Init 
	ENDIF 
	SetReferenceChecksum 0 
ENDSCRIPT

SCRIPT animload_THPS6_human_unloadable_17 LoadFunction = LoadAnim 
	SetReferenceChecksum THPS6_human 
	IF <LoadFunction> <...> name = "anims\\THPS6_skater_special\\KickFlipSwitchOneFootManual_Out.ska" descChecksum = KickFlipSwitchOneFootManual_Out 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\KickFlipSwitchOneFootManual_Range.ska" descChecksum = KickFlipSwitchOneFootManual_Range 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\MixItUp_Idle.ska" descChecksum = MixItUp_Idle 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\MixItUp_Init.ska" descChecksum = MixItUp_Init 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\MixItUp_Out.ska" descChecksum = MixItUp_Out 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\MoonwalkGrind_Idle.ska" descChecksum = MoonwalkGrind_Idle 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\MoonwalkGrind_Init.ska" descChecksum = MoonwalkGrind_Init 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\MoonwalkGrind_Out.ska" descChecksum = MoonwalkGrind_Out 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\OneFootDarkslide_Init.ska" descChecksum = OneFootDarkslide_Init 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\OneFootDarkslide_Out.ska" descChecksum = OneFootDarkslide_Out 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\OneFootDarkslide_Range.ska" descChecksum = OneFootDarkslide_Range 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\PrimoHandStand_Init.ska" descChecksum = PrimoHandStand_Init 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\PrimoHandStand_Out.ska" descChecksum = PrimoHandStand_Out 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\PrimoHandStand_Range.ska" descChecksum = PrimoHandStand_Range 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\RowleyDarkSlideHandStand_Init.ska" descChecksum = RowleyDarkSlideHandStand_Init 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\RowleyDarkSlideHandStand_Out.ska" descChecksum = RowleyDarkSlideHandStand_Out 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\RowleyDarkSlideHandStand_Range.ska" descChecksum = RowleyDarkSlideHandStand_Range 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\Shifty360ShovItBSShifty_Idle.ska" descChecksum = Shifty360ShovItBSShifty_Idle 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\Shifty360ShovItBSShifty_Init.ska" descChecksum = Shifty360ShovItBSShifty_Init 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\Shifty360ShovItBSShifty_Out.ska" descChecksum = Shifty360ShovItBSShifty_Out 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\_540VarielHeelflipLien.ska" descChecksum = _540VarielHeelflipLien 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\The900.ska" descChecksum = The900 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\Indy900.ska" descChecksum = Indy900 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\_1234.ska" descChecksum = _1234 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\Special_Bam_Chainsaw_Init.ska" descChecksum = Special_Bam_Chainsaw_Init 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\Special_Bam_Chainsaw_Idle.ska" descChecksum = Special_Bam_Chainsaw_Idle 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\Special_Bam_Chainsaw_Out.ska" descChecksum = Special_Bam_Chainsaw_Out 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\Special_Bam_Lip_Init.ska" descChecksum = Special_Bam_Lip_Init 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\Special_Bam_Lip_Idle.ska" descChecksum = Special_Bam_Lip_Idle 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\Special_Bam_Lip_Out.ska" descChecksum = Special_Bam_Lip_Out 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\BeaverBlast.ska" descChecksum = BeaverBlast 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\Special_FranklinGrind_Init.ska" descChecksum = Special_FranklinGrind_Init 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\Special_FranklinGrind_Range.ska" descChecksum = Special_FranklinGrind_Range 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\Special_FranklinGrind_Out.ska" descChecksum = Special_FranklinGrind_Out 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\Special_FranklinGrind_Idle.ska" descChecksum = Special_FranklinGrind_Idle 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\Special_Bob_DrksldJapan_Init.ska" descChecksum = Special_Bob_DrksldJapan_Init 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\Special_Bob_DrksldJapan_Idle.ska" descChecksum = Special_Bob_DrksldJapan_Idle 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\Special_Bob_DrksldJapan_Out.ska" descChecksum = Special_Bob_DrksldJapan_Out 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\Special_Bob_RockNRollswitch_Init.ska" descChecksum = Special_Bob_RockNRollswitch_Init 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\Special_Bob_RockNRollswitch_Idle.ska" descChecksum = Special_Bob_RockNRollswitch_Idle 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\Special_Bob_RockNRollswitch_Out.ska" descChecksum = Special_Bob_RockNRollswitch_Out 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\Special_BullF_Sword_Init.ska" descChecksum = Special_BullF_Sword_Init 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\Special_BullF_Sword_Idle.ska" descChecksum = Special_BullF_Sword_Idle 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\Special_BullF_Sword_Out.ska" descChecksum = Special_BullF_Sword_Out 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\Special_Eric_RnngMan_Init.ska" descChecksum = Special_Eric_RnngMan_Init 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\Special_Eric_RnngMan_Idle.ska" descChecksum = Special_Eric_RnngMan_Idle 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\Special_GrafPunk_Init.ska" descChecksum = Special_GrafPunk_Init 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\Special_GrafPunk_Idle.ska" descChecksum = Special_GrafPunk_Idle 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\Special_GrafPunk_Out.ska" descChecksum = Special_GrafPunk_Out 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\Special_Hand_Thebird_Init.ska" descChecksum = Special_Hand_Thebird_Init 
	ENDIF 
	SetReferenceChecksum 0 
ENDSCRIPT

SCRIPT animload_THPS6_human_unloadable_18 LoadFunction = LoadAnim 
	SetReferenceChecksum THPS6_human 
	IF <LoadFunction> <...> name = "anims\\THPS6_skater_special\\Special_Hand_Thebird_Range.ska" descChecksum = Special_Hand_Thebird_Range 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\Special_Hand_Thebird_Out.ska" descChecksum = Special_Hand_Thebird_Out 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\Special_Jesse_HotRod_Init.ska" descChecksum = Special_Jesse_HotRod_Init 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\Special_Jesse_HotRod_Range.ska" descChecksum = Special_Jesse_HotRod_Range 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\Special_Jesse_HotRod_Out.ska" descChecksum = Special_Jesse_HotRod_Out 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\Special_Jester_Juggle_init.ska" descChecksum = Special_Jester_Juggle_init 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\Special_Jester_Juggle_Idle.ska" descChecksum = Special_Jester_Juggle_Idle 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\Special_Jester_Juggle_Out.ska" descChecksum = Special_Jester_Juggle_Out 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\Special_Koston_900.ska" descChecksum = Special_Koston_900 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\Special_Koston_EndlessFlip_Init.ska" descChecksum = Special_Koston_EndlessFlip_Init 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\Special_Koston_EndlessFlip_Idle.ska" descChecksum = Special_Koston_EndlessFlip_Idle 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\Special_Koston_EndlessFlip_Out.ska" descChecksum = Special_Koston_EndlessFlip_Out 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\Special_MikeV_Around_Int.ska" descChecksum = Special_MikeV_Around_Int 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\Special_MikeV_Around_Range.ska" descChecksum = Special_MikeV_Around_Range 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\Special_MikeV_Around_Out.ska" descChecksum = Special_MikeV_Around_Out 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\Special_MikeV_Boomerang.ska" descChecksum = Special_MikeV_Boomerang 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\Special_Muska_Burn_init.ska" descChecksum = Special_Muska_Burn_init 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\Special_Muska_Burn_Range.ska" descChecksum = Special_Muska_Burn_Range 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\Special_Muska_Burn_Out.ska" descChecksum = Special_Muska_Burn_Out 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\Special_Muska_Worm_Init.ska" descChecksum = Special_Muska_Worm_Init 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\Special_Muska_Worm_Idle.ska" descChecksum = Special_Muska_Worm_Idle 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\Special_Muska_Worm_Out.ska" descChecksum = Special_Muska_Worm_Out 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\Special_Natas_spin_init.ska" descChecksum = Special_Natas_spin_init 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\Special_Natas_Spin_Range.ska" descChecksum = Special_Natas_Spin_Range 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\Special_Paulie_ButtMan_Init.ska" descChecksum = Special_Paulie_ButtMan_Init 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\Special_Paulie_ButtMan_Range.ska" descChecksum = Special_Paulie_ButtMan_Range 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\Special_Paulie_ButtMan_Out.ska" descChecksum = Special_Paulie_ButtMan_Out 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\Special_Phil_Hoagie_Init.ska" descChecksum = Special_Phil_Hoagie_Init 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\Special_Phil_Hoagie_Idle.ska" descChecksum = Special_Phil_Hoagie_Idle 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\Special_Phil_Hoagie_Out.ska" descChecksum = Special_Phil_Hoagie_Out 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\Special_Rodney_PrimoSpin_Init.ska" descChecksum = Special_Rodney_PrimoSpin_Init 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\Special_Rodney_PrimoSpin_Idle.ska" descChecksum = Special_Rodney_PrimoSpin_Idle 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\Special_Rodney_PrimoSpin_Out.ska" descChecksum = Special_Rodney_PrimoSpin_Out 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\Special_Rodney_HlfcabUndrFlip.ska" descChecksum = Special_Rodney_HlfcabUndrFlip 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\Special_Sheckler_Primo_Init.ska" descChecksum = Special_Sheckler_Primo_Init 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\Special_Sheckler_Primo_Range.ska" descChecksum = Special_Sheckler_Primo_Range 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\Special_Sheckler_Primo_Out.ska" descChecksum = Special_Sheckler_Primo_Out 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\Special_Sheckler_Grab_Init.ska" descChecksum = Special_Sheckler_Grab_Init 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\Special_Sheckler_Grab_Idle.ska" descChecksum = Special_Sheckler_Grab_Idle 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\Special_Sheckler_Grab_Out.ska" descChecksum = Special_Sheckler_Grab_Out 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\Special_Shrek_WaxSlide_Init.ska" descChecksum = Special_Shrek_WaxSlide_Init 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\Special_Shrek_WaxSlide_Range.ska" descChecksum = Special_Shrek_WaxSlide_Range 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\Special_Shrek_WaxSlide_Out.ska" descChecksum = Special_Shrek_WaxSlide_Out 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\Special_Shrek_BoardSnap.ska" descChecksum = Special_Shrek_BoardSnap 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\Shrek_BurpTag.ska" descChecksum = Shrek_BurpTag 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\Shrek_BurpHangingTag.ska" descChecksum = Shrek_BurpHangingTag 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\Special_Shrimp_Rotisserie.ska" descChecksum = Special_Shrimp_Rotisserie 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\Special_Soldier_Solute.ska" descChecksum = Special_Soldier_Solute 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\Special_Soldier_AmerHero2_init.ska" descChecksum = Special_Soldier_AmerHero2_init 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\Special_Soldier_AmerHero2_Idle.ska" descChecksum = Special_Soldier_AmerHero2_Idle 
	ENDIF 
	SetReferenceChecksum 0 
ENDSCRIPT

SCRIPT animload_THPS6_human_unloadable_19 LoadFunction = LoadAnim 
	SetReferenceChecksum THPS6_human 
	IF <LoadFunction> <...> name = "anims\\THPS6_skater_special\\Special_Soldier_AmerHero2_Out.ska" descChecksum = Special_Soldier_AmerHero2_Out 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\Special_SteveO_BiteBoard.ska" descChecksum = Special_SteveO_BiteBoard 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\Special_Tony_Surfer_init.ska" descChecksum = Special_Tony_Surfer_init 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\Special_Tony_Surfer_Idle.ska" descChecksum = Special_Tony_Surfer_Idle 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\Special_Tony_Windmill_Init.ska" descChecksum = Special_Tony_Windmill_Init 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\Special_Tony_Windmill_Idle.ska" descChecksum = Special_Tony_Windmill_Idle 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\Special_Tony_Windmill_Out.ska" descChecksum = Special_Tony_Windmill_Out 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\Special_Weeman_KickHead.ska" descChecksum = Special_Weeman_KickHead 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\Wallplant_Sticker.ska" descChecksum = Wallplant_Sticker 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\Standing_Tag2.ska" descChecksum = Standing_Tag2 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\Hanging_Tag.ska" descChecksum = Hanging_Tag 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\VertPlant.ska" descChecksum = VertPlant 
		<LoadFunction> <...> name = "anims\\THPS6_Bail_GetUp\\GetUp_HK_Ft_T.ska" descChecksum = GetUp_HK_Ft_T 
		<LoadFunction> <...> name = "anims\\THPS6_Skater_Basics\\Standing_Throw.ska" descChecksum = Standing_Throw 
		<LoadFunction> <...> name = "anims\\THPS6_Skater_Basics\\Throw_Sidearm_Partial.ska" descChecksum = Throw_Sidearm_Partial 
		<LoadFunction> <...> name = "anims\\THPS6_Skater_Basics\\Walking_Throw_Partial.ska" descChecksum = Walking_Throw_Partial 
		<LoadFunction> <...> name = "anims\\thps6_skater_OnFoot\\Jump_DoubleJump.ska" descChecksum = Jump_DoubleJump 
		<LoadFunction> <...> name = "anims\\thps6_skater_OnFoot\\AirIdleToJumpAir.ska" descChecksum = AirIdleToJumpAir 
		<LoadFunction> <...> name = "anims\\thps6_skater_OnFoot\\FastRun.ska" descChecksum = FastRun 
		<LoadFunction> <...> name = "anims\\thps6_skater_OnFoot\\HangIdle.ska" descChecksum = HangIdle 
		<LoadFunction> <...> name = "anims\\thps6_skater_OnFoot\\HangIdleToDrop.ska" descChecksum = HangIdleToDrop 
		<LoadFunction> <...> name = "anims\\thps6_skater_OnFoot\\HangLeft.ska" descChecksum = HangLeft 
		<LoadFunction> <...> name = "anims\\thps6_skater_OnFoot\\HangOntoTheTop.ska" descChecksum = HangOntoTheTop 
		<LoadFunction> <...> name = "anims\\thps6_skater_OnFoot\\HangRight.ska" descChecksum = HangRight 
		<LoadFunction> <...> name = "anims\\thps6_skater_OnFoot\\JumpAir.ska" descChecksum = JumpAir 
		<LoadFunction> <...> name = "anims\\thps6_skater_OnFoot\\JumpAirTo5050.ska" descChecksum = JumpAirTo5050 
		<LoadFunction> <...> name = "anims\\thps6_skater_OnFoot\\JumpAirToAirIdle.ska" descChecksum = JumpAirToAirIdle 
		<LoadFunction> <...> name = "anims\\thps6_skater_OnFoot\\JumpAirToManual.ska" descChecksum = JumpAirToManual 
		<LoadFunction> <...> name = "anims\\thps6_skater_OnFoot\\JumpLandToRun.ska" descChecksum = JumpLandToRun 
		<LoadFunction> <...> name = "anims\\thps6_skater_OnFoot\\JumpLandToStand.ska" descChecksum = JumpLandToStand 
		<LoadFunction> <...> name = "anims\\thps6_skater_OnFoot\\LadderClimb.ska" descChecksum = LadderClimb 
		<LoadFunction> <...> name = "anims\\thps6_skater_OnFoot\\LadderClimbFromStandIdle.ska" descChecksum = LadderClimbFromStandIdle 
		<LoadFunction> <...> name = "anims\\thps6_skater_OnFoot\\LadderOntoTheTop.ska" descChecksum = LadderOntoTheTop 
		<LoadFunction> <...> name = "anims\\thps6_skater_OnFoot\\RunToJump.ska" descChecksum = RunToJump 
		<LoadFunction> <...> name = "anims\\thps6_skater_OnFoot\\StandToHang.ska" descChecksum = StandToHang 
		<LoadFunction> <...> name = "anims\\thps6_skater_OnFoot\\StandToJump.ska" descChecksum = StandToJump 
		<LoadFunction> <...> name = "anims\\thps6_skater_OnFoot\\WRun.ska" descChecksum = WRun 
		<LoadFunction> <...> name = "anims\\thps6_skater_OnFoot\\WRunToSkate.ska" descChecksum = WRunToSkate 
		<LoadFunction> <...> name = "anims\\thps6_skater_OnFoot\\WSkateToRun.ska" descChecksum = WSkateToRun 
		<LoadFunction> <...> name = "anims\\thps6_skater_OnFoot\\WStand.ska" descChecksum = WStand 
		<LoadFunction> <...> name = "anims\\thps6_skater_OnFoot\\WStandToRun.ska" descChecksum = WStandToRun 
		<LoadFunction> <...> name = "anims\\thps6_skater_OnFoot\\WStandToWalk.ska" descChecksum = WStandToWalk 
		<LoadFunction> <...> name = "anims\\thps6_skater_OnFoot\\WWalk.ska" descChecksum = WWalk 
		<LoadFunction> <...> name = "anims\\thps6_skater_OnFoot\\WWalkToStand.ska" descChecksum = WWalkToStand 
		<LoadFunction> <...> name = "anims\\thps6_skater_OnFoot\\WalkFast.ska" descChecksum = WalkFast 
		<LoadFunction> <...> name = "anims\\thps6_skater_OnFoot\\WalkSlow.ska" descChecksum = WalkSlow 
		<LoadFunction> <...> name = "anims\\thps6_skater_OnFoot\\_180RunSkid.ska" descChecksum = _180RunSkid 
		<LoadFunction> <...> name = "anims\\thps6_skater_OnFoot\\SkateToStand.ska" descChecksum = SkateToStand 
		<LoadFunction> <...> name = "anims\\thps6_skater_OnFoot\\SkateToWalk.ska" descChecksum = SkateToWalk 
		<LoadFunction> <...> name = "anims\\thps6_skater_OnFoot\\BrakeToStand.ska" descChecksum = BrakeToStand 
	ENDIF 
	SetReferenceChecksum 0 
ENDSCRIPT

SCRIPT animload_THPS6_human_unloadable_20 LoadFunction = LoadAnim 
	SetReferenceChecksum THPS6_human 
	IF <LoadFunction> <...> name = "anims\\thps6_skater_OnFoot\\SlowSkateToStand.ska" descChecksum = SlowSkateToStand 
		<LoadFunction> <...> name = "anims\\thps6_skater_OnFoot\\JumpToSwingHang.ska" descChecksum = JumpToSwingHang 
		<LoadFunction> <...> name = "anims\\thps6_skater_OnFoot\\JumpToWallHang.ska" descChecksum = JumpToWallHang 
		<LoadFunction> <...> name = "anims\\thps6_skater_OnFoot\\LadderFastClimb.ska" descChecksum = LadderFastClimb 
		<LoadFunction> <...> name = "anims\\thps6_skater_OnFoot\\JumpAirToNoseManual.ska" descChecksum = JumpAirToNoseManual 
		<LoadFunction> <...> name = "anims\\thps6_skater_OnFoot\\JumpLandToWalk.ska" descChecksum = JumpLandToWalk 
		<LoadFunction> <...> name = "anims\\thps6_skater_OnFoot\\SkateToSkid.ska" descChecksum = SkateToSkid 
	ENDIF 
	SetReferenceChecksum 0 
ENDSCRIPT

SCRIPT animload_THPS6_human_net LoadFunction = LoadAnim 
	animload_THPS6_human_net_0 <...> 
	animload_THPS6_human_net_1 <...> 
	animload_THPS6_human_net_2 <...> 
	animload_THPS6_human_net_3 <...> 
	animload_THPS6_human_net_4 <...> 
	animload_THPS6_human_net_5 <...> 
	animload_THPS6_human_net_6 <...> 
	animload_THPS6_human_net_7 <...> 
	animload_THPS6_human_net_8 <...> 
	animload_THPS6_human_net_9 <...> 
	animload_THPS6_human_net_10 <...> 
	animload_THPS6_human_net_11 <...> 
	animload_THPS6_human_net_12 <...> 
	animload_THPS6_human_net_13 <...> 
	animload_THPS6_human_net_14 <...> 
	animload_THPS6_human_net_15 <...> 
	animload_THPS6_human_net_16 <...> 
	animload_THPS6_human_net_17 <...> 
	animload_THPS6_human_net_18 <...> 
ENDSCRIPT

SCRIPT animload_THPS6_human_net_0 LoadFunction = LoadAnim 
	SetReferenceChecksum THPS6_human 
	IF <LoadFunction> <...> name = "anims\\Ped_M_Idles\\Ped_M_Idle1.ska" descChecksum = Ped_M_Idle1 
		<LoadFunction> <...> name = "anims\\THPS6_skater_bails\\RunOutQuick.ska" descChecksum = RunOutQuick 
		<LoadFunction> <...> name = "anims\\THPS6_skater_bails\\Bail_Falling_BCK.ska" descChecksum = Bail_Falling_BCK 
		<LoadFunction> <...> name = "anims\\THPS6_skater_bails\\Bail_Falling_FWD.ska" descChecksum = Bail_Falling_FWD 
		<LoadFunction> <...> name = "anims\\THPS6_skater_bails\\Bail_Falling_Hit_Hard_BCK.ska" descChecksum = Bail_Falling_Hit_Hard_BCK 
		<LoadFunction> <...> name = "anims\\THPS6_skater_bails\\Bail_Falling_Hit_Hard_FWD.ska" descChecksum = Bail_Falling_Hit_Hard_FWD 
		<LoadFunction> <...> name = "anims\\THPS6_skater_bails\\Bail_Falling_Hit_Med_BCK.ska" descChecksum = Bail_Falling_Hit_Med_BCK 
		<LoadFunction> <...> name = "anims\\THPS6_skater_bails\\Bail_Falling_Hit_Med_FWD.ska" descChecksum = Bail_Falling_Hit_Med_FWD 
		<LoadFunction> <...> name = "anims\\THPS6_skater_bails\\Bail_Falling_Idle_BCK.ska" descChecksum = Bail_Falling_Idle_BCK 
		<LoadFunction> <...> name = "anims\\THPS6_skater_bails\\Bail_Falling_Idle_FWD.ska" descChecksum = Bail_Falling_Idle_FWD 
		<LoadFunction> <...> name = "anims\\THPS6_skater_bails\\Bail_Falling_Idle_RT.ska" descChecksum = Bail_Falling_Idle_RT 
		<LoadFunction> <...> name = "anims\\THPS6_skater_bails\\Bail_Falling_RT.ska" descChecksum = Bail_Falling_RT 
		<LoadFunction> <...> name = "anims\\THPS6_skater_bails\\Bail_Falling_Slide_HitH_LTb.ska" descChecksum = Bail_Falling_Slide_HitH_LTb 
		<LoadFunction> <...> name = "anims\\THPS6_skater_bails\\Bail_Falling_Slide_HitH_LTf.ska" descChecksum = Bail_Falling_Slide_HitH_LTf 
		<LoadFunction> <...> name = "anims\\THPS6_skater_bails\\Bail_Falling_Slide_HitH_RTb.ska" descChecksum = Bail_Falling_Slide_HitH_RTb 
		<LoadFunction> <...> name = "anims\\THPS6_skater_bails\\Bail_Falling_Slide_HitH_RTf.ska" descChecksum = Bail_Falling_Slide_HitH_RTf 
		<LoadFunction> <...> name = "anims\\THPS6_skater_bails\\Bail_Falling_Slide_HitM_LTb.ska" descChecksum = Bail_Falling_Slide_HitM_LTb 
		<LoadFunction> <...> name = "anims\\THPS6_skater_bails\\Bail_Falling_Slide_HitM_LTf.ska" descChecksum = Bail_Falling_Slide_HitM_LTf 
		<LoadFunction> <...> name = "anims\\THPS6_skater_bails\\Bail_Falling_Slide_HitM_RTb.ska" descChecksum = Bail_Falling_Slide_HitM_RTb 
		<LoadFunction> <...> name = "anims\\THPS6_skater_bails\\Bail_Falling_Slide_HitM_RTf.ska" descChecksum = Bail_Falling_Slide_HitM_RTf 
		<LoadFunction> <...> name = "anims\\THPS6_skater_bails\\Bail_Falling_Slide_Idle_LTb.ska" descChecksum = Bail_Falling_Slide_Idle_LTb 
		<LoadFunction> <...> name = "anims\\THPS6_skater_bails\\Bail_Falling_Slide_Idle_LTf.ska" descChecksum = Bail_Falling_Slide_Idle_LTf 
		<LoadFunction> <...> name = "anims\\THPS6_skater_bails\\Bail_Falling_Slide_Idle_RTb.ska" descChecksum = Bail_Falling_Slide_Idle_RTb 
		<LoadFunction> <...> name = "anims\\THPS6_skater_bails\\Bail_Falling_Slide_Idle_RTf.ska" descChecksum = Bail_Falling_Slide_Idle_RTf 
		<LoadFunction> <...> name = "anims\\THPS6_skater_bails\\Bail_Falling_Slide_LTb.ska" descChecksum = Bail_Falling_Slide_LTb 
		<LoadFunction> <...> name = "anims\\THPS6_skater_bails\\Bail_Falling_Slide_LTf.ska" descChecksum = Bail_Falling_Slide_LTf 
		<LoadFunction> <...> name = "anims\\THPS6_skater_bails\\Bail_Falling_Slide_RTb.ska" descChecksum = Bail_Falling_Slide_RTb 
		<LoadFunction> <...> name = "anims\\THPS6_skater_bails\\Bail_Falling_Slide_RTf.ska" descChecksum = Bail_Falling_Slide_RTf 
		<LoadFunction> <...> name = "anims\\THPS6_skater_bails\\Bail_Falling_Slide_BCK.ska" descChecksum = Bail_Falling_Slide_BCK 
		<LoadFunction> <...> name = "anims\\THPS6_skater_bails\\Bail_Falling_Slide_Idle_BCK.ska" descChecksum = Bail_Falling_Slide_Idle_BCK 
		<LoadFunction> <...> name = "anims\\THPS6_skater_bails\\Bail_Falling_Slide_HitM_BCK.ska" descChecksum = Bail_Falling_Slide_HitM_BCK 
		<LoadFunction> <...> name = "anims\\THPS6_skater_bails\\Bail_Falling_Slide_HitH_BCK.ska" descChecksum = Bail_Falling_Slide_HitH_BCK 
		<LoadFunction> <...> name = "anims\\THPS6_skater_bails\\Bail_Falling_LT.ska" descChecksum = Bail_Falling_LT 
		<LoadFunction> <...> name = "anims\\THPS6_skater_bails\\Bail_Falling_Idle_LT.ska" descChecksum = Bail_Falling_Idle_LT 
		<LoadFunction> <...> name = "anims\\THPS6_skater_bails\\Bail_Falling_Hit_Hard.ska" descChecksum = Bail_Falling_Hit_Hard 
		<LoadFunction> <...> name = "anims\\THPS6_skater_bails\\Bail_Falling_Hit_Med.ska" descChecksum = Bail_Falling_Hit_Med 
		<LoadFunction> <...> name = "anims\\THPS6_Bail_GetUp\\GetUp_HK_Ft.ska" descChecksum = GetUp_HK_Ft 
		<LoadFunction> <...> name = "anims\\THPS6_Bail_GetUp\\GetUp_S_BoardCatch1.ska" descChecksum = GetUp_S_BoardCatch1 
		<LoadFunction> <...> name = "anims\\THPS6_Bail_GetUp\\GetUp_S_RunJump.ska" descChecksum = GetUp_S_RunJump 
		<LoadFunction> <...> name = "anims\\THPS6_Bail_GetUp\\GetUp_S_BoardFlip1.ska" descChecksum = GetUp_S_BoardFlip1 
		<LoadFunction> <...> name = "anims\\THPS6_Bail_GetUp\\GetUp_HK_Ft_Q.ska" descChecksum = GetUp_HK_Ft_Q 
		<LoadFunction> <...> name = "anims\\THPS6_Bail_GetUp\\GetUp_Sit_Ft.ska" descChecksum = GetUp_Sit_Ft 
		<LoadFunction> <...> name = "anims\\THPS6_Bail_GetUp\\GetUp_Sit_Ft_T.ska" descChecksum = GetUp_Sit_Ft_T 
		<LoadFunction> <...> name = "anims\\THPS6_Bail_GetUp\\GetUp_Sit_Ft_Q.ska" descChecksum = GetUp_Sit_Ft_Q 
		<LoadFunction> <...> name = "anims\\THPS6_Bail_GetUp\\GetUp_HK_Lt.ska" descChecksum = GetUp_HK_Lt 
		<LoadFunction> <...> name = "anims\\THPS6_Bail_GetUp\\GetUp_HK_Lt_T.ska" descChecksum = GetUp_HK_Lt_T 
		<LoadFunction> <...> name = "anims\\THPS6_Bail_GetUp\\GetUp_HK_Lt_Q.ska" descChecksum = GetUp_HK_Lt_Q 
		<LoadFunction> <...> name = "anims\\THPS6_Bail_GetUp\\GetUp_HK_Bk.ska" descChecksum = GetUp_HK_Bk 
		<LoadFunction> <...> name = "anims\\THPS6_Bail_GetUp\\GetUp_HK_Bk_T.ska" descChecksum = GetUp_HK_Bk_T 
		<LoadFunction> <...> name = "anims\\THPS6_Bail_GetUp\\GetUp_HK_Bk_Q.ska" descChecksum = GetUp_HK_Bk_Q 
	ENDIF 
	SetReferenceChecksum 0 
ENDSCRIPT

SCRIPT animload_THPS6_human_net_1 LoadFunction = LoadAnim 
	SetReferenceChecksum THPS6_human 
	IF <LoadFunction> <...> name = "anims\\THPS6_Bail_GetUp\\GetUp_HK_Rt_T.ska" descChecksum = GetUp_HK_Rt_T 
		<LoadFunction> <...> name = "anims\\THPS6_Bail_GetUp\\GetUp_HK_Rt_Q.ska" descChecksum = GetUp_HK_Rt_Q 
		<LoadFunction> <...> name = "anims\\THPS6_Bail_GetUp\\GetUp_HK_Rt.ska" descChecksum = GetUp_HK_Rt 
		<LoadFunction> <...> name = "anims\\THPS6_Bail_GetUp\\GetUp_S_Turn180.ska" descChecksum = GetUp_S_Turn180 
		<LoadFunction> <...> name = "anims\\THPS6_Bail_GetUp\\GetUp_S_NoPushOff.ska" descChecksum = GetUp_S_NoPushOff 
		<LoadFunction> <...> name = "anims\\THPS6_skater_bails\\Bail_Manual_BK.ska" descChecksum = Bail_Manual_BK 
		<LoadFunction> <...> name = "anims\\THPS6_skater_bails\\Bail_Manual_BK_fast.ska" descChecksum = Bail_Manual_BK_fast 
		<LoadFunction> <...> name = "anims\\THPS6_skater_bails\\Bail_Manual_FT.ska" descChecksum = Bail_Manual_FT 
		<LoadFunction> <...> name = "anims\\THPS6_skater_bails\\Bail_Manual_FT_fast.ska" descChecksum = Bail_Manual_FT_fast 
		<LoadFunction> <...> name = "anims\\THPS6_skater_bails\\Nutsac.ska" descChecksum = Nutsac 
		<LoadFunction> <...> name = "anims\\THPS6_skater_bails\\Bail_Nutter_FWD.ska" descChecksum = Bail_Nutter_FWD 
		<LoadFunction> <...> name = "anims\\THPS6_skater_bails\\Bail_Nutter_BCK.ska" descChecksum = Bail_Nutter_BCK 
		<LoadFunction> <...> name = "anims\\THPS6_skater_bails\\Bail_Pitch_Nose.ska" descChecksum = Bail_Pitch_Nose 
		<LoadFunction> <...> name = "anims\\THPS6_skater_bails\\Bail_Pitch_Back.ska" descChecksum = Bail_Pitch_Back 
		<LoadFunction> <...> name = "anims\\THPS6_skater_bails\\Bail_Pitch_Face.ska" descChecksum = Bail_Pitch_Face 
		<LoadFunction> <...> name = "anims\\THPS6_skater_bails\\Bail_Pitch_Tail.ska" descChecksum = Bail_Pitch_Tail 
		<LoadFunction> <...> name = "anims\\THPS6_skater_bails\\Bail_Ramp_Lt.ska" descChecksum = Bail_Ramp_Lt 
		<LoadFunction> <...> name = "anims\\THPS6_skater_bails\\Bail_Ramp_Rt.ska" descChecksum = Bail_Ramp_Rt 
		<LoadFunction> <...> name = "anims\\THPS6_skater_bails\\Bail_Ramp_Bk_Hd.ska" descChecksum = Bail_Ramp_Bk_Hd 
		<LoadFunction> <...> name = "anims\\THPS6_skater_bails\\Bail_Ramp_Rt_Med.ska" descChecksum = Bail_Ramp_Rt_Med 
		<LoadFunction> <...> name = "anims\\THPS6_skater_bails\\Bail_Ramp_Lt_Med.ska" descChecksum = Bail_Ramp_Lt_Med 
		<LoadFunction> <...> name = "anims\\THPS6_skater_bails\\Bail_Ramp_Bk.ska" descChecksum = Bail_Ramp_Bk 
		<LoadFunction> <...> name = "anims\\THPS6_skater_bails\\Bail_Ramp_Ft_Hd.ska" descChecksum = Bail_Ramp_Ft_Hd 
		<LoadFunction> <...> name = "anims\\THPS6_skater_bails\\Bail_Ramp_Ft_Med.ska" descChecksum = Bail_Ramp_Ft_Med 
		<LoadFunction> <...> name = "anims\\THPS6_skater_bails\\Bail_Ramp_Ft.ska" descChecksum = Bail_Ramp_Ft 
		<LoadFunction> <...> name = "anims\\THPS6_Skater_bails\\Bail_Ramp_Lt_Hd.ska" descChecksum = Bail_Ramp_Lt_Hd 
		<LoadFunction> <...> name = "anims\\THPS6_skater_bails\\Bail_Ramp_Rt_Hd.ska" descChecksum = Bail_Ramp_Rt_Hd 
		<LoadFunction> <...> name = "anims\\THPS6_skater_bails\\Bail_RunOut_Old.ska" descChecksum = Bail_RunOut_Old 
		<LoadFunction> <...> name = "anims\\THPS6_skater_bails\\Bail_RunOut_New_A.ska" descChecksum = Bail_RunOut_New_A 
		<LoadFunction> <...> name = "anims\\THPS6_skater_bails\\RunOut_Drop_Idle.ska" descChecksum = RunOut_Drop_Idle 
		<LoadFunction> <...> name = "anims\\THPS6_skater_bails\\RunOut_Drop_Land_Med.ska" descChecksum = RunOut_Drop_Land_Med 
		<LoadFunction> <...> name = "anims\\THPS6_skater_bails\\Bail_Spin_CCW_Hard.ska" descChecksum = Bail_Spin_CCW_Hard 
		<LoadFunction> <...> name = "anims\\THPS6_skater_bails\\Bail_Spin_CW_Hard.ska" descChecksum = Bail_Spin_CW_Hard 
		<LoadFunction> <...> name = "anims\\THPS6_skater_bails\\Bail_Spin_CCW_Hard_B.ska" descChecksum = Bail_Spin_CCW_Hard_B 
		<LoadFunction> <...> name = "anims\\THPS6_skater_bails\\Bail_Spin_CCW_Hard_C.ska" descChecksum = Bail_Spin_CCW_Hard_C 
		<LoadFunction> <...> name = "anims\\THPS6_skater_bails\\Bail_Spin_CW_Hard_B.ska" descChecksum = Bail_Spin_CW_Hard_B 
		<LoadFunction> <...> name = "anims\\THPS6_skater_bails\\Bail_Spin_CW_Hard_A.ska" descChecksum = Bail_Spin_CW_Hard_A 
		<LoadFunction> <...> name = "anims\\THPS6_skater_bails\\Bail_Spin_FWD_Regular.ska" descChecksum = Bail_Spin_FWD_Regular 
		<LoadFunction> <...> name = "anims\\THPS6_skater_bails\\Bail_Spin_FWD_Hard.ska" descChecksum = Bail_Spin_FWD_Hard 
		<LoadFunction> <...> name = "anims\\THPS6_skater_bails\\Bail_Spin_FWD_Fast.ska" descChecksum = Bail_Spin_FWD_Fast 
		<LoadFunction> <...> name = "anims\\THPS6_skater_bails\\Bail_Spin_BCK_Regular.ska" descChecksum = Bail_Spin_BCK_Regular 
		<LoadFunction> <...> name = "anims\\THPS6_skater_bails\\Bail_Spin_BCK_Fast.ska" descChecksum = Bail_Spin_BCK_Fast 
		<LoadFunction> <...> name = "anims\\THPS6_skater_bails\\Bail_Spin_BCK_Hard.ska" descChecksum = Bail_Spin_BCK_Hard 
		<LoadFunction> <...> name = "anims\\THPS6_skater_tantrums\\Tantrum_DiscusStart.ska" descChecksum = Tantrum_DiscusStart 
		<LoadFunction> <...> name = "anims\\THPS6_skater_tantrums\\Tantrum_DiscusFinish.ska" descChecksum = Tantrum_DiscusFinish 
		<LoadFunction> <...> name = "anims\\THPS6_skater_tantrums\\Tantrum_KickBoard.ska" descChecksum = Tantrum_KickBoard 
		<LoadFunction> <...> name = "anims\\THPS6_skater_tantrums\\Tantrum_HeadButt.ska" descChecksum = Tantrum_HeadButt 
		<LoadFunction> <...> name = "anims\\THPS6_skater_tantrums\\Tantrum_SlingShot.ska" descChecksum = Tantrum_SlingShot 
		<LoadFunction> <...> name = "anims\\THPS6_skater_tantrums\\Tantrum_PileDriver.ska" descChecksum = Tantrum_PileDriver 
		<LoadFunction> <...> name = "anims\\THPS6_skater_tantrums\\Tantrum_BoardFocus.ska" descChecksum = Tantrum_BoardFocus 
	ENDIF 
	SetReferenceChecksum 0 
ENDSCRIPT

SCRIPT animload_THPS6_human_net_2 LoadFunction = LoadAnim 
	SetReferenceChecksum THPS6_human 
	IF <LoadFunction> <...> name = "anims\\thps6_skater_OnFoot\\WalkingBail.ska" descChecksum = WalkingBail 
		<LoadFunction> <...> name = "anims\\thps6_skater_OnFoot\\WalkingBailGetUp.ska" descChecksum = WalkingBailGetUp 
		<LoadFunction> <...> name = "anims\\THPS6_Skater_Bails\\Bail_Wall_FWD_Regular.ska" descChecksum = Bail_Wall_FWD_Regular 
		<LoadFunction> <...> name = "anims\\THPS6_Skater_Bails\\Bail_Wall_FWD_Low.ska" descChecksum = Bail_Wall_FWD_Low 
		<LoadFunction> <...> name = "anims\\THPS6_Skater_Bails\\Bail_Wall_BCK_Regular.ska" descChecksum = Bail_Wall_BCK_Regular 
		<LoadFunction> <...> name = "anims\\THPS6_Skater_Bails\\Bail_Wall_BCK_Low.ska" descChecksum = Bail_Wall_BCK_Low 
		<LoadFunction> <...> name = "anims\\THPS6_Skater_Bails\\Bail_Wall_LT_Low.ska" descChecksum = Bail_Wall_LT_Low 
		<LoadFunction> <...> name = "anims\\THPS6_Skater_Bails\\Bail_Wall_RT_Low.ska" descChecksum = Bail_Wall_RT_Low 
		<LoadFunction> <...> name = "anims\\THPS6_skater_misc\\GrabBar_accel_Fwd.ska" descChecksum = GrabBar_accel_Fwd 
		<LoadFunction> <...> name = "anims\\THPS6_skater_misc\\GrabBar_idle_Fwd.ska" descChecksum = GrabBar_idle_Fwd 
		<LoadFunction> <...> name = "anims\\THPS6_skater_misc\\GrabBar_Release_Fwd.ska" descChecksum = GrabBar_Release_Fwd 
		<LoadFunction> <...> name = "anims\\THPS6_skater_misc\\GrabBar_accel_Up.ska" descChecksum = GrabBar_accel_Up 
		<LoadFunction> <...> name = "anims\\THPS6_skater_misc\\GrabBar_Idle_up.ska" descChecksum = GrabBar_Idle_up 
		<LoadFunction> <...> name = "anims\\THPS6_skater_misc\\GrabBar_Release_Up.ska" descChecksum = GrabBar_Release_Up 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\AirIdle.ska" descChecksum = AirIdle 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\AirTurnLeft.ska" descChecksum = AirTurnLeft 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\AirTurnRight.ska" descChecksum = AirTurnRight 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\Beanplant.ska" descChecksum = Beanplant 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\Boneless.ska" descChecksum = Boneless 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\Brake.ska" descChecksum = Brake 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\BrakeDefeat.ska" descChecksum = BrakeDefeat 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\BrakeIdle.ska" descChecksum = BrakeIdle 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\BSPowerslide.ska" descChecksum = BSPowerslide 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\CessSlide180_BS.ska" descChecksum = CessSlide180_BS 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\CessSlide180_FS.ska" descChecksum = CessSlide180_FS 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\CessSlide180_FS2.ska" descChecksum = CessSlide180_FS2 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\Cheer1.ska" descChecksum = Cheer1 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\Cheer2.ska" descChecksum = Cheer2 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\Crouch.ska" descChecksum = Crouch 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\Crouch2InAir.ska" descChecksum = Crouch2InAir 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\CrouchBumpDown.ska" descChecksum = CrouchBumpDown 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\CrouchBumpUp.ska" descChecksum = CrouchBumpUp 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\CrouchCessSlide180_BS.ska" descChecksum = CrouchCessSlide180_BS 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\CrouchCessSlide180_FS.ska" descChecksum = CrouchCessSlide180_FS 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\CrouchedLand.ska" descChecksum = CrouchedLand 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\CrouchIdle.ska" descChecksum = CrouchIdle 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\CrouchIdle2.ska" descChecksum = CrouchIdle2 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\CrouchIdle4.ska" descChecksum = CrouchIdle4 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\CrouchIdleAdjustFeet.ska" descChecksum = CrouchIdleAdjustFeet 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\CrouchIdleFromIdle.ska" descChecksum = CrouchIdleFromIdle 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\CrouchIdleToIdle.ska" descChecksum = CrouchIdleToIdle 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\CrouchLookDown.ska" descChecksum = CrouchLookDown 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\CrouchLookLeft.ska" descChecksum = CrouchLookLeft 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\CrouchLookRight.ska" descChecksum = CrouchLookRight 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\CrouchPush1.ska" descChecksum = CrouchPush1 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\CrouchShiftFoot.ska" descChecksum = CrouchShiftFoot 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\CrouchToNollie.ska" descChecksum = CrouchToNollie 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\CrouchTurnLeft.ska" descChecksum = CrouchTurnLeft 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\CrouchTurnLeft2.ska" descChecksum = CrouchTurnLeft2 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\CrouchTurnLeftIdle.ska" descChecksum = CrouchTurnLeftIdle 
	ENDIF 
	SetReferenceChecksum 0 
ENDSCRIPT

SCRIPT animload_THPS6_human_net_3 LoadFunction = LoadAnim 
	SetReferenceChecksum THPS6_human 
	IF <LoadFunction> <...> name = "anims\\THPS6_skater_basics\\CrouchTurnLeftIdle2.ska" descChecksum = CrouchTurnLeftIdle2 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\CrouchTurnRight.ska" descChecksum = CrouchTurnRight 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\CrouchTurnRight2.ska" descChecksum = CrouchTurnRight2 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\CrouchTurnRightIdle.ska" descChecksum = CrouchTurnRightIdle 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\CrouchTurnRightIdle2.ska" descChecksum = CrouchTurnRightIdle2 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\DropIn.ska" descChecksum = DropIn 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\Fastplant.ska" descChecksum = Fastplant 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\FlailLeft.ska" descChecksum = FlailLeft 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\FlailLeft2.ska" descChecksum = FlailLeft2 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\FlailLeftCrouched2.ska" descChecksum = FlailLeftCrouched2 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\FlailLeftCrouched3.ska" descChecksum = FlailLeftCrouched3 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\FlailLeftCrouched_Small.ska" descChecksum = FlailLeftCrouched_Small 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\FlailRight.ska" descChecksum = FlailRight 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\FlailRight2.ska" descChecksum = FlailRight2 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\FlailRightCrouched2.ska" descChecksum = FlailRightCrouched2 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\FlailRightCrouched3.ska" descChecksum = FlailRightCrouched3 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\FlailRightCrouched_Small.ska" descChecksum = FlailRightCrouched_Small 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\FSPowerslide.ska" descChecksum = FSPowerslide 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\Idle.ska" descChecksum = idle 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\Idle2InAir.ska" descChecksum = Idle2InAir 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\Land.ska" descChecksum = Land 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\Land2.ska" descChecksum = Land2 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\Land3.ska" descChecksum = Land3 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\Manual.ska" descChecksum = Manual 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\Manual_Range.ska" descChecksum = Manual_Range 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\Manual_Range2.ska" descChecksum = Manual_Range2 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\Manual_Range3.ska" descChecksum = Manual_Range3 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\ManualFromAir.ska" descChecksum = ManualFromAir 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\MongoBrakeIdle.ska" descChecksum = MongoBrakeIdle 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\MongoPush.ska" descChecksum = MongoPush 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\MongoPushCycle.ska" descChecksum = MongoPushCycle 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\MullenStart.ska" descChecksum = MullenStart 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\NewBrake.ska" descChecksum = NewBrake 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\NewBrake_Mongo.ska" descChecksum = NewBrake_Mongo 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\NewBrakeIdle.ska" descChecksum = NewBrakeIdle 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\NewBrakeIdle2.ska" descChecksum = NewBrakeIdle2 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\NewBrakeIdle3.ska" descChecksum = NewBrakeIdle3 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\NewBrakeIdle4.ska" descChecksum = NewBrakeIdle4 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\NewBrakeIdle6.ska" descChecksum = NewBrakeIdle6 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\NewBrakeIdle7.ska" descChecksum = NewBrakeIdle7 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\NewBrakeIdle8.ska" descChecksum = NewBrakeIdle8 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\NewBrakeIdleToIdle.ska" descChecksum = NewBrakeIdleToIdle 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\NewBrakeTurnLeft.ska" descChecksum = NewBrakeTurnLeft 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\NewBrakeTurnRight.ska" descChecksum = NewBrakeTurnRight 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\NoComply.ska" descChecksum = NoComply 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\Nollie.ska" descChecksum = Nollie 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\NollieCrouchIdle.ska" descChecksum = NollieCrouchIdle 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\NollieCrouchTurnLeft.ska" descChecksum = NollieCrouchTurnLeft 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\NollieCrouchTurnRight.ska" descChecksum = NollieCrouchTurnRight 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\NollieSkatingIdle.ska" descChecksum = NollieSkatingIdle 
	ENDIF 
	SetReferenceChecksum 0 
ENDSCRIPT

SCRIPT animload_THPS6_human_net_4 LoadFunction = LoadAnim 
	SetReferenceChecksum THPS6_human 
	IF <LoadFunction> <...> name = "anims\\THPS6_skater_basics\\NollieSkatingTurnLeft.ska" descChecksum = NollieSkatingTurnLeft 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\NollieSkatingTurnRight.ska" descChecksum = NollieSkatingTurnRight 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\NoseManual.ska" descChecksum = NoseManual 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\NoseManual_range.ska" descChecksum = NoseManual_range 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\NoseManual_Range2.ska" descChecksum = NoseManual_Range2 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\NoseManualFromAir.ska" descChecksum = NoseManualFromAir 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\Ollie.ska" descChecksum = Ollie 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\Prop.ska" descChecksum = Prop 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\Push.ska" descChecksum = Push 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\PushCycle.ska" descChecksum = PushCycle 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\PushCycleArms1.ska" descChecksum = PushCycleArms1 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\PushCycleArms2.ska" descChecksum = PushCycleArms2 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\PushCycleArms3.ska" descChecksum = PushCycleArms3 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\PushCycleArms4.ska" descChecksum = PushCycleArms4 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\PushCycleArms5.ska" descChecksum = PushCycleArms5 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\PushIdle.ska" descChecksum = PushIdle 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\PutDownManual.ska" descChecksum = PutDownManual 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\PutDownNoseManual.ska" descChecksum = PutDownNoseManual 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\RevertBS.ska" descChecksum = RevertBS 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\RevertFS.ska" descChecksum = RevertFS 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\SkatingToNollie.ska" descChecksum = SkatingToNollie 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\SketchyCrouchLand.ska" descChecksum = SketchyCrouchLand 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\SketchyLand.ska" descChecksum = SketchyLand 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\SketchyLand1.ska" descChecksum = SketchyLand1 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\SkitchInit.ska" descChecksum = SkitchInit 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\SkitchRange.ska" descChecksum = SkitchRange 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\SlapAir.ska" descChecksum = SlapAir 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\SlapRight.ska" descChecksum = SlapRight 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\SlowDownBrake.ska" descChecksum = SlowDownBrake 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\SlowDownBrake_Mongo.ska" descChecksum = SlowDownBrake_Mongo 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\SpineTransfer.ska" descChecksum = SpineTransfer 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\StandingLandTurn.ska" descChecksum = StandingLandTurn 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\StartSkating1.ska" descChecksum = StartSkating1 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\StretchLegsInit.ska" descChecksum = StretchLegsInit 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\Taunt1.ska" descChecksum = Taunt1 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\Taunt2.ska" descChecksum = Taunt2 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\Taunt3.ska" descChecksum = Taunt3 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\TurnLeft.ska" descChecksum = TurnLeft 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\TurnLeftIdle.ska" descChecksum = TurnLeftIdle 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\TurnRight.ska" descChecksum = TurnRight 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\TurnRightIdle.ska" descChecksum = TurnRightIdle 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\WallRideBackLoop.ska" descChecksum = WallRideBackLoop 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\WallRideBackTrans.ska" descChecksum = WallRideBackTrans 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\WallRideFrontLoop.ska" descChecksum = WallRideFrontLoop 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\WallRideFrontTrans.ska" descChecksum = WallRideFrontTrans 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\ToTail_In.ska" descChecksum = ToTail_In 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\ToTail_Out.ska" descChecksum = ToTail_Out 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\ToTail_Idle.ska" descChecksum = ToTail_Idle 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\WallPlant_Crouched.ska" descChecksum = WallPlant_Crouched 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\WallPlant_Standing.ska" descChecksum = WallPlant_Standing 
	ENDIF 
	SetReferenceChecksum 0 
ENDSCRIPT

SCRIPT animload_THPS6_human_net_5 LoadFunction = LoadAnim 
	SetReferenceChecksum THPS6_human 
	IF <LoadFunction> <...> name = "anims\\THPS6_skater_basics\\WallPlant_Manual.ska" descChecksum = WallPlant_Manual 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\WallPlant_NoseManual.ska" descChecksum = WallPlant_NoseManual 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\CrouchToPressure.ska" descChecksum = CrouchToPressure 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\SkateToPressure.ska" descChecksum = SkateToPressure 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\AirIdleCAT.ska" descChecksum = AirIdleCAT 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\BrakeIdle_Start.ska" descChecksum = BrakeIdle_Start 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\BrakeIdle_Start_Mongo.ska" descChecksum = BrakeIdle_Start_Mongo 
		<LoadFunction> <...> name = "anims\\Cloth\\Cloth_Land_Partial.ska" descChecksum = Cloth_Land_Partial 
		<LoadFunction> <...> name = "anims\\Cloth\\Cloth_AIrFlow_Partial.ska" descChecksum = Cloth_AIrFlow_Partial 
		<LoadFunction> <...> name = "anims\\PED_CrappySkate\\CrouchIdle_Crappy.ska" descChecksum = CrouchIdle_Crappy 
		<LoadFunction> <...> name = "anims\\PED_CrappySkate\\CrouchTurnLeft_Crappy.ska" descChecksum = CrouchTurnLeft_Crappy 
		<LoadFunction> <...> name = "anims\\PED_CrappySkate\\CrouchTurnLeftIdle_Crappy.ska" descChecksum = CrouchTurnLeftIdle_Crappy 
		<LoadFunction> <...> name = "anims\\PED_CrappySkate\\CrouchTurnRight_Crappy.ska" descChecksum = CrouchTurnRight_Crappy 
		<LoadFunction> <...> name = "anims\\PED_CrappySkate\\CrouchTurnRightIdle_Crappy.ska" descChecksum = CrouchTurnRightIdle_Crappy 
		<LoadFunction> <...> name = "anims\\PED_CrappySkate\\TurnLeft_Crappy.ska" descChecksum = TurnLeft_Crappy 
		<LoadFunction> <...> name = "anims\\PED_CrappySkate\\TurnLeftIdle_Crappy.ska" descChecksum = TurnLeftIdle_Crappy 
		<LoadFunction> <...> name = "anims\\PED_CrappySkate\\TurnRight_Crappy.ska" descChecksum = TurnRight_Crappy 
		<LoadFunction> <...> name = "anims\\PED_CrappySkate\\TurnRightIdle_Crappy.ska" descChecksum = TurnRightIdle_Crappy 
		<LoadFunction> <...> name = "anims\\PED_CrappySkate\\CrouchBumpDown_Crappy.ska" descChecksum = CrouchBumpDown_Crappy 
		<LoadFunction> <...> name = "anims\\PED_CrappySkate\\CrouchBumpUp_Crappy.ska" descChecksum = CrouchBumpUp_Crappy 
		<LoadFunction> <...> name = "anims\\THPS6_Basics\\Default.ska" descChecksum = default 
		<LoadFunction> <...> name = "anims\\THPS6_skater_flatland\\_360FlipNoseManual.ska" descChecksum = _360FlipNoseManual 
		<LoadFunction> <...> name = "anims\\THPS6_skater_flatland\\AntiCasper_Init.ska" descChecksum = AntiCasper_Init 
		<LoadFunction> <...> name = "anims\\THPS6_skater_flatland\\AntiCasper_Out.ska" descChecksum = AntiCasper_Out 
		<LoadFunction> <...> name = "anims\\THPS6_skater_flatland\\AntiCasper_Range.ska" descChecksum = AntiCasper_Range 
		<LoadFunction> <...> name = "anims\\THPS6_skater_flatland\\AntiCasperFlip.ska" descChecksum = AntiCasperFlip 
		<LoadFunction> <...> name = "anims\\THPS6_skater_flatland\\Casper_Init.ska" descChecksum = Casper_Init 
		<LoadFunction> <...> name = "anims\\THPS6_skater_flatland\\Casper_Out.ska" descChecksum = Casper_Out 
		<LoadFunction> <...> name = "anims\\THPS6_skater_flatland\\Casper_Range.ska" descChecksum = Casper_Range 
		<LoadFunction> <...> name = "anims\\THPS6_skater_flatland\\CasperFlip.ska" descChecksum = CasperFlip 
		<LoadFunction> <...> name = "anims\\THPS6_skater_flatland\\GTurn.ska" descChecksum = GTurn 
		<LoadFunction> <...> name = "anims\\THPS6_skater_flatland\\GTurn2.ska" descChecksum = GTurn2 
		<LoadFunction> <...> name = "anims\\THPS6_skater_flatland\\HalfCabImpossible.ska" descChecksum = HalfCabImpossible 
		<LoadFunction> <...> name = "anims\\THPS6_skater_flatland\\HandstandHandFlip_Init.ska" descChecksum = HandstandHandFlip_Init 
		<LoadFunction> <...> name = "anims\\THPS6_skater_flatland\\HandstandHandFlip_Out.ska" descChecksum = HandstandHandFlip_Out 
		<LoadFunction> <...> name = "anims\\THPS6_skater_flatland\\HandstandHandFlip_Range.ska" descChecksum = HandstandHandFlip_Range 
		<LoadFunction> <...> name = "anims\\THPS6_skater_flatland\\HStandFliptoHstand.ska" descChecksum = HStandFliptoHstand 
		<LoadFunction> <...> name = "anims\\THPS6_skater_flatland\\OneFootManual_Init.ska" descChecksum = OneFootManual_Init 
		<LoadFunction> <...> name = "anims\\THPS6_skater_flatland\\OneFootManual_Range.ska" descChecksum = OneFootManual_Range 
		<LoadFunction> <...> name = "anims\\THPS6_skater_flatland\\OneFootNoseManual_Init.ska" descChecksum = OneFootNoseManual_Init 
		<LoadFunction> <...> name = "anims\\THPS6_skater_flatland\\OneFootNoseManual_Range.ska" descChecksum = OneFootNoseManual_Range 
		<LoadFunction> <...> name = "anims\\THPS6_skater_flatland\\Pogo_Bounce.ska" descChecksum = Pogo_Bounce 
		<LoadFunction> <...> name = "anims\\THPS6_skater_flatland\\Pogo_Init.ska" descChecksum = Pogo_Init 
		<LoadFunction> <...> name = "anims\\THPS6_skater_flatland\\Pogo_Kickfoot.ska" descChecksum = Pogo_Kickfoot 
		<LoadFunction> <...> name = "anims\\THPS6_skater_flatland\\Pogo_Out.ska" descChecksum = Pogo_Out 
		<LoadFunction> <...> name = "anims\\THPS6_skater_flatland\\RailFlip.ska" descChecksum = RailFlip 
		<LoadFunction> <...> name = "anims\\THPS6_skater_flatland\\TruckRun.ska" descChecksum = TruckRun 
		<LoadFunction> <...> name = "anims\\THPS6_skater_flatland\\TruckRun_Init.ska" descChecksum = TruckRun_Init 
		<LoadFunction> <...> name = "anims\\THPS6_skater_flatland\\TruckRun_Out.ska" descChecksum = TruckRun_Out 
		<LoadFunction> <...> name = "anims\\THPS6_skater_flatland\\TruckRunFlip.ska" descChecksum = TruckRunFlip 
	ENDIF 
	SetReferenceChecksum 0 
ENDSCRIPT

SCRIPT animload_THPS6_human_net_6 LoadFunction = LoadAnim 
	SetReferenceChecksum THPS6_human 
	IF <LoadFunction> <...> name = "anims\\THPS6_skater_flatland\\Truckstand_Flip.ska" descChecksum = Truckstand_Flip 
		<LoadFunction> <...> name = "anims\\THPS6_skater_flatland\\Truckstand_Init.ska" descChecksum = Truckstand_Init 
		<LoadFunction> <...> name = "anims\\THPS6_skater_flatland\\Truckstand_Out.ska" descChecksum = Truckstand_Out 
		<LoadFunction> <...> name = "anims\\THPS6_skater_flatland\\Truckstand_Range.ska" descChecksum = Truckstand_Range 
		<LoadFunction> <...> name = "anims\\THPS6_skater_flipgrab\\KickFlipBlendFS.ska" descChecksum = KickFlipBlendFS 
		<LoadFunction> <...> name = "anims\\THPS6_skater_flipgrab\\KickFlipBlendBS.ska" descChecksum = KickFlipBlendBS 
		<LoadFunction> <...> name = "anims\\THPS6_skater_flipgrab\\HeelFlipVarialLien.ska" descChecksum = HeelFlipVarialLien 
		<LoadFunction> <...> name = "anims\\THPS6_skater_flipgrab\\_180Varial.ska" descChecksum = _180Varial 
		<LoadFunction> <...> name = "anims\\THPS6_skater_flipgrab\\_360Varial.ska" descChecksum = _360Varial 
		<LoadFunction> <...> name = "anims\\THPS6_skater_flipgrab\\FingerFlipVert.ska" descChecksum = FingerFlipVert 
		<LoadFunction> <...> name = "anims\\THPS6_skater_flipgrab\\SalFlip.ska" descChecksum = SalFlip 
		<LoadFunction> <...> name = "anims\\THPS6_skater_flipgrab\\BenihanaFingerFlip.ska" descChecksum = BenihanaFingerFlip 
		<LoadFunction> <...> name = "anims\\THPS6_skater_flipgrab\\DoubleFingerFlipVert.ska" descChecksum = DoubleFingerFlipVert 
		<LoadFunction> <...> name = "anims\\THPS6_skater_flipgrab\\DoubleSalFlip.ska" descChecksum = DoubleSalFlip 
		<LoadFunction> <...> name = "anims\\THPS6_skater_fliptricks\\_360Flip.ska" descChecksum = _360Flip 
		<LoadFunction> <...> name = "anims\\THPS6_skater_fliptricks\\_360HardFlip.ska" descChecksum = _360HardFlip 
		<LoadFunction> <...> name = "anims\\THPS6_skater_fliptricks\\_360InwardHeelFlip.ska" descChecksum = _360InwardHeelFlip 
		<LoadFunction> <...> name = "anims\\THPS6_skater_fliptricks\\_360ShoveIt.ska" descChecksum = _360ShoveIt 
		<LoadFunction> <...> name = "anims\\THPS6_skater_fliptricks\\_540ShoveIt.ska" descChecksum = _540ShoveIt 
		<LoadFunction> <...> name = "anims\\THPS6_skater_fliptricks\\BigSpinFlip.ska" descChecksum = BigSpinFlip 
		<LoadFunction> <...> name = "anims\\THPS6_skater_fliptricks\\BSBigSpin.ska" descChecksum = BSBigSpin 
		<LoadFunction> <...> name = "anims\\THPS6_skater_fliptricks\\BSFlip.ska" descChecksum = BSFlip 
		<LoadFunction> <...> name = "anims\\THPS6_skater_fliptricks\\DoubleFrontFootImposs.ska" descChecksum = DoubleFrontFootImposs 
		<LoadFunction> <...> name = "anims\\THPS6_skater_fliptricks\\DoubleHeelFlip.ska" descChecksum = DoubleHeelFlip 
		<LoadFunction> <...> name = "anims\\THPS6_skater_fliptricks\\DoubleImpossible.ska" descChecksum = DoubleImpossible 
		<LoadFunction> <...> name = "anims\\THPS6_skater_fliptricks\\DoubleKickFlip.ska" descChecksum = DoubleKickFlip 
		<LoadFunction> <...> name = "anims\\THPS6_skater_fliptricks\\DoubleNollieHeelflip.ska" descChecksum = DoubleNollieHeelflip 
		<LoadFunction> <...> name = "anims\\THPS6_skater_fliptricks\\DoubleNollieKickflip.ska" descChecksum = DoubleNollieKickflip 
		<LoadFunction> <...> name = "anims\\THPS6_skater_fliptricks\\FrontFootImposs.ska" descChecksum = FrontFootImposs 
		<LoadFunction> <...> name = "anims\\THPS6_skater_fliptricks\\FS360ShoveIt.ska" descChecksum = FS360ShoveIt 
		<LoadFunction> <...> name = "anims\\THPS6_skater_fliptricks\\FS540ShoveIt.ska" descChecksum = FS540ShoveIt 
		<LoadFunction> <...> name = "anims\\THPS6_skater_fliptricks\\FSBigSpin.ska" descChecksum = FSBigSpin 
		<LoadFunction> <...> name = "anims\\THPS6_skater_fliptricks\\FSFlip.ska" descChecksum = FSFlip 
		<LoadFunction> <...> name = "anims\\THPS6_skater_fliptricks\\HardFlip.ska" descChecksum = HardFlip 
		<LoadFunction> <...> name = "anims\\THPS6_skater_fliptricks\\HeelFlip.ska" descChecksum = HeelFlip 
		<LoadFunction> <...> name = "anims\\THPS6_skater_fliptricks\\Impossible.ska" descChecksum = Impossible 
		<LoadFunction> <...> name = "anims\\THPS6_skater_fliptricks\\InwardHeelFlip.ska" descChecksum = InwardHeelFlip 
		<LoadFunction> <...> name = "anims\\THPS6_skater_fliptricks\\KickFlip.ska" descChecksum = KickFlip 
		<LoadFunction> <...> name = "anims\\THPS6_skater_fliptricks\\Nollie360Flip.ska" descChecksum = Nollie360Flip 
		<LoadFunction> <...> name = "anims\\THPS6_skater_fliptricks\\Nollie360ShoveIt.ska" descChecksum = Nollie360ShoveIt 
		<LoadFunction> <...> name = "anims\\THPS6_skater_fliptricks\\NollieBS360ShoveIt.ska" descChecksum = NollieBS360ShoveIt 
		<LoadFunction> <...> name = "anims\\THPS6_skater_fliptricks\\NollieBSShoveIt.ska" descChecksum = NollieBSShoveIt 
		<LoadFunction> <...> name = "anims\\THPS6_skater_fliptricks\\NollieFSShoveIt.ska" descChecksum = NollieFSShoveIt 
		<LoadFunction> <...> name = "anims\\THPS6_skater_fliptricks\\NollieHardFlip.ska" descChecksum = NollieHardFlip 
		<LoadFunction> <...> name = "anims\\THPS6_skater_fliptricks\\NollieHeelFlip.ska" descChecksum = NollieHeelFlip 
		<LoadFunction> <...> name = "anims\\THPS6_skater_fliptricks\\NollieImpossible.ska" descChecksum = NollieImpossible 
		<LoadFunction> <...> name = "anims\\THPS6_skater_fliptricks\\NollieInwardFlip.ska" descChecksum = NollieInwardFlip 
		<LoadFunction> <...> name = "anims\\THPS6_skater_fliptricks\\NollieKickFlip.ska" descChecksum = NollieKickFlip 
		<LoadFunction> <...> name = "anims\\THPS6_skater_fliptricks\\NollieVarialHeelflip.ska" descChecksum = NollieVarialHeelflip 
		<LoadFunction> <...> name = "anims\\THPS6_skater_fliptricks\\NollieVarialKickFlip.ska" descChecksum = NollieVarialKickFlip 
	ENDIF 
	SetReferenceChecksum 0 
ENDSCRIPT

SCRIPT animload_THPS6_human_net_7 LoadFunction = LoadAnim 
	SetReferenceChecksum THPS6_human 
	IF <LoadFunction> <...> name = "anims\\THPS6_skater_fliptricks\\OllieAirWalk.ska" descChecksum = OllieAirWalk 
		<LoadFunction> <...> name = "anims\\THPS6_skater_fliptricks\\OllieAirwalkShoveIt.ska" descChecksum = OllieAirwalkShoveIt 
		<LoadFunction> <...> name = "anims\\THPS6_skater_fliptricks\\OllieNorth.ska" descChecksum = OllieNorth 
		<LoadFunction> <...> name = "anims\\THPS6_skater_fliptricks\\OllieNorthBackFootFlip.ska" descChecksum = OllieNorthBackFootFlip 
		<LoadFunction> <...> name = "anims\\THPS6_skater_fliptricks\\PopShoveIt.ska" descChecksum = PopShoveIt 
		<LoadFunction> <...> name = "anims\\THPS6_skater_fliptricks\\PopShoveitBS.ska" descChecksum = PopShoveitBS 
		<LoadFunction> <...> name = "anims\\THPS6_skater_fliptricks\\QuadrupleHeelFlip.ska" descChecksum = QuadrupleHeelFlip 
		<LoadFunction> <...> name = "anims\\THPS6_skater_fliptricks\\TripleHeelFlip.ska" descChecksum = TripleHeelFlip 
		<LoadFunction> <...> name = "anims\\THPS6_skater_fliptricks\\TripleImpossible.ska" descChecksum = TripleImpossible 
		<LoadFunction> <...> name = "anims\\THPS6_skater_fliptricks\\TripleKickFlip.ska" descChecksum = TripleKickFlip 
		<LoadFunction> <...> name = "anims\\THPS6_skater_fliptricks\\VarialHeelFlip.ska" descChecksum = VarialHeelFlip 
		<LoadFunction> <...> name = "anims\\THPS6_skater_fliptricks\\VarialKickFlip.ska" descChecksum = VarialKickFlip 
		<LoadFunction> <...> name = "anims\\THPS6_skater_fliptricks\\KickFlipOldSkool.ska" descChecksum = KickFlipOldSkool 
		<LoadFunction> <...> name = "anims\\THPS6_skater_freestyle\\Spacewalk.ska" descChecksum = Spacewalk 
		<LoadFunction> <...> name = "anims\\THPS6_skater_freestyle\\SkitchMoveRight.ska" descChecksum = SkitchMoveRight 
		<LoadFunction> <...> name = "anims\\THPS6_skater_freestyle\\SkitchMoveLeft.ska" descChecksum = SkitchMoveLeft 
		<LoadFunction> <...> name = "anims\\THPS6_skater_grabtricks\\AirWalk.ska" descChecksum = AirWalk 
		<LoadFunction> <...> name = "anims\\THPS6_skater_grabtricks\\AirWalk_Idle2.ska" descChecksum = AirWalk_Idle2 
		<LoadFunction> <...> name = "anims\\THPS6_skater_grabtricks\\BSShifty.ska" descChecksum = BSShifty 
		<LoadFunction> <...> name = "anims\\THPS6_skater_grabtricks\\BSShifty_Idle.ska" descChecksum = BSShifty_Idle 
		<LoadFunction> <...> name = "anims\\THPS6_skater_grabtricks\\Benihana.ska" descChecksum = Benihana 
		<LoadFunction> <...> name = "anims\\THPS6_skater_grabtricks\\Benihana_Idle.ska" descChecksum = Benihana_Idle 
		<LoadFunction> <...> name = "anims\\THPS6_skater_grabtricks\\Benihana_Out.ska" descChecksum = Benihana_Out 
		<LoadFunction> <...> name = "anims\\THPS6_skater_grabtricks\\BetweenTheLegs_Idle.ska" descChecksum = BetweenTheLegs_Idle 
		<LoadFunction> <...> name = "anims\\THPS6_skater_grabtricks\\BetweenTheLegs_In.ska" descChecksum = BetweenTheLegs_In 
		<LoadFunction> <...> name = "anims\\THPS6_skater_grabtricks\\BetweenTheLegs_Out.ska" descChecksum = BetweenTheLegs_Out 
		<LoadFunction> <...> name = "anims\\THPS6_skater_grabtricks\\CannonBall.ska" descChecksum = CannonBall 
		<LoadFunction> <...> name = "anims\\THPS6_skater_grabtricks\\CannonBall_Idle.ska" descChecksum = CannonBall_Idle 
		<LoadFunction> <...> name = "anims\\THPS6_skater_grabtricks\\CannonballFingerFlip.ska" descChecksum = CannonballFingerFlip 
		<LoadFunction> <...> name = "anims\\THPS6_skater_grabtricks\\ChristAir_Idle.ska" descChecksum = ChristAir_Idle 
		<LoadFunction> <...> name = "anims\\THPS6_skater_grabtricks\\ChristAir_Init.ska" descChecksum = ChristAir_Init 
		<LoadFunction> <...> name = "anims\\THPS6_skater_grabtricks\\ChristAir_Out.ska" descChecksum = ChristAir_Out 
		<LoadFunction> <...> name = "anims\\THPS6_skater_grabtricks\\Crail.ska" descChecksum = Crail 
		<LoadFunction> <...> name = "anims\\THPS6_skater_grabtricks\\Crail_Idle.ska" descChecksum = Crail_Idle 
		<LoadFunction> <...> name = "anims\\THPS6_skater_grabtricks\\CrookedCop.ska" descChecksum = CrookedCop 
		<LoadFunction> <...> name = "anims\\THPS6_skater_grabtricks\\CrookedCop_Idle.ska" descChecksum = CrookedCop_Idle 
		<LoadFunction> <...> name = "anims\\THPS6_skater_grabtricks\\CrossBone.ska" descChecksum = CrossBone 
		<LoadFunction> <...> name = "anims\\THPS6_skater_grabtricks\\CrossBone_Idle.ska" descChecksum = CrossBone_Idle 
		<LoadFunction> <...> name = "anims\\THPS6_skater_grabtricks\\Indy.ska" descChecksum = Indy 
		<LoadFunction> <...> name = "anims\\THPS6_skater_grabtricks\\IndyDelMar.ska" descChecksum = IndyDelMar 
		<LoadFunction> <...> name = "anims\\THPS6_skater_grabtricks\\IndyDelMar_Idle.ska" descChecksum = IndyDelMar_Idle 
		<LoadFunction> <...> name = "anims\\THPS6_skater_grabtricks\\Indy_Idle.ska" descChecksum = Indy_Idle 
		<LoadFunction> <...> name = "anims\\THPS6_skater_grabtricks\\JapanAir.ska" descChecksum = JapanAir 
		<LoadFunction> <...> name = "anims\\THPS6_skater_grabtricks\\JapanAir_Idle.ska" descChecksum = JapanAir_Idle 
		<LoadFunction> <...> name = "anims\\THPS6_skater_grabtricks\\JudoGrab.ska" descChecksum = JudoGrab 
		<LoadFunction> <...> name = "anims\\THPS6_skater_grabtricks\\JudoGrab_Idle.ska" descChecksum = JudoGrab_Idle 
		<LoadFunction> <...> name = "anims\\THPS6_skater_grabtricks\\Madonna.ska" descChecksum = Madonna 
		<LoadFunction> <...> name = "anims\\THPS6_skater_grabtricks\\Madonna_Idle.ska" descChecksum = Madonna_Idle 
		<LoadFunction> <...> name = "anims\\THPS6_skater_grabtricks\\MelonGrab.ska" descChecksum = MelonGrab 
		<LoadFunction> <...> name = "anims\\THPS6_skater_grabtricks\\MelonGrab_Idle.ska" descChecksum = MelonGrab_Idle 
	ENDIF 
	SetReferenceChecksum 0 
ENDSCRIPT

SCRIPT animload_THPS6_human_net_8 LoadFunction = LoadAnim 
	SetReferenceChecksum THPS6_human 
	IF <LoadFunction> <...> name = "anims\\THPS6_skater_grabtricks\\Method.ska" descChecksum = Method 
		<LoadFunction> <...> name = "anims\\THPS6_skater_grabtricks\\Method_Idle.ska" descChecksum = Method_Idle 
		<LoadFunction> <...> name = "anims\\THPS6_skater_grabtricks\\MuteGrab.ska" descChecksum = MuteGrab 
		<LoadFunction> <...> name = "anims\\THPS6_skater_grabtricks\\MuteGrab_Idle.ska" descChecksum = MuteGrab_Idle 
		<LoadFunction> <...> name = "anims\\THPS6_skater_grabtricks\\NoseGrab.ska" descChecksum = NoseGrab 
		<LoadFunction> <...> name = "anims\\THPS6_skater_grabtricks\\NoseGrab_Idle.ska" descChecksum = NoseGrab_Idle 
		<LoadFunction> <...> name = "anims\\THPS6_skater_grabtricks\\Nosebone.ska" descChecksum = Nosebone 
		<LoadFunction> <...> name = "anims\\THPS6_skater_grabtricks\\Nosebone_Idle.ska" descChecksum = Nosebone_Idle 
		<LoadFunction> <...> name = "anims\\THPS6_skater_grabtricks\\OneFootJapan.ska" descChecksum = OneFootJapan 
		<LoadFunction> <...> name = "anims\\THPS6_skater_grabtricks\\OneFootJapan_Idle.ska" descChecksum = OneFootJapan_Idle 
		<LoadFunction> <...> name = "anims\\THPS6_skater_grabtricks\\OneFootTailGrab.ska" descChecksum = OneFootTailGrab 
		<LoadFunction> <...> name = "anims\\THPS6_skater_grabtricks\\OneFootTailGrab_Idle.ska" descChecksum = OneFootTailGrab_Idle 
		<LoadFunction> <...> name = "anims\\THPS6_skater_grabtricks\\RocketAir.ska" descChecksum = RocketAir 
		<LoadFunction> <...> name = "anims\\THPS6_skater_grabtricks\\RocketAir_Idle.ska" descChecksum = RocketAir_Idle 
		<LoadFunction> <...> name = "anims\\THPS6_skater_grabtricks\\SackTap.ska" descChecksum = SackTap 
		<LoadFunction> <...> name = "anims\\THPS6_skater_grabtricks\\SaranWrap.ska" descChecksum = SaranWrap 
		<LoadFunction> <...> name = "anims\\THPS6_skater_grabtricks\\SaranWrap_Idle.ska" descChecksum = SaranWrap_Idle 
		<LoadFunction> <...> name = "anims\\THPS6_skater_grabtricks\\SaranWrap_Out.ska" descChecksum = SaranWrap_Out 
		<LoadFunction> <...> name = "anims\\THPS6_skater_grabtricks\\SeatBelt.ska" descChecksum = SeatBelt 
		<LoadFunction> <...> name = "anims\\THPS6_skater_grabtricks\\SeatBelt_Idle.ska" descChecksum = SeatBelt_Idle 
		<LoadFunction> <...> name = "anims\\THPS6_skater_grabtricks\\Shifty.ska" descChecksum = Shifty 
		<LoadFunction> <...> name = "anims\\THPS6_skater_grabtricks\\Shifty_Idle.ska" descChecksum = Shifty_Idle 
		<LoadFunction> <...> name = "anims\\THPS6_skater_grabtricks\\Stalefish.ska" descChecksum = Stalefish 
		<LoadFunction> <...> name = "anims\\THPS6_skater_grabtricks\\Stalefish_Idle.ska" descChecksum = Stalefish_Idle 
		<LoadFunction> <...> name = "anims\\THPS6_skater_grabtricks\\Stalefish_Layback.ska" descChecksum = Stalefish_Layback 
		<LoadFunction> <...> name = "anims\\THPS6_skater_grabtricks\\Stalefish_Layback_Idle.ska" descChecksum = Stalefish_Layback_Idle 
		<LoadFunction> <...> name = "anims\\THPS6_skater_grabtricks\\Stiffy.ska" descChecksum = Stiffy 
		<LoadFunction> <...> name = "anims\\THPS6_skater_grabtricks\\Stiffy_Idle.ska" descChecksum = Stiffy_Idle 
		<LoadFunction> <...> name = "anims\\THPS6_skater_grabtricks\\TailGrab.ska" descChecksum = TailGrab 
		<LoadFunction> <...> name = "anims\\THPS6_skater_grabtricks\\TailGrab_Idle.ska" descChecksum = TailGrab_Idle 
		<LoadFunction> <...> name = "anims\\THPS6_skater_grabtricks\\TuckKnee.ska" descChecksum = TuckKnee 
		<LoadFunction> <...> name = "anims\\THPS6_skater_grabtricks\\TuckKnee_Idle.ska" descChecksum = TuckKnee_Idle 
		<LoadFunction> <...> name = "anims\\THPS6_skater_grind\\BSBluntSlide_Range.ska" descChecksum = BSBluntSlide_Range 
		<LoadFunction> <...> name = "anims\\THPS6_skater_grind\\BSBoardSlide_Range.ska" descChecksum = BSBoardSlide_Range 
		<LoadFunction> <...> name = "anims\\THPS6_skater_grind\\BSBoardslide_Out.ska" descChecksum = BSBoardslide_Out 
		<LoadFunction> <...> name = "anims\\THPS6_skater_grind\\BSCrooked_Range.ska" descChecksum = BSCrooked_Range 
		<LoadFunction> <...> name = "anims\\THPS6_skater_grind\\BSFeeble_Range.ska" descChecksum = BSFeeble_Range 
		<LoadFunction> <...> name = "anims\\THPS6_skater_grind\\BSHurricaneGrind_Init.ska" descChecksum = BSHurricaneGrind_Init 
		<LoadFunction> <...> name = "anims\\THPS6_skater_grind\\BSHurricaneGrind_Range.ska" descChecksum = BSHurricaneGrind_Range 
		<LoadFunction> <...> name = "anims\\THPS6_skater_grind\\BSNoseBlunt_Range.ska" descChecksum = BSNoseBlunt_Range 
		<LoadFunction> <...> name = "anims\\THPS6_skater_grind\\BSNoseSlide_Out.ska" descChecksum = BSNoseSlide_Out 
		<LoadFunction> <...> name = "anims\\THPS6_skater_grind\\BSOverCrook_Range.ska" descChecksum = BSOverCrook_Range 
		<LoadFunction> <...> name = "anims\\THPS6_skater_grind\\BSSaladGrind_Init.ska" descChecksum = BSSaladGrind_Init 
		<LoadFunction> <...> name = "anims\\THPS6_skater_grind\\BSSaladGrind_Range.ska" descChecksum = BSSaladGrind_Range 
		<LoadFunction> <...> name = "anims\\THPS6_skater_grind\\BSSmith_Range.ska" descChecksum = BSSmith_Range 
		<LoadFunction> <...> name = "anims\\THPS6_skater_grind\\BSTailSlide_Out.ska" descChecksum = BSTailSlide_Out 
		<LoadFunction> <...> name = "anims\\THPS6_skater_grind\\FSBluntSlide_Range.ska" descChecksum = FSBluntSlide_Range 
		<LoadFunction> <...> name = "anims\\THPS6_skater_grind\\FSBoardSlide_Out.ska" descChecksum = FSBoardSlide_Out 
		<LoadFunction> <...> name = "anims\\THPS6_skater_grind\\FSBoardSlide_Range.ska" descChecksum = FSBoardSlide_Range 
		<LoadFunction> <...> name = "anims\\THPS6_skater_grind\\FSCrooked_Range.ska" descChecksum = FSCrooked_Range 
	ENDIF 
	SetReferenceChecksum 0 
ENDSCRIPT

SCRIPT animload_THPS6_human_net_9 LoadFunction = LoadAnim 
	SetReferenceChecksum THPS6_human 
	IF <LoadFunction> <...> name = "anims\\THPS6_skater_grind\\FSFeeble_Range.ska" descChecksum = FSFeeble_Range 
		<LoadFunction> <...> name = "anims\\THPS6_skater_grind\\FSHurricaneGrind_Init.ska" descChecksum = FSHurricaneGrind_Init 
		<LoadFunction> <...> name = "anims\\THPS6_skater_grind\\FSHurricaneGrind_Range.ska" descChecksum = FSHurricaneGrind_Range 
		<LoadFunction> <...> name = "anims\\THPS6_skater_grind\\FSNoseBlunt_Range.ska" descChecksum = FSNoseBlunt_Range 
		<LoadFunction> <...> name = "anims\\THPS6_skater_grind\\FSNoseSlide_Out.ska" descChecksum = FSNoseSlide_Out 
		<LoadFunction> <...> name = "anims\\THPS6_skater_grind\\FSNoseSlide_Range.ska" descChecksum = FSNoseSlide_Range 
		<LoadFunction> <...> name = "anims\\THPS6_skater_grind\\FSOverCrook_Range.ska" descChecksum = FSOverCrook_Range 
		<LoadFunction> <...> name = "anims\\THPS6_skater_grind\\FSSaladGrind_Init.ska" descChecksum = FSSaladGrind_Init 
		<LoadFunction> <...> name = "anims\\THPS6_skater_grind\\FSSaladGrind_Range.ska" descChecksum = FSSaladGrind_Range 
		<LoadFunction> <...> name = "anims\\THPS6_skater_grind\\FSSmith_Range.ska" descChecksum = FSSmith_Range 
		<LoadFunction> <...> name = "anims\\THPS6_skater_grind\\FSTailSlide_Out.ska" descChecksum = FSTailSlide_Out 
		<LoadFunction> <...> name = "anims\\THPS6_skater_grind\\FSTailSlide_Range.ska" descChecksum = FSTailSlide_Range 
		<LoadFunction> <...> name = "anims\\THPS6_skater_grind\\FiftyFifty2_Range.ska" descChecksum = FiftyFifty2_Range 
		<LoadFunction> <...> name = "anims\\THPS6_skater_grind\\FiftyFifty3_Range.ska" descChecksum = FiftyFifty3_Range 
		<LoadFunction> <...> name = "anims\\THPS6_skater_grind\\FiftyFifty_Range.ska" descChecksum = FiftyFifty_Range 
		<LoadFunction> <...> name = "anims\\THPS6_skater_grind\\Init_BSBluntSlide.ska" descChecksum = Init_BSBluntSlide 
		<LoadFunction> <...> name = "anims\\THPS6_skater_grind\\Init_BSBoardSlide.ska" descChecksum = Init_BSBoardSlide 
		<LoadFunction> <...> name = "anims\\THPS6_skater_grind\\Init_BSCrooked.ska" descChecksum = Init_BSCrooked 
		<LoadFunction> <...> name = "anims\\THPS6_skater_grind\\Init_BSFeeble.ska" descChecksum = Init_BSFeeble 
		<LoadFunction> <...> name = "anims\\THPS6_skater_grind\\Init_BSLipSlide.ska" descChecksum = Init_BSLipSlide 
		<LoadFunction> <...> name = "anims\\THPS6_skater_grind\\Init_BSNoseBlunt.ska" descChecksum = Init_BSNoseBlunt 
		<LoadFunction> <...> name = "anims\\THPS6_skater_grind\\Init_BSOverCrook.ska" descChecksum = Init_BSOverCrook 
		<LoadFunction> <...> name = "anims\\THPS6_skater_grind\\Init_BSSmith.ska" descChecksum = Init_BSSmith 
		<LoadFunction> <...> name = "anims\\THPS6_skater_grind\\Init_FSBluntSlide.ska" descChecksum = Init_FSBluntSlide 
		<LoadFunction> <...> name = "anims\\THPS6_skater_grind\\Init_FSBoardSlide.ska" descChecksum = Init_FSBoardSlide 
		<LoadFunction> <...> name = "anims\\THPS6_skater_grind\\Init_FSCrooked.ska" descChecksum = Init_FSCrooked 
		<LoadFunction> <...> name = "anims\\THPS6_skater_grind\\Init_FSFeeble.ska" descChecksum = Init_FSFeeble 
		<LoadFunction> <...> name = "anims\\THPS6_skater_grind\\Init_FSLipSlide.ska" descChecksum = Init_FSLipSlide 
		<LoadFunction> <...> name = "anims\\THPS6_skater_grind\\Init_FSNoseBlunt.ska" descChecksum = Init_FSNoseBlunt 
		<LoadFunction> <...> name = "anims\\THPS6_skater_grind\\Init_FSNoseSlide.ska" descChecksum = Init_FSNoseSlide 
		<LoadFunction> <...> name = "anims\\THPS6_skater_grind\\Init_FSOverCrook.ska" descChecksum = Init_FSOverCrook 
		<LoadFunction> <...> name = "anims\\THPS6_skater_grind\\Init_FSSmith.ska" descChecksum = Init_FSSmith 
		<LoadFunction> <...> name = "anims\\THPS6_skater_grind\\Init_FSTailSlide.ska" descChecksum = Init_FSTailSlide 
		<LoadFunction> <...> name = "anims\\THPS6_skater_grind\\Init_FiftyFifty.ska" descChecksum = Init_FiftyFifty 
		<LoadFunction> <...> name = "anims\\THPS6_skater_grind\\Init_NoseGrind.ska" descChecksum = Init_NoseGrind 
		<LoadFunction> <...> name = "anims\\THPS6_skater_grind\\Init_NoseSlide.ska" descChecksum = Init_NoseSlide 
		<LoadFunction> <...> name = "anims\\THPS6_skater_grind\\Init_TailGrind.ska" descChecksum = Init_TailGrind 
		<LoadFunction> <...> name = "anims\\THPS6_skater_grind\\Init_TailSlide.ska" descChecksum = Init_TailSlide 
		<LoadFunction> <...> name = "anims\\THPS6_skater_grind\\NoseGrind_Range.ska" descChecksum = NoseGrind_Range 
		<LoadFunction> <...> name = "anims\\THPS6_skater_grind\\NoseSlide_Range.ska" descChecksum = NoseSlide_Range 
		<LoadFunction> <...> name = "anims\\THPS6_skater_grind\\TailGrind_Range.ska" descChecksum = TailGrind_Range 
		<LoadFunction> <...> name = "anims\\THPS6_skater_grind\\TailSlide_Range.ska" descChecksum = TailSlide_Range 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\CrouchedLand4.ska" descChecksum = CrouchedLand4 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\CrouchedLand4_Small.ska" descChecksum = CrouchedLand4_Small 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\CrouchedLand_Tiny.ska" descChecksum = CrouchedLand_Tiny 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\StandingLand_Tiny.ska" descChecksum = StandingLand_Tiny 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\CrouchedLand5_Small.ska" descChecksum = CrouchedLand5_Small 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\CrouchedLand5.ska" descChecksum = CrouchedLand5 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\CrouchedLand6.ska" descChecksum = CrouchedLand6 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\CrouchedLandTurn4.ska" descChecksum = CrouchedLandTurn4 
	ENDIF 
	SetReferenceChecksum 0 
ENDSCRIPT

SCRIPT animload_THPS6_human_net_10 LoadFunction = LoadAnim 
	SetReferenceChecksum THPS6_human 
	IF <LoadFunction> <...> name = "anims\\THPS6_skater_basics\\CrouchedLandTurn5.ska" descChecksum = CrouchedLandTurn5 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\StandingLandTurn1.ska" descChecksum = StandingLandTurn1 
		<LoadFunction> <...> name = "anims\\THPS6_skater_lip\\MuteInvert_Init.ska" descChecksum = MuteInvert_Init 
		<LoadFunction> <...> name = "anims\\THPS6_skater_lip\\MuteInvert_Range.ska" descChecksum = MuteInvert_Range 
		<LoadFunction> <...> name = "anims\\THPS6_skater_lip\\MuteInvert_Out.ska" descChecksum = MuteInvert_Out 
		<LoadFunction> <...> name = "anims\\THPS6_skater_lip\\EggPlant_Init.ska" descChecksum = EggPlant_Init 
		<LoadFunction> <...> name = "anims\\THPS6_skater_lip\\EggPlant_Range.ska" descChecksum = EggPlant_Range 
		<LoadFunction> <...> name = "anims\\THPS6_skater_lip\\EggPlant_Out.ska" descChecksum = EggPlant_Out 
		<LoadFunction> <...> name = "anims\\THPS6_skater_lip\\GymnastPlant_Init.ska" descChecksum = GymnastPlant_Init 
		<LoadFunction> <...> name = "anims\\THPS6_skater_lip\\GymnastPlant_Range.ska" descChecksum = GymnastPlant_Range 
		<LoadFunction> <...> name = "anims\\THPS6_skater_lip\\GymnastPlant_Out.ska" descChecksum = GymnastPlant_Out 
		<LoadFunction> <...> name = "anims\\THPS6_skater_lip\\FakieRockAndRoll_Init.ska" descChecksum = FakieRockAndRoll_Init 
		<LoadFunction> <...> name = "anims\\THPS6_skater_lip\\FakieRockAndRoll_Range.ska" descChecksum = FakieRockAndRoll_Range 
		<LoadFunction> <...> name = "anims\\THPS6_skater_lip\\FakieRockAndRoll_Out.ska" descChecksum = FakieRockAndRoll_Out 
		<LoadFunction> <...> name = "anims\\THPS6_skater_lip\\NoseTailStall_Init.ska" descChecksum = NoseTailStall_Init 
		<LoadFunction> <...> name = "anims\\THPS6_skater_lip\\NoseTailStall_Range.ska" descChecksum = NoseTailStall_Range 
		<LoadFunction> <...> name = "anims\\THPS6_skater_lip\\NoseTailStall_Out.ska" descChecksum = NoseTailStall_Out 
		<LoadFunction> <...> name = "anims\\THPS6_skater_lip\\BluntToFakie_Init.ska" descChecksum = BluntToFakie_Init 
		<LoadFunction> <...> name = "anims\\THPS6_skater_lip\\BluntToFakie_Range.ska" descChecksum = BluntToFakie_Range 
		<LoadFunction> <...> name = "anims\\THPS6_skater_lip\\BluntToFakie_Out.ska" descChecksum = BluntToFakie_Out 
		<LoadFunction> <...> name = "anims\\THPS6_skater_lip\\Disaster_Init.ska" descChecksum = Disaster_Init 
		<LoadFunction> <...> name = "anims\\THPS6_skater_lip\\Disaster_Range.ska" descChecksum = Disaster_Range 
		<LoadFunction> <...> name = "anims\\THPS6_skater_lip\\Disaster_Out.ska" descChecksum = Disaster_Out 
		<LoadFunction> <...> name = "anims\\THPS6_skater_lip\\AxleStall_Init.ska" descChecksum = AxleStall_Init 
		<LoadFunction> <...> name = "anims\\THPS6_skater_lip\\AxleStall_Range.ska" descChecksum = AxleStall_Range 
		<LoadFunction> <...> name = "anims\\THPS6_skater_lip\\AxleStall_Out.ska" descChecksum = AxleStall_Out 
		<LoadFunction> <...> name = "anims\\THPS6_skater_lip\\Invert_Init.ska" descChecksum = Invert_Init 
		<LoadFunction> <...> name = "anims\\THPS6_skater_lip\\Invert_Range.ska" descChecksum = Invert_Range 
		<LoadFunction> <...> name = "anims\\THPS6_skater_lip\\Invert_Out.ska" descChecksum = Invert_Out 
		<LoadFunction> <...> name = "anims\\THPS6_skater_lip\\OneFootInvert_Init.ska" descChecksum = OneFootInvert_Init 
		<LoadFunction> <...> name = "anims\\THPS6_skater_lip\\OneFootInvert_Range.ska" descChecksum = OneFootInvert_Range 
		<LoadFunction> <...> name = "anims\\THPS6_skater_lip\\OneFootInvert_Out.ska" descChecksum = OneFootInvert_Out 
		<LoadFunction> <...> name = "anims\\THPS6_skater_lip\\BSFootplant_Init.ska" descChecksum = BSFootplant_Init 
		<LoadFunction> <...> name = "anims\\THPS6_skater_lip\\BSFootplant_Range.ska" descChecksum = BSFootplant_Range 
		<LoadFunction> <...> name = "anims\\THPS6_skater_lip\\BSFootplant_Out.ska" descChecksum = BSFootplant_Out 
		<LoadFunction> <...> name = "anims\\THPS6_skater_lip\\BSFootplant_OllieOut.ska" descChecksum = BSFootplant_OllieOut 
		<LoadFunction> <...> name = "anims\\THPS6_skater_lip\\AxleStall_OllieOut.ska" descChecksum = AxleStall_OllieOut 
		<LoadFunction> <...> name = "anims\\THPS6_skater_lip\\FS180Noseblunt_Init.ska" descChecksum = FS180Noseblunt_Init 
		<LoadFunction> <...> name = "anims\\THPS6_skater_lip\\FS180Noseblunt_Range.ska" descChecksum = FS180Noseblunt_Range 
		<LoadFunction> <...> name = "anims\\THPS6_skater_lip\\FS180Noseblunt_Out.ska" descChecksum = FS180Noseblunt_Out 
		<LoadFunction> <...> name = "anims\\THPS6_skater_lip\\FSIndyNosePick_Init.ska" descChecksum = FSIndyNosePick_Init 
		<LoadFunction> <...> name = "anims\\THPS6_skater_lip\\FSIndyNosePick_Range.ska" descChecksum = FSIndyNosePick_Range 
		<LoadFunction> <...> name = "anims\\THPS6_skater_lip\\FSIndyNosePick_Out.ska" descChecksum = FSIndyNosePick_Out 
		<LoadFunction> <...> name = "anims\\THPS6_skater_lip\\AndrectInvert_Init.ska" descChecksum = AndrectInvert_Init 
		<LoadFunction> <...> name = "anims\\THPS6_skater_lip\\AndrectInvert_Out.ska" descChecksum = AndrectInvert_Out 
		<LoadFunction> <...> name = "anims\\THPS6_skater_lip\\AndrectInvert_Range.ska" descChecksum = AndrectInvert_Range 
		<LoadFunction> <...> name = "anims\\THPS6_skater_lip\\Switcheroo_Out.ska" descChecksum = Switcheroo_Out 
		<LoadFunction> <...> name = "anims\\THPS6_skater_lip\\Switcheroo_Init.ska" descChecksum = Switcheroo_Init 
		<LoadFunction> <...> name = "anims\\THPS6_skater_lip\\Switcheroo_Range.ska" descChecksum = Switcheroo_Range 
		<LoadFunction> <...> name = "anims\\THPS6_Skater_Basics\\Natas_Spin_Init.ska" descChecksum = Natas_Spin_Init 
	ENDIF 
	SetReferenceChecksum 0 
ENDSCRIPT

SCRIPT animload_THPS6_human_net_11 LoadFunction = LoadAnim 
	SetReferenceChecksum THPS6_human 
	IF <LoadFunction> <...> name = "anims\\THPS6_Skater_Basics\\Natas_Spin_Range.ska" descChecksum = Natas_Spin_Range 
		<LoadFunction> <...> name = "anims\\THPS6_Skater_Basics\\Natas_Spin_Out.ska" descChecksum = Natas_Spin_Out 
		<LoadFunction> <...> name = "anims\\THPS6_Skater_Basics\\FS_PowerSlide_Init.ska" descChecksum = FS_PowerSlide_Init 
		<LoadFunction> <...> name = "anims\\THPS6_Skater_Basics\\FS_PowerSlide_Idle.ska" descChecksum = FS_PowerSlide_Idle 
		<LoadFunction> <...> name = "anims\\THPS6_Skater_Basics\\FS_PowerSlide_Out.ska" descChecksum = FS_PowerSlide_Out 
		<LoadFunction> <...> name = "anims\\THPS6_Skater_Basics\\FS_PowerSlide_180_Out.ska" descChecksum = FS_PowerSlide_180_Out 
		<LoadFunction> <...> name = "anims\\THPS6_Skater_Basics\\BS_PowerSlide_Init.ska" descChecksum = BS_PowerSlide_Init 
		<LoadFunction> <...> name = "anims\\THPS6_Skater_Basics\\BS_PowerSlide_Idle.ska" descChecksum = BS_PowerSlide_Idle 
		<LoadFunction> <...> name = "anims\\THPS6_Skater_Basics\\BS_PowerSlide_180_Out.ska" descChecksum = BS_PowerSlide_180_Out 
		<LoadFunction> <...> name = "anims\\THPS6_Skater_Basics\\BS_PowerSlide_Out.ska" descChecksum = BS_PowerSlide_Out 
		<LoadFunction> <...> name = "anims\\THPS6_Skater_PressureFlip\\BS180PressureFlip.ska" descChecksum = BS180PressureFlip 
		<LoadFunction> <...> name = "anims\\THPS6_Skater_PressureFlip\\BSToeFlip.ska" descChecksum = BSToeFlip 
		<LoadFunction> <...> name = "anims\\THPS6_Skater_PressureFlip\\BS360PressureFlip.ska" descChecksum = BS360PressureFlip 
		<LoadFunction> <...> name = "anims\\THPS6_Skater_PressureFlip\\FS360PressureFlip.ska" descChecksum = FS360PressureFlip 
		<LoadFunction> <...> name = "anims\\THPS6_skater_misc\\RunFromIdle.ska" descChecksum = RunFromIdle 
		<LoadFunction> <...> name = "anims\\THPS6_skater_misc\\Run.ska" descChecksum = Run 
		<LoadFunction> <...> name = "anims\\THPS6_skater_misc\\RunToIdle.ska" descChecksum = RunToIdle 
		<LoadFunction> <...> name = "anims\\THPS6_skater_misc\\RunJump.ska" descChecksum = RunJump 
		<LoadFunction> <...> name = "anims\\THPS6_skater_misc\\RunJumpIdle.ska" descChecksum = RunJumpIdle 
		<LoadFunction> <...> name = "anims\\THPS6_skater_misc\\RunJumpLand.ska" descChecksum = RunJumpLand 
		<LoadFunction> <...> name = "anims\\THPS6_Skater_Female\\NewBrake_Female.ska" descChecksum = NewBrake_Female 
		<LoadFunction> <...> name = "anims\\THPS6_Skater_Female\\NewBrakeIdle_Female.ska" descChecksum = NewBrakeIdle_Female 
		<LoadFunction> <...> name = "anims\\THPS6_Skater_Female\\NewBrakeIdle2_Female.ska" descChecksum = NewBrakeIdle2_Female 
		<LoadFunction> <...> name = "anims\\THPS6_Skater_Female\\NewBrakeIdle3_Female.ska" descChecksum = NewBrakeIdle3_Female 
		<LoadFunction> <...> name = "anims\\THPS6_Skater_Female\\NewBrakeIdle4_Female.ska" descChecksum = NewBrakeIdle4_Female 
		<LoadFunction> <...> name = "anims\\THPS6_Skater_Female\\NewBrakeIdle6_Female.ska" descChecksum = NewBrakeIdle6_Female 
		<LoadFunction> <...> name = "anims\\THPS6_Skater_Female\\NewBrakeIdle7_Female.ska" descChecksum = NewBrakeIdle7_Female 
		<LoadFunction> <...> name = "anims\\THPS6_Skater_Female\\NewBrakeIdle8_Female.ska" descChecksum = NewBrakeIdle8_Female 
		<LoadFunction> <...> name = "anims\\thps6_skater_OnFoot_partial\\HangLeft10_Partial.ska" descChecksum = HangLeft10_Partial 
		<LoadFunction> <...> name = "anims\\thps6_skater_OnFoot_partial\\HangRight10_Partial.ska" descChecksum = HangRight10_Partial 
		<LoadFunction> <...> name = "anims\\thps6_skater_OnFoot_partial\\HangLeft10_PartialUp.ska" descChecksum = HangLeft10_PartialUp 
		<LoadFunction> <...> name = "anims\\thps6_skater_OnFoot_partial\\HangRight10_PartialUp.ska" descChecksum = HangRight10_PartialUp 
		<LoadFunction> <...> name = "anims\\thps6_skater_OnFoot_partial\\HangLeft20_Partial.ska" descChecksum = HangLeft20_Partial 
		<LoadFunction> <...> name = "anims\\thps6_skater_OnFoot_partial\\HangRight20_Partial.ska" descChecksum = HangRight20_Partial 
		<LoadFunction> <...> name = "anims\\thps6_skater_OnFoot_partial\\HangLeft20_PartialUp.ska" descChecksum = HangLeft20_PartialUp 
		<LoadFunction> <...> name = "anims\\thps6_skater_OnFoot_partial\\HangRight20_PartialUp.ska" descChecksum = HangRight20_PartialUp 
		<LoadFunction> <...> name = "anims\\thps6_skater_OnFoot_partial\\HangLeft30_Partial.ska" descChecksum = HangLeft30_Partial 
		<LoadFunction> <...> name = "anims\\thps6_skater_OnFoot_partial\\HangRight30_Partial.ska" descChecksum = HangRight30_Partial 
		<LoadFunction> <...> name = "anims\\thps6_skater_OnFoot_partial\\HangLeft30_PartialUp.ska" descChecksum = HangLeft30_PartialUp 
		<LoadFunction> <...> name = "anims\\thps6_skater_OnFoot_partial\\HangRight30_PartialUp.ska" descChecksum = HangRight30_PartialUp 
		<LoadFunction> <...> name = "anims\\thps6_skater_OnFoot_partial\\HangLeft40_Partial.ska" descChecksum = HangLeft40_Partial 
		<LoadFunction> <...> name = "anims\\thps6_skater_OnFoot_partial\\HangRight40_Partial.ska" descChecksum = HangRight40_Partial 
		<LoadFunction> <...> name = "anims\\thps6_skater_OnFoot_partial\\HangLeft40_PartialUp.ska" descChecksum = HangLeft40_PartialUp 
		<LoadFunction> <...> name = "anims\\thps6_skater_OnFoot_partial\\HangRight40_PartialUp.ska" descChecksum = HangRight40_PartialUp 
		<LoadFunction> <...> name = "anims\\thps6_skater_OnFoot_partial\\WalkingSlap_Partial.ska" descChecksum = WalkingSlap_Partial 
		<LoadFunction> <...> name = "anims\\thps6_skater_OnFoot_partial\\FastRun_Partial.ska" descChecksum = FastRun_Partial 
		<LoadFunction> <...> name = "anims\\thps6_skater_OnFoot_partial\\HangIdleToDrop_Partial.ska" descChecksum = HangIdleToDrop_Partial 
		<LoadFunction> <...> name = "anims\\thps6_skater_OnFoot_partial\\HangOntoTheTop_Partial.ska" descChecksum = HangOntoTheTop_Partial 
		<LoadFunction> <...> name = "anims\\thps6_skater_OnFoot_partial\\JumpAir_Partial.ska" descChecksum = JumpAir_Partial 
		<LoadFunction> <...> name = "anims\\thps6_skater_OnFoot_partial\\JumpLandToRun_Partial.ska" descChecksum = JumpLandToRun_Partial 
	ENDIF 
	SetReferenceChecksum 0 
ENDSCRIPT

SCRIPT animload_THPS6_human_net_12 LoadFunction = LoadAnim 
	SetReferenceChecksum THPS6_human 
	IF <LoadFunction> <...> name = "anims\\thps6_skater_OnFoot_partial\\JumpLandToStand_Partial.ska" descChecksum = JumpLandToStand_Partial 
		<LoadFunction> <...> name = "anims\\thps6_skater_OnFoot_partial\\LadderClimb_Partial.ska" descChecksum = LadderClimb_Partial 
		<LoadFunction> <...> name = "anims\\thps6_skater_OnFoot_partial\\LadderClimbFromStandIdle_Partial.ska" descChecksum = LadderClimbFromStandIdle_Partial 
		<LoadFunction> <...> name = "anims\\thps6_skater_OnFoot_partial\\LadderOntoTheTop_Partial.ska" descChecksum = LadderOntoTheTop_Partial 
		<LoadFunction> <...> name = "anims\\thps6_skater_OnFoot_partial\\RunToJump_Partial.ska" descChecksum = RunToJump_Partial 
		<LoadFunction> <...> name = "anims\\thps6_skater_OnFoot_partial\\StandToHang_Partial.ska" descChecksum = StandToHang_Partial 
		<LoadFunction> <...> name = "anims\\thps6_skater_OnFoot_partial\\StandToJump_Partial.ska" descChecksum = StandToJump_Partial 
		<LoadFunction> <...> name = "anims\\thps6_skater_OnFoot_partial\\WRun_Partial.ska" descChecksum = WRun_Partial 
		<LoadFunction> <...> name = "anims\\thps6_skater_OnFoot_partial\\WStand_Partial.ska" descChecksum = WStand_Partial 
		<LoadFunction> <...> name = "anims\\thps6_skater_OnFoot_partial\\WStandToRun_Partial.ska" descChecksum = WStandToRun_Partial 
		<LoadFunction> <...> name = "anims\\thps6_skater_OnFoot_partial\\WStandToWalk_Partial.ska" descChecksum = WStandToWalk_Partial 
		<LoadFunction> <...> name = "anims\\thps6_skater_OnFoot_partial\\WWalk_Partial.ska" descChecksum = WWalk_Partial 
		<LoadFunction> <...> name = "anims\\thps6_skater_OnFoot_partial\\WalkFast_Partial.ska" descChecksum = WalkFast_Partial 
		<LoadFunction> <...> name = "anims\\thps6_skater_OnFoot_partial\\WalkSlow_Partial.ska" descChecksum = WalkSlow_Partial 
		<LoadFunction> <...> name = "anims\\thps6_skater_OnFoot_partial\\_180RunSkid_Partial.ska" descChecksum = _180RunSkid_Partial 
		<LoadFunction> <...> name = "anims\\thps6_skater_OnFoot_partial\\WStandIdle1_Partial.ska" descChecksum = WStandIdle1_Partial 
		<LoadFunction> <...> name = "anims\\thps6_skater_OnFoot_partial\\WStandIdle2_Partial.ska" descChecksum = WStandIdle2_Partial 
		<LoadFunction> <...> name = "anims\\thps6_skater_OnFoot_partial\\WStandIdle3_Partial.ska" descChecksum = WStandIdle3_Partial 
		<LoadFunction> <...> name = "anims\\thps6_skater_OnFoot_partial\\WStandIdle4_Partial.ska" descChecksum = WStandIdle4_Partial 
		<LoadFunction> <...> name = "anims\\thps6_skater_OnFoot_partial\\WStandIdle5_Partial.ska" descChecksum = WStandIdle5_Partial 
		<LoadFunction> <...> name = "anims\\thps6_skater_OnFoot_partial\\WStandIdle6_Partial.ska" descChecksum = WStandIdle6_Partial 
		<LoadFunction> <...> name = "anims\\thps6_skater_OnFoot_partial\\JumpToSwingHang_Partial.ska" descChecksum = JumpToSwingHang_Partial 
		<LoadFunction> <...> name = "anims\\thps6_skater_OnFoot_partial\\JumpToWallHang_Partial.ska" descChecksum = JumpToWallHang_Partial 
		<LoadFunction> <...> name = "anims\\thps6_skater_OnFoot_partial\\LadderFastClimb_Partial.ska" descChecksum = LadderFastClimb_Partial 
		<LoadFunction> <...> name = "anims\\thps6_skater_OnFoot_partial\\JumpLandToWalk_Partial.ska" descChecksum = JumpLandToWalk_Partial 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\AirCasperFlip_Idle.ska" descChecksum = AirCasperFlip_Idle 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\AirCasperFlip_Init.ska" descChecksum = AirCasperFlip_Init 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\AirCasperFlip_Out.ska" descChecksum = AirCasperFlip_Out 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\BSNoseSlideLipSlide.ska" descChecksum = BSNoseSlideLipSlide 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\BarrelRoll.ska" descChecksum = BarrelRoll 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\BigHitter_Init.ska" descChecksum = BigHitter_Init 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\BigHitter_Out.ska" descChecksum = BigHitter_Out 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\BigHitter_Range.ska" descChecksum = BigHitter_Range 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\CoffinGrind_Init.ska" descChecksum = CoffinGrind_Init 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\CoffinGrind_Out.ska" descChecksum = CoffinGrind_Out 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\CoffinGrind_Range.ska" descChecksum = CoffinGrind_Range 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\CrailSlide_Init.ska" descChecksum = CrailSlide_Init 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\CrailSlide_Out.ska" descChecksum = CrailSlide_Out 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\CrailSlide_Range.ska" descChecksum = CrailSlide_Range 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\CrookBigSpinFlipCrook.ska" descChecksum = CrookBigSpinFlipCrook 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\DaffyBroken_Init.ska" descChecksum = DaffyBroken_Init 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\DaffyBroken_Range.ska" descChecksum = DaffyBroken_Range 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\DanceParty_Idle.ska" descChecksum = DanceParty_Idle 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\DanceParty_Init.ska" descChecksum = DanceParty_Init 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\DarkSlide_Init.ska" descChecksum = DarkSlide_Init 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\DarkSlide_Out.ska" descChecksum = DarkSlide_Out 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\DarkSlide_Range.ska" descChecksum = DarkSlide_Range 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\DoubleBlunt_Idle.ska" descChecksum = DoubleBlunt_Idle 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\DoubleBlunt_Init.ska" descChecksum = DoubleBlunt_Init 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\DoubleKFVarialIndy.ska" descChecksum = DoubleKFVarialIndy 
	ENDIF 
	SetReferenceChecksum 0 
ENDSCRIPT

SCRIPT animload_THPS6_human_net_13 LoadFunction = LoadAnim 
	SetReferenceChecksum THPS6_human 
	IF <LoadFunction> <...> name = "anims\\THPS6_skater_special\\ElbowSmash_Idle.ska" descChecksum = ElbowSmash_Idle 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\ElbowSmash_Init.ska" descChecksum = ElbowSmash_Init 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\ElbowSmash_Out.ska" descChecksum = ElbowSmash_Out 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\FS540.ska" descChecksum = FS540 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\FSBigSpinShifty_Idle.ska" descChecksum = FSBigSpinShifty_Idle 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\FSBigSpinShifty_Init.ska" descChecksum = FSBigSpinShifty_Init 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\FSBigSpinShifty_Out.ska" descChecksum = FSBigSpinShifty_Out 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\FSNoseSlideLipSlide.ska" descChecksum = FSNoseSlideLipSlide 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\Fandangle_Init.ska" descChecksum = Fandangle_Init 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\Fandangle_Out.ska" descChecksum = Fandangle_Out 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\Fandangle_Range.ska" descChecksum = Fandangle_Range 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\FingerFlipAirWalk.ska" descChecksum = FingerFlipAirWalk 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\Flamingo_Idle.ska" descChecksum = Flamingo_Idle 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\Flamingo_Init.ska" descChecksum = Flamingo_Init 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\Flamingo_Out.ska" descChecksum = Flamingo_Out 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\GazelleUnderflip.ska" descChecksum = GazelleUnderflip 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\Ghettobird2.ska" descChecksum = Ghettobird2 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\GrindOverturn_Init.ska" descChecksum = GrindOverturn_Init 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\GrindOverturn_Range.ska" descChecksum = GrindOverturn_Range 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\HangTenNoseGrind_Init.ska" descChecksum = HangTenNoseGrind_Init 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\HangTenNoseGrind_Out.ska" descChecksum = HangTenNoseGrind_Out 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\HangTenNoseGrind_Range.ska" descChecksum = HangTenNoseGrind_Range 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\HardFlipBackFootFlip.ska" descChecksum = HardFlipBackFootFlip 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\HeelflipFSInvert_Init.ska" descChecksum = HeelflipFSInvert_Init 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\HeelflipFSInvert_Out.ska" descChecksum = HeelflipFSInvert_Out 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\HeelflipFSInvert_Range.ska" descChecksum = HeelflipFSInvert_Range 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\HoHoSadPlant_Idle.ska" descChecksum = HoHoSadPlant_Idle 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\HoHoSadPlant_Init.ska" descChecksum = HoHoSadPlant_Init 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\HoHoSadPlant_Out.ska" descChecksum = HoHoSadPlant_Out 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\HoHoStreetPlant_Idle.ska" descChecksum = HoHoStreetPlant_Idle 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\HoHoStreetPlant_Init.ska" descChecksum = HoHoStreetPlant_Init 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\HoHoStreetPlant_Out.ska" descChecksum = HoHoStreetPlant_Out 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\KickFlipBodyBackFlip.ska" descChecksum = KickFlipBodyBackFlip 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\KickFlipUnderFlip.ska" descChecksum = KickFlipUnderFlip 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\LaserFlip.ska" descChecksum = LaserFlip 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\McTwist.ska" descChecksum = McTwist 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\NoComplyLate360.ska" descChecksum = NoComplyLate360 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\NosegrindPivot_Init.ska" descChecksum = NosegrindPivot_Init 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\NosegrindPivot_Range.ska" descChecksum = NosegrindPivot_Range 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\OneFootOneWheel_Init.ska" descChecksum = OneFootOneWheel_Init 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\OneFootOneWheel_Range.ska" descChecksum = OneFootOneWheel_Range 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\Primo_Init.ska" descChecksum = Primo_Init 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\Primo_Out.ska" descChecksum = Primo_Out 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\Primo_Range.ska" descChecksum = Primo_Range 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\PutDownOneWheel.ska" descChecksum = PutDownOneWheel 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\Russian_Idle.ska" descChecksum = Russian_Idle 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\Russian_OllieOut.ska" descChecksum = Russian_OllieOut 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\Russian_Out.ska" descChecksum = Russian_Out 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\RustySlide_Init.ska" descChecksum = RustySlide_Init 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\RustySlide_Out.ska" descChecksum = RustySlide_Out 
	ENDIF 
	SetReferenceChecksum 0 
ENDSCRIPT

SCRIPT animload_THPS6_human_net_14 LoadFunction = LoadAnim 
	SetReferenceChecksum THPS6_human 
	IF <LoadFunction> <...> name = "anims\\THPS6_skater_special\\SackTap_Init.ska" descChecksum = SackTap_Init 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\SackTap_Out.ska" descChecksum = SackTap_Out 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\SackTap_Range.ska" descChecksum = SackTap_Range 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\SambaFlip.ska" descChecksum = SambaFlip 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\SemiFlip.ska" descChecksum = SemiFlip 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\SitDownAir_Idle.ska" descChecksum = SitDownAir_Idle 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\SitDownAir_Init.ska" descChecksum = SitDownAir_Init 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\SmithFS_Init.ska" descChecksum = SmithFS_Init 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\SmithFS_Range.ska" descChecksum = SmithFS_Range 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\Smith_Init.ska" descChecksum = Smith_Init 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\Smith_Range.ska" descChecksum = Smith_Range 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\Sproing.ska" descChecksum = Sproing 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\Sweet.ska" descChecksum = Sweet 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\TailGrindFingerFlip.ska" descChecksum = TailGrindFingerFlip 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\TailblockSlide_Init.ska" descChecksum = TailblockSlide_Init 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\TailblockSlide_Range.ska" descChecksum = TailblockSlide_Range 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\_2KickMadonnaFlip_Init.ska" descChecksum = _2KickMadonnaFlip_Init 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\_2KickMadonnaFlip_Out.ska" descChecksum = _2KickMadonnaFlip_Out 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\_360VarialMcTwist.ska" descChecksum = _360VarialMcTwist 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\_540Boneless.ska" descChecksum = _540Boneless 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\_540Flip.ska" descChecksum = _540Flip 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\_540TailWhip.ska" descChecksum = _540TailWhip 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\BamBendAir_Idle.ska" descChecksum = BamBendAir_Idle 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\BamBendAir_Init.ska" descChecksum = BamBendAir_Init 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\FiftyFiftySwitcheroo_Idle.ska" descChecksum = FiftyFiftySwitcheroo_Idle 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\FiftyFiftySwitcheroo_Init.ska" descChecksum = FiftyFiftySwitcheroo_Init 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\GrindNBarf_Init.ska" descChecksum = GrindNBarf_Init 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\GrindNBarf_Out.ska" descChecksum = GrindNBarf_Out 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\GrindNBarf_Range.ska" descChecksum = GrindNBarf_Range 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\RodneyGrind_Init.ska" descChecksum = RodneyGrind_Init 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\RodneyGrind_Out.ska" descChecksum = RodneyGrind_Out 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\RodneyGrind_Range.ska" descChecksum = RodneyGrind_Range 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\Shortbus_Idle.ska" descChecksum = Shortbus_Idle 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\Shortbus_Init.ska" descChecksum = Shortbus_Init 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\Shortbus_Out.ska" descChecksum = Shortbus_Out 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\SlamSpinner.ska" descChecksum = SlamSpinner 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\YeahRight_Idle.ska" descChecksum = YeahRight_Idle 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\YeahRight_Init.ska" descChecksum = YeahRight_Init 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\YeahRight_Out.ska" descChecksum = YeahRight_Out 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\_360ShovItNoseGrind_Init.ska" descChecksum = _360ShovItNoseGrind_Init 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\_360ShovItNoseGrind_Out.ska" descChecksum = _360ShovItNoseGrind_Out 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\_360ShovItNoseGrind_Range.ska" descChecksum = _360ShovItNoseGrind_Range 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\BreakIn_Init.ska" descChecksum = BreakIn_Init 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\FSDarkSlide_Init.ska" descChecksum = FSDarkSlide_Init 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\FSDarkSlide_Out.ska" descChecksum = FSDarkSlide_Out 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\FSDarkSlide_Range.ska" descChecksum = FSDarkSlide_Range 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\FSFlipOneFootTailGrab_Idle.ska" descChecksum = FSFlipOneFootTailGrab_Idle 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\FSFlipOneFootTailGrab_Init.ska" descChecksum = FSFlipOneFootTailGrab_Init 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\FSFlipOneFootTailGrab_Out.ska" descChecksum = FSFlipOneFootTailGrab_Out 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\FSNollie360FlipCrook_Init.ska" descChecksum = FSNollie360FlipCrook_Init 
	ENDIF 
	SetReferenceChecksum 0 
ENDSCRIPT

SCRIPT animload_THPS6_human_net_15 LoadFunction = LoadAnim 
	SetReferenceChecksum THPS6_human 
	IF <LoadFunction> <...> name = "anims\\THPS6_skater_special\\FSNollie360FlipCrook_Out.ska" descChecksum = FSNollie360FlipCrook_Out 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\FSNollie360FlipCrook_Range.ska" descChecksum = FSNollie360FlipCrook_Range 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\HandStandCasper_Init.ska" descChecksum = HandStandCasper_Init 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\HandStandCasper_Out.ska" descChecksum = HandStandCasper_Out 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\HandStandCasper_Range.ska" descChecksum = HandStandCasper_Range 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\HCNHDF_Init.ska" descChecksum = HCNHDF_Init 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\HCNHDF_Out.ska" descChecksum = HCNHDF_Out 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\HCNHDF_Range.ska" descChecksum = HCNHDF_Range 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\KickFlipSwitchOneFootManual_Init.ska" descChecksum = KickFlipSwitchOneFootManual_Init 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\KickFlipSwitchOneFootManual_Out.ska" descChecksum = KickFlipSwitchOneFootManual_Out 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\KickFlipSwitchOneFootManual_Range.ska" descChecksum = KickFlipSwitchOneFootManual_Range 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\MixItUp_Idle.ska" descChecksum = MixItUp_Idle 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\MixItUp_Init.ska" descChecksum = MixItUp_Init 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\MixItUp_Out.ska" descChecksum = MixItUp_Out 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\MoonwalkGrind_Idle.ska" descChecksum = MoonwalkGrind_Idle 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\MoonwalkGrind_Init.ska" descChecksum = MoonwalkGrind_Init 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\MoonwalkGrind_Out.ska" descChecksum = MoonwalkGrind_Out 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\OneFootDarkslide_Init.ska" descChecksum = OneFootDarkslide_Init 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\OneFootDarkslide_Out.ska" descChecksum = OneFootDarkslide_Out 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\OneFootDarkslide_Range.ska" descChecksum = OneFootDarkslide_Range 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\PrimoHandStand_Init.ska" descChecksum = PrimoHandStand_Init 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\PrimoHandStand_Out.ska" descChecksum = PrimoHandStand_Out 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\PrimoHandStand_Range.ska" descChecksum = PrimoHandStand_Range 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\RowleyDarkSlideHandStand_Init.ska" descChecksum = RowleyDarkSlideHandStand_Init 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\RowleyDarkSlideHandStand_Out.ska" descChecksum = RowleyDarkSlideHandStand_Out 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\RowleyDarkSlideHandStand_Range.ska" descChecksum = RowleyDarkSlideHandStand_Range 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\Shifty360ShovItBSShifty_Idle.ska" descChecksum = Shifty360ShovItBSShifty_Idle 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\Shifty360ShovItBSShifty_Init.ska" descChecksum = Shifty360ShovItBSShifty_Init 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\Shifty360ShovItBSShifty_Out.ska" descChecksum = Shifty360ShovItBSShifty_Out 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\_540VarielHeelflipLien.ska" descChecksum = _540VarielHeelflipLien 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\The900.ska" descChecksum = The900 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\Indy900.ska" descChecksum = Indy900 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\_1234.ska" descChecksum = _1234 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\Special_Bam_Chainsaw_Init.ska" descChecksum = Special_Bam_Chainsaw_Init 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\Special_Bam_Chainsaw_Idle.ska" descChecksum = Special_Bam_Chainsaw_Idle 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\Special_Bam_Chainsaw_Out.ska" descChecksum = Special_Bam_Chainsaw_Out 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\Special_Bam_Lip_Init.ska" descChecksum = Special_Bam_Lip_Init 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\Special_Bam_Lip_Idle.ska" descChecksum = Special_Bam_Lip_Idle 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\Special_Bam_Lip_Out.ska" descChecksum = Special_Bam_Lip_Out 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\BeaverBlast.ska" descChecksum = BeaverBlast 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\Special_FranklinGrind_Init.ska" descChecksum = Special_FranklinGrind_Init 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\Special_FranklinGrind_Range.ska" descChecksum = Special_FranklinGrind_Range 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\Special_FranklinGrind_Out.ska" descChecksum = Special_FranklinGrind_Out 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\Special_FranklinGrind_Idle.ska" descChecksum = Special_FranklinGrind_Idle 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\Special_Bob_DrksldJapan_Init.ska" descChecksum = Special_Bob_DrksldJapan_Init 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\Special_Bob_DrksldJapan_Idle.ska" descChecksum = Special_Bob_DrksldJapan_Idle 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\Special_Bob_DrksldJapan_Out.ska" descChecksum = Special_Bob_DrksldJapan_Out 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\Special_Bob_RockNRollswitch_Init.ska" descChecksum = Special_Bob_RockNRollswitch_Init 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\Special_Bob_RockNRollswitch_Idle.ska" descChecksum = Special_Bob_RockNRollswitch_Idle 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\Special_Bob_RockNRollswitch_Out.ska" descChecksum = Special_Bob_RockNRollswitch_Out 
	ENDIF 
	SetReferenceChecksum 0 
ENDSCRIPT

SCRIPT animload_THPS6_human_net_16 LoadFunction = LoadAnim 
	SetReferenceChecksum THPS6_human 
	IF <LoadFunction> <...> name = "anims\\THPS6_skater_special\\Special_BullF_Sword_Init.ska" descChecksum = Special_BullF_Sword_Init 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\Special_BullF_Sword_Idle.ska" descChecksum = Special_BullF_Sword_Idle 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\Special_BullF_Sword_Out.ska" descChecksum = Special_BullF_Sword_Out 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\Special_Eric_RnngMan_Init.ska" descChecksum = Special_Eric_RnngMan_Init 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\Special_Eric_RnngMan_Idle.ska" descChecksum = Special_Eric_RnngMan_Idle 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\Special_GrafPunk_Init.ska" descChecksum = Special_GrafPunk_Init 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\Special_GrafPunk_Idle.ska" descChecksum = Special_GrafPunk_Idle 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\Special_GrafPunk_Out.ska" descChecksum = Special_GrafPunk_Out 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\Special_Hand_Thebird_Init.ska" descChecksum = Special_Hand_Thebird_Init 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\Special_Hand_Thebird_Range.ska" descChecksum = Special_Hand_Thebird_Range 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\Special_Hand_Thebird_Out.ska" descChecksum = Special_Hand_Thebird_Out 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\Special_Jesse_HotRod_Init.ska" descChecksum = Special_Jesse_HotRod_Init 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\Special_Jesse_HotRod_Range.ska" descChecksum = Special_Jesse_HotRod_Range 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\Special_Jesse_HotRod_Out.ska" descChecksum = Special_Jesse_HotRod_Out 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\Special_Jester_Juggle_init.ska" descChecksum = Special_Jester_Juggle_init 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\Special_Jester_Juggle_Idle.ska" descChecksum = Special_Jester_Juggle_Idle 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\Special_Jester_Juggle_Out.ska" descChecksum = Special_Jester_Juggle_Out 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\Special_Koston_900.ska" descChecksum = Special_Koston_900 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\Special_Koston_EndlessFlip_Init.ska" descChecksum = Special_Koston_EndlessFlip_Init 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\Special_Koston_EndlessFlip_Idle.ska" descChecksum = Special_Koston_EndlessFlip_Idle 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\Special_Koston_EndlessFlip_Out.ska" descChecksum = Special_Koston_EndlessFlip_Out 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\Special_MikeV_Around_Int.ska" descChecksum = Special_MikeV_Around_Int 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\Special_MikeV_Around_Range.ska" descChecksum = Special_MikeV_Around_Range 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\Special_MikeV_Around_Out.ska" descChecksum = Special_MikeV_Around_Out 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\Special_MikeV_Boomerang.ska" descChecksum = Special_MikeV_Boomerang 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\Special_Muska_Burn_init.ska" descChecksum = Special_Muska_Burn_init 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\Special_Muska_Burn_Range.ska" descChecksum = Special_Muska_Burn_Range 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\Special_Muska_Burn_Out.ska" descChecksum = Special_Muska_Burn_Out 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\Special_Muska_Worm_Init.ska" descChecksum = Special_Muska_Worm_Init 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\Special_Muska_Worm_Idle.ska" descChecksum = Special_Muska_Worm_Idle 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\Special_Muska_Worm_Out.ska" descChecksum = Special_Muska_Worm_Out 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\Special_Natas_spin_init.ska" descChecksum = Special_Natas_spin_init 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\Special_Natas_Spin_Range.ska" descChecksum = Special_Natas_Spin_Range 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\Special_Paulie_ButtMan_Init.ska" descChecksum = Special_Paulie_ButtMan_Init 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\Special_Paulie_ButtMan_Range.ska" descChecksum = Special_Paulie_ButtMan_Range 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\Special_Paulie_ButtMan_Out.ska" descChecksum = Special_Paulie_ButtMan_Out 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\Special_Phil_Hoagie_Init.ska" descChecksum = Special_Phil_Hoagie_Init 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\Special_Phil_Hoagie_Idle.ska" descChecksum = Special_Phil_Hoagie_Idle 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\Special_Phil_Hoagie_Out.ska" descChecksum = Special_Phil_Hoagie_Out 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\Special_Rodney_PrimoSpin_Init.ska" descChecksum = Special_Rodney_PrimoSpin_Init 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\Special_Rodney_PrimoSpin_Idle.ska" descChecksum = Special_Rodney_PrimoSpin_Idle 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\Special_Rodney_PrimoSpin_Out.ska" descChecksum = Special_Rodney_PrimoSpin_Out 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\Special_Rodney_HlfcabUndrFlip.ska" descChecksum = Special_Rodney_HlfcabUndrFlip 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\Special_Sheckler_Primo_Init.ska" descChecksum = Special_Sheckler_Primo_Init 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\Special_Sheckler_Primo_Range.ska" descChecksum = Special_Sheckler_Primo_Range 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\Special_Sheckler_Primo_Out.ska" descChecksum = Special_Sheckler_Primo_Out 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\Special_Sheckler_Grab_Init.ska" descChecksum = Special_Sheckler_Grab_Init 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\Special_Sheckler_Grab_Idle.ska" descChecksum = Special_Sheckler_Grab_Idle 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\Special_Sheckler_Grab_Out.ska" descChecksum = Special_Sheckler_Grab_Out 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\Special_Shrek_WaxSlide_Init.ska" descChecksum = Special_Shrek_WaxSlide_Init 
	ENDIF 
	SetReferenceChecksum 0 
ENDSCRIPT

SCRIPT animload_THPS6_human_net_17 LoadFunction = LoadAnim 
	SetReferenceChecksum THPS6_human 
	IF <LoadFunction> <...> name = "anims\\THPS6_skater_special\\Special_Shrek_WaxSlide_Range.ska" descChecksum = Special_Shrek_WaxSlide_Range 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\Special_Shrek_WaxSlide_Out.ska" descChecksum = Special_Shrek_WaxSlide_Out 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\Special_Shrek_BoardSnap.ska" descChecksum = Special_Shrek_BoardSnap 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\Shrek_BurpTag.ska" descChecksum = Shrek_BurpTag 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\Shrek_BurpHangingTag.ska" descChecksum = Shrek_BurpHangingTag 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\Special_Shrimp_Rotisserie.ska" descChecksum = Special_Shrimp_Rotisserie 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\Special_Soldier_Solute.ska" descChecksum = Special_Soldier_Solute 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\Special_Soldier_AmerHero2_init.ska" descChecksum = Special_Soldier_AmerHero2_init 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\Special_Soldier_AmerHero2_Idle.ska" descChecksum = Special_Soldier_AmerHero2_Idle 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\Special_Soldier_AmerHero2_Out.ska" descChecksum = Special_Soldier_AmerHero2_Out 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\Special_SteveO_BiteBoard.ska" descChecksum = Special_SteveO_BiteBoard 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\Special_Tony_Surfer_init.ska" descChecksum = Special_Tony_Surfer_init 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\Special_Tony_Surfer_Idle.ska" descChecksum = Special_Tony_Surfer_Idle 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\Special_Tony_Windmill_Init.ska" descChecksum = Special_Tony_Windmill_Init 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\Special_Tony_Windmill_Idle.ska" descChecksum = Special_Tony_Windmill_Idle 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\Special_Tony_Windmill_Out.ska" descChecksum = Special_Tony_Windmill_Out 
		<LoadFunction> <...> name = "anims\\THPS6_skater_special\\Special_Weeman_KickHead.ska" descChecksum = Special_Weeman_KickHead 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\Wallplant_Sticker.ska" descChecksum = Wallplant_Sticker 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\Standing_Tag2.ska" descChecksum = Standing_Tag2 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\Hanging_Tag.ska" descChecksum = Hanging_Tag 
		<LoadFunction> <...> name = "anims\\THPS6_skater_basics\\VertPlant.ska" descChecksum = VertPlant 
		<LoadFunction> <...> name = "anims\\THPS6_Bail_GetUp\\GetUp_HK_Ft_T.ska" descChecksum = GetUp_HK_Ft_T 
		<LoadFunction> <...> name = "anims\\THPS6_Skater_Basics\\Throw_Sidearm.ska" descChecksum = Throw_Sidearm 
		<LoadFunction> <...> name = "anims\\THPS6_Skater_Basics\\Standing_Throw.ska" descChecksum = Standing_Throw 
		<LoadFunction> <...> name = "anims\\THPS6_Skater_Basics\\Throw_Sidearm_Partial.ska" descChecksum = Throw_Sidearm_Partial 
		<LoadFunction> <...> name = "anims\\THPS6_Skater_Basics\\Walking_Throw_Partial.ska" descChecksum = Walking_Throw_Partial 
		<LoadFunction> <...> name = "anims\\thps6_skater_OnFoot\\WalkingSlap.ska" descChecksum = WalkingSlap 
		<LoadFunction> <...> name = "anims\\thps6_skater_OnFoot\\Jump_DoubleJump.ska" descChecksum = Jump_DoubleJump 
		<LoadFunction> <...> name = "anims\\thps6_skater_OnFoot\\AirIdleToJumpAir.ska" descChecksum = AirIdleToJumpAir 
		<LoadFunction> <...> name = "anims\\thps6_skater_OnFoot\\FastRun.ska" descChecksum = FastRun 
		<LoadFunction> <...> name = "anims\\thps6_skater_OnFoot\\HangIdle.ska" descChecksum = HangIdle 
		<LoadFunction> <...> name = "anims\\thps6_skater_OnFoot\\HangIdleToDrop.ska" descChecksum = HangIdleToDrop 
		<LoadFunction> <...> name = "anims\\thps6_skater_OnFoot\\HangLeft.ska" descChecksum = HangLeft 
		<LoadFunction> <...> name = "anims\\thps6_skater_OnFoot\\HangOntoTheTop.ska" descChecksum = HangOntoTheTop 
		<LoadFunction> <...> name = "anims\\thps6_skater_OnFoot\\HangRight.ska" descChecksum = HangRight 
		<LoadFunction> <...> name = "anims\\thps6_skater_OnFoot\\JumpAir.ska" descChecksum = JumpAir 
		<LoadFunction> <...> name = "anims\\thps6_skater_OnFoot\\JumpAirTo5050.ska" descChecksum = JumpAirTo5050 
		<LoadFunction> <...> name = "anims\\thps6_skater_OnFoot\\JumpAirToAirIdle.ska" descChecksum = JumpAirToAirIdle 
		<LoadFunction> <...> name = "anims\\thps6_skater_OnFoot\\JumpAirToManual.ska" descChecksum = JumpAirToManual 
		<LoadFunction> <...> name = "anims\\thps6_skater_OnFoot\\JumpLandToRun.ska" descChecksum = JumpLandToRun 
		<LoadFunction> <...> name = "anims\\thps6_skater_OnFoot\\JumpLandToStand.ska" descChecksum = JumpLandToStand 
		<LoadFunction> <...> name = "anims\\thps6_skater_OnFoot\\LadderClimb.ska" descChecksum = LadderClimb 
		<LoadFunction> <...> name = "anims\\thps6_skater_OnFoot\\LadderClimbFromStandIdle.ska" descChecksum = LadderClimbFromStandIdle 
		<LoadFunction> <...> name = "anims\\thps6_skater_OnFoot\\LadderOntoTheTop.ska" descChecksum = LadderOntoTheTop 
		<LoadFunction> <...> name = "anims\\thps6_skater_OnFoot\\RunToJump.ska" descChecksum = RunToJump 
		<LoadFunction> <...> name = "anims\\thps6_skater_OnFoot\\StandToHang.ska" descChecksum = StandToHang 
		<LoadFunction> <...> name = "anims\\thps6_skater_OnFoot\\StandToJump.ska" descChecksum = StandToJump 
		<LoadFunction> <...> name = "anims\\thps6_skater_OnFoot\\WRun.ska" descChecksum = WRun 
		<LoadFunction> <...> name = "anims\\thps6_skater_OnFoot\\WRunToSkate.ska" descChecksum = WRunToSkate 
		<LoadFunction> <...> name = "anims\\thps6_skater_OnFoot\\WSkateToRun.ska" descChecksum = WSkateToRun 
	ENDIF 
	SetReferenceChecksum 0 
ENDSCRIPT

SCRIPT animload_THPS6_human_net_18 LoadFunction = LoadAnim 
	SetReferenceChecksum THPS6_human 
	IF <LoadFunction> <...> name = "anims\\thps6_skater_OnFoot\\WStand.ska" descChecksum = WStand 
		<LoadFunction> <...> name = "anims\\thps6_skater_OnFoot\\WStandToRun.ska" descChecksum = WStandToRun 
		<LoadFunction> <...> name = "anims\\thps6_skater_OnFoot\\WStandToWalk.ska" descChecksum = WStandToWalk 
		<LoadFunction> <...> name = "anims\\thps6_skater_OnFoot\\WWalk.ska" descChecksum = WWalk 
		<LoadFunction> <...> name = "anims\\thps6_skater_OnFoot\\WWalkToStand.ska" descChecksum = WWalkToStand 
		<LoadFunction> <...> name = "anims\\thps6_skater_OnFoot\\WalkFast.ska" descChecksum = WalkFast 
		<LoadFunction> <...> name = "anims\\thps6_skater_OnFoot\\WalkSlow.ska" descChecksum = WalkSlow 
		<LoadFunction> <...> name = "anims\\thps6_skater_OnFoot\\_180RunSkid.ska" descChecksum = _180RunSkid 
		<LoadFunction> <...> name = "anims\\thps6_skater_OnFoot\\SkateToStand.ska" descChecksum = SkateToStand 
		<LoadFunction> <...> name = "anims\\thps6_skater_OnFoot\\SkateToWalk.ska" descChecksum = SkateToWalk 
		<LoadFunction> <...> name = "anims\\thps6_skater_OnFoot\\BrakeToStand.ska" descChecksum = BrakeToStand 
		<LoadFunction> <...> name = "anims\\thps6_skater_OnFoot\\SlowSkateToStand.ska" descChecksum = SlowSkateToStand 
		<LoadFunction> <...> name = "anims\\thps6_skater_OnFoot\\WStandIdle1.ska" descChecksum = WStandIdle1 
		<LoadFunction> <...> name = "anims\\thps6_skater_OnFoot\\WStandIdle2.ska" descChecksum = WStandIdle2 
		<LoadFunction> <...> name = "anims\\thps6_skater_OnFoot\\WStandIdle3.ska" descChecksum = WStandIdle3 
		<LoadFunction> <...> name = "anims\\thps6_skater_OnFoot\\WStandIdle4.ska" descChecksum = WStandIdle4 
		<LoadFunction> <...> name = "anims\\thps6_skater_OnFoot\\WStandIdle5.ska" descChecksum = WStandIdle5 
		<LoadFunction> <...> name = "anims\\thps6_skater_OnFoot\\WStandIdle6.ska" descChecksum = WStandIdle6 
		<LoadFunction> <...> name = "anims\\thps6_skater_OnFoot\\JumpToSwingHang.ska" descChecksum = JumpToSwingHang 
		<LoadFunction> <...> name = "anims\\thps6_skater_OnFoot\\JumpToWallHang.ska" descChecksum = JumpToWallHang 
		<LoadFunction> <...> name = "anims\\thps6_skater_OnFoot\\LadderFastClimb.ska" descChecksum = LadderFastClimb 
		<LoadFunction> <...> name = "anims\\thps6_skater_OnFoot\\JumpAirToNoseManual.ska" descChecksum = JumpAirToNoseManual 
		<LoadFunction> <...> name = "anims\\thps6_skater_OnFoot\\JumpLandToWalk.ska" descChecksum = JumpLandToWalk 
		<LoadFunction> <...> name = "anims\\thps6_skater_OnFoot\\SkateToSkid.ska" descChecksum = SkateToSkid 
	ENDIF 
	SetReferenceChecksum 0 
ENDSCRIPT

SCRIPT animload_PED_FluteGuy LoadFunction = LoadAnim 
	SetReferenceChecksum THPS6_human 
	IF <LoadFunction> <...> name = "anims\\Ped_FluteGuy\\FluteGuy_Idle.ska" descChecksum = FluteGuy_Idle 
		<LoadFunction> <...> name = "anims\\Ped_FluteGuy\\FluteGuy_Idle2.ska" descChecksum = FluteGuy_Idle2 
		<LoadFunction> <...> name = "anims\\Ped_FluteGuy\\FluteGuy_GrabFlute.ska" descChecksum = FluteGuy_GrabFlute 
		<LoadFunction> <...> name = "anims\\Ped_FluteGuy\\FluteGuy_Play.ska" descChecksum = FluteGuy_Play 
		<LoadFunction> <...> name = "anims\\Ped_FluteGuy\\Fluteguy_Play1toPlay2.ska" descChecksum = Fluteguy_Play1toPlay2 
		<LoadFunction> <...> name = "anims\\Ped_FluteGuy\\FluteGuy_Play2.ska" descChecksum = FluteGuy_Play2 
		<LoadFunction> <...> name = "anims\\Ped_FluteGuy\\Fluteguy_Play2toGrabFlute.ska" descChecksum = Fluteguy_Play2toGrabFlute 
		<LoadFunction> <...> name = "anims\\Ped_FluteGuy\\FluteGuy_Play3.ska" descChecksum = FluteGuy_Play3 
		<LoadFunction> <...> name = "anims\\Ped_FluteGuy\\FluteGuy_BackToIdle.ska" descChecksum = FluteGuy_BackToIdle 
	ENDIF 
	SetReferenceChecksum 0 
ENDSCRIPT

SCRIPT animload_Ped_F_MardisGras LoadFunction = LoadAnim 
	SetReferenceChecksum Ped_Female 
	IF <LoadFunction> <...> name = "anims\\Ped_F_MardisGras\\Ped_F_Dance2.ska" descChecksum = Ped_F_Dance2 
		<LoadFunction> <...> name = "anims\\Ped_F_MardisGras\\Ped_F_Dance3.ska" descChecksum = Ped_F_Dance3 
		<LoadFunction> <...> name = "anims\\Ped_F_MardisGras\\Ped_F_Dance1.ska" descChecksum = Ped_F_Dance1 
		<LoadFunction> <...> name = "anims\\Ped_F_MardisGras\\Ped_F_Dance_GetAttention.ska" descChecksum = Ped_F_Dance_GetAttention 
		<LoadFunction> <...> name = "anims\\Ped_F_MardisGras\\Ped_F_ShowEm.ska" descChecksum = Ped_F_ShowEm 
	ENDIF 
	SetReferenceChecksum 0 
ENDSCRIPT

SCRIPT animload_Ped_F_Zombie LoadFunction = LoadAnim 
	SetReferenceChecksum THPS6_human 
	IF <LoadFunction> <...> name = "anims\\Ped_F_Zombie\\Ped_F_Zombie_Idle.ska" descChecksum = Ped_F_Zombie_Idle 
		<LoadFunction> <...> name = "anims\\Ped_F_Zombie\\Ped_F_Zombie_StartWalk.ska" descChecksum = Ped_F_Zombie_StartWalk 
		<LoadFunction> <...> name = "anims\\Ped_F_Zombie\\Ped_F_Zombie_WalkCycle.ska" descChecksum = Ped_F_Zombie_WalkCycle 
		<LoadFunction> <...> name = "anims\\Ped_F_Zombie\\Ped_F_Zombie_StopWalk.ska" descChecksum = Ped_F_Zombie_StopWalk 
		<LoadFunction> <...> name = "anims\\Ped_F_Zombie\\Ped_M_Zombie_Idle.ska" descChecksum = Ped_M_Zombie_Idle 
		<LoadFunction> <...> name = "anims\\Ped_F_Zombie\\Ped_M_Zombie_StartWalk.ska" descChecksum = Ped_M_Zombie_StartWalk 
		<LoadFunction> <...> name = "anims\\Ped_F_Zombie\\Ped_M_Zombie_WalkCycle.ska" descChecksum = Ped_M_Zombie_WalkCycle 
		<LoadFunction> <...> name = "anims\\Ped_F_Zombie\\Ped_M_Zombie_StopWalk.ska" descChecksum = Ped_M_Zombie_StopWalk 
	ENDIF 
	SetReferenceChecksum 0 
ENDSCRIPT

SCRIPT animload_Ped_GermanCop LoadFunction = LoadAnim 
	SetReferenceChecksum THPS6_human 
	IF <LoadFunction> <...> name = "anims\\Ped_GermanCop\\Ped_GermanCop_Idle01.ska" descChecksum = Ped_GermanCop_Idle01 
		<LoadFunction> <...> name = "anims\\Ped_GermanCop\\Ped_GermanCop_Look.ska" descChecksum = Ped_GermanCop_Look 
		<LoadFunction> <...> name = "anims\\Ped_GermanCop\\Ped_GermanCop_RubsTummy.ska" descChecksum = Ped_GermanCop_RubsTummy 
		<LoadFunction> <...> name = "anims\\Ped_GermanCop\\Ped_GermanCop_StickOut.ska" descChecksum = Ped_GermanCop_StickOut 
		<LoadFunction> <...> name = "anims\\Ped_GermanCop\\Ped_GermanCop_StickLook.ska" descChecksum = Ped_GermanCop_StickLook 
		<LoadFunction> <...> name = "anims\\Ped_GermanCop\\Ped_GermanCop_StickIdle.ska" descChecksum = Ped_GermanCop_StickIdle 
		<LoadFunction> <...> name = "anims\\Ped_GermanCop\\Ped_GermanCop_Idle2Run.ska" descChecksum = Ped_GermanCop_Idle2Run 
		<LoadFunction> <...> name = "anims\\Ped_GermanCop\\Ped_GermanCop_StickAway.ska" descChecksum = Ped_GermanCop_StickAway 
		<LoadFunction> <...> name = "anims\\Ped_GermanCop\\Ped_GermanCop_HandIdle2Stop.ska" descChecksum = Ped_GermanCop_HandIdle2Stop 
		<LoadFunction> <...> name = "anims\\Ped_GermanCop\\Ped_GermanCop_HandStop2Idle.ska" descChecksum = Ped_GermanCop_HandStop2Idle 
		<LoadFunction> <...> name = "anims\\Ped_GermanCop\\Ped_GermanCop_HandStop2Go.ska" descChecksum = Ped_GermanCop_HandStop2Go 
		<LoadFunction> <...> name = "anims\\Ped_GermanCop\\Ped_GermanCop_HandGoLoop.ska" descChecksum = Ped_GermanCop_HandGoLoop 
		<LoadFunction> <...> name = "anims\\Ped_GermanCop\\Ped_GermanCop_HandGo2Stop.ska" descChecksum = Ped_GermanCop_HandGo2Stop 
		<LoadFunction> <...> name = "anims\\Ped_GermanCop\\Ped_GermanCop_Idle2Panic.ska" descChecksum = Ped_GermanCop_Idle2Panic 
		<LoadFunction> <...> name = "anims\\Ped_GermanCop\\Ped_GermanCop_Panic.ska" descChecksum = Ped_GermanCop_Panic 
		<LoadFunction> <...> name = "anims\\Ped_GermanCop\\Ped_GermanCop_Panic2Idle.ska" descChecksum = Ped_GermanCop_Panic2Idle 
	ENDIF 
	SetReferenceChecksum 0 
ENDSCRIPT

SCRIPT animload_Ped_GermanDrunk LoadFunction = LoadAnim 
	SetReferenceChecksum THPS6_human 
	IF <LoadFunction> <...> name = "anims\\Ped_GermanDrunk\\Ped_GermanDrunk_idle.ska" descChecksum = Ped_GermanDrunk_idle 
		<LoadFunction> <...> name = "anims\\Ped_GermanDrunk\\Ped_GermanDrunk_idle2walk.ska" descChecksum = Ped_GermanDrunk_idle2walk 
		<LoadFunction> <...> name = "anims\\Ped_GermanDrunk\\Ped_GermanDrunk_walk.ska" descChecksum = Ped_GermanDrunk_walk 
		<LoadFunction> <...> name = "anims\\Ped_GermanDrunk\\Ped_GermanDrunk_walk2idle.ska" descChecksum = Ped_GermanDrunk_walk2idle 
	ENDIF 
	SetReferenceChecksum 0 
ENDSCRIPT

SCRIPT animload_Ped_Graffiti LoadFunction = LoadAnim 
	SetReferenceChecksum THPS6_human 
	IF <LoadFunction> <...> name = "anims\\Ped_Graffiti\\Ped_Graffiti_ShakeCan.ska" descChecksum = Ped_Graffiti_ShakeCan 
		<LoadFunction> <...> name = "anims\\Ped_Graffiti\\Ped_Graffiti_Step2Tag.ska" descChecksum = Ped_Graffiti_Step2Tag 
		<LoadFunction> <...> name = "anims\\Ped_Graffiti\\Ped_Graffiti_LookAround.ska" descChecksum = Ped_Graffiti_LookAround 
		<LoadFunction> <...> name = "anims\\Ped_Graffiti\\Ped_Graffiti_Step2BigTag.ska" descChecksum = Ped_Graffiti_Step2BigTag 
		<LoadFunction> <...> name = "anims\\Ped_Graffiti\\Ped_Graffiti_BigTag01.ska" descChecksum = Ped_Graffiti_BigTag01 
		<LoadFunction> <...> name = "anims\\Ped_Graffiti\\Ped_Graffiti_BigTag02.ska" descChecksum = Ped_Graffiti_BigTag02 
		<LoadFunction> <...> name = "anims\\Ped_Graffiti\\Ped_Graffiti_BigTagStepBack.ska" descChecksum = Ped_Graffiti_BigTagStepBack 
		<LoadFunction> <...> name = "anims\\Ped_Graffiti\\Ped_Graffiti_Idle.ska" descChecksum = Ped_Graffiti_Idle 
	ENDIF 
	SetReferenceChecksum 0 
ENDSCRIPT

SCRIPT animload_Ped_Griller LoadFunction = LoadAnim 
	SetReferenceChecksum THPS6_human 
	IF <LoadFunction> <...> name = "anims\\Ped_Griller\\Ped_Griller_CallingCustomers.ska" descChecksum = Ped_Griller_CallingCustomers 
		<LoadFunction> <...> name = "anims\\Ped_Griller\\Ped_Griller_FixesGrill.ska" descChecksum = Ped_Griller_FixesGrill 
		<LoadFunction> <...> name = "anims\\Ped_Griller\\Ped_Griller_Stretch.ska" descChecksum = Ped_Griller_Stretch 
		<LoadFunction> <...> name = "anims\\Ped_Griller\\Ped_Griller_Idle.ska" descChecksum = Ped_Griller_Idle 
		<LoadFunction> <...> name = "anims\\Ped_Griller\\Ped_Griller_LooksAround.ska" descChecksum = Ped_Griller_LooksAround 
		<LoadFunction> <...> name = "anims\\Ped_Griller\\Ped_Griller_Cooking01.ska" descChecksum = Ped_Griller_Cooking01 
		<LoadFunction> <...> name = "anims\\Ped_Griller\\Ped_Griller_Cooking02.ska" descChecksum = Ped_Griller_Cooking02 
	ENDIF 
	SetReferenceChecksum 0 
ENDSCRIPT

SCRIPT animload_PED_Guitarist LoadFunction = LoadAnim 
	SetReferenceChecksum THPS6_human 
	IF <LoadFunction> <...> name = "anims\\PED_Guitarist\\PED_Guitarist_idle.ska" descChecksum = PED_Guitarist_idle 
		<LoadFunction> <...> name = "anims\\PED_Guitarist\\PED_Guitarist_grabguitar.ska" descChecksum = PED_Guitarist_grabguitar 
		<LoadFunction> <...> name = "anims\\PED_Guitarist\\PED_Guitarist_play01.ska" descChecksum = PED_Guitarist_play01 
		<LoadFunction> <...> name = "anims\\PED_Guitarist\\PED_Guitarist__play02.ska" descChecksum = PED_Guitarist__play02 
		<LoadFunction> <...> name = "anims\\PED_Guitarist\\PED_Guitarist_play03.ska" descChecksum = PED_Guitarist_play03 
		<LoadFunction> <...> name = "anims\\PED_Guitarist\\PED_Guitarist_back2idle.ska" descChecksum = PED_Guitarist_back2idle 
		<LoadFunction> <...> name = "anims\\PED_Guitarist\\PED_Guitarist_play_pick.ska" descChecksum = PED_Guitarist_play_pick 
	ENDIF 
	SetReferenceChecksum 0 
ENDSCRIPT

SCRIPT animload_PED_Imp LoadFunction = LoadAnim 
	SetReferenceChecksum THPS6_human 
	IF <LoadFunction> <...> name = "anims\\PED_Imp\\PED_Imp_idle.ska" descChecksum = PED_Imp_idle 
		<LoadFunction> <...> name = "anims\\PED_Imp\\PED_Imp_Idle2Fly.ska" descChecksum = PED_Imp_Idle2Fly 
		<LoadFunction> <...> name = "anims\\PED_Imp\\PED_Imp_Fly.ska" descChecksum = PED_Imp_Fly 
		<LoadFunction> <...> name = "anims\\PED_Imp\\PED_Imp_Fly2Idle.ska" descChecksum = PED_Imp_Fly2Idle 
	ENDIF 
	SetReferenceChecksum 0 
ENDSCRIPT

SCRIPT animload_Ped_Jazzman LoadFunction = LoadAnim 
	SetReferenceChecksum THPS6_human 
	IF <LoadFunction> <...> name = "anims\\Ped_Jazzman\\Ped_Jazzman_idle_01.ska" descChecksum = Ped_Jazzman_idle_01 
		<LoadFunction> <...> name = "anims\\Ped_Jazzman\\Ped_Jazzman_idle_02.ska" descChecksum = Ped_Jazzman_idle_02 
		<LoadFunction> <...> name = "anims\\Ped_Jazzman\\Ped_Jazzman_idle_03.ska" descChecksum = Ped_Jazzman_idle_03 
		<LoadFunction> <...> name = "anims\\Ped_Jazzman\\Ped_Jazzman_GrabTuba.ska" descChecksum = Ped_Jazzman_GrabTuba 
		<LoadFunction> <...> name = "anims\\Ped_Jazzman\\Ped_Jazzman_Play_01.ska" descChecksum = Ped_Jazzman_Play_01 
		<LoadFunction> <...> name = "anims\\Ped_Jazzman\\Ped_Jazzman_Play_02.ska" descChecksum = Ped_Jazzman_Play_02 
		<LoadFunction> <...> name = "anims\\Ped_Jazzman\\Ped_Jazzman_Back2idle.ska" descChecksum = Ped_Jazzman_Back2idle 
	ENDIF 
	SetReferenceChecksum 0 
ENDSCRIPT

SCRIPT animload_Ped_Jester LoadFunction = LoadAnim 
	SetReferenceChecksum THPS6_human 
	IF <LoadFunction> <...> name = "anims\\Ped_Jester\\Ped_Jester_dance01.ska" descChecksum = Ped_Jester_dance01 
		<LoadFunction> <...> name = "anims\\Ped_Jester\\Ped_Jester_dance02.ska" descChecksum = Ped_Jester_dance02 
	ENDIF 
	SetReferenceChecksum 0 
ENDSCRIPT

SCRIPT animload_Ped_LostSoul LoadFunction = LoadAnim 
	SetReferenceChecksum THPS6_human 
	IF <LoadFunction> <...> name = "anims\\Ped_LostSoul\\Ped_LostSoul_idle1.ska" descChecksum = Ped_LostSoul_idle1 
		<LoadFunction> <...> name = "anims\\Ped_LostSoul\\Ped_LostSoul_idle2.ska" descChecksum = Ped_LostSoul_idle2 
	ENDIF 
	SetReferenceChecksum 0 
ENDSCRIPT

SCRIPT animload_Ped_LoungeSinger LoadFunction = LoadAnim 
	SetReferenceChecksum THPS6_human 
	IF <LoadFunction> <...> name = "anims\\Ped_LoungeSinger\\Ped_LoungeSinger_LayIdle1.ska" descChecksum = Ped_LoungeSinger_LayIdle1 
		<LoadFunction> <...> name = "anims\\Ped_LoungeSinger\\Ped_LoungeSinger_LayIdle2.ska" descChecksum = Ped_LoungeSinger_LayIdle2 
		<LoadFunction> <...> name = "anims\\Ped_LoungeSinger\\Ped_LoungeSinger_Hey.ska" descChecksum = Ped_LoungeSinger_Hey 
		<LoadFunction> <...> name = "anims\\Ped_LoungeSinger\\Ped_LoungeSinger_GetUp.ska" descChecksum = Ped_LoungeSinger_GetUp 
		<LoadFunction> <...> name = "anims\\Ped_LoungeSinger\\Ped_LoungeSinger_Dance.ska" descChecksum = Ped_LoungeSinger_Dance 
	ENDIF 
	SetReferenceChecksum 0 
ENDSCRIPT

SCRIPT animload_Ped_MetalDetect LoadFunction = LoadAnim 
	SetReferenceChecksum THPS6_human 
	IF <LoadFunction> <...> name = "anims\\Ped_MetalDetect\\Ped_MetalDetect_Idle01.ska" descChecksum = Ped_MetalDetect_Idle01 
		<LoadFunction> <...> name = "anims\\Ped_MetalDetect\\Ped_MetalDetect_PicksUpCoin.ska" descChecksum = Ped_MetalDetect_PicksUpCoin 
		<LoadFunction> <...> name = "anims\\Ped_MetalDetect\\Ped_MetalDetect_StartWalkCycle.ska" descChecksum = Ped_MetalDetect_StartWalkCycle 
		<LoadFunction> <...> name = "anims\\Ped_MetalDetect\\Ped_MetalDetect_WalkCyle.ska" descChecksum = Ped_MetalDetect_WalkCyle 
		<LoadFunction> <...> name = "anims\\Ped_MetalDetect\\Ped_MetalDetect_WalkCyleStop.ska" descChecksum = Ped_MetalDetect_WalkCyleStop 
	ENDIF 
	SetReferenceChecksum 0 
ENDSCRIPT

SCRIPT animload_PED_Mime LoadFunction = LoadAnim 
	SetReferenceChecksum THPS6_human 
	IF <LoadFunction> <...> name = "anims\\PED_Mime\\PED_Mime_idle2Wall.ska" descChecksum = PED_Mime_idle2Wall 
		<LoadFunction> <...> name = "anims\\PED_Mime\\PED_Mime_Wall2Push.ska" descChecksum = PED_Mime_Wall2Push 
		<LoadFunction> <...> name = "anims\\PED_Mime\\PED_Mime_Wall2idle.ska" descChecksum = PED_Mime_Wall2idle 
		<LoadFunction> <...> name = "anims\\PED_Mime\\PED_Mime_idle2Push.ska" descChecksum = PED_Mime_idle2Push 
		<LoadFunction> <...> name = "anims\\PED_Mime\\PED_Mime_Push2Wall.ska" descChecksum = PED_Mime_Push2Wall 
		<LoadFunction> <...> name = "anims\\PED_Mime\\PED_Mime_Push2idle.ska" descChecksum = PED_Mime_Push2idle 
		<LoadFunction> <...> name = "anims\\PED_Mime\\PED_Mime_idle2Pull.ska" descChecksum = PED_Mime_idle2Pull 
		<LoadFunction> <...> name = "anims\\PED_Mime\\PED_Mime_Pull.ska" descChecksum = PED_Mime_Pull 
		<LoadFunction> <...> name = "anims\\PED_Mime\\PED_Mime_Pull2idle.ska" descChecksum = PED_Mime_Pull2idle 
		<LoadFunction> <...> name = "anims\\PED_Mime\\PED_Mime_idle.ska" descChecksum = PED_Mime_idle 
	ENDIF 
	SetReferenceChecksum 0 
ENDSCRIPT

SCRIPT animload_THPS6_FrontEnd LoadFunction = LoadAnim 
	SetReferenceChecksum THPS6_human 
	IF <LoadFunction> <...> name = "anims\\THPS6_FrontEnd\\Ped_M_CheckDamage.ska" descChecksum = Ped_M_CheckDamage 
		<LoadFunction> <...> name = "anims\\THPS6_FrontEnd\\FrontEnd_1.ska" descChecksum = FrontEnd_1 
		<LoadFunction> <...> name = "anims\\THPS6_FrontEnd\\FrontEnd_2.ska" descChecksum = FrontEnd_2 
		<LoadFunction> <...> name = "anims\\THPS6_FrontEnd\\FrontEnd_3.ska" descChecksum = FrontEnd_3 
		<LoadFunction> <...> name = "anims\\THPS6_FrontEnd\\FrontEnd_4.ska" descChecksum = FrontEnd_4 
		<LoadFunction> <...> name = "anims\\THPS6_FrontEnd\\FrontEnd_CAS_LookArms.ska" descChecksum = FrontEnd_CAS_LookArms 
		<LoadFunction> <...> name = "anims\\THPS6_FrontEnd\\FrontEnd_CAS_LookLegs.ska" descChecksum = FrontEnd_CAS_LookLegs 
		<LoadFunction> <...> name = "anims\\THPS6_FrontEnd\\FrontEnd_CAS_LookFeet.ska" descChecksum = FrontEnd_CAS_LookFeet 
		<LoadFunction> <...> name = "anims\\THPS6_FrontEnd\\FrontEnd_CAS_ThumbsUp.ska" descChecksum = FrontEnd_CAS_ThumbsUp 
		<LoadFunction> <...> name = "anims\\THPS6_FrontEnd\\FrontEnd_CAS_WhatTha.ska" descChecksum = FrontEnd_CAS_WhatTha 
		<LoadFunction> <...> name = "anims\\THPS6_FrontEnd\\FrontEnd_CAS_HoldBoard_Bot.ska" descChecksum = FrontEnd_CAS_HoldBoard_Bot 
		<LoadFunction> <...> name = "anims\\THPS6_FrontEnd\\FrontEnd_CAS_HoldBoard_Top.ska" descChecksum = FrontEnd_CAS_HoldBoard_Top 
		<LoadFunction> <...> name = "anims\\THPS6_FrontEnd\\FrontEnd_CAS_HoldBoard_Switch.ska" descChecksum = FrontEnd_CAS_HoldBoard_Switch 
		<LoadFunction> <...> name = "anims\\THPS6_FrontEnd\\FrontEnd_Wheel_Idle_1.ska" descChecksum = FrontEnd_Wheel_Idle_1 
		<LoadFunction> <...> name = "anims\\THPS6_FrontEnd\\FrontEnd_Wheel_Idle_2.ska" descChecksum = FrontEnd_Wheel_Idle_2 
		<LoadFunction> <...> name = "anims\\THPS6_FrontEnd\\FrontEnd_Wheel_Idle_3.ska" descChecksum = FrontEnd_Wheel_Idle_3 
		<LoadFunction> <...> name = "anims\\THPS6_FrontEnd\\FrontEnd_Wheel_Spin_Dwn.ska" descChecksum = FrontEnd_Wheel_Spin_Dwn 
		<LoadFunction> <...> name = "anims\\THPS6_FrontEnd\\FrontEnd_Wheel_Spin_Up.ska" descChecksum = FrontEnd_Wheel_Spin_Up 
		<LoadFunction> <...> name = "anims\\THPS6_FrontEnd\\FrontEnd_Wheel_Spin_Hard.ska" descChecksum = FrontEnd_Wheel_Spin_Hard 
		<LoadFunction> <...> name = "anims\\THPS6_FrontEnd\\FrontEnd_Wheel_Spin_Idle.ska" descChecksum = FrontEnd_Wheel_Spin_Idle 
		<LoadFunction> <...> name = "anims\\THPS6_FrontEnd\\FrontEnd_Wheel_Spin_Idle2.ska" descChecksum = FrontEnd_Wheel_Spin_Idle2 
		<LoadFunction> <...> name = "anims\\THPS6_FrontEnd\\FrontEnd_Spin2Wheel.ska" descChecksum = FrontEnd_Spin2Wheel 
	ENDIF 
	SetReferenceChecksum 0 
ENDSCRIPT

SCRIPT animload_THPS6_FrontEnd_TP LoadFunction = LoadAnim 
	SetReferenceChecksum THPS6_human 
	<LoadFunction> <...> name = "anims\\THPS6_FrontEnd\\FrontEnd_1.ska" descChecksum = FrontEnd_1 
	<LoadFunction> <...> name = "anims\\THPS6_FrontEnd\\FrontEnd_2.ska" descChecksum = FrontEnd_2 
	<LoadFunction> <...> name = "anims\\THPS6_FrontEnd\\FrontEnd_3.ska" descChecksum = FrontEnd_3 
	<LoadFunction> <...> name = "anims\\THPS6_FrontEnd\\FrontEnd_4.ska" descChecksum = FrontEnd_4 
	<LoadFunction> <...> name = "anims\\THPS6_FrontEnd\\FrontEnd_CAS_LookArms.ska" descChecksum = FrontEnd_CAS_LookArms 
	<LoadFunction> <...> name = "anims\\THPS6_FrontEnd\\FrontEnd_CAS_LookLegs.ska" descChecksum = FrontEnd_CAS_LookLegs 
	<LoadFunction> <...> name = "anims\\THPS6_FrontEnd\\FrontEnd_CAS_LookFeet.ska" descChecksum = FrontEnd_CAS_LookFeet 
	<LoadFunction> <...> name = "anims\\THPS6_FrontEnd\\FrontEnd_CAS_ThumbsUp.ska" descChecksum = FrontEnd_CAS_ThumbsUp 
	<LoadFunction> <...> name = "anims\\THPS6_FrontEnd\\FrontEnd_CAS_WhatTha.ska" descChecksum = FrontEnd_CAS_WhatTha 
	<LoadFunction> <...> name = "anims\\THPS6_FrontEnd\\FrontEnd_CAS_HoldBoard_Bot.ska" descChecksum = FrontEnd_CAS_HoldBoard_Bot 
	<LoadFunction> <...> name = "anims\\THPS6_FrontEnd\\FrontEnd_CAS_HoldBoard_Top.ska" descChecksum = FrontEnd_CAS_HoldBoard_Top 
	<LoadFunction> <...> name = "anims\\THPS6_FrontEnd\\FrontEnd_CAS_HoldBoard_Switch.ska" descChecksum = FrontEnd_CAS_HoldBoard_Switch 
	<LoadFunction> <...> name = "anims\\Ped_M_Idles\\Ped_M_Idle1.ska" descChecksum = Ped_M_Idle1 
	<LoadFunction> <...> name = "anims\\Ped_M\\Ped_M_LookAround.ska" descChecksum = Ped_M_LookAround 
	<LoadFunction> <...> name = "anims\\Ped_M\\Ped_M_LookLeftRight.ska" descChecksum = Ped_M_LookLeftRight 
	<LoadFunction> <...> name = "anims\\Ped_M\\Ped_M_SkateIdleA.ska" descChecksum = Ped_M_SkateIdleA 
	<LoadFunction> <...> name = "anims\\Ped_M\\Ped_M_SkateIdleB.ska" descChecksum = Ped_M_SkateIdleB 
	<LoadFunction> <...> name = "anims\\Ped_M\\Ped_M_SkateIdleC.ska" descChecksum = Ped_M_SkateIdleC 
	<LoadFunction> <...> name = "anims\\Ped_M\\Ped_M_SkateIdleD.ska" descChecksum = Ped_M_SkateIdleD 
	<LoadFunction> <...> name = "anims\\Ped_M\\Ped_M_ScratchChin.ska" descChecksum = Ped_M_ScratchChin 
	SetReferenceChecksum 0 
ENDSCRIPT

SCRIPT animload_THPS6_NO_7 LoadFunction = LoadAnim 
	SetReferenceChecksum THPS6_human 
	IF <LoadFunction> <...> name = "anims\\Ped_M_Idles\\Ped_M_Sit_Idle_A.ska" descChecksum = Ped_M_Sit_Idle_A 
		<LoadFunction> <...> name = "anims\\Ped_M_Idles\\Ped_M_Sit_Idle_B.ska" descChecksum = Ped_M_Sit_Idle_B 
		<LoadFunction> <...> name = "anims\\Ped_M_Idles\\Ped_M_Sit_Idle_C.ska" descChecksum = Ped_M_Sit_Idle_C 
	ENDIF 
	SetReferenceChecksum 0 
ENDSCRIPT

SCRIPT animload_Ped_Photo LoadFunction = LoadAnim 
	SetReferenceChecksum THPS6_human 
	IF <LoadFunction> <...> name = "anims\\Ped_Photo\\Ped_Photo_CheckCamera.ska" descChecksum = Ped_Photo_CheckCamera 
		<LoadFunction> <...> name = "anims\\Ped_Photo\\Ped_Photo_PhotoIdle.ska" descChecksum = Ped_Photo_PhotoIdle 
		<LoadFunction> <...> name = "anims\\Ped_Photo\\Ped_Photo_Shoot1.ska" descChecksum = Ped_Photo_Shoot1 
		<LoadFunction> <...> name = "anims\\Ped_Photo\\Ped_Photo_Shoot2.ska" descChecksum = Ped_Photo_Shoot2 
		<LoadFunction> <...> name = "anims\\Ped_Photo\\Ped_Photo_Wait.ska" descChecksum = Ped_Photo_Wait 
		<LoadFunction> <...> name = "anims\\Ped_Photo\\default.ska" descChecksum = default 
	ENDIF 
	SetReferenceChecksum 0 
ENDSCRIPT

SCRIPT animload_Ped_RampKid LoadFunction = LoadAnim 
	SetReferenceChecksum THPS6_human 
	IF <LoadFunction> <...> name = "anims\\Ped_RampKid\\Ped_RampKid_Looking.ska" descChecksum = Ped_RampKid_Looking 
		<LoadFunction> <...> name = "anims\\Ped_RampKid\\Ped_RampKid_PutBoardDown.ska" descChecksum = Ped_RampKid_PutBoardDown 
		<LoadFunction> <...> name = "anims\\Ped_RampKid\\Ped_RampKid_BrdDwnLooks.ska" descChecksum = Ped_RampKid_BrdDwnLooks 
		<LoadFunction> <...> name = "anims\\Ped_RampKid\\Ped_RampKid_BrdDwnHelmet.ska" descChecksum = Ped_RampKid_BrdDwnHelmet 
		<LoadFunction> <...> name = "anims\\Ped_RampKid\\Ped_RampKid_PickUpBrd.ska" descChecksum = Ped_RampKid_PickUpBrd 
		<LoadFunction> <...> name = "anims\\Ped_RampKid\\Ped_RampKid_Idle01.ska" descChecksum = Ped_RampKid_Idle01 
	ENDIF 
	SetReferenceChecksum 0 
ENDSCRIPT

SCRIPT animload_Ped_RollerBlade LoadFunction = LoadAnim 
	SetReferenceChecksum THPS6_human 
	IF <LoadFunction> <...> name = "anims\\PED_RollerBlade\\Ped_RollerBlader_SkateCycle.ska" descChecksum = Ped_RollerBlader_SkateCycle 
		<LoadFunction> <...> name = "anims\\PED_RollerBlade\\Ped_RollerBlader_ParadingAss.ska" descChecksum = Ped_RollerBlader_ParadingAss 
		<LoadFunction> <...> name = "anims\\PED_RollerBlade\\Ped_RollerBlader_Spin2Back.ska" descChecksum = Ped_RollerBlader_Spin2Back 
		<LoadFunction> <...> name = "anims\\PED_RollerBlade\\Ped_RollerBlader_BackSkate.ska" descChecksum = Ped_RollerBlader_BackSkate 
		<LoadFunction> <...> name = "anims\\PED_RollerBlade\\Ped_RollerBlader_Spin2Front.ska" descChecksum = Ped_RollerBlader_Spin2Front 
		<LoadFunction> <...> name = "anims\\PED_RollerBlade\\Ped_RollerBlader_HeelClick.ska" descChecksum = Ped_RollerBlader_HeelClick 
		<LoadFunction> <...> name = "anims\\PED_RollerBlade\\Ped_RollerBlader_StartHipPrance.ska" descChecksum = Ped_RollerBlader_StartHipPrance 
		<LoadFunction> <...> name = "anims\\PED_RollerBlade\\Ped_RollerBlader_HipPrance.ska" descChecksum = Ped_RollerBlader_HipPrance 
		<LoadFunction> <...> name = "anims\\PED_RollerBlade\\Ped_RollerBlader_StopHipPrance.ska" descChecksum = Ped_RollerBlader_StopHipPrance 
	ENDIF 
	SetReferenceChecksum 0 
ENDSCRIPT

SCRIPT animload_Ped_Soldier LoadFunction = LoadAnim 
	SetReferenceChecksum THPS6_human 
	IF <LoadFunction> <...> name = "anims\\Ped_Soldier\\Ped_Sldr_Start.ska" descChecksum = Ped_Sldr_Start 
		<LoadFunction> <...> name = "anims\\Ped_Soldier\\Ped_Sldr_Marching01.ska" descChecksum = Ped_Sldr_Marching01 
		<LoadFunction> <...> name = "anims\\Ped_Soldier\\Ped_Sldr_Marching02_P.ska" descChecksum = Ped_Sldr_Marching02_P 
		<LoadFunction> <...> name = "anims\\Ped_Soldier\\Ped_Sldr_Marching03_P.ska" descChecksum = Ped_Sldr_Marching03_P 
		<LoadFunction> <...> name = "anims\\Ped_Soldier\\Ped_Sldr_Marching04_P.ska" descChecksum = Ped_Sldr_Marching04_P 
		<LoadFunction> <...> name = "anims\\Ped_Soldier\\Ped_Sldr_Marching06_P.ska" descChecksum = Ped_Sldr_Marching06_P 
		<LoadFunction> <...> name = "anims\\Ped_Soldier\\Ped_Sldr_Stop01.ska" descChecksum = Ped_Sldr_Stop01 
		<LoadFunction> <...> name = "anims\\Ped_Soldier\\Ped_Sldr_Drumming10_P.ska" descChecksum = Ped_Sldr_Drumming10_P 
		<LoadFunction> <...> name = "anims\\Ped_Soldier\\Ped_Sldr_Drumming02.ska" descChecksum = Ped_Sldr_Drumming02 
		<LoadFunction> <...> name = "anims\\Ped_Soldier\\Ped_Sldr_Drumming04_P.ska" descChecksum = Ped_Sldr_Drumming04_P 
		<LoadFunction> <...> name = "anims\\Ped_Soldier\\Ped_Sldr_Drumming06_P.ska" descChecksum = Ped_Sldr_Drumming06_P 
		<LoadFunction> <...> name = "anims\\Ped_Soldier\\Ped_Sldr_Drumming08_P.ska" descChecksum = Ped_Sldr_Drumming08_P 
	ENDIF 
	SetReferenceChecksum 0 
ENDSCRIPT

SCRIPT animload_PED_Starwarskid LoadFunction = LoadAnim 
	SetReferenceChecksum THPS6_human 
	IF <LoadFunction> <...> name = "anims\\PED_Starwarskid\\PED_Starwarskid_idle_sit01.ska" descChecksum = PED_Starwarskid_idle_sit01 
		<LoadFunction> <...> name = "anims\\PED_Starwarskid\\PED_Starwarskid_idle_sit02.ska" descChecksum = PED_Starwarskid_idle_sit02 
		<LoadFunction> <...> name = "anims\\PED_Starwarskid\\PED_Starwarskid_idle_sit03.ska" descChecksum = PED_Starwarskid_idle_sit03 
		<LoadFunction> <...> name = "anims\\PED_Starwarskid\\PED_Starwarskid_stand.ska" descChecksum = PED_Starwarskid_stand 
		<LoadFunction> <...> name = "anims\\PED_Starwarskid\\PED_Starwarskid_clip01.ska" descChecksum = PED_Starwarskid_clip01 
		<LoadFunction> <...> name = "anims\\PED_Starwarskid\\PED_Starwarskid_clip02.ska" descChecksum = PED_Starwarskid_clip02 
		<LoadFunction> <...> name = "anims\\PED_Starwarskid\\PED_Starwarskid_sitdown.ska" descChecksum = PED_Starwarskid_sitdown 
		<LoadFunction> <...> name = "anims\\PED_Starwarskid\\PED_Starwarskid_ComeHere.ska" descChecksum = PED_Starwarskid_ComeHere 
	ENDIF 
	SetReferenceChecksum 0 
ENDSCRIPT

SCRIPT animload_Ped_Suit LoadFunction = LoadAnim 
	SetReferenceChecksum THPS6_human 
	IF <LoadFunction> <...> name = "anims\\Ped_Suit\\Ped_Suit_Ogle.ska" descChecksum = Ped_Suit_Ogle 
		<LoadFunction> <...> name = "anims\\Ped_Suit\\Ped_Suit_Dance.ska" descChecksum = Ped_Suit_Dance 
		<LoadFunction> <...> name = "anims\\Ped_Suit\\Ped_Suit_OgleToDance.ska" descChecksum = Ped_Suit_OgleToDance 
		<LoadFunction> <...> name = "anims\\Ped_Suit\\Ped_Suit_OgleFromDance.ska" descChecksum = Ped_Suit_OgleFromDance 
	ENDIF 
	SetReferenceChecksum 0 
ENDSCRIPT

SCRIPT animload_Phil_Head LoadFunction = LoadAnim 
	SetReferenceChecksum Phil_Head 
	IF <LoadFunction> <...> name = "anims\\Phil_Head\\default.ska" descChecksum = default 
		<LoadFunction> <...> name = "anims\\Phil_Head\\idle.ska" descChecksum = idle 
	ENDIF 
	SetReferenceChecksum 0 
ENDSCRIPT

SCRIPT animload_Rampkid_HEAD LoadFunction = LoadAnim 
	SetReferenceChecksum Rampkid_HEAD 
	IF <LoadFunction> <...> name = "anims\\Rampkid_HEAD\\default.ska" descChecksum = default 
		<LoadFunction> <...> name = "anims\\Rampkid_HEAD\\idle.ska" descChecksum = idle 
	ENDIF 
	SetReferenceChecksum 0 
ENDSCRIPT

SCRIPT animload_SI_BustedBoard LoadFunction = LoadAnim 
	SetReferenceChecksum BustedBoard 
	IF <LoadFunction> <...> name = "anims\\SI_BustedBoard\\DaffyBroken_Init.ska" descChecksum = DaffyBroken_Init 
		<LoadFunction> <...> name = "anims\\SI_BustedBoard\\DaffyBroken_Range.ska" descChecksum = DaffyBroken_Range 
		<LoadFunction> <...> name = "anims\\SI_BustedBoard\\MightAsWellJUMP_Init.ska" descChecksum = MightAsWellJUMP_Init 
		<LoadFunction> <...> name = "anims\\SI_BustedBoard\\MightAsWellJUMP_Idle.ska" descChecksum = MightAsWellJUMP_Idle 
		<LoadFunction> <...> name = "anims\\SI_BustedBoard\\MightAsWellJUMP_Out.ska" descChecksum = MightAsWellJUMP_Out 
		<LoadFunction> <...> name = "anims\\SI_BustedBoard\\default.ska" descChecksum = default 
	ENDIF 
	SetReferenceChecksum 0 
ENDSCRIPT

SCRIPT animload_SI_ExtraBoard LoadFunction = LoadAnim 
	SetReferenceChecksum SI_ExtraBoard 
	IF <LoadFunction> <...> name = "anims\\SI_ExtraBoard\\default.ska" descChecksum = default 
		<LoadFunction> <...> name = "anims\\SI_ExtraBoard\\YeahRight_Init.ska" descChecksum = YeahRight_Init 
		<LoadFunction> <...> name = "anims\\SI_ExtraBoard\\YeahRight_Out.ska" descChecksum = YeahRight_Out 
		<LoadFunction> <...> name = "anims\\SI_ExtraBoard\\YeahRight_Idle.ska" descChecksum = YeahRight_Idle 
	ENDIF 
	SetReferenceChecksum 0 
ENDSCRIPT

SCRIPT animload_SI_FranklinKite LoadFunction = LoadAnim 
	SetReferenceChecksum SI_FranklinKite 
	IF <LoadFunction> <...> name = "anims\\SI_FranklinKite\\Special_FranklinGrind_Init.ska" descChecksum = Special_FranklinGrind_Init 
		<LoadFunction> <...> name = "anims\\SI_FranklinKite\\Special_FranklinGrind_Range.ska" descChecksum = Special_FranklinGrind_Range 
		<LoadFunction> <...> name = "anims\\SI_FranklinKite\\Special_FranklinGrind_Out.ska" descChecksum = Special_FranklinGrind_Out 
		<LoadFunction> <...> name = "anims\\SI_FranklinKite\\default.ska" descChecksum = default 
		<LoadFunction> <...> name = "anims\\SI_FranklinKite\\Special_FranklinGrind_Idle.ska" descChecksum = Special_FranklinGrind_Idle 
	ENDIF 
	SetReferenceChecksum 0 
ENDSCRIPT

SCRIPT animload_SI_Prop_1 LoadFunction = LoadAnim 
	SetReferenceChecksum SI_Prop_1 
	IF <LoadFunction> <...> name = "anims\\SI_Prop_1\\Special_Bam_Chainsaw_Init.ska" descChecksum = Special_Bam_Chainsaw_Init 
		<LoadFunction> <...> name = "anims\\SI_Prop_1\\Special_Bam_Chainsaw_Idle.ska" descChecksum = Special_Bam_Chainsaw_Idle 
		<LoadFunction> <...> name = "anims\\SI_Prop_1\\Special_Bam_Chainsaw_Out.ska" descChecksum = Special_Bam_Chainsaw_Out 
		<LoadFunction> <...> name = "anims\\SI_Prop_1\\Special_BullF_Sword_Init.ska" descChecksum = Special_BullF_Sword_Init 
		<LoadFunction> <...> name = "anims\\SI_Prop_1\\Special_BullF_Sword_Idle.ska" descChecksum = Special_BullF_Sword_Idle 
		<LoadFunction> <...> name = "anims\\SI_Prop_1\\Special_BullF_Sword_Out.ska" descChecksum = Special_BullF_Sword_Out 
		<LoadFunction> <...> name = "anims\\SI_Prop_1\\Special_Jesse_HotRod_Init.ska" descChecksum = Special_Jesse_HotRod_Init 
		<LoadFunction> <...> name = "anims\\SI_Prop_1\\Special_Jesse_HotRod_Range.ska" descChecksum = Special_Jesse_HotRod_Range 
		<LoadFunction> <...> name = "anims\\SI_Prop_1\\Special_Jesse_HotRod_Out.ska" descChecksum = Special_Jesse_HotRod_Out 
		<LoadFunction> <...> name = "anims\\SI_Prop_1\\Special_Muska_Burn_init.ska" descChecksum = Special_Muska_Burn_init 
		<LoadFunction> <...> name = "anims\\SI_Prop_1\\Special_Muska_Burn_Range.ska" descChecksum = Special_Muska_Burn_Range 
		<LoadFunction> <...> name = "anims\\SI_Prop_1\\Special_Muska_Burn_Out.ska" descChecksum = Special_Muska_Burn_Out 
		<LoadFunction> <...> name = "anims\\SI_Prop_1\\Special_Phil_Hoagie_Init.ska" descChecksum = Special_Phil_Hoagie_Init 
		<LoadFunction> <...> name = "anims\\SI_Prop_1\\Special_Phil_Hoagie_Idle.ska" descChecksum = Special_Phil_Hoagie_Idle 
		<LoadFunction> <...> name = "anims\\SI_Prop_1\\Special_Phil_Hoagie_Out.ska" descChecksum = Special_Phil_Hoagie_Out 
		<LoadFunction> <...> name = "anims\\SI_Prop_1\\default.ska" descChecksum = default 
		<LoadFunction> <...> name = "anims\\SI_Prop_1\\Wallplant_OllieTag.ska" descChecksum = Wallplant_OllieTag 
		<LoadFunction> <...> name = "anims\\SI_Prop_1\\Standing_Tag2.ska" descChecksum = Standing_Tag2 
		<LoadFunction> <...> name = "anims\\SI_Prop_1\\Hanging_Tag.ska" descChecksum = Hanging_Tag 
	ENDIF 
	SetReferenceChecksum 0 
ENDSCRIPT

SCRIPT animload_SI_Prop2 LoadFunction = LoadAnim 
	SetReferenceChecksum SI_Prop2 
	IF <LoadFunction> <...> name = "anims\\SI_Prop2\\Special_GrafPunk_Init.ska" descChecksum = Special_GrafPunk_Init 
		<LoadFunction> <...> name = "anims\\SI_Prop2\\Special_GrafPunk_Idle.ska" descChecksum = Special_GrafPunk_Idle 
		<LoadFunction> <...> name = "anims\\SI_Prop2\\Special_GrafPunk_Out.ska" descChecksum = Special_GrafPunk_Out 
		<LoadFunction> <...> name = "anims\\SI_Prop2\\Default.ska" descChecksum = default 
	ENDIF 
	SetReferenceChecksum 0 
ENDSCRIPT

SCRIPT animload_SI_Prop_3 LoadFunction = LoadAnim 
	SetReferenceChecksum SI_Prop_3 
	IF <LoadFunction> <...> name = "anims\\SI_Prop_3\\Special_Jester_Juggle_init.ska" descChecksum = Special_Jester_Juggle_init 
		<LoadFunction> <...> name = "anims\\SI_Prop_3\\Special_Jester_Juggle_Idle.ska" descChecksum = Special_Jester_Juggle_Idle 
		<LoadFunction> <...> name = "anims\\SI_Prop_3\\Special_Jester_Juggle_Out.ska" descChecksum = Special_Jester_Juggle_Out 
		<LoadFunction> <...> name = "anims\\SI_Prop_3\\default.ska" descChecksum = default 
	ENDIF 
	SetReferenceChecksum 0 
ENDSCRIPT

SCRIPT animload_SI_shark LoadFunction = LoadAnim 
	SetReferenceChecksum anl_shark 
	IF <LoadFunction> <...> name = "anims\\SI_shark\\Special_Sheckler_Primo_Init.ska" descChecksum = Special_Sheckler_Primo_Init 
		<LoadFunction> <...> name = "anims\\SI_shark\\Special_Sheckler_Primo_Range.ska" descChecksum = Special_Sheckler_Primo_Range 
		<LoadFunction> <...> name = "anims\\SI_shark\\Special_Sheckler_Primo_Out.ska" descChecksum = Special_Sheckler_Primo_Out 
		<LoadFunction> <...> name = "anims\\SI_shark\\default.ska" descChecksum = default 
	ENDIF 
	SetReferenceChecksum 0 
ENDSCRIPT

SCRIPT animload_SI_Flag LoadFunction = LoadAnim 
	SetReferenceChecksum SI_Flag 
	IF <LoadFunction> <...> name = "anims\\SI_Flag\\Special_Soldier_AmerHero2_init.ska" descChecksum = Special_Soldier_AmerHero2_init 
		<LoadFunction> <...> name = "anims\\SI_Flag\\Special_Soldier_AmerHero2_Idle.ska" descChecksum = Special_Soldier_AmerHero2_Idle 
		<LoadFunction> <...> name = "anims\\SI_Flag\\Special_Soldier_AmerHero2_Out.ska" descChecksum = Special_Soldier_AmerHero2_Out 
		<LoadFunction> <...> name = "anims\\SI_Flag\\default.ska" descChecksum = default 
	ENDIF 
	SetReferenceChecksum 0 
ENDSCRIPT

SCRIPT animload_Sparrow_Head LoadFunction = LoadAnim 
	SetReferenceChecksum Sparrow_Head 
	IF <LoadFunction> <...> name = "anims\\Sparrow_Head\\default.ska" descChecksum = default 
		<LoadFunction> <...> name = "anims\\Sparrow_Head\\idle.ska" descChecksum = idle 
	ENDIF 
	SetReferenceChecksum 0 
ENDSCRIPT

SCRIPT animload_THPS6_Veh_Bull LoadFunction = LoadAnim 
	SetReferenceChecksum THPS6_human 
	IF <LoadFunction> <...> name = "anims\\THPS6_Veh_Bull\\Veh_Bull_Wheels.ska" descChecksum = Veh_Bull_Wheels 
		<LoadFunction> <...> name = "anims\\THPS6_Veh_Bull\\Veh_Bull_Idle.ska" descChecksum = Veh_Bull_Idle 
		<LoadFunction> <...> name = "anims\\THPS6_Veh_Bull\\Veh_Bull_Accel.ska" descChecksum = Veh_Bull_Accel 
		<LoadFunction> <...> name = "anims\\THPS6_Veh_Bull\\Veh_Bull_Brake.ska" descChecksum = Veh_Bull_Brake 
		<LoadFunction> <...> name = "anims\\THPS6_Veh_Bull\\Veh_Bull_IdleMoving.ska" descChecksum = Veh_Bull_IdleMoving 
		<LoadFunction> <...> name = "anims\\THPS6_Veh_Bull\\Veh_Bull_TurnLeft.ska" descChecksum = Veh_Bull_TurnLeft 
		<LoadFunction> <...> name = "anims\\THPS6_Veh_Bull\\Veh_Bull_TurnRight.ska" descChecksum = Veh_Bull_TurnRight 
		<LoadFunction> <...> name = "anims\\THPS6_Veh_Bull\\Veh_Bull_Ollie.ska" descChecksum = Veh_Bull_Ollie 
		<LoadFunction> <...> name = "anims\\THPS6_Veh_Bull\\Veh_Bull_AirIdle.ska" descChecksum = Veh_Bull_AirIdle 
		<LoadFunction> <...> name = "anims\\THPS6_Veh_Bull\\Veh_Bull_Land.ska" descChecksum = Veh_Bull_Land 
		<LoadFunction> <...> name = "anims\\THPS6_Veh_Bull\\Veh_Bull_FlipTrick.ska" descChecksum = Veh_Bull_FlipTrick 
		<LoadFunction> <...> name = "anims\\THPS6_Veh_Bull\\Veh_Bull_GrabTrick_Init.ska" descChecksum = Veh_Bull_GrabTrick_Init 
		<LoadFunction> <...> name = "anims\\THPS6_Veh_Bull\\Veh_Bull_GrabTrick_Idle.ska" descChecksum = Veh_Bull_GrabTrick_Idle 
		<LoadFunction> <...> name = "anims\\THPS6_Veh_Bull\\Veh_Bull_GrabTrick_Out.ska" descChecksum = Veh_Bull_GrabTrick_Out 
		<LoadFunction> <...> name = "anims\\THPS6_Veh_Bull\\Veh_Bull_Wallplant.ska" descChecksum = Veh_Bull_Wallplant 
		<LoadFunction> <...> name = "anims\\THPS6_Veh_Bull\\Veh_Bull_Grind_Init.ska" descChecksum = Veh_Bull_Grind_Init 
		<LoadFunction> <...> name = "anims\\THPS6_Veh_Bull\\Veh_Bull_Grind_Range.ska" descChecksum = Veh_Bull_Grind_Range 
		<LoadFunction> <...> name = "anims\\THPS6_Veh_Bull\\Veh_Bull_Grind_Out.ska" descChecksum = Veh_Bull_Grind_Out 
		<LoadFunction> <...> name = "anims\\THPS6_Veh_Bull\\Veh_Bull_Revert.ska" descChecksum = Veh_Bull_Revert 
		<LoadFunction> <...> name = "anims\\THPS6_Veh_Bull\\Veh_Bull_Bump.ska" descChecksum = Veh_Bull_Bump 
		<LoadFunction> <...> name = "anims\\THPS6_Veh_Bull\\Veh_Bull_Wheelie_Init.ska" descChecksum = Veh_Bull_Wheelie_Init 
		<LoadFunction> <...> name = "anims\\THPS6_Veh_Bull\\Veh_Bull_Wheelie_Range.ska" descChecksum = Veh_Bull_Wheelie_Range 
		<LoadFunction> <...> name = "anims\\THPS6_Veh_Bull\\Veh_Bull_Getup.ska" descChecksum = Veh_Bull_Getup 
	ENDIF 
	SetReferenceChecksum 0 
ENDSCRIPT

SCRIPT animload_THPS6_Veh_Gurney LoadFunction = LoadAnim 
	SetReferenceChecksum THPS6_human 
	IF <LoadFunction> <...> name = "anims\\THPS6_Veh_Gurney\\Gurney_Stand_Idle.ska" descChecksum = Gurney_Stand_Idle 
		<LoadFunction> <...> name = "anims\\THPS6_Veh_Gurney\\Gurney_Stand_To_Run.ska" descChecksum = Gurney_Stand_To_Run 
		<LoadFunction> <...> name = "anims\\THPS6_Veh_Gurney\\Gurney_Run.ska" descChecksum = Gurney_Run 
		<LoadFunction> <...> name = "anims\\THPS6_Veh_Gurney\\Gurney_Run_1.ska" descChecksum = Gurney_Run_1 
		<LoadFunction> <...> name = "anims\\THPS6_Veh_Gurney\\Gurney_Run_TurnLeft.ska" descChecksum = Gurney_Run_TurnLeft 
		<LoadFunction> <...> name = "anims\\THPS6_Veh_Gurney\\Gurney_Run_TurnRight.ska" descChecksum = Gurney_Run_TurnRight 
		<LoadFunction> <...> name = "anims\\THPS6_Veh_Gurney\\Gurney_Bump.ska" descChecksum = Gurney_Bump 
		<LoadFunction> <...> name = "anims\\THPS6_Veh_Gurney\\Gurney_Ollie.ska" descChecksum = Gurney_Ollie 
		<LoadFunction> <...> name = "anims\\THPS6_Veh_Gurney\\Gurney_AirIdle.ska" descChecksum = Gurney_AirIdle 
		<LoadFunction> <...> name = "anims\\THPS6_Veh_Gurney\\Gurney_Land.ska" descChecksum = Gurney_Land 
		<LoadFunction> <...> name = "anims\\THPS6_Veh_Gurney\\Gurney_Stop.ska" descChecksum = Gurney_Stop 
		<LoadFunction> <...> name = "anims\\THPS6_Veh_Gurney\\Gurney_grind_init.ska" descChecksum = Gurney_grind_init 
		<LoadFunction> <...> name = "anims\\THPS6_Veh_Gurney\\Gurney_grind_range.ska" descChecksum = Gurney_grind_range 
		<LoadFunction> <...> name = "anims\\THPS6_Veh_Gurney\\Gurney_grind_out.ska" descChecksum = Gurney_grind_out 
		<LoadFunction> <...> name = "anims\\THPS6_Veh_Gurney\\default.ska" descChecksum = default 
		<LoadFunction> <...> name = "anims\\THPS6_Veh_Gurney\\Gurney_Stand_Idle_Rider.ska" descChecksum = Gurney_Stand_Idle_Rider 
		<LoadFunction> <...> name = "anims\\THPS6_Veh_Gurney\\Gurney_Stand_To_Run_rider.ska" descChecksum = Gurney_Stand_To_Run_rider 
		<LoadFunction> <...> name = "anims\\THPS6_Veh_Gurney\\Gurney_Run_Rider.ska" descChecksum = Gurney_Run_Rider 
		<LoadFunction> <...> name = "anims\\THPS6_Veh_Gurney\\Gurney_Run_1_Rider.ska" descChecksum = Gurney_Run_1_Rider 
		<LoadFunction> <...> name = "anims\\THPS6_Veh_Gurney\\Gurney_Run_TurnLeft_Rider.ska" descChecksum = Gurney_Run_TurnLeft_Rider 
		<LoadFunction> <...> name = "anims\\THPS6_Veh_Gurney\\Gurney_Run_TurnRight_Rider.ska" descChecksum = Gurney_Run_TurnRight_Rider 
		<LoadFunction> <...> name = "anims\\THPS6_Veh_Gurney\\Gurney_Bump_Rider.ska" descChecksum = Gurney_Bump_Rider 
		<LoadFunction> <...> name = "anims\\THPS6_Veh_Gurney\\Gurney_Ollie_Rider.ska" descChecksum = Gurney_Ollie_Rider 
		<LoadFunction> <...> name = "anims\\THPS6_Veh_Gurney\\Gurney_AirIdle_Rider.ska" descChecksum = Gurney_AirIdle_Rider 
		<LoadFunction> <...> name = "anims\\THPS6_Veh_Gurney\\Gurney_Land_Rider.ska" descChecksum = Gurney_Land_Rider 
		<LoadFunction> <...> name = "anims\\THPS6_Veh_Gurney\\Gurney_stop_rider.ska" descChecksum = Gurney_stop_rider 
		<LoadFunction> <...> name = "anims\\THPS6_Veh_Gurney\\Gurney_grind_init_rider.ska" descChecksum = Gurney_grind_init_rider 
		<LoadFunction> <...> name = "anims\\THPS6_Veh_Gurney\\Gurney_grind_range_rider.ska" descChecksum = Gurney_grind_range_rider 
		<LoadFunction> <...> name = "anims\\THPS6_Veh_Gurney\\Gurney_grind_out_rider.ska" descChecksum = Gurney_grind_out_rider 
	ENDIF 
	SetReferenceChecksum 0 
ENDSCRIPT

SCRIPT animload_THPS6_Veh_MiniKart LoadFunction = LoadAnim 
	SetReferenceChecksum THPS6_human 
	IF <LoadFunction> <...> name = "anims\\THPS6_Veh_MiniKart\\Veh_Minikart_Wheels.ska" descChecksum = Veh_Minikart_Wheels 
		<LoadFunction> <...> name = "anims\\THPS6_Veh_MiniKart\\Veh_Minikart_Idle.ska" descChecksum = Veh_Minikart_Idle 
		<LoadFunction> <...> name = "anims\\THPS6_Veh_MiniKart\\Veh_Minikart_Accel.ska" descChecksum = Veh_Minikart_Accel 
		<LoadFunction> <...> name = "anims\\THPS6_Veh_MiniKart\\Veh_Minikart_Brake.ska" descChecksum = Veh_Minikart_Brake 
		<LoadFunction> <...> name = "anims\\THPS6_Veh_MiniKart\\Veh_Minikart_IdleMoving.ska" descChecksum = Veh_Minikart_IdleMoving 
		<LoadFunction> <...> name = "anims\\THPS6_Veh_MiniKart\\Veh_Minikart_TurnLeft.ska" descChecksum = Veh_Minikart_TurnLeft 
		<LoadFunction> <...> name = "anims\\THPS6_Veh_MiniKart\\Veh_Minikart_TurnLeft_Idle.ska" descChecksum = Veh_Minikart_TurnLeft_Idle 
		<LoadFunction> <...> name = "anims\\THPS6_Veh_MiniKart\\Veh_Minikart_TurnRight.ska" descChecksum = Veh_Minikart_TurnRight 
		<LoadFunction> <...> name = "anims\\THPS6_Veh_MiniKart\\Veh_Minikart_TurnRight_Idle.ska" descChecksum = Veh_Minikart_TurnRight_Idle 
		<LoadFunction> <...> name = "anims\\THPS6_Veh_MiniKart\\Veh_Minikart_Ollie.ska" descChecksum = Veh_Minikart_Ollie 
		<LoadFunction> <...> name = "anims\\THPS6_Veh_MiniKart\\Veh_Minikart_AirIdle.ska" descChecksum = Veh_Minikart_AirIdle 
		<LoadFunction> <...> name = "anims\\THPS6_Veh_MiniKart\\Veh_Minikart_Land.ska" descChecksum = Veh_Minikart_Land 
		<LoadFunction> <...> name = "anims\\THPS6_Veh_MiniKart\\Veh_Minikart_Bump.ska" descChecksum = Veh_Minikart_Bump 
		<LoadFunction> <...> name = "anims\\THPS6_Veh_MiniKart\\Veh_Minikart_Wheelie_Init.ska" descChecksum = Veh_Minikart_Wheelie_Init 
		<LoadFunction> <...> name = "anims\\THPS6_Veh_MiniKart\\Veh_Minikart_Wheelie_Range.ska" descChecksum = Veh_Minikart_Wheelie_Range 
		<LoadFunction> <...> name = "anims\\THPS6_Veh_MiniKart\\Veh_Minikart_Revert.ska" descChecksum = Veh_Minikart_Revert 
		<LoadFunction> <...> name = "anims\\THPS6_Veh_MiniKart\\Veh_Minikart_Grind_Init.ska" descChecksum = Veh_Minikart_Grind_Init 
		<LoadFunction> <...> name = "anims\\THPS6_Veh_MiniKart\\Veh_Minikart_Grind_Range.ska" descChecksum = Veh_Minikart_Grind_Range 
		<LoadFunction> <...> name = "anims\\THPS6_Veh_MiniKart\\Veh_Minikart_Grind_Out.ska" descChecksum = Veh_Minikart_Grind_Out 
		<LoadFunction> <...> name = "anims\\THPS6_Veh_MiniKart\\Veh_Minikart_WallPlant.ska" descChecksum = Veh_Minikart_WallPlant 
		<LoadFunction> <...> name = "anims\\THPS6_Veh_MiniKart\\Veh_Minikart_FlipTrick.ska" descChecksum = Veh_Minikart_FlipTrick 
		<LoadFunction> <...> name = "anims\\THPS6_Veh_MiniKart\\Veh_Minikart_GrabTrick_Init.ska" descChecksum = Veh_Minikart_GrabTrick_Init 
		<LoadFunction> <...> name = "anims\\THPS6_Veh_MiniKart\\Veh_Minikart_GrabTrick_Idle.ska" descChecksum = Veh_Minikart_GrabTrick_Idle 
		<LoadFunction> <...> name = "anims\\THPS6_Veh_MiniKart\\Veh_Minikart_GrabTrick_Out.ska" descChecksum = Veh_Minikart_GrabTrick_Out 
		<LoadFunction> <...> name = "anims\\THPS6_Veh_MiniKart\\Veh_Minikart_GetUp.ska" descChecksum = Veh_Minikart_GetUp 
	ENDIF 
	SetReferenceChecksum 0 
ENDSCRIPT

SCRIPT animload_THPS6_Veh_MotoSkateboard LoadFunction = LoadAnim 
	SetReferenceChecksum THPS6_human 
	IF <LoadFunction> <...> name = "anims\\THPS6_Veh_MotoSkateboard\\MotoSkateboard_StationaryIdle.ska" descChecksum = MotoSkateboard_StationaryIdle 
		<LoadFunction> <...> name = "anims\\THPS6_Veh_MotoSkateboard\\MotoSkateboard_Accel.ska" descChecksum = MotoSkateboard_Accel 
		<LoadFunction> <...> name = "anims\\THPS6_Veh_MotoSkateboard\\MotoSkateboard_Brake.ska" descChecksum = MotoSkateboard_Brake 
		<LoadFunction> <...> name = "anims\\THPS6_Veh_MotoSkateboard\\MotoSkateboard_MovingIdle.ska" descChecksum = MotoSkateboard_MovingIdle 
		<LoadFunction> <...> name = "anims\\THPS6_Veh_MotoSkateboard\\MotoSkateboard_TurnRight.ska" descChecksum = MotoSkateboard_TurnRight 
		<LoadFunction> <...> name = "anims\\THPS6_Veh_MotoSkateboard\\MotoSkateboard_TurnRightIdle.ska" descChecksum = MotoSkateboard_TurnRightIdle 
		<LoadFunction> <...> name = "anims\\THPS6_Veh_MotoSkateboard\\MotoSkateboard_TurnLeft.ska" descChecksum = MotoSkateboard_TurnLeft 
		<LoadFunction> <...> name = "anims\\THPS6_Veh_MotoSkateboard\\MotoSkateboard_TurnLeftIdle.ska" descChecksum = MotoSkateboard_TurnLeftIdle 
		<LoadFunction> <...> name = "anims\\THPS6_Veh_MotoSkateboard\\MotoSkateboard_Manual_init.ska" descChecksum = MotoSkateboard_Manual_init 
		<LoadFunction> <...> name = "anims\\THPS6_Veh_MotoSkateboard\\MotoSkateboard_Manual_Range.ska" descChecksum = MotoSkateboard_Manual_Range 
		<LoadFunction> <...> name = "anims\\THPS6_Veh_MotoSkateboard\\MotoSkateboard_Revert.ska" descChecksum = MotoSkateboard_Revert 
		<LoadFunction> <...> name = "anims\\THPS6_Veh_MotoSkateboard\\MotoSkateboard_ollie.ska" descChecksum = MotoSkateboard_ollie 
		<LoadFunction> <...> name = "anims\\THPS6_Veh_MotoSkateboard\\MotoSkateboard_AIrIdle.ska" descChecksum = MotoSkateboard_AIrIdle 
		<LoadFunction> <...> name = "anims\\THPS6_Veh_MotoSkateboard\\MotoSkateboard_Land.ska" descChecksum = MotoSkateboard_Land 
		<LoadFunction> <...> name = "anims\\THPS6_Veh_MotoSkateboard\\MotoSkateboard_GrabTrick_init.ska" descChecksum = MotoSkateboard_GrabTrick_init 
		<LoadFunction> <...> name = "anims\\THPS6_Veh_MotoSkateboard\\MotoSkateboard_GrabTrick_Idle.ska" descChecksum = MotoSkateboard_GrabTrick_Idle 
		<LoadFunction> <...> name = "anims\\THPS6_Veh_MotoSkateboard\\MotoSkateboard_FlipTrick.ska" descChecksum = MotoSkateboard_FlipTrick 
		<LoadFunction> <...> name = "anims\\THPS6_Veh_MotoSkateboard\\MotoSkateboard_WallPlant.ska" descChecksum = MotoSkateboard_WallPlant 
		<LoadFunction> <...> name = "anims\\THPS6_Veh_MotoSkateboard\\MotoSkateboard_Getup.ska" descChecksum = MotoSkateboard_Getup 
		<LoadFunction> <...> name = "anims\\THPS6_Veh_MotoSkateboard\\MotoSkateboard_Bump.ska" descChecksum = MotoSkateboard_Bump 
	ENDIF 
	SetReferenceChecksum 0 
ENDSCRIPT

SCRIPT animload_THPS6_Veh_Segway LoadFunction = LoadAnim 
	SetReferenceChecksum THPS6_human 
	IF <LoadFunction> <...> name = "anims\\THPS6_Veh_Segway\\Segway_Idle.ska" descChecksum = Segway_Idle 
		<LoadFunction> <...> name = "anims\\THPS6_Veh_Segway\\Segway_Accel.ska" descChecksum = Segway_Accel 
		<LoadFunction> <...> name = "anims\\THPS6_Veh_Segway\\Segway_Stop.ska" descChecksum = Segway_Stop 
		<LoadFunction> <...> name = "anims\\THPS6_Veh_Segway\\Segway_IdletoLeanLeft.ska" descChecksum = Segway_IdletoLeanLeft 
		<LoadFunction> <...> name = "anims\\THPS6_Veh_Segway\\Segway_LeanLeft.ska" descChecksum = Segway_LeanLeft 
		<LoadFunction> <...> name = "anims\\THPS6_Veh_Segway\\Segway_IdletoLeanRight.ska" descChecksum = Segway_IdletoLeanRight 
		<LoadFunction> <...> name = "anims\\THPS6_Veh_Segway\\Segway_LeanRight.ska" descChecksum = Segway_LeanRight 
		<LoadFunction> <...> name = "anims\\THPS6_Veh_Segway\\Segway_Ollie.ska" descChecksum = Segway_Ollie 
		<LoadFunction> <...> name = "anims\\THPS6_Veh_Segway\\Segway_AirIdle.ska" descChecksum = Segway_AirIdle 
		<LoadFunction> <...> name = "anims\\THPS6_Veh_Segway\\Segway_Land.ska" descChecksum = Segway_Land 
		<LoadFunction> <...> name = "anims\\THPS6_Veh_Segway\\Segway_Crouch.ska" descChecksum = Segway_Crouch 
		<LoadFunction> <...> name = "anims\\THPS6_Veh_Segway\\Segway_CrouchtoLeanRight.ska" descChecksum = Segway_CrouchtoLeanRight 
		<LoadFunction> <...> name = "anims\\THPS6_Veh_Segway\\Segway_Crouch_LeanRight.ska" descChecksum = Segway_Crouch_LeanRight 
		<LoadFunction> <...> name = "anims\\THPS6_Veh_Segway\\Segway_CrouchtoLeanLeft.ska" descChecksum = Segway_CrouchtoLeanLeft 
		<LoadFunction> <...> name = "anims\\THPS6_Veh_Segway\\Segway_Crouch_LeanLeft.ska" descChecksum = Segway_Crouch_LeanLeft 
		<LoadFunction> <...> name = "anims\\THPS6_Veh_Segway\\Segway_Grind_Init.ska" descChecksum = Segway_Grind_Init 
		<LoadFunction> <...> name = "anims\\THPS6_Veh_Segway\\Segway_Grind_Range.ska" descChecksum = Segway_Grind_Range 
		<LoadFunction> <...> name = "anims\\THPS6_Veh_Segway\\Segway_Grind_Out.ska" descChecksum = Segway_Grind_Out 
		<LoadFunction> <...> name = "anims\\THPS6_Veh_Segway\\Segway_Trick1_Init.ska" descChecksum = Segway_Trick1_Init 
		<LoadFunction> <...> name = "anims\\THPS6_Veh_Segway\\Segway_Trick1_Idle.ska" descChecksum = Segway_Trick1_Idle 
		<LoadFunction> <...> name = "anims\\THPS6_Veh_Segway\\Segway_Trick1_Out.ska" descChecksum = Segway_Trick1_Out 
		<LoadFunction> <...> name = "anims\\THPS6_Veh_Segway\\Segway_FlipTrick1.ska" descChecksum = Segway_FlipTrick1 
		<LoadFunction> <...> name = "anims\\THPS6_Veh_Segway\\Segway_Wheels_Partial.ska" descChecksum = Segway_Wheels_Partial 
	ENDIF 
	SetReferenceChecksum 0 
ENDSCRIPT

SCRIPT animload_THPS6_Veh_Tricycle LoadFunction = LoadAnim 
	SetReferenceChecksum THPS6_human 
	IF <LoadFunction> <...> name = "anims\\THPS6_Veh_Tricyle\\Tricycle_Idle.ska" descChecksum = Tricycle_Idle 
		<LoadFunction> <...> name = "anims\\THPS6_Veh_Tricyle\\Tricycle_Stand.ska" descChecksum = Tricycle_Stand 
		<LoadFunction> <...> name = "anims\\THPS6_Veh_Tricyle\\Tricycle_Turn_Left.ska" descChecksum = Tricycle_Turn_Left 
		<LoadFunction> <...> name = "anims\\THPS6_Veh_Tricyle\\Tricycle_Turn_Right.ska" descChecksum = Tricycle_Turn_Right 
		<LoadFunction> <...> name = "anims\\THPS6_Veh_Tricyle\\Tricycle_Start.ska" descChecksum = Tricycle_Start 
		<LoadFunction> <...> name = "anims\\THPS6_Veh_Tricyle\\Tricycle_Stop.ska" descChecksum = Tricycle_Stop 
		<LoadFunction> <...> name = "anims\\THPS6_Veh_Tricyle\\Tricycle_Ollie.ska" descChecksum = Tricycle_Ollie 
		<LoadFunction> <...> name = "anims\\THPS6_Veh_Tricyle\\Tricycle_Air_Idle.ska" descChecksum = Tricycle_Air_Idle 
		<LoadFunction> <...> name = "anims\\THPS6_Veh_Tricyle\\Tricycle_Land.ska" descChecksum = Tricycle_Land 
		<LoadFunction> <...> name = "anims\\THPS6_Veh_Tricyle\\Tricycle_GrabTrick_Init.ska" descChecksum = Tricycle_GrabTrick_Init 
		<LoadFunction> <...> name = "anims\\THPS6_Veh_Tricyle\\Tricycle_GrabTrick_Idle.ska" descChecksum = Tricycle_GrabTrick_Idle 
		<LoadFunction> <...> name = "anims\\THPS6_Veh_Tricyle\\Tricycle_GrabTrick_Out.ska" descChecksum = Tricycle_GrabTrick_Out 
		<LoadFunction> <...> name = "anims\\THPS6_Veh_Tricyle\\Tricycle_Wheels.ska" descChecksum = Tricycle_Wheels 
		<LoadFunction> <...> name = "anims\\THPS6_Veh_Tricyle\\Tricycle_Grind_Init.ska" descChecksum = Tricycle_Grind_Init 
		<LoadFunction> <...> name = "anims\\THPS6_Veh_Tricyle\\Tricycle_Grind_Range.ska" descChecksum = Tricycle_Grind_Range 
		<LoadFunction> <...> name = "anims\\THPS6_Veh_Tricyle\\Tricycle_Grind_Out.ska" descChecksum = Tricycle_Grind_Out 
		<LoadFunction> <...> name = "anims\\THPS6_Veh_Tricyle\\Tricycle_Wallplant.ska" descChecksum = Tricycle_Wallplant 
		<LoadFunction> <...> name = "anims\\THPS6_Veh_Tricyle\\Tricycle_Manual.ska" descChecksum = Tricycle_Manual 
		<LoadFunction> <...> name = "anims\\THPS6_Veh_Tricyle\\Tricycle_Manual_Range.ska" descChecksum = Tricycle_Manual_Range 
		<LoadFunction> <...> name = "anims\\THPS6_Veh_Tricyle\\Tricycle_Getup.ska" descChecksum = Tricycle_Getup 
		<LoadFunction> <...> name = "anims\\THPS6_Veh_Tricyle\\Tricycle_Revert.ska" descChecksum = Tricycle_Revert 
		<LoadFunction> <...> name = "anims\\THPS6_Veh_Tricyle\\Tricycle_FlipTrick.ska" descChecksum = Tricycle_FlipTrick 
	ENDIF 
	SetReferenceChecksum 0 
ENDSCRIPT

SCRIPT animload_THPS6_Veh_WheelChair LoadFunction = LoadAnim 
	SetReferenceChecksum THPS6_human 
	IF <LoadFunction> <...> name = "anims\\THPS6_Veh_WheelChair\\WheelChair_Wheels_Partial.ska" descChecksum = WheelChair_Wheels_Partial 
		<LoadFunction> <...> name = "anims\\THPS6_Veh_WheelChair\\Wheelchair_Idle.ska" descChecksum = Wheelchair_Idle 
		<LoadFunction> <...> name = "anims\\THPS6_Veh_WheelChair\\Wheelchair_Attention.ska" descChecksum = Wheelchair_Attention 
		<LoadFunction> <...> name = "anims\\THPS6_Veh_WheelChair\\Wheelchair_Spin.ska" descChecksum = Wheelchair_Spin 
		<LoadFunction> <...> name = "anims\\THPS6_Veh_WheelChair\\Wheelchair_Accel.ska" descChecksum = Wheelchair_Accel 
		<LoadFunction> <...> name = "anims\\THPS6_Veh_WheelChair\\WheelChair_Brake.ska" descChecksum = WheelChair_Brake 
		<LoadFunction> <...> name = "anims\\THPS6_Veh_WheelChair\\Wheelchair_MovingIdle.ska" descChecksum = Wheelchair_MovingIdle 
		<LoadFunction> <...> name = "anims\\THPS6_Veh_WheelChair\\WheelChair_TurnRight.ska" descChecksum = WheelChair_TurnRight 
		<LoadFunction> <...> name = "anims\\THPS6_Veh_WheelChair\\Wheelchair_TurnRight_Idle.ska" descChecksum = Wheelchair_TurnRight_Idle 
		<LoadFunction> <...> name = "anims\\THPS6_Veh_WheelChair\\WheelChair_TurnLeft.ska" descChecksum = WheelChair_TurnLeft 
		<LoadFunction> <...> name = "anims\\THPS6_Veh_WheelChair\\Wheelchair_TurnLeft_Idle.ska" descChecksum = Wheelchair_TurnLeft_Idle 
		<LoadFunction> <...> name = "anims\\THPS6_Veh_WheelChair\\Wheelchair_Manual.ska" descChecksum = Wheelchair_Manual 
		<LoadFunction> <...> name = "anims\\THPS6_Veh_WheelChair\\Wheelchair_Manual_Range.ska" descChecksum = Wheelchair_Manual_Range 
		<LoadFunction> <...> name = "anims\\THPS6_Veh_WheelChair\\Wheelchair_Revert.ska" descChecksum = Wheelchair_Revert 
		<LoadFunction> <...> name = "anims\\THPS6_Veh_WheelChair\\Wheelchair_ollie.ska" descChecksum = Wheelchair_ollie 
		<LoadFunction> <...> name = "anims\\THPS6_Veh_WheelChair\\Wheelchair_AIrIdle.ska" descChecksum = Wheelchair_AIrIdle 
		<LoadFunction> <...> name = "anims\\THPS6_Veh_WheelChair\\Wheelchair_Land.ska" descChecksum = Wheelchair_Land 
		<LoadFunction> <...> name = "anims\\THPS6_Veh_WheelChair\\WheelChair_AirTrick_init.ska" descChecksum = WheelChair_AirTrick_init 
		<LoadFunction> <...> name = "anims\\THPS6_Veh_WheelChair\\WheelChair_AirTrick_Idle.ska" descChecksum = WheelChair_AirTrick_Idle 
		<LoadFunction> <...> name = "anims\\THPS6_Veh_WheelChair\\WheelChair_AirTrick_Out.ska" descChecksum = WheelChair_AirTrick_Out 
		<LoadFunction> <...> name = "anims\\THPS6_Veh_WheelChair\\WheelChair_FlipTrick.ska" descChecksum = WheelChair_FlipTrick 
		<LoadFunction> <...> name = "anims\\THPS6_Veh_WheelChair\\Wheelchair_WallPlant.ska" descChecksum = Wheelchair_WallPlant 
		<LoadFunction> <...> name = "anims\\THPS6_Veh_WheelChair\\Wheelchair_Grind_init.ska" descChecksum = Wheelchair_Grind_init 
		<LoadFunction> <...> name = "anims\\THPS6_Veh_WheelChair\\Wheelchair_Grind_Range.ska" descChecksum = Wheelchair_Grind_Range 
		<LoadFunction> <...> name = "anims\\THPS6_Veh_WheelChair\\Wheelchair_Grind_Out.ska" descChecksum = Wheelchair_Grind_Out 
		<LoadFunction> <...> name = "anims\\THPS6_Veh_WheelChair\\WheelChair_Getup.ska" descChecksum = WheelChair_Getup 
	ENDIF 
	SetReferenceChecksum 0 
ENDSCRIPT

SCRIPT animload_Vallely_Head LoadFunction = LoadAnim 
	SetReferenceChecksum Vallely_Head 
	IF <LoadFunction> <...> name = "anims\\Vallely_Head\\default.ska" descChecksum = default 
		<LoadFunction> <...> name = "anims\\Vallely_Head\\idle.ska" descChecksum = idle 
	ENDIF 
	SetReferenceChecksum 0 
ENDSCRIPT

SCRIPT animload_thugpro LoadFunction = LoadAnim 
	animload_thugpro_0 <...> 
	animload_thugpro_1 <...> 
	animload_thugpro_2 <...> 
	animload_thugpro_3 <...> 
ENDSCRIPT

SCRIPT animload_thugpro_0 LoadFunction = LoadAnim 
	SetReferenceChecksum THPS6_human 
	IF <LoadFunction> <...> name = "anims\\thug1\\skater_basics\\WallPlant_Ollie3.ska" descChecksum = WallPlant_Ollie3 
		<LoadFunction> <...> name = "anims\\thug1\\skater_bails\\GetUpDarthMaul.ska" descChecksum = GetUpDarthMaul 
		<LoadFunction> <...> name = "anims\\thug1\\skater_special\\MistyFlip.ska" descChecksum = mistyflip 
		<LoadFunction> <...> name = "anims\\thug1\\skater_grabtricks\\roastbeef.ska" descChecksum = roastbeef 
		<LoadFunction> <...> name = "anims\\thug1\\skater_grabtricks\\roastbeef_idle.ska" descChecksum = roastbeef_idle 
		<LoadFunction> <...> name = "anims\\thug1\\skater_special\\BlastGrind_Idle.ska" descChecksum = BlastGrind_Idle 
		<LoadFunction> <...> name = "anims\\thug1\\skater_special\\BlastGrind_Init.ska" descChecksum = BlastGrind_Init 
		<LoadFunction> <...> name = "anims\\thug1\\skater_special\\BlastGrind_Out.ska" descChecksum = BlastGrind_Out 
		<LoadFunction> <...> name = "anims\\thug1\\skater_special\\BootBurst_Idle.ska" descChecksum = BootBurst_Idle 
		<LoadFunction> <...> name = "anims\\thug1\\skater_special\\BootBurst_Init.ska" descChecksum = BootBurst_Init 
		<LoadFunction> <...> name = "anims\\thug1\\skater_special\\BootBurst_Out.ska" descChecksum = BootBurst_Out 
		<LoadFunction> <...> name = "anims\\thug1\\skater_special\\Flames_Idle.ska" descChecksum = Flames_Idle 
		<LoadFunction> <...> name = "anims\\thug1\\skater_special\\Flames_Init.ska" descChecksum = Flames_Init 
		<LoadFunction> <...> name = "anims\\thug1\\skater_special\\Flames_Out.ska" descChecksum = Flames_Out 
		<LoadFunction> <...> name = "anims\\thug1\\skater_special\\LickItUp_Idle.ska" descChecksum = LickItUp_Idle 
		<LoadFunction> <...> name = "anims\\thug1\\skater_special\\LickItUp_Init.ska" descChecksum = LickItUp_Init 
		<LoadFunction> <...> name = "anims\\thug1\\skater_special\\LickItUp_Out.ska" descChecksum = LickItUp_Out 
		<LoadFunction> <...> name = "anims\\thug1\\skater_special\\Scanning_Idle.ska" descChecksum = Scanning_Idle 
		<LoadFunction> <...> name = "anims\\thug1\\skater_special\\Scanning_Init.ska" descChecksum = Scanning_Init 
		<LoadFunction> <...> name = "anims\\thug1\\skater_special\\Scanning_Out.ska" descChecksum = Scanning_Out 
		<LoadFunction> <...> name = "anims\\thug1\\skater_special\\_3DScaryGrind_Init.ska" descChecksum = _3DScaryGrind_Init 
		<LoadFunction> <...> name = "anims\\thug1\\skater_special\\_3DScaryGrind_Out.ska" descChecksum = _3DScaryGrind_Out 
		<LoadFunction> <...> name = "anims\\thug1\\skater_special\\_3DScaryGrind_Range.ska" descChecksum = _3DScaryGrind_Range 
		<LoadFunction> <...> name = "anims\\thug1\\skater_special\\_3DSwimAir_Idle.ska" descChecksum = _3DSwimAir_Idle 
		<LoadFunction> <...> name = "anims\\thug1\\skater_special\\_3DSwimAir_Init.ska" descChecksum = _3DSwimAir_Init 
		<LoadFunction> <...> name = "anims\\thug1\\skater_special\\_3DSwimAir_Out.ska" descChecksum = _3DSwimAir_Out 
	ENDIF 
	SetReferenceChecksum 0 
ENDSCRIPT

SCRIPT animload_thugpro_1 LoadFunction = LoadAnim 
	SetReferenceChecksum THPS6_human 
	IF <LoadFunction> <...> name = "anims\\thaw\\pro_idle\\Pro_Idle01.ska" descChecksum = Pro_Idle01 
		<LoadFunction> <...> name = "anims\\thaw\\pro_idle\\Pro_Idle02.ska" descChecksum = Pro_Idle02 
		<LoadFunction> <...> name = "anims\\thaw\\pro_idle\\Pro_Idle03a.ska" descChecksum = Pro_Idle03a 
		<LoadFunction> <...> name = "anims\\thaw\\pro_idle\\Pro_Idle03b.ska" descChecksum = Pro_Idle03b 
		<LoadFunction> <...> name = "anims\\thaw\\pro_idle\\Pro_Idle03to06.ska" descChecksum = Pro_Idle03to06 
		<LoadFunction> <...> name = "anims\\thaw\\pro_idle\\Pro_Idle04a.ska" descChecksum = Pro_Idle04a 
		<LoadFunction> <...> name = "anims\\thaw\\pro_idle\\Pro_Idle04b.ska" descChecksum = Pro_Idle04b 
		<LoadFunction> <...> name = "anims\\thaw\\pro_idle\\Pro_Idle05a.ska" descChecksum = Pro_Idle05a 
		<LoadFunction> <...> name = "anims\\thaw\\pro_idle\\Pro_Idle05b.ska" descChecksum = Pro_Idle05b 
		<LoadFunction> <...> name = "anims\\thaw\\pro_idle\\Pro_Idle05c.ska" descChecksum = Pro_Idle05c 
		<LoadFunction> <...> name = "anims\\thaw\\pro_idle\\Pro_Idle05d.ska" descChecksum = Pro_Idle05d 
		<LoadFunction> <...> name = "anims\\thaw\\pro_idle\\Pro_Idle06a.ska" descChecksum = Pro_Idle06a 
		<LoadFunction> <...> name = "anims\\thaw\\pro_idle\\Pro_Idle06b.ska" descChecksum = Pro_Idle06b 
		<LoadFunction> <...> name = "anims\\thaw\\pro_idle\\Pro_Idle06to03.ska" descChecksum = Pro_Idle06to03 
		<LoadFunction> <...> name = "anims\\THAW\\Skater_Basics\\THPS7_OllieEx_Idle.ska" descChecksum = THPS7_OllieEx_Idle 
		<LoadFunction> <...> name = "anims\\THAW\\Skater_Basics\\THPS7_OllieEx_Out.ska" descChecksum = THPS7_OllieEx_Out 
		<LoadFunction> <...> name = "anims\\thaw\\natas\\Natas_Hstand_In.ska" descChecksum = Natas_Hstand_In 
		<LoadFunction> <...> name = "anims\\thaw\\natas\\Natas_Hstand_Out.ska" descChecksum = Natas_Hstand_Out 
		<LoadFunction> <...> name = "anims\\thaw\\natas\\Natas_Hstand_Range.ska" descChecksum = Natas_Hstand_Range 
		<LoadFunction> <...> name = "anims\\thaw\\natas\\Natas_Lhold_In.ska" descChecksum = Natas_Lhold_In 
		<LoadFunction> <...> name = "anims\\thaw\\natas\\Natas_Lhold_Out.ska" descChecksum = Natas_Lhold_Out 
		<LoadFunction> <...> name = "anims\\thaw\\natas\\Natas_Lhold_Range.ska" descChecksum = Natas_Lhold_Range 
		<LoadFunction> <...> name = "anims\\thaw\\natas\\Natas_OneFoot_In.ska" descChecksum = Natas_OneFoot_In 
		<LoadFunction> <...> name = "anims\\thaw\\natas\\Natas_OneFoot_Out.ska" descChecksum = Natas_OneFoot_Out 
		<LoadFunction> <...> name = "anims\\thaw\\natas\\Natas_OneFoot_Range.ska" descChecksum = Natas_OneFoot_Range 
	ENDIF 
	SetReferenceChecksum 0 
ENDSCRIPT

SCRIPT animload_thugpro_2 LoadFunction = LoadAnim 
	SetReferenceChecksum THPS6_human 
	IF <LoadFunction> <...> name = "anims\\thug1\\skater_secret\\FrontEnd_Creature.ska" descChecksum = FrontEnd_Creature 
		<LoadFunction> <...> name = "anims\\thug1\\skater_secret\\FrontEnd_Gene.ska" descChecksum = FrontEnd_Gene 
		<LoadFunction> <...> name = "anims\\thug1\\skater_secret\\FrontEnd_IronMan.ska" descChecksum = FrontEnd_IronMan 
		<LoadFunction> <...> name = "anims\\thug1\\skater_special\\chomponthis_idle.ska" descChecksum = chomponthis_idle 
		<LoadFunction> <...> name = "anims\\thug1\\skater_special\\chomponthis_init.ska" descChecksum = chomponthis_init 
		<LoadFunction> <...> name = "anims\\thug1\\skater_special\\chomponthis_out.ska" descChecksum = chomponthis_out 
		<LoadFunction> <...> name = "anims\\thug1\\skater_secret\\FrontEnd_Creature.ska" descChecksum = FrontEnd_Creature 
		<LoadFunction> <...> name = "anims\\thug1\\skater_secret\\FrontEnd_Gene.ska" descChecksum = FrontEnd_Gene 
		<LoadFunction> <...> name = "anims\\thug1\\skater_secret\\FrontEnd_IronMan.ska" descChecksum = FrontEnd_IronMan 
		<LoadFunction> <...> name = "anims\\thug1\\skater_special\\chomponthis_idle.ska" descChecksum = chomponthis_idle 
		<LoadFunction> <...> name = "anims\\thug1\\skater_special\\chomponthis_init.ska" descChecksum = chomponthis_init 
		<LoadFunction> <...> name = "anims\\thug1\\skater_special\\chomponthis_out.ska" descChecksum = chomponthis_out 
		<LoadFunction> <...> name = "anims\\thug1\\skater_special\\AmericanHeroGrind_Idle.ska" descChecksum = AmericanHeroGrind_Idle 
		<LoadFunction> <...> name = "anims\\thug1\\skater_special\\AmericanHeroGrind_Init.ska" descChecksum = AmericanHeroGrind_Init 
		<LoadFunction> <...> name = "anims\\thug1\\skater_special\\AmericanHeroGrind_Out.ska" descChecksum = AmericanHeroGrind_Out 
		<LoadFunction> <...> name = "anims\\thug1\\skater_special\\AmericanHeroGrind_Range.ska" descChecksum = AmericanHeroGrind_Range 
		<LoadFunction> <...> name = "anims\\thug1\\skater_special\\Handstand5050Grind_Init.ska" descChecksum = Handstand5050Grind_Init 
		<LoadFunction> <...> name = "anims\\thug1\\skater_special\\Handstand5050Grind_Out.ska" descChecksum = Handstand5050Grind_Out 
		<LoadFunction> <...> name = "anims\\thug1\\skater_special\\Handstand5050Grind_Range.ska" descChecksum = Handstand5050Grind_Range 
		<LoadFunction> <...> name = "anims\\thug1\\skater_special\\_1990Invert_Idle.ska" descChecksum = _1990Invert_Idle 
		<LoadFunction> <...> name = "anims\\thug1\\skater_special\\_1990Invert_Init.ska" descChecksum = _1990Invert_Init 
		<LoadFunction> <...> name = "anims\\thug1\\skater_special\\_1990Invert_Out.ska" descChecksum = _1990Invert_Out 
		<LoadFunction> <...> name = "anims\\thug1\\skater_special\\FlipKickDad.ska" descChecksum = FlipKickDad 
		<LoadFunction> <...> name = "anims\\thug1\\skater_special\\FlipKickDad_Init.ska" descChecksum = FlipKickDad_Init 
		<LoadFunction> <...> name = "anims\\thug1\\skater_special\\FlyingSquirrel_Idle.ska" descChecksum = FlyingSquirrel_Idle 
		<LoadFunction> <...> name = "anims\\thug1\\skater_special\\FlyingSquirrel_Init.ska" descChecksum = FlyingSquirrel_Init 
		<LoadFunction> <...> name = "anims\\thug1\\skater_special\\MadonnaNoHands_Idle.ska" descChecksum = MadonnaNoHands_Idle 
		<LoadFunction> <...> name = "anims\\thug1\\skater_special\\MadonnaNoHands.ska" descChecksum = MadonnaNoHands 
		<LoadFunction> <...> name = "anims\\thug1\\skater_special\\Guitar_Init.ska" descChecksum = Guitar_Init 
		<LoadFunction> <...> name = "anims\\thug1\\skater_special\\Guitar_Idle.ska" descChecksum = Guitar_Idle 
	ENDIF 
	SetReferenceChecksum 0 
ENDSCRIPT

SCRIPT animload_thugpro_3 LoadFunction = LoadAnim 
	SetReferenceChecksum THPS6_human 
	IF <LoadFunction> <...> name = "anims\\thug1\\skater_special\\YeaRightSlide_Init.ska" descChecksum = YeaRightSlide_Init 
		<LoadFunction> <...> name = "anims\\thug1\\skater_special\\YeaRightSlide_Out.ska" descChecksum = YeaRightSlide_Out 
		<LoadFunction> <...> name = "anims\\thug1\\skater_special\\YeaRightSlide_Range.ska" descChecksum = YeaRightSlide_Range 
		<LoadFunction> <...> name = "anims\\thug1\\skater_special\\BigVarial.ska" descChecksum = BigVarial 
		<LoadFunction> <...> name = "anims\\thug1\\skater_special\\FlipFlip.ska" descChecksum = FlipFlip 
		<LoadFunction> <...> name = "anims\\thug1\\skater_special\\NollieFlipUnderFlip.ska" descChecksum = NollieFlipUnderflip 
		<LoadFunction> <...> name = "anims\\thug1\\skater_special\\HeadStandManual_Init.ska" descChecksum = HeadStandManual_Init 
		<LoadFunction> <...> name = "anims\\thug1\\skater_special\\HeadStandManual_Range.ska" descChecksum = HeadStandManual_Range 
		<LoadFunction> <...> name = "anims\\thug1\\skater_special\\MuskaManual_Init.ska" descChecksum = MuskaManual_Init 
		<LoadFunction> <...> name = "anims\\thug1\\skater_special\\MuskaManual_Out.ska" descChecksum = MuskaManual_Out 
		<LoadFunction> <...> name = "anims\\thug1\\skater_special\\MuskaManual_Idle.ska" descChecksum = MuskaManual_Idle 
		<LoadFunction> <...> name = "anims\\thug1\\skater_special\\PogoHandstand_Init.ska" descChecksum = PogoHandstand_Init 
		<LoadFunction> <...> name = "anims\\thug1\\skater_special\\PogoHandstand_Out.ska" descChecksum = PogoHandstand_Out 
		<LoadFunction> <...> name = "anims\\thug1\\skater_special\\PogoHandstand_Idle.ska" descChecksum = PogoHandstand_Idle 
		<LoadFunction> <...> name = "anims\\thug1\\skater_special\\ReemoSlide_Init.ska" descChecksum = ReemoSlide_Init 
		<LoadFunction> <...> name = "anims\\thug1\\skater_special\\ReemoSlide_Out.ska" descChecksum = ReemoSlide_Out 
		<LoadFunction> <...> name = "anims\\thug1\\skater_special\\ReemoSlide_Range.ska" descChecksum = ReemoSlide_Range 
		<LoadFunction> <...> name = "anims\\thug1\\skater_special\\FSFeebleLayback_Init.ska" descChecksum = FSFeebleLayback_Init 
		<LoadFunction> <...> name = "anims\\thug1\\skater_special\\FSFeebleLayback_Out.ska" descChecksum = FSFeebleLayback_Out 
		<LoadFunction> <...> name = "anims\\thug1\\skater_special\\FSFeebleLayback_Range.ska" descChecksum = FSFeebleLayback_Range 
		<LoadFunction> <...> name = "anims\\thug1\\skater_special\\jackass.ska" descChecksum = jackass 
		<LoadFunction> <...> name = "anims\\thug1\\skater_special\\_540BoardVarial.ska" descChecksum = _540BoardVarial 
		<LoadFunction> <...> name = "anims\\thug1\\skater_special\\RowleyDarkslide_Init.ska" descChecksum = RowleyDarkslide_Init 
		<LoadFunction> <...> name = "anims\\thug1\\skater_special\\RowleyDarkslide_Out.ska" descChecksum = RowleyDarkslide_Out 
		<LoadFunction> <...> name = "anims\\thug1\\skater_special\\RowleyDarkslide_Range.ska" descChecksum = RowleyDarkslide_Range 
		<LoadFunction> <...> name = "anims\\thug1\\skater_special\\AssumePosition_Init.ska" descChecksum = AssumePosition_Init 
		<LoadFunction> <...> name = "anims\\thug1\\skater_special\\AssumePosition_Idle.ska" descChecksum = AssumePosition_Idle 
		<LoadFunction> <...> name = "anims\\thug1\\skater_special\\CrookedSkull_Init.ska" descChecksum = CrookedSkull_Init 
		<LoadFunction> <...> name = "anims\\thug1\\skater_special\\CrookedSkull_Out.ska" descChecksum = CrookedSkull_Out 
		<LoadFunction> <...> name = "anims\\thug1\\skater_special\\CrookedSkull_Idle.ska" descChecksum = CrookedSkull_Idle 
		<LoadFunction> <...> name = "anims\\thug1\\skater_special\\Layout.ska" descChecksum = Layout 
		<LoadFunction> <...> name = "anims\\thug1\\skater_special\\Primo_Turn.ska" descChecksum = Primo_Turn 
	ENDIF 
	SetReferenceChecksum 0 
ENDSCRIPT

SCRIPT animload_si_pizza LoadFunction = LoadAnim 
	SetReferenceChecksum pizzabox 
	IF <LoadFunction> <...> name = "anims\\thug1\\si_pizza\\chomponthis_idle.ska" descChecksum = chomponthis_idle 
		<LoadFunction> <...> name = "anims\\thug1\\si_pizza\\chomponthis_init.ska" descChecksum = chomponthis_init 
		<LoadFunction> <...> name = "anims\\thug1\\si_pizza\\chomponthis_out.ska" descChecksum = chomponthis_out 
		<LoadFunction> <...> name = "anims\\thug1\\si_pizza\\default.ska" descChecksum = default 
	ENDIF 
	SetReferenceChecksum 0 
ENDSCRIPT

SCRIPT animload_SI_Skull LoadFunction = LoadAnim 
	SetReferenceChecksum SI_Skull 
	IF <LoadFunction> <...> name = "anims\\thug1\\SI_Skull\\CrookedSkull_Init.ska" descChecksum = CrookedSkull_Init 
		<LoadFunction> <...> name = "anims\\thug1\\SI_Skull\\CrookedSkull_Idle.ska" descChecksum = CrookedSkull_Idle 
		<LoadFunction> <...> name = "anims\\thug1\\SI_Skull\\CrookedSkull_Out.ska" descChecksum = CrookedSkull_Out 
		<LoadFunction> <...> name = "anims\\thug1\\SI_Skull\\default.ska" descChecksum = default 
	ENDIF 
	SetReferenceChecksum 0 
ENDSCRIPT

SCRIPT animload_SI_tongue LoadFunction = LoadAnim 
	SetReferenceChecksum SI_tongue 
	IF <LoadFunction> <...> name = "anims\\thug1\\SI_tongue\\LickItUp_Init.ska" descChecksum = LickItUp_Init 
		<LoadFunction> <...> name = "anims\\thug1\\SI_tongue\\LickItUp_Out.ska" descChecksum = LickItUp_Out 
		<LoadFunction> <...> name = "anims\\thug1\\SI_tongue\\LickItUp_Idle.ska" descChecksum = LickItUp_Idle 
		<LoadFunction> <...> name = "anims\\thug1\\SI_tongue\\default.ska" descChecksum = default 
	ENDIF 
	SetReferenceChecksum 0 
ENDSCRIPT

SCRIPT animload_SI_Boombox LoadFunction = LoadAnim 
	SetReferenceChecksum SI_Boombox 
	IF <LoadFunction> <...> name = "anims\\thug1\\SI_Boombox\\MuskaManual_Init.ska" descChecksum = MuskaManual_Init 
		<LoadFunction> <...> name = "anims\\thug1\\SI_Boombox\\MuskaManual_Idle.ska" descChecksum = MuskaManual_Idle 
		<LoadFunction> <...> name = "anims\\thug1\\SI_Boombox\\MuskaManual_Out.ska" descChecksum = MuskaManual_Out 
		<LoadFunction> <...> name = "anims\\thug1\\SI_Boombox\\default.ska" descChecksum = default 
	ENDIF 
	SetReferenceChecksum 0 
ENDSCRIPT

SCRIPT animload_SI_Flag2 LoadFunction = LoadAnim 
	SetReferenceChecksum SI_Flag 
	IF <LoadFunction> <...> name = "anims\\thug1\\si_flag\\AmericanHeroGrind_Idle.ska" descChecksum = AmericanHeroGrind_Idle 
		<LoadFunction> <...> name = "anims\\thug1\\si_flag\\AmericanHeroGrind_Init.ska" descChecksum = AmericanHeroGrind_Init 
		<LoadFunction> <...> name = "anims\\thug1\\si_flag\\AmericanHeroGrind_Out.ska" descChecksum = AmericanHeroGrind_Out 
		<LoadFunction> <...> name = "anims\\thug1\\si_flag\\AmericanHeroGrind_Range.ska" descChecksum = AmericanHeroGrind_Range 
		<LoadFunction> <...> name = "anims\\thug1\\si_flag\\default.ska" descChecksum = default 
	ENDIF 
	SetReferenceChecksum 0 
ENDSCRIPT

SCRIPT animload_si_generic_thugpro 
	SetReferenceChecksum si_generic 
	IF <LoadFunction> <...> name = "anims\\thug1\\si_generic\\Guitar_Init.ska" descChecksum = Guitar_Init 
		<LoadFunction> <...> name = "anims\\thug1\\si_generic\\Guitar_Idle.ska" descChecksum = Guitar_Idle 
		<LoadFunction> <...> name = "anims\\thug1\\si_generic\\default.ska" descChecksum = default 
	ENDIF 
	SetReferenceChecksum 0 
ENDSCRIPT



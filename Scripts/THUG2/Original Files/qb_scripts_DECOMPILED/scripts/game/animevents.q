
DrumPartialNumber = 1 
SCRIPT GetAnimEventTableName 
	animEventTableName = PedAnimEventTable 
	SWITCH <animType> 
		CASE dog 
			<animEventTableName> = DogAnimEventTable 
	ENDSWITCH 
	RETURN animEventTableName = <animEventTableName> 
ENDSCRIPT

SkaterAnimEventTable = { 
	runfromidle = [ 
		{ time = 0.01999999955 event = FootstepScuffSoundEffect } 
	] 
	run = [ 
		{ time = 0.01999999955 event = FootstepRunSoundEffect } 
		{ time = 0.01999999955 event = FootstepParticlesL } 
		{ time = 0.34999999404 event = FootstepRunSoundEffect } 
		{ time = 0.34999999404 event = FootstepParticlesR } 
	] 
	runtoidle = [ 
		{ time = 0.05000000075 event = FootstepScuffSoundEffect } 
		{ time = 0.25000000000 event = FootstepWalkSoundEffect } 
	] 
	run1 = [ 
		{ time = 0.01999999955 event = FootstepRunSoundEffect } 
		{ time = 0.34999999404 event = FootstepRunSoundEffect } 
	] 
	runjumpidle = [ 
		{ time = 0.01999999955 event = FootstepRunSoundEffect } 
		{ time = 0.34999999404 event = FootstepRunSoundEffect } 
		{ time = 0.66000002623 event = FootstepRunSoundEffect } 
	] 
	runjumpland = [ 
		{ time = 0.01999999955 event = FootstepRunSoundEffect } 
		{ time = 0.34999999404 event = FootstepRunSoundEffect } 
		{ time = 0.66000002623 event = FootstepRunSoundEffect } 
	] 
	bigjumplandtostand = [ 
		{ time = 0.05999999866 event = FootstepLandSoundEffect } 
		{ time = 1.39999997616 event = FootstepScuffSoundEffect } 
	] 
	bigjumplandtorun = [ 
		{ time = 0.05999999866 event = FootstepLandSoundEffect } 
		{ time = 0.30000001192 event = FootstepScuffSoundEffect } 
		{ time = 0.69999998808 event = FootstepRunSoundEffect } 
	] 
	hangontothetop = [ 
		{ time = 1.10000002384 event = FootstepWalkSoundEffect } 
		{ time = 1.70000004768 event = FootstepWalkSoundEffect } 
		{ time = 2.09999990463 event = FootstepScuffSoundEffect } 
	] 
	jumplandtorun = [ 
		{ time = 0.11999999732 event = FootstepLandSoundEffect } 
	] 
	jumplandtostand = [ 
		{ time = 0.01999999955 event = FootstepLandSoundEffect } 
		{ time = 0.50000000000 event = FootstepScuffSoundEffect } 
	] 
	ladderclimb = [ 
		{ time = 0.17000000179 event = FootstepWalkSoundEffect } 
		{ time = 0.69999998808 event = FootstepWalkSoundEffect } 
	] 
	ladderclimbfromstandidle = [ 
		{ time = 0.01999999955 event = FootstepScuffSoundEffect } 
		{ time = 0.50000000000 event = FootstepWalkSoundEffect } 
	] 
	ladderontothetop = [ 
		{ time = 0.30000001192 event = FootstepWalkSoundEffect } 
		{ time = 0.80000001192 event = FootstepWalkSoundEffect } 
		{ time = 1.39999997616 event = FootstepScuffSoundEffect } 
	] 
	runtojump = [ 
		{ time = 0.01999999955 event = FootstepJumpSoundEffect } 
	] 
	standtohang = [ 
		{ time = 0.30000001192 event = FootstepScuffSoundEffect } 
	] 
	standtojump = [ 
		{ time = 0.02999999933 event = FootstepJumpSoundEffect } 
	] 
	standturnleft = [ 
		{ time = 0.01999999955 event = FootstepScuffSoundEffect } 
	] 
	standturnright = [ 
		{ time = 0.05000000075 event = FootstepScuffSoundEffect } 
	] 
	newbraketurnleft = [ 
		{ time = 0.00999999978 event = FootstepScuffSoundEffect } 
	] 
	newbraketurnright = [ 
		{ time = 0.00999999978 event = FootstepScuffSoundEffect } 
	] 
	_180runskid = [ 
		{ time = 0.01999999955 event = FootstepRunSoundEffect } 
		{ time = 0.34999999404 event = FootstepScuffSoundEffect } 
		{ time = 0.85000002384 event = FootstepWalkSoundEffect } 
	] 
	skatetostand = [ 
		{ time = 0.01999999955 event = SoundEffect params = { name = FlipTransitionUp01 } } 
		{ time = 0.41999998689 event = FootstepRunSoundEffect } 
		{ time = 0.75000000000 event = FootstepRunSoundEffect } 
		{ time = 1.29999995232 event = FootstepWalkSoundEffect } 
		{ time = 1.50000000000 event = FootstepScuffSoundEffect } 
	] 
	skatetowalk = [ 
		{ time = 0.01999999955 event = SoundEffect params = { name = FlipTransitionUp01 } } 
		{ time = 0.41999998689 event = FootstepRunSoundEffect } 
		{ time = 0.75000000000 event = FootstepWalkSoundEffect } 
	] 
	braketostand = [ 
		{ time = 0.44999998808 event = SoundEffect params = { name = FlipTransitionUp01 } } 
	] 
	slowskatetostand = [ 
		{ time = 0.01999999955 event = SoundEffect params = { name = FlipTransitionUp01 } } 
		{ time = 0.30000001192 event = FootstepRunSoundEffect } 
		{ time = 0.69999998808 event = FootstepWalkSoundEffect } 
		{ time = 1.39999997616 event = FootstepScuffSoundEffect } 
	] 
	walkslow = [ 
		{ time = 0.01999999955 event = FootstepWalkSoundEffect } 
		{ time = 0.01999999955 event = FootstepParticlesL } 
		{ time = 0.51999998093 event = FootstepWalkSoundEffect } 
		{ time = 0.51999998093 event = FootstepParticlesR } 
	] 
	grindnbarf_init = [ 
		{ time = 1.00000000000 event = GenericParticles params = { specialtrick_particles = barf_particles bone = Bone_Jaw dont_orient_toskater = 1 StopEmitAt = 0.20000000298 } } 
	] 
	primohandstand_init = [ 
		{ time = 0.50000000000 event = GenericParticles params = { specialtrick_particles = fire_particles bone = Bone_Board_Root } } 
	] 
	walkfast = [ 
		{ time = 0.01999999955 event = FootstepWalkSoundEffect } 
		{ time = 0.01999999955 event = FootstepParticlesL } 
		{ time = 0.40000000596 event = FootstepWalkSoundEffect } 
		{ time = 0.40000000596 event = FootstepParticlesR } 
	] 
	fastrun = [ 
		{ time = 0.01999999955 event = FootstepRunSoundEffect } 
		{ time = 0.01999999955 event = FootstepParticlesL } 
		{ time = 0.33000001311 event = FootstepRunSoundEffect } 
		{ time = 0.33000001311 event = FootstepParticlesR } 
	] 
	wrun = [ 
		{ time = 0.01999999955 event = FootstepRunSoundEffect } 
		{ time = 0.01999999955 event = FootstepParticlesL } 
		{ time = 0.34999999404 event = FootstepRunSoundEffect } 
		{ time = 0.34999999404 event = FootstepParticlesR } 
	] 
	wruntoskate = [ 
		{ time = 0.01999999955 event = FootstepRunSoundEffect } 
		{ time = 0.01999999955 event = FootstepParticlesL } 
		{ time = 0.34999999404 event = FootstepRunSoundEffect } 
		{ time = 0.34999999404 event = FootstepParticlesR } 
		{ time = 0.51999998093 event = TurnOnSkaterLoopingSound } 
		{ time = 0.51999998093 event = SoundEffect params = { name = FlipTransitionDown01 } } 
	] 
	wskatetorun = [ 
		{ time = 0.01999999955 event = SoundEffect params = { name = FlipTransitionUp01 } } 
		{ time = 0.41999998689 event = FootstepRunSoundEffect } 
		{ time = 0.75000000000 event = FootstepRunSoundEffect } 
	] 
	wstandtorun = [ 
		{ time = 0.01999999955 event = FootstepScuffSoundEffect } 
	] 
	wstandtowalk = [ 
		{ time = 0.01999999955 event = FootstepScuffSoundEffect } 
	] 
	wwalk = [ 
		{ time = 0.01999999955 event = FootstepWalkSoundEffect } 
		{ time = 0.01999999955 event = FootstepParticlesL } 
		{ time = 0.51999998093 event = FootstepWalkSoundEffect } 
		{ time = 0.51999998093 event = FootstepParticlesR } 
	] 
	wwalktostand = [ 
		{ time = 0.05000000075 event = FootstepWalkSoundEffect } 
		{ time = 0.05000000075 event = FootstepParticlesL } 
		{ time = 0.44999998808 event = FootstepScuffSoundEffect } 
	] 
	wallplant_ollie = [ 
		{ time = 0.01999999955 event = FootstepWalkSoundEffect } 
	] 
	wallplant_ollie2 = [ 
		{ time = 0.01999999955 event = FootstepLandSoundEffect } 
	] 
	wallplant_ollie3_flip = [ 
		{ time = 0.01999999955 event = FootstepLandSoundEffect } 
	] 
	wallplant_out = [ 
		{ time = 0.01999999955 event = FootstepLandSoundEffect } 
	] 
	jumpairto5050 = [ 
		{ time = 0.21999999881 event = SoundEffect params = { name = FlipTransitionDown01 } } 
		{ time = 0.34999999404 event = TerrainLandSound } 
		{ time = 0.37999999523 event = TurnOnSkaterLoopingSound } 
	] 
	jumpairtomanual = [ 
		{ time = 0.30000001192 event = SoundEffect params = { name = FlipTransitionDown01 } } 
		{ time = 0.55000001192 event = TurnOnSkaterLoopingSound } 
	] 
	FS_PowerSlide_Init = [ 
		{ time = 0.00000000000 event = SoundEffect params = { name = RevertConc DefPitch = 60 } } 
	] 
	BS_PowerSlide_Init = [ 
		{ time = 0.00000000000 event = SoundEffect params = { name = RevertConc DefPitch = 60 } } 
	] 
	fallback = [ 
		{ time = 0.00999999978 event = BailBoardSoundEffect } 
		{ time = 0.50000000000 event = BailBodyFallSoundEffect } 
		{ time = 0.36000001431 event = BailBodyPunchSoundEffect } 
		{ time = 0.40000000596 event = BailSlapSoundEffect } 
		{ time = 0.80000001192 event = BailBodyFallSoundEffect } 
	] 
	fallback_resume = [ 
		{ time = 0.37999999523 event = FootstepScuffSoundEffect } 
		{ time = 0.44999998808 event = FootstepScuffSoundEffect } 
		{ time = 0.92000001669 event = FootstepWalkSoundEffect } 
		{ time = 1.16999995708 event = FootstepWalkSoundEffect } 
	] 
	slipbackwards = [ 
		{ time = 0.00999999978 event = BailBoardSoundEffect } 
		{ time = 0.40000000596 event = BailBodyFallSoundEffect } 
		{ time = 0.37999999523 event = BailBodyPunchSoundEffect } 
		{ time = 0.60000002384 event = BailBodyFallSoundEffect } 
		{ time = 0.80000001192 event = BailBodyFallSoundEffect } 
	] 
	kneeslide_resume = [ 
		{ time = 0.76999998093 event = FootstepWalkSoundEffect } 
		{ time = 1.16999995708 event = FootstepWalkSoundEffect } 
	] 
	slipforwards = [ 
		{ time = 0.00999999978 event = BailBoardSoundEffect } 
		{ time = 0.34999999404 event = BailBodyFallSoundEffect } 
		{ time = 0.57999998331 event = BailBodyPunchSoundEffect } 
		{ time = 0.60000002384 event = BailSlapSoundEffect } 
		{ time = 0.69999998808 event = BailBodyFallSoundEffect } 
		{ time = 1.00000000000 event = BailBodyFallSoundEffect } 
	] 
	fiftyfiftyfallbackward = [ 
		{ time = 0.00999999978 event = BailBoardSoundEffect } 
		{ time = 0.40000000596 event = BailBodyFallSoundEffect } 
		{ time = 0.37999999523 event = BailBodyPunchSoundEffect } 
		{ time = 0.62999999523 event = BailBodyFallSoundEffect } 
		{ time = 1.00000000000 event = BailSlapSoundEffect } 
	] 
	fiftyfiftyfallforward = [ 
		{ time = 0.00999999978 event = BailBoardSoundEffect } 
		{ time = 0.34000000358 event = BailCrackSoundEffect } 
		{ time = 0.37999999523 event = BailBodyPunchSoundEffect } 
		{ time = 0.40000000596 event = BailBodyFallSoundEffect } 
		{ time = 0.60000002384 event = BailBodyFallSoundEffect } 
		{ time = 1.14999997616 event = FootstepLandSoundEffect } 
		{ time = 1.14999997616 event = BailBodyFallSoundEffect } 
	] 
	nutterfallforward = [ 
		{ time = 0.00999999978 event = BailBoardSoundEffect } 
		{ time = 0.30000001192 event = BailCrackSoundEffect } 
		{ time = 0.30000001192 event = BailBodyPunchSoundEffect } 
		{ time = 0.69999998808 event = BailBodyFallSoundEffect } 
		{ time = 0.89999997616 event = BailBodyFallSoundEffect } 
		{ time = 1.10000002384 event = BailBodyFallSoundEffect } 
	] 
	backwardstest = [ 
		{ time = 0.00999999978 event = BailBoardSoundEffect } 
		{ time = 0.30000001192 event = FootstepRunSoundEffect } 
		{ time = 0.30000001192 event = FootstepScuffSoundEffect } 
		{ time = 0.69999998808 event = FootstepRunSoundEffect } 
		{ time = 0.69999998808 event = FootstepScuffSoundEffect } 
		{ time = 1.25000000000 event = BailBodyPunchSoundEffect } 
		{ time = 1.25000000000 event = BailBodyFallSoundEffect } 
		{ time = 1.33000004292 event = BailSlapSoundEffect } 
		{ time = 1.45000004768 event = BailBodyFallSoundEffect } 
		{ time = 1.79999995232 event = BailBodyFallSoundEffect } 
	] 
	facefall = [ 
		{ time = 0.00999999978 event = BailBoardSoundEffect } 
	] 
	facefallsmallhit = [ 
		{ time = 0.01999999955 event = BailBodyPunchSoundEffect } 
		{ time = 0.05999999866 event = BailSlapSoundEffect } 
		{ time = 0.20000000298 event = BailBodyFallSoundEffect } 
	] 
	facefallbighit = [ 
		{ time = 0.01999999955 event = BailBodyPunchSoundEffect } 
		{ time = 0.05999999866 event = BailSlapSoundEffect } 
		{ time = 0.01999999955 event = BailBodyFallSoundEffect } 
		{ time = 0.25000000000 event = BailBodyFallSoundEffect } 
	] 
	backwardfaceslam = [ 
		{ time = 0.00999999978 event = BailBoardSoundEffect } 
		{ time = 0.37999999523 event = BailBodyPunchSoundEffect } 
		{ time = 0.43000000715 event = BailSlapSoundEffect } 
		{ time = 1.20000004768 event = BailBodyFallSoundEffect } 
	] 
	getupbackwards = [ 
		{ time = 0.30000001192 event = FootstepScuffSoundEffect } 
		{ time = 0.37000000477 event = FootstepScuffSoundEffect } 
		{ time = 0.87000000477 event = FootstepRunSoundEffect } 
		{ time = 0.87999999523 event = FootstepScuffSoundEffect } 
		{ time = 0.93999999762 event = FootstepRunSoundEffect } 
		{ time = 1.39999997616 event = FootstepWalkSoundEffect } 
		{ time = 1.79999995232 event = FootstepWalkSoundEffect } 
	] 
	getupforwards = [ 
		{ time = 0.15000000596 event = FootstepScuffSoundEffect } 
		{ time = 0.50000000000 event = FootstepRunSoundEffect } 
		{ time = 1.10000002384 event = FootstepWalkSoundEffect } 
		{ time = 1.50000000000 event = FootstepWalkSoundEffect } 
	] 
	getupfacing = [ 
		{ time = 0.69999998808 event = FootstepScuffSoundEffect } 
		{ time = 1.20000004768 event = FootstepWalkSoundEffect } 
		{ time = 1.50000000000 event = FootstepWalkSoundEffect } 
	] 
	getupfacesmash = [ 
		{ time = 0.94999998808 event = FootstepRunSoundEffect } 
		{ time = 0.97000002861 event = FootstepScuffSoundEffect } 
		{ time = 1.00000000000 event = FootstepRunSoundEffect } 
		{ time = 1.39999997616 event = FootstepWalkSoundEffect } 
		{ time = 1.60000002384 event = FootstepWalkSoundEffect } 
	] 
	smackwall = [ 
		{ time = 0.01999999955 event = BailBodyPunchSoundEffect } 
		{ time = 0.03999999911 event = BailSlapSoundEffect } 
		{ time = 0.40000000596 event = BailBodyFallSoundEffect } 
		{ time = 0.60000002384 event = BailBodyFallSoundEffect } 
		{ time = 0.80000001192 event = BailBodyFallSoundEffect } 
	] 
	smackwallfeet = [ 
		{ time = 0.07000000030 event = BailBodyPunchSoundEffect } 
		{ time = 0.00999999978 event = FootstepRunSoundEffect } 
		{ time = 0.03999999911 event = FootstepRunSoundEffect } 
		{ time = 0.60000002384 event = BailBodyFallSoundEffect } 
	] 
	smackwallupright = [ 
		{ time = 0.01999999955 event = BailBodyPunchSoundEffect } 
		{ time = 0.03999999911 event = BailSlapSoundEffect } 
		{ time = 0.50000000000 event = BailBodyFallSoundEffect } 
		{ time = 0.69999998808 event = BailBodyFallSoundEffect } 
	] 
	runoutquick = [ 
		{ time = 0.00999999978 event = BailBoardSoundEffect } 
		{ time = 0.34999999404 event = FootstepRunSoundEffect } 
		{ time = 0.44999998808 event = FootstepRunSoundEffect } 
		{ time = 0.44999998808 event = FootstepScuffSoundEffect } 
		{ time = 1.14999997616 event = FootstepWalkSoundEffect } 
		{ time = 1.60000002384 event = FootstepWalkSoundEffect } 
		{ time = 2.00000000000 event = FootstepWalkSoundEffect } 
	] 
	runoutdrop = [ 
		{ time = 0.05000000075 event = FootstepLandSoundEffect } 
		{ time = 0.11999999732 event = FootstepScuffSoundEffect } 
		{ time = 1.50000000000 event = FootstepWalkSoundEffect } 
		{ time = 1.89999997616 event = FootstepWalkSoundEffect } 
	] 
	headfirstsplat = [ 
		{ time = 0.01999999955 event = BailBodyPunchSoundEffect } 
		{ time = 0.09000000358 event = BailSlapSoundEffect } 
		{ time = 0.15000000596 event = BailBodyFallSoundEffect } 
		{ time = 0.55000001192 event = BailBodyFallSoundEffect } 
	] 
	bigdrop = [ 
		{ time = 0.05000000075 event = FootstepLandSoundEffect } 
		{ time = 0.20000000298 event = BailBodyPunchSoundEffect } 
		{ time = 0.28999999166 event = FootstepScuffSoundEffect } 
		{ time = 0.25000000000 event = BailBodyFallSoundEffect } 
		{ time = 0.80000001192 event = BailBodyPunchSoundEffect } 
		{ time = 0.80000001192 event = BailBodyFallSoundEffect } 
		{ time = 1.00000000000 event = BailBodyFallSoundEffect } 
	] 
	shoulders = [ 
		{ time = 0.00999999978 event = BailBoardSoundEffect } 
		{ time = 0.40999999642 event = BailBodyPunchSoundEffect } 
		{ time = 0.40999999642 event = BailBodyFallSoundEffect } 
		{ time = 0.61000001431 event = BailBodyFallSoundEffect } 
		{ time = 0.81000000238 event = BailBodyFallSoundEffect } 
		{ time = 2.00000000000 event = FootstepLandSoundEffect } 
		{ time = 2.00000000000 event = BailBodyFallSoundEffect } 
	] 
	getuphips = [ 
		{ time = 0.10000000149 event = BailBodyFallSoundEffect } 
		{ time = 0.44999998808 event = FootstepScuffSoundEffect } 
		{ time = 1.00000000000 event = FootstepWalkSoundEffect } 
		{ time = 1.50000000000 event = FootstepWalkSoundEffect } 
	] 
	spasmodic = [ 
		{ time = 0.00999999978 event = BailBoardSoundEffect } 
		{ time = 0.30000001192 event = FootstepRunSoundEffect } 
		{ time = 0.30000001192 event = FootstepScuffSoundEffect } 
		{ time = 0.56999999285 event = FootstepRunSoundEffect } 
		{ time = 0.56999999285 event = FootstepScuffSoundEffect } 
		{ time = 0.85000002384 event = BailBodyPunchSoundEffect } 
		{ time = 0.85000002384 event = BailBodyFallSoundEffect } 
		{ time = 0.93999999762 event = BailSlapSoundEffect } 
		{ time = 1.00000000000 event = BailBodyFallSoundEffect } 
	] 
	tailslideout = [ 
		{ time = 0.00999999978 event = BailBoardSoundEffect } 
		{ time = 0.11999999732 event = BailBodyPunchSoundEffect } 
		{ time = 0.17000000179 event = BailSlapSoundEffect } 
		{ time = 0.18999999762 event = BailCrackSoundEffect } 
		{ time = 0.69999998808 event = BailBodyFallSoundEffect } 
		{ time = 1.00000000000 event = BailBodyFallSoundEffect } 
	] 
	getuptailslideout = [ 
		{ time = 1.14999997616 event = FootstepScuffSoundEffect } 
		{ time = 1.25000000000 event = FootstepScuffSoundEffect } 
		{ time = 1.50000000000 event = FootstepWalkSoundEffect } 
		{ time = 1.70000004768 event = FootstepWalkSoundEffect } 
	] 
	splits = [ 
		{ time = 0.07999999821 event = BailBodyPunchSoundEffect } 
		{ time = 0.12999999523 event = BailSlapSoundEffect } 
		{ time = 0.15000000596 event = BailCrackSoundEffect } 
		{ time = 0.89999997616 event = FootstepScuffSoundEffect } 
		{ time = 1.29999995232 event = FootstepWalkSoundEffect } 
	] 
	faceplant = [ 
		{ time = 0.00999999978 event = BailBoardSoundEffect } 
		{ time = 0.37000000477 event = BailBodyPunchSoundEffect } 
		{ time = 0.43999999762 event = BailSlapSoundEffect } 
		{ time = 2.00000000000 event = FootstepScuffSoundEffect } 
		{ time = 2.59999990463 event = FootstepWalkSoundEffect } 
		{ time = 0.60000002384 event = BailBodyFallSoundEffect } 
		{ time = 0.80000001192 event = BailBodyFallSoundEffect } 
	] 
	bail_falling_bck = [ 
		{ time = 0.00999999978 event = BailBoardSoundEffect } 
	] 
	bail_falling_fwd = [ 
		{ time = 0.00999999978 event = BailBoardSoundEffect } 
	] 
	bail_falling_hit_hard = [ 
		{ time = 0.00999999978 event = BailBodyPunchSoundEffect } 
		{ time = 0.00999999978 event = BailBodyFallSoundEffect } 
		{ time = 0.02999999933 event = BailSlapSoundEffect } 
		{ time = 0.55000001192 event = BailSlapSoundEffect } 
		{ time = 0.55000001192 event = BailBodyFallSoundEffect } 
		{ time = 0.75000000000 event = BailBodyFallSoundEffect } 
	] 
	bail_falling_hit_hard_bck = [ 
		{ time = 0.00999999978 event = BailBodyPunchSoundEffect } 
		{ time = 0.00999999978 event = BailBodyFallSoundEffect } 
		{ time = 0.02999999933 event = BailSlapSoundEffect } 
		{ time = 0.55000001192 event = BailSlapSoundEffect } 
		{ time = 0.55000001192 event = BailBodyFallSoundEffect } 
		{ time = 0.75000000000 event = BailBodyFallSoundEffect } 
	] 
	bail_falling_hit_hard_fwd = [ 
		{ time = 0.00999999978 event = BailBodyPunchSoundEffect } 
		{ time = 0.00999999978 event = BailBodyFallSoundEffect } 
		{ time = 0.02999999933 event = BailSlapSoundEffect } 
		{ time = 0.55000001192 event = BailSlapSoundEffect } 
		{ time = 0.55000001192 event = BailBodyFallSoundEffect } 
		{ time = 0.75000000000 event = BailBodyFallSoundEffect } 
	] 
	bail_falling_hit_med = [ 
		{ time = 0.00999999978 event = BailBodyPunchSoundEffect } 
		{ time = 0.00999999978 event = BailBodyFallSoundEffect } 
		{ time = 0.02999999933 event = BailSlapSoundEffect } 
		{ time = 0.50000000000 event = BailBodyFallSoundEffect } 
		{ time = 0.67000001669 event = BailBodyFallSoundEffect } 
	] 
	bail_falling_hit_med_bck = [ 
		{ time = 0.00999999978 event = BailBodyPunchSoundEffect } 
		{ time = 0.00999999978 event = BailBodyFallSoundEffect } 
		{ time = 0.02999999933 event = BailSlapSoundEffect } 
		{ time = 0.50000000000 event = BailBodyFallSoundEffect } 
		{ time = 0.67000001669 event = BailBodyFallSoundEffect } 
	] 
	bail_falling_hit_med_fwd = [ 
		{ time = 0.00999999978 event = BailBodyPunchSoundEffect } 
		{ time = 0.00999999978 event = BailBodyFallSoundEffect } 
		{ time = 0.02999999933 event = BailSlapSoundEffect } 
		{ time = 0.50000000000 event = BailBodyFallSoundEffect } 
		{ time = 0.67000001669 event = BailBodyFallSoundEffect } 
	] 
	bail_falling_LT = [ 
		{ time = 0.00999999978 event = BailBoardSoundEffect } 
	] 
	bail_falling_RT = [ 
		{ time = 0.00999999978 event = BailBoardSoundEffect } 
	] 
	bail_falling_Slide_HitH_LTb = [ 
		{ time = 0.00999999978 event = BailBodyPunchSoundEffect } 
		{ time = 0.00999999978 event = BailBodyFallSoundEffect } 
		{ time = 0.02999999933 event = BailSlapSoundEffect } 
		{ time = 0.55000001192 event = BailSlapSoundEffect } 
		{ time = 0.55000001192 event = BailBodyFallSoundEffect } 
		{ time = 0.75000000000 event = BailBodyFallSoundEffect } 
	] 
	bail_falling_Slide_HitH_LTf = [ 
		{ time = 0.00999999978 event = BailBodyPunchSoundEffect } 
		{ time = 0.00999999978 event = BailBodyFallSoundEffect } 
		{ time = 0.02999999933 event = BailSlapSoundEffect } 
		{ time = 0.55000001192 event = BailSlapSoundEffect } 
		{ time = 0.55000001192 event = BailBodyFallSoundEffect } 
		{ time = 0.75000000000 event = BailBodyFallSoundEffect } 
	] 
	bail_falling_Slide_HitH_RTb = [ 
		{ time = 0.00999999978 event = BailBodyPunchSoundEffect } 
		{ time = 0.00999999978 event = BailBodyFallSoundEffect } 
		{ time = 0.02999999933 event = BailSlapSoundEffect } 
		{ time = 0.55000001192 event = BailSlapSoundEffect } 
		{ time = 0.55000001192 event = BailBodyFallSoundEffect } 
		{ time = 0.75000000000 event = BailBodyFallSoundEffect } 
	] 
	bail_falling_Slide_HitH_RTf = [ 
		{ time = 0.00999999978 event = BailBodyPunchSoundEffect } 
		{ time = 0.00999999978 event = BailBodyFallSoundEffect } 
		{ time = 0.02999999933 event = BailSlapSoundEffect } 
		{ time = 0.55000001192 event = BailSlapSoundEffect } 
		{ time = 0.55000001192 event = BailBodyFallSoundEffect } 
		{ time = 0.75000000000 event = BailBodyFallSoundEffect } 
	] 
	bail_falling_Slide_HitM_LTb = [ 
		{ time = 0.00999999978 event = BailBodyPunchSoundEffect } 
		{ time = 0.00999999978 event = BailBodyFallSoundEffect } 
		{ time = 0.02999999933 event = BailSlapSoundEffect } 
		{ time = 0.50000000000 event = BailBodyFallSoundEffect } 
		{ time = 0.67000001669 event = BailBodyFallSoundEffect } 
	] 
	bail_falling_Slide_HitM_LTf = [ 
		{ time = 0.00999999978 event = BailBodyPunchSoundEffect } 
		{ time = 0.00999999978 event = BailBodyFallSoundEffect } 
		{ time = 0.02999999933 event = BailSlapSoundEffect } 
		{ time = 0.50000000000 event = BailBodyFallSoundEffect } 
		{ time = 0.67000001669 event = BailBodyFallSoundEffect } 
	] 
	bail_falling_Slide_HitM_RTb = [ 
		{ time = 0.00999999978 event = BailBodyPunchSoundEffect } 
		{ time = 0.00999999978 event = BailBodyFallSoundEffect } 
		{ time = 0.02999999933 event = BailSlapSoundEffect } 
		{ time = 0.50000000000 event = BailBodyFallSoundEffect } 
		{ time = 0.67000001669 event = BailBodyFallSoundEffect } 
	] 
	bail_falling_Slide_HitM_RTf = [ 
		{ time = 0.00999999978 event = BailBodyPunchSoundEffect } 
		{ time = 0.00999999978 event = BailBodyFallSoundEffect } 
		{ time = 0.02999999933 event = BailSlapSoundEffect } 
		{ time = 0.50000000000 event = BailBodyFallSoundEffect } 
		{ time = 0.67000001669 event = BailBodyFallSoundEffect } 
	] 
	bail_falling_slide_LTb = [ 
		{ time = 0.00999999978 event = BailBoardSoundEffect } 
	] 
	bail_falling_slide_LTf = [ 
		{ time = 0.00999999978 event = BailBoardSoundEffect } 
	] 
	bail_falling_slide_RTb = [ 
		{ time = 0.00999999978 event = BailBoardSoundEffect } 
	] 
	bail_falling_slide_RTf = [ 
		{ time = 0.00999999978 event = BailBoardSoundEffect } 
	] 
	bail_falling_slide_BCK = [ 
		{ time = 0.00999999978 event = BailBoardSoundEffect } 
	] 
	bail_falling_Slide_HitM_BCK = [ 
		{ time = 0.00999999978 event = BailBodyPunchSoundEffect } 
		{ time = 0.00999999978 event = BailBodyFallSoundEffect } 
		{ time = 0.02999999933 event = BailSlapSoundEffect } 
		{ time = 0.50000000000 event = BailBodyFallSoundEffect } 
		{ time = 0.67000001669 event = BailBodyFallSoundEffect } 
	] 
	bail_falling_Slide_HitH_BCK = [ 
		{ time = 0.00999999978 event = BailBodyPunchSoundEffect } 
		{ time = 0.00999999978 event = BailBodyFallSoundEffect } 
		{ time = 0.02999999933 event = BailSlapSoundEffect } 
		{ time = 0.55000001192 event = BailSlapSoundEffect } 
		{ time = 0.55000001192 event = BailBodyFallSoundEffect } 
		{ time = 0.75000000000 event = BailBodyFallSoundEffect } 
	] 
	flailbail = [ 
		{ time = 0.00999999978 event = BailBoardSoundEffect } 
		{ time = 0.47999998927 event = BailBodyPunchSoundEffect } 
		{ time = 0.54000002146 event = BailSlapSoundEffect } 
		{ time = 0.80000001192 event = BailBodyFallSoundEffect } 
	] 
	flailgetup = [ 
		{ time = 1.50000000000 event = FootstepScuffSoundEffect } 
		{ time = 2.00000000000 event = FootstepScuffSoundEffect } 
		{ time = 2.34999990463 event = FootstepWalkSoundEffect } 
		{ time = 2.70000004768 event = FootstepWalkSoundEffect } 
	] 
	getup_hk_ft = [ 
		{ time = 0.30000001192 event = FootstepWalkSoundEffect } 
		{ time = 0.30000001192 event = FootstepScuffSoundEffect } 
		{ time = 0.73000001907 event = FootstepWalkSoundEffect } 
	] 
	getup_hk_ft_Q = [ 
		{ time = 0.44999998808 event = FootstepWalkSoundEffect } 
		{ time = 0.44999998808 event = FootstepScuffSoundEffect } 
	] 
	getup_sit_ft = [ 
		{ time = 0.47999998927 event = FootstepWalkSoundEffect } 
		{ time = 0.47999998927 event = FootstepScuffSoundEffect } 
		{ time = 0.80000001192 event = FootstepWalkSoundEffect } 
	] 
	getup_sit_ft_t = [ 
		{ time = 0.25000000000 event = CatchBoardSound params = { DefVol = 50 } } 
		{ time = 0.47999998927 event = FootstepWalkSoundEffect } 
		{ time = 0.47999998927 event = FootstepScuffSoundEffect } 
		{ time = 0.75000000000 event = FootstepWalkSoundEffect } 
	] 
	getup_sit_ft_q = [ 
		{ time = 0.51999998093 event = FootstepWalkSoundEffect } 
		{ time = 0.51999998093 event = FootstepScuffSoundEffect } 
		{ time = 0.75000000000 event = FootstepWalkSoundEffect } 
		{ time = 1.00000000000 event = FootstepRunSoundEffect } 
	] 
	getup_hk_LT = [ 
		{ time = 0.60000002384 event = FootstepRunSoundEffect } 
		{ time = 0.07999999821 event = FootstepScuffSoundEffect } 
	] 
	getup_hk_LT_t = [ 
		{ time = 0.00999999978 event = CatchBoardSound params = { DefVol = 50 } } 
		{ time = 0.40000000596 event = FootstepRunSoundEffect } 
		{ time = 0.40000000596 event = FootstepScuffSoundEffect } 
		{ time = 0.69999998808 event = FootstepRunSoundEffect } 
	] 
	getup_hk_LT_Q = [ 
		{ time = 0.20000000298 event = FootstepRunSoundEffect } 
		{ time = 0.20000000298 event = FootstepScuffSoundEffect } 
		{ time = 0.50000000000 event = FootstepWalkSoundEffect } 
		{ time = 0.75000000000 event = FootstepRunSoundEffect } 
	] 
	getup_hk_BK = [ 
		{ time = 0.20000000298 event = FootstepRunSoundEffect } 
		{ time = 0.20000000298 event = FootstepScuffSoundEffect } 
		{ time = 0.51999998093 event = FootstepWalkSoundEffect } 
		{ time = 1.00000000000 event = FootstepRunSoundEffect } 
	] 
	getup_hk_BK_t = [ 
		{ time = 0.10000000149 event = CatchBoardSound params = { DefVol = 50 } } 
		{ time = 0.20000000298 event = FootstepRunSoundEffect } 
		{ time = 0.20000000298 event = FootstepScuffSoundEffect } 
		{ time = 0.50000000000 event = FootstepWalkSoundEffect } 
		{ time = 0.77999997139 event = FootstepRunSoundEffect } 
		{ time = 0.94999998808 event = FootstepRunSoundEffect } 
		{ time = 0.94999998808 event = FootstepScuffSoundEffect } 
	] 
	getup_hk_Bk_Q = [ 
		{ time = 0.20000000298 event = FootstepRunSoundEffect } 
		{ time = 0.20000000298 event = FootstepScuffSoundEffect } 
		{ time = 0.50000000000 event = FootstepWalkSoundEffect } 
		{ time = 0.75000000000 event = FootstepRunSoundEffect } 
	] 
	getup_hk_RT_t = [ 
		{ time = 0.10000000149 event = CatchBoardSound params = { DefVol = 50 } } 
		{ time = 0.40000000596 event = FootstepRunSoundEffect } 
		{ time = 0.40000000596 event = FootstepScuffSoundEffect } 
		{ time = 0.72000002861 event = FootstepRunSoundEffect } 
	] 
	getup_hk_RT_Q = [ 
		{ time = 0.01999999955 event = FootstepScuffSoundEffect } 
		{ time = 0.51999998093 event = FootstepWalkSoundEffect } 
		{ time = 0.51999998093 event = FootstepScuffSoundEffect } 
		{ time = 1.00000000000 event = FootstepRunSoundEffect } 
	] 
	getup_hk_Rt = [ 
		{ time = 0.30000001192 event = FootstepWalkSoundEffect } 
		{ time = 0.30000001192 event = FootstepScuffSoundEffect } 
		{ time = 0.73000001907 event = FootstepWalkSoundEffect } 
	] 
	getup_s_turn180 = [ 
		{ time = 0.30000001192 event = CatchBoardSound params = { DefVol = 50 } } 
		{ time = 0.44999998808 event = FootstepScuffSoundEffect } 
		{ time = 0.69999998808 event = FootstepWalkSoundEffect } 
		{ time = 0.33000001311 event = FootstepScuffSoundEffect } 
		{ time = 1.25000000000 event = FootstepRunSoundEffect } 
		{ time = 1.54999995232 event = FootstepRunSoundEffect } 
	] 
	getup_s_nopushoff = [ 
		{ time = 0.30000001192 event = FootstepWalkSoundEffect } 
		{ time = 0.33000001311 event = FootstepScuffSoundEffect } 
	] 
	Bail_manual_bk = [ 
		{ time = 0.01999999955 event = BailBoardSoundEffect } 
		{ time = 0.44999998808 event = BailBodyPunchSoundEffect } 
		{ time = 0.54000002146 event = BailSlapSoundEffect } 
		{ time = 0.87000000477 event = BailBodyFallSoundEffect } 
		{ time = 1.07000005245 event = BailBodyFallSoundEffect } 
		{ time = 1.58000004292 event = SoundEffect params = { name = BailBodyPunch02_11 } } 
	] 
	Bail_manual_bk_fast = [ 
		{ time = 0.01999999955 event = BailBoardSoundEffect } 
		{ time = 0.44999998808 event = BailBodyPunchSoundEffect } 
		{ time = 0.54000002146 event = BailSlapSoundEffect } 
		{ time = 0.87000000477 event = BailBodyFallSoundEffect } 
		{ time = 1.07000005245 event = BailBodyFallSoundEffect } 
		{ time = 2.09999990463 event = SoundEffect params = { name = BailBodyPunch02_11 } } 
	] 
	Bail_manual_Ft = [ 
		{ time = 0.00999999978 event = BailBoardSoundEffect } 
		{ time = 0.37999999523 event = BailBodyPunchSoundEffect } 
		{ time = 0.44999998808 event = BailSlapSoundEffect } 
		{ time = 0.85000002384 event = BailBodyFallSoundEffect } 
		{ time = 1.04999995232 event = BailBodyFallSoundEffect } 
	] 
	Bail_manual_Ft_fast = [ 
		{ time = 0.00999999978 event = BailBoardSoundEffect } 
		{ time = 0.37999999523 event = BailBodyPunchSoundEffect } 
		{ time = 0.44999998808 event = BailSlapSoundEffect } 
		{ time = 0.85000002384 event = BailBodyFallSoundEffect } 
		{ time = 1.04999995232 event = BailBodyFallSoundEffect } 
	] 
	manualback = [ 
		{ time = 0.01999999955 event = BailBoardSoundEffect } 
		{ time = 0.51999998093 event = BailBodyPunchSoundEffect } 
		{ time = 0.61000001431 event = BailSlapSoundEffect } 
		{ time = 1.58000004292 event = SoundEffect params = { name = BailBodyPunch02_11 } } 
	] 
	manualgetup = [ 
		{ time = 1.10000002384 event = FootstepWalkSoundEffect } 
		{ time = 1.60000002384 event = FootstepWalkSoundEffect } 
		{ time = 2.18000006676 event = FootstepScuffSoundEffect } 
		{ time = 2.27999997139 event = FootstepScuffSoundEffect } 
		{ time = 2.22000002861 event = FootstepRunSoundEffect } 
		{ time = 2.31999993324 event = FootstepRunSoundEffect } 
	] 
	manualforwards = [ 
		{ time = 0.00999999978 event = BailBoardSoundEffect } 
		{ time = 0.37999999523 event = BailBodyPunchSoundEffect } 
		{ time = 0.44999998808 event = BailSlapSoundEffect } 
		{ time = 0.85000002384 event = BailBodyFallSoundEffect } 
		{ time = 1.04999995232 event = BailBodyFallSoundEffect } 
	] 
	manual_fgetup = [ 
		{ time = 0.69999998808 event = FootstepWalkSoundEffect } 
		{ time = 1.50000000000 event = FootstepRunSoundEffect } 
		{ time = 1.50000000000 event = FootstepScuffSoundEffect } 
		{ time = 1.95000004768 event = FootstepRunSoundEffect } 
		{ time = 2.31999993324 event = FootstepWalkSoundEffect } 
	] 
	nutsac = [ 
		{ time = 0.20000000298 event = BailBodyPunchSoundEffect } 
		{ time = 0.27000001073 event = BailSlapSoundEffect } 
		{ time = 0.33000001311 event = BailCrackSoundEffect } 
		{ time = 0.89999997616 event = BailBodyFallSoundEffect } 
		{ time = 1.10000002384 event = BailBodyFallSoundEffect } 
	] 
	bail_nutter_fwd = [ 
		{ time = 0.00999999978 event = BailBoardSoundEffect } 
		{ time = 0.40000000596 event = BailBodyPunchSoundEffect } 
		{ time = 0.46999999881 event = BailSlapSoundEffect } 
		{ time = 0.52999997139 event = BailCrackSoundEffect } 
		{ time = 1.10000002384 event = BailBodyFallSoundEffect } 
		{ time = 1.50000000000 event = BailBodyFallSoundEffect } 
		{ time = 1.70000004768 event = BailBodyFallSoundEffect } 
	] 
	bail_nutter_bck = [ 
		{ time = 0.00999999978 event = BailBoardSoundEffect } 
		{ time = 0.40000000596 event = BailBodyPunchSoundEffect } 
		{ time = 0.46999999881 event = BailSlapSoundEffect } 
		{ time = 0.52999997139 event = BailCrackSoundEffect } 
		{ time = 0.80000001192 event = BailBodyFallSoundEffect } 
		{ time = 1.20000004768 event = BailBodyFallSoundEffect } 
		{ time = 1.39999997616 event = BailBodyFallSoundEffect } 
	] 
	bail_pitch_nose = [ 
		{ time = 0.10000000149 event = BailBodyPunchSoundEffect } 
		{ time = 0.10000000149 event = BailSlapSoundEffect } 
		{ time = 0.60000002384 event = BailBodyFallSoundEffect } 
		{ time = 1.20000004768 event = BailBodyFallSoundEffect } 
	] 
	bail_pitch_back = [ 
		{ time = 0.21999999881 event = BailBodyPunchSoundEffect } 
		{ time = 0.31000000238 event = BailSlapSoundEffect } 
		{ time = 0.40000000596 event = BailBodyFallSoundEffect } 
		{ time = 1.00000000000 event = SoundEffect params = { name = BailBodyPunch02_11 } } 
	] 
	bail_pitch_face = [ 
		{ time = 0.18000000715 event = BailBodyPunchSoundEffect } 
		{ time = 0.25000000000 event = BailSlapSoundEffect } 
		{ time = 0.50000000000 event = BailBodyFallSoundEffect } 
		{ time = 0.64999997616 event = BailBodyFallSoundEffect } 
	] 
	bail_pitch_tail = [ 
		{ time = 0.21999999881 event = BailBodyPunchSoundEffect } 
		{ time = 0.31000000238 event = BailSlapSoundEffect } 
		{ time = 0.40000000596 event = BailBodyFallSoundEffect } 
		{ time = 1.20000004768 event = SoundEffect params = { name = BailBodyPunch02_11 } } 
	] 
	railbail = [ 
		{ time = 0.00999999978 event = BailBoardSoundEffect } 
	] 
	railbailgetup = [ 
		{ time = 0.33000001311 event = FootstepScuffSoundEffect } 
		{ time = 1.00000000000 event = FootstepWalkSoundEffect } 
		{ time = 2.04999995232 event = FootstepWalkSoundEffect } 
		{ time = 2.50000000000 event = FootstepWalkSoundEffect } 
	] 
	railbailhitground = [ 
		{ time = 0.01999999955 event = BailBodyPunchSoundEffect } 
		{ time = 0.10000000149 event = BailSlapSoundEffect } 
		{ time = 0.40000000596 event = BailBodyFallSoundEffect } 
	] 
	bail_ramp_Lt = [ 
		{ time = 0.00999999978 event = BailBoardSoundEffect } 
		{ time = 0.25000000000 event = FootstepRunSoundEffect } 
		{ time = 0.25000000000 event = FootstepScuffSoundEffect } 
		{ time = 0.50000000000 event = FootstepRunSoundEffect } 
		{ time = 0.50000000000 event = FootstepScuffSoundEffect } 
		{ time = 0.69999998808 event = BailBodyPunchSoundEffect } 
		{ time = 0.69999998808 event = BailBodyFallSoundEffect } 
		{ time = 0.85000002384 event = BailSlapSoundEffect } 
	] 
	bail_ramp_rt = [ 
		{ time = 0.00999999978 event = BailBoardSoundEffect } 
		{ time = 0.37999999523 event = BailBodyPunchSoundEffect } 
		{ time = 0.44999998808 event = BailSlapSoundEffect } 
		{ time = 0.75000000000 event = BailBodyFallSoundEffect } 
		{ time = 0.94999998808 event = BailBodyFallSoundEffect } 
	] 
	bail_ramp_bk_hd = [ 
		{ time = 0.00999999978 event = BailBoardSoundEffect } 
		{ time = 0.31000000238 event = BailBodyPunchSoundEffect } 
		{ time = 0.31000000238 event = BailBodyFallSoundEffect } 
		{ time = 0.33000001311 event = BailSlapSoundEffect } 
		{ time = 0.85000002384 event = BailSlapSoundEffect } 
		{ time = 0.85000002384 event = BailBodyFallSoundEffect } 
		{ time = 1.42999994755 event = BailBodyFallSoundEffect } 
	] 
	bail_ramp_Rt_med = [ 
		{ time = 0.20000000298 event = BailBodyPunchSoundEffect } 
		{ time = 0.20000000298 event = BailBodyFallSoundEffect } 
		{ time = 0.23000000417 event = BailSlapSoundEffect } 
		{ time = 0.69999998808 event = BailBodyFallSoundEffect } 
		{ time = 0.87000000477 event = BailBodyFallSoundEffect } 
	] 
	bail_ramp_Lt_Med = [ 
		{ time = 0.00999999978 event = BailBoardSoundEffect } 
		{ time = 0.31000000238 event = BailBodyPunchSoundEffect } 
		{ time = 0.31000000238 event = BailBodyFallSoundEffect } 
		{ time = 0.33000001311 event = BailSlapSoundEffect } 
		{ time = 0.57999998331 event = BailBodyFallSoundEffect } 
		{ time = 0.75000000000 event = BailBodyFallSoundEffect } 
	] 
	bail_ramp_bk = [ 
		{ time = 0.21999999881 event = BailBodyPunchSoundEffect } 
		{ time = 0.31000000238 event = BailSlapSoundEffect } 
		{ time = 0.40000000596 event = BailBodyFallSoundEffect } 
		{ time = 1.50000000000 event = FootstepLandSoundEffect } 
	] 
	bail_ramp_ft_hd = [ 
		{ time = 0.20999999344 event = BailBodyPunchSoundEffect } 
		{ time = 0.20999999344 event = BailBodyFallSoundEffect } 
		{ time = 0.23000000417 event = BailSlapSoundEffect } 
		{ time = 0.80000001192 event = BailBodyFallSoundEffect } 
		{ time = 1.00000000000 event = BailBodyFallSoundEffect } 
		{ time = 1.25000000000 event = BailBodyFallSoundEffect } 
	] 
	bail_ramp_ft_med = [ 
		{ time = 0.00999999978 event = BailBoardSoundEffect } 
		{ time = 0.31000000238 event = BailBodyPunchSoundEffect } 
		{ time = 0.31000000238 event = BailBodyFallSoundEffect } 
		{ time = 0.33000001311 event = BailSlapSoundEffect } 
		{ time = 0.75000000000 event = BailBodyFallSoundEffect } 
	] 
	bail_ramp_ft = [ 
		{ time = 0.00999999978 event = BailBoardSoundEffect } 
		{ time = 0.50999999046 event = BailBodyPunchSoundEffect } 
		{ time = 0.50999999046 event = BailBodyFallSoundEffect } 
		{ time = 0.52999997139 event = BailSlapSoundEffect } 
		{ time = 0.98000001907 event = BailBodyFallSoundEffect } 
	] 
	bail_ramp_lt_hd = [ 
		{ time = 0.00999999978 event = BailBoardSoundEffect } 
		{ time = 0.50999999046 event = BailBodyPunchSoundEffect } 
		{ time = 0.50999999046 event = BailBodyFallSoundEffect } 
		{ time = 0.52999997139 event = BailSlapSoundEffect } 
		{ time = 0.98000001907 event = BailBodyFallSoundEffect } 
	] 
	bail_ramp_rt_hd = [ 
		{ time = 0.00999999978 event = BailBoardSoundEffect } 
		{ time = 0.10000000149 event = FootstepRunSoundEffect } 
		{ time = 0.25000000000 event = FootstepRunSoundEffect } 
		{ time = 0.37999999523 event = FootstepRunSoundEffect } 
		{ time = 0.37999999523 event = FootstepScuffSoundEffect } 
		{ time = 0.81000000238 event = BailBodyPunchSoundEffect } 
		{ time = 0.81000000238 event = BailBodyFallSoundEffect } 
		{ time = 0.82999998331 event = BailSlapSoundEffect } 
		{ time = 1.17999994755 event = BailBodyFallSoundEffect } 
	] 
	bail_runout_old = [ 
		{ time = 0.00999999978 event = BailBoardSoundEffect } 
		{ time = 0.30000001192 event = BailBoardSoundEffect } 
		{ time = 0.18000000715 event = FootstepRunSoundEffect } 
		{ time = 0.60000002384 event = FootstepRunSoundEffect } 
		{ time = 0.97000002861 event = FootstepScuffSoundEffect } 
		{ time = 1.50000000000 event = FootstepWalkSoundEffect } 
		{ time = 2.09999990463 event = FootstepWalkSoundEffect } 
		{ time = 2.48000001907 event = FootstepWalkSoundEffect } 
	] 
	bail_runout_new_a = [ 
		{ time = 0.00999999978 event = BailBoardSoundEffect } 
		{ time = 0.30000001192 event = BailBoardSoundEffect } 
		{ time = 0.18000000715 event = FootstepRunSoundEffect } 
		{ time = 0.60000002384 event = FootstepRunSoundEffect } 
		{ time = 0.97000002861 event = FootstepScuffSoundEffect } 
		{ time = 1.50000000000 event = FootstepWalkSoundEffect } 
		{ time = 2.09999990463 event = FootstepWalkSoundEffect } 
		{ time = 2.48000001907 event = FootstepWalkSoundEffect } 
	] 
	runout_drop_land_med = [ 
		{ time = 0.01999999955 event = BailBodyPunchSoundEffect } 
		{ time = 0.03999999911 event = BailSlapSoundEffect } 
		{ time = 0.50000000000 event = BailBodyFallSoundEffect } 
		{ time = 0.69999998808 event = BailBodyFallSoundEffect } 
	] 
	bail_spin_ccw_hard = [ 
		{ time = 0.00999999978 event = BailBoardSoundEffect } 
		{ time = 0.50999999046 event = BailBodyPunchSoundEffect } 
		{ time = 0.50999999046 event = BailBodyFallSoundEffect } 
		{ time = 0.52999997139 event = BailSlapSoundEffect } 
		{ time = 0.80000001192 event = BailBodyFallSoundEffect } 
	] 
	bail_spin_cw_hard = [ 
		{ time = 0.00999999978 event = BailBoardSoundEffect } 
		{ time = 0.41999998689 event = BailBodyPunchSoundEffect } 
		{ time = 0.41999998689 event = BailBodyFallSoundEffect } 
		{ time = 0.43999999762 event = BailSlapSoundEffect } 
		{ time = 0.60000002384 event = BailBodyFallSoundEffect } 
		{ time = 2.09999990463 event = FootstepLandSoundEffect } 
	] 
	bail_spin_ccw_hard_b = [ 
		{ time = 0.20999999344 event = BailBodyPunchSoundEffect } 
		{ time = 0.20999999344 event = BailBodyFallSoundEffect } 
		{ time = 0.23000000417 event = BailSlapSoundEffect } 
		{ time = 0.68000000715 event = BailBodyFallSoundEffect } 
	] 
	bail_spin_ccw_hard_c = [ 
		{ time = 0.00999999978 event = BailBoardSoundEffect } 
		{ time = 0.41999998689 event = BailBodyPunchSoundEffect } 
		{ time = 0.41999998689 event = BailBodyFallSoundEffect } 
		{ time = 0.43999999762 event = BailSlapSoundEffect } 
		{ time = 0.60000002384 event = BailBodyFallSoundEffect } 
		{ time = 0.80000001192 event = BailBodyFallSoundEffect } 
		{ time = 1.00000000000 event = BailBodyFallSoundEffect } 
	] 
	bail_spin_cw_hard_b = [ 
		{ time = 0.00999999978 event = BailBoardSoundEffect } 
		{ time = 0.50999999046 event = BailBodyPunchSoundEffect } 
		{ time = 0.50999999046 event = BailBodyFallSoundEffect } 
		{ time = 0.52999997139 event = BailSlapSoundEffect } 
		{ time = 0.80000001192 event = BailBodyFallSoundEffect } 
	] 
	bail_spin_cw_hard_a = [ 
		{ time = 0.00999999978 event = BailBoardSoundEffect } 
		{ time = 0.31000000238 event = BailBodyPunchSoundEffect } 
		{ time = 0.31000000238 event = BailBodyFallSoundEffect } 
		{ time = 0.33000001311 event = BailSlapSoundEffect } 
		{ time = 0.69999998808 event = BailBodyFallSoundEffect } 
	] 
	bail_spin_fwd_regular = [ 
		{ time = 0.00999999978 event = BailBoardSoundEffect } 
		{ time = 0.15999999642 event = BailBodyPunchSoundEffect } 
		{ time = 0.15999999642 event = BailBodyFallSoundEffect } 
		{ time = 0.18000000715 event = BailSlapSoundEffect } 
		{ time = 0.75000000000 event = BailBodyFallSoundEffect } 
	] 
	bail_spin_fwd_hard = [ 
		{ time = 0.00999999978 event = BailBoardSoundEffect } 
		{ time = 0.40999999642 event = BailBodyPunchSoundEffect } 
		{ time = 0.40999999642 event = BailBodyFallSoundEffect } 
		{ time = 0.43000000715 event = BailSlapSoundEffect } 
		{ time = 0.50000000000 event = BailBodyFallSoundEffect } 
		{ time = 1.60000002384 event = FootstepLandSoundEffect } 
	] 
	bail_spin_fwd_fast = [ 
		{ time = 0.00999999978 event = BailBoardSoundEffect } 
		{ time = 0.40999999642 event = BailBodyPunchSoundEffect } 
		{ time = 0.40999999642 event = BailBodyFallSoundEffect } 
		{ time = 0.43000000715 event = BailSlapSoundEffect } 
		{ time = 0.50000000000 event = BailBodyFallSoundEffect } 
		{ time = 0.69999998808 event = BailBodyFallSoundEffect } 
		{ time = 0.89999997616 event = BailBodyFallSoundEffect } 
	] 
	bail_spin_bck_regular = [ 
		{ time = 0.00999999978 event = BailBoardSoundEffect } 
		{ time = 0.15999999642 event = BailBodyPunchSoundEffect } 
		{ time = 0.15999999642 event = BailBodyFallSoundEffect } 
		{ time = 0.18000000715 event = BailSlapSoundEffect } 
		{ time = 0.75000000000 event = BailBodyFallSoundEffect } 
	] 
	bail_spin_bck_fast = [ 
		{ time = 0.00999999978 event = BailBoardSoundEffect } 
		{ time = 0.50000000000 event = BailBodyPunchSoundEffect } 
		{ time = 0.50000000000 event = BailBodyFallSoundEffect } 
		{ time = 0.55000001192 event = BailSlapSoundEffect } 
		{ time = 1.00000000000 event = BailBodyFallSoundEffect } 
		{ time = 1.54999995232 event = BailBodyFallSoundEffect } 
		{ time = 1.77999997139 event = BailSlapSoundEffect } 
	] 
	bail_spin_bck_hard = [ 
		{ time = 0.00999999978 event = BailBoardSoundEffect } 
		{ time = 0.15999999642 event = BailBodyPunchSoundEffect } 
		{ time = 0.15999999642 event = BailBodyFallSoundEffect } 
		{ time = 0.30000001192 event = BailSlapSoundEffect } 
		{ time = 0.75000000000 event = BailBodyFallSoundEffect } 
		{ time = 1.60000002384 event = FootstepLandSoundEffect } 
	] 
	bail_wall_fwd_regular = [ 
		{ time = 0.01999999955 event = BailBodyPunchSoundEffect } 
		{ time = 0.03999999911 event = BailSlapSoundEffect } 
		{ time = 0.50000000000 event = BailBodyFallSoundEffect } 
		{ time = 0.75000000000 event = BailBodyFallSoundEffect } 
		{ time = 1.00000000000 event = BailBodyFallSoundEffect } 
	] 
	bail_wall_fwd_low = [ 
		{ time = 0.01999999955 event = BailBodyPunchSoundEffect } 
		{ time = 0.03999999911 event = BailSlapSoundEffect } 
		{ time = 0.30000001192 event = BailBodyFallSoundEffect } 
		{ time = 0.50000000000 event = BailBodyFallSoundEffect } 
	] 
	bail_wall_bck_regular = [ 
		{ time = 0.01999999955 event = BailBodyPunchSoundEffect } 
		{ time = 0.07999999821 event = BailSlapSoundEffect } 
		{ time = 0.60000002384 event = BailBodyFallSoundEffect } 
		{ time = 0.80000001192 event = BailBodyFallSoundEffect } 
	] 
	bail_wall_bck_low = [ 
		{ time = 0.01999999955 event = BailBodyPunchSoundEffect } 
		{ time = 0.03999999911 event = BailSlapSoundEffect } 
		{ time = 0.50000000000 event = BailBodyFallSoundEffect } 
		{ time = 0.69999998808 event = BailBodyFallSoundEffect } 
	] 
	bail_wall_Lt_low = [ 
		{ time = 0.01999999955 event = BailBodyPunchSoundEffect } 
		{ time = 0.03999999911 event = BailSlapSoundEffect } 
		{ time = 0.40000000596 event = BailBodyFallSoundEffect } 
	] 
	bail_wall_Rt_low = [ 
		{ time = 0.01999999955 event = BailBodyPunchSoundEffect } 
		{ time = 0.03999999911 event = BailSlapSoundEffect } 
		{ time = 0.40000000596 event = BailBodyFallSoundEffect } 
	] 
	walkingslap = [ 
		{ time = 0.28000000119 event = BailSlapSoundEffect } 
		{ time = 0.56999999285 event = FootstepRunSoundEffect } 
		{ time = 0.89999997616 event = FootstepWalkSoundEffect } 
	] 
	walkingbail = [ 
		{ time = 0.00999999978 event = BailSlapSoundEffect } 
		{ time = 0.44999998808 event = BailBoardSoundEffect } 
		{ time = 0.60000002384 event = BailBodyFallSoundEffect } 
	] 
	walkingbailgetup = [ 
		{ time = 0.69999998808 event = FootstepScuffSoundEffect } 
		{ time = 1.20000004768 event = FootstepScuffSoundEffect } 
		{ time = 1.60000002384 event = FootstepWalkSoundEffect } 
		{ time = 1.89999997616 event = FootstepWalkSoundEffect } 
	] 
	GetUp_S_BoardCatch1 = [ 
		{ time = 0.00999999978 event = TurnOffSkaterLoopingSound } 
		{ time = 0.25999999046 event = BoardFlyInSound } 
		{ time = 0.69999998808 event = CatchBoardSound } 
		{ time = 1.63999998569 event = FootstepWalkSoundEffect } 
		{ time = 1.91999995708 event = FootstepWalkSoundEffect } 
		{ time = 2.40000009537 event = FootstepScuffSoundEffect } 
		{ time = 2.45000004768 event = TerrainLandSound } 
		{ time = 2.45000004768 event = TurnOnSkaterLoopingSound } 
	] 
	GetUp_S_RunJump = [ 
		{ time = 0.00999999978 event = TurnOffSkaterLoopingSound } 
		{ time = 0.00999999978 event = BoardRollingSound } 
		{ time = 1.04999995232 event = FootstepRunSoundEffect } 
		{ time = 1.39999997616 event = FootstepRunSoundEffect } 
		{ time = 1.79999995232 event = FootstepScuffSoundEffect } 
		{ time = 1.79999995232 event = TerrainLandSound } 
		{ time = 1.79999995232 event = TurnOnSkaterLoopingSound } 
	] 
	GetUp_S_BoardFlip1 = [ 
		{ time = 0.00999999978 event = BoardScrapeSound } 
		{ time = 0.89999997616 event = CatchBoardSound params = { DefVol = 80 } } 
		{ time = 1.39999997616 event = SoundEffect params = { name = OllieConc19 } } 
		{ time = 1.79999995232 event = TerrainLandSound } 
	] 
	Tantrum_BoardFocus = [ 
		{ time = 0.60000002384 event = FootstepScuffSoundEffect } 
		{ time = 1.20000004768 event = BoardSplitSound } 
		{ time = 2.00000000000 event = FootstepWalkSoundEffect } 
		{ time = 2.40000009537 event = FootstepWalkSoundEffect } 
	] 
	Tantrum_DiscusStart = [ 
		{ time = 0.00999999978 event = DiscusWhooshSound params = { DefPitch = 60 } } 
	] 
	Tantrum_DiscusFinish = [ 
	] 
	Tantrum_KickBoard = [ 
		{ time = 0.30000001192 event = FootstepScuffSoundEffect } 
		{ time = 0.40999999642 event = FootstepRunSoundEffect } 
		{ time = 0.75000000000 event = FootstepRunSoundEffect } 
		{ time = 0.81999999285 event = KickBoard } 
		{ time = 1.29999995232 event = FootstepScuffSoundEffect } 
	] 
	Tantrum_HeadButt = [ 
		{ time = 0.94999998808 event = BoardSplitSound } 
		{ time = 2.09999990463 event = SoundEffect params = { name = BoardBounce01 } } 
		{ time = 2.15000009537 event = SoundEffect params = { name = BoardBounce01 } } 
	] 
	Tantrum_SlingShot = [ 
		{ time = 0.30000001192 event = DiscusWhooshSound params = { DefPitch = 60 } } 
	] 
	Tantrum_PileDriver = [ 
		{ time = 0.94999998808 event = BoardSplitSound } 
		{ time = 1.10000002384 event = SoundEffect params = { name = BoardBounce01 } } 
		{ time = 2.20000004768 event = SoundEffect params = { name = BoardBounce01 } } 
	] 
	Standing_Tag2 = [ 
		{ time = 0.23299999535 event = DoSprayPaint params = { on } } 
		{ time = 0.50000000000 event = DoSprayPaint params = { splat } } 
		{ time = 0.60000002384 event = DoSprayPaint params = { off } } 
	] 
	Hanging_Tag = [ 
		{ time = 0.60000002384 event = DoSprayPaint params = { on } } 
		{ time = 0.50000000000 event = DoSprayPaint params = { splat } } 
		{ time = 1.05999994278 event = DoSprayPaint params = { off } } 
	] 
	Throw_SideArm = [ 
		{ time = 0.25000000000 event = ThrowObject params = { } } 
	] 
	standing_throw = [ 
		{ time = 0.27000001073 event = ThrowObject params = { } } 
	] 
	VertPlant = [ 
		{ time = 0.33000001311 event = SlapVertSticker } 
	] 
	Special_FranklinGrind_Idle = [ 
		{ time = 0.00999999978 event = DoLightning } 
	] 
	Shrek_BurpTag = [ 
		{ time = 0.20000000298 event = DoShrekBurp } 
		{ time = 0.30000001192 event = DoSprayPaint params = { splat } } 
	] 
	Shrek_BurpHangingTag = [ 
		{ time = 0.15000000596 event = DoShrekBurp } 
		{ time = 0.25000000000 event = DoSprayPaint params = { splat } } 
	] 
	Segway_Grind_Init = [ 
		{ time = 0.05000000075 event = DoVehicleGrind } 
	] 
	Veh_Bull_Grind_Init = [ 
		{ time = 0.05000000075 event = DoVehicleGrind } 
	] 
	Wheelchair_Grind_Init = [ 
		{ time = 0.05000000075 event = DoVehicleGrind } 
	] 
	Veh_Minikart_Grind_Init = [ 
		{ time = 0.05000000075 event = DoVehicleGrind } 
	] 
	Tricycle_Grind_Init = [ 
		{ time = 0.05000000075 event = DoVehicleGrind } 
	] 
	BeaverBlast = [ 
		{ time = 0.30000001192 event = DoFartBurst } 
	] 
	Special_Muska_Burn_Init = [ 
		{ time = 0.40000000596 event = DoCanFlame } 
	] 
	Special_Muska_Burn_Out = [ 
		{ time = 0.00999999978 event = DoCanFlameOff } 
	] 
	Special_GrafPunk_Idle = [ 
		{ time = 0.00999999978 event = DoDoubleCanOn } 
	] 
	Special_GrafPunk_Out = [ 
		{ time = 0.00999999978 event = DoDoubleCanOff } 
	] 
	Special_Phil_Hoagie_Idle = [ 
		{ time = 0.00999999978 event = DoHoagieOn } 
	] 
	Special_Phil_hoagie_Out = [ 
		{ time = 0.00999999978 event = DoHoagieOff } 
	] 
	Special_Jesse_HotRod_Init = [ 
		{ time = 0.00999999978 event = DoTiresOn } 
	] 
	Special_Koston_900 = [ 
		{ time = 0.02999999933 event = DoVortex } 
	] 
	Veh_Bull_IdleMoving = [ 
		{ time = 0.34999999404 event = SoundEffect params = { name = SK6_BA_Steveo_Buck_11 DefVol = 60 } } 
		{ time = 0.57999998331 event = SoundEffect params = { name = SK6_BA_Steveo_Buck02_11 DefVol = 60 } } 
	] 
	Veh_Bull_Accel = [ 
		{ time = 0.34999999404 event = SoundEffect params = { name = SK6_BA_Steveo_Buck_11 DefVol = 60 } } 
		{ time = 0.57999998331 event = SoundEffect params = { name = SK6_BA_Steveo_Buck02_11 DefVol = 60 } } 
	] 
	Veh_Bull_Brake = [ 
		{ time = 0.34999999404 event = SoundEffect params = { name = SK6_BA_Steveo_Buck_11 DefVol = 60 } } 
		{ time = 0.57999998331 event = SoundEffect params = { name = SK6_BA_Steveo_Buck02_11 DefVol = 60 } } 
	] 
	Veh_Bull_TurnLeft = [ 
		{ time = 0.34999999404 event = SoundEffect params = { name = SK6_BA_Steveo_Buck_11 DefVol = 60 } } 
		{ time = 0.57999998331 event = SoundEffect params = { name = SK6_BA_Steveo_Buck02_11 DefVol = 60 } } 
	] 
	Veh_Bull_TurnRight = [ 
		{ time = 0.34999999404 event = SoundEffect params = { name = SK6_BA_Steveo_Buck_11 DefVol = 60 } } 
		{ time = 0.57999998331 event = SoundEffect params = { name = SK6_BA_Steveo_Buck02_11 DefVol = 60 } } 
	] 
} 
PedAnimEventTable = { 
	Ped_Graffiti_BigTag01 = [ 
		{ time = 1.29999995232 event = DoSprayPaint params = { on } } 
		{ time = 2 event = DoSprayPaint params = { off } } 
		{ time = 2.40000009537 event = DoSprayPaint params = { on } } 
		{ time = 3.29999995232 event = DoSprayPaint params = { off } } 
		{ time = 4.19999980927 event = DoSprayPaint params = { on } } 
		{ time = 4.50000000000 event = DoSprayPaint params = { off } } 
		{ time = 5 event = DoSprayPaint params = { on } } 
		{ time = 5.30000019073 event = DoSprayPaint params = { off } } 
		{ time = 5.84999990463 event = DoSprayPaint params = { on } } 
		{ time = 6.50000000000 event = DoSprayPaint params = { off } } 
	] 
	Ped_Graffiti_BigTag02 = [ 
		{ time = 0.69999998808 event = DoSprayPaint params = { on } } 
		{ time = 2.26999998093 event = DoSprayPaint params = { off } } 
		{ time = 2.66000008583 event = DoSprayPaint params = { on } } 
		{ time = 5.23000001907 event = DoSprayPaint params = { off } } 
	] 
	Ped_Graffiti_Step2Tag = [ 
		{ time = 1.37000000477 event = DoSprayPaint params = { on } } 
		{ time = 3.85999989510 event = DoSprayPaint params = { off } } 
		{ time = 4.92999982834 event = DoSprayPaint params = { on } } 
		{ time = 7.42999982834 event = DoSprayPaint params = { off } } 
	] 
	Ped_Graffiti_Step2BigTag = [ 
		{ time = 1.23000001907 event = DoSprayPaint params = { on } } 
		{ time = 2.09999990463 event = DoSprayPaint params = { off } } 
	] 
	Ped_Sldr_Marching01 = [ 
		{ time = 0.00100000005 event = PedHitDrum params = { DefVol = 100 DefPitch = 100 } } 
	] 
	Ped_Sldr_Drumming02 = [ 
		{ time = 0.00100000005 event = PedHitDrum params = { DefVol = 100 DefPitch = 100 } } 
	] 
	BarkIdle = [ 
		{ time = 0.01999999955 event = DogBarkStream } 
	] 
	Ped_M_jumpback = [ 
		{ time = 0.57999998331 event = FootstepScuffSoundEffect } 
		{ time = 0.85000002384 event = FootstepRunSoundEffect } 
		{ time = 1.00000000000 event = FootstepRunSoundEffect } 
	] 
	Ped_f_jumpback = [ 
		{ time = 0.10000000149 event = FootstepScuffSoundEffect } 
		{ time = 0.50000000000 event = FootstepRunSoundEffect } 
		{ time = 0.64999997616 event = FootstepRunSoundEffect } 
	] 
	Ped_M_jumpforward = [ 
		{ time = 0.60000002384 event = FootstepScuffSoundEffect } 
		{ time = 0.60000002384 event = FootstepRunSoundEffect } 
		{ time = 1.10000002384 event = FootstepWalkSoundEffect } 
	] 
	Ped_f_jumpforward = [ 
		{ time = 0.40000000596 event = FootstepScuffSoundEffect } 
		{ time = 0.40000000596 event = FootstepRunSoundEffect } 
		{ time = 0.56000000238 event = FootstepRunSoundEffect } 
		{ time = 1.70000004768 event = FootstepWalkSoundEffect } 
	] 
	Ped_M_jumpleft = [ 
		{ time = 0.44999998808 event = FootstepScuffSoundEffect } 
		{ time = 0.44999998808 event = FootstepRunSoundEffect } 
		{ time = 0.80000001192 event = FootstepRunSoundEffect } 
		{ time = 1.29999995232 event = FootstepWalkSoundEffect } 
	] 
	Ped_f_jumpright = [ 
		{ time = 0.44999998808 event = FootstepScuffSoundEffect } 
		{ time = 0.44999998808 event = FootstepRunSoundEffect } 
		{ time = 0.60000002384 event = FootstepRunSoundEffect } 
		{ time = 1.29999995232 event = FootstepWalkSoundEffect } 
	] 
	Ped_M_falldownA = [ 
		{ time = 0.44999998808 event = BailBodyFallSoundEffect } 
		{ time = 0.69999998808 event = BailBodyFallSoundEffect } 
	] 
	Ped_M_falldownB = [ 
		{ time = 0.41999998689 event = BailBodyFallSoundEffect } 
		{ time = 0.64999997616 event = BailBodyFallSoundEffect } 
	] 
	Ped_M_falldownC = [ 
		{ time = 0.30000001192 event = BailBodyFallSoundEffect } 
	] 
	Ped_M_falldownD = [ 
		{ time = 0.20000000298 event = FootstepScuffSoundEffect } 
		{ time = 0.40000000596 event = BailBodyFallSoundEffect } 
	] 
	Ped_M_falldownE = [ 
		{ time = 0.20000000298 event = FootstepScuffSoundEffect } 
		{ time = 0.34999999404 event = BailBodyFallSoundEffect } 
		{ time = 0.55000001192 event = BailBodyFallSoundEffect } 
	] 
	Ped_M_Run = [ 
		{ time = 0.11999999732 event = FootstepRunSoundEffect } 
		{ time = 0.46000000834 event = FootstepRunSoundEffect } 
	] 
	Ped_f_Run = [ 
		{ time = 0.18000000715 event = FootstepRunSoundEffect } 
		{ time = 0.60000002384 event = FootstepRunSoundEffect } 
	] 
	Ped_M_runtoidle = [ 
		{ time = 0.11999999732 event = FootstepRunSoundEffect } 
		{ time = 0.46000000834 event = FootstepRunSoundEffect } 
		{ time = 0.75000000000 event = FootstepScuffSoundEffect } 
	] 
	Ped_f_runtoidle1 = [ 
		{ time = 0.11999999732 event = FootstepRunSoundEffect } 
		{ time = 0.46000000834 event = FootstepRunSoundEffect } 
		{ time = 0.11999999732 event = FootstepScuffSoundEffect } 
	] 
	Ped_f_runtoidle2 = [ 
		{ time = 0.20000000298 event = FootstepRunSoundEffect } 
		{ time = 0.46000000834 event = FootstepRunSoundEffect } 
	] 
	Ped_M_Run1 = [ 
		{ time = 0.11999999732 event = FootstepRunSoundEffect } 
		{ time = 0.46000000834 event = FootstepRunSoundEffect } 
	] 
	Ped_M_Run2 = [ 
		{ time = 0.05000000075 event = FootstepRunSoundEffect } 
		{ time = 0.37999999523 event = FootstepRunSoundEffect } 
	] 
	Ped_M_Walk1 = [ 
		{ time = 0.00999999978 event = FootstepWalkSoundEffect } 
		{ time = 0.52999997139 event = FootstepWalkSoundEffect } 
	] 
	Ped_f_Walk = [ 
		{ time = 0.00999999978 event = FootstepWalkSoundEffect } 
		{ time = 0.62000000477 event = FootstepWalkSoundEffect } 
	] 
	Ped_f_Walk2 = [ 
		{ time = 0.00999999978 event = FootstepWalkSoundEffect } 
		{ time = 0.62000000477 event = FootstepWalkSoundEffect } 
	] 
	Ped_f_Walk2toidle1 = [ 
		{ time = 0.00999999978 event = FootstepWalkSoundEffect } 
	] 
	Ped_f_Walk3 = [ 
		{ time = 0.00999999978 event = FootstepWalkSoundEffect } 
		{ time = 0.69999998808 event = FootstepWalkSoundEffect } 
	] 
	Ped_f_Walk3toidle1 = [ 
		{ time = 0.00999999978 event = FootstepWalkSoundEffect } 
	] 
	Ped_f_Walk4 = [ 
		{ time = 0.00999999978 event = FootstepWalkSoundEffect } 
		{ time = 0.43000000715 event = FootstepWalkSoundEffect } 
	] 
	Ped_f_Walk4toidle1 = [ 
		{ time = 0.00999999978 event = FootstepWalkSoundEffect } 
	] 
	Ped_f_Walkingwave = [ 
		{ time = 0.00999999978 event = FootstepWalkSoundEffect } 
		{ time = 0.62000000477 event = FootstepWalkSoundEffect } 
	] 
	Ped_M_Walk3 = [ 
		{ time = 0.07999999821 event = FootstepWalkSoundEffect } 
		{ time = 0.55000001192 event = FootstepWalkSoundEffect } 
	] 
	Ped_M_Walk4 = [ 
		{ time = 0.05000000075 event = FootstepWalkSoundEffect } 
		{ time = 0.40000000596 event = FootstepWalkSoundEffect } 
	] 
	Ped_M_Walkcool = [ 
		{ time = 0.00999999978 event = FootstepWalkSoundEffect } 
		{ time = 0.80000001192 event = FootstepWalkSoundEffect } 
	] 
	Ped_M_Walktired = [ 
		{ time = 0.00999999978 event = FootstepWalkSoundEffect } 
		{ time = 0.80000001192 event = FootstepWalkSoundEffect } 
	] 
	Ped_M_Walk1toIdle = [ 
		{ time = 0.40000000596 event = FootstepScuffSoundEffect } 
	] 
	Ped_f_WalktoIdle1 = [ 
		{ time = 0.00999999978 event = FootstepWalkSoundEffect } 
		{ time = 0.60000002384 event = FootstepScuffSoundEffect } 
	] 
	Ped_f_WalktoIdle2 = [ 
		{ time = 0.00999999978 event = FootstepWalkSoundEffect } 
	] 
	Ped_M_Walk2 = [ 
		{ time = 0.00999999978 event = FootstepWalkSoundEffect } 
		{ time = 0.52999997139 event = FootstepWalkSoundEffect } 
	] 
	Ped_M_Walk2toIdle = [ 
		{ time = 0.40000000596 event = FootstepScuffSoundEffect } 
	] 
	Ped_M_Run1toIdle = [ 
		{ time = 0.30000001192 event = FootstepScuffSoundEffect } 
	] 
} 
DogAnimEventTable = { 
	run = [ 
		{ time = 0.10000000149 event = BullGallopSounds } 
	] 
	BarkIdle = [ 
		{ time = 0.01999999955 event = DogBarkStream } 
	] 
	LiftLeg = [ 
		{ time = 0.01999999955 event = Print params = { string = "Dog Lift Leg" } } 
	] 
} 
ActualSkaterAnimHandlerExceptionTable = [ 
	{ event ex = PedHitDrum scr = HandlePedHitDrum } 
	{ event ex = SoundEffect scr = HandleSoundEffectEvent } 
	{ event ex = FootstepWalkSoundEffect scr = HandleFootstepWalkSoundEffectEvent } 
	{ event ex = FootstepRunSoundEffect scr = HandleFootstepRunSoundEffectEvent } 
	{ event ex = FootstepScuffSoundEffect scr = HandleFootstepScuffSoundEffect } 
	{ event ex = FootstepJumpSoundEffect scr = HandleFootstepJumpSoundEffect } 
	{ event ex = FootstepLandSoundEffect scr = HandleFootstepLandSoundEffect } 
	{ event ex = BailBodyFallSoundEffect scr = HandleBailBodyFallSoundEffect } 
	{ event ex = BailBodyPunchSoundEffect scr = HandleBailBodyPunchSoundEffect } 
	{ event ex = BailCrackSoundEffect scr = HandleBailCrackSoundEffect } 
	{ event ex = BailSlapSoundEffect scr = HandleBailSlapSoundEffect } 
	{ event ex = BailScrapeSoundEffect scr = HandleBailScrapeSoundEffect } 
	{ event ex = BailBoardSoundEffect scr = HandleBailBoardSoundEffect } 
	{ event ex = BailHitGroundSoundEffect scr = HandleHitGroundSoundEffect } 
	{ event ex = TerrainLandSound scr = HandleTerrainLandSound } 
	{ event ex = TerrainBonkSound scr = HandleTerrainBonkSound } 
	{ event ex = TurnOnSkaterLoopingSound scr = HandleTurnOnSkaterLoopingSound } 
	{ event ex = TurnOffSkaterLoopingSound scr = HandleTurnOffSkaterLoopingSound } 
	{ event ex = CatchBoardSound scr = HandleCatchBoardSound } 
	{ event ex = BoardScrapeSound scr = HandleBoardScrapeSound } 
	{ event ex = BoardSplitSound scr = HandleBoardSplitSound } 
	{ event ex = BoardFlyInSound scr = HandleBoardFlyInSound } 
	{ event ex = BoardRollingSound scr = HandleBoardRollingSound } 
	{ event ex = DiscusWhooshSound scr = HandleDiscusWhooshSound } 
	{ event ex = ThrowObject scr = ThrowObjectScript } 
	{ event ex = KickBoard scr = HandleKickBoardSound } 
	{ event ex = StopAStream scr = HandleStoppingAStream } 
	{ event ex = GenericParticles scr = Emit_SpecialTrickParticles } 
	{ event ex = DoSprayPaint scr = HandleSkaterSprayPaint } 
	{ event ex = SlapVertSticker scr = HandleVertSticker } 
	{ event ex = DoLightning scr = HandleLightning } 
	{ event ex = DoShrekBurp scr = HandleShrekBurp } 
	{ event ex = DoVehicleGrind scr = handleVehiclegrind } 
	{ event ex = DoFartBurst scr = HandleFartBurst } 
	{ event ex = DoCanFlame scr = HandleCanFlameOn } 
	{ event ex = DoCanFlameOff scr = HandleCanFlameOff } 
	{ event ex = DoVortex scr = HandleVortex } 
	{ event ex = DoDoubleCanOn scr = HandleDoubleCanOn } 
	{ event ex = DoDoubleCanOff scr = HandleDoubleCanOff } 
	{ event ex = DoHoagieOn scr = HandleHoagieOn } 
	{ event ex = DoHoagieOff scr = HandleHoagieOff } 
	{ event ex = DoTiresOn scr = HandleTiresOn } 
	{ event ex = FootstepParticlesR scr = SkaterParticles_OnRightFootstep } 
	{ event ex = FootstepParticlesL scr = SkaterParticles_OnLeftFootstep } 
] 
ActualPedAnimHandlerExceptionTable = [ 
	{ event ex = PedHitDrum scr = HandlePedHitDrum } 
	{ event ex = Print scr = HandlePrintEvent } 
	{ event ex = PedObjPlayStream scr = HandlePedObjPlayStream } 
	{ event ex = DogBarkStream scr = HandleDogBarkStream } 
	{ event ex = BullGallopSounds scr = HandleBullGallopSounds } 
	{ event ex = FootstepWalkSoundEffect scr = HandlePedFootstepWalkSoundEffectEvent } 
	{ event ex = FootstepRunSoundEffect scr = HandlePedFootstepRunSoundEffectEvent } 
	{ event ex = FootstepScuffSoundEffect scr = HandlePedFootstepScuffSoundEffect } 
	{ event ex = FootstepJumpSoundEffect scr = HandlePedFootstepJumpSoundEffect } 
	{ event ex = FootstepLandSoundEffect scr = HandlePedFootstepLandSoundEffect } 
	{ event ex = BailBodyFallSoundEffect scr = HandlePedBailBodyFallSoundEffect } 
	{ event ex = BailBodyPunchSoundEffect scr = HandlePedBailBodyPunchSoundEffect } 
	{ event ex = BailCrackSoundEffect scr = HandlePedBailCrackSoundEffect } 
	{ event ex = BailSlapSoundEffect scr = HandlePedBailSlapSoundEffect } 
	{ event ex = BailScrapeSoundEffect scr = HandlePedBailScrapeSoundEffect } 
	{ event ex = BailBoardSoundEffect scr = HandlePedBailBoardSoundEffect } 
	{ event ex = DoSprayPaint scr = HandlePedSprayPaint } 
] 
SCRIPT set_skater_anim_handlers 
	ResetEventHandlersFromTable ActualSkaterAnimHandlerExceptionTable group = anim 
ENDSCRIPT

SCRIPT set_ped_anim_handlers 
	ResetEventHandlersFromTable ActualPedAnimHandlerExceptionTable group = anim 
ENDSCRIPT

SCRIPT set_viewerobj_anim_handlers 
	set_skater_anim_handlers 
	set_ped_anim_handlers 
ENDSCRIPT

SCRIPT HandlePedHitBassDrumBeats 
	wait 0.28200000525 seconds 
	Obj_PlaySound SK6_BO_RevolutionaryDrum01 dropoff = 100 vol = ( 60 + RANDOM_RANGE PAIR(0.10000000149, 4.00000000000) ) pitch = ( 30 + RANDOM_RANGE PAIR(0.10000000149, 3.00000000000) ) 
	wait 0.56400001049 seconds 
	Obj_PlaySound SK6_BO_RevolutionaryDrum01 dropoff = 100 vol = ( 60 + RANDOM_RANGE PAIR(0.10000000149, 4.00000000000) ) pitch = ( 30 + RANDOM_RANGE PAIR(0.10000000149, 3.00000000000) ) 
ENDSCRIPT

SCRIPT HandlePedHitSnareDrumBeats 
	SWITCH DrumPartialNumber 
		CASE 1 
			Obj_PlaySound SK6_BO_RevolutionaryDrum01 vol = ( <DefaultVol> + RANDOM_RANGE PAIR(0.10000000149, 4.00000000000) ) pitch = ( <DefaultPitch> + RANDOM_RANGE PAIR(0.10000000149, 3.00000000000) ) 
			wait 0.28200000525 seconds 
			Obj_PlaySound SK6_BO_RevolutionaryDrum01 vol = ( <AccentV> + RANDOM_RANGE PAIR(0.10000000149, 4.00000000000) ) pitch = ( <DefaultPitch> + RANDOM_RANGE PAIR(0.10000000149, 3.00000000000) ) 
			wait 0.14100000262 seconds 
			Obj_PlaySound SK6_BO_RevolutionaryDrum01 vol = ( <DefaultVol> + RANDOM_RANGE PAIR(0.10000000149, 4.00000000000) ) pitch = ( <DefaultPitch> + RANDOM_RANGE PAIR(0.10000000149, 3.00000000000) ) 
			wait 0.14100000262 seconds 
			Obj_PlaySound SK6_BO_RevolutionaryDrum01 vol = ( <DefaultVol> + RANDOM_RANGE PAIR(0.10000000149, 4.00000000000) ) pitch = ( <DefaultPitch> + RANDOM_RANGE PAIR(0.10000000149, 3.00000000000) ) 
		CASE 2 
			Obj_PlaySound SK6_BO_RevolutionaryDrum01 vol = ( <AccentV> + RANDOM_RANGE PAIR(0.10000000149, 4.00000000000) ) pitch = ( <DefaultPitch> + RANDOM_RANGE PAIR(0.10000000149, 3.00000000000) ) 
			wait 0.14100000262 seconds 
			Obj_PlaySound SK6_BO_RevolutionaryDrum01 vol = ( <DefaultVol> + RANDOM_RANGE PAIR(0.10000000149, 4.00000000000) ) pitch = ( <DefaultPitch> + RANDOM_RANGE PAIR(0.10000000149, 3.00000000000) ) 
			wait 0.14100000262 seconds 
			Obj_PlaySound SK6_BO_RevolutionaryDrum01 vol = ( <DefaultVol> + RANDOM_RANGE PAIR(0.10000000149, 4.00000000000) ) pitch = ( <DefaultPitch> + RANDOM_RANGE PAIR(0.10000000149, 3.00000000000) ) 
			wait 0.28200000525 seconds 
			Obj_PlaySound SK6_BO_RevolutionaryDrum01 vol = ( <DefaultVol> + RANDOM_RANGE PAIR(0.10000000149, 4.00000000000) ) pitch = ( <DefaultPitch> + RANDOM_RANGE PAIR(0.10000000149, 3.00000000000) ) 
			wait 0.28200000525 seconds 
			Obj_PlaySound SK6_BO_RevolutionaryDrum01 vol = ( <DefaultVol> + RANDOM_RANGE PAIR(0.10000000149, 4.00000000000) ) pitch = ( <DefaultPitch> + RANDOM_RANGE PAIR(0.10000000149, 3.00000000000) ) 
		CASE 3 
			Obj_PlaySound SK6_BO_RevolutionaryDrum01 vol = ( <DefaultVol> + RANDOM_RANGE PAIR(0.10000000149, 4.00000000000) ) pitch = ( <DefaultPitch> + RANDOM_RANGE PAIR(0.10000000149, 3.00000000000) ) 
			wait 0.14100000262 seconds 
			Obj_PlaySound SK6_BO_RevolutionaryDrum01 vol = ( <DefaultVol> + RANDOM_RANGE PAIR(0.10000000149, 4.00000000000) ) pitch = ( <DefaultPitch> + RANDOM_RANGE PAIR(0.10000000149, 3.00000000000) ) 
			wait 0.14100000262 seconds 
			Obj_PlaySound SK6_BO_RevolutionaryDrum01 vol = ( <DefaultVol> + RANDOM_RANGE PAIR(0.10000000149, 4.00000000000) ) pitch = ( <DefaultPitch> + RANDOM_RANGE PAIR(0.10000000149, 3.00000000000) ) 
			wait 0.14100000262 seconds 
			Obj_PlaySound SK6_BO_RevolutionaryDrum01 vol = ( <AccentV> + RANDOM_RANGE PAIR(0.10000000149, 4.00000000000) ) pitch = ( <DefaultPitch> + RANDOM_RANGE PAIR(0.10000000149, 3.00000000000) ) 
			wait 0.14100000262 seconds 
			Obj_PlaySound SK6_BO_RevolutionaryDrum01 vol = ( <DefaultVol> + RANDOM_RANGE PAIR(0.10000000149, 4.00000000000) ) pitch = ( <DefaultPitch> + RANDOM_RANGE PAIR(0.10000000149, 3.00000000000) ) 
			wait 0.14100000262 seconds 
			Obj_PlaySound SK6_BO_RevolutionaryDrum01 vol = ( <DefaultVol> + RANDOM_RANGE PAIR(0.10000000149, 4.00000000000) ) pitch = ( <DefaultPitch> + RANDOM_RANGE PAIR(0.10000000149, 3.00000000000) ) 
			wait 0.14100000262 seconds 
			Obj_PlaySound SK6_BO_RevolutionaryDrum01 vol = ( <DefaultVol> + RANDOM_RANGE PAIR(0.10000000149, 4.00000000000) ) pitch = ( <DefaultPitch> + RANDOM_RANGE PAIR(0.10000000149, 3.00000000000) ) 
		CASE 4 
			Obj_PlaySound SK6_BO_RevolutionaryDrum01 vol = ( <DefaultVol> + RANDOM_RANGE PAIR(0.10000000149, 4.00000000000) ) pitch = ( <DefaultPitch> + RANDOM_RANGE PAIR(0.10000000149, 3.00000000000) ) 
			wait 0.14100000262 seconds 
			wait 0.14100000262 seconds 
			Obj_PlaySound SK6_BO_RevolutionaryDrum01 vol = ( <AccentV> + RANDOM_RANGE PAIR(0.10000000149, 4.00000000000) ) pitch = ( <DefaultPitch> + RANDOM_RANGE PAIR(0.10000000149, 3.00000000000) ) 
			wait 0.14100000262 seconds 
			Obj_PlaySound SK6_BO_RevolutionaryDrum01 vol = ( <DefaultVol> + RANDOM_RANGE PAIR(0.10000000149, 4.00000000000) ) pitch = ( <DefaultPitch> + RANDOM_RANGE PAIR(0.10000000149, 3.00000000000) ) 
			wait 0.14100000262 seconds 
			Obj_PlaySound SK6_BO_RevolutionaryDrum01 vol = ( <DefaultVol> + RANDOM_RANGE PAIR(0.10000000149, 4.00000000000) ) pitch = ( <DefaultPitch> + RANDOM_RANGE PAIR(0.10000000149, 3.00000000000) ) 
			wait 0.28200000525 seconds 
			Obj_PlaySound SK6_BO_RevolutionaryDrum01 vol = ( <DefaultVol> + RANDOM_RANGE PAIR(0.10000000149, 4.00000000000) ) pitch = ( <DefaultPitch> + RANDOM_RANGE PAIR(0.10000000149, 3.00000000000) ) 
			wait 0.14100000262 seconds 
			Obj_PlaySound SK6_BO_RevolutionaryDrum01 vol = ( <DefaultVol> + RANDOM_RANGE PAIR(0.10000000149, 4.00000000000) ) pitch = ( <DefaultPitch> + RANDOM_RANGE PAIR(0.10000000149, 3.00000000000) ) 
		CASE 5 
			Obj_PlaySound SK6_BO_RevolutionaryDrum01 vol = ( <DefaultVol> + RANDOM_RANGE PAIR(0.10000000149, 4.00000000000) ) pitch = ( <DefaultPitch> + RANDOM_RANGE PAIR(0.10000000149, 3.00000000000) ) 
			wait 0.14100000262 seconds 
			Obj_PlaySound SK6_BO_RevolutionaryDrum01 vol = ( <DefaultVol> + RANDOM_RANGE PAIR(0.10000000149, 4.00000000000) ) pitch = ( <DefaultPitch> + RANDOM_RANGE PAIR(0.10000000149, 3.00000000000) ) 
			wait 0.14100000262 seconds 
			Obj_PlaySound SK6_BO_RevolutionaryDrum01 vol = ( <AccentV> + RANDOM_RANGE PAIR(0.10000000149, 4.00000000000) ) pitch = ( <DefaultPitch> + RANDOM_RANGE PAIR(0.10000000149, 3.00000000000) ) 
			wait 0.14100000262 seconds 
			Obj_PlaySound SK6_BO_RevolutionaryDrum01 vol = ( <AccentV> + RANDOM_RANGE PAIR(0.10000000149, 4.00000000000) ) pitch = ( <DefaultPitch> + RANDOM_RANGE PAIR(0.10000000149, 3.00000000000) ) 
			wait 0.28200000525 seconds 
			Obj_PlaySound SK6_BO_RevolutionaryDrum01 vol = ( <DefaultVol> + RANDOM_RANGE PAIR(0.10000000149, 4.00000000000) ) pitch = ( <DefaultPitch> + RANDOM_RANGE PAIR(0.10000000149, 3.00000000000) ) 
			wait 0.14100000262 seconds 
			Obj_PlaySound SK6_BO_RevolutionaryDrum01 vol = ( <DefaultVol> + RANDOM_RANGE PAIR(0.10000000149, 4.00000000000) ) pitch = ( <DefaultPitch> + RANDOM_RANGE PAIR(0.10000000149, 3.00000000000) ) 
		CASE 6 
			Obj_PlaySound SK6_BO_RevolutionaryDrum01 vol = ( <DefaultVol> + RANDOM_RANGE PAIR(0.10000000149, 4.00000000000) ) pitch = ( <DefaultPitch> + RANDOM_RANGE PAIR(0.10000000149, 3.00000000000) ) 
			wait 0.28200000525 seconds 
			Obj_PlaySound SK6_BO_RevolutionaryDrum01 vol = ( <DefaultVol> + RANDOM_RANGE PAIR(0.10000000149, 4.00000000000) ) pitch = ( <DefaultPitch> + RANDOM_RANGE PAIR(0.10000000149, 3.00000000000) ) 
			wait 0.14100000262 seconds 
			Obj_PlaySound SK6_BO_RevolutionaryDrum01 vol = ( <AccentV> + RANDOM_RANGE PAIR(0.10000000149, 4.00000000000) ) pitch = ( <DefaultPitch> + RANDOM_RANGE PAIR(0.10000000149, 3.00000000000) ) 
			wait 0.28200000525 seconds 
			Obj_PlaySound SK6_BO_RevolutionaryDrum01 vol = ( <AccentV> + RANDOM_RANGE PAIR(0.10000000149, 4.00000000000) ) pitch = ( <DefaultPitch> + RANDOM_RANGE PAIR(0.10000000149, 3.00000000000) ) 
			wait 0.14100000262 seconds 
			Obj_PlaySound SK6_BO_RevolutionaryDrum01 vol = ( <DefaultVol> + RANDOM_RANGE PAIR(0.10000000149, 4.00000000000) ) pitch = ( <DefaultPitch> + RANDOM_RANGE PAIR(0.10000000149, 3.00000000000) ) 
		CASE 7 
			Obj_PlaySound SK6_BO_RevolutionaryDrum01 vol = ( <DefaultVol> + RANDOM_RANGE PAIR(0.10000000149, 4.00000000000) ) pitch = ( <DefaultPitch> + RANDOM_RANGE PAIR(0.10000000149, 3.00000000000) ) 
			wait 0.14100000262 seconds 
			Obj_PlaySound SK6_BO_RevolutionaryDrum01 vol = ( <DefaultVol> + RANDOM_RANGE PAIR(0.10000000149, 4.00000000000) ) pitch = ( <DefaultPitch> + RANDOM_RANGE PAIR(0.10000000149, 3.00000000000) ) 
			wait 0.14100000262 seconds 
			Obj_PlaySound SK6_BO_RevolutionaryDrum01 vol = ( <AccentV> + RANDOM_RANGE PAIR(0.10000000149, 4.00000000000) ) pitch = ( <DefaultPitch> + RANDOM_RANGE PAIR(0.10000000149, 3.00000000000) ) 
			wait 0.56699997187 seconds 
			Obj_PlaySound SK6_BO_RevolutionaryDrum01 vol = ( <AccentV> + RANDOM_RANGE PAIR(0.10000000149, 4.00000000000) ) pitch = ( <DefaultPitch> + RANDOM_RANGE PAIR(0.10000000149, 3.00000000000) ) 
		CASE 8 
			Obj_PlaySound SK6_BO_RevolutionaryDrum01 vol = ( <AccentV> + RANDOM_RANGE PAIR(0.10000000149, 4.00000000000) ) pitch = ( <DefaultPitch> + RANDOM_RANGE PAIR(0.10000000149, 3.00000000000) ) 
			wait 0.28200000525 seconds 
			Obj_PlaySound SK6_BO_RevolutionaryDrum01 vol = ( <DefaultVol> + RANDOM_RANGE PAIR(0.10000000149, 4.00000000000) ) pitch = ( <DefaultPitch> + RANDOM_RANGE PAIR(0.10000000149, 3.00000000000) ) 
			wait 0.28200000525 seconds 
			Obj_PlaySound SK6_BO_RevolutionaryDrum01 vol = ( <AccentV> + RANDOM_RANGE PAIR(0.10000000149, 4.00000000000) ) pitch = ( <DefaultPitch> + RANDOM_RANGE PAIR(0.10000000149, 3.00000000000) ) 
			wait 0.28200000525 seconds 
			Obj_PlaySound SK6_BO_RevolutionaryDrum01 vol = ( <DefaultVol> + RANDOM_RANGE PAIR(0.10000000149, 4.00000000000) ) pitch = ( <DefaultPitch> + RANDOM_RANGE PAIR(0.10000000149, 3.00000000000) ) 
		CASE 9 
			Obj_PlaySound SK6_BO_RevolutionaryDrum01 vol = ( <DefaultVol> + RANDOM_RANGE PAIR(0.10000000149, 4.00000000000) ) pitch = ( <DefaultPitch> + RANDOM_RANGE PAIR(0.10000000149, 3.00000000000) ) 
			wait 0.28299999237 seconds 
			Obj_PlaySound SK6_BO_RevolutionaryDrum01 vol = ( <DefaultVol> + RANDOM_RANGE PAIR(0.10000000149, 4.00000000000) ) pitch = ( <DefaultPitch> + RANDOM_RANGE PAIR(0.10000000149, 3.00000000000) ) 
			wait 0.28299999237 seconds 
			Obj_PlaySound SK6_BO_RevolutionaryDrum01 vol = ( <AccentV> + RANDOM_RANGE PAIR(0.10000000149, 4.00000000000) ) pitch = ( <DefaultPitch> + RANDOM_RANGE PAIR(0.10000000149, 3.00000000000) ) 
			wait 0.14100000262 seconds 
			Obj_PlaySound SK6_BO_RevolutionaryDrum01 vol = ( <DefaultVol> + RANDOM_RANGE PAIR(0.10000000149, 4.00000000000) ) pitch = ( <DefaultPitch> + RANDOM_RANGE PAIR(0.10000000149, 3.00000000000) ) 
			wait 0.14100000262 seconds 
			Obj_PlaySound SK6_BO_RevolutionaryDrum01 vol = ( <DefaultVol> + RANDOM_RANGE PAIR(0.10000000149, 4.00000000000) ) pitch = ( <DefaultPitch> + RANDOM_RANGE PAIR(0.10000000149, 3.00000000000) ) 
		CASE 10 
			Obj_PlaySound SK6_BO_RevolutionaryDrum01 vol = ( <DefaultVol> + RANDOM_RANGE PAIR(0.10000000149, 4.00000000000) ) pitch = ( <DefaultPitch> + RANDOM_RANGE PAIR(0.10000000149, 3.00000000000) ) 
			wait 0.28299999237 seconds 
			Obj_PlaySound SK6_BO_RevolutionaryDrum01 vol = ( <AccentV> + RANDOM_RANGE PAIR(0.10000000149, 4.00000000000) ) pitch = ( <DefaultPitch> + RANDOM_RANGE PAIR(0.10000000149, 3.00000000000) ) 
			wait 0.28299999237 seconds 
			Obj_PlaySound SK6_BO_RevolutionaryDrum01 vol = ( <DefaultVol> + RANDOM_RANGE PAIR(0.10000000149, 4.00000000000) ) pitch = ( <DefaultPitch> + RANDOM_RANGE PAIR(0.10000000149, 3.00000000000) ) 
			wait 0.28299999237 seconds 
			Obj_PlaySound SK6_BO_RevolutionaryDrum01 vol = ( <AccentV> + RANDOM_RANGE PAIR(0.10000000149, 4.00000000000) ) pitch = ( <DefaultPitch> + RANDOM_RANGE PAIR(0.10000000149, 3.00000000000) ) 
		CASE 11 
			Obj_PlaySound SK6_BO_RevolutionaryDrum01 vol = ( <DefaultVol> + RANDOM_RANGE PAIR(0.10000000149, 4.00000000000) ) pitch = ( <DefaultPitch> + RANDOM_RANGE PAIR(0.10000000149, 3.00000000000) ) 
			wait 0.28200000525 seconds 
			Obj_PlaySound SK6_BO_RevolutionaryDrum01 vol = ( <DefaultVol> + RANDOM_RANGE PAIR(0.10000000149, 4.00000000000) ) pitch = ( <DefaultPitch> + RANDOM_RANGE PAIR(0.10000000149, 3.00000000000) ) 
			wait 0.14100000262 seconds 
			Obj_PlaySound SK6_BO_RevolutionaryDrum01 vol = ( <AccentV> + RANDOM_RANGE PAIR(0.10000000149, 4.00000000000) ) pitch = ( <DefaultPitch> + RANDOM_RANGE PAIR(0.10000000149, 3.00000000000) ) 
			wait 0.28200000525 seconds 
			Obj_PlaySound SK6_BO_RevolutionaryDrum01 vol = ( <DefaultVol> + RANDOM_RANGE PAIR(0.10000000149, 4.00000000000) ) pitch = ( <DefaultPitch> + RANDOM_RANGE PAIR(0.10000000149, 3.00000000000) ) 
			wait 0.14100000262 seconds 
			Obj_PlaySound SK6_BO_RevolutionaryDrum01 vol = ( <AccentV> + RANDOM_RANGE PAIR(0.10000000149, 4.00000000000) ) pitch = ( <DefaultPitch> + RANDOM_RANGE PAIR(0.10000000149, 3.00000000000) ) 
		CASE 12 
			Obj_PlaySound SK6_BO_RevolutionaryDrum01 vol = ( <AccentV> + RANDOM_RANGE PAIR(0.10000000149, 4.00000000000) ) pitch = ( <DefaultPitch> + RANDOM_RANGE PAIR(0.10000000149, 3.00000000000) ) 
			wait 0.56400001049 seconds 
			Obj_PlaySound SK6_BO_RevolutionaryDrum01 vol = ( <DefaultVol> + RANDOM_RANGE PAIR(0.10000000149, 4.00000000000) ) pitch = ( <DefaultPitch> + RANDOM_RANGE PAIR(0.10000000149, 3.00000000000) ) 
			wait 0.14100000262 seconds 
			Obj_PlaySound SK6_BO_RevolutionaryDrum01 vol = ( <DefaultVol> + RANDOM_RANGE PAIR(0.10000000149, 4.00000000000) ) pitch = ( <DefaultPitch> + RANDOM_RANGE PAIR(0.10000000149, 3.00000000000) ) 
			wait 0.14100000262 seconds 
		CASE 13 
			Obj_PlaySound SK6_BO_RevolutionaryDrum01 vol = ( <DefaultVol> + RANDOM_RANGE PAIR(0.10000000149, 4.00000000000) ) pitch = ( <DefaultPitch> + RANDOM_RANGE PAIR(0.10000000149, 3.00000000000) ) 
			wait 0.28200000525 seconds 
			Obj_PlaySound SK6_BO_RevolutionaryDrum01 vol = ( <AccentV> + RANDOM_RANGE PAIR(0.10000000149, 4.00000000000) ) pitch = ( <DefaultPitch> + RANDOM_RANGE PAIR(0.10000000149, 3.00000000000) ) 
			wait 0.56400001049 seconds 
			Obj_PlaySound SK6_BO_RevolutionaryDrum01 vol = ( <DefaultVol> + RANDOM_RANGE PAIR(0.10000000149, 4.00000000000) ) pitch = ( <DefaultPitch> + RANDOM_RANGE PAIR(0.10000000149, 3.00000000000) ) 
		CASE 14 
			Obj_PlaySound SK6_BO_RevolutionaryDrum01 vol = ( <DefaultVol> + RANDOM_RANGE PAIR(0.10000000149, 4.00000000000) ) pitch = ( <DefaultPitch> + RANDOM_RANGE PAIR(0.10000000149, 3.00000000000) ) 
			wait 0.28200000525 seconds 
			Obj_PlaySound SK6_BO_RevolutionaryDrum01 vol = ( <AccentV> + RANDOM_RANGE PAIR(0.10000000149, 4.00000000000) ) pitch = ( <DefaultPitch> + RANDOM_RANGE PAIR(0.10000000149, 3.00000000000) ) 
			wait 0.42300000787 seconds 
			Obj_PlaySound SK6_BO_RevolutionaryDrum01 vol = ( <AccentV> + RANDOM_RANGE PAIR(0.10000000149, 4.00000000000) ) pitch = ( <DefaultPitch> + RANDOM_RANGE PAIR(0.10000000149, 3.00000000000) ) 
			wait 0.14100000262 seconds 
			Obj_PlaySound SK6_BO_RevolutionaryDrum01 vol = ( <DefaultVol> + RANDOM_RANGE PAIR(0.10000000149, 4.00000000000) ) pitch = ( <DefaultPitch> + RANDOM_RANGE PAIR(0.10000000149, 3.00000000000) ) 
		CASE 15 
			Obj_PlaySound SK6_BO_RevolutionaryDrum01 vol = ( <DefaultVol> + RANDOM_RANGE PAIR(0.10000000149, 4.00000000000) ) pitch = ( <DefaultPitch> + RANDOM_RANGE PAIR(0.10000000149, 3.00000000000) ) 
			wait 0.28200000525 seconds 
			Obj_PlaySound SK6_BO_RevolutionaryDrum01 vol = ( <DefaultVol> + RANDOM_RANGE PAIR(0.10000000149, 4.00000000000) ) pitch = ( <DefaultPitch> + RANDOM_RANGE PAIR(0.10000000149, 3.00000000000) ) 
			wait 0.14100000262 seconds 
			Obj_PlaySound SK6_BO_RevolutionaryDrum01 vol = ( <AccentV> + RANDOM_RANGE PAIR(0.10000000149, 4.00000000000) ) pitch = ( <DefaultPitch> + RANDOM_RANGE PAIR(0.10000000149, 3.00000000000) ) 
			wait 0.28200000525 seconds 
			Obj_PlaySound SK6_BO_RevolutionaryDrum01 vol = ( <DefaultVol> + RANDOM_RANGE PAIR(0.10000000149, 4.00000000000) ) pitch = ( <DefaultPitch> + RANDOM_RANGE PAIR(0.10000000149, 3.00000000000) ) 
			wait 0.14100000262 seconds 
			Obj_PlaySound SK6_BO_RevolutionaryDrum01 vol = ( <DefaultVol> + RANDOM_RANGE PAIR(0.10000000149, 4.00000000000) ) pitch = ( <DefaultPitch> + RANDOM_RANGE PAIR(0.10000000149, 3.00000000000) ) 
			wait 0.14100000262 seconds 
		CASE 16 
			Obj_PlaySound SK6_BO_RevolutionaryDrum01 vol = ( <DefaultVol> + RANDOM_RANGE PAIR(0.10000000149, 4.00000000000) ) pitch = ( <DefaultPitch> + RANDOM_RANGE PAIR(0.10000000149, 3.00000000000) ) 
			wait 0.28200000525 seconds 
			Obj_PlaySound SK6_BO_RevolutionaryDrum01 vol = ( <DefaultVol> + RANDOM_RANGE PAIR(0.10000000149, 4.00000000000) ) pitch = ( <DefaultPitch> + RANDOM_RANGE PAIR(0.10000000149, 3.00000000000) ) 
			wait 0.28200000525 seconds 
			Obj_PlaySound SK6_BO_RevolutionaryDrum01 vol = ( <AccentV> + RANDOM_RANGE PAIR(0.10000000149, 4.00000000000) ) pitch = ( <DefaultPitch> + RANDOM_RANGE PAIR(0.10000000149, 3.00000000000) ) 
	ENDSWITCH 
ENDSCRIPT

SCRIPT HandlePedHitDrum { DefVol = 75 DefPitch = 100 AccentVol = 150 AccentPitch = 102 } 
	SpawnSound HandlePedHitBassDrumBeats 
	SpawnSound HandlePedHitSnareDrumBeats params = { DefaultVol = <DefVol> DefaultPitch = <DefPitch> AccentV = <AccentVol> AccentP = <AccentPitch> } 
ENDSCRIPT

SCRIPT HandlePrintEvent 
	
ENDSCRIPT

SCRIPT HandlePedObjPlayStream 
	
ENDSCRIPT

SCRIPT HandleDogBarkStream 
	IF Obj_Visible 
		SpawnSound DogBarkStreamsWaiting 
	ENDIF 
ENDSCRIPT

SCRIPT DogBarkStreamsWaiting 
ENDSCRIPT

SCRIPT HandleBullGallopSounds 
	IF ( LevelIs load_ba ) 
		RANDOM_NO_REPEAT(1, 1, 1, 1) 
			RANDOMCASE Obj_PlaySound SK6_BA_BullGallop01 vol = 80 dropoff = 150 
			RANDOMCASE Obj_PlaySound SK6_BA_BullGallop02 vol = 80 dropoff = 150 
			RANDOMCASE Obj_PlaySound SK6_BA_BullGallop03 vol = 80 dropoff = 150 
			RANDOMCASE Obj_PlaySound SK6_BA_BullGallop04 vol = 80 dropoff = 150 
		RANDOMEND 
	ENDIF 
ENDSCRIPT

SCRIPT HandleTurnOnSkaterLoopingSound 
	SkaterLoopingSound_TurnOn 
ENDSCRIPT

SCRIPT HandleTurnOffSkaterLoopingSound 
	SkaterLoopingSound_TurnOff 
ENDSCRIPT

SCRIPT HandleBoardFlyInSound 
	Obj_SpawnScript HandleBoardFlyInSound2 
ENDSCRIPT

SCRIPT HandleBoardFlyInSound2 
	SpawnSound BoardFlyInWaiting 
ENDSCRIPT

SCRIPT BoardFlyInWaiting 
	Obj_GetAnimSpeed 
	IF flipped 
		BoardRightVol = -12 
		BEGIN 
			IF IsSoundPlaying SkaterBoardFlyInSound01 
				SetSoundParams SkaterBoardFlyInSound01 volL = 60 volR = <BoardRightVol> pitch = ( 100 * <speed> ) 
			ENDIF 
			BoardRightVol = ( <BoardRightVol> + 2.05699992180 ) 
			Obj_GetAnimSpeed 
			wait 1 gameframe 
		REPEAT 35 
	ELSE 
		BoardLeftVol = -12 
		BEGIN 
			IF IsSoundPlaying SkaterBoardFlyInSound02 
				SetSoundParams SkaterBoardFlyInSound02 volR = 60 volL = <BoardLeftVol> pitch = ( 100 * <speed> ) 
			ENDIF 
			BoardLeftVol = ( <BoardLeftVol> + 2.05699992180 ) 
			Obj_GetAnimSpeed 
			wait 1 gameframe 
		REPEAT 35 
	ENDIF 
ENDSCRIPT

SCRIPT HandleCatchBoardSound { DefVol = 200 } 
	Obj_PlaySound SK6_BoardGrab01 vol = <DefVol> pitch = 115 
ENDSCRIPT

SCRIPT HandleKickBoardSound 
	Obj_PlaySound SK6_BoardGrab01 vol = 200 pitch = 80 
	RANDOM_NO_REPEAT(1, 1, 1, 1, 1) 
		RANDOMCASE Obj_PlaySound BailBodyPunch01_11 pitch = RANDOM_RANGE PAIR(80.00000000000, 102.00000000000) vol = RANDOM_RANGE PAIR(50.00000000000, 60.00000000000) 
		RANDOMCASE Obj_PlaySound BailBodyPunch02_11 pitch = RANDOM_RANGE PAIR(80.00000000000, 102.00000000000) vol = RANDOM_RANGE PAIR(50.00000000000, 60.00000000000) 
		RANDOMCASE Obj_PlaySound BailBodyPunch03_11 pitch = RANDOM_RANGE PAIR(80.00000000000, 102.00000000000) vol = RANDOM_RANGE PAIR(50.00000000000, 60.00000000000) 
		RANDOMCASE Obj_PlaySound BailBodyPunch04_11 pitch = RANDOM_RANGE PAIR(80.00000000000, 102.00000000000) vol = RANDOM_RANGE PAIR(50.00000000000, 60.00000000000) 
		RANDOMCASE Obj_PlaySound BailBodyPunch05_11 pitch = RANDOM_RANGE PAIR(80.00000000000, 102.00000000000) vol = RANDOM_RANGE PAIR(50.00000000000, 60.00000000000) 
	RANDOMEND 
	Obj_PlaySound SK6_BoardSplit01 pitch = 180 vol = 15 
ENDSCRIPT

SCRIPT HandleBoardScrapeSound 
	
	Obj_SpawnScript HandleBoardScrapeSound2 
ENDSCRIPT

SCRIPT HandleBoardScrapeSound2 
	SpawnSound BoardScrapeWaiting 
ENDSCRIPT

SCRIPT BoardScrapeWaiting 
	Obj_GetAnimSpeed 
	IF NOT flipped 
		PlaySound SK6_BoardScrapeLong02_11 volL = 75 volR = -15 pitch = ( 120 * <speed> ) id = SkaterBoardScrapeIn01 
		BoardRightVol = -15 
		BEGIN 
			IF IsSoundPlaying SkaterBoardScrapeIn01 
				SetSoundParams SkaterBoardScrapeIn01 volL = 75 volR = <BoardRightVol> pitch = ( 120 * <speed> ) 
			ENDIF 
			BoardRightVol = ( <BoardRightVol> + 2.57100009918 ) 
			Obj_GetAnimSpeed 
			wait 1 gameframe 
		REPEAT 35 
	ELSE 
		PlaySound SK6_BoardScrapeLong02_11 volR = 75 volL = -15 pitch = ( 120 * <speed> ) id = SkaterBoardScrapeIn02 
		BoardLeftVol = -15 
		BEGIN 
			IF IsSoundPlaying SkaterBoardScrapeIn02 
				SetSoundParams SkaterBoardScrapeIn02 volR = 75 volL = <BoardLeftVol> pitch = ( 120 * <speed> ) 
			ENDIF 
			BoardLeftVol = ( <BoardLeftVol> + 2.57100009918 ) 
			Obj_GetAnimSpeed 
			wait 1 gameframe 
		REPEAT 35 
	ENDIF 
ENDSCRIPT

SCRIPT HandleBoardRollingSound 
	
	Obj_SpawnScript HandleBoardRollingSound2 
ENDSCRIPT

SCRIPT HandleBoardRollingSound2 
	SpawnSound BoardRollingInWaiting 
ENDSCRIPT

SCRIPT BoardRollingInWaiting 
	Obj_GetAnimSpeed 
	IF flipped 
		PlaySound SK6_BoardRollIn01_11 volL = 75 volR = -15 pitch = ( 80 * <speed> ) id = SkaterBoardRollIn 
		BoardRightVol = -15 
		BEGIN 
			IF IsSoundPlaying SkaterBoardRollIn 
				SetSoundParams SkaterBoardRollIn volL = 75 volR = <BoardRightVol> pitch = ( 80 * <speed> ) 
			ENDIF 
			BoardRightVol = ( <BoardRightVol> + 2.57100009918 ) 
			Obj_GetAnimSpeed 
			wait 1 gameframe 
		REPEAT 35 
	ELSE 
		PlaySound SK6_BoardRollIn01_11 volR = 75 volL = -15 pitch = ( 80 * <speed> ) id = SkaterBoardRollIn02 
		BoardLeftVol = -15 
		BEGIN 
			IF IsSoundPlaying SkaterBoardRollIn02 
				SetSoundParams SkaterBoardRollIn02 volR = 75 volL = <BoardLeftVol> pitch = ( 80 * <speed> ) 
			ENDIF 
			BoardLeftVol = ( <BoardLeftVol> + 2.57100009918 ) 
			Obj_GetAnimSpeed 
			wait 1 gameframe 
		REPEAT 35 
	ENDIF 
ENDSCRIPT

SCRIPT HandleStoppingAStream 
	StopStream <name> 
ENDSCRIPT

SCRIPT HandleDiscusWhooshSound { DefPitch = 60 } 
	SpawnSound DiscusWhooshWaiting 
ENDSCRIPT

SCRIPT DiscusWhooshWaiting 
	PlaySound DE_PauseFlyIn pitch = <DefPitch> 
ENDSCRIPT

SCRIPT HandleBoardSplitSound 
	SpawnSound BoardSplittingWaiting 
ENDSCRIPT

SCRIPT BoardSplittingWaiting 
	Obj_PlaySound SK6_BoardSplit01 vol = 220 
	wait 0.05000000075 seconds 
	RANDOM_NO_REPEAT(1, 1, 1, 1, 1) 
		RANDOMCASE Obj_PlaySound BailBodyPunch01_11 pitch = RANDOM_RANGE PAIR(80.00000000000, 102.00000000000) vol = RANDOM_RANGE PAIR(70.00000000000, 80.00000000000) 
		RANDOMCASE Obj_PlaySound BailBodyPunch02_11 pitch = RANDOM_RANGE PAIR(80.00000000000, 102.00000000000) vol = RANDOM_RANGE PAIR(70.00000000000, 80.00000000000) 
		RANDOMCASE Obj_PlaySound BailBodyPunch03_11 pitch = RANDOM_RANGE PAIR(80.00000000000, 102.00000000000) vol = RANDOM_RANGE PAIR(70.00000000000, 80.00000000000) 
		RANDOMCASE Obj_PlaySound BailBodyPunch04_11 pitch = RANDOM_RANGE PAIR(80.00000000000, 102.00000000000) vol = RANDOM_RANGE PAIR(70.00000000000, 80.00000000000) 
		RANDOMCASE Obj_PlaySound BailBodyPunch05_11 pitch = RANDOM_RANGE PAIR(80.00000000000, 102.00000000000) vol = RANDOM_RANGE PAIR(70.00000000000, 80.00000000000) 
	RANDOMEND 
ENDSCRIPT

SCRIPT HandleTerrainLandSound 
	PlayLandSound 
ENDSCRIPT

SCRIPT HandleTerrainBonkSound 
	PlayBonkSound 
ENDSCRIPT

SCRIPT HandleSoundEffectEvent { DefVol = 100 DefPitch = 100 } 
	Obj_PlaySound <name> vol = <DefVol> pitch = <DefPitch> 
ENDSCRIPT

SCRIPT HandleHitGroundSoundEffect 
ENDSCRIPT

SCRIPT HandleFootstepWalkSoundEffectEvent 
	RANDOM_NO_REPEAT(1, 1, 1) 
		RANDOMCASE Obj_PlaySound ( SFX_FootStepWalk01 ) pitch = RANDOM_RANGE PAIR(97.00000000000, 102.00000000000) vol = RANDOM_RANGE PAIR(105.00000000000, 120.00000000000) 
		RANDOMCASE Obj_PlaySound ( SFX_FootStepWalk02 ) pitch = RANDOM_RANGE PAIR(97.00000000000, 102.00000000000) vol = RANDOM_RANGE PAIR(105.00000000000, 120.00000000000) 
		RANDOMCASE Obj_PlaySound ( SFX_FootStepWalk03 ) pitch = RANDOM_RANGE PAIR(97.00000000000, 102.00000000000) vol = RANDOM_RANGE PAIR(105.00000000000, 120.00000000000) 
	RANDOMEND 
ENDSCRIPT

SCRIPT HandlePedFootstepWalkSoundEffectEvent 
	RANDOM_NO_REPEAT(1, 1, 1) 
		RANDOMCASE Obj_PlaySound ( SFX_FootStepWalk01 ) pitch = RANDOM_RANGE PAIR(97.00000000000, 102.00000000000) vol = RANDOM_RANGE PAIR(105.00000000000, 120.00000000000) 
		RANDOMCASE Obj_PlaySound ( SFX_FootStepWalk02 ) pitch = RANDOM_RANGE PAIR(97.00000000000, 102.00000000000) vol = RANDOM_RANGE PAIR(105.00000000000, 120.00000000000) 
		RANDOMCASE Obj_PlaySound ( SFX_FootStepWalk03 ) pitch = RANDOM_RANGE PAIR(97.00000000000, 102.00000000000) vol = RANDOM_RANGE PAIR(105.00000000000, 120.00000000000) 
	RANDOMEND 
ENDSCRIPT

SCRIPT HandleFootstepRunSoundEffectEvent 
	RANDOM_NO_REPEAT(1, 1, 1, 1, 1) 
		RANDOMCASE Obj_PlaySound ( SFX_FootStepRun01 ) pitch = RANDOM_RANGE PAIR(97.00000000000, 102.00000000000) vol = RANDOM_RANGE PAIR(105.00000000000, 120.00000000000) 
		RANDOMCASE Obj_PlaySound ( SFX_FootStepRun02 ) pitch = RANDOM_RANGE PAIR(97.00000000000, 102.00000000000) vol = RANDOM_RANGE PAIR(105.00000000000, 120.00000000000) 
		RANDOMCASE Obj_PlaySound ( SFX_FootStepRun03 ) pitch = RANDOM_RANGE PAIR(97.00000000000, 102.00000000000) vol = RANDOM_RANGE PAIR(105.00000000000, 120.00000000000) 
		RANDOMCASE Obj_PlaySound ( SFX_FootStepRun04 ) pitch = RANDOM_RANGE PAIR(97.00000000000, 102.00000000000) vol = RANDOM_RANGE PAIR(105.00000000000, 120.00000000000) 
		RANDOMCASE Obj_PlaySound ( SFX_FootStepRun05 ) pitch = RANDOM_RANGE PAIR(97.00000000000, 102.00000000000) vol = RANDOM_RANGE PAIR(105.00000000000, 120.00000000000) 
	RANDOMEND 
	SkaterParticles_CreateStepGfx 
ENDSCRIPT

SCRIPT HandlePedFootstepRunSoundEffectEvent 
	RANDOM_NO_REPEAT(1, 1, 1, 1, 1) 
		RANDOMCASE Obj_PlaySound ( SFX_FootStepRun01 ) pitch = RANDOM_RANGE PAIR(97.00000000000, 102.00000000000) vol = RANDOM_RANGE PAIR(30.00000000000, 40.00000000000) 
		RANDOMCASE Obj_PlaySound ( SFX_FootStepRun02 ) pitch = RANDOM_RANGE PAIR(97.00000000000, 102.00000000000) vol = RANDOM_RANGE PAIR(30.00000000000, 40.00000000000) 
		RANDOMCASE Obj_PlaySound ( SFX_FootStepRun03 ) pitch = RANDOM_RANGE PAIR(97.00000000000, 102.00000000000) vol = RANDOM_RANGE PAIR(30.00000000000, 40.00000000000) 
		RANDOMCASE Obj_PlaySound ( SFX_FootStepRun04 ) pitch = RANDOM_RANGE PAIR(97.00000000000, 102.00000000000) vol = RANDOM_RANGE PAIR(30.00000000000, 40.00000000000) 
		RANDOMCASE Obj_PlaySound ( SFX_FootStepRun05 ) pitch = RANDOM_RANGE PAIR(97.00000000000, 102.00000000000) vol = RANDOM_RANGE PAIR(30.00000000000, 40.00000000000) 
	RANDOMEND 
ENDSCRIPT

SCRIPT HandleFootstepScuffSoundEffect 
	RANDOM_NO_REPEAT(1, 1) 
		RANDOMCASE Obj_PlaySound ScuffStepConc01 pitch = RANDOM_RANGE PAIR(85.00000000000, 102.00000000000) vol = RANDOM_RANGE PAIR(105.00000000000, 120.00000000000) 
		RANDOMCASE Obj_PlaySound ScuffStepConc02 pitch = RANDOM_RANGE PAIR(85.00000000000, 102.00000000000) vol = RANDOM_RANGE PAIR(105.00000000000, 120.00000000000) 
	RANDOMEND 
ENDSCRIPT

SCRIPT HandlePedFootstepScuffSoundEffect 
	RANDOM_NO_REPEAT(1, 1) 
		RANDOMCASE Obj_PlaySound ScuffStepConc01 pitch = RANDOM_RANGE PAIR(85.00000000000, 102.00000000000) vol = RANDOM_RANGE PAIR(30.00000000000, 40.00000000000) 
		RANDOMCASE Obj_PlaySound ScuffStepConc02 pitch = RANDOM_RANGE PAIR(85.00000000000, 102.00000000000) vol = RANDOM_RANGE PAIR(30.00000000000, 40.00000000000) 
	RANDOMEND 
ENDSCRIPT

SCRIPT HandleFootstepJumpSoundEffect 
ENDSCRIPT

SCRIPT HandlePedFootstepJumpSoundEffect 
ENDSCRIPT

SCRIPT HandleFootstepLandSoundEffect 
	IF ( LevelIs load_au ) 
		IF ( ( SFX_FootStepWalk01 ) = AU_SANDSTEP01 ) 
			SpawnSound SFX_HandleLandOnSand 
		ELSE 
			Obj_PlaySound LandStepConc02_11 pitch = RANDOM_RANGE PAIR(97.00000000000, 102.00000000000) vol = RANDOM_RANGE PAIR(105.00000000000, 120.00000000000) 
		ENDIF 
	ENDIF 
	SkaterParticles_CreateStepGfx 
ENDSCRIPT

SCRIPT HandlePedFootstepLandSoundEffect 
	Obj_PlaySound LandStepConc02_11 pitch = RANDOM_RANGE PAIR(97.00000000000, 102.00000000000) vol = RANDOM_RANGE PAIR(30.00000000000, 40.00000000000) 
ENDSCRIPT

SCRIPT HandleBailBodyFallSoundEffect 
	RANDOM_NO_REPEAT(1, 1, 1, 1, 1) 
		RANDOMCASE Obj_PlaySound BailBodyFall01 pitch = RANDOM_RANGE PAIR(95.00000000000, 105.00000000000) vol = RANDOM_RANGE PAIR(90.00000000000, 100.00000000000) 
		RANDOMCASE Obj_PlaySound BailBodyFall02 pitch = RANDOM_RANGE PAIR(95.00000000000, 105.00000000000) vol = RANDOM_RANGE PAIR(90.00000000000, 100.00000000000) 
		RANDOMCASE Obj_PlaySound BailBodyFall03 pitch = RANDOM_RANGE PAIR(95.00000000000, 105.00000000000) vol = RANDOM_RANGE PAIR(90.00000000000, 100.00000000000) 
		RANDOMCASE Obj_PlaySound BailBodyFall04 pitch = RANDOM_RANGE PAIR(95.00000000000, 105.00000000000) vol = RANDOM_RANGE PAIR(90.00000000000, 100.00000000000) 
		RANDOMCASE Obj_PlaySound BailBodyFall05 pitch = RANDOM_RANGE PAIR(95.00000000000, 105.00000000000) vol = RANDOM_RANGE PAIR(90.00000000000, 100.00000000000) 
	RANDOMEND 
ENDSCRIPT

SCRIPT HandlePedBailBodyFallSoundEffect 
	RANDOM_NO_REPEAT(1, 1, 1, 1, 1) 
		RANDOMCASE Obj_PlaySound BailBodyFall01 pitch = RANDOM_RANGE PAIR(95.00000000000, 105.00000000000) vol = RANDOM_RANGE PAIR(40.00000000000, 50.00000000000) 
		RANDOMCASE Obj_PlaySound BailBodyFall02 pitch = RANDOM_RANGE PAIR(95.00000000000, 105.00000000000) vol = RANDOM_RANGE PAIR(40.00000000000, 50.00000000000) 
		RANDOMCASE Obj_PlaySound BailBodyFall03 pitch = RANDOM_RANGE PAIR(95.00000000000, 105.00000000000) vol = RANDOM_RANGE PAIR(40.00000000000, 50.00000000000) 
		RANDOMCASE Obj_PlaySound BailBodyFall04 pitch = RANDOM_RANGE PAIR(95.00000000000, 105.00000000000) vol = RANDOM_RANGE PAIR(40.00000000000, 50.00000000000) 
		RANDOMCASE Obj_PlaySound BailBodyFall05 pitch = RANDOM_RANGE PAIR(95.00000000000, 105.00000000000) vol = RANDOM_RANGE PAIR(40.00000000000, 50.00000000000) 
	RANDOMEND 
ENDSCRIPT

SCRIPT HandleBailBodyPunchSoundEffect 
	RANDOM_NO_REPEAT(1, 1, 1, 1, 1) 
		RANDOMCASE Obj_PlaySound BailBodyPunch01_11 pitch = RANDOM_RANGE PAIR(80.00000000000, 102.00000000000) vol = RANDOM_RANGE PAIR(140.00000000000, 150.00000000000) 
		RANDOMCASE Obj_PlaySound BailBodyPunch02_11 pitch = RANDOM_RANGE PAIR(80.00000000000, 102.00000000000) vol = RANDOM_RANGE PAIR(140.00000000000, 150.00000000000) 
		RANDOMCASE Obj_PlaySound BailBodyPunch03_11 pitch = RANDOM_RANGE PAIR(80.00000000000, 102.00000000000) vol = RANDOM_RANGE PAIR(140.00000000000, 150.00000000000) 
		RANDOMCASE Obj_PlaySound BailBodyPunch04_11 pitch = RANDOM_RANGE PAIR(80.00000000000, 102.00000000000) vol = RANDOM_RANGE PAIR(140.00000000000, 150.00000000000) 
		RANDOMCASE Obj_PlaySound BailBodyPunch05_11 pitch = RANDOM_RANGE PAIR(80.00000000000, 102.00000000000) vol = RANDOM_RANGE PAIR(140.00000000000, 150.00000000000) 
	RANDOMEND 
ENDSCRIPT

SCRIPT HandlePedBailBodyPunchSoundEffect 
	RANDOM_NO_REPEAT(1, 1, 1, 1, 1) 
		RANDOMCASE Obj_PlaySound BailBodyPunch01_11 pitch = RANDOM_RANGE PAIR(80.00000000000, 102.00000000000) vol = RANDOM_RANGE PAIR(40.00000000000, 50.00000000000) 
		RANDOMCASE Obj_PlaySound BailBodyPunch02_11 pitch = RANDOM_RANGE PAIR(80.00000000000, 102.00000000000) vol = RANDOM_RANGE PAIR(40.00000000000, 50.00000000000) 
		RANDOMCASE Obj_PlaySound BailBodyPunch03_11 pitch = RANDOM_RANGE PAIR(80.00000000000, 102.00000000000) vol = RANDOM_RANGE PAIR(40.00000000000, 50.00000000000) 
		RANDOMCASE Obj_PlaySound BailBodyPunch04_11 pitch = RANDOM_RANGE PAIR(80.00000000000, 102.00000000000) vol = RANDOM_RANGE PAIR(40.00000000000, 50.00000000000) 
		RANDOMCASE Obj_PlaySound BailBodyPunch05_11 pitch = RANDOM_RANGE PAIR(80.00000000000, 102.00000000000) vol = RANDOM_RANGE PAIR(40.00000000000, 50.00000000000) 
	RANDOMEND 
ENDSCRIPT

SCRIPT HandleBailCrackSoundEffect 
	Obj_PlaySound BailCrack01 pitch = RANDOM_RANGE PAIR(100.00000000000, 110.00000000000) vol = RANDOM_RANGE PAIR(120.00000000000, 130.00000000000) 
ENDSCRIPT

SCRIPT HandlePedBailCrackSoundEffect 
	Obj_PlaySound BailCrack01 pitch = RANDOM_RANGE PAIR(100.00000000000, 110.00000000000) vol = RANDOM_RANGE PAIR(40.00000000000, 50.00000000000) 
ENDSCRIPT

SCRIPT HandleBailSlapSoundEffect 
	RANDOM_NO_REPEAT(1, 1, 1) 
		RANDOMCASE Obj_PlaySound BailSlap01 pitch = RANDOM_RANGE PAIR(95.00000000000, 115.00000000000) vol = RANDOM_RANGE PAIR(140.00000000000, 150.00000000000) 
		RANDOMCASE Obj_PlaySound BailSlap02 pitch = RANDOM_RANGE PAIR(95.00000000000, 115.00000000000) vol = RANDOM_RANGE PAIR(140.00000000000, 150.00000000000) 
		RANDOMCASE Obj_PlaySound BailSlap03 pitch = RANDOM_RANGE PAIR(95.00000000000, 115.00000000000) vol = RANDOM_RANGE PAIR(140.00000000000, 150.00000000000) 
	RANDOMEND 
ENDSCRIPT

SCRIPT HandlePedBailSlapSoundEffect 
	RANDOM_NO_REPEAT(1, 1, 1) 
		RANDOMCASE Obj_PlaySound BailSlap01 pitch = RANDOM_RANGE PAIR(95.00000000000, 115.00000000000) vol = RANDOM_RANGE PAIR(40.00000000000, 50.00000000000) 
		RANDOMCASE Obj_PlaySound BailSlap02 pitch = RANDOM_RANGE PAIR(95.00000000000, 115.00000000000) vol = RANDOM_RANGE PAIR(40.00000000000, 50.00000000000) 
		RANDOMCASE Obj_PlaySound BailSlap03 pitch = RANDOM_RANGE PAIR(95.00000000000, 115.00000000000) vol = RANDOM_RANGE PAIR(40.00000000000, 50.00000000000) 
	RANDOMEND 
ENDSCRIPT

SCRIPT HandleBailScrapeSoundEffect 
ENDSCRIPT

SCRIPT HandlePedBailScrapeSoundEffect 
ENDSCRIPT

SCRIPT HandleBailBoardSoundEffect 
	RANDOM_NO_REPEAT(1, 1, 1, 1, 1) 
		RANDOMCASE Obj_PlaySound BailBoard01 pitch = RANDOM_RANGE PAIR(100.00000000000, 102.00000000000) vol = RANDOM_RANGE PAIR(115.00000000000, 125.00000000000) 
		RANDOMCASE Obj_PlaySound BailBoard02 pitch = RANDOM_RANGE PAIR(100.00000000000, 102.00000000000) vol = RANDOM_RANGE PAIR(115.00000000000, 125.00000000000) 
		RANDOMCASE Obj_PlaySound BailBoard03 pitch = RANDOM_RANGE PAIR(100.00000000000, 102.00000000000) vol = RANDOM_RANGE PAIR(115.00000000000, 125.00000000000) 
		RANDOMCASE Obj_PlaySound BailBoard04 pitch = RANDOM_RANGE PAIR(100.00000000000, 102.00000000000) vol = RANDOM_RANGE PAIR(115.00000000000, 125.00000000000) 
		RANDOMCASE Obj_PlaySound BailBoard05 pitch = RANDOM_RANGE PAIR(100.00000000000, 102.00000000000) vol = RANDOM_RANGE PAIR(115.00000000000, 125.00000000000) 
	RANDOMEND 
ENDSCRIPT

SCRIPT HandlePedBailBoardSoundEffect 
	RANDOM_NO_REPEAT(1, 1, 1, 1, 1) 
		RANDOMCASE Obj_PlaySound BailBoard01 pitch = RANDOM_RANGE PAIR(100.00000000000, 102.00000000000) vol = RANDOM_RANGE PAIR(40.00000000000, 50.00000000000) 
		RANDOMCASE Obj_PlaySound BailBoard02 pitch = RANDOM_RANGE PAIR(100.00000000000, 102.00000000000) vol = RANDOM_RANGE PAIR(40.00000000000, 50.00000000000) 
		RANDOMCASE Obj_PlaySound BailBoard03 pitch = RANDOM_RANGE PAIR(100.00000000000, 102.00000000000) vol = RANDOM_RANGE PAIR(40.00000000000, 50.00000000000) 
		RANDOMCASE Obj_PlaySound BailBoard04 pitch = RANDOM_RANGE PAIR(100.00000000000, 102.00000000000) vol = RANDOM_RANGE PAIR(40.00000000000, 50.00000000000) 
		RANDOMCASE Obj_PlaySound BailBoard05 pitch = RANDOM_RANGE PAIR(100.00000000000, 102.00000000000) vol = RANDOM_RANGE PAIR(40.00000000000, 50.00000000000) 
	RANDOMEND 
ENDSCRIPT

SCRIPT HandleSkaterSprayPaint 
	IF GotParam on 
		IF flipped 
			SprayPaintOn bone = Bone_Palm_L 
		ELSE 
			SprayPaintOn bone = Bone_Palm_R 
		ENDIF 
	ENDIF 
	IF GotParam off 
		SprayPaintOff 
	ENDIF 
	IF GotParam splat 
		TagNow 
	ENDIF 
ENDSCRIPT

SCRIPT HandleVertSticker 
	VertStickerSlap 
ENDSCRIPT

SCRIPT HandlePedSprayPaint 
	IF GotParam on 
		SprayPaintOn bone = Bone_Palm_R 
	ENDIF 
	IF GotParam off 
		SprayPaintOff 
	ENDIF 
ENDSCRIPT

SCRIPT HandleLightning r = 200 g = 200 b = 255 
	
	ShakeCamera { 
		duration = 1.00000000000 
		vert_amp = 2.50000000000 
		horiz_amp = 2.50000000000 
		vert_vel = 20 
		horiz_vel = 20 
	} 
	IF NOT InSplitScreenGame 
		DoFlash { duration = 0.64999997616 
			additive 
			start_r = <r> start_g = <g> start_b = <b> start_a = 100 
		end_r = <r> end_g = <g> end_b = <b> end_a = 0 } 
	ENDIF 
	Vibrate_Controller_Safe actuator = 1 percent = 95 
	Obj_SpawnScript HandleLightning_cleanup 
ENDSCRIPT

SCRIPT HandleLightning_cleanup 
	wait 1 seconds 
	Vibrate_Controller_Safe actuator = 1 percent = 0 
ENDSCRIPT

SCRIPT HandleShrekBurp 
	Obj_StopStream ShrekBurpStream 
	Obj_PlayStream Burp01 vol = 150 priority = StreamPriorityHigh id = ShrekBurpStream 
	DestroyFlexibleParticleSystem name = ShrekBurpPart 
	CreateFlexibleParticleSystem name = ShrekBurpPart params_script = JEG_ShrekBurp_particle_params 
	ShakeCamera { 
		duration = 1.00000000000 
		vert_amp = 2.50000000000 
		horiz_amp = 1.00000000000 
		vert_vel = 7 
		horiz_vel = 5 
	} 
	Obj_SpawnScript HandleShrekBurp_cleanup 
	Vibrate_Controller_Safe actuator = 1 percent = 55 
ENDSCRIPT

SCRIPT HandleShrekBurp_cleanup 
	wait 0.20000000298 seconds 
	Vibrate_Controller_Safe actuator = 1 percent = 0 
ENDSCRIPT

SCRIPT handleVehiclegrind 
	
	CreateFlexibleParticleSystem name = VehSparks01 params_script = APM_VEH_SPARKS01_particle_params 
	Obj_SpawnScript handleVehiclegrind_cleanup 
ENDSCRIPT

SCRIPT handleVehiclegrind_cleanup 
	GetTags 
	BEGIN 
		IF NOT AnimEquals <grind_init_anim> 
			IF NOT AnimEquals <grind_idle_anim> 
				BREAK 
			ENDIF 
		ENDIF 
		wait 1 gameframe 
	REPEAT 
	DestroyFlexibleParticleSystem name = VehSparks01 
ENDSCRIPT

SCRIPT HandleFartBurst 
	
	PlaySound FlamingFireBall01 vol = 150 
	Obj_SpawnScript HandleFartBurst_cleanup 
	Vibrate_Controller_Safe actuator = 0 percent = 65 
	DestroyFlexibleParticleSystem name = FartBurstParticle 
	CreateFlexibleParticleSystem name = FartBurstParticle params_script = JEG_FartBurst_particle_params 
	BroadcastEvent type = AU_Beaver_Blast 
ENDSCRIPT

SCRIPT HandleFartBurst_cleanup 
	BEGIN 
		IF NOT InAir 
			BREAK 
		ENDIF 
		wait 1 gameframe 
	REPEAT 30 
	Vibrate_Controller_Safe actuator = 0 percent = 0 
ENDSCRIPT

SCRIPT HandleCanFlameOn 
	
	IF flipped 
		params_script = JEG_CanFlame_particle_params 
	ELSE 
		params_script = JEG_CanFlame_particle_params2 
	ENDIF 
	DestroyFlexibleParticleSystem name = CanFlameParticle 
	CreateFlexibleParticleSystem name = CanFlameParticle params_script = <params_script> 
	Obj_SpawnScript handleCanFlame_cleanup 
ENDSCRIPT

SCRIPT HandleCanFlameOff 
	
	IF flipped 
		params_script = JEG_CanFlameDur_particle_params 
	ELSE 
		params_script = JEG_CanFlameDur_particle_params2 
	ENDIF 
	CreateFlexibleParticleSystem name = CanFlameParticle2 params_script = <params_script> 
ENDSCRIPT

SCRIPT handleCanFlame_cleanup 
	GetTags 
	BEGIN 
		IF NOT AnimEquals Special_Muska_Burn_Init 
			IF NOT AnimEquals Special_Muska_Burn_Range 
				BREAK 
			ENDIF 
		ENDIF 
		wait 1 gameframe 
	REPEAT 
	DestroyFlexibleParticleSystem name = CanFlameParticle 
ENDSCRIPT

SCRIPT HandleDoubleCanOn 
	DestroyFlexibleParticleSystem name = Can1Particle 
	DestroyFlexibleParticleSystem name = Can2Particle 
	
	CreateFlexibleParticleSystem name = Can1Particle params_script = JEG_SprayBlue_particle_params 
	CreateFlexibleParticleSystem name = Can2Particle params_script = JEG_SprayRed_particle_params 
ENDSCRIPT

SCRIPT HandleDoubleCanOff 
	
	DestroyFlexibleParticleSystem name = Can1Particle 
	DestroyFlexibleParticleSystem name = Can2Particle 
ENDSCRIPT

SCRIPT HandleHoagieOn 
	
	DestroyFlexibleParticleSystem name = HoagieParticle 
	CreateFlexibleParticleSystem name = HoagieParticle params_script = JEG_Hoagie_particle_params 
ENDSCRIPT

SCRIPT HandleHoagieOff 
	
	DestroyFlexibleParticleSystem name = HoagieParticle 
ENDSCRIPT

SCRIPT HandleTiresOn 
	
	DestroyFlexibleParticleSystem name = TiresParticle 
	CreateFlexibleParticleSystem name = TiresParticle params_script = JEG_TireSmoke_particle_params 
ENDSCRIPT

SCRIPT HandleVortex 
	DestroyFlexibleParticleSystem name = KostonVortex 
	CreateFlexibleParticleSystem name = KostonVortex params_script = JEG_Spin_particle_params 
ENDSCRIPT

SCRIPT ThrowObjectScript 
	LaunchDirtyProjectile 
ENDSCRIPT



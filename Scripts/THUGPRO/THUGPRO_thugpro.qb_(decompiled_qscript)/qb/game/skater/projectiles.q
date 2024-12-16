
server_projectile_composite_structure = 
[ 
	{ component = motion } 
	{ component = velocity } 
	{ component = suspend } 
	{ component = collideanddie } 
	{ component = projectiletracker } 
	{ component = rigidbody } 
	{ component = sound } 
] 
net_server_projectile_composite_structure = 
[ 
	{ component = motion } 
	{ component = velocity } 
	{ component = suspend } 
	{ component = collideanddie } 
	{ component = projectiletracker } 
	{ component = rigidbody } 
	{ component = sound } 
] 
client_projectile_composite_structure = 
[ 
	{ component = motion } 
	{ component = velocity } 
	{ component = suspend } 
	{ component = collideanddie } 
	{ component = projectiletracker } 
	{ component = rigidbody } 
	{ component = sound } 
] 
SCRIPT ClientLaunchProjectile 
	Obj_GetId 
	<skaterId> = <ObjID> 
	<SoundType> = Default 
	SWITCH <ammo_type> 
		CASE tomato 
			<model> = [ { component = model model = "gameobjects\\projectiles\\tomato\\tomato.mdl" } ] 
			<projectilecollision> = [ { component = projectilecollision projectile_type = tomato } ] 
		CASE apple 
			<model> = [ { component = model model = "gameobjects\\projectiles\\apple\\apple.mdl" } ] 
			<projectilecollision> = [ { component = projectilecollision projectile_type = apple } ] 
		CASE beads 
			<model> = [ { component = model model = "gameobjects\\projectiles\\beads\\beads.mdl" } ] 
			<projectilecollision> = [ { component = projectilecollision projectile_type = beads } ] 
		CASE shrimp 
			<model> = [ { component = model model = "gameobjects\\projectiles\\shrimp\\shrimp.mdl" } ] 
			<projectilecollision> = [ { component = projectilecollision projectile_type = shrimp } ] 
		CASE smokebomb 
			<model> = [ { component = model model = "gameobjects\\projectiles\\smokebomb\\smokebomb.mdl" } ] 
			<projectilecollision> = [ { component = projectilecollision projectile_type = smokebomb } ] 
		CASE paintcan 
			<model> = [ { component = model model = "gameobjects\\projectiles\\paintcan\\paintcan.mdl" } ] 
			<projectilecollision> = [ { component = projectilecollision projectile_type = paintcan } ] 
			<SoundType> = AluminumCan 
		CASE beerbottle 
			<model> = [ { component = model model = "gameobjects\\projectiles\\beerbottle\\beerbottle.mdl" } ] 
			<projectilecollision> = [ { component = projectilecollision projectile_type = beerbottle } ] 
			<SoundType> = BA_GlassBottleNoBreak 
		CASE duck 
			<model> = [ { component = model model = "leveleditor\\props\\nj_duck\\nj_duck.mdl" } ] 
			<projectilecollision> = [ { component = projectilecollision projectile_type = duck } ] 
			<SoundType> = NJ_RubberDuck 
		DEFAULT 
			<model> = [ { component = model model = "GameObjects\\COMBO\\Goal_COMBO_O\\Goal_COMBO_O.mdl" } ] 
			<projectilecollision> = [ { component = projectilecollision projectile_type = tomato } ] 
	ENDSWITCH 
	ClientLaunchProjectileReal <...> 
ENDSCRIPT

SCRIPT ClientLaunchProjectileReal 
	IF InNetGame 
		RETURN 
	ENDIF 
	index = 0 
	BEGIN 
		FormatText checksumname = name "projectile_%i" i = <index> 
		IF NOT ObjectExists id = <name> 
			BREAK 
		ENDIF 
		IF ( <index> = 4 ) 
			RETURN 
		ENDIF 
		index = ( <index> + 1 ) 
	REPEAT 
	pos = <skater_pos> 
	IF NOT GotParam SoundType 
		<SoundType> = Default 
	ENDIF 
	TheParams = { 
		owner_id = <owner_id> 
		pos = <pos> 
		vel = <vel> 
		orient_to_vel 
		scale = 1.00000000000 
		radius = 24 
		name = <name> 
		SystemLifetime = 1 
		NeverSuspend 
		death_script = projectile_die 
		DieUponSettling 
		SoundType = <SoundType> 
	} 
	printf "create projectile" 
	IF OnServer 
		IF InNetGame 
			CreateCompositeObject { 
				Components = ( net_server_projectile_composite_structure + <model> + <projectilecollision> ) 
				Params = <TheParams> 
			} 
		ELSE 
			CreateCompositeObject { 
				Components = ( server_projectile_composite_structure + <model> ) 
				Params = <TheParams> 
			} 
		ENDIF 
	ELSE 
		CreateCompositeObject { 
			Components = ( client_projectile_composite_structure + <model> ) 
			Params = <TheParams> 
		} 
	ENDIF 
	<name> : RigidBody_IgnoreSkater 15 frames 
	<name> : RigidBody_Wake 
ENDSCRIPT

SCRIPT LaunchProjectile 
	GetCurrentSkaterID 
	IF NOT GotParam pos 
		<ObjID> : Obj_GetPosition 
	ENDIF 
	IF NOT GotParam vel 
		<ObjID> : Obj_GetVelocity 
	ENDIF 
	skater_pos = <pos> 
	skater_vel = <vel> 
	RemoveParameter pos 
	RemoveParameter vel 
	scale = 1.00000000000 
	radius = 24 
	IF GotParam ped_dist 
		delta_pos = ( <ped_pos> - <skater_pos> ) 
		vel = ( <delta_pos> * 4 + <ped_dist> * VECTOR(0.00000000000, 0.15000000596, 0.00000000000) ) 
	ELSE 
		GetHeading 
		z = ( 600 * <sine> ) 
		y = 20 
		x = ( 600 * <cosine> ) 
		vel = ( <x> * VECTOR(1.00000000000, 0.00000000000, 0.00000000000) + <y> * VECTOR(0.00000000000, 1.00000000000, 0.00000000000) + <z> * VECTOR(0.00000000000, 0.00000000000, 1.00000000000) + <skater_vel> ) 
	ENDIF 
	GetAmmoType 
	IF InNetGame 
		BroadcastProjectile { 
			ObjID = <ObjID> 
			type = <type> 
			scale = <scale> 
			radius = <radius> 
			pos = <skater_pos> 
			vel = <vel> 
			ammo_type = <ammo_type> 
		} 
	ENDIF 
	ClientLaunchProjectile owner_id = <ObjID> <...> 
ENDSCRIPT

SCRIPT projectile_hit_ped 
	IF NOT Skating 
		IF NOT CurrentScorePotGreaterThan 0 
			RunTimer_ComboStarted 
			Obj_SpawnScript wait_and_unpause_run_timer 
		ENDIF 
	ENDIF 
	IF NOT CurrentScorePotGreaterThan 0 
		no_combo = 1 
	ENDIF 
	SetTrickScore 500 
	SetTrickName "Gotcha!" 
	Display 
	IF GotParam no_combo 
		IF NOT DoingTrick 
			ClearPanel_Landed 
		ENDIF 
	ENDIF 
	change projectile_last_ped_id = <ped_id> 
	BroadcastEvent type = PedHitByProjectile 
	<projectile_id> : Die 
ENDSCRIPT

SCRIPT projectile_die 
ENDSCRIPT

SCRIPT hit_ped_script 
	projectile_hit_ped_sounds 
	Obj_SpawnScript projectile_splat_particles Params = { <...> } 
ENDSCRIPT

SCRIPT projectile_splat_particles 
	IF LevelIs load_tr 
		RETURN 
	ENDIF 
	bone = ( target_bone ) 
	SWITCH <ammo_type> 
		CASE apple 
			params_script = { apm_BO_applesplatta01_fast_particle_params bone = <bone> } 
			params_script2 = { apm_BO_applesplatta02_fast_particle_params bone = <bone> } 
		CASE duck 
			params_script = { apm_spraycan01_fast_particle_params bone = <bone> } 
			color1 = [ 128 32 128 128 ] 
			params_script2 = { apm_spraycan02_fast_particle_params bone = <bone> } 
			params_script3 = { apm_spraycan03_fast_particle_params bone = <bone> } 
		CASE beerbottle 
			Obj_PlaySound NJ_BottleBreak01 
		CASE beads 
			RETURN 
		CASE shrimp 
			params_script = { JOW_AU_ShrimpSplat01_fast_particle_params bone = <bone> } 
		CASE smokebomb 
			params_script = { JOW_SmokeBomb01_fast_particle_params bone = <bone> } 
			color1 = RANDOM(1, 1, 1) RANDOMCASE [ 112 64 24 72 ] RANDOMCASE [ 24 112 64 72 ] RANDOMCASE [ 64 24 112 72 ] RANDOMEND 
			color1_endAlpha = 0 
			params_script2 = { JOW_SmokeBomb02_fast_particle_params bone = <bone> } 
		CASE tomato 
			params_script = { apm_BA_Tomatosplatta01_fast_particle_params bone = <bone> } 
			params_script2 = { apm_BA_Tomatosplatta02_fast_particle_params bone = <bone> } 
		CASE paintcan 
			params_script = { apm_spraycan01_fast_particle_params bone = <bone> } 
			color1 = RANDOM(1, 1, 1) RANDOMCASE [ 128 32 32 128 ] RANDOMCASE [ 32 128 32 128 ] RANDOMCASE [ 32 32 128 128 ] RANDOMEND 
			params_script2 = { apm_spraycan02_fast_particle_params bone = <bone> } 
			params_script3 = { apm_spraycan03_fast_particle_params bone = <bone> } 
		DEFAULT 
			RETURN 
	ENDSWITCH 
	time = ( <params_script> . lifetime ) 
	Obj_GetId 
	IF NOT ( <ObjID> = 0 ) 
		GetUniqueMangledId id = proj_part_id1 ObjID = <ObjID> 
		proj_part1 = <uniqueID> 
		CreateFastParticleSystem { 
			name = <proj_part1> 
			params_script = <params_script> 
			attachObjId = <ObjID> 
		} 
		IF GotParam params_script2 
			GetUniqueMangledId id = proj_part_id2 ObjID = <ObjID> 
			proj_part2 = <uniqueID> 
			CreateFastParticleSystem { 
				name = <proj_part2> 
				params_script = <params_script2> 
				attachObjId = <ObjID> 
			} 
		ENDIF 
		IF GotParam params_script3 
			GetUniqueMangledId id = proj_part_id3 ObjID = <ObjID> 
			proj_part3 = <uniqueID> 
			CreateFastParticleSystem { 
				name = <proj_part3> 
				params_script = <params_script3> 
				attachObjId = <ObjID> 
			} 
		ENDIF 
		IF GotParam color1 
			MangleChecksums a = <proj_part1> b = <ObjID> 
			IF CompositeObjectExists name = <mangled_id> 
				<mangled_id> : SetStartColor <color1> 
				IF GotParam color1_endAlpha 
					setArrayElement arrayName = color1 index = 3 newValue = <color1_endAlpha> 
					<mangled_id> : SetEndColor <color1> 
				ENDIF 
			ENDIF 
		ENDIF 
		wait <time> seconds 
		MangleChecksums a = <proj_part1> b = <ObjID> 
		IF CompositeObjectExists name = <mangled_id> 
			<mangled_id> : Die 
		ENDIF 
		IF GotParam params_script2 
			MangleChecksums a = <proj_part2> b = <ObjID> 
			IF CompositeObjectExists name = <mangled_id> 
				<mangled_id> : Die 
			ENDIF 
		ENDIF 
		IF GotParam params_script3 
			MangleChecksums a = <proj_part3> b = <ObjID> 
			IF CompositeObjectExists name = <mangled_id> 
				<mangled_id> : Die 
			ENDIF 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT GetUniqueMangledId 
	BEGIN 
		MangleChecksums a = <id> b = <ObjID> 
		IF NOT ObjectExists id = <mangled_id> 
			BREAK 
		ENDIF 
		id = ( <id> + 1 ) 
	REPEAT 
	RETURN uniqueID = <id> 
ENDSCRIPT

SCRIPT wait_and_unpause_run_timer 
	wait 1 gameframes 
	RunTimer_unpause 
ENDSCRIPT

projectile_last_ped_id = 0 
SCRIPT give_skater_ammo num = 5 type = none 
	printf "give_skater_ammo" 
	Obj_SpawnScript SK6_SFX_Get_Throwing_Item 
	GetAmmo 
	GetAmmoType 
	IF IsSkaterOnVehicle 
		get_ammo_text type = <type> 
		FormatText textname = text "You can\'t carry %a on that thing!" a = <ammo_text> 
		create_console_message text = <text> rgba = [ 8 73 123 90 ] wait_and_die = 1 time = 3 
		RETURN 
	ENDIF 
	need_new_meter = 0 
	IF NOT ChecksumEquals a = <type> b = <ammo_type> 
		need_new_meter = 1 
		root_window : GetSingleTag menu_state 
		IF ( <menu_state> = off ) 
			get_ammo_text type = <type> 
			FormatText textname = text "\\c4You got %i %a!" i = <num> a = <ammo_text> 
			create_panel_message { 
				id = new_ammo_message 
				text = <text> 
				rgba = [ 128 128 128 128 ] 
				pos = PAIR(320.00000000000, 180.00000000000) 
				style = new_ammo_message_up 
			} 
			create_panel_message { 
				id = new_ammo_message2 
				text = "\\c4Press \\c0\\m3\\c4 to throw" 
				rgba = [ 128 128 128 128 ] 
				style = new_ammo_message_up 
				pos = PAIR(320.00000000000, 215.00000000000) 
			} 
		ENDIF 
	ENDIF 
	IF ( <ammo> = 0 ) 
		need_new_meter = 1 
	ENDIF 
	IF ( <need_new_meter> = 1 ) 
		create_ammo_meter type = <type> 
	ENDIF 
	IF ( <num> > <ammo> ) 
		SetAmmoType <type> 
		get_ammo_text type = <type> 
		IF ( <ammo> = 0 ) 
			FormatText textname = text "You got %i %a!" i = <num> a = <ammo_text> 
		ELSE 
			FormatText textname = text "You got %i more %a!" i = ( <num> - <ammo> ) a = <ammo_text> 
		ENDIF 
		SetAmmo <num> 
		BroadcastEvent type = SkaterGotAmmo 
		create_console_message text = <text> rgba = [ 0 70 0 100 ] wait_and_die = 1 time = 3 
	ELSE 
		GetAmmoType 
		get_ammo_text type = <ammo_type> 
		FormatText textname = text "You already have %i %a!" i = <ammo> a = <ammo_text> 
		create_console_message text = <text> rgba = [ 8 73 123 90 ] wait_and_die = 1 time = 3 
	ENDIF 
ENDSCRIPT

SCRIPT get_ammo_text 
	SWITCH <type> 
		CASE apple 
			ammo_text = "apples" 
		CASE beads 
			ammo_text = "beads" 
		CASE shrimp 
			ammo_text = "shrimp" 
		CASE smokebomb 
			ammo_text = "smokebomb" 
		CASE tomato 
			ammo_text = "tomatos" 
		CASE paintcan 
			ammo_text = "paint cans" 
		CASE beerbottle 
			ammo_text = "bottles" 
		CASE ducks 
			ammo_text = "ducks" 
		DEFAULT 
			ammo_text = "ammo" 
	ENDSWITCH 
	RETURN ammo_text = <ammo_text> 
ENDSCRIPT

target_bone = Bone_Chest 
SCRIPT choose_projectile_target_bone 
	change target_bone = RANDOM(1, 1, 1, 1, 1) RANDOMCASE Bone_Chest RANDOMCASE Bone_Pelvis RANDOMCASE Bone_Head RANDOMCASE Bone_Bicep_L RANDOMCASE Bone_Bicep_R RANDOMEND 
ENDSCRIPT

SCRIPT skate_maybe_throw_projectile 
	IF IsSkaterOnVehicle 
		RETURN 
	ENDIF 
	IF AnimEquals NoProjectileAnims 
		RETURN 
	ENDIF 
	IF IsInBail 
		RETURN 
	ENDIF 
	IF IsInRevert 
		printf "IN REVERT" 
		RETURN 
	ENDIF 
	Obj_SpawnScript throw_while_skating 
	GetAmmo 
	ammo = ( <ammo> - 1 ) 
	SetAmmo <ammo> 
	Obj_KillSpawnedScript name = ammo_meter_change 
	Obj_SpawnScript ammo_meter_change Params = { count = -1 } 
	IF ( <ammo> = 0 ) 
		text = "You\'re out of ammo!" 
		SpawnSound SK6_SFX_OutOfAmmoBuzzer 
		BroadcastEvent type = SkaterOutOfAmmo 
		create_console_message text = <text> rgba = [ 70 0 0 70 ] wait_and_die = 1 time = 3 
	ENDIF 
ENDSCRIPT

NoProjectileAnims = [ 
	_1990Invert_init 
	_1990Invert_range 
	_1990Invert_out 
	HeelflipFSInvert_init 
	HeelflipFSInvert_range 
	HeelflipFSInvert_out 
	AndrectInvert_init 
	AndrectInvert_range 
	AndrectInvert_out 
	OneFootInvert_init 
	OneFootInvert_range 
	OneFootInvert_out 
	Invert_init 
	Invert_range 
	Invert_out 
	GymnastPlant_init 
	GymnastPlant_range 
	GymnastPlant_out 
	MuteInvert_init 
	MuteInvert_range 
	MuteInvert_out 
	HandstandHandFlip_Init 
	HandstandHandFlip_range 
	HandstandHandFlip_out 
	HandstandCasper_Init 
	HandstandCasper_range 
	HandstandCasper_out 
	HStandFliptoHStand 
	HandstandHandFlip_range 
	HandstandHandFlip_out 
] 
SCRIPT throw_while_skating anim = Throw_Sidearm_Partial 
	IF NOT Skating 
		goto throw_while_walking 
	ENDIF 
	SetThrowingProjectile 
	IF IsSkaterOnVehicle 
		anim = walking_throw_partial 
	ENDIF 
	IF Obj_AnimSubsetExists SubsetId = Cloth 
		Obj_RemoveAnimSubset SubsetId = Cloth 
	ENDIF 
	OnExitRun throw_while_skating_exit 
	IF NOT Obj_AnimSubsetExists SubsetId = Throw 
		Obj_AddAnimSubset SubsetId = Throw EnableBlending Stage = 2 
	ENDIF 
	Obj_SetAnimSubsetWeight SubsetId = Throw BlendWeight = 1 BlendDuration = 0.10000000149 
	IF Obj_AnimationFlipped 
		Obj_Flip SubsetId = Throw 
	ENDIF 
	PlayAnim SubsetId = Throw anim = <anim> speed = 1 
	Obj_SpawnScript throw_projectile Params = { frames = 15 } 
	wait 0.69999998808 Second 
	IF Obj_AnimSubsetExists SubsetId = Throw 
		Obj_SetAnimSubsetWeight SubsetId = Throw BlendWeight = 0 BlendDuration = 0.60000002384 
		Obj_WaitAnimFinished SubsetId = Throw 
	ENDIF 
ENDSCRIPT

projectile_control = square 
SCRIPT throw_while_skating_exit 
	IF Obj_AnimSubsetExists SubsetId = Throw 
		Obj_RemoveAnimSubset SubsetId = Throw 
	ENDIF 
	UnsetThrowingProjectile 
ENDSCRIPT

SCRIPT walk_maybe_throw_projectile 
	Obj_SpawnScript walk_maybe_throw_projectile2 
ENDSCRIPT

SCRIPT walk_maybe_throw_projectile2 
	IF AnimFinished 
		RETURN 
	ENDIF 
	IF NOT Walking 
		goto throw_while_skating 
	ENDIF 
	MakeSkaterGoto throw_while_walking 
	GetAmmo 
	ammo = ( <ammo> - 1 ) 
	SetAmmo <ammo> 
	Obj_KillSpawnedScript name = ammo_meter_change 
	Obj_SpawnScript ammo_meter_change Params = { count = -1 } 
	IF ( <ammo> = 0 ) 
		text = "You\'re out of ammo!" 
		SpawnSound SK6_SFX_OutOfAmmoBuzzer 
		BroadcastEvent type = SkaterOutOfAmmo 
		create_console_message text = <text> rgba = [ 70 0 0 70 ] wait_and_die = 1 time = 3 
	ENDIF 
ENDSCRIPT

SCRIPT throw_projectile frames = 0 
	wait <frames> frames 
	Obj_SpawnScript ALL_Levels_SFX_PlayThrowingSound 
	LaunchDirtyProjectile 
ENDSCRIPT

SCRIPT throw_while_walking 
	GetSpeed 
	SetThrowingProjectile 
	OnExitRun throw_while_walking_cleanup 
	IF NOT Walk_Air 
		IF ( 1 > <speed> ) 
			standing = 1 
		ENDIF 
	ENDIF 
	IF GotParam standing 
		PlayAnim anim = standing_throw BlendPeriod = 0.10000000149 speed = 1.10000002384 
		Obj_WaitAnimFinished 
	ELSE 
		IF Obj_AnimSubsetExists SubsetId = Throw 
			Obj_RemoveAnimSubset SubsetId = Throw 
		ENDIF 
		IF NOT Obj_AnimSubsetExists SubsetId = Throw 
			Obj_AddAnimSubset SubsetId = Throw EnableBlending Stage = 2 
			IF Obj_AnimationFlipped 
				Obj_Flip SubsetId = Throw 
			ENDIF 
		ENDIF 
		partial_anim = walking_throw_partial 
		GetAnimLength anim = <partial_anim> 
		PlayAnim SubsetId = Throw anim = <partial_anim> speed = 1 BlendPeriod = 0 
		Obj_SetAnimSubsetWeight SubsetId = Throw BlendWeight = 1 BlendDuration = 0.10000000149 
		Obj_SpawnScript throw_projectile Params = { frames = 17 } 
		Obj_SpawnScript throw_while_walking_exit Params = { length = <length> } 
		OnExitRun 
	ENDIF 
	MakeSkaterGoto GroundOrAirWaitState 
ENDSCRIPT

SCRIPT throw_while_walking_exit 
	OnExitRun throw_while_walking_cleanup 
	IF Obj_AnimSubsetExists SubsetId = Throw 
		Obj_WaitAnimFinished SubsetId = Throw 
	ENDIF 
ENDSCRIPT

SCRIPT throw_while_walking_cleanup 
	IF Obj_AnimSubsetExists SubsetId = Throw 
		Obj_RemoveAnimSubset SubsetId = Throw 
	ENDIF 
	UnsetThrowingProjectile 
ENDSCRIPT

server_fireball_composite_structure = 
[ 
	{ component = model } 
	{ component = velocity } 
	{ component = suspend } 
	{ component = projectilecollision projectile_type = fireball } 
	{ component = collideanddie } 
	{ component = particle } 
] 
SCRIPT fireball_death 
	<EmitRate> = 30.00000000000 
	<StartRadius> = 20.00000000000 
	<MidRadius> = 100.00000000000 
	<EndRadius> = 6.00000000000 
	SWITCH ( firefight_projectile_type ) 
		CASE fireball 
			explosion_texture = dt_nj_flame02 
			start_color = [ 255 , 111 , 54 , 255 ] 
			end_color = [ 135 , 35 , 0 , 255 ] 
		CASE rocket 
			explosion_texture = apm_debis_01 
			RANDOM(1, 1, 1) 
				RANDOMCASE start_color = [ 111 , 255 , 54 , 255 ] end_color = [ 11 , 35 , 255 , 255 ] 
				RANDOMCASE start_color = [ 255 , 111 , 54 , 255 ] end_color = [ 11 , 255 , 35 , 255 ] 
				RANDOMCASE start_color = [ 111 , 54 , 255 , 255 ] end_color = [ 255 , 35 , 11 , 255 ] 
			RANDOMEND 
		CASE snowball 
			explosion_texture = JOW_CA_Snowflake01 
			start_color = [ 200 , 200 , 210 , 255 ] 
			end_color = [ 245 , 245 , 255 , 255 ] 
			<EmitRate> = 10.00000000000 
			<StartRadius> = 20.00000000000 
			<MidRadius> = 50.00000000000 
			<EndRadius> = 6.00000000000 
		DEFAULT 
			explosion_texture = dt_nj_flame02 
			start_color = [ 255 , 111 , 54 , 255 ] 
			end_color = [ 135 , 35 , 0 , 255 ] 
	ENDSWITCH 
	IF IsTrue g_NoParticles 
		rotated_vel = ( ( <vel> . VECTOR(0.00000000000, 0.00000000000, 1.00000000000) ) * VECTOR(1.00000000000, 0.00000000000, 0.00000000000) + ( <vel> . VECTOR(0.00000000000, 1.00000000000, 0.00000000000) ) * VECTOR(0.00000000000, 1.00000000000, 0.00000000000) + ( <vel> . VECTOR(1.00000000000, 0.00000000000, 0.00000000000) ) * VECTOR(0.00000000000, 0.00000000000, -1.00000000000) ) 
		NormalizeVector <rotated_vel> 
		align_norm = <norm> 
		NormalizeVector <vel> 
		vel_norm = <norm> 
		SpawnPoly { 
			pos = ( <pos> - ( <vel_norm> * 100 ) ) 
			align_vector = <align_norm> 
			start_dims = PAIR(20.00000000000, 20.00000000000) 
			end_dims = PAIR(227.00000000000, 227.00000000000) 
			lifetime = 0.30000001192 
			start_color = <start_color> 
			end_color = <end_color> 
			BlendMode = Add 
			Texture = <explosion_texture> 
		} 
	ELSE 
		index = 0 
		BEGIN 
			FormatText checksumname = name "explosion_%i" i = <index> 
			IF NOT ObjectExists id = <name> 
				BREAK 
			ENDIF 
			index = ( <index> + 1 ) 
		REPEAT 
		CreateCompositeObject { 
			Components = explosion_composite_structure 
			Params = { 
				name = <name> 
				pos = <pos> 
				vel = <vel> 
				orient_to_vel 
				scale = <scale> 
				LocalSpace 
				UseStartPosition 
				NoName 
				SystemLifetime = 400 
				NeverSuspend 
				StartPosition = VECTOR(0.00000000000, 0.00000000000, -50.00000000000) 
				BoxDimsStart = VECTOR(20.22046279907, 20.22046279907, 20.22046279907) 
				MidPosition = VECTOR(0.65409302711, -0.76770800352, 0.41774299741) 
				BoxDimsMid = VECTOR(74.37434387207, 74.37434387207, 74.37434387207) 
				EndPosition = VECTOR(-0.94729298353, -0.83414101601, -0.78278702497) 
				BoxDimsEnd = VECTOR(227.08786010742, 227.08786010742, 227.08786010742) 
				Texture = <explosion_texture> 
				CreatedAtStart 
				AbsentInNetGames 
				UseMidPoint 
				UseColorMidTime 
				type = NEWFLAT 
				BlendMode = Add 
				FixedAlpha = 128 
				AlphaCutoff = 0 
				MaxStreams = 2 
				SuspendDistance = 0 
				lod_dist1 = 400 
				lod_dist2 = 401 
				EmitRate = <EmitRate> 
				lifetime = 0.30000001192 
				MidPointPCT = 50 
				StartRadius = <StartRadius> 
				MidRadius = <MidRadius> 
				EndRadius = <EndRadius> 
				StartRadiusSpread = 0.00000000000 
				MidRadiusSpread = 0.00000000000 
				EndRadiusSpread = 10.00000000000 
				StartRGB = <start_color> 
				StartAlpha = 129 
				ColorMidTime = 50 
				MidRGB = <end_color> 
				MidAlpha = 133 
				EndRGB = [ 0 , 0 , 0 ] 
				EndAlpha = 51 
			} 
		} 
	ENDIF 
ENDSCRIPT

SCRIPT fireball_explode_model 
	scale = 1.00000000000 
	exp = 1 
	BEGIN 
		IF ( <exp> < 15 ) 
			<scale> = ( <scale> + ( 0.10000000149 * <exp> ) ) 
		ELSE 
			<scale> = ( <scale> - ( 0.10000000149 * <exp> ) ) 
		ENDIF 
		<exp> = ( <exp> + 1 ) 
		IF ( <scale> < 0.00000000000 ) 
			scale = 0.00000000000 
		ENDIF 
		Obj_ApplyScaling x = <scale> y = <scale> z = <scale> 
		wait 1 frames 
	REPEAT 20 
ENDSCRIPT

SCRIPT LaunchFireball vel_scale = 1.00000000000 
	IF NOT GameModeEquals is_firefight 
		RETURN 
	ENDIF 
	GetFireballLevel 
	point_scale = 3 
	SWITCH <level> 
		CASE 1 
			point_scale = 1 
		CASE 2 
			point_scale = 5 
		CASE 3 
			point_scale = 25 
		CASE 4 
			point_scale = 100 
		CASE 5 
			point_scale = 250 
	ENDSWITCH 
	GetSkaterPosition 
	scaled_vel = ( <vel_scale> * 5000.00000000000 ) 
	GetSkaterVelocity scale = <scaled_vel> <...> 
	IF CurrentScorePotGreaterThan ( 20000 * <point_scale> ) 
		radius = 400 
		scale = 10.00000000000 
	ELSE 
		IF CurrentScorePotGreaterThan ( 10000 * <point_scale> ) 
			radius = 200 
			scale = 5.00000000000 
		ELSE 
			IF CurrentScorePotGreaterThan ( 5000 * <point_scale> ) 
				radius = 100 
				scale = 3.50000000000 
			ELSE 
				IF CurrentScorePotGreaterThan ( 2500 * <point_scale> ) 
					radius = 75 
					scale = 2.50000000000 
				ELSE 
					IF CurrentScorePotGreaterThan ( 750 * <point_scale> ) 
						radius = 60 
						scale = 2.00000000000 
					ELSE 
						IF CurrentScorePotGreaterThan ( 250 * <point_scale> ) 
							radius = 45 
							scale = 1.50000000000 
						ELSE 
							radius = 24 
							scale = 1.00000000000 
						ENDIF 
					ENDIF 
				ENDIF 
			ENDIF 
		ENDIF 
	ENDIF 
	new_y = ( <y> ) 
	<y> = <new_y> 
	GetCurrentSkaterID 
	IF InNetGame 
		BroadcastProjectile { 
			ObjID = <ObjID> 
			type = fireball 
			scale = <scale> 
			radius = <radius> 
			pos = ( <x> * VECTOR(1.00000000000, 0.00000000000, 0.00000000000) + <new_y> * VECTOR(0.00000000000, 1.00000000000, 0.00000000000) + <z> * VECTOR(0.00000000000, 0.00000000000, 1.00000000000) ) 
			vel = ( <scaled_x> * VECTOR(1.00000000000, 0.00000000000, 0.00000000000) + <scaled_y> * VECTOR(0.00000000000, 1.00000000000, 0.00000000000) + <scaled_z> * VECTOR(0.00000000000, 0.00000000000, 1.00000000000) ) 
		} 
	ENDIF 
	ClientLaunchFireball owner_id = <ObjID> <...> 
ENDSCRIPT

SCRIPT ClientLaunchFireball 
	IF NOT GameModeEquals is_firefight 
		RETURN 
	ENDIF 
	SWITCH ( firefight_projectile_type ) 
		CASE fireball 
			<fireball_sound> = FlamingFireBall01 
			IF IsTrue g_NoParticles 
				<fireball_model> = "GameObjects\\Net\\Sprite\\Sprite.mdl" 
			ELSE 
				<fireball_model> = "fireball\\fireball.mdl" 
			ENDIF 
			<fireball_texture> = dt_nj_flame02 
		CASE rocket 
			<fireball_sound> = Sk6_JumpFar_01 
			<fireball_model> = "GameObjects\\Net\\Rocket\\Rocket.mdl" 
			<fireball_texture> = white 
			IF ( <scale> > 3.00000000000 ) 
				<scale> = 3.00000000000 
			ENDIF 
		CASE snowball 
			<fireball_sound> = foleymove01 
			<fireball_model> = "GameObjects\\Net\\Snowball\\Snowball.mdl" 
			<fireball_texture> = white 
			IF ( <scale> > 3.00000000000 ) 
				<scale> = 3.00000000000 
			ENDIF 
		DEFAULT 
			<fireball_sound> = FlamingFireBall01 
			IF IsTrue g_NoParticles 
				<fireball_model> = "GameObjects\\Net\\Sprite\\Sprite.mdl" 
			ELSE 
				<fireball_model> = "fireball\\fireball.mdl" 
			ENDIF 
			<fireball_texture> = dt_nj_flame02 
	ENDSWITCH 
	index = 0 
	BEGIN 
		FormatText checksumname = name "fireball_%i" i = <index> 
		IF NOT ObjectExists id = <name> 
			BREAK 
		ENDIF 
		index = ( <index> + 1 ) 
	REPEAT 
	spawn_position = ( <x> * VECTOR(1.00000000000, 0.00000000000, 0.00000000000) + <y> * VECTOR(0.00000000000, 1.00000000000, 0.00000000000) + <z> * VECTOR(0.00000000000, 0.00000000000, 1.00000000000) ) 
	spawn_vel = ( <scaled_x> * VECTOR(1.00000000000, 0.00000000000, 0.00000000000) + <scaled_y> * VECTOR(0.00000000000, 1.00000000000, 0.00000000000) + <scaled_z> * VECTOR(0.00000000000, 0.00000000000, 1.00000000000) ) 
	TheParams = { 
		owner_id = <owner_id> 
		name = <name> 
		pos = <spawn_position> 
		vel = <spawn_vel> 
		orient_to_vel 
		scale = <scale> 
		x = <scale> 
		y = <scale> 
		z = <scale> 
		radius = <radius> 
		model = <fireball_model> 
		LocalSpace 
		UseStartPosition 
		NoName 
		SystemLifetime = 10000 
		NeverSuspend 
		death_script = fireball_death 
		StartPosition = VECTOR(0.00000000000, 0.00000000000, 0.00000000000) 
		BoxDimsStart = VECTOR(3.33959388733, 3.33959388733, 3.33959388733) 
		MidPosition = VECTOR(-0.10193400085, 2.32613801956, -75.07246398926) 
		BoxDimsMid = VECTOR(10.16847038269, 10.16847038269, 10.16847038269) 
		EndPosition = VECTOR(-1.16847097874, 1.35173904896, -301.16650390625) 
		BoxDimsEnd = VECTOR(2.50771403313, 2.50771403313, 2.50771403313) 
		Texture = <fireball_texture> 
		CreatedAtStart 
		AbsentInNetGames 
		UseMidPoint 
		UseColorMidTime 
		type = NEWFLAT 
		BlendMode = Add 
		FixedAlpha = 128 
		AlphaCutoff = 0 
		MaxStreams = 2 
		SuspendDistance = 0 
		lod_dist1 = 400 
		lod_dist2 = 401 
		EmitRate = 30.00000000000 
		lifetime = 0.75000000000 
		MidPointPCT = 50 
		StartRadius = 20.00000000000 
		MidRadius = 20.00000000000 
		EndRadius = 5.00000000000 
		StartRadiusSpread = 0.00000000000 
		MidRadiusSpread = 0.00000000000 
		EndRadiusSpread = 10.00000000000 
		StartRGB = [ 54 , 97 , 255 ] 
		StartAlpha = 129 
		ColorMidTime = 50 
		MidRGB = [ 135 , 35 , 0 ] 
		MidAlpha = 27 
		EndRGB = [ 0 , 0 , 0 ] 
		EndAlpha = 0 
	} 
	IF OnServer 
		CreateCompositeObject { 
			Components = server_fireball_composite_structure 
			Params = <TheParams> 
		} 
	ELSE 
		CreateCompositeObject { 
			Components = fireball_composite_structure 
			Params = <TheParams> 
		} 
	ENDIF 
	IF ( ( firefight_projectile_type ) = fireball ) 
		IF IsTrue g_NoParticles 
			<name> : Obj_ReplaceTexture src = "outside_glow_2.png" dest = "images/particles/dt_nj_flame02" 
		ENDIF 
	ENDIF 
	<name> : Obj_GetVelocity 
	NormalizeVector <vel> 
	<name> : Obj_SetOrientation dir = <norm> 
	Obj_PlaySound <fireball_sound> vol = ( 130 + <scale> * 15 ) pitch = ( 190 - <scale> * 7 ) dropoff = 140 
ENDSCRIPT



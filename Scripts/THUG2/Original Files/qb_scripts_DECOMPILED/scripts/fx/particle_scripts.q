
Force_Particle_Update_Time = 1.00000000000 
SCRIPT CreateFlexibleParticleSystem 
	IF NOT gotparam name 
		script_assert "No <name> parameter" 
	ENDIF 
	IF NOT gotparam params_script 
		script_assert "No <params_script> parameter" 
	ENDIF 
	IF NOT GlobalExists name = <params_script> type = structure 
		FormatText TextName = msg "\'%s\' could not be found. Typo?" s = <params_script> 
		script_assert <msg> 
	ENDIF 
	IF NOT gotparam objId 
		Obj_GetId 
	ENDIF 
	MangleChecksums a = <name> b = <objId> 
	IF NOT ObjectExists id = <mangled_id> 
		IF CutsceneDestroyListActive 
			AddToCutsceneDestroyList { 
				destroy_func = DestroyFlexibleParticleSystem 
				name = <mangled_id> 
				destroy_params = { name = <name> objId = <objId> } 
			} 
		ENDIF 
		alloc_flexible_particle params_script = ( <params_script> ) name = <mangled_id> objId = <objId> bone = <bone> 
	ENDIF 
ENDSCRIPT

SCRIPT GetFlexibleParticleSystem 
	IF NOT gotparam name 
		script_assert "No <name> parameter" 
	ENDIF 
	IF NOT gotparam objId 
		Obj_GetId 
	ENDIF 
	MangleChecksums a = <name> b = <objId> 
	IF ObjectExists id = <mangled_id> 
		RETURN system = <mangled_id> 
	ENDIF 
ENDSCRIPT

SCRIPT DestroyFlexibleParticleSystem 
	IF NOT gotparam name 
		script_assert "No <name> parameter" 
	ENDIF 
	IF NOT gotparam objId 
		Obj_GetId 
	ENDIF 
	MangleChecksums a = <name> b = <objId> 
	IF ObjectExists id = <mangled_id> 
		IF CutsceneDestroyListActive 
			RemoveFromCutsceneDestroyList name = <mangled_id> 
		ENDIF 
		<mangled_id> : DestroyParticles 
	ENDIF 
ENDSCRIPT

SCRIPT alloc_flexible_particle groupID = 0 
	IF StructureContains structure = <params_script> SuspendDistance 
		CreateCompositeObject { 
			Components = [ 
				{ 
					Component = Suspend 
					SuspendDistance = ( <params_script> . SuspendDistance ) 
				} 
				{ 
					( <params_script> ) 
					Component = lockobj 
					id = <objId> 
					bone = <bone> 
				} 
				{ 
					( <params_script> ) 
					Component = FlexibleParticle 
					groupID = <groupID> 
				} 
			] 
			Params = { 
				name = <name> 
				Params = { ( <params_script> . Params ) name = <name> objId = <objId> } 
			} 
		} 
	ELSE 
		CreateCompositeObject { 
			Components = [ 
				{ 
					( <params_script> ) 
					Component = lockobj 
					id = <objId> 
					bone = <bone> 
				} 
				{ 
					( <params_script> ) 
					Component = FlexibleParticle 
					groupID = <groupID> 
				} 
			] 
			Params = { 
				name = <name> 
				Params = { ( <params_script> . Params ) name = <name> objId = <objId> } 
			} 
		} 
	ENDIF 
	IF ObjectExists id = <name> 
		<name> : EmitOn 
	ELSE 
		script_assert "alloc_flexible_particle failed!" 
	ENDIF 
ENDSCRIPT

SCRIPT CreateGlobalFlexParticleSystem 
	IF NOT gotparam name 
		script_assert "No <name> parameter" 
	ENDIF 
	IF NOT gotparam params_script 
		script_assert "No <params_script> parameter" 
	ENDIF 
	IF NOT GlobalExists name = <params_script> type = structure 
		FormatText TextName = msg "\'%s\' could not be found. Typo?" s = <params_script> 
		script_assert <msg> 
	ENDIF 
	IF NOT ObjectExists id = <name> 
		
		IF CutsceneDestroyListActive 
			AddToCutsceneDestroyList { 
				destroy_func = DestroyGlobalFlexParticleSystem 
				name = <name> 
				destroy_params = { name = <name> } 
			} 
		ENDIF 
		IF StructureContains structure = <params_script> SuspendDistance 
			CreateCompositeObject { 
				Components = [ 
					{ 
						Component = Suspend 
						SuspendDistance = ( <params_script> . SuspendDistance ) 
					} 
					{ 
						Component = FlexibleParticle 
						groupID = 0 
						( <params_script> ) 
					} 
				] 
				Params = { 
					name = <name> 
					Params = { ( <params_script> . Params ) name = <name> } 
				} 
			} 
		ELSE 
			CreateCompositeObject { 
				Components = [ 
					{ 
						Component = FlexibleParticle 
						groupID = 0 
						( <params_script> ) 
					} 
				] 
				Params = { 
					name = <name> 
					Params = { ( <params_script> . Params ) name = <name> } 
				} 
			} 
		ENDIF 
		IF ObjectExists id = <name> 
			<name> : EmitOn 
		ELSE 
			script_assert "CreateGlobalFlexParticleSystem failed!" 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT DestroyGlobalFlexParticleSystem 
	IF NOT gotparam name 
		script_assert "No <name> parameter" 
	ENDIF 
	IF ObjectExists id = <name> 
		IF CutsceneDestroyListActive 
			RemoveFromCutsceneDestroyList name = <name> 
		ENDIF 
		<name> : DestroyParticles 
	ENDIF 
ENDSCRIPT

SCRIPT CreateFastParticleSystem 
	IF NOT gotparam name 
		script_assert "No <name> parameter" 
	ENDIF 
	IF NOT gotparam params_script 
		script_assert "No <params_script> parameter" 
	ENDIF 
	IF gotparam attachObjId 
		MangleChecksums a = <name> b = <attachObjId> 
	ELSE 
		<mangled_id> = <name> 
	ENDIF 
	IF NOT ObjectExists id = <mangled_id> 
		IF CutsceneDestroyListActive 
			AddToCutsceneDestroyList { 
				destroy_func = DestroyFastParticleSystem 
				name = <mangled_id> 
				destroy_params = { name = <name> attachObjId = <attachObjId> } 
			} 
		ENDIF 
		alloc_fast_particle { params_script = ( <params_script> ) name = <mangled_id> attachObjId = <attachObjId> 
		emit_script = <emit_script> emit_params = <emit_params> } 
	ENDIF 
ENDSCRIPT

SCRIPT DestroyFastParticleSystem 
	IF NOT gotparam name 
		script_assert "No <name> parameter" 
	ENDIF 
	IF gotparam attachObjId 
		MangleChecksums a = <name> b = <attachObjId> 
	ELSE 
		<mangled_id> = <name> 
	ENDIF 
	IF ObjectExists id = <mangled_id> 
		IF CutsceneDestroyListActive 
			RemoveFromCutsceneDestroyList name = <mangled_id> 
		ENDIF 
		<mangled_id> : Die 
	ENDIF 
ENDSCRIPT

SCRIPT EmitFastParticles 
	IF gotparam wait_frames 
		wait <wait_frames> frames 
	ELSE 
		wait <wait_seconds> seconds 
	ENDIF 
	SetEmitRate 0 
	BEGIN 
		IF NOT IsEmitting 
			BREAK 
		ENDIF 
		wait 1 frame 
	REPEAT 
	Die 
ENDSCRIPT

SCRIPT alloc_fast_particle groupID = 0 
	IF StructureContains structure = <params_script> EmitDelay 
		wait ( <params_script> . EmitDelay ) seconds 
	ENDIF 
	IF NOT ObjectExists id = <name> 
		IF gotparam attachObjId 
			IF StructureContains structure = <params_script> SuspendDistance 
				CreateCompositeObject { 
					Components = [ 
						{ 
							Component = Suspend 
							SuspendDistance = ( <params_script> . SuspendDistance ) 
						} 
						{ 
							Component = lockobj 
							id = <attachObjId> 
							( <params_script> ) 
							bone = <bone> 
						} 
						{ 
							Component = Particle 
							name = <name> 
							groupID = <groupID> 
							( <params_script> ) 
							SystemLifetime = <SystemLifetime> 
						} 
					] 
					Params = { 
						name = <name> 
						LocalSpace 
					} 
				} 
			ELSE 
				CreateCompositeObject { 
					Components = [ 
						{ 
							Component = lockobj 
							id = <attachObjId> 
							( <params_script> ) 
							bone = <bone> 
						} 
						{ 
							Component = Particle 
							name = <name> 
							groupID = <groupID> 
							( <params_script> ) 
							SystemLifetime = <SystemLifetime> 
						} 
					] 
					Params = { 
						name = <name> 
						LocalSpace 
					} 
				} 
			ENDIF 
		ELSE 
			IF StructureContains structure = <params_script> SuspendDistance 
				CreateCompositeObject { 
					Components = [ 
						{ 
							Component = Suspend 
							SuspendDistance = ( <params_script> . SuspendDistance ) 
						} 
						{ 
							Component = Particle 
							name = <name> 
							groupID = <groupID> 
							( <params_script> ) 
						} 
					] 
					Params = { 
						name = <name> 
					} 
				} 
			ELSE 
				CreateCompositeObject { 
					Components = [ 
						{ 
							Component = Particle 
							name = <name> 
							groupID = <groupID> 
							( <params_script> ) 
						} 
					] 
					Params = { 
						name = <name> 
					} 
				} 
			ENDIF 
			IF StructureContains structure = <params_script> LocalSpace 
				IF NOT StructureContains structure = <params_script> pos 
					
					script_assert "No <pos> parameter...  system should not have been defined in LocalSpace" 
				ENDIF 
				IF ObjectExists id = <name> 
					<name> : SetStartPos ( ( <params_script> ) . pos ) 
				ENDIF 
			ENDIF 
		ENDIF 
	ENDIF 
	IF ObjectExists id = <name> 
		IF StructureContains structure = <params_script> EmitDuration 
			<name> : Obj_SpawnScript EmitFastParticles Params = { wait_seconds = ( ( <params_script> ) . EmitDuration ) } 
		ENDIF 
		IF gotparam emit_script 
			<name> : Obj_SpawnScript <emit_script> Params = <emit_params> 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT JOW_RGBAToVector rgba = [ 0 , 0 , 0 , 0 ] 
	RETURN rgb = ( <rgba> [ 0 ] * VECTOR(1.00000000000, 0.00000000000, 0.00000000000) + <rgba> [ 1 ] * VECTOR(0.00000000000, 1.00000000000, 0.00000000000) + <rgba> [ 2 ] * VECTOR(0.00000000000, 0.00000000000, 1.00000000000) ) a = ( <rgba> [ 3 ] ) 
ENDSCRIPT

SCRIPT JOW_VectorToRGBA rgb = VECTOR(0.00000000000, 0.00000000000, 0.00000000000) a = 0 
	rgba = [ 0 0 0 0 ] 
	val = ( <rgb> . VECTOR(1.00000000000, 0.00000000000, 0.00000000000) ) 
	CastToInteger val 
	SetArrayElement arrayName = rgba index = 0 newValue = <val> 
	val = ( <rgb> . VECTOR(0.00000000000, 1.00000000000, 0.00000000000) ) 
	CastToInteger val 
	SetArrayElement arrayName = rgba index = 1 newValue = <val> 
	val = ( <rgb> . VECTOR(0.00000000000, 0.00000000000, 1.00000000000) ) 
	CastToInteger val 
	SetArrayElement arrayName = rgba index = 2 newValue = <val> 
	CastToInteger a 
	SetArrayElement arrayName = rgba index = 3 newValue = <a> 
	RETURN rgba = <rgba> 
ENDSCRIPT



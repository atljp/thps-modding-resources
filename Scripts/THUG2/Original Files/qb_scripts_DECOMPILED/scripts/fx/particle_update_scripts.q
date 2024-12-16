
SCRIPT align_scale_to_vel_update objId = skater bone = Bone_Board_Tail update_pos = 0 emit_offset = VECTOR(0.00000000000, 0.50000000000, 0.00000000000) emit_scale = -1.00000000000 pos_offset = VECTOR(0.00000000000, -2.00000000000, 0.00000000000) base_vel = 800.00000000000 min_vel_range = 4 max_vel_range = 8 base_emit_rate = 0.00000000000 
	pos0_offset = <pos_offset> 
	BEGIN 
		IF ShouldEmit 
			<objId> : Obj_GetVelocity 
			NormalizeVector <vel> 
			<length> = ( <length> / <base_vel> ) 
			SetEmitTarget target = ( <emit_offset> + ( <emit_scale> * <norm> ) ) 
			SetSpeedRange min = ( <min_vel_range> * <length> ) max = ( <max_vel_range> * <length> ) 
			EmitRate rate = ( <length> * <base_emit_rate> ) 
			IF NOT ( <update_pos> = 0 ) 
				<x> = 0 
				<y> = 0 
				<z> = 0 
				IF GotParam get_bone_script 
					<get_bone_script> objId = <objId> 
				ENDIF 
				<objId> : Obj_GetBonePosition bone = <bone> 
				<pos_offset> = ( <pos0_offset> + <x> * VECTOR(1.00000000000, 0.00000000000, 0.00000000000) ) 
				<pos_offset> = ( <pos_offset> + <y> * VECTOR(0.00000000000, 1.00000000000, 0.00000000000) ) 
				<pos_offset> = ( <pos_offset> + <z> * VECTOR(0.00000000000, 0.00000000000, 1.00000000000) ) 
				setpos pos = <pos_offset> 
			ENDIF 
		ELSE 
			IF ( <base_emit_rate> > 0.00000000000 ) 
				<objId> : Obj_GetVelocity 
				NormalizeVector <vel> 
				<length> = ( <length> / <base_vel> ) 
				EmitRate rate = ( <length> * <base_emit_rate> ) 
			ENDIF 
		ENDIF 
		wait 1 gameframe 
	REPEAT 
ENDSCRIPT

SCRIPT align_scale_size_to_vel_update objId = skater bone = Bone_Board_Tail update_pos = 0 emit_offset = VECTOR(0.00000000000, 0.50000000000, 0.00000000000) emit_scale = -1.00000000000 pos_offset = VECTOR(0.00000000000, -2.00000000000, 0.00000000000) base_vel = 800.00000000000 min_vel_range = 4 max_vel_range = 8 base_emit_rate = 0.00000000000 
	pos0_offset = <pos_offset> 
	BEGIN 
		IF ShouldEmit 
			<objId> : Obj_GetVelocity 
			NormalizeVector <vel> 
			<length> = ( <length> / <base_vel> ) 
			SetEmitTarget target = ( <emit_offset> + ( <emit_scale> * <norm> ) ) 
			SetSpeedRange min = ( <min_vel_range> * <length> ) max = ( <max_vel_range> * <length> ) 
			EmitRate rate = ( <length> * <base_emit_rate> ) 
			SetParticleSizeScale scaleSize = <length> 
			IF NOT ( <update_pos> = 0 ) 
				<x> = 0 
				<y> = 0 
				<z> = 0 
				IF GotParam get_bone_script 
					<get_bone_script> objId = <objId> 
				ENDIF 
				<objId> : Obj_GetBonePosition bone = <bone> 
				<pos_offset> = ( <pos0_offset> + <x> * VECTOR(1.00000000000, 0.00000000000, 0.00000000000) ) 
				<pos_offset> = ( <pos_offset> + <y> * VECTOR(0.00000000000, 1.00000000000, 0.00000000000) ) 
				<pos_offset> = ( <pos_offset> + <z> * VECTOR(0.00000000000, 0.00000000000, 1.00000000000) ) 
				setpos pos = <pos_offset> 
			ENDIF 
		ELSE 
			IF ( <base_emit_rate> > 0.00000000000 ) 
				<objId> : Obj_GetVelocity 
				NormalizeVector <vel> 
				<length> = ( <length> / <base_vel> ) 
				EmitRate rate = ( <length> * <base_emit_rate> ) 
			ENDIF 
		ENDIF 
		wait 1 gameframe 
	REPEAT 
ENDSCRIPT

SCRIPT align_to_vel_update objId = skater bone = Bone_Board_Tail update_pos = 0 emit_offset = VECTOR(0.00000000000, 0.50000000000, 0.00000000000) emit_scale = -1.00000000000 pos_offset = VECTOR(0.00000000000, -2.00000000000, 0.00000000000) 
	pos0_offset = <pos_offset> 
	BEGIN 
		IF ShouldEmit 
			IF CompositeObjectExists name = <objId> 
				<objId> : Obj_GetVelocity 
				NormalizeVector <vel> 
				SetEmitTarget target = ( <emit_offset> + ( <emit_scale> * <norm> ) ) 
				IF NOT ( <update_pos> = 0 ) 
					<x> = 0 
					<y> = 0 
					<z> = 0 
					IF GotParam get_bone_script 
						<get_bone_script> objId = <objId> 
					ENDIF 
					<objId> : Obj_GetBonePosition bone = <bone> 
					<pos_offset> = ( <pos0_offset> + <x> * VECTOR(1.00000000000, 0.00000000000, 0.00000000000) ) 
					<pos_offset> = ( <pos_offset> + <y> * VECTOR(0.00000000000, 1.00000000000, 0.00000000000) ) 
					<pos_offset> = ( <pos_offset> + <z> * VECTOR(0.00000000000, 0.00000000000, 1.00000000000) ) 
					setpos pos = <pos_offset> 
				ENDIF 
			ENDIF 
		ENDIF 
		wait 1 gameframe 
	REPEAT 
ENDSCRIPT

SCRIPT align_to_obj_orient objId = skater bone = Bone_Board_Tail update_pos = 0 pos_offset = VECTOR(0.00000000000, -2.00000000000, 0.00000000000) emit_scale = 1.00000000000 
	pos0_offset = <pos_offset> 
	BEGIN 
		IF ShouldEmit 
			<objId> : Obj_GetOrientation 
			<orient> = ( ( <x> * VECTOR(1.00000000000, 0.00000000000, 0.00000000000) ) + ( <y> * VECTOR(0.00000000000, 1.00000000000, 0.00000000000) ) + ( <z> * VECTOR(0.00000000000, 0.00000000000, 1.00000000000) ) ) 
			NormalizeVector <orient> 
			SetEmitTarget target = ( ( <emit_scale> * <norm> ) ) 
			IF NOT ( <update_pos> = 0 ) 
				<x> = 0 
				<y> = 0 
				<z> = 0 
				<objId> : Obj_GetBonePosition bone = <bone> 
				<pos_offset> = ( <pos0_offset> + <x> * VECTOR(1.00000000000, 0.00000000000, 0.00000000000) ) 
				<pos_offset> = ( <pos_offset> + <y> * VECTOR(0.00000000000, 1.00000000000, 0.00000000000) ) 
				<pos_offset> = ( <pos_offset> + <z> * VECTOR(0.00000000000, 0.00000000000, 1.00000000000) ) 
				setpos pos = <pos_offset> 
			ENDIF 
		ENDIF 
		wait 1 gameframe 
	REPEAT 
ENDSCRIPT

SCRIPT fast_align_to_vel_update objId = skater bone = Bone_Board_Tail update_pos = 0 emit_offset = VECTOR(0.00000000000, 0.50000000000, 0.00000000000) emit_scale = -1.00000000000 pos_offset = VECTOR(0.00000000000, -2.00000000000, 0.00000000000) 
	pos0_offset = <pos_offset> 
	BEGIN 
		<objId> : Obj_GetVelocity 
		NormalizeVector <vel> 
		Obj_SetOrientation dir = <norm> 
		IF NOT ( <update_pos> = 0 ) 
			<x> = 0 
			<y> = 0 
			<z> = 0 
			IF GotParam get_bone_script 
				<get_bone_script> objId = <objId> 
			ENDIF 
			<objId> : Obj_GetBonePosition bone = <bone> 
			<pos_offset> = ( <pos0_offset> + <x> * VECTOR(1.00000000000, 0.00000000000, 0.00000000000) ) 
			<pos_offset> = ( <pos_offset> + <y> * VECTOR(0.00000000000, 1.00000000000, 0.00000000000) ) 
			<pos_offset> = ( <pos_offset> + <z> * VECTOR(0.00000000000, 0.00000000000, 1.00000000000) ) 
			Obj_SetPosition position = <pos_offset> 
		ENDIF 
		wait 1 gameframe 
	REPEAT 
ENDSCRIPT

SCRIPT fast_change_color endStartRGBA = [ 0 , 0 , 255 , 128 ] endMidRGBA = [ 0 , 0 , 255 , 128 ] endEndRGBA = [ 0 , 0 , 255 , 128 ] delayStart = 0.00000000000 changeTime = 2.00000000000 stepTime = 0.10000000149 
	wait <delayStart> seconds 
	GetParticleParams 
	JOW_RGBAToVector rgba = ( <ParticleParams> . StartRGBA ) 
	beginStartRGB = <rgb> 
	beginStartAlpha = <a> 
	JOW_RGBAToVector rgba = <endStartRGBA> 
	endStartRGB = <rgb> 
	endStartAlpha = <a> 
	JOW_RGBAToVector rgba = ( <ParticleParams> . MidRGBA ) 
	beginMidRGB = <rgb> 
	beginMidAlpha = <a> 
	JOW_RGBAToVector rgba = <endMidRGBA> 
	endMidRGB = <rgb> 
	endMidAlpha = <a> 
	JOW_RGBAToVector rgba = ( <ParticleParams> . EndRGBA ) 
	beginEndRGB = <rgb> 
	beginEndAlpha = <a> 
	JOW_RGBAToVector rgba = <endEndRGBA> 
	endEndRGB = <rgb> 
	endEndAlpha = <a> 
	curStartRGB = <beginStartRGB> 
	curStartAlpha = <beginStartAlpha> 
	curMidRGB = <beginMidRGB> 
	curMidAlpha = <beginMidAlpha> 
	curEndRGB = <beginEndRGB> 
	curEndAlpha = <beginEndAlpha> 
	step = ( ( <stepTime> / <changeTime> ) ) 
	stepStartRGB = ( ( <endStartRGB> - <beginStartRGB> ) * <step> ) 
	stepStartAlpha = ( ( <endStartAlpha> - <beginStartAlpha> ) * <step> ) 
	stepMidRGB = ( ( <endMidRGB> - <beginMidRGB> ) * <step> ) 
	stepMidAlpha = ( ( <endMidAlpha> - <beginMidAlpha> ) * <step> ) 
	stepEndRGB = ( ( <endEndRGB> - <beginEndRGB> ) * <step> ) 
	stepEndAlpha = ( ( <endEndAlpha> - <beginEndAlpha> ) * <step> ) 
	curTime = <step> 
	BEGIN 
		IF ( <curTime> > -1 & <curTime> < <changeTime> ) 
			curStartRGB = ( <curStartRGB> + <stepStartRGB> ) 
			curStartAlpha = ( <curStartAlpha> + <stepStartAlpha> ) 
			curMidRGB = ( <curMidRGB> + <stepMidRGB> ) 
			curMidAlpha = ( <curMidAlpha> + <stepMidAlpha> ) 
			curEndRGB = ( <curEndRGB> + <stepEndRGB> ) 
			curEndAlpha = ( <curEndAlpha> + <stepEndAlpha> ) 
			JOW_VectorToRGBA rgb = <curStartRGB> a = <curStartAlpha> 
			setStartColor <rgba> 
			JOW_VectorToRGBA rgb = <curMidRGB> a = <curMidAlpha> 
			setMidColor <rgba> 
			JOW_VectorToRGBA rgb = <curEndRGB> a = <curEndAlpha> 
			setEndColor <rgba> 
			curTime = ( <curTime> + <stepTime> ) 
			wait <stepTime> seconds 
		ELSE 
			JOW_VectorToRGBA rgb = <endStartRGB> a = <endStartAlpha> 
			setStartColor <rgba> 
			JOW_VectorToRGBA rgb = <endMidRGB> a = <endMidAlpha> 
			setMidColor <rgba> 
			JOW_VectorToRGBA rgb = <endEndRGB> a = <endEndAlpha> 
			setEndColor <rgba> 
			BREAK 
		ENDIF 
	REPEAT 
ENDSCRIPT



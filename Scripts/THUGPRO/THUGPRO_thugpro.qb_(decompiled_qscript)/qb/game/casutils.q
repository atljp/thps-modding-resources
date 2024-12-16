
SCRIPT create_model_from_appearance 
	LockCurrentSkaterProfileIndex 1 
	ModelClearAllGeoms 
	process_cas_command cas_command = ModelRunScript editable_list = master_editable_list target = disqualify_script 
	process_cas_command cas_command = ModelAddGeom editable_list = master_editable_list 
	process_cas_command cas_command = GeomReplaceTexture editable_list = master_editable_list 
	model_apply_created_graphics 
	model_apply_scale 
	process_cas_command cas_command = model_hide_geom editable_list = master_editable_list 
	ModelRemovePolys 
	model_apply_face_texture 
	ModelPropagateHeadColor 
	process_cas_command cas_command = GeomModulateColor editable_list = master_editable_list 
	allocate_uv_matrix_params 
	set_uv_from_appearance 
	ModelFinalize 
	LockCurrentSkaterProfileIndex 0 
ENDSCRIPT

SCRIPT create_ped_model_from_appearance 
	LockCurrentSkaterProfileIndex 1 
	ModelClearAllGeoms 
	process_cas_command cas_command = ModelAddGeom editable_list = ped_editable_list 
	model_apply_scale 
	ModelRemovePolys 
	process_cas_command cas_command = GeomModulateColor editable_list = ped_editable_list 
	ModelFinalize 
	LockCurrentSkaterProfileIndex 0 
ENDSCRIPT

SCRIPT replace_cutscene_skater_from_appearance 
	LockCurrentSkaterProfileIndex 1 
	process_cas_command cas_command = GeomReplaceTexture editable_list = master_editable_list 
	model_apply_face_texture 
	ModelPropagateHeadColor 
	process_cas_command cas_command = GeomModulateColor editable_list = master_editable_list 
	LockCurrentSkaterProfileIndex 0 
ENDSCRIPT

face_map_points_saved = 0 
original_model_face_points = { 
	left_eye = [ 51 61 ] 
	right_eye = [ 84 61 ] 
	nose = [ 67 84 ] 
	lips = [ 67 99 ] 
	width = 128 
	height = 128 
} 
SCRIPT model_apply_face_texture 
	ModelApplyFaceTexture src = "CS_NSN_facemap.png" 
ENDSCRIPT

SCRIPT model_apply_scale 
	<standard_scaling> = 1 
	ModelResetScale 
	IF AppearanceAllowScalingCheat 
		IF GetGlobalFlag flag = CHEAT_KID 
			ModelApplyBodyShape body_shape = kid_scale_info 
			ModelApplyObjectScale body_shape = kid_scale_info 
			<standard_scaling> = 0 
		ENDIF 
		IF GetGlobalFlag flag = CHEAT_BIGHEAD 
			ModelApplyBodyShape body_shape = bighead_scale_info is_bighead_cheat 
			ModelApplyObjectScale body_shape = bighead_scale_info 
			<standard_scaling> = 0 
		ENDIF 
		IF GetGlobalFlag flag = CHEAT_GORILLA 
			ModelApplyBodyShape body_shape = gorilla_scale_info 
			ModelApplyObjectScale body_shape = gorilla_scale_info 
			<standard_scaling> = 0 
		ENDIF 
	ENDIF 
	IF ( <standard_scaling> = 1 ) 
		ModelApplyBodyShape 
		ModelApplyObjectScale 
		process_cas_command cas_command = ModelApplyBoneScale editable_list = master_scaling_list 
	ENDIF 
	IF GetGlobalFlag flag = CHEAT_HOVERBOARD 
		ModelApplyBodyShape body_shape = hoverboard_scale_info 
	ENDIF 
ENDSCRIPT

SCRIPT model_apply_created_graphics 
	GeomSetCreatedTexture part = hat_logo 
	GeomSetCreatedTexture part = front_logo 
	GeomSetCreatedTexture part = back_logo 
	GeomSetCreatedTexture part = deck_graphic 
ENDSCRIPT

SCRIPT model_hide_geom 
	<invisible> = 0 
	IF AppearanceAllowScalingCheat 
		IF GetGlobalFlag flag = CHEAT_INVISIBLE 
			<invisible> = 1 
		ENDIF 
	ENDIF 
	<hide_parts_array> = [ skater_m_head skater_m_hair skater_f_head skater_f_hair body ] 
	IF ArrayContains array = <hide_parts_array> contains = <part> 
		ModelHideGeom part = <part> <invisible> 
		RETURN 
	ENDIF 
ENDSCRIPT

SCRIPT preload_model_from_appearance 
	ModelClearAllGeoms 
	process_cas_command cas_command = ModelAddGeom editable_list = master_editable_list 
ENDSCRIPT

SCRIPT color_model_from_appearance 
	ModelPropagateHeadColor 
	process_cas_command cas_command = GeomModulateColor editable_list = master_editable_list 
ENDSCRIPT

SCRIPT scale_model_from_appearance 
	model_apply_scale 
ENDSCRIPT

SCRIPT hide_model_from_appearance 
	process_cas_command cas_command = model_hide_geom editable_list = master_editable_list 
ENDSCRIPT

SCRIPT allocate_uv_matrix_params 
	GetArraySize master_uv_list 
	<index> = 0 
	BEGIN 
		GeomAllocateUVMatrixParams ( master_uv_list [ <index> ] ) 
		<index> = ( <index> + 1 ) 
	REPEAT <array_size> 
ENDSCRIPT

SCRIPT set_uv_from_appearance 
	GetArraySize master_uv_list 
	<index> = 0 
	BEGIN 
		GeomSetUVOffset ( master_uv_list [ <index> ] ) 
		<index> = ( <index> + 1 ) 
	REPEAT <array_size> 
ENDSCRIPT

SCRIPT process_cas_command editable_list = master_editable_list 
	ForEachIn <editable_list> do = <cas_command> params = <...> 
ENDSCRIPT

SCRIPT preselect_random_parts 
	PreSelectRandomPedMHeads num = <num_m_heads> 
	PreSelectRandomPedMTorsos num = <num_m_torsos> 
	PreSelectRandomPedMLegs num = <num_m_legs> 
	PreSelectRandomPedMAccessories num = <num_m_accessories> 
	PreSelectRandomPedFHeads num = <num_f_heads> 
	PreSelectRandomPedFTorsos num = <num_f_torsos> 
	PreSelectRandomPedFLegs num = <num_f_legs> 
	PreSelectRandomPedFAccessories num = <num_f_accessories> 
ENDSCRIPT

SCRIPT PreSelectRandomPedMHeads num = 3 
	PreselectRandomPedestrians part = ped_m_head num = <num> 
ENDSCRIPT

SCRIPT PreSelectRandomPedMTorsos num = 3 
	PreselectRandomPedestrians part = ped_m_torso num = <num> 
ENDSCRIPT

SCRIPT PreSelectRandomPedMLegs num = 3 
	PreselectRandomPedestrians part = ped_m_legs num = <num> 
ENDSCRIPT

SCRIPT PreSelectRandomPedMAccessories num = 8 
	PreselectRandomPedestrians part = ped_m_accessories num = <num> 
ENDSCRIPT

SCRIPT PreSelectRandomPedFHeads num = 3 
	PreselectRandomPedestrians part = ped_f_head num = <num> 
ENDSCRIPT

SCRIPT PreSelectRandomPedFTorsos num = 3 
	PreselectRandomPedestrians part = ped_f_torso num = <num> 
ENDSCRIPT

SCRIPT PreSelectRandomPedFLegs num = 2 
	PreselectRandomPedestrians part = ped_f_legs num = <num> 
ENDSCRIPT

SCRIPT PreSelectRandomPedFAccessories num = 3 
	PreselectRandomPedestrians part = ped_f_accessories num = <num> 
ENDSCRIPT

SCRIPT model_apply_custom_logos player = 0 
	<logo_parts> = [ hat_logo front_logo back_logo deck_graphic ] 
	<index> = 0 
	BEGIN 
		IF GetPlayerAppearancePart player = <player> part = ( <logo_parts> [ <index> ] ) 
			IF ChecksumEquals a = <desc_id> b = CreatedGraphic 
				ApplyCustomLogoToPart { 
					player = <player> 
					part = ( <logo_parts> [ <index> ] ) 
				} 
			ENDIF 
		ENDIF 
		<index> = ( <index> + 1 ) 
	REPEAT 4 
ENDSCRIPT



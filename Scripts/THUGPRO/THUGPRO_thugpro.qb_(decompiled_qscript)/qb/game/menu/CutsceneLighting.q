
SCRIPT cutscene_set_temp_tod 
	TODManager_SetTempTOD <...> 
ENDSCRIPT

SCRIPT SK_9_Livecard_Lighting 
	Obj_SetLightAmbientColor { 
		r = 40 
		g = 40 
		b = 40 
	} 
	Obj_SetLightDiffuseColor { 
		index = 0 
		r = 0 
		g = 0 
		b = 0 
	} 
	Obj_SetLightDirection { 
		index = 0 
		heading = 0 
		pitch = 0 
	} 
	Obj_SetLightDiffuseColor { 
		index = 1 
		r = 0 
		g = 0 
		b = 0 
	} 
	Obj_SetLightDirection { 
		index = 1 
		heading = 0 
		pitch = 0 
	} 
ENDSCRIPT



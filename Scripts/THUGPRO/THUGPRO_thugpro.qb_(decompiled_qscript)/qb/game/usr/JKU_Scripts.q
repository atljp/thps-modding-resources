SCRIPT Veh_TaxiUS_TOD 
ENDSCRIPT

SCRIPT Veh_Generic_TOD 
	SWITCH <current_tod> 
		CASE morning 
			ReplaceCarTextures { 
				array = [ 
					{ 
						src = "JKU_LightCircle_Transparent.png" dest = "textures/cars/JKU_LightCircle_Transparent" 
					} 
					{ 
						src = "JKU_HeadlightGlow_Transparent.png" dest = "textures/cars/JKU_HeadlightGlow" 
					} 
				] 
			} 
		CASE day 
			ReplaceCarTextures { 
				array = [ 
					{ 
						src = "JKU_LightCircle_Transparent.png" dest = "textures/cars/JKU_LightCircle_Transparent" 
					} 
					{ 
						src = "JKU_HeadlightGlow_Transparent.png" dest = "textures/cars/JKU_HeadlightGlow_Transparent" 
					} 
				] 
			} 
		CASE evening 
			ReplaceCarTextures { 
				array = [ 
					{ 
						src = "JKU_LightCircle_Transparent.png" dest = "textures/cars/JKU_LightCircle_Transparent" 
					} 
					{ 
						src = "JKU_HeadlightGlow_Transparent.png" dest = "textures/cars/JKU_HeadlightGlow" 
					} 
				] 
			} 
		CASE night 
			ReplaceCarTextures { 
				array = [ 
					{ 
						src = "JKU_LightCircle_Transparent.png" dest = "textures/cars/JKU_LightCircle" 
					} 
					{ 
						src = "JKU_HeadlightGlow_Transparent.png" dest = "textures/cars/JKU_HeadlightGlow" 
					} 
				] 
			} 
		DEFAULT 
			printf "### no tod set ###" 
	ENDSWITCH 
ENDSCRIPT



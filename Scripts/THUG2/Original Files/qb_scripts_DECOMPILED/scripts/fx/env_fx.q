
DoUpdateLensFlare = 1 
LensFlare_Morph_In = 0.15000000596 
LensFlare_Morph_Out = 0.10000000149 
SCRIPT DisableSun 
	change DoUpdateLensFlare = 0 
	MaybeHideLensFlare 
	SetSunProps size = 0 
ENDSCRIPT

SCRIPT EnableSun 
	change DoUpdateLensFlare = 1 
	UnHideLensFlare 
	SetSunProps size = 7332.00000000000 
ENDSCRIPT

SCRIPT CreateLensFlare 
	SetScreenElementLock id = root_window off 
	CreateScreenElement { 
		type = ContainerElement 
		parent = root_window 
		id = Lens_Flare_Container 
		dims = PAIR(640.00000000000, 480.00000000000) 
		pos = PAIR(0.00000000000, 0.00000000000) 
		alpha = 0 
		just = [ left top ] 
	} 
	GetArraySize Lens_Flare_Data 
	index = 0 
	BEGIN 
		CreateScreenElement { 
			type = SpriteElement 
			parent = Lens_Flare_Container 
			id = ( Lens_Flare_Data [ <index> ] . id ) 
			scale = ( Lens_Flare_Data [ <index> ] . scale ) 
			texture = ( Lens_Flare_Data [ <index> ] . texture ) 
			rgba = ( Lens_Flare_Data [ <index> ] . rgba ) 
			pos = PAIR(0.00000000000, 0.00000000000) 
			blend = Add 
		} 
		<index> = ( <index> + 1 ) 
	REPEAT <array_size> 
	SetScreenElementLock id = root_window on 
ENDSCRIPT

SCRIPT MaybeHideLensFlare morph_time = 0.00000000000 
	IF ScreenElementExists id = Lens_Flare_Container 
		HideLensFlare <...> 
	ELSE 
		CreateLensFlare 
	ENDIF 
ENDSCRIPT

Lens_Flare_Data = [ 
	{ 
		id = lf_sprite_1 
		texture = APM_abberation02 
		pos_scale = 0.80000001192 
		scale = 3.00000000000 
		rgba = [ 200 128 0 16 ] 
	} 
	{ 
		id = lf_sprite_2 
		texture = APM_abberation02 
		pos_scale = 0.69999998808 
		scale = 2.00000000000 
		rgba = [ 255 128 0 20 ] 
	} 
	{ 
		id = lf_sprite_3 
		texture = APM_abberation01 
		pos_scale = 0.64999997616 
		scale = 0.60000002384 
		rgba = [ 255 128 100 32 ] 
	} 
	{ 
		id = lf_sprite_4 
		texture = flare1 
		pos_scale = 0.62999999523 
		scale = 0.75000000000 
		rgba = [ 255 128 128 32 ] 
	} 
	{ 
		id = lf_sprite_5 
		texture = flare1 
		pos_scale = 0.57999998331 
		scale = 0.44999998808 
		rgba = [ 200 128 0 32 ] 
	} 
	{ 
		id = lf_sprite_6 
		texture = APM_abberation01 
		pos_scale = 0.56999999285 
		scale = 0.75000000000 
		rgba = [ 200 128 0 32 ] 
	} 
	{ 
		id = lf_sprite_7 
		texture = flare1 
		pos_scale = 0.49000000954 
		scale = 0.50000000000 
		rgba = [ 255 128 128 64 ] 
	} 
	{ 
		id = lf_sprite_8 
		texture = APM_abberation02 
		pos_scale = 0.44999998808 
		scale = 1.29999995232 
		rgba = [ 200 128 0 20 ] 
	} 
	{ 
		id = lf_sprite_9 
		texture = flare1 
		pos_scale = 0.43000000715 
		scale = 0.85000002384 
		rgba = [ 255 128 128 32 ] 
	} 
	{ 
		id = lf_sprite_10 
		texture = APM_abberation01 
		pos_scale = 0.11999999732 
		scale = 3.09999990463 
		rgba = [ 200 128 0 12 ] 
	} 
	{ 
		id = lf_sprite_11 
		texture = APM_abberation02 
		pos_scale = -0.44999998808 
		scale = 2.75000000000 
		rgba = [ 200 128 100 16 ] 
	} 
	{ 
		id = lf_sprite_12 
		texture = APM_abberation02 
		pos_scale = -0.47999998927 
		scale = 1.00000000000 
		rgba = [ 200 128 100 32 ] 
	} 
] 
Lens_Flare_Data1 = [ 
	{ 
		id = lf_sprite_1 
		texture = flare1 
		pos_scale = 0.80000001192 
		scale = 1.00000000000 
		rgba = [ 128 128 196 64 ] 
	} 
	{ 
		id = lf_sprite_2 
		texture = APM_abberation01 
		pos_scale = 0.50000000000 
		scale = 0.75000000000 
		rgba = [ 128 128 0 64 ] 
	} 
	{ 
		id = lf_sprite_3 
		texture = flare1 
		pos_scale = 0.33300000429 
		scale = 0.50000000000 
		rgba = [ 128 128 128 64 ] 
	} 
	{ 
		id = lf_sprite_4 
		texture = APM_abberation02 
		pos_scale = 0.12500000000 
		scale = 2.00000000000 
		rgba = [ 128 64 128 64 ] 
	} 
	{ 
		id = lf_sprite_5 
		texture = APM_abberation01 
		pos_scale = -0.50000000000 
		scale = 0.85000002384 
		rgba = [ 196 128 128 64 ] 
	} 
	{ 
		id = lf_sprite_6 
		texture = flare1 
		pos_scale = -0.25000000000 
		scale = 0.75000000000 
		rgba = [ 128 128 128 64 ] 
	} 
	{ 
		id = lf_sprite_7 
		texture = APM_abberation02 
		pos_scale = -0.18179999292 
		scale = 0.85000002384 
		rgba = [ 128 128 128 128 ] 
	} 
] 
SunBurst_Out = 0.25000000000 


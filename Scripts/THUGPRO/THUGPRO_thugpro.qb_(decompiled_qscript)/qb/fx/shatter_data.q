
Splat_Critical_Remaining_Polys = 128 
Splat_Alpha_Degen_Rate = 8 
SCRIPT load_permanent_shatter_textures 
	LoadParticleTexture "bits\\apm_Crate02_xploder02" perm 
	LoadParticleTexture "bits\\BA_APM_brokenglass01" perm 
	LoadParticleTexture "bits\\BA_cp_grass_mow_particle" perm 
	LoadParticleTexture "bits\\JG_BO_Shatter_BankWin" perm 
	LoadParticleTexture "bits\\JG_BO_Shatter_BankGrate" perm 
	LoadParticleTexture "bits\\JG_BO_Shatter_SHFence" perm 
	LoadParticleTexture "bits\\TB_BO_Barrel_Shatter_01" perm 
	LoadParticleTexture "bits\\JG_BO_Shatter_Window3" perm 
	LoadParticleTexture "bits\\TB_WH_Drywall_Pieces_01" perm 
	LoadParticleTexture "bits\\JOW_BE_BarrelShatter01" perm 
	LoadParticleTexture "bits\\st_tw_shatter_metal01" perm 
	LoadParticleTexture "bits\\no_tw_shatter_wood01" perm 
	LoadParticleTexture "bits\\JOW_DJ_CrateShatter01" perm 
	LoadParticleTexture "bits\\CG_SE2_Shatter_Plane" perm 
	LoadParticleTexture "bits\\CG_SE2_Shatter_Grate" perm 
	LoadParticleTexture "bits\\CG_SE_Shatter_CircleGrate" perm 
	LoadParticleTexture "bits\\CG_SE_Shatter_Grate" perm 
	LoadParticleTexture "bits\\CG_AU_Shatter_Pot" perm 
	LoadParticleTexture "bits\\CG_AU_Shatter_BlueFence" perm 
	LoadParticleTexture "bits\\CG_AU_Shatter_BeachSign" perm 
	LoadParticleTexture "bits\\police_line2" perm 
ENDSCRIPT

SCRIPT ShatterFromSkater { 
		vel_scale = 0.50000000000 
		gravity = VECTOR(0.00000000000, -250.00000000000, 0.00000000000) 
		area = 2000.00000000000 
		Blend_Mode = blend 
		variance = 0.00000000000 
		spread = 1.00000000000 
		life = 4.00000000000 
		bounce_floor = -10000 
		bounce_amp = 10.00000000000 
		shininess = 0 
		radius = 0.00000000000 
	} 
	Obj_GetID 
	<ObjId> : Obj_GetVelocity 
	<force> = ( <vel> * <vel_scale> ) 
	<ObjId> : Obj_GetPosition 
	IF GotParam { 
			radial_shatter 
		} 
		<origin> = <pos> 
	ENDIF 
	Shatter <...> 
ENDSCRIPT



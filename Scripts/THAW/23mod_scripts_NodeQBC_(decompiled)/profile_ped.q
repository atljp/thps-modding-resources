ped_m_creation_params = {
    SkeletonName = thps7_human
    AnimName = animload_THPS7_Human
    ShadowVolumeModels = [ 'Models\volume_shadows\volume_shadow.shd' ]
}
ped_f_creation_params = {
    SkeletonName = ped_female
    ReferenceChecksum = thps7_human
    AnimName = animload_THPS7_Human
    ShadowVolumeModels = [ 'Models\volume_shadows\Volume_Female_Shadow.shd' ]
}
Anl_Dog_creation_params = { SkeletonName = anl_wolf AnimName = animload_anl_Doggie }
Anl_Dog2_creation_params = { SkeletonName = Anl_dog AnimName = animload_anl_dog }
Anl_Pigeon_creation_params = { SkeletonName = anl_pigeon AnimName = animload_anl_pigeon }
Anl_Shark_creation_params = { SkeletonName = anl_shark AnimName = animload_anl_shark }
Ped_BMX_creation_params = {
    SkeletonName = si_bmx
    AnimName = animload_THPS7_Human
    ShadowVolumeModels = [ 'Models\volume_shadows\Volume_BMX_Shadow.shd' ]
}
Tony_pedlogic_params = {
    Navigation_mode = PEDMOTION_STAND
    collision_mode = bump
    Allow_projectiles = 0
    State_table = GoalPed_StateLogic_Table
    STATE_DEFAULT = STATE_GoalPed_waiting
}
skater_pedlogic_params = {
    Navigation_mode = PEDMOTION_SKATER
    collision_mode = ignore
    Allow_projectiles = 0
    State_table = SkaterPed_StateTable
    STATE_DEFAULT = STATE_skating
    Speed = 60
}
skater_slow_pedlogic_params = {
    Navigation_mode = PEDMOTION_SKATER
    collision_mode = ignore
    Allow_projectiles = 0
    State_table = SkaterPed_StateTable
    STATE_DEFAULT = STATE_skating
    Speed = 40
}
stand_pedlogic_params = { Navigation_mode = PEDMOTION_STAND collision_mode = avoid STATE_DEFAULT = STATE_standing }
standNoLook_pedlogic_params = { Navigation_mode = PEDMOTION_STAND collision_mode = avoid STATE_DEFAULT = STATE_standing should_look_at_skater = 0 }
standNoLookOrAvoid_pedlogic_params = { Navigation_mode = PEDMOTION_STAND collision_mode = bump STATE_DEFAULT = STATE_standing should_look_at_skater = 0 }
roamPOI_pedlogic_params = { Navigation_mode = PEDMOTION_NAVMESH collision_mode = ignore State_table = Ped_RoamStates_Table STATE_DEFAULT = STATE_roamingPOI }
goal_pedlogic_params = {
    Navigation_mode = PEDMOTION_STAND
    collision_mode = fall
    Allow_projectiles = 0
    Attention_radius = 100
    Register_events = [ objectinattentionradius ]
    STATE_DEFAULT = STATE_standing
}
blocker_pedlogic_params = {
    Navigation_mode = PEDMOTION_WAYPOINT
    collision_mode = ignore
    Attention_radius = 40
    Register_events = [ objectinattentionradius ]
    anim_assets = blocker_anim_assets
    State_table = Blocker_StateLogic_Table
    STATE_DEFAULT = STATE_walking
    Allow_projectiles = 0
}
GenericRoam_pedlogic_params = { Navigation_mode = PEDMOTION_NAVMESH collision_mode = avoid State_table = Ped_RoamStates_Table STATE_DEFAULT = STATE_roamingPOI }
GenericRoam_NoTarget_pedlogic_params = {
    Navigation_mode = PEDMOTION_NAVMESH
    collision_mode = avoid
    State_table = Ped_RoamStates_Table
    STATE_DEFAULT = STATE_roamingPOI
    Allow_projectiles = 0
}
bum_pedlogic_params = { Navigation_mode = PEDMOTION_STAND collision_mode = bump State_table = Bums_StateLogic_Table STATE_DEFAULT = Bums_STATE_Bums }
bumRoam_pedlogic_params = {
    Navigation_mode = PEDMOTION_NAVMESH
    collision_mode = avoid
    anim_assets = bum_anim_assets
    State_table = Ped_RoamStates_Table
    STATE_DEFAULT = STATE_roamingPOI_bum
}
chickRoam_pedlogic_params = {
    Navigation_mode = PEDMOTION_NAVMESH
    collision_mode = avoid
    anim_assets = chick_anim_assets
    State_table = Ped_RoamStates_Table
    STATE_DEFAULT = STATE_roamingPOI_chick
    Allow_projectiles = 0
    StickToGroundDistAbove = 4.0
}
cholo_pedlogic_params = { Navigation_mode = PEDMOTION_STAND collision_mode = bump State_table = HO_StateLogic_Table STATE_DEFAULT = HO_STATE_Cholo }
cholo_fall_pedlogic_params = { Navigation_mode = PEDMOTION_STAND collision_mode = fall State_table = HO_StateLogic_Table STATE_DEFAULT = HO_STATE_Cholo }
moviestar_pedlogic_params = { Navigation_mode = PEDMOTION_STAND collision_mode = bump State_table = MovieStar_StateLogic_Table STATE_DEFAULT = MovieStar_STATE_MovieStar }
bodyguard_pedlogic_params = { Navigation_mode = PEDMOTION_STAND collision_mode = bump State_table = BodyGuard_StateLogic_Table STATE_DEFAULT = BodyGuard_STATE_BodyGuard }
guitarist_pedlogic_params = { Navigation_mode = PEDMOTION_STAND collision_mode = bump State_table = ALL_StateLogic_Table STATE_DEFAULT = ALL_STATE_Guitarist_playing }
Leans_pedlogic_params = { Navigation_mode = PEDMOTION_STAND collision_mode = bump State_table = HO_StateLogic_Table STATE_DEFAULT = HO_STATE_Leans }
Sk8Punk02_pedlogic_params = { Navigation_mode = PEDMOTION_STAND collision_mode = bump State_table = Sk8Punk02_StateLogic_Table STATE_DEFAULT = Sk8Punk02_STATE_Sk8Punk02 }
Sk8Punk04_pedlogic_params = { Navigation_mode = PEDMOTION_STAND collision_mode = bump State_table = Sk8Punk04_StateLogic_Table STATE_DEFAULT = Sk8Punk04_STATE_Sk8Punk04 }
Sk8Punk03_pedlogic_params = {
    Navigation_mode = PEDMOTION_STAND
    collision_mode = bump
    State_table = Sk8Punk03_StateLogic_Table
    STATE_DEFAULT = Sk8Punk03_STATE_Sk8Punk03
    Attention_radius = 20
    Register_events = [ objectinattentionradius ]
}
Sk8Punk01_pedlogic_params = { Navigation_mode = PEDMOTION_STAND collision_mode = bump State_table = Sk8Punk01_StateLogic_Table STATE_DEFAULT = Sk8Punk01_STATE_Sk8Punk01 }
MexGraffiti_pedlogic_params = {
    Navigation_mode = PEDMOTION_STAND
    collision_mode = bump
    Allow_projectiles = 0
    anim_assets = MexGraffiti_anim_assets
    STATE_DEFAULT = STATE_standing
}
leaning_pedlogic_params = {
    Navigation_mode = PEDMOTION_STAND
    collision_mode = bump
    State_table = Leaning_StateLogic_Table
    STATE_DEFAULT = Leaning_STATE_Leaning
    Attention_radius = 12
    Register_events = [ objectinattentionradius ]
}
FloorSit_pedlogic_params = { Navigation_mode = PEDMOTION_STAND collision_mode = bump State_table = FloorSit_StateLogic_Table STATE_DEFAULT = FloorSit_STATE_FloorSit }
LedgeSit_pedlogic_params = { Navigation_mode = PEDMOTION_STAND collision_mode = bump State_table = LedgeSit_StateLogic_Table STATE_DEFAULT = LedgeSit_STATE_LedgeSit }
Snob_pedlogic_params = { Navigation_mode = PEDMOTION_STAND collision_mode = bump State_table = Snob_StateLogic_Table STATE_DEFAULT = Snob_STATE_Snob }
tagger_pedlogic_params = {
    Navigation_mode = PEDMOTION_STAND
    collision_mode = bump
    State_table = Tagger_StateLogic_Table
    STATE_DEFAULT = Tagger_STATE_Tagger
    Allow_projectiles = 0
}
PetaProtester_pedlogic_params = {
    Navigation_mode = PEDMOTION_STAND
    collision_mode = bump
    State_table = PetaProtester_StateLogic_Table
    STATE_DEFAULT = PetaProtester_STATE_PetaProtester
    Allow_projectiles = 0
}
FemalePed01_pedlogic_params = {
    Navigation_mode = PEDMOTION_STAND
    collision_mode = bump
    State_table = FemalePed01_StateLogic_Table
    STATE_DEFAULT = FemalePed01_STATE_FemalePed01
    Allow_projectiles = 0
}
Mindy_pedlogic_params = {
    Navigation_mode = PEDMOTION_STAND
    collision_mode = bump
    State_table = Mindy_StateLogic_Table
    STATE_DEFAULT = Mindy_STATE_Mindy
    Allow_projectiles = 0
}
Alva_pedlogic_params = { Navigation_mode = PEDMOTION_STAND collision_mode = bump State_table = Alva_StateLogic_Table STATE_DEFAULT = Alva_STATE_Alva }
Boone_pedlogic_params = { Navigation_mode = PEDMOTION_STAND collision_mode = bump State_table = Boone_StateLogic_Table STATE_DEFAULT = Boone_STATE_Boone }
Boone_Ignore_pedlogic_params = { Navigation_mode = PEDMOTION_STAND collision_mode = ignore State_table = Boone_StateLogic_Table STATE_DEFAULT = Boone_STATE_Boone }
Iggy_pedlogic_params = { Navigation_mode = PEDMOTION_STAND collision_mode = bump State_table = Iggy_StateLogic_Table STATE_DEFAULT = Iggy_STATE_Iggy }
UselessDave_pedlogic_params = { Navigation_mode = PEDMOTION_STAND collision_mode = bump State_table = UselessDave_StateLogic_Table STATE_DEFAULT = UselessDave_STATE_UselessDave }
SuperModel_pedlogic_params = {
    Navigation_mode = PEDMOTION_STAND
    collision_mode = bump
    State_table = SuperModel_StateLogic_Table
    STATE_DEFAULT = SuperModel_STATE_SuperModel
    Allow_projectiles = 0
}
SignGuy_pedlogic_params = { Navigation_mode = PEDMOTION_STAND collision_mode = bump State_table = SignGuy_StateLogic_Table STATE_DEFAULT = SignGuy_STATE_SignGuy }
Surfer_pedlogic_params = { Navigation_mode = PEDMOTION_STAND collision_mode = bump State_table = Surfer_StateLogic_Table STATE_DEFAULT = Surfer_STATE_Surfer }
ConstructionGuy_pedlogic_params = { Navigation_mode = PEDMOTION_STAND collision_mode = bump State_table = ConstructionGuy_StateLogic_Table STATE_DEFAULT = ConstructionGuy_STATE_ConstructionGuy }
PhotoDood_pedlogic_params = { Navigation_mode = PEDMOTION_STAND collision_mode = bump State_table = PhotoDood_StateLogic_Table STATE_DEFAULT = PhotoDood_STATE_PhotoDood }
ChinaMan_pedlogic_params = { Navigation_mode = PEDMOTION_STAND collision_mode = bump State_table = ChinaMan_StateLogic_Table STATE_DEFAULT = ChinaMan_STATE_ChinaMan }
Vato_pedlogic_params = { Navigation_mode = PEDMOTION_STAND collision_mode = bump State_table = Vato_StateLogic_Table STATE_DEFAULT = Vato_STATE_Vato }
TrashBagBum_pedlogic_params = { Navigation_mode = PEDMOTION_STAND collision_mode = bump State_table = TrashBagBum_StateLogic_Table STATE_DEFAULT = TrashBagBum_STATE_TrashBagBum }
WrenchGuy_pedlogic_params = { Navigation_mode = PEDMOTION_STAND collision_mode = bump State_table = WrenchGuy_StateLogic_Table STATE_DEFAULT = WrenchGuy_STATE_WrenchGuy }
BreakerMJ_pedlogic_params = { Navigation_mode = PEDMOTION_STAND collision_mode = ignore State_table = BreakerMJ_StateLogic_Table STATE_DEFAULT = BreakerMJ_STATE_BreakerMJ }
OldLady_pedlogic_params = {
    Navigation_mode = PEDMOTION_WAYPOINT
    collision_mode = ignore
    State_table = OldLady_StateLogic_Table
    STATE_DEFAULT = STATE_Patrol
    Allow_projectiles = 1
}
Doggie_pedlogic_params = { Navigation_mode = PEDMOTION_STAND collision_mode = bump State_table = Doggie_StateLogic_Table STATE_DEFAULT = Doggie_STATE_Doggie }
Police_pedlogic_params = { Navigation_mode = PEDMOTION_STAND collision_mode = bump State_table = Police_StateLogic_Table STATE_DEFAULT = Police_STATE_Police }
Surplus_pedlogic_params = { Navigation_mode = PEDMOTION_STAND collision_mode = bump State_table = Surplus_StateLogic_Table STATE_DEFAULT = Surplus_STATE_Surplus }
Barber_pedlogic_params = { Navigation_mode = PEDMOTION_STAND collision_mode = bump State_table = Barber_StateLogic_Table STATE_DEFAULT = Barber_STATE_Barber }
SkateShopGuy_pedlogic_params = { Navigation_mode = PEDMOTION_STAND collision_mode = bump State_table = SkateShopGuy_StateLogic_Table STATE_DEFAULT = SkateShopGuy_STATE_SkateShopGuy }
Robot_pedlogic_params = { Navigation_mode = PEDMOTION_STAND collision_mode = bump State_table = Robot_StateLogic_Table STATE_DEFAULT = Robot_STATE_Robot }
BMXPed_pedlogic_params = { Navigation_mode = PEDMOTION_STAND collision_mode = bump State_table = BMXPed_StateLogic_Table STATE_DEFAULT = BMXPed_STATE_BMXPed }
Z_SR_Target_pedlogic_params = { Navigation_mode = PEDMOTION_STAND collision_mode = ignore State_table = SR_Target_StateLogic_Table STATE_DEFAULT = STATE_PASSIVE }
Z_SR_Pigeon_pedlogic_params = { Navigation_mode = PEDMOTION_WAYPOINT collision_mode = ignore State_table = SR_pigeon_StateLogic_Table STATE_DEFAULT = STATE_walking }
Z_SM_Carny_pedlogic_params = {
    Navigation_mode = PEDMOTION_STAND
    collision_mode = ignore
    Allow_projectiles = 0
    Attention_radius = 5
    Register_events = [ objectinattentionradius ]
    State_table = SM_Carny_StateLogic_Table
    STATE_DEFAULT = STATE_standing
    should_look_at_skater = 0
}
Ped_HippieF01 = {
    creation_params = ped_m_creation_params
    pedlogic_params = stand_pedlogic_params
    ped_m_head = { desc_id = Ped_HippieF_Head01 }
    ped_m_torso = { desc_id = Ped_HippieF_Torso01 }
    ped_m_legs = { desc_id = Ped_HippieF_Legs01 }
}
Ped_Businessman01 = {
    ped_m_head = { desc_id = Ped_BusinessMan_HEAD02 }
    ped_m_torso = { desc_id = Ped_BusinessMan_TORSO01 }
    ped_m_legs = { desc_id = Ped_BusinessMan_LEGS01 }
    ped_m_accessories = { desc_id = Ped_Businessman_Glasses }
    pedlogic_params = stand_pedlogic_params
}
Ped_OldLady_Fullbody = {
    creation_params = ped_m_creation_params
    ped_body = { desc_id = Ped_OldLady_Fullbody }
    pedlogic_params = stand_pedlogic_params
}
Ped_HippieF_FullBody01 = {
    creation_params = ped_m_creation_params
    ped_body = { desc_id = Ped_HippieF_FullBody01 }
    pedlogic_params = stand_pedlogic_params
}
PedPro_Hawk = {
    ped_head = { desc_id = Pro_Hawk_Head }
    ped_body = { desc_id = PedPro_Hawk }
    Voice_prefix = 'Hawk'
    creation_params = ped_m_creation_params
    pedlogic_params = stand_pedlogic_params
    Extra_Anims = animload_PED_M_Pissed
}
Ped_Asshole_Skater = {
    creation_params = ped_m_creation_params
    pedlogic_params = skater_pedlogic_params
    ped_head = { desc_id = Ped_RandomSkater_HEAD }
    ped_body = { desc_id = Ped_RandomSkater }
    ped_board = { desc_id = ped_board }
}
Ped_Sign_dt = {
    creation_params = ped_m_creation_params
    ped_body = { desc_id = Ped_SignDude }
    ped_m_accessories = { desc_id = Ped_Sign_dt }
    pedlogic_params = SignGuy_pedlogic_params
    Extra_Anims = animload_THPS7_SignGuy
}
Ped_ChineseMan = {
    creation_params = ped_m_creation_params
    ped_head = { desc_id = Ped_Chineseman_Head }
    ped_body = { desc_id = Ped_ChineseMan }
    pedlogic_params = ChinaMan_pedlogic_params
    Extra_Anims = animload_THPS7_ChinaMan
}
Ped_photoguy = {
    creation_params = ped_m_creation_params
    ped_body = { desc_id = Ped_photoguy }
    pedlogic_params = PhotoDood_pedlogic_params
    Extra_Anims = animload_THPS7_PhotoDood
}
Ped_Mindy = {
    creation_params = ped_f_creation_params
    ped_head = { desc_id = Ped_Mindy_Head }
    ped_body = { desc_id = Ped_Mindy }
    Scale = (0.949999988079071, 0.949999988079071, 0.949999988079071)
    pedlogic_params = Mindy_pedlogic_params
    Extra_Anims = animload_THPS7_Mindy
}
Ped_FrenchGuy = {
    creation_params = ped_m_creation_params
    pedlogic_params = standNoLookOrAvoid_pedlogic_params
    ped_body = { desc_id = Ped_FrenchGuy_Body }
    ped_head = { desc_id = Ped_FrenchGuy_Head }
    Scale = (1.0, 0.8999999761581421, 0.8999999761581421)
}
Profile_Anl_Shark = {
    creation_params = Anl_Shark_creation_params
    anl_body = { desc_id = shark }
    Extra_Anims = animload_anl_shark
    Scale = (4.0, 4.0, 4.0)
}
Ped_M_Business01 = {
    creation_params = ped_m_creation_params
    random_parts = [
        [ Ped_M_Busi_head ]
        [ Ped_M_Busi_torso ]
        [ Ped_M_Busi_legs ]
        [ Ped_M_Busi_accessories ]
    ]
}
ped_SkaterSelect_03 = {
    creation_params = ped_m_creation_params
    pedlogic_params = standNoLookOrAvoid_pedlogic_params
    ped_m_head = { desc_id = Ped_GenericSkater_Head03 }
    ped_m_torso = { desc_id = Ped_GenericSkater_Torso04 }
    ped_m_legs = { desc_id = Ped_GenericSkater_Pants01 }
    ped_board = { desc_id = ped_board_03 }
}
Ped_Businessman03 = {
    ped_m_head = { desc_id = Ped_BusinessMan_HEAD03 }
    ped_m_torso = { desc_id = Ped_BusinessMan_TORSO03 }
    ped_m_legs = { desc_id = Ped_BusinessMan_LEGS02 }
    ped_m_accessories = { desc_id = Ped_Businessman_Glasses }
    pedlogic_params = stand_pedlogic_params
}
Ped_Cop_Blocker = {
    creation_params = ped_m_creation_params
    ped_head = { desc_id = Ped_Policemen_HEAD01 }
    ped_body = { desc_id = Ped_Policeman_BODY }
    ped_m_accessories = { desc_id = Ped_Policemen_Hat }
    pedlogic_params = blocker_pedlogic_params
    Extra_Anims = animload_THPS7_Blocker
}
Ped_HippieF_FullBody03 = {
    creation_params = ped_m_creation_params
    ped_body = { desc_id = Ped_HippieF_FullBody03 }
    pedlogic_params = stand_pedlogic_params
}
Global_Ped_Skater_01_Skatelogic = {
    creation_params = ped_m_creation_params
    pedlogic_params = skater_pedlogic_params
    ped_body = { desc_id = Ped_StreetPunk }
    ped_board = { desc_id = ped_board }
}
CUT_Iggy = {
    creation_params = ped_m_creation_params
    ped_body = { desc_id = CUT_Iggy }
    pedlogic_params = stand_pedlogic_params
}
Ped_HippieF_FullBody02 = {
    creation_params = ped_m_creation_params
    ped_body = { desc_id = Ped_HippieF_FullBody02 }
    pedlogic_params = stand_pedlogic_params
}
ped_SkaterSelect_02 = {
    creation_params = ped_m_creation_params
    pedlogic_params = standNoLookOrAvoid_pedlogic_params
    ped_m_head = { desc_id = Ped_GenericSkater_Head02 }
    ped_m_torso = { desc_id = Ped_GenericSkater_Torso02 }
    ped_m_legs = { desc_id = Ped_GenericSkater_Pants03 }
    ped_m_accessories = { desc_id = Ped_GenericSkater_Hair01 }
    ped_board = { desc_id = ped_board_02 }
}
Ped_Businessman02 = {
    ped_m_head = { desc_id = Ped_BusinessMan_HEAD01 }
    ped_m_torso = { desc_id = Ped_BusinessMan_TORSO02 }
    ped_m_legs = { desc_id = Ped_BusinessMan_LEGS01 }
    ped_m_accessories = { desc_id = Ped_Businessman_Briefcase }
    pedlogic_params = stand_pedlogic_params
}
Ped_OilRigWorker = {
    creation_params = ped_m_creation_params
    ped_head = { desc_id = Ped_oilrigworker_HEAD }
    ped_body = { desc_id = Ped_OilRigWorker }
    pedlogic_params = WrenchGuy_pedlogic_params
    Extra_Anims = animload_THPS7_WrenchGuy
}
Ped_Dave = {
    creation_params = ped_m_creation_params
    ped_head = { desc_id = Ped_Dave_Head }
    ped_body = { desc_id = Ped_Dave }
    ped_board = { desc_id = ped_board }
    pedlogic_params = Snob_pedlogic_params
    Scale = (1.0, 0.9300000071525574, 0.9300000071525574)
}
Ped_PerformerSilver = {
    creation_params = ped_m_creation_params
    ped_body = { desc_id = Ped_PerformerSilver }
    pedlogic_params = Robot_pedlogic_params
    Extra_Anims = animload_THPS7_SilverDood
}
Ped_Construction_Target = {
    creation_params = ped_m_creation_params
    pedlogic_params = Z_SR_Target_pedlogic_params
    ped_body = { desc_id = Ped_Construction }
    Extra_Anims = animload_THPS7_ConstructionGuy
}
Pro_Hoffman = {
    creation_params = ped_m_creation_params
    pedlogic_params = stand_pedlogic_params
    ped_head = { desc_id = Pro_Hoffman_Head }
    ped_body = { desc_id = Pro_Hoffman_Body }
    ped_board = { desc_id = ped_board }
}
Ped_DogTownGuy = {
    creation_params = ped_m_creation_params
    ped_head = { desc_id = Ped_DogTownGuy_Head }
    ped_body = { desc_id = Ped_DogTownGuy }
    ped_m_accessories = { desc_id = Ped_DogTownGuy_LEGS }
    ped_board = { desc_id = ped_board }
    pedlogic_params = stand_pedlogic_params
}
Ped_Mega = {
    creation_params = ped_m_creation_params
    ped_head = { desc_id = Ped_Mega_Head }
    ped_body = { desc_id = Ped_Mega }
    Scale = (1.0, 1.0299999713897705, 1.0)
    pedlogic_params = stand_pedlogic_params
}
Ped_AccGuy_NoStandLookOrAvoid = {
    creation_params = ped_m_creation_params
    pedlogic_params = standNoLookOrAvoid_pedlogic_params
    ped_body = { desc_id = Ped_AccGuy }
    Scale = (1.0, 0.8999999761581421, 0.8999999761581421)
}
Pro_Hoffman_Bike = {
    creation_params = ped_m_creation_params
    pedlogic_params = BMXPed_pedlogic_params
    Extra_Anims = animload_THPS7_Ped_BMX
    specialitem = Ped_BMX_details
    ped_head = { desc_id = Pro_Hoffman_Head }
    ped_body = { desc_id = Pro_Hoffman_Body }
}
ped_Vato_Fall = {
    creation_params = ped_m_creation_params
    pedlogic_params = Vato_pedlogic_params
    ped_head = { desc_id = Ped_Vato_HEAD1 }
    ped_body = { desc_id = Ped_Vato }
    ped_board = { desc_id = ped_board }
    body_shape = Fatman_scale_info
}
Pro_Trujillo = {
    creation_params = ped_m_creation_params
    pedlogic_params = Sk8Punk02_pedlogic_params
    ped_body = { desc_id = Pro_Trujillo_Body }
    ped_head = { desc_id = Pro_Trujillo_Head }
    ped_board = { desc_id = ped_board }
}
Ped_RandomSkater_HEAD = {
    creation_params = ped_m_creation_params
    ped_m_head = { desc_id = Ped_RandomSkater_HEAD }
}
Arrow_test = {
    ped_body = { desc_id = Arrow_test }
}
Default_Skin = {
    creation_params = ped_m_creation_params
    ped_body = { desc_id = Default_Skin }
}
Pro_Rick_Thorne = {
    creation_params = ped_m_creation_params
    pedlogic_params = stand_pedlogic_params
    ped_body = { desc_id = Pro_Thorne_Body }
    ped_head = { desc_id = Pro_Thorne_Head }
}
Ped_FatConstruction = {
    creation_params = ped_m_creation_params
    ped_head = { desc_id = Ped_FatConstruction_HEAD }
    ped_body = { desc_id = Ped_FatConstruction }
    pedlogic_params = stand_pedlogic_params
    body_shape = Fatman_scale_info
    Scale = (0.949999988079071, 0.9300000071525574, 0.949999988079071)
}
Profile_Anl_Pigeon = {
    creation_params = Anl_Pigeon_creation_params
    anl_body = { desc_id = pigeon }
    Extra_Anims = animload_anl_pigeon
}
Ped_KidSkater = {
    creation_params = ped_m_creation_params
    ped_body = { desc_id = Ped_KidSkater }
    pedlogic_params = BreakerMJ_pedlogic_params
    Extra_Anims = animload_THPS7_BreakerMJ
    Scale = (0.949999988079071, 0.8999999761581421, 0.8999999761581421)
}
Pro_Hawk = {
    creation_params = ped_m_creation_params
    pedlogic_params = stand_pedlogic_params
    ped_head = { desc_id = Pro_Hawk_Head }
    ped_body = { desc_id = Pro_Hawk }
    ped_board = { desc_id = ped_board }
}
Ped_cholo_roam = {
    creation_params = ped_m_creation_params
    pedlogic_params = GenericRoam_pedlogic_params
    ped_head = { desc_id = Ped_Cholo_HEAD01 }
    ped_body = { desc_id = Ped_cholo }
    faction = cholo_peds
}
Ped_James_Foster = {
    creation_params = ped_m_creation_params
    pedlogic_params = stand_pedlogic_params
    ped_head = { desc_id = Ped_James_Foster_Head }
    ped_body = { desc_id = Ped_ButterBody }
    ped_board = { desc_id = ped_board }
}
Ped_Andy_Bakken = {
    creation_params = ped_m_creation_params
    pedlogic_params = stand_pedlogic_params
    ped_head = { desc_id = Ped_Andy_Bakken_Head }
    ped_body = { desc_id = Ped_ButterBody }
    ped_board = { desc_id = ped_board }
}
Profile_Anl_Pitbull2 = {
    creation_params = Anl_Dog2_creation_params
    anl_body = { desc_id = pitbull2 }
    Extra_Anims = animload_anl_dog
}
Cut_Boone = {
    creation_params = ped_m_creation_params
    ped_body = { desc_id = Cut_Boone_Body }
    pedlogic_params = stand_pedlogic_params
    Scale = (0.9800000190734863, 0.9800000190734863, 0.9800000190734863)
}
ped_SkaterSelect_04 = {
    creation_params = ped_m_creation_params
    pedlogic_params = standNoLookOrAvoid_pedlogic_params
    ped_m_head = { desc_id = Ped_GenericSkater_Head01 }
    ped_m_torso = { desc_id = Ped_GenericSkater_Torso01 }
    ped_m_legs = { desc_id = Ped_GenericSkater_Pants02 }
    ped_m_accessories = { desc_id = Ped_GenericSkater_Hat01 }
    ped_board = { desc_id = ped_board_04 }
}
Ped_HippieF_FullBody04 = {
    creation_params = ped_m_creation_params
    ped_body = { desc_id = Ped_HippieF_FullBody04 }
    pedlogic_params = stand_pedlogic_params
}
Ped_Carny = {
    creation_params = ped_m_creation_params
    ped_head = { desc_id = Ped_Carny_HEAD }
    ped_body = { desc_id = Ped_Carny }
    pedlogic_params = standNoLookOrAvoid_pedlogic_params
}
Pro_Ellis = {
    creation_params = ped_m_creation_params
    pedlogic_params = stand_pedlogic_params
    ped_body = { desc_id = Pro_Ellis }
    ped_board = { desc_id = ped_board }
}
Ped_Murphy = {
    creation_params = ped_m_creation_params
    ped_head = { desc_id = Ped_Murphy_Head }
    ped_body = { desc_id = Ped_Murphy }
    ped_board = { desc_id = ped_board }
    Scale = (0.9599999785423279, 1.059999942779541, 1.0)
    pedlogic_params = leaning_pedlogic_params
}
Ped_Construction = {
    creation_params = ped_m_creation_params
    ped_body = { desc_id = Ped_Construction }
    pedlogic_params = ConstructionGuy_pedlogic_params
    Extra_Anims = animload_THPS7_ConstructionGuy
}
Ped_Skateboard_a = {
    ped_body = { desc_id = Ped_Chinatown1 }
    ped_board = { desc_id = ped_board }
    Scale = (0.8500000238418579, 0.8500000238418579, 0.8500000238418579)
    creation_params = ped_m_creation_params
}
Ped_F_Business01 = {
    creation_params = ped_f_creation_params
    random_parts = [
        [ Ped_F_Busi_head ]
        [ Ped_F_Busi_torso ]
        [ Ped_F_Busi_legs ]
    ]
}
Pro_Williams = {
    creation_params = ped_m_creation_params
    pedlogic_params = Sk8Punk01_pedlogic_params
    ped_body = { desc_id = Pro_Williams_Body }
    ped_head = { desc_id = Pro_Williams_Head }
    ped_board = { desc_id = ped_board }
}
random_male_profile = {
    creation_params = ped_m_creation_params
    pedlogic_params = stand_pedlogic_params
    ped_m_head = { desc_id = Ped_RandomSkater_HEAD }
    ped_m_torso = { desc_id = Ped_Bum_Torso01 }
    ped_m_legs = { desc_id = Ped_GenericSkater_Pants02 }
    ped_board = { desc_id = ped_board }
}
#"0x8344fe4d" = {
    creation_params = ped_m_creation_params
    ped_m_head = { desc_id = Ped_Cholo_HEAD01 }
    ped_m_torso = { desc_id = Ped_GenericSkater_Torso02 }
    ped_m_legs = { desc_id = Ped_GenericSkater_Pants01 }
    ped_board = { desc_id = ped_board }
}
#"0x1a4daff7" = {
    creation_params = ped_m_creation_params
    ped_m_head = { desc_id = Ped_BusinessMan_HEAD02 }
    ped_m_torso = { desc_id = Ped_BusinessMan_TORSO02 }
    ped_m_legs = { desc_id = Ped_BusinessMan_LEGS02 }
    ped_m_accessories = { desc_id = Ped_Businessman_Briefcase01 }
    ped_board = { desc_id = ped_board }
}
#"0x6d4a9f61" = {
    creation_params = ped_m_creation_params
    ped_body = { desc_id = Ped_Barber }
    ped_board = { desc_id = ped_board }
    pedlogic_params = Barber_pedlogic_params
}
#"0xf32e0ac2" = {
    creation_params = ped_f_creation_params
    ped_body = { desc_id = Ped_Mindy }
    ped_board = { desc_id = ped_board }
    pedlogic_params = Mindy_pedlogic_params
}
#"0xf255ce1e" = {
    creation_params = ped_m_creation_params
    ped_m_head = { desc_id = Ped_Bum_Head01 }
    ped_m_torso = { desc_id = Ped_Bum_Torso01 }
    ped_m_legs = { desc_id = Ped_Bum_Legs01 }
}
Ped_Clover = {
    creation_params = ped_f_creation_params
    pedlogic_params = stand_pedlogic_params
    ped_body = { desc_id = Ped_Clover }
    ped_board = { desc_id = ped_board }
}
Ped_Barber = {
    creation_params = ped_m_creation_params
    ped_body = { desc_id = Ped_Barber }
    pedlogic_params = Barber_pedlogic_params
}
Cut_Kelly = {
    creation_params = ped_f_creation_params
    ped_body = { desc_id = Kelly_Full }
    defaultanimname = NewBrakeIdle_Female
}
Ped_Sign_ho = {
    creation_params = ped_m_creation_params
    ped_body = { desc_id = Ped_SignDude }
    ped_m_accessories = { desc_id = Ped_Sign_ho }
    pedlogic_params = SignGuy_pedlogic_params
    Extra_Anims = animload_THPS7_SignGuy
}
Ped_Vato = {
    creation_params = ped_m_creation_params
    pedlogic_params = Vato_pedlogic_params
    ped_head = { desc_id = Ped_Vato_HEAD1 }
    ped_body = { desc_id = Ped_Vato }
    ped_board = { desc_id = ped_board }
    body_shape = Fatman_scale_info
}
Pro_Hoffman_Skatelogic = {
    creation_params = ped_m_creation_params
    pedlogic_params = skater_pedlogic_params
    ped_head = { desc_id = Pro_Hoffman_Head }
    ped_body = { desc_id = Pro_Hoffman_Body }
    ped_board = { desc_id = ped_board }
}
Ped_SurPlus = {
    creation_params = ped_m_creation_params
    pedlogic_params = Surplus_pedlogic_params
    ped_body = { desc_id = Ped_SurPlus }
    Scale = (0.9700000286102295, 0.9599999785423279, 0.9700000286102295)
}
Ped_KidSkaterEastLA = {
    creation_params = ped_m_creation_params
    ped_body = { desc_id = Ped_KidSkaterEastLA }
    pedlogic_params = stand_pedlogic_params
}
Pro_Mullen = {
    creation_params = ped_m_creation_params
    pedlogic_params = stand_pedlogic_params
    ped_head = { desc_id = Pro_Mullen_Head }
    ped_body = { desc_id = Pro_Mullen }
    ped_board = { desc_id = ped_board }
}
Global_Ped_DVguy = {
    creation_params = ped_m_creation_params
    ped_body = { desc_id = Ped_DVGuy }
    ped_head = { desc_id = Ped_DVGuy_Head }
    pedlogic_params = standNoLookOrAvoid_pedlogic_params
}
Ped_Boone = {
    creation_params = ped_m_creation_params
    ped_head = { desc_id = Ped_Boone_Head }
    ped_body = { desc_id = Ped_Boone }
    ped_m_legs = { desc_id = Ped_Boone_LEGS }
    ped_board = { desc_id = ped_board }
    pedlogic_params = Boone_pedlogic_params
    Extra_Anims = animload_THPS7_Boone
    Scale = (0.9800000190734863, 0.9800000190734863, 0.9800000190734863)
}
random_female_profile = {
    creation_params = ped_f_creation_params
    ped_body = { desc_id = Ped_Latina }
}
Global_Ped_Skater_01 = {
    creation_params = ped_m_creation_params
    pedlogic_params = stand_pedlogic_params
    ped_body = { desc_id = Ped_StreetPunk }
    ped_board = { desc_id = ped_board }
}
Ped_FatConstruction_Blocker = {
    creation_params = ped_m_creatiyon_params
    ped_head = { desc_id = Ped_FatConstruction_HEAD }
    ped_body = { desc_id = Ped_FatConstruction }
    pedlogic_params = blocker_pedlogic_params
    Extra_Anims = animload_THPS7_Blocker
    body_shape = Fatman_scale_info
    Scale = (0.949999988079071, 0.9300000071525574, 0.949999988079071)
}
Global_Ped_Skater_01_Tall = {
    creation_params = ped_m_creation_params
    pedlogic_params = stand_pedlogic_params
    ped_body = { desc_id = Ped_StreetPunk }
    ped_board = { desc_id = ped_board }
    Scale = (1.0, 1.2000000476837158, 1.0)
}
Ped_StreetPunk = {
    creation_params = ped_m_creation_params
    pedlogic_params = Sk8Punk02_pedlogic_params
    ped_body = { desc_id = Ped_StreetPunk }
    faction = falling_Peds
}
ped_dummy_zsrgap = {}
Debug_IGC_Head = {
    creation_params = ped_m_creation_params
    ped_m_head = { desc_id = Debug_IGC_Head }
}
Global_Ped_Skater_01_Fat = {
    creation_params = ped_m_creation_params
    pedlogic_params = stand_pedlogic_params
    ped_body = { desc_id = Ped_StreetPunk }
    ped_board = { desc_id = ped_board }
    Scale = (1.2000000476837158, 1.0, 1.2000000476837158)
}
Ped_Sunset_rocker = {
    creation_params = ped_m_creation_params
    pedlogic_params = stand_pedlogic_params
    ped_body = { desc_id = Ped_Sunset_rocker }
    faction = rocker_peds
}
Ped_LilJohn = {
    creation_params = ped_m_creation_params
    pedlogic_params = stand_pedlogic_params
    ped_body = { desc_id = Ped_LilJohn_Body }
    ped_head = { desc_id = Ped_LilJohn_Head }
    ped_board = { desc_id = ped_board }
}
Ped_Iggy = {
    creation_params = ped_m_creation_params
    ped_head = { desc_id = Ped_Iggy_Head }
    ped_body = { desc_id = Ped_Iggy_Body }
    ped_board = { desc_id = ped_board }
    pedlogic_params = standNoLookOrAvoid_pedlogic_params
}
Cut_Hawk = {
    ped_body = { desc_id = Hawk_Full }
    creation_params = ped_m_creation_params
    pedlogic_params = stand_pedlogic_params
}
Pro_HawkOldSchool = {
    creation_params = ped_m_creation_params
    pedlogic_params = stand_pedlogic_params
    ped_body = { desc_id = Pro_HawkOldSchool }
    ped_board = { desc_id = ped_board }
}
ped_Skater_04 = {
    creation_params = ped_m_creation_params
    pedlogic_params = Sk8Punk01_pedlogic_params
    ped_m_head = { desc_id = Ped_GenericSkater_Head01 }
    ped_m_torso = { desc_id = Ped_GenericSkater_Torso01 }
    ped_m_legs = { desc_id = Ped_GenericSkater_Pants02 }
    ped_m_accessories = { desc_id = Ped_GenericSkater_Hat01 }
    ped_board = { desc_id = ped_board }
}
Ped_Policemen_04 = {
    creation_params = ped_m_creation_params
    ped_head = { desc_id = Ped_Policemen_HEAD04 }
    ped_body = { desc_id = Ped_Policeman_BODY }
    ped_m_accessories = { desc_id = Ped_Policemen_Glasses01 }
    pedlogic_params = Police_pedlogic_params
    Extra_Anims = animload_THPS7_Police
}
Ped_Sunset_rocker2 = {
    creation_params = ped_m_creation_params
    pedlogic_params = stand_pedlogic_params
    ped_body = { desc_id = Ped_Sunset_rocker2 }
    faction = rocker_peds
}
Cut_Dave = {
    creation_params = ped_m_creation_params
    ped_body = { desc_id = Cut_Dave_Full }
    Scale = (1.0, 0.9300000071525574, 0.9300000071525574)
    pedlogic_params = stand_pedlogic_params
}
Ped_DogTownGuy2 = {
    creation_params = ped_m_creation_params
    ped_head = { desc_id = Ped_DogTownGuy2_Head }
    ped_body = { desc_id = Ped_DogTownGuy2 }
    ped_m_accessories = { desc_id = Ped_DogTownGuy_LEGS }
    pedlogic_params = stand_pedlogic_params
}
Ped_BusinessWoman01 = {
    ped_m_head = { desc_id = Ped_BusinessWoman_HEAD01 }
    ped_m_torso = { desc_id = Ped_BusinessWoman_TORSO01 }
    ped_m_legs = { desc_id = Ped_BusinessWoman_LEGS01 }
    pedlogic_params = stand_pedlogic_params
}
Cut_Mega = {
    creation_params = ped_m_creation_params
    ped_body = { desc_id = Cut_Mega_Body }
    Scale = (1.0, 1.0299999713897705, 1.0)
    pedlogic_params = stand_pedlogic_params
}
Ped_YoungSkater01 = {
    creation_params = ped_m_creation_params
    pedlogic_params = stand_pedlogic_params
    ped_head = { desc_id = Ped_Youngskater_Head01 }
    ped_body = { desc_id = Ped_YoungSkater_Body01 }
    ped_m_legs = { desc_id = Ped_YoungSkater_Pants01 }
    ped_board = { desc_id = ped_board }
    Scale = (0.949999988079071, 0.9599999785423279, 0.949999988079071)
}
ped_pole_Worker = {
    creation_params = ped_m_creation_params
    ped_body = { desc_id = Ped_Construction }
    pedlogic_params = stand_pedlogic_params
}
Ped_01 = {
    creation_params = ped_m_creation_params
    pedlogic_params = goal_pedlogic_params
    random_parts = [
        [ ped_m_head ]
        [ ped_m_torso ]
        [ ped_m_legs ]
    ]
    defaultanimname = Ped_Bum_Stand_Beg
}
Ped_YoungSkater02 = {
    creation_params = ped_m_creation_params
    pedlogic_params = stand_pedlogic_params
    ped_body = { desc_id = Ped_YoungSkater_Body02 }
    ped_m_legs = { desc_id = Ped_YoungSkater_Pants01 }
    Scale = (0.8999999761581421, 0.9399999976158142, 0.8999999761581421)
}
Ped_Sign_bh = {
    creation_params = ped_m_creation_params
    ped_body = { desc_id = Ped_SignDude }
    ped_m_accessories = { desc_id = Ped_Sign_bh }
    pedlogic_params = SignGuy_pedlogic_params
    Extra_Anims = animload_THPS7_SignGuy
}
Ped_BusinessWoman02 = {
    ped_m_head = { desc_id = Ped_BusinessWoman_HEAD02 }
    ped_m_torso = { desc_id = Ped_BusinessWoman_TORSO02 }
    ped_m_legs = { desc_id = Ped_BusinessWoman_LEGS01 }
    pedlogic_params = stand_pedlogic_params
}
Ped_HippieF04 = {
    creation_params = ped_m_creation_params
    pedlogic_params = stand_pedlogic_params
    ped_m_head = { desc_id = Ped_HippieF_Head02 }
    ped_m_torso = { desc_id = Ped_HippieF_Torso01 }
    ped_m_legs = { desc_id = Ped_HippieF_Legs01 }
}
Ped_Baller = {
    creation_params = ped_m_creation_params
    ped_body = { desc_id = Ped_Baller }
    defaultanimname = prop
    Extra_Anims = animload_THPS7_Human_0
}
Ped_YoungSkater03 = {
    creation_params = ped_m_creation_params
    pedlogic_params = stand_pedlogic_params
    ped_body = { desc_id = Ped_YoungSkater_Body03 }
    ped_m_legs = { desc_id = Ped_YoungSkater_Pants01 }
    Scale = (1.0, 0.8899999856948853, 1.0)
}
Ped_HippieF05 = {
    creation_params = ped_m_creation_params
    pedlogic_params = stand_pedlogic_params
    ped_m_head = { desc_id = Ped_HippieF_Head01 }
    ped_m_torso = { desc_id = Ped_HippieF_Torso03 }
    ped_m_legs = { desc_id = Ped_HippieF_Legs01 }
}
Ped_DVGuy = {
    creation_params = ped_m_creation_params
    ped_body = { desc_id = Ped_DVGuy }
    ped_head = { desc_id = Ped_DVGuy_Head }
    pedlogic_params = standNoLookOrAvoid_pedlogic_params
}
ped_Skater_03 = {
    creation_params = ped_m_creation_params
    pedlogic_params = Sk8Punk01_pedlogic_params
    ped_m_head = { desc_id = Ped_GenericSkater_Head03 }
    ped_m_torso = { desc_id = Ped_GenericSkater_Torso04 }
    ped_m_legs = { desc_id = Ped_GenericSkater_Pants01 }
    ped_m_accessories = { desc_id = Ped_GenericSkater_Hair02 }
    ped_board = { desc_id = ped_board }
}
Ped_BMX = {
    creation_params = Ped_BMX_creation_params
    ped_body = { desc_id = Ped_BMX }
}
Ped_Cop_NoCopAnims = {
    creation_params = ped_m_creation_params
    ped_head = { desc_id = Ped_Policemen_HEAD01 }
    ped_body = { desc_id = Ped_Policeman_BODY }
    ped_m_accessories = { desc_id = Ped_Policemen_Hat }
    pedlogic_params = stand_pedlogic_params
}
Pro_Daewon = {
    creation_params = ped_m_creation_params
    pedlogic_params = Sk8Punk02_pedlogic_params
    ped_head = { desc_id = Pro_Daewon_Head }
    ped_body = { desc_id = Pro_Daewon }
    ped_board = { desc_id = ped_board }
}
Ped_Boone_Underwear = {
    creation_params = ped_m_creation_params
    ped_head = { desc_id = Ped_Boone_Head }
    ped_body = { desc_id = Ped_Boone }
    ped_m_legs = { desc_id = Ped_Boone_Underwear }
    ped_board = { desc_id = ped_board }
    pedlogic_params = Boone_Ignore_pedlogic_params
    Extra_Anims = animload_THPS7_Boone
    Scale = (0.9800000190734863, 0.9800000190734863, 0.9800000190734863)
}
ped_Skater_02 = {
    creation_params = ped_m_creation_params
    pedlogic_params = Sk8Punk04_pedlogic_params
    ped_m_head = { desc_id = Ped_GenericSkater_Head02 }
    ped_m_torso = { desc_id = Ped_GenericSkater_Torso03 }
    ped_m_legs = { desc_id = Ped_GenericSkater_Pants03 }
    ped_m_accessories = { desc_id = Ped_GenericSkater_Hair01 }
    ped_board = { desc_id = ped_board }
}
Cut_Murphy = {
    creation_params = ped_m_creation_params
    ped_body = { desc_id = Cut_Murphy_Full }
    Scale = (0.9599999785423279, 1.059999942779541, 1.0)
    pedlogic_params = stand_pedlogic_params
}
Ped_Sign_sm = {
    creation_params = ped_m_creation_params
    ped_body = { desc_id = Ped_SignDude }
    ped_m_accessories = { desc_id = Ped_Sign_sm }
    pedlogic_params = SignGuy_pedlogic_params
    Extra_Anims = animload_THPS7_SignGuy
}
Global_Ped_Skater_01_Small = {
    creation_params = ped_m_creation_params
    pedlogic_params = stand_pedlogic_params
    ped_body = { desc_id = Ped_StreetPunk }
    ped_board = { desc_id = ped_board }
    Scale = (0.800000011920929, 0.800000011920929, 0.800000011920929)
}
pro_Hawk_THUG3 = {
    creation_params = ped_m_creation_params
    ped_head = { desc_id = Pro_Hawk_Head }
    ped_body = { desc_id = pro_Hawk_THUG3 }
}
Ped_Asshole = {
    creation_params = ped_m_creation_params
    pedlogic_params = stand_pedlogic_params
    ped_head = { desc_id = Ped_RandomSkater_HEAD }
    ped_body = { desc_id = Ped_RandomSkater }
    ped_board = { desc_id = ped_board }
}
Ped_Skater_01 = {
    creation_params = ped_m_creation_params
    ped_body = { desc_id = Ped_Sunset_rocker2 }
    ped_board = { desc_id = ped_board }
    faction = rocker_peds
}
Ped_cholo = {
    creation_params = ped_m_creation_params
    ped_head = { desc_id = Ped_Cholo_HEAD01 }
    ped_body = { desc_id = Ped_cholo }
    board = { desc_id = default }
    Extra_Anims = animload_Ped_Cholo
    pedlogic_params = cholo_pedlogic_params
}
Ped_ShopOwner = {
    creation_params = ped_f_creation_params
    ped_body = { desc_id = Ped_ShopOwner }
    pedlogic_params = standNoLookOrAvoid_pedlogic_params
    Scale = (0.9599999785423279, 0.9399999976158142, 0.9599999785423279)
}
Jimbo = {
    creation_params = ped_m_creation_params
    pedlogic_params = stand_pedlogic_params
    ped_body = { desc_id = Jimbo }
}
Ped_AccGuy = {
    creation_params = ped_m_creation_params
    pedlogic_params = stand_pedlogic_params
    ped_body = { desc_id = Ped_AccGuy }
    Scale = (1.0, 0.8999999761581421, 0.8999999761581421)
}
Debug_Skater_Head = {
    creation_params = ped_m_creation_params
    ped_m_head = { desc_id = Debug_Skater_Head }
}
Pro_THUGHawk = {
    creation_params = ped_m_creation_params
    ped_body = { desc_id = Pro_THUGHawk }
}
Ped_HippieF02 = {
    creation_params = ped_m_creation_params
    pedlogic_params = stand_pedlogic_params
    ped_m_head = { desc_id = Ped_HippieF_Head02 }
    ped_m_torso = { desc_id = Ped_HippieF_Torso02 }
    ped_m_legs = { desc_id = Ped_HippieF_Legs02 }
}
Ped_DogTownGuy2_NoLookOrAvoid = {
    creation_params = ped_m_creation_params
    ped_head = { desc_id = Ped_DogTownGuy2_Head }
    ped_body = { desc_id = Ped_DogTownGuy2 }
    ped_m_accessories = { desc_id = Ped_DogTownGuy_LEGS }
    pedlogic_params = standNoLookOrAvoid_pedlogic_params
}
Ped_Asshole_Skater_Slow = {
    creation_params = ped_m_creation_params
    pedlogic_params = skater_slow_pedlogic_params
    ped_head = { desc_id = Ped_RandomSkater_HEAD }
    ped_body = { desc_id = Ped_RandomSkater }
    ped_board = { desc_id = ped_board }
}
Pro_Alva2 = {
    creation_params = ped_m_creation_params
    pedlogic_params = stand_pedlogic_params
    ped_body = { desc_id = Pro_Alva2 }
    ped_board = { desc_id = ped_board }
}
Ped_Policemen_01 = {
    creation_params = ped_m_creation_params
    ped_head = { desc_id = Ped_Policemen_HEAD01 }
    ped_body = { desc_id = Ped_Policeman_BODY }
    ped_m_accessories = { desc_id = Ped_Policemen_Hat }
    pedlogic_params = Police_pedlogic_params
    Extra_Anims = animload_THPS7_Police
}
Ped_SandwichDude = {
    creation_params = ped_m_creation_params
    ped_body = { desc_id = Ped_SandwichDude }
    defaultanimname = Ped_RollerBlader_Spin2Back
    pedlogic_params = stand_pedlogic_params
    Scale = (1.100000023841858, 1.100000023841858, 1.100000023841858)
}
Ped_Andrew_Caro = {
    creation_params = ped_m_creation_params
    pedlogic_params = stand_pedlogic_params
    ped_head = { desc_id = Ped_Andrew_Caro_Head }
    ped_body = { desc_id = Ped_ButterBody }
    ped_board = { desc_id = ped_board }
}
Ped_HippieF03 = {
    creation_params = ped_m_creation_params
    pedlogic_params = stand_pedlogic_params
    ped_m_head = { desc_id = Ped_HippieF_Head01 }
    ped_m_torso = { desc_id = Ped_HippieF_Torso03 }
    ped_m_legs = { desc_id = Ped_HippieF_Legs02 }
}
Robot = {
    creation_params = ped_m_creation_params
    pedlogic_params = stand_pedlogic_params
    ped_body = { desc_id = Robot }
    ped_board = { desc_id = ped_board }
}
Ped_MexicanGraffiti = {
    creation_params = ped_m_creation_params
    ped_head = { desc_id = Ped_MexicanGraffiti_Head }
    ped_body = { desc_id = Ped_MexicanGraffiti }
    pedlogic_params = tagger_pedlogic_params
    specialitem = spraycan_details
}
Ped_Policemen_02 = {
    creation_params = ped_m_creation_params
    ped_head = { desc_id = Ped_Policemen_HEAD02 }
    ped_body = { desc_id = Ped_Policeman_BODY }
    pedlogic_params = Police_pedlogic_params
    Extra_Anims = animload_THPS7_Polices
}
ped_SkaterSelect_Vato = {
    creation_params = ped_m_creation_params
    pedlogic_params = standNoLookOrAvoid_pedlogic_params
    ped_body = { desc_id = Ped_Vato }
    body_shape = Fatman_scale_info
    ped_board = { desc_id = ped_board }
}
Ped_SignDude = {
    creation_params = ped_m_creation_params
    ped_body = { desc_id = Ped_SignDude }
    ped_m_accessories = { desc_id = Ped_SignDude_Sign }
    pedlogic_params = SignGuy_pedlogic_params
    Extra_Anims = animload_THPS7_SignGuy
}
ped_Skater_03_NoSkaterAnims = {
    creation_params = ped_m_creation_params
    pedlogic_params = stand_pedlogic_params
    ped_m_head = { desc_id = Ped_GenericSkater_Head03 }
    ped_m_torso = { desc_id = Ped_GenericSkater_Torso04 }
    ped_m_legs = { desc_id = Ped_GenericSkater_Pants01 }
    ped_m_accessories = { desc_id = Ped_GenericSkater_Hair02 }
    ped_board = { desc_id = ped_board }
}
Ped_BillyJoe = {
    creation_params = ped_m_creation_params
    pedlogic_params = stand_pedlogic_params
    ped_body = { desc_id = Ped_BillyJoe }
    ped_board = { desc_id = ped_board }
}
Cut_Cop = {
    creation_params = ped_m_creation_params
    ped_head = { desc_id = CUT_Cop_head }
    ped_body = { desc_id = Cut_Cop_Body }
}
Ped_Policemen_03 = {
    creation_params = ped_m_creation_params
    ped_head = { desc_id = Ped_Policemen_HEAD03 }
    ped_body = { desc_id = Ped_Policeman_BODY }
    ped_m_accessories = { desc_id = Ped_Policemen_Glasses02 }
    pedlogic_params = Police_pedlogic_params
    Extra_Anims = animload_THPS7_Police
}
Ped_Welder = {
    creation_params = ped_m_creation_params
    ped_body = { desc_id = Ped_Welder }
    defaultanimname = Ped_M_Talk2_RoundAndRound
}

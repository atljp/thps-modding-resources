max_wheel_speed = 16.0
resetcameratoviewerobject = 1
UsePlayerPosForViewerObjPos = 1
ApplyViewerObjModelToPlayer = 0
DefaultViewerObjPos = (0.0, 0.0, 0.0)
viewerautorepeattime = 30
viewerautorepeatspeed = 0

script create_pro_model_set 
    make_select_view_model_line text = 'CAS Appearance' profile = appearance_custom_skater_male animLoadScript = animload_THPS7_Human SkeletonName = thps7_human animEventTableName = SkaterAnimEventTable defaultanim = Ped_M_Idle1 buildscript = create_model_from_appearance
    make_select_view_model_line text = 'Pro_Hawk' profile = mv_Cut_Hawk animLoadScript = animload_THPS7_Human SkeletonName = thps7_human defaultanim = Ped_M_Idle1 SkeletonName = thps7_human
    make_select_view_model_line text = 'Ped_Hawk' profile = mv_pro_Hawk_THUG3 animLoadScript = animload_THPS7_Human SkeletonName = thps7_human defaultanim = Ped_M_Idle1 SkeletonName = thps7_human
    make_select_view_model_line text = 'Pro_Alva' profile = mv_Pro_Alva animLoadScript = animload_THPS7_Human SkeletonName = thps7_human defaultanim = Ped_M_Idle1 SkeletonName = thps7_human
    make_select_view_model_line text = 'Pro_Burnquist' profile = mv_Pro_Burnquist animLoadScript = animload_THPS7_Human SkeletonName = thps7_human defaultanim = Ped_M_Idle1
    make_select_view_model_line text = 'Pro_Daewon' profile = mv_Pro_Daewon animLoadScript = animload_THPS7_Human SkeletonName = thps7_human defaultanim = Ped_M_Idle1
    make_select_view_model_line text = 'Pro_Ellis' profile = mv_Pro_Ellis animLoadScript = animload_THPS7_Human SkeletonName = thps7_human defaultanim = Ped_M_Idle1
    make_select_view_model_line text = 'Pro_Hoffman' profile = mv_Pro_Hoffman animLoadScript = animload_THPS7_Human SkeletonName = thps7_human defaultanim = Ped_M_Idle1
    make_select_view_model_line text = 'Pro_Margera' profile = mv_Pro_Margera animLoadScript = animload_THPS7_Human SkeletonName = thps7_human defaultanim = Ped_M_Idle1
    make_select_view_model_line text = 'Pro_Mullen' profile = mv_Pro_Mullen animLoadScript = animload_THPS7_Human SkeletonName = thps7_human defaultanim = Ped_M_Idle1
    make_select_view_model_line text = 'Pro_Reynolds' profile = mv_Pro_Reynolds animLoadScript = animload_THPS7_Human SkeletonName = thps7_human defaultanim = Ped_M_Idle1 SkeletonName = thps7_human
    make_select_view_model_line text = 'Pro_Rodriguez' profile = mv_Pro_Rodriguez animLoadScript = animload_THPS7_Human SkeletonName = thps7_human defaultanim = Ped_M_Idle1 SkeletonName = thps7_human
    make_select_view_model_line text = 'Pro_Sheckler' profile = mv_Pro_Sheckler animLoadScript = animload_THPS7_Human SkeletonName = thps7_human defaultanim = Ped_M_Idle1 SkeletonName = thps7_human
    make_select_view_model_line text = 'Pro_Thorne' profile = mv_Pro_Rick_Thorne animLoadScript = animload_THPS7_Human SkeletonName = thps7_human defaultanim = Ped_M_Idle1 SkeletonName = thps7_human
    make_select_view_model_line text = 'Pro_Trujillo' profile = mv_Pro_Trujillo animLoadScript = animload_THPS7_Human SkeletonName = thps7_human defaultanim = Ped_M_Idle1 SkeletonName = thps7_human
    make_select_view_model_line text = 'Pro_Williams' profile = mv_Pro_Williams animLoadScript = animload_THPS7_Human SkeletonName = thps7_human defaultanim = Ped_M_Idle1 SkeletonName = thps7_human
    make_select_view_model_line text = 'Pro_Vallely' profile = mv_Pro_Vallely animLoadScript = animload_THPS7_Human SkeletonName = thps7_human defaultanim = Ped_M_Idle1 SkeletonName = thps7_human
    make_select_view_model_line text = 'HawkOldSchool' profile = mv_pro_HawkOldSchool animLoadScript = animload_THPS7_Human SkeletonName = thps7_human defaultanim = Ped_M_Idle1 SkeletonName = thps7_human
    make_select_view_model_line text = 'Pro_70s_Alva' profile = mv_Pro_Alva2 animLoadScript = animload_THPS7_Human SkeletonName = thps7_human defaultanim = Ped_M_Idle1 SkeletonName = thps7_human
    make_select_view_model_line text = 'BillyJoe' profile = mv_Ped_BillyJoe animLoadScript = animload_THPS7_Human SkeletonName = thps7_human defaultanim = Ped_M_Idle1 SkeletonName = thps7_human
    make_select_view_model_line text = 'LilJohn' profile = mv_Ped_LilJohn animLoadScript = animload_THPS7_Human SkeletonName = thps7_human defaultanim = Ped_M_Idle1 SkeletonName = thps7_human
    make_select_view_model_line text = 'Clover' profile = mv_Ped_Clover animLoadScript = animload_THPS7_Human SkeletonName = thps7_human defaultanim = Ped_M_Idle1 SkeletonName = thps7_human
    make_select_view_model_line text = 'But_Andrew_Caro' profile = mv_Ped_Andrew_Caro animLoadScript = animload_THPS7_Human SkeletonName = thps7_human defaultanim = Ped_M_Idle1 SkeletonName = thps7_human
    make_select_view_model_line text = 'But_Andy_Bakken' profile = mv_Ped_Andy_Bakken animLoadScript = animload_THPS7_Human SkeletonName = thps7_human defaultanim = Ped_M_Idle1 SkeletonName = thps7_human
    make_select_view_model_line text = 'But_James_Foster' profile = mv_Ped_James_Foster animLoadScript = animload_THPS7_Human SkeletonName = thps7_human defaultanim = Ped_M_Idle1 SkeletonName = thps7_human
    make_select_view_model_line text = 'Robot' profile = mv_robot animLoadScript = animload_THPS7_Human SkeletonName = thps7_human defaultanim = Ped_M_Idle1 SkeletonName = thps7_human
    make_select_view_model_line text = 'Jimbo' profile = mv_jimbo animLoadScript = animload_THPS7_Human SkeletonName = thps7_human defaultanim = Ped_M_Idle1 SkeletonName = thps7_human
endscript

script create_ped_model_set 
    make_select_view_model_line text = 'Dave' profile = mv_Cut_Dave animLoadScript = animload_THPS7_Human SkeletonName = thps7_human defaultanim = Ped_M_Idle1 SkeletonName = thps7_human
    make_select_view_model_line text = 'Ped_Dave' profile = mv_Ped_Dave animLoadScript = animload_THPS7_Human SkeletonName = thps7_human defaultanim = Ped_M_Idle1 SkeletonName = thps7_human
    make_select_view_model_line text = 'Boone' profile = mv_Cut_Boone animLoadScript = animload_THPS7_Human SkeletonName = thps7_human defaultanim = Ped_M_Idle1 SkeletonName = thps7_human
    make_select_view_model_line text = 'Ped_Boone' profile = mv_Ped_Boone animLoadScript = animload_THPS7_Human SkeletonName = thps7_human defaultanim = Ped_M_Idle1
    make_select_view_model_line text = 'Ped_Boone_Underwear' profile = mv_Ped_Boone_Underwear animLoadScript = animload_THPS7_Human SkeletonName = thps7_human defaultanim = Ped_M_Idle1
    make_select_view_model_line text = 'Mega' profile = mv_Cut_Mega animLoadScript = animload_THPS7_Human SkeletonName = thps7_human defaultanim = Ped_M_Idle1 SkeletonName = thps7_human
    make_select_view_model_line text = 'Ped_Mega' profile = mv_Ped_Mega animLoadScript = animload_THPS7_Human SkeletonName = thps7_human defaultanim = Ped_M_Idle1 SkeletonName = thps7_human
    make_select_view_model_line text = 'Murphy' profile = mv_Cut_Murphy animLoadScript = animload_THPS7_Human SkeletonName = thps7_human defaultanim = Ped_M_Idle1 SkeletonName = thps7_human
    make_select_view_model_line text = 'Ped_Murphy' profile = mv_Ped_Murphy animLoadScript = animload_THPS7_Human SkeletonName = thps7_human defaultanim = Ped_M_Idle1 SkeletonName = thps7_human
    make_select_view_model_line text = 'Iggy' profile = mv_CUT_Iggy animLoadScript = animload_THPS7_Human SkeletonName = thps7_human defaultanim = Ped_M_Idle1 SkeletonName = thps7_human
    make_select_view_model_line text = 'Ped_Iggy' profile = mv_Ped_Iggy animLoadScript = animload_THPS7_Human SkeletonName = thps7_human defaultanim = Ped_M_Idle1 SkeletonName = thps7_human
    make_select_view_model_line text = 'Kelly' profile = mv_Cut_Kelly animLoadScript = animload_THPS7_Human SkeletonName = thps7_human defaultanim = Ped_M_Idle1 SkeletonName = thps7_human
    make_select_view_model_line text = 'Ped_Mindy' profile = mv_Ped_Mindy animLoadScript = animload_THPS7_Human SkeletonName = thps7_human defaultanim = Ped_M_Idle1 SkeletonName = thps7_human
    make_select_view_model_line text = 'Ped_AccGuy' profile = mv_Ped_AccGuy animLoadScript = animload_THPS7_Human SkeletonName = thps7_human defaultanim = Ped_M_Idle1 SkeletonName = thps7_human
    make_select_view_model_line text = 'Ped_Barber' profile = mv_Ped_Barber animLoadScript = animload_THPS7_Human SkeletonName = thps7_human defaultanim = Ped_M_Idle1 SkeletonName = thps7_human
    make_select_view_model_line text = 'Ped_Baller' profile = mv_Ped_Baller animLoadScript = animload_THPS7_Human SkeletonName = thps7_human defaultanim = Ped_M_Idle1 SkeletonName = thps7_human
    make_select_view_model_line text = 'Ped_BikeMesng' profile = mv_Ped_BikeMessenger animLoadScript = animload_THPS7_Human SkeletonName = thps7_human defaultanim = Ped_M_Idle1 SkeletonName = thps7_human
    make_select_view_model_line text = 'Ped_Bodygrd01' profile = mv_Ped_Bodyguard01 animLoadScript = animload_THPS7_Human SkeletonName = thps7_human defaultanim = Ped_M_Idle1 SkeletonName = thps7_human
    make_select_view_model_line text = 'Ped_Bodygrd02' profile = mv_Ped_Bodyguard02 animLoadScript = animload_THPS7_Human SkeletonName = thps7_human defaultanim = Ped_M_Idle1 SkeletonName = thps7_human
    make_select_view_model_line text = 'Ped_BumBag' profile = mv_Ped_BumBag animLoadScript = animload_THPS7_Human SkeletonName = thps7_human defaultanim = Ped_M_Idle1 SkeletonName = thps7_human
    make_select_view_model_line text = 'Ped_Bum01' profile = mv_Ped_Bum01 animLoadScript = animload_THPS7_Human SkeletonName = thps7_human defaultanim = Ped_M_Idle1 SkeletonName = thps7_human
    make_select_view_model_line text = 'Ped_Bum02' profile = mv_Ped_Bum02 animLoadScript = animload_THPS7_Human SkeletonName = thps7_human defaultanim = Ped_M_Idle1 SkeletonName = thps7_human
    make_select_view_model_line text = 'Ped_Bum03' profile = mv_Ped_Bum03 animLoadScript = animload_THPS7_Human SkeletonName = thps7_human defaultanim = Ped_M_Idle1 SkeletonName = thps7_human
    make_select_view_model_line text = 'Ped_Businman01' profile = mv_Ped_Businessman01 animLoadScript = animload_THPS7_Human SkeletonName = thps7_human defaultanim = Ped_M_Idle1 SkeletonName = thps7_human
    make_select_view_model_line text = 'Ped_Businman02' profile = mv_Ped_Businessman02 animLoadScript = animload_THPS7_Human SkeletonName = thps7_human defaultanim = Ped_M_Idle1 SkeletonName = thps7_human
    make_select_view_model_line text = 'Ped_Businman03' profile = mv_Ped_Businessman03 animLoadScript = animload_THPS7_Human SkeletonName = thps7_human defaultanim = Ped_M_Idle1 SkeletonName = thps7_human
    make_select_view_model_line text = 'Ped_Businwoman01' profile = mv_Ped_BusinessWoman01 animLoadScript = animload_THPS7_Human SkeletonName = thps7_human defaultanim = Ped_M_Idle1 SkeletonName = thps7_human
    make_select_view_model_line text = 'Ped_Businwoman02' profile = mv_Ped_BusinessWoman02 animLoadScript = animload_THPS7_Human SkeletonName = thps7_human defaultanim = Ped_M_Idle1 SkeletonName = thps7_human
    make_select_view_model_line text = 'Ped_Carny' profile = mv_Ped_Carny animLoadScript = animload_THPS7_Human SkeletonName = thps7_human defaultanim = Ped_M_Idle1 SkeletonName = thps7_human
    make_select_view_model_line text = 'Ped_CelebMale01' profile = mv_Ped_CelebMale01 animLoadScript = animload_THPS7_Human SkeletonName = thps7_human defaultanim = Ped_M_Idle1 SkeletonName = thps7_human
    make_select_view_model_line text = 'Ped_ChineseMan' profile = mv_Ped_ChineseMan animLoadScript = animload_THPS7_Human SkeletonName = thps7_human defaultanim = Ped_M_Idle1 SkeletonName = thps7_human
    make_select_view_model_line text = 'Ped_Cholo' profile = mv_Ped_Cholo animLoadScript = animload_THPS7_Human SkeletonName = thps7_human defaultanim = Ped_M_Idle1 SkeletonName = thps7_human
    make_select_view_model_line text = 'Ped_Construction' profile = mv_Ped_Construction animLoadScript = animload_THPS7_Human SkeletonName = thps7_human defaultanim = Ped_M_Idle1 SkeletonName = thps7_human
    make_select_view_model_line text = 'Ped_DogTownGuy2' profile = mv_Ped_DogTownGuy2 animLoadScript = animload_THPS7_Human SkeletonName = thps7_human defaultanim = Ped_M_Idle1
    make_select_view_model_line text = 'Ped_DogTownGuy' profile = mv_Ped_DogTownGuy animLoadScript = animload_THPS7_Human SkeletonName = thps7_human defaultanim = Ped_M_Idle1
    make_select_view_model_line text = 'Ped_DVGuy' profile = mv_Global_Ped_DVguy animLoadScript = animload_THPS7_Human SkeletonName = thps7_human defaultanim = Ped_M_Idle1 SkeletonName = thps7_human
    make_select_view_model_line text = 'Ped_FatCostrction' profile = mv_Ped_FatConstruction animLoadScript = animload_THPS7_Human SkeletonName = thps7_human defaultanim = Ped_M_Idle1 SkeletonName = thps7_human
    make_select_view_model_line text = 'Ped_FallingDown' profile = mv_Ped_FallingDown animLoadScript = animload_THPS7_Human SkeletonName = thps7_human defaultanim = Ped_M_Idle1 SkeletonName = thps7_human
    make_select_view_model_line text = 'Ped_FrenchGuy' profile = mv_Ped_FrenchGuy animLoadScript = animload_THPS7_Human SkeletonName = thps7_human defaultanim = Ped_M_Idle1 SkeletonName = thps7_human
    make_select_view_model_line text = 'Ped_GraffitiMexn' profile = mv_Ped_MexicanGraffiti animLoadScript = animload_THPS7_Human SkeletonName = thps7_human defaultanim = Ped_M_Idle1 SkeletonName = thps7_human
    make_select_view_model_line text = 'Ped_HippieF_F01' profile = mv_Ped_HippieF_FullBody01 animLoadScript = animload_THPS7_Human SkeletonName = thps7_human defaultanim = Ped_M_Idle1
    make_select_view_model_line text = 'Ped_HippieF_F02' profile = mv_Ped_HippieF_FullBody02 animLoadScript = animload_THPS7_Human SkeletonName = thps7_human defaultanim = Ped_M_Idle1
    make_select_view_model_line text = 'Ped_Holly' profile = mv_Ped_Holly animLoadScript = animload_THPS7_Human SkeletonName = thps7_human defaultanim = Ped_M_Idle1 SkeletonName = thps7_human
    make_select_view_model_line text = 'Ped_Homeless' profile = mv_Ped_Homeless animLoadScript = animload_THPS7_Human SkeletonName = thps7_human defaultanim = Ped_M_Idle1 SkeletonName = thps7_human
    make_select_view_model_line text = 'Ped_KidSkater' profile = mv_Ped_KidSkater animLoadScript = animload_THPS7_Human SkeletonName = thps7_human defaultanim = Ped_M_Idle1
    make_select_view_model_line text = 'Ped_KidSkaterEL' profile = mv_Ped_KidSkaterEastLA animLoadScript = animload_THPS7_Human SkeletonName = thps7_human defaultanim = Ped_M_Idle1
    make_select_view_model_line text = 'Ped_Latina' profile = mv_Ped_Latina animLoadScript = animload_THPS7_Human SkeletonName = thps7_human defaultanim = Ped_M_Idle1 SkeletonName = thps7_human
    make_select_view_model_line text = 'Ped_OldLady_Fbody' profile = mv_Ped_OldLady_Fullbody animLoadScript = animload_THPS7_Human SkeletonName = thps7_human defaultanim = Ped_M_Idle1
    make_select_view_model_line text = 'Ped_OilRigWorker' profile = mv_Ped_OilRigWorker animLoadScript = animload_THPS7_Human SkeletonName = thps7_human defaultanim = Ped_M_Idle1
    make_select_view_model_line text = 'Ped_PerformerSilvr' profile = mv_Ped_PerformerSilver animLoadScript = animload_THPS7_Human SkeletonName = thps7_human defaultanim = Ped_M_Idle1
    make_select_view_model_line text = 'Ped_photoguy' profile = mv_Ped_photoguy animLoadScript = animload_THPS7_Human SkeletonName = thps7_human defaultanim = Ped_M_Idle1 SkeletonName = thps7_human
    make_select_view_model_line text = 'Ped_Policemen_01' profile = mv_Ped_Policemen_01 animLoadScript = animload_THPS7_Human SkeletonName = thps7_human defaultanim = Ped_M_Idle1
    make_select_view_model_line text = 'Ped_Policemen_02' profile = mv_Ped_Policemen_02 animLoadScript = animload_THPS7_Human SkeletonName = thps7_human defaultanim = Ped_M_Idle1
    make_select_view_model_line text = 'Ped_Policemen_03' profile = mv_Ped_Policemen_03 animLoadScript = animload_THPS7_Human SkeletonName = thps7_human defaultanim = Ped_M_Idle1
    make_select_view_model_line text = 'Ped_Policemen_04' profile = mv_Ped_Policemen_04 animLoadScript = animload_THPS7_Human SkeletonName = thps7_human defaultanim = Ped_M_Idle1
    make_select_view_model_line text = 'Ped_ShopOwner' profile = mv_Ped_ShopOwner animLoadScript = animload_THPS7_Human SkeletonName = thps7_human defaultanim = Ped_M_Idle1
    make_select_view_model_line text = 'Ped_Skater02' profile = mv_ped_Skater_02 animLoadScript = animload_THPS7_Human SkeletonName = thps7_human defaultanim = Ped_M_Idle1 SkeletonName = thps7_human
    make_select_view_model_line text = 'Ped_Skater03' profile = mv_ped_Skater_03 animLoadScript = animload_THPS7_Human SkeletonName = thps7_human defaultanim = Ped_M_Idle1 SkeletonName = thps7_human
    make_select_view_model_line text = 'Ped_Skater04' profile = mv_ped_Skater_04 animLoadScript = animload_THPS7_Human SkeletonName = thps7_human defaultanim = Ped_M_Idle1 SkeletonName = thps7_human
    make_select_view_model_line text = 'Ped_SkateClub' profile = mv_Ped_SkateClub animLoadScript = animload_THPS7_Human SkeletonName = thps7_human defaultanim = Ped_M_Idle1 SkeletonName = thps7_human
    make_select_view_model_line text = 'Ped_StreetPunk' profile = mv_Ped_StreetPunk animLoadScript = animload_THPS7_Human SkeletonName = thps7_human defaultanim = Ped_M_Idle1 SkeletonName = thps7_human
    make_select_view_model_line text = 'Ped_SurPlus' profile = mv_Ped_SurPlus animLoadScript = animload_THPS7_Human SkeletonName = thps7_human defaultanim = Ped_M_Idle1 SkeletonName = thps7_human
    make_select_view_model_line text = 'Ped_Surfer' profile = mv_Ped_Surfer animLoadScript = animload_THPS7_Human SkeletonName = thps7_human defaultanim = Ped_M_Idle1 SkeletonName = thps7_human
    make_select_view_model_line text = 'Ped_Vato' profile = mv_Ped_Vato animLoadScript = animload_THPS7_Human SkeletonName = thps7_human defaultanim = Ped_M_Idle1 SkeletonName = thps7_human
    make_select_view_model_line text = 'Ped_Welder' profile = mv_Ped_Welder animLoadScript = animload_THPS7_Human SkeletonName = thps7_human defaultanim = Ped_M_Idle1 SkeletonName = thps7_human
endscript

script create_cutscene_heads_model_set 
    make_select_view_model_line text = 'CUT Mindy Head' modelname = 'Cutscenes\CUT_Mindy_head.skin' animLoadScript = animload_Cut_Mindy_Head SkeletonName = Cut_Mindy_Head skeletonfilename = 'skeletons\CUT_Mindy_HEAD.ske'
    make_select_view_model_line text = 'CUT Iggy Head' modelname = 'Cutscenes\CUT_Iggy_head.skin' animLoadScript = animload_CUT_Iggy_Head SkeletonName = CUT_Iggy_Head skeletonfilename = 'skeletons\CUT_Iggy_HEAD.ske'
    make_select_view_model_line text = 'CUT Kelly Head' modelname = 'Cutscenes\CUT_Kelly_head.skin' animLoadScript = animload_CUT_Kelly_head SkeletonName = CUT_Kelly_head skeletonfilename = 'skeletons\CUT_Kelly_HEAD.ske'
    make_select_view_model_line text = 'CUT CAS Male Head' modelname = 'Cutscenes\CUT_CAS_M_head.skin' animLoadScript = animload_CUT_CAS_M_head SkeletonName = CUT_CAS_M_head skeletonfilename = 'skeletons\CUT_CAS_M_head.ske'
    make_select_view_model_line text = 'Cut FatConstruction HEAD' modelname = 'Cutscenes\Cut_FatConstruction_HEAD.skin' animLoadScript = animload_CUT_FatConstruction_HEAD SkeletonName = CUT_FatConstruction_HEAD skeletonfilename = 'skeletons\CUT_FatConstruction_HEAD.ske'
    make_select_view_model_line text = 'CUT Dave Head' modelname = 'Cutscenes\CUT_Dave_head.skin' animLoadScript = animload_CUT_Dave_head SkeletonName = CUT_Dave_head skeletonfilename = 'skeletons\CUT_Dave_head.ske'
    make_select_view_model_line text = 'CUT Murphy Head' modelname = 'Cutscenes\CUT_Murphy_head.skin' animLoadScript = animload_CUT_Murphy_head SkeletonName = CUT_Murphy_head skeletonfilename = 'skeletons\CUT_Murphy_head.ske'
    make_select_view_model_line text = 'CUT Boone Head' modelname = 'Cutscenes\CUT_Boone_head.skin' animLoadScript = animload_CUT_Boone_head SkeletonName = CUT_Boone_head skeletonfilename = 'skeletons\CUT_Boone_head.ske'
    make_select_view_model_line text = 'CUT Cop Head' modelname = 'Cutscenes\CUT_Cop_head.skin' animLoadScript = animload_CUT_Cop_head SkeletonName = CUT_Cop_head skeletonfilename = 'skeletons\CUT_Cop_head.ske'
    make_select_view_model_line text = 'Cut Mega Head' modelname = 'Cutscenes\CUT_Mega_head.skin' animLoadScript = animload_CUT_Mega_head SkeletonName = CUT_Mega_head skeletonfilename = 'skeletons\CUT_Mega_head.ske'
    make_select_view_model_line text = 'CUT Land Owner Head' modelname = 'Cutscenes\CUT_LandOwner_head.skin' animLoadScript = animload_CUT_LandOwner_head SkeletonName = CUT_LandOwner_head skeletonfilename = 'skeletons\CUT_LandOwner_head.ske'
    make_select_view_model_line text = 'CUT Protester Head' modelname = 'Cutscenes\CUT_Protester_HEAD.skin' animLoadScript = animload_Cut_Protester_HEAD SkeletonName = Cut_Protester_HEAD skeletonfilename = 'skeletons\CUT_Protester_HEAD.ske'
    make_select_view_model_line text = 'CUT Little Girl Head' modelname = 'Cutscenes\CUT_Maya_HEAD.skin' animLoadScript = animload_CUT_Maya_Head SkeletonName = CUT_Maya_Head skeletonfilename = 'skeletons\CUT_Maya_HEAD.ske'
    make_select_view_model_line text = 'CUT Hawk HEAD' modelname = 'Cutscenes\Cut_Hawk_HEAD.skin' animLoadScript = animload_Cut_Hawk_HEAD SkeletonName = Cut_Hawk_HEAD skeletonfilename = 'skeletons\CUT_Hawk_HEAD.ske'
    make_select_view_model_line text = 'CUT Alva HEAD' modelname = 'Cutscenes\Cut_Alva_HEAD.skin' animLoadScript = animload_Cut_Alva_HEAD SkeletonName = Cut_Alva_HEAD skeletonfilename = 'skeletons\CUT_Alva_HEAD.ske'
    make_select_view_model_line text = 'IGC Iggy_head' modelname = 'peds\igc\IGC_iggy_head.skin' animLoadScript = animload_IGC_Iggy_Head SkeletonName = IGC_Iggy_Head skeletonfilename = 'skeletons\IGC_iggy_head.ske'
    make_select_view_model_line text = 'IGC RandomSkater_HEAD' modelname = 'peds\igc\IGC_RandomSkater_HEAD.skin' animLoadScript = animload_IGC_RandomSkater_HEAD SkeletonName = IGC_RandomSkater_HEAD skeletonfilename = 'skeletons\IGC_RandomSkater_HEAD.ske'
    make_select_view_model_line text = 'IGC ChineseMan HEAD' modelname = 'peds\igc\IGC_ChineseMan_HEAD.skin' animLoadScript = animload_IGC_ChineseMan_HEAD SkeletonName = IGC_ChineseMan_HEAD skeletonfilename = 'skeletons\IGC_ChineseMan_HEAD.ske'
    make_select_view_model_line text = 'IGC FallingDown Head' modelname = 'Peds\IGC\Igc_FallingDown_HEAD.skin' animLoadScript = animload_igc_fallingdown_head SkeletonName = igc_fallingdown_head skeletonfilename = 'skeletons\IGC_FallingDown_HEAD.ske'
    make_select_view_model_line text = 'IGC Graffiti Head' modelname = 'Peds\IGC\Igc_Graffiti_HEAD.skin' animLoadScript = animload_IGC_Graffiti_HEAD SkeletonName = IGC_Graffiti_HEAD skeletonfilename = 'skeletons\IGC_Graffiti_HEAD.ske'
    make_select_view_model_line text = 'IGC Mindy Head' modelname = 'Peds\IGC\IGC_Mindy_Head.skin' animLoadScript = animload_THPS7_IGC_Face SkeletonName = THPS7_IGC_Face skeletonfilename = 'skeletons\IGC_Mindy_HEAD.ske'
    make_select_view_model_line text = 'IGC CAS Head' modelname = 'Peds\IGC\IGC_CAS_M.skin' animLoadScript = animload_IGC_CAS_M SkeletonName = igc_cas_m skeletonfilename = 'skeletons\IGC_CAS_M.ske'
    make_select_view_model_line text = 'IGC Dave Head' modelname = 'Peds\IGC\IGC_Dave_Head.skin' animLoadScript = animload_IGC_Dave_Head SkeletonName = IGC_Dave_Head skeletonfilename = 'skeletons\IGC_Dave_Head.ske'
    make_select_view_model_line text = 'IGC Murphy Head' modelname = 'Peds\IGC\IGC_Murphy_Head.skin' animLoadScript = animload_IGC_Murphy_Head SkeletonName = IGC_Murphy_Head skeletonfilename = 'skeletons\IGC_Murphy_Head.ske'
    make_select_view_model_line text = 'IGC Boone Head' modelname = 'Peds\IGC\IGC_Boone_Head.skin' animLoadScript = animload_IGC_Boone_head SkeletonName = IGC_Boone_head skeletonfilename = 'skeletons\IGC_Boone_Head.ske'
    make_select_view_model_line text = 'IGC DVGuy Head' modelname = 'Peds\IGC\IGC_DVGuy_Head.skin' animLoadScript = animload_IGC_DVGuy_Head SkeletonName = IGC_DVGuy_Head skeletonfilename = 'skeletons\IGC_DVGuy_Head.ske'
    make_select_view_model_line text = 'IGC Rick Thorne head' modelname = 'Peds\IGC\IGC_Rick_Thorne_head.skin' animLoadScript = animload_IGC_Rick_Thorne_head SkeletonName = IGC_Rick_Thorne_head skeletonfilename = 'skeletons\IGC_Rick_Thorne_head.ske'
    make_select_view_model_line text = 'IGC Mega head' modelname = 'Peds\IGC\IGC_Mega_head.skin' animLoadScript = animload_IGC_Mega_head SkeletonName = IGC_Mega_head skeletonfilename = 'skeletons\IGC_Mega_head.ske'
    make_select_view_model_line text = 'IGC Vallely head' modelname = 'Peds\IGC\IGC_Vallely_head.skin' animLoadScript = animload_IGC_Vallely_HEAD SkeletonName = IGC_Vallely_HEAD skeletonfilename = 'skeletons\IGC_Vallely_head.ske'
    make_select_view_model_line text = 'IGC FrenchGuy head' modelname = 'Peds\IGC\IGC_FrenchGuy_Head.skin' animLoadScript = animload_IGC_FrenchGuy_Head SkeletonName = IGC_FrenchGuy_Head skeletonfilename = 'skeletons\IGC_FrenchGuy_Head.ske'
    make_select_view_model_line text = 'IGC Reynolds Head' modelname = 'Peds\IGC\IGC_Reynolds_Head.skin' animLoadScript = animload_IGC_Reynolds_Head SkeletonName = IGC_Reynolds_Head skeletonfilename = 'skeletons\IGC_Reynolds_Head.ske'
    make_select_view_model_line text = 'IGC Trujillo Head' modelname = 'Peds\IGC\IGC_Trujillo_Head.skin' animLoadScript = animload_IGC_Trujillo_Head SkeletonName = IGC_Trujillo_Head skeletonfilename = 'skeletons\IGC_Trujillo_Head.ske'
    make_select_view_model_line text = 'IGC Williams Had' modelname = 'Peds\IGC\IGC_Williams_Head.skin' animLoadScript = animload_IGC_Williams_Head SkeletonName = IGC_Williams_Head skeletonfilename = 'skeletons\IGC_Williams_Head.ske'
    make_select_view_model_line text = 'IGC Burnquist Head' modelname = 'Peds\IGC\IGC_Burnquist_Head.skin' animLoadScript = animload_IGC_Burnquist_Head SkeletonName = IGC_Burnquist_Head skeletonfilename = 'skeletons\IGC_Burnquist_Head.ske'
    make_select_view_model_line text = 'IGC Sheckler Head' modelname = 'Peds\IGC\IGC_Sheckler_Head.skin' animLoadScript = animload_IGC_Sheckler_Head SkeletonName = IGC_Sheckler_Head skeletonfilename = 'skeletons\IGC_Sheckler_Head.ske'
    make_select_view_model_line text = 'IGC Rodriguez head' modelname = 'Peds\IGC\IGC_Rodriguez_head.skin' animLoadScript = animload_IGC_Rodriguez_head SkeletonName = IGC_Rodriguez_head skeletonfilename = 'skeletons\IGC_Rodriguez_head.ske'
    make_select_view_model_line text = 'IGC Vato head' modelname = 'Peds\IGC\IGC_Vato_head.skin' animLoadScript = animload_IGC_Vato_head SkeletonName = IGC_Vato_head skeletonfilename = 'skeletons\IGC_Vato_head.ske'
    make_select_view_model_line text = 'IGC FatConstruction head' modelname = 'Peds\IGC\IGC_FatConstruction_head.skin' animLoadScript = animload_IGC_FatConstruction_HEAD SkeletonName = IGC_FatConstruction_HEAD skeletonfilename = 'skeletons\IGC_FatConstruction_head.ske'
    make_select_view_model_line text = 'IGC_Genericskater01_Head' modelname = 'Peds\IGC\IGC_Genericskater01_Head.skin' animLoadScript = animload_IGC_Genericskater01_Head SkeletonName = IGC_Genericskater01_Head skeletonfilename = 'skeletons\IGC_Genericskater01_Head.ske'
    make_select_view_model_line text = 'IGC_Genericskater02_Head' modelname = 'Peds\IGC\IGC_Genericskater02_Head.skin' animLoadScript = animload_IGC_Genericskater02_Head SkeletonName = IGC_Genericskater02_Head skeletonfilename = 'skeletons\IGC_Genericskater02_Head.ske'
    make_select_view_model_line text = 'IGC_Genericskater03_Head' modelname = 'Peds\IGC\IGC_Genericskater03_Head.skin' animLoadScript = animload_IGC_Genericskater03_Head SkeletonName = IGC_Genericskater03_Head skeletonfilename = 'skeletons\IGC_Genericskater03_Head.ske'
    make_select_view_model_line text = 'IGC_Cholo_Head' modelname = 'Peds\IGC\IGC_Cholo_Head.skin' animLoadScript = animload_IGC_Cholo_Head SkeletonName = IGC_Cholo_Head skeletonfilename = 'skeletons\IGC_Cholo_Head.ske'
    make_select_view_model_line text = 'IGC_Hawk_Head' modelname = 'Peds\IGC\IGC_Hawk_Head.skin' animLoadScript = animload_IGC_Hawk_Head SkeletonName = IGC_Hawk_Head skeletonfilename = 'skeletons\IGC_Hawk_Head.ske'
    make_select_view_model_line text = 'IGC_Alva_Head' modelname = 'Peds\IGC\IGC_Alva_Head.skin' animLoadScript = animload_Igc_Alva_HEAD SkeletonName = Igc_Alva_HEAD skeletonfilename = 'skeletons\IGC_Alva_Head.ske'
    make_select_view_model_line text = 'IGC_DogTownGuy2_HEAD' modelname = 'Peds\IGC\IGC_DogTownGuy2_HEAD.skin' animLoadScript = animload_IGC_DogTownGuy2_HEAD SkeletonName = IGC_DogTownGuy2_HEAD skeletonfilename = 'skeletons\IGC_DogTownGuy2_HEAD.ske'
    make_select_view_model_line text = 'IGC_Daewon_HEAD' modelname = 'Peds\IGC\IGC_Daewon_HEAD.skin' animLoadScript = animload_IGC_Daewon_HEAD SkeletonName = IGC_Daewon_HEAD skeletonfilename = 'skeletons\IGC_Daewon_HEAD.ske'
    make_select_view_model_line text = 'IGC_DogTownGuy1_HEAD' modelname = 'Peds\IGC\IGC_DogTownGuy1_HEAD.skin' animLoadScript = animload_IGC_DogTownGuy1_HEAD SkeletonName = IGC_DogTownGuy1_HEAD skeletonfilename = 'skeletons\IGC_DogTownGuy1_HEAD.ske'
    make_select_view_model_line text = 'IGC_Margera_HEAD' modelname = 'Peds\IGC\IGC_Margera_HEAD.skin' animLoadScript = animload_IGC_Margera_HEAD SkeletonName = IGC_Margera_HEAD skeletonfilename = 'skeletons\IGC_Margera_HEAD.ske'
    make_select_view_model_line text = 'IGC_Mullen_HEAD' modelname = 'Peds\IGC\IGC_Mullen_HEAD.skin' animLoadScript = animload_IGC_Mullen_HEAD SkeletonName = IGC_Mullen_HEAD skeletonfilename = 'skeletons\IGC_Mullen_HEAD.ske'
    make_select_view_model_line text = 'IGC_SkateClub_HEAD' modelname = 'Peds\IGC\IGC_SkateClub_HEAD.skin' animLoadScript = animload_IGC_SkateClub_Head SkeletonName = IGC_SkateClub_Head skeletonfilename = 'skeletons\IGC_SkateClub_HEAD.ske'
    make_select_view_model_line text = 'IGC_YoungSkater_Head01' modelname = 'Peds\IGC\IGC_YoungSkater_Head01.skin' animLoadScript = animload_IGC_YoungSkater_Head01 SkeletonName = IGC_YoungSkater_Head01 skeletonfilename = 'skeletons\IGC_YoungSkater_Head01.ske'
    make_select_view_model_line text = 'IGC_Hoffman_Head' modelname = 'Peds\IGC\IGC_Hoffman_Head.skin' animLoadScript = animload_IGC_Hoffman_Head SkeletonName = IGC_Hoffman_Head skeletonfilename = 'skeletons\IGC_Hoffman_Head.ske'
    make_select_view_model_line text = 'IGC_BodyGuard_Head' modelname = 'Peds\IGC\IGC_BodyGuard_Head.skin' animLoadScript = animload_IGC_BodyGuard_HEAD SkeletonName = IGC_BodyGuard_HEAD skeletonfilename = 'skeletons\IGC_BodyGuard_Head.ske'
    make_select_view_model_line text = 'IGC_Carny_Head' modelname = 'Peds\IGC\IGC_Carny_Head.skin' animLoadScript = animload_IGC_Carny_head SkeletonName = IGC_Carny_head skeletonfilename = 'skeletons\IGC_Carny_Head.ske'
    make_select_view_model_line text = 'IGC_OilRigWorker_Head' modelname = 'Peds\IGC\IGC_OilRigWorker_Head.skin' animLoadScript = animload_IGC_OilRigWorker_head SkeletonName = IGC_OilRigWorker_head skeletonfilename = 'skeletons\IGC_OilRigWorker_Head.ske'
    make_select_view_model_line text = 'IGC_Bum_Head' modelname = 'Peds\IGC\IGC_Bum_Head.skin' animLoadScript = animload_IGC_Bum_head SkeletonName = IGC_Bum_head skeletonfilename = 'skeletons\IGC_Bum_Head.ske'
    make_select_view_model_line text = 'Debug Skater Head' profile = mv_debug_skater_head animLoadScript = animload_IGC_CAS_M SkeletonName = igc_cas_m skeletonfilename = 'skeletons\IGC_CAS_M.ske'
    make_select_view_model_line text = 'Debug IGC Head' profile = mv_debug_igc_head animLoadScript = animload_IGC_CAS_M SkeletonName = igc_cas_m skeletonfilename = 'skeletons\IGC_CAS_M.ske'
endscript

script create_animal_model_set 
    make_select_view_model_line text = 'Dog ' modelname = 'Animals\Anl_PitBull2\Anl_PitBull2.skin' animLoadScript = animload_anl_dog SkeletonName = Anl_dog defaultanim = walk SkeletonName = Anl_dog skeletonfilename = 'skeletons\anl_dog.ske'
    make_select_view_model_line text = 'PuppyDog ' modelname = 'Animals\Anl_PitBull\Anl_PitBull.skin' animLoadScript = animload_anl_Doggie SkeletonName = anl_wolf defaultanim = Dog_Stand_BarkDouble SkeletonName = anl_wolf skeletonfilename = 'skeletons\anl_wolf.ske'
endscript

script create_car_model_set 
    make_select_view_model_line text = 'Ped_BMX' profile = mv_Ped_BMX animLoadScript = animload_SI_BMX_0 SkeletonName = si_bmx
    make_select_view_model_line text = 'Veh_Test' modelname = 'veh\veh_test\veh_test.mdl' SkeletonName = car
    make_select_view_model_line text = 'Skate Letter A' modelname = 'gameobjects\skate\letter_a\letter_a.mdl' texDictOffset = 1
    make_select_view_model_line text = 'Arrow' modelname = 'arrow\arrow.mdl' texDictOffset = 1
    make_select_view_model_line text = 'Special Arrow' modelname = 'special_arrow\special_arrow.mdl' texDictOffset = 1
endscript

script create_full_model_set 
    add_roundbar_menu_item rot = 0 text = 'View Pros' id = menu_view_pro_models pad_choose_script = launch_view_models_menu pad_choose_params = { model_set = pro }
    add_roundbar_menu_item rot = 0 text = 'View Peds' id = menu_view_ped_models pad_choose_script = launch_view_models_menu pad_choose_params = { model_set = ped }
    add_roundbar_menu_item rot = 0 text = 'View Cutscene Heads' id = menu_view_cutscene_heads pad_choose_script = launch_view_models_menu pad_choose_params = { model_set = cutscene_heads }
    add_roundbar_menu_item rot = 0 text = 'View Animals' id = menu_view_animal_models pad_choose_script = launch_view_models_menu pad_choose_params = { model_set = Animal }
    add_roundbar_menu_item rot = 0 text = 'View Cars' id = menu_view_car_models pad_choose_script = launch_view_models_menu pad_choose_params = { model_set = car }
endscript

script add_view_models_to_menu 
    if NOT GotParam \{ model_set }
        create_full_model_set
        return 
    endif
    switch <model_set>
        case human
        create_human_model_set
        case cutscene_heads
        create_cutscene_heads_model_set
        case Animal
        create_animal_model_set
        case car
        create_car_model_set
        case ped
        create_ped_model_set
        case pro
        create_pro_model_set
        default 
        create_full_model_set
    endswitch
endscript

script draw_viewer_object_panel 
    viewer_obj_get_panel_info
    if ObjectExists id = vo_line1
        SetScreenElementProps {id = vo_line1 text = <line1>}
        SetScreenElementProps {id = vo_line2 text = <line2>}
        SetScreenElementProps {id = vo_line3 text = <line3>}
        SetScreenElementProps {id = vo_line4 text = <line4>}
    else
        create_panel_message id = vo_line1 text = <line1> style = panel_message_viewobj_line params = { xy = (40.0, 380.0) }
        create_panel_message id = vo_line2 text = <line2> style = panel_message_viewobj_line params = { xy = (40.0, 400.0) }
        create_panel_message id = vo_line3 text = <line3> style = panel_message_viewobj_line params = { xy = (40.0, 420.0) }
        create_panel_message id = vo_line4 text = <line4> style = panel_message_viewobj_line params = { xy = (40.0, 440.0) }
    endif
endscript

script kill_viewer_object_panel 
    if ObjectExists \{ id = vo_line1 }
        RunScriptOnScreenElement \{ id = vo_line1 kill_panel_message }
    endif
    if ObjectExists \{ id = vo_line2 }
        RunScriptOnScreenElement \{ id = vo_line2 kill_panel_message }
    endif
    if ObjectExists \{ id = vo_line3 }
        RunScriptOnScreenElement \{ id = vo_line3 kill_panel_message }
    endif
    if ObjectExists \{ id = vo_line4 }
        RunScriptOnScreenElement \{ id = vo_line4 kill_panel_message }
    endif
endscript

script panel_message_viewobj_line 
    setprops \{just = [ left center ] rgba = [ 10 128 10 115 ]}
    DoMorph Pos = <xy> alpha = 1 Scale = 1.0
endscript

script viewerobj_add_components 
    if GotParam SkeletonName
        if NOT GotParam animEventTableName
            GetAnimEventTableName animType = <SkeletonName>
        endif
        if NOT (<SkeletonName> = car)
            createcomponentfromstructure {
                Component = AnimTree
                animEventTableName = <animEventTableName>
                <...> 
                defaultcommandtarget = ModelViewerNode
            }
        endif
    endif
    if GotParam SkeletonName
        createcomponentfromstructure {
            Component = skeleton
            <...> 
            skeleton = <SkeletonName>
            max_bone_skip_lod = 0
        }
    endif
    createcomponentfromstructure Component = Model <...> 
    createcomponentfromstructure Component = skatersound
    createcomponentfromstructure Component = skaterloopingsound
endscript

script viewerobj_init_model \{ buildscript = create_model_from_appearance_modelviewer }
    if GotParam \{ profile }
        obj_initmodelfromprofile {
            texDictOffset = 8
            struct = <profile>
            buildscript = <buildscript>
        }
    else
        if GotParam \{ modelname }
            obj_initmodel use_asset_manager = 1 <...> 
        else
            if GotParam \{ Model }
                obj_initmodel use_asset_manager = 1 <...> 
            else
                script_assert \{ 'no model name!' }
            endif
        endif
    endif
    obj_getid
    RunScriptOnObject id = <ObjID> set_viewerobj_anim_handlers
endscript

script launch_view_models_menu 
    RunScriptOnScreenElement id = current_menu_anchor animate_out callback = create_view_models_menu callback_params = { <...>  }
endscript

script make_select_view_model_line \{ buildscript = create_model_from_appearance_modelviewer }
    add_roundbar_menu_item {
        text = <text>
        pad_choose_script = view_model
        pad_choose_params = { <...>  }
    }
endscript

script simple_focus 
    gettags
    SetScreenElementProps id = <id> rgba = [ 128 128 128 128 ]
endscript

script simple_unfocus 
    gettags
    SetScreenElementProps id = <id> rgba = [ 70 70 70 128 ]
endscript

script create_view_models_menu 
    if ScreenElementExists id = view_models_menu
        DestroyScreenElement id = view_models_menu
    endif
    make_new_roundbar_menu {
        menu_id = view_models_menu
        vmenu_id = view_models_vmenu
        menu_title = 'MODELS'
        scrolling
        dims = (175.0, 200.0) Pos = (40.0, 50.0)
        no_helper_text
    }
    SetAnalogStickActiveForMenus 0
    SetPositionalSoundSilenceOverrideMode 1
    SetScreenElementProps {
        id = view_models_vmenu
        event_handlers = [
            {pad_back exit_view_models_menu params = { model_set = <model_set> }}
        ]
    }
    add_view_models_to_menu <...> 
    RunScriptOnScreenElement id = current_menu_anchor animate_in
endscript

script view_models_menu_cleanup 
    SetAnalogStickActiveForMenus \{ 1 }
    SetPositionalSoundSilenceOverrideMode \{ 0 }
    if ScreenElementExists \{ id = view_models_menu }
        DestroyScreenElement \{ id = view_models_menu }
    endif
    SetScreenElementProps \{id = root_window tags = { menu_state = Off }}
endscript

script exit_view_models_menu 
    if GotParam \{ model_set }
        view_models_menu_cleanup
        create_view_models_menu
    else
        toggle_model_viewer
    endif
endscript
last_profile_viewed = { profile = no_profile buildscript = create_model_from_appearance }
last_profile_valid = false

script view_model 
    printf 'View Model here'
    if gotextramemory
        MemPushContext DebugHeap
    endif
    if GotParam animLoadScript
        <animLoadScript>
    endif
    if GotParam extraAnim
        <extraAnim>
    endif
    if gotextramemory
        MemPopContext
    endif
    if (IsTrue UsePlayerPosForViewerObjPos)
        skater ::obj_getposition
        <viewerobjpos> = <Pos>
        skater ::hide
    else
        <viewerobjpos> = <DefaultViewerObjPos>
    endif
    if GotParam use_last_model_viewed
        if (last_profile_valid = false)
            GetPlayerAppearance player = 0
            buildscript = create_model_from_appearance
        else
            profile = (last_profile_viewed.profile)
            buildscript = (last_profile_viewed.buildscript)
        endif
    endif
    if GotParam body_shape
        SetViewerModel <...> profile = {<profile> body_shape = <body_shape>}Scale = (<body_shape>.Scale)
    else
        SetViewerModel <...> 
    endif
    if GotParam profile
        change last_profile_valid = true
        change last_profile_viewed = {profile = <profile> buildscript = <buildscript>}
    endif
    if GotParam defaultanim
        SetViewerAnim <defaultanim>
    endif
    if IsTrue ApplyViewerObjModelToPlayer
        set_player_to_model no_exit
    endif
endscript

script set_player_to_model 
    printf 'Setting player to model'
    if (last_profile_valid = true)
        GetCurrentSkaterProfileIndex
        SetPlayerAppearance player = <currentSkaterProfileIndex> appearance_structure = (last_profile_viewed.profile)
        EditPlayerAppearance profile = <currentSkaterProfileIndex> target = setpart targetParams = {part = board desc_id = default}
        RefreshSkaterModel profile = <currentSkaterProfileIndex> texDictOffset = 9 skater = 0 buildscript = (last_profile_viewed.buildscript)
    else
        printf 'Can\'t apply explicit models, only profiles'
    endif
    if NOT GotParam no_exit
        toggle_model_viewer
    endif
endscript

script UnHideSkaterAndDestroyFakes 
    KillSpawnedScript \{ name = _TestAnimSequence }
    if CompositeObjectExists \{ name = FakeSkater }
        FakeSkater ::Die
    endif
    if CompositeObjectExists \{ name = skater }
        skater ::unhide
    endif
endscript

script CreateFake 
    if NOT CompositeObjectExists name = <Original>
        return 
    endif
    if CompositeObjectExists name = <Fake>
        <Fake> ::Die
    endif
    <Original> ::obj_getposition
    <Original> ::Obj_GetQuat
    CreateCompositeObject {
        Components = [
            {
                Component = Suspend
            }
            {
                Component = AnimTree
            }
            {
                Component = skeleton
            }
            {
                Component = SetDisplayMatrix
            }
            {
                Component = ModelLightUpdate
            }
            {
                Component = Model
                CloneFrom = <Original>
                usemodellights
            }
            {
                Component = shadow
            }
        ]
        params = {
            SkeletonName = <skeleton>
            name = <Fake>
            Pos = <Pos>
            Orientation = <Quat>
        }
    }
    <Fake> ::ModelViewer_InitAnimTree
endscript

script TestAnim \{ skeleton = thps7_human }
    if GotParam \{ Off }
        UnHideSkaterAndDestroyFakes
    else
        ReloadAndTestAnim <...> skeleton = <skeleton>
    endif
endscript

script ReloadAndTestAnim 
    AllowAssetLoading on
    KillSpawnedScript name = _TestAnimSequence
    LaunchEvent type = DrawRequested Data = { cycledown }
    FormatText checksumname = ReferenceChecksum '%s' s = <skeleton> DontAssertForChecksums
    FormatText checksumname = AnimName '%s' s = <anim> DontAssertForChecksums
    if GotParam DifferenceAnim
        if (<DifferenceAnim> = '')
        else
            FormatText checksumname = DifferenceAnimName '%s' s = <DifferenceAnim>
        endif
    endif
    UpdateAnimCache Clear
    if GotParam DifferenceAnimName
        ReloadAnim filename = <DifferenceAnimFileName> anim = <DifferenceAnimName> ReferenceChecksum = <ReferenceChecksum>
    endif
    if GotParam filename
        ReloadAnim filename = <filename> anim = <AnimName> ReferenceChecksum = <ReferenceChecksum>
    endif
    skater ::hide
    CreateFake Original = skater Fake = FakeSkater skeleton = thps7_human
    if GotParam Cycle
        FakeSkater ::ModelViewer_PlayAnim anim = <AnimName> BlendPeriod = 0 Speed = <Speed> Cycle
    else
        FakeSkater ::ModelViewer_PlayAnim anim = <AnimName> BlendPeriod = 0 Speed = <Speed>
    endif
    if GotParam DifferenceAnim
        FakeSkater ::Obj_PoseControllerCommand command = PlaySequence DifferenceAnimName = <DifferenceAnimName> differenceAnimAmount = <differenceAnimAmount>
    endif
    FakeSkater ::Obj_ForceUpdate
    AllowAssetLoading Off
endscript

script UpdateHeroDifferenceAnim 
    if (<DifferenceAnim> = '')
    else
        FormatText checksumname = DifferenceAnimName '%s' s = <DifferenceAnim>
        if CompositeObjectExists \{ name = FakeHero }
            FakeHero ::UpdateDifferenceAnim DifferenceAnimName = <DifferenceAnimName> differenceAnimAmount = <differenceAnimAmount>
        endif
    endif
endscript

script _TestAnimSequence 
    if GotParam Animations
        CreateFake Original = skater Fake = FakeSkater skeleton = thps7_human
        skater ::hide
        begin 
        GetArraySize <Animations>
        <index> = 0
        begin 
        FormatText checksumname = AnimName '%s' s = (<Animations> [ <index> ].anim)DontAssertForChecksums
        FakeSkater ::ModelViewer_PlayAnim {
            anim = <AnimName>
            Speed = (<Animations> [ <index> ].Speed)
            BlendPeriod = (<Animations> [ <index> ].BlendPeriod)
        }
        if (<index> = 0)
            FakeSkater ::Obj_ForceUpdate
        endif
        FakeSkater ::ModelViewer_WaitAnimFinished
        <index> = (<index> + 1)
        repeat <array_size>
        if NOT GotParam Cycle
            break 
        endif
        repeat 
        wait 1 second
        SpawnScriptLater UnHideSkaterAndDestroyFakes
    endif
endscript

script TestAnimSequence 
    KillSpawnedScript \{ name = _TestAnimSequence }
    SpawnScriptLater _TestAnimSequence params = <...> 
endscript

script toggle_model_viewer 
    GetPlatform
    switch <platform>
        case xbox
        platform_ext = '.xbx'
        case pc
        platform_ext = '.wpc'
        case xenon
        platform_ext = '.xen'
        case ngc
        platform_ext = '.ngc'
        case ps2
        platform_ext = '.ps2'
        default 
        platform_ext = ''
    endswitch
    if NOT ScreenElementExists id = view_models_menu
        AllowAssetLoading on
        LoadQB ('scripts\game\menu\models_peds.qb' + <platform_ext>)heap = DebugHeap
        view_model {
            use_last_model_viewed
            SkeletonName = thps7_human
            animEventTableName = SkaterAnimEventTable
            defaultanim = Ped_M_Idle1
        }
        create_view_models_menu
    else
        UnpauseSkaters 0
        change view_mode = 0
        ToggleViewMode
        ToggleViewMode
        ToggleViewMode
        skater ::unhide
        view_models_menu_cleanup
        UnloadQB ('scripts\game\menu\models_peds.qb' + <platform_ext>)
        AllowAssetLoading Off
    endif
endscript

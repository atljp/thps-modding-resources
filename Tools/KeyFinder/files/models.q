
max_wheel_speed = 16.0
resetcameratoviewerobject = 1
UsePlayerPosForViewerObjPos = 1
ApplyViewerObjModelToPlayer = 1
DefaultViewerObjPos = (0.0, 0.0, 0.0)
viewerautorepeattime = 30
viewerautorepeatspeed = 0

script create_human_model_set 
    make_select_view_model_line text = 'THPS6 Skater' skater_profile_index = 0 animLoadScript = animload_THPS6_human SkeletonName = THPS6_human animEventTableName = SkaterAnimEventTable
    make_select_view_model_line text = 'Aborigine' profile = Ped_aborigine animLoadScript = animload_THPS6_human SkeletonName = THPS6_human defaultanim = Ped_M_Idle1 SkeletonName = THPS6_human
    make_select_view_model_line text = 'Alien' profile = Ped_Alien animLoadScript = animload_THPS6_human SkeletonName = THPS6_human defaultanim = Ped_M_Idle1 SkeletonName = THPS6_human
    make_select_view_model_line text = 'Alien 02' profile = Ped_Alien02 animLoadScript = animload_THPS6_human SkeletonName = THPS6_human defaultanim = Ped_M_Idle1 SkeletonName = THPS6_human
    make_select_view_model_line text = 'Alien 03' profile = Ped_Alien03 animLoadScript = animload_THPS6_human SkeletonName = THPS6_human defaultanim = Ped_M_Idle1 SkeletonName = THPS6_human
    make_select_view_model_line text = 'Alien Doctor' profile = Ped_AlienDoctor animLoadScript = animload_THPS6_human SkeletonName = THPS6_human defaultanim = Ped_M_Idle1 SkeletonName = THPS6_human
    make_select_view_model_line text = 'Alien Leader' profile = Ped_AlienLeader animLoadScript = animload_THPS6_human SkeletonName = THPS6_human defaultanim = Ped_M_Idle1 SkeletonName = THPS6_human
    make_select_view_model_line text = 'Attendant' profile = Ped_Attendant animLoadScript = animload_THPS6_human SkeletonName = THPS6_human defaultanim = Ped_M_Idle1 SkeletonName = THPS6_human
    make_select_view_model_line text = 'Benjamin Franklin' profile = Ped_benfranklin animLoadScript = animload_THPS6_human SkeletonName = THPS6_human defaultanim = Ped_M_Idle1 SkeletonName = THPS6_human
    make_select_view_model_line text = 'Bigfoot_graf' profile = Ped_Bigfoot_graf animLoadScript = animload_THPS6_human SkeletonName = THPS6_human defaultanim = Ped_M_Idle1 SkeletonName = THPS6_human
    make_select_view_model_line text = 'Bigfoot' profile = Ped_Bigfoot animLoadScript = animload_THPS6_human SkeletonName = THPS6_human defaultanim = Ped_M_Idle1 SkeletonName = THPS6_human
    make_select_view_model_line text = 'Boat Captain' profile = Ped_boatcaptain animLoadScript = animload_THPS6_human SkeletonName = THPS6_human defaultanim = Ped_M_Idle1 SkeletonName = THPS6_human
    make_select_view_model_line text = 'BostonGuy' profile = Ped_BostonGuy animLoadScript = animload_THPS6_human SkeletonName = THPS6_human defaultanim = Ped_M_Idle1 SkeletonName = THPS6_human
    make_select_view_model_line text = 'Boxer' profile = Ped_Boxer animLoadScript = animload_THPS6_human SkeletonName = THPS6_human defaultanim = Ped_M_Idle1 SkeletonName = THPS6_human
    make_select_view_model_line text = 'Bratwurst Vendor' profile = Ped_bratwurst animLoadScript = animload_THPS6_human SkeletonName = THPS6_human defaultanim = Ped_M_Idle1 SkeletonName = THPS6_human
    make_select_view_model_line text = 'Bull Fighter' profile = Ped_bullfighter animLoadScript = animload_THPS6_human SkeletonName = THPS6_human defaultanim = Ped_M_Idle1 SkeletonName = THPS6_human
    make_select_view_model_line text = 'Camera Man' profile = Ped_cameraman animLoadScript = animload_THPS6_human SkeletonName = THPS6_human defaultanim = Ped_M_Idle1 SkeletonName = THPS6_human
    make_select_view_model_line text = 'Cop Aussie' profile = Ped_CopAussie animLoadScript = animload_THPS6_human SkeletonName = THPS6_human defaultanim = Ped_M_Idle1 SkeletonName = THPS6_human
    make_select_view_model_line text = 'Construction Worker' profile = ped_construction_worker_01 animLoadScript = animload_THPS6_human SkeletonName = THPS6_human defaultanim = Ped_M_Idle1 SkeletonName = THPS6_human
    make_select_view_model_line text = 'Corn Vendor' profile = Ped_Corn_Vendor_01 animLoadScript = animload_THPS6_human SkeletonName = THPS6_human defaultanim = Ped_M_Idle1 SkeletonName = THPS6_human
    make_select_view_model_line text = 'CutChemist' profile = ped_cutchemist animLoadScript = animload_THPS6_human SkeletonName = THPS6_human defaultanim = Ped_M_Idle1 SkeletonName = THPS6_human
    make_select_view_model_line text = 'Flute Guy' profile = Ped_FluteGuy animLoadScript = animload_THPS6_human SkeletonName = THPS6_human defaultanim = Ped_M_Idle1 SkeletonName = THPS6_human
    make_select_view_model_line text = 'Dalek' profile = ped_dalek animLoadScript = animload_THPS6_human SkeletonName = THPS6_human defaultanim = Ped_M_Idle1 SkeletonName = THPS6_human
    make_select_view_model_line text = 'Dalek Pink' profile = Ped_dalekPink animLoadScript = animload_THPS6_human SkeletonName = THPS6_human defaultanim = Ped_M_Idle1 SkeletonName = THPS6_human
    make_select_view_model_line text = 'Dalek Blue' profile = Ped_dalekBlue animLoadScript = animload_THPS6_human SkeletonName = THPS6_human defaultanim = Ped_M_Idle1 SkeletonName = THPS6_human
    make_select_view_model_line text = 'German Cop' profile = ped_germancop animLoadScript = animload_THPS6_human SkeletonName = THPS6_human defaultanim = Ped_M_Idle1 SkeletonName = THPS6_human
    make_select_view_model_line text = 'German Drunk 01' profile = ped_germandrunk animLoadScript = animload_THPS6_human SkeletonName = THPS6_human defaultanim = Ped_M_Idle1 SkeletonName = THPS6_human
    make_select_view_model_line text = 'German Drunk 02' profile = ped_germandrunk01 animLoadScript = animload_THPS6_human SkeletonName = THPS6_human defaultanim = Ped_M_Idle1 SkeletonName = THPS6_human
    make_select_view_model_line text = 'German Drunk 03' profile = ped_germandrunk02 animLoadScript = animload_THPS6_human SkeletonName = THPS6_human defaultanim = Ped_M_Idle1 SkeletonName = THPS6_human
    make_select_view_model_line text = 'German Drunk Full' profile = Ped_germandrunkfull animLoadScript = animload_THPS6_human SkeletonName = THPS6_human defaultanim = Ped_M_Idle1 SkeletonName = THPS6_human
    make_select_view_model_line text = 'Graffiti Punk 01' profile = ped_grafiti_punker_01 animLoadScript = animload_THPS6_human SkeletonName = THPS6_human defaultanim = Ped_M_Idle1 SkeletonName = THPS6_human
    make_select_view_model_line text = 'Graffiti Punk 02' profile = ped_graffiti02 animLoadScript = animload_THPS6_human SkeletonName = THPS6_human defaultanim = Ped_M_Idle1 SkeletonName = THPS6_human
    make_select_view_model_line text = 'Graffiti Punk 03' profile = ped_graffiti03 animLoadScript = animload_THPS6_human SkeletonName = THPS6_human defaultanim = Ped_M_Idle1 SkeletonName = THPS6_human
    make_select_view_model_line text = 'Guitarist' profile = ped_guitarist animLoadScript = animload_THPS6_human SkeletonName = THPS6_human defaultanim = Ped_M_Idle1 SkeletonName = THPS6_human
    make_select_view_model_line text = 'Guitarist Banjo' profile = Ped_guitaristbanjo animLoadScript = animload_THPS6_human SkeletonName = THPS6_human defaultanim = Ped_M_Idle1 SkeletonName = THPS6_human
    make_select_view_model_line text = 'Imp' profile = Ped_Imp animLoadScript = animload_THPS6_human SkeletonName = THPS6_human defaultanim = Ped_M_Idle1 SkeletonName = THPS6_human
    make_select_view_model_line text = 'Jazzman 01' profile = Ped_jazzman1 animLoadScript = animload_THPS6_human SkeletonName = THPS6_human defaultanim = Ped_M_Idle1 SkeletonName = THPS6_human
    make_select_view_model_line text = 'Jester' profile = Ped_Jester animLoadScript = animload_THPS6_human SkeletonName = THPS6_human defaultanim = Ped_M_Idle1 SkeletonName = THPS6_human
    make_select_view_model_line text = 'Jesse James' profile = Ped_jessejames animLoadScript = animload_THPS6_human SkeletonName = THPS6_human defaultanim = Ped_M_Idle1 SkeletonName = THPS6_human
    make_select_view_model_line text = 'Judge' modelname = 'peds\ped_judge\ped_judge.skin' animLoadScript = animload_THPS6_human SkeletonName = THPS6_human defaultanim = Ped_M_Idle1 SkeletonName = THPS6_human
    make_select_view_model_line text = 'LifeGuard' profile = ped_Lifeguard animLoadScript = animload_THPS6_human SkeletonName = THPS6_human defaultanim = Ped_M_Idle1 SkeletonName = THPS6_human
    make_select_view_model_line text = 'Johnny Turbo' profile = Ped_JohnnyTurbo animLoadScript = animload_THPS6_human SkeletonName = THPS6_human defaultanim = Ped_M_Idle1 SkeletonName = THPS6_human
    make_select_view_model_line text = 'Lounge Singer' profile = Ped_Loungesinger animLoadScript = animload_THPS6_human SkeletonName = THPS6_human defaultanim = Ped_M_Idle1 SkeletonName = THPS6_human
    make_select_view_model_line text = 'Lost Soul 01' profile = Ped_LostSoul01 animLoadScript = animload_THPS6_human SkeletonName = THPS6_human defaultanim = Ped_M_Idle1 SkeletonName = THPS6_human
    make_select_view_model_line text = 'Lost Soul 02' profile = Ped_LostSoul02 animLoadScript = animload_THPS6_human SkeletonName = THPS6_human defaultanim = Ped_M_Idle1 SkeletonName = THPS6_human
    make_select_view_model_line text = 'Lost Soul 03' profile = Ped_LostSoul03 animLoadScript = animload_THPS6_human SkeletonName = THPS6_human defaultanim = Ped_M_Idle1 SkeletonName = THPS6_human
    make_select_view_model_line text = 'Mayan' profile = Ped_Mayan animLoadScript = animload_THPS6_human SkeletonName = THPS6_human defaultanim = Ped_M_Idle1 SkeletonName = THPS6_human
    make_select_view_model_line text = 'Metal Detector Guy' profile = ped_metaldetector animLoadScript = animload_THPS6_human SkeletonName = THPS6_human defaultanim = Ped_M_Idle1 SkeletonName = THPS6_human
    make_select_view_model_line text = 'Mime' profile = Ped_Mime animLoadScript = animload_THPS6_human SkeletonName = THPS6_human defaultanim = Ped_M_Idle1 SkeletonName = THPS6_human
    make_select_view_model_line text = 'Natas' profile = Ped_Natas animLoadScript = animload_THPS6_human SkeletonName = THPS6_human defaultanim = Ped_M_Idle1 SkeletonName = THPS6_human
    make_select_view_model_line text = 'Nigel Beaverhausen' profile = Cut_Nigel_Full animLoadScript = animload_THPS6_human SkeletonName = THPS6_human defaultanim = Ped_M_Idle1 SkeletonName = THPS6_human
    make_select_view_model_line text = 'Nigel Beaverhausen Ass' profile = Cut_Nigel_AU6 animLoadScript = animload_THPS6_human SkeletonName = THPS6_human defaultanim = Ped_M_Idle1 SkeletonName = THPS6_human
    make_select_view_model_line text = 'Nigel Costume' profile = Nigel_Costume animLoadScript = animload_THPS6_human SkeletonName = THPS6_human defaultanim = Ped_M_Idle1 SkeletonName = THPS6_human
    make_select_view_model_line text = 'Paramedic' profile = Ped_Paramedic_01 animLoadScript = animload_THPS6_human SkeletonName = THPS6_human defaultanim = Ped_M_Idle1 SkeletonName = THPS6_human
    make_select_view_model_line text = 'Phil_FULL' profile = Phil_Full animLoadScript = animload_THPS6_human SkeletonName = THPS6_human defaultanim = Ped_M_Idle1 SkeletonName = THPS6_human
    make_select_view_model_line text = 'Phil_Gagged' profile = Phil_Gagged animLoadScript = animload_THPS6_human SkeletonName = THPS6_human defaultanim = Ped_M_Idle1 SkeletonName = THPS6_human
    make_select_view_model_line text = 'Pirate' profile = Ped_Pirate animLoadScript = animload_THPS6_human SkeletonName = THPS6_human defaultanim = Ped_M_Idle1 SkeletonName = THPS6_human
    make_select_view_model_line text = 'Paulie' profile = Paulie_Full animLoadScript = animload_THPS6_human SkeletonName = THPS6_human defaultanim = Ped_M_Idle1 SkeletonName = THPS6_human
    make_select_view_model_line text = 'Ramp Kid' profile = Ped_Ramp_Kid_01 animLoadScript = animload_THPS6_human SkeletonName = THPS6_human defaultanim = Ped_M_Idle1 SkeletonName = THPS6_human
    make_select_view_model_line text = 'Revolutionary Soldier' profile = Ped_Soldier_01 animLoadScript = animload_THPS6_human SkeletonName = THPS6_human defaultanim = Ped_M_Idle1 SkeletonName = THPS6_human
    make_select_view_model_line text = 'Rollerblader' profile = Ped_rollerblader animLoadScript = animload_THPS6_human SkeletonName = THPS6_human defaultanim = Ped_M_Idle1 SkeletonName = THPS6_human
    make_select_view_model_line text = 'Security Guard' profile = Ped_security_guard_01 animLoadScript = animload_THPS6_human SkeletonName = THPS6_human defaultanim = Ped_M_Idle1 SkeletonName = THPS6_human
    make_select_view_model_line text = 'Shrimp Vendor' profile = Ped_ShrimpVendor animLoadScript = animload_THPS6_human SkeletonName = THPS6_human defaultanim = Ped_M_Idle1 SkeletonName = THPS6_human
    make_select_view_model_line text = 'Skatopia Guy' profile = Ped_SkatopiaGuy animLoadScript = animload_THPS6_human SkeletonName = THPS6_human defaultanim = Ped_M_Idle1 SkeletonName = THPS6_human
    make_select_view_model_line text = 'Skaboto' profile = Ped_Skaboto animLoadScript = animload_THPS6_human SkeletonName = THPS6_human defaultanim = Ped_M_Idle1 SkeletonName = THPS6_human
    make_select_view_model_line text = 'Nerd Kid' profile = Ped_starwarskid animLoadScript = animload_THPS6_human SkeletonName = THPS6_human defaultanim = Ped_M_Idle1 SkeletonName = THPS6_human
    make_select_view_model_line text = 'Steveo' profile = Ped_Steveo animLoadScript = animload_THPS6_human SkeletonName = THPS6_human defaultanim = Ped_M_Idle1 SkeletonName = THPS6_human
    make_select_view_model_line text = 'Tiki' profile = Ped_TikiMan animLoadScript = animload_THPS6_human SkeletonName = THPS6_human defaultanim = Ped_M_Idle1 SkeletonName = THPS6_human
    make_select_view_model_line text = 'Wiener Man' profile = Ped_Wienerman animLoadScript = animload_THPS6_human SkeletonName = THPS6_human defaultanim = Ped_M_Idle1 SkeletonName = THPS6_human
    make_select_view_model_line text = 'Witch Doctor' profile = Ped_witchdoctor animLoadScript = animload_THPS6_human SkeletonName = THPS6_human defaultanim = Ped_M_Idle1 SkeletonName = THPS6_human
    make_select_view_model_line text = 'Zombie Female 01' profile = Ped_ZombieFem01 animLoadScript = animload_THPS6_human SkeletonName = THPS6_human defaultanim = Ped_M_Idle1 SkeletonName = THPS6_human
    make_select_view_model_line text = 'Female 01' profile = Ped_FemaleFull01 animLoadScript = animload_THPS6_human SkeletonName = THPS6_human defaultanim = Ped_M_Idle1 SkeletonName = THPS6_human
    make_select_view_model_line text = 'Zombie Male 01' profile = Ped_zombiemale01 animLoadScript = animload_THPS6_human SkeletonName = THPS6_human defaultanim = Ped_M_Idle1 SkeletonName = THPS6_human
    make_select_view_model_line text = 'Male 01' profile = Ped_MaleFull01 animLoadScript = animload_THPS6_human SkeletonName = THPS6_human defaultanim = Ped_M_Idle1 SkeletonName = THPS6_human
    make_select_view_model_line text = 'Zombie Male 02' profile = Ped_zombiemale02 animLoadScript = animload_THPS6_human SkeletonName = THPS6_human defaultanim = Ped_M_Idle1 SkeletonName = THPS6_human
    make_select_view_model_line text = 'Male 02' profile = Ped_MaleFull02 animLoadScript = animload_THPS6_human SkeletonName = THPS6_human defaultanim = Ped_M_Idle1 SkeletonName = THPS6_human
    make_select_view_model_line text = 'Nick' profile = Nick_SecretGuy animLoadScript = animload_THPS6_human SkeletonName = THPS6_human defaultanim = Ped_M_Idle1 SkeletonName = THPS6_human
    make_select_view_model_line text = 'Weeman' profile = PedPro_Weeman animLoadScript = animload_THPS6_human SkeletonName = THPS6_human defaultanim = Ped_M_Idle1 SkeletonName = THPS6_human
    make_select_view_model_line text = 'BostonChick' modelname = 'Cutscenes\BostonChick_FULL.skin' animLoadScript = animload_ped_female extraAnim = animload_ped_female defaultanim = Ped_F_Walk SkeletonName = ped_female
    make_select_view_model_line text = 'Nurse' modelname = 'Peds\Ped_Nurse\Ped_Nurse.skin' animLoadScript = animload_ped_female extraAnim = animload_ped_female defaultanim = Ped_F_Idle2 SkeletonName = ped_female
    make_select_view_model_line text = 'Spanish Chick' modelname = 'Cutscenes\SpainChick_FULL.skin' animLoadScript = animload_ped_female extraAnim = animload_ped_female defaultanim = Ped_F_Walk SkeletonName = ped_female
    make_select_view_model_line text = 'Sun Bather' modelname = 'Peds\Ped_Sunbather\Ped_Sunbather.skin' animLoadScript = animload_ped_female extraAnim = animload_ped_female defaultanim = Ped_F_Idle2 SkeletonName = ped_female
    make_select_view_model_line text = 'Shrek' profile = shrek animLoadScript = animload_THPS6_human SkeletonName = THPS6_human defaultanim = Ped_M_Idle1 SkeletonName = THPS6_human
    make_select_view_model_line text = 'Skateboard Character' profile = Ped_Skaterboard_Character animLoadScript = animload_THPS6_human SkeletonName = THPS6_human defaultanim = Ped_M_Idle1 SkeletonName = THPS6_human
    make_select_view_model_line text = 'Skate Goat' profile = Anl_Sk8_Goat animLoadScript = animload_THPS6_human SkeletonName = THPS6_human defaultanim = Ped_M_Idle1 SkeletonName = THPS6_human
    make_select_view_model_line text = 'Skate Head' profile = Ped_head_Sk8 animLoadScript = animload_THPS6_human SkeletonName = THPS6_human defaultanim = Ped_M_Idle1 SkeletonName = THPS6_human
    make_select_view_model_line text = 'Skate Hand' profile = Ped_hand_Sk8 animLoadScript = animload_THPS6_human SkeletonName = THPS6_human defaultanim = Ped_M_Idle1 SkeletonName = THPS6_human
    make_select_view_model_line text = 'Tony Hawk THPS' profile = Ped_Hawk_THPS animLoadScript = animload_THPS6_human SkeletonName = THPS6_human defaultanim = Ped_M_Idle1 SkeletonName = THPS6_human
    make_select_view_model_line text = 'PedPro_Hawk' profile = PedPro_Hawk animLoadScript = animload_THPS6_human SkeletonName = THPS6_human defaultanim = Ped_M_Idle1 SkeletonName = THPS6_human
    make_select_view_model_line text = 'PedPro_Burnquist' profile = PedPro_Burnquist animLoadScript = animload_THPS6_human SkeletonName = THPS6_human defaultanim = Ped_M_Idle1 SkeletonName = THPS6_human
    make_select_view_model_line text = 'PedPro_Koston' profile = PedPro_Koston animLoadScript = animload_THPS6_human SkeletonName = THPS6_human defaultanim = Ped_M_Idle1 SkeletonName = THPS6_human
    make_select_view_model_line text = 'PedPro_Margera' profile = PedPro_Margera animLoadScript = animload_THPS6_human SkeletonName = THPS6_human defaultanim = Ped_M_Idle1 SkeletonName = THPS6_human
    make_select_view_model_line text = 'PedPro_Mullen' profile = PedPro_Mullen animLoadScript = animload_THPS6_human SkeletonName = THPS6_human defaultanim = Ped_M_Idle1 SkeletonName = THPS6_human
    make_select_view_model_line text = 'PedPro_Muska' profile = PedPro_Muska animLoadScript = animload_THPS6_human SkeletonName = THPS6_human defaultanim = Ped_M_Idle1 SkeletonName = THPS6_human
    make_select_view_model_line text = 'PedPro_Vallely' profile = PedPro_Vallely animLoadScript = animload_THPS6_human SkeletonName = THPS6_human defaultanim = Ped_M_Idle1 SkeletonName = THPS6_human
    make_select_view_model_line text = 'PedPro_Sheckler' profile = pedpro_sheckler animLoadScript = animload_THPS6_human SkeletonName = THPS6_human defaultanim = Ped_M_Idle1 SkeletonName = THPS6_human
endscript


script create_cutscene_heads_model_set 
    make_select_view_model_line text = 'CAS Head' modelname = 'Cutscenes\Head_Cas_Male01.skin' animLoadScript = animload_Head_Cas_Male01 SkeletonName = head_cas_male01 skeletonfilename = 'skeletons\head_cas_male01.ske'
    make_select_view_model_line text = 'CAS Female Head' modelname = 'Cutscenes\Head_CAS_Female01.skin' animLoadScript = animload_Head_CAS_Female01 SkeletonName = Head_CAS_Female01 skeletonfilename = 'skeletons\Head_CAS_Female01.ske'
    make_select_view_model_line text = 'AnchorMan_HEAD' modelname = 'Cutscenes\AnchorMan_HEAD.skin' animLoadScript = animload_AnchorMan_HEAD SkeletonName = AnchorMan_HEAD skeletonfilename = 'skeletons\AnchorMan_HEAD.ske'
    make_select_view_model_line text = 'BostonGuy_HEAD' modelname = 'Cutscenes\BostonGuy_HEAD.skin' animLoadScript = animload_BostonGuy_HEAD SkeletonName = BostonGuy_HEAD skeletonfilename = 'skeletons\bostonguy_head.ske'
    make_select_view_model_line text = 'Burnquist_Head' modelname = 'Cutscenes\Burnquist_Head.skin' animLoadScript = animload_Burnquist_Head SkeletonName = Burnquist_Head skeletonfilename = 'skeletons\burnquist_head.ske'
    make_select_view_model_line text = 'Hawk_Head' modelname = 'Cutscenes\Hawk_Head.skin' animLoadScript = animload_Hawk_Head SkeletonName = Hawk_Head skeletonfilename = 'skeletons\hawk_head.ske'
    make_select_view_model_line text = 'Koston_Head' modelname = 'Cutscenes\Koston_Head.skin' animLoadScript = animload_Koston_Head SkeletonName = Koston_Head skeletonfilename = 'skeletons\koston_head.ske'
    make_select_view_model_line text = 'Muska_Head' modelname = 'Cutscenes\Muska_Head.skin' animLoadScript = animload_Muska_Head SkeletonName = Muska_Head skeletonfilename = 'skeletons\muska_head.ske'
    make_select_view_model_line text = 'Margera_Head' modelname = 'Cutscenes\Margera_Head.skin' animLoadScript = animload_Margera_Head SkeletonName = Margera_Head skeletonfilename = 'skeletons\margera_head.ske'
    make_select_view_model_line text = 'Margera_HOODY' modelname = 'Cutscenes\Margera_HOOD_FULL.skin' animLoadScript = animload_THPS6_human SkeletonName = head_cas_male01 SkeletonName = THPS6_human defaultanim = Ped_M_Idle1 SkeletonName = THPS6_human
    make_select_view_model_line text = 'Mullen_Head' modelname = 'Cutscenes\Mullen_Head.skin' animLoadScript = animload_Mullen_Head SkeletonName = Mullen_Head skeletonfilename = 'skeletons\mullen_head.ske'
    make_select_view_model_line text = 'Nigel_Head' modelname = 'Cutscenes\Nigel_Head.skin' animLoadScript = animload_Nigel_Head SkeletonName = Nigel_Head skeletonfilename = 'skeletons\nigel_head.ske'
    make_select_view_model_line text = 'NODrunk1_Head' modelname = 'Cutscenes\Cut_NODrunk1_Head.skin' animLoadScript = animload_NODrunk1_HEAD SkeletonName = NODrunk1_HEAD skeletonfilename = 'skeletons\NODrunk1_Head.ske'
    make_select_view_model_line text = 'NODrunk2_Head' modelname = 'Cutscenes\Cut_NODrunk2_Head.skin' animLoadScript = animload_NODrunk2_HEAD SkeletonName = NODrunk2_HEAD skeletonfilename = 'skeletons\NODrunk2_Head.ske'
    make_select_view_model_line text = 'Phil_Head' modelname = 'Cutscenes\Phil_Head.skin' animLoadScript = animload_Phil_Head SkeletonName = Phil_Head skeletonfilename = 'skeletons\phil_head.ske'
    make_select_view_model_line text = 'Rampkid_Head' modelname = 'Cutscenes\Rampkid_Head.skin' animLoadScript = animload_Rampkid_HEAD SkeletonName = Rampkid_HEAD skeletonfilename = 'skeletons\Rampkid_head.ske'
    make_select_view_model_line text = 'Vallely_Head' modelname = 'Cutscenes\Vallely_Head.skin' animLoadScript = animload_Vallely_Head SkeletonName = Vallely_Head skeletonfilename = 'skeletons\vallely_head.ske'
    make_select_view_model_line text = 'Sparrow_Head' modelname = 'Cutscenes\Sparrow_Head.skin' animLoadScript = animload_Sparrow_Head SkeletonName = Sparrow_Head skeletonfilename = 'skeletons\sparrow_head.ske'
endscript


script create_animal_model_set 
    make_select_view_model_line text = 'Bat' modelname = 'animals\anl_bat\anl_bat.skin' animLoadScript = animload_anl_bat SkeletonName = anl_pigeon
    make_select_view_model_line text = 'Bull' modelname = 'animals\anl_bull\anl_bull.skin' animLoadScript = animload_anl_bull SkeletonName = Anl_Bull
    make_select_view_model_line text = 'Cat' modelname = 'animals\anl_cat\anl_cat.skin' profile = Anl_cat_new animLoadScript = animload_Anl_cat SkeletonName = Anl_Cat
    make_select_view_model_line text = 'Dog ' modelname = 'animals\anl_dog\anl_dog.skin' animLoadScript = animload_anl_dog SkeletonName = Anl_dog
    make_select_view_model_line text = 'Dog grey ' modelname = 'animals\anl_dog\anl_dog.skin' profile = Anl_Dog_grey animLoadScript = animload_anl_dog SkeletonName = Anl_dog
    make_select_view_model_line text = 'Dog black ' modelname = 'animals\anl_dog\anl_dog.skin' profile = Anl_Dog_black animLoadScript = animload_anl_dog SkeletonName = Anl_dog
    make_select_view_model_line text = 'Dog brown ' modelname = 'animals\anl_dog\anl_dog.skin' profile = Anl_Dog_brown animLoadScript = animload_anl_dog SkeletonName = Anl_dog
    make_select_view_model_line text = 'Electric Eel' modelname = 'animals\anl_electriceel\anl_electriceel.skin' animLoadScript = animload_anl_shark SkeletonName = anl_shark
    make_select_view_model_line text = 'Fish' modelname = 'animals\anl_fish\anl_fish.skin' animLoadScript = animload_anl_shark SkeletonName = anl_shark
    make_select_view_model_line text = 'Parrot' modelname = 'animals\anl_parrot\anl_parrot.skin' animLoadScript = animload_anl_pigeon SkeletonName = anl_pigeon
    make_select_view_model_line text = 'White Gorilla' modelname = 'animals\anl_w_gorilla\anl_w_gorilla.skin' animLoadScript = animload_anl_w_gorilla SkeletonName = anl_w_gorilla
    make_select_view_model_line text = 'Pigeon' modelname = 'animals\anl_pigeon\anl_pigeon.skin' animLoadScript = animload_anl_pigeon SkeletonName = anl_pigeon
endscript


script create_car_model_set 
    make_select_view_model_line text = 'Wheel Chair' modelname = 'veh\veh_wheelchair\veh_wheelchair.skin' SkeletonName = THPS6_human
    make_select_view_model_line text = 'Gurney' modelname = 'veh\veh_gurney\veh_gurney.skin' SkeletonName = THPS6_human
    make_select_view_model_line text = 'Skateboard' modelname = 'skater_male/board_default.skin' texDictOffset = 1 SkeletonName = THPS6_human
    make_select_view_model_line text = 'Tricycle' modelname = 'Veh\veh_tricycle\Veh_Tricycle_Skin.skin' SkeletonName = THPS6_human
    make_select_view_model_line text = 'Custom' modelname = 'veh\veh_custom\veh_custom.mdl' SkeletonName = car
    make_select_view_model_line text = 'BA_Tram' modelname = 'veh\ba\veh_ba_tram\veh_ba_tram.mdl' SkeletonName = car
    make_select_view_model_line text = 'Duck Car' modelname = 'veh\veh_duck\veh_duck.mdl' SkeletonName = car
    make_select_view_model_line text = 'HP' modelname = 'veh\veh_half_pipe\veh_half_pipe.mdl' SkeletonName = car
    make_select_view_model_line text = 'Mardi' modelname = 'veh\veh_mardi\veh_mardi.mdl' SkeletonName = car
    make_select_view_model_line text = 'Scooter' modelname = 'veh\veh_scooter\veh_scooter.mdl' SkeletonName = car
    make_select_view_model_line text = 'Smart Car' modelname = 'veh\veh_smart_car\veh_smart_car.mdl' SkeletonName = car
    make_select_view_model_line text = 'Van' modelname = 'veh\veh_van\veh_van.mdl' SkeletonName = car
    make_select_view_model_line text = 'Menu 3d Sign' modelname = 'menu3d\menu3d.mdl'
    make_select_view_model_line text = 'Skate Letter A' modelname = 'gameobjects\skate\letter_a\letter_a.mdl' texDictOffset = 1
    make_select_view_model_line text = 'Arrow' modelname = 'arrow\arrow.mdl' texDictOffset = 1
    make_select_view_model_line text = 'Special Arrow' modelname = 'special_arrow\special_arrow.mdl' texDictOffset = 1
endscript


script create_full_model_set 
    create_human_model_set
    create_cutscene_heads_model_set
    create_animal_model_set
    create_car_model_set
endscript


script add_view_models_to_menu 
    if NOT GotParam model_set
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
        default 
        create_full_model_set
    endswitch
endscript


script add_set_pro_skater_to_menu 
    make_select_set_pro_skater_line text = 'Tony Hawk' name = Hawk
    make_select_set_pro_skater_line text = 'Bob Burnquist' name = Burnquist
    make_select_set_pro_skater_line text = 'Eric Koston' name = Koston
    make_select_set_pro_skater_line text = 'Bam Margera' name = margera
    make_select_set_pro_skater_line text = 'Rodney Mullen' name = Mullen
    make_select_set_pro_skater_line text = 'Chad Muska' name = Muska
    make_select_set_pro_skater_line text = 'Mike Vallely' name = Vallely
    make_select_set_pro_skater_line text = 'Eric Sparrow' name = sparrow
    make_select_set_pro_skater_line text = 'Mystery' name = Hawk
    make_select_set_pro_skater_line text = 'Wee man' name = weeman
    make_select_set_pro_skater_line text = 'Shrek' name = skater_shrek
    make_select_set_pro_skater_line text = 'Tony THPS' name = THPS_hawk
    make_select_set_pro_skater_line text = 'Hand' name = Hand
    make_select_set_pro_skater_line text = 'Doom3' name = doom3
endscript


script draw_viewer_object_panel 
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
    if ObjectExists id = vo_line1
        RunScriptOnScreenElement id = vo_line1 kill_panel_message
    endif
    if ObjectExists id = vo_line2
        RunScriptOnScreenElement id = vo_line2 kill_panel_message
    endif
    if ObjectExists id = vo_line3
        RunScriptOnScreenElement id = vo_line3 kill_panel_message
    endif
    if ObjectExists id = vo_line4
        RunScriptOnScreenElement id = vo_line4 kill_panel_message
    endif
endscript


script panel_message_viewobj_line 
    setprops just = [ left center ] rgba = [ 10 128 10 115 ]
    DoMorph Pos = <xy> alpha = 1 Scale = 1.0
endscript


script viewerobj_add_components 
    
    if GotParam SkeletonName
        if NOT GotParam animEventTableName
            GetAnimEventTableName animType = <SkeletonName>
        endif
        if NOT (<SkeletonName> = car)
            createcomponentfromstructure animEventTableName = <animEventTableName> Component = AnimBlender <...> 
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
    createcomponentfromstructure Component = Model
    createcomponentfromstructure Component = skatersound
    createcomponentfromstructure Component = skaterloopingsound
endscript


script viewerobj_init_model 
    if GotParam profile
        if GotParam skater_profile_index
            obj_initmodelfromprofile {
                texDictOffset = 8
                struct = <profile>
                use_asset_manager = 0
            }
        else
            obj_initmodelfromprofile {
                texDictOffset = 8
                struct = <profile>
                use_asset_manager = 1
            }
        endif
    else
        if GotParam modelname
            obj_initmodel use_asset_manager = 1 <...> 
        else
            if GotParam Model
                obj_initmodel use_asset_manager = 1 <...> 
            else
                script_assert 'no model name!'
            endif
        endif
    endif
    obj_getid
    RunScriptOnObject id = <ObjID> set_viewerobj_anim_handlers
endscript


script launch_view_models_menu 
    RunScriptOnScreenElement id = current_menu_anchor animate_out callback = create_view_models_menu callback_params = { <...>  }
endscript


script make_select_view_model_line {focus_script = simple_focus
        unfocus_script = simple_unfocus
        rgba = [ 100 50 100 200 ]
    }
    CreateScreenElement {
        type = TextElement
        parent = current_menu
        text = <text>
        font = small
        rgba = <rgba>
        event_handlers = [
            {focus <focus_script> params = <focus_params>}
            {unfocus <unfocus_script> params = <unfocus_params>}
            {pad_choose view_model params = <...> }
            {pad_start view_model params = <...> }
        ]
    }
endscript


script simple_focus 
    gettags
    SetScreenElementProps id = <id> rgba = [ 150 150 50 150 ]
endscript


script simple_unfocus 
    gettags
    SetScreenElementProps id = <id> rgba = [ 10 150 100 100 ]
endscript


script create_view_models_menu 
    make_new_menu menu_id = view_models_menu vmenu_id = view_models_vmenu menu_title = 'MODELS' type = vscrollingmenu dims = (320.0, 200.0) Pos = (30.0, 20.0)
    SetAnalogStickActiveForMenus 0
    SetPositionalSoundSilenceOverrideMode 1
    SetScreenElementProps {id = view_models_menu event_handlers = [
            { pad_back exit_view_models_menu }
        ]
    }
    add_view_models_to_menu <...> 
    RunScriptOnScreenElement id = current_menu_anchor animate_in
endscript


script exit_view_models_menu 
    SetAnalogStickActiveForMenus 1
    SetPositionalSoundSilenceOverrideMode 0
    create_test_menu
endscript

last_model_viewed = no_profile

script view_model 
    
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
    if GotParam skater_profile_index
        GetPlayerAppearance player = <skater_profile_index>
    endif
    if GotParam use_last_model_viewed
        <profile> = (last_model_viewed)
    endif
    if GotParam body_shape
        SetViewerModel <...> profile = {<profile> body_shape = <body_shape>}
    else
        SetViewerModel <...> 
    endif
    if GotParam profile
        change last_model_viewed = <profile>
    endif
    if GotParam defaultanim
        SetViewerAnim <defaultanim>
    endif
    if IsTrue ApplyViewerObjModelToPlayer
        if GotParam profile
            GetCurrentSkaterProfileIndex
            SetPlayerAppearance player = <currentSkaterProfileIndex> appearance_structure = <profile>
            EditPlayerAppearance profile = <currentSkaterProfileIndex> target = setpart targetParams = {part = board desc_id = default}
            RefreshSkaterModel profile = <currentSkaterProfileIndex> skater = 0
        else
            
        endif
    endif
endscript


script SkaterScriptForReloadAndTestAnim Speed = 1.0
    FormatText checksumname = ReferenceChecksum '%s' s = <skeleton>
    FormatText checksumname = AnimName '%s' s = <anim>
    UpdateAnimCache Clear
    ReloadAnim filename = <filename> anim = <AnimName> ReferenceChecksum = <ReferenceChecksum>
    setspeed 0
    setrollingfriction 100
    if GotParam Cycle
        PlayAnim anim = <AnimName> BlendPeriod = 0 Cycle Speed = <Speed>
    else
        PlayAnim anim = <AnimName> BlendPeriod = 0 Speed = <Speed>
    endif
    Obj_WaitAnimFinished
    begin 
    wait 1 gameframe
    repeat 
endscript


script ReloadAndTestAnim 
    if NOT skater ::IsInBail
        MakeSkaterGoto SkaterScriptForReloadAndTestAnim params = <...> 
    endif
endscript


script SkaterScriptTestAnimSequence Speed = 1.0
    setspeed 0
    setrollingfriction 100
    if GotParam Animations
        begin 
        GetArraySize <Animations>
        <index> = 0
        begin 
        FormatText checksumname = AnimName '%s' s = (<Animations> [ <index> ].anim)
        PlayAnim anim = <AnimName> Speed = <Speed> BlendPeriod = <BlendPeriod>
        Obj_WaitAnimFinished
        <index> = (<index> + 1)
        repeat <array_size>
        if NOT GotParam Cycle
            break 
        endif
        repeat 
    endif
    begin 
    wait 1 gameframe
    repeat 
endscript


script TestAnimSequence 
    if NOT skater ::IsInBail
        MakeSkaterGoto SkaterScriptTestAnimSequence params = <...> 
    endif
endscript


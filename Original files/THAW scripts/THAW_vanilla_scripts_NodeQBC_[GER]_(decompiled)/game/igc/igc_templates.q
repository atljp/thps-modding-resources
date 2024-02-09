skater_actor = {
    ActorName = skater
    HeadStructure = skater_actor_head
    vo_suffix = 'you'
    direction_params = {
        calm = {
            idle_animations = [
                Ped_M_Idle1
                Ped_M_Talk_Dull
                Ped_M_Talk_ISupposeSo
                Ped_M_Talk2_Idle
                Ped_M_Talk2_Idle2
            ]
            talk_animations = [
                Talk_Gesture_01
                Talk_Gesture_02
                Talk_Gesture_03
                Talk_Gesture_04
                Talk_Gesture_05
                Talk_Gesture_06
                Talk_Gesture_07
                Talk_Gesture_08
                Talk_Gesture_09
                Talk_Gesture_10
            ]
            idle_lookat_params = igc_lookat_defaultanims
            talk_lookat_params = igc_lookat_defaultanims
        }
    }
    management_scripts = skater_actor_management_scripts
}
skater_actor_management_scripts = {
    orient = igc_skater_orient
    rotate = igc_skater_rotate
    play_anim = Skater_PlayLookAtAnim
    wait_anim = Skater_WaitAnimFinished
    change_lookat = igc_changelookat_skater
    head_on = igc_ped_head_on
    head_off = igc_ped_head_off
    setup = igc_skater_setidle
    cleanup = igc_skater_restore
}
skater_actor_head = { Model = 'Peds/IGC/IGC_CAS_M.skin' skeleton = igc_cas_m part_name = 'skater_m_head' pak = 'Pak/IGC/IGC_CAS_M/IGC_CAS_M.pak' }
ped_m_actor = { vo_suffix = 'ped' direction_params = ped_m_direction_params management_scripts = igc_ped_management_scripts }
ped_m_direction_params = {
    calm = {
        idle_animations = [
            Ped_M_Idle1
            Ped_M_Talk_Dull
            Ped_M_Talk_ISupposeSo
            Ped_M_Talk2_Idle
            Ped_M_Talk2_Idle2
        ]
        talk_animations = [
            Talk_Gesture_01
            Talk_Gesture_02
            Talk_Gesture_03
            Talk_Gesture_04
            Talk_Gesture_05
            Talk_Gesture_06
            Talk_Gesture_07
            Talk_Gesture_08
            Talk_Gesture_09
            Talk_Gesture_10
        ]
        idle_lookat_params = igc_lookat_defaultanims
        talk_lookat_params = igc_lookat_defaultanims
    }
}
igc_ped_management_scripts = {
    Create = igc_ped_create
    setup = igc_ped_setidle
    cleanup = igc_ped_setdefault
    play_anim = igc_ped_playlookatanim
    wait_anim = Ped_WaitAnimFinished
    change_lookat = igc_changelookat_generic
    head_on = igc_ped_head_on
    head_off = igc_ped_head_off
}
mindy_actor = {
    HeadStructure = Ped_Mindy_Head
    vo_suffix = 'mindy'
    direction_params = {
        calm = {
            idle_animations = [ Ped_Mindy_Idle01a ]
            talk_animations = [
                Talk_Gesture_01
                Talk_Gesture_02
                Talk_Gesture_03
                Talk_Gesture_04
                Talk_Gesture_05
                Talk_Gesture_06
                Talk_Gesture_07
                Talk_Gesture_08
                Talk_Gesture_09
                Talk_Gesture_10
            ]
            idle_lookat_params = igc_lookat_defaultanims
            talk_lookat_params = igc_lookat_defaultanims
        }
    }
    management_scripts = igc_ped_management_scripts
}
Ped_Mindy_Head = {
    Model = 'Peds/IGC/IGC_Mindy_Head.skin'
    skeleton = IGC_Mindy_Head
    part_name = 'ped_head'
    FormatWithZoneName
    pak = 'Pak/IGC/IGC_Mindy/IGC_Mindy.pak'
}
fallingdown_actor = { HeadStructure = fallingdown_actor_head vo_suffix = 'falling' direction_params = ped_m_direction_params management_scripts = igc_ped_management_scripts }
fallingdown_actor_head = {
    Model = 'Peds/IGC/IGC_Fallingdown_Head.skin'
    skeleton = igc_fallingdown_head
    part_name = 'ped_head'
    FormatWithZoneName
    pak = 'Pak/IGC/IGC_FallingDown/IGC_FallingDown.pak'
}
movie_actor = { HeadStructure = movie_actor_head vo_suffix = 'dvguy' direction_params = ped_m_direction_params management_scripts = igc_ped_management_scripts }
movie_actor_head = {
    Model = 'Peds/IGC/IGC_DVGuy_Head.skin'
    skeleton = IGC_DVGuy_Head
    part_name = 'Ped_Head'
    FormatWithZoneName
    pak = 'Pak/IGC/IGC_DvGuy/IGC_DvGuy.pak'
}
dave_actor = {
    HeadStructure = dave_actor_head
    vo_suffix = 'dave'
    direction_params = {
        calm = {
            idle_animations = [ Ped_M_Idle1 ]
            talk_animations = [
                Talk_Gesture_01
                Talk_Gesture_02
                Talk_Gesture_03
                Talk_Gesture_04
                Talk_Gesture_05
                Talk_Gesture_06
                Talk_Gesture_07
                Talk_Gesture_08
                Talk_Gesture_09
                Talk_Gesture_10
            ]
            idle_lookat_params = igc_lookat_defaultanims
            talk_lookat_params = igc_lookat_defaultanims
        }
    }
    management_scripts = igc_ped_management_scripts
}
dave_actor_head = {
    Model = 'Peds/IGC/IGC_Dave_Head.skin'
    skeleton = IGC_Dave_Head
    part_name = 'ped_head'
    FormatWithZoneName
    pak = 'Pak/IGC/IGC_Dave/IGC_Dave.pak'
}
boone_actor = {
    HeadStructure = boone_actor_head
    vo_suffix = 'boone'
    direction_params = {
        calm = {
            idle_animations = [ Ped_Boone_Idle01 ]
            talk_animations = [
                Talk_Gesture_01
                Talk_Gesture_02
                Talk_Gesture_03
                Talk_Gesture_04
                Talk_Gesture_05
                Talk_Gesture_06
                Talk_Gesture_07
                Talk_Gesture_08
                Talk_Gesture_09
                Talk_Gesture_10
            ]
            idle_lookat_params = igc_lookat_defaultanims
            talk_lookat_params = igc_lookat_defaultanims
        }
    }
    management_scripts = igc_ped_management_scripts
}
boone_actor_head = {
    Model = 'Peds/IGC/IGC_Boone_Head.skin'
    skeleton = IGC_Boone_head
    part_name = 'Ped_Head'
    FormatWithZoneName
    pak = 'Pak/IGC/IGC_Boone/IGC_Boone.pak'
}
iggy_actor = {
    HeadStructure = iggy_actor_head
    vo_suffix = 'iggy'
    direction_params = {
        calm = {
            idle_animations = [ Ped_Iggy_Idle03 ]
            talk_animations = [
                Talk_Gesture_01
                Talk_Gesture_02
                Talk_Gesture_03
                Talk_Gesture_04
                Talk_Gesture_05
                Talk_Gesture_06
                Talk_Gesture_07
                Talk_Gesture_08
                Talk_Gesture_09
                Talk_Gesture_10
            ]
            idle_lookat_params = igc_lookat_defaultanims
            talk_lookat_params = igc_lookat_defaultanims
        }
    }
    management_scripts = igc_ped_management_scripts
}
iggy_actor_head = {
    Model = 'Peds/IGC/IGC_Iggy_Head.skin'
    skeleton = IGC_Iggy_Head
    part_name = 'ped_head'
    FormatWithZoneName
    pak = 'Pak/IGC/IGC_Iggy/IGC_Iggy.pak'
}
murphy_actor = { HeadStructure = murphy_actor_head vo_suffix = 'murphy' direction_params = ped_m_direction_params management_scripts = igc_ped_management_scripts }
murphy_actor_head = {
    Model = 'Peds/IGC/IGC_Murphy_Head.skin'
    skeleton = IGC_Murphy_Head
    part_name = 'Ped_Head'
    FormatWithZoneName
    pak = 'Pak/IGC/IGC_Murphy/IGC_Murphy.pak'
}
burnquist_actor = { HeadStructure = burnquist_actor_head vo_suffix = 'burnquist' direction_params = ped_m_direction_params management_scripts = igc_ped_management_scripts }
burnquist_actor_head = {
    Model = 'Peds/IGC/IGC_burnquist_Head.skin'
    skeleton = IGC_Burnquist_Head
    part_name = 'Ped_Head'
    FormatWithZoneName
    pak = 'Pak/IGC/IGC_burnquist/IGC_burnquist.pak'
}
ChineseMan_actor = { HeadStructure = ChineseMan_actor_head vo_suffix = 'ChineseMan' direction_params = ped_m_direction_params management_scripts = igc_ped_management_scripts }
ChineseMan_actor_head = {
    Model = 'Peds/IGC/IGC_ChineseMan_Head.skin'
    skeleton = IGC_ChineseMan_HEAD
    part_name = 'Ped_Head'
    FormatWithZoneName
    pak = 'Pak/IGC/IGC_ChineseMan/IGC_ChineseMan.pak'
}
Cholo_actor = { HeadStructure = Cholo_actor_head vo_suffix = 'Cholo' direction_params = ped_m_direction_params management_scripts = igc_ped_management_scripts }
Cholo_actor_head = {
    Model = 'Peds/IGC/IGC_Cholo_Head.skin'
    skeleton = IGC_Cholo_Head
    part_name = 'Ped_Head'
    FormatWithZoneName
    pak = 'Pak/IGC/IGC_Cholo/IGC_Cholo.pak'
}
daewon_actor = { HeadStructure = daewon_actor_head vo_suffix = 'daewon' direction_params = ped_m_direction_params management_scripts = igc_ped_management_scripts }
daewon_actor_head = {
    Model = 'Peds/IGC/IGC_daewon_Head.skin'
    skeleton = IGC_Daewon_HEAD
    part_name = 'Ped_Head'
    FormatWithZoneName
    pak = 'Pak/IGC/IGC_daewon/IGC_daewon.pak'
}
dogtownguy1_actor = { HeadStructure = dogtownguy1_actor_head vo_suffix = 'dogtownguy1' direction_params = ped_m_direction_params management_scripts = igc_ped_management_scripts }
dogtownguy1_actor_head = {
    Model = 'Peds/IGC/IGC_dogtownguy1_Head.skin'
    skeleton = IGC_DogTownGuy1_HEAD
    part_name = 'Ped_Head'
    FormatWithZoneName
    pak = 'Pak/IGC/IGC_dogtownguy1/IGC_dogtownguy1.pak'
}
dogtownguy2_actor = { HeadStructure = dogtownguy2_actor_head vo_suffix = 'dogtownguy2' direction_params = ped_m_direction_params management_scripts = igc_ped_management_scripts }
dogtownguy2_actor_head = {
    Model = 'Peds/IGC/IGC_dogtownguy2_Head.skin'
    skeleton = IGC_DogTownGuy2_HEAD
    part_name = 'Ped_Head'
    FormatWithZoneName
    pak = 'Pak/IGC/IGC_dogtownguy2/IGC_dogtownguy2.pak'
}
fatconstruction_actor = { HeadStructure = fatconstruction_actor_head vo_suffix = 'fatconstruction' direction_params = ped_m_direction_params management_scripts = igc_ped_management_scripts }
fatconstruction_actor_head = {
    Model = 'Peds/IGC/IGC_fatconstruction_Head.skin'
    skeleton = IGC_FatConstruction_HEAD
    part_name = 'Ped_Head'
    FormatWithZoneName
    pak = 'Pak/IGC/IGC_fatconstruction/IGC_fatconstruction.pak'
}
frenchguy_actor = { HeadStructure = frenchguy_actor_head vo_suffix = 'frenchguy' direction_params = ped_m_direction_params management_scripts = igc_ped_management_scripts }
frenchguy_actor_head = {
    Model = 'Peds/IGC/IGC_frenchguy_Head.skin'
    skeleton = IGC_FrenchGuy_Head
    part_name = 'Ped_Head'
    FormatWithZoneName
    pak = 'Pak/IGC/IGC_frenchguy/IGC_frenchguy.pak'
}
genericskater01_actor = { HeadStructure = genericskater01_actor_head vo_suffix = 'genericskater01' direction_params = ped_m_direction_params management_scripts = igc_ped_management_scripts }
genericskater01_actor_head = {
    Model = 'Peds/IGC/IGC_genericskater01_Head.skin'
    skeleton = IGC_Genericskater01_Head
    part_name = 'Ped_M_Head'
    FormatWithZoneName
    pak = 'Pak/IGC/IGC_genericskater01/IGC_genericskater01.pak'
}
genericskater02_actor = { HeadStructure = genericskater02_actor_head vo_suffix = 'ian' direction_params = ped_m_direction_params management_scripts = igc_ped_management_scripts }
genericskater02_actor_head = {
    Model = 'Peds/IGC/IGC_genericskater02_Head.skin'
    skeleton = IGC_Genericskater02_Head
    part_name = 'Ped_M_Head'
    FormatWithZoneName
    pak = 'Pak/IGC/IGC_genericskater02/IGC_genericskater02.pak'
}
genericskater03_actor = { HeadStructure = genericskater03_actor_head vo_suffix = 'duane' direction_params = ped_m_direction_params management_scripts = igc_ped_management_scripts }
genericskater03_actor_head = {
    Model = 'Peds/IGC/IGC_genericskater03_Head.skin'
    skeleton = IGC_Genericskater03_Head
    part_name = 'Ped_M_Head'
    FormatWithZoneName
    pak = 'Pak/IGC/IGC_genericskater03/IGC_genericskater03.pak'
}
graffiti_actor = { HeadStructure = graffiti_actor_head vo_suffix = 'graffiti' direction_params = ped_m_direction_params management_scripts = igc_ped_management_scripts }
graffiti_actor_head = {
    Model = 'Peds/IGC/IGC_graffiti_Head.skin'
    skeleton = IGC_Graffiti_HEAD
    part_name = 'Ped_Head'
    FormatWithZoneName
    pak = 'Pak/IGC/IGC_graffiti/IGC_graffiti.pak'
}
hawk_actor = { HeadStructure = hawk_actor_head vo_suffix = 'hawk' direction_params = ped_m_direction_params management_scripts = igc_ped_management_scripts }
hawk_actor_head = {
    Model = 'Peds/IGC/IGC_hawk_Head.skin'
    skeleton = IGC_Hawk_Head
    part_name = 'Ped_Head'
    FormatWithZoneName
    pak = 'Pak/IGC/IGC_hawk/IGC_hawk.pak'
}
Hector_actor = { HeadStructure = Cholo_actor_head vo_suffix = 'Hector' direction_params = ped_m_direction_params management_scripts = igc_ped_management_scripts }
Hector_actor_head = {
    Model = 'Peds/IGC/IGC_Cholo_Head.skin'
    skeleton = IGC_Cholo_Head
    part_name = 'Ped_Head'
    FormatWithZoneName
    pak = 'Pak/IGC/IGC_Cholo/IGC_Cholo.pak'
}
hoffman_actor = { HeadStructure = hoffman_actor_head vo_suffix = 'hoffman' direction_params = ped_m_direction_params management_scripts = igc_ped_management_scripts }
hoffman_actor_head = {
    Model = 'Peds/IGC/IGC_hoffman_Head.skin'
    skeleton = IGC_Hoffman_Head
    part_name = 'Ped_Head'
    FormatWithZoneName
    pak = 'Pak/IGC/IGC_hoffman/IGC_hoffman.pak'
}
margera_actor = { HeadStructure = margera_actor_head vo_suffix = 'margera' direction_params = ped_m_direction_params management_scripts = igc_ped_management_scripts }
margera_actor_head = {
    Model = 'Peds/IGC/IGC_margera_Head.skin'
    skeleton = IGC_Margera_HEAD
    part_name = 'Ped_Head'
    FormatWithZoneName
    pak = 'Pak/IGC/IGC_margera/IGC_margera.pak'
}
mega_actor = { HeadStructure = mega_actor_head vo_suffix = 'mega' direction_params = ped_m_direction_params management_scripts = igc_ped_management_scripts }
mega_actor_head = {
    Model = 'Peds/IGC/IGC_mega_Head.skin'
    skeleton = IGC_Mega_head
    part_name = 'Ped_Head'
    FormatWithZoneName
    pak = 'Pak/IGC/IGC_mega/IGC_mega.pak'
}
mullen_actor = { HeadStructure = mullen_actor_head vo_suffix = 'mullen' direction_params = ped_m_direction_params management_scripts = igc_ped_management_scripts }
mullen_actor_head = {
    Model = 'Peds/IGC/IGC_mullen_Head.skin'
    skeleton = IGC_Mullen_HEAD
    part_name = 'Ped_Head'
    FormatWithZoneName
    pak = 'Pak/IGC/IGC_mullen/IGC_mullen.pak'
}
oilrigworker_actor = { HeadStructure = oilrigworker_actor_head vo_suffix = 'oilrigworker' direction_params = ped_m_direction_params management_scripts = igc_ped_management_scripts }
oilrigworker_actor_head = {
    Model = 'Peds/IGC/IGC_oilrigworker_Head.skin'
    skeleton = IGC_OilRigWorker_head
    part_name = 'Ped_Head'
    FormatWithZoneName
    pak = 'Pak/IGC/IGC_oilrigworker/IGC_oilrigworker.pak'
}
randomskater_actor = { HeadStructure = randomskater_actor_head vo_suffix = 'randomskater' direction_params = ped_m_direction_params management_scripts = igc_ped_management_scripts }
randomskater_actor_head = {
    Model = 'Peds/IGC/IGC_randomskater_Head.skin'
    skeleton = IGC_RandomSkater_HEAD
    part_name = 'Ped_Head'
    FormatWithZoneName
    pak = 'Pak/IGC/IGC_randomskater/IGC_randomskater.pak'
}
reynolds_actor = { HeadStructure = reynolds_actor_head vo_suffix = 'reynolds' direction_params = ped_m_direction_params management_scripts = igc_ped_management_scripts }
reynolds_actor_head = {
    Model = 'Peds/IGC/IGC_reynolds_Head.skin'
    skeleton = IGC_Reynolds_Head
    part_name = 'Ped_Head'
    FormatWithZoneName
    pak = 'Pak/IGC/IGC_reynolds/IGC_reynolds.pak'
}
rick_thorne_actor = { HeadStructure = rick_thorne_actor_head vo_suffix = 'rick_thorne' direction_params = ped_m_direction_params management_scripts = igc_ped_management_scripts }
rick_thorne_actor_head = {
    Model = 'Peds/IGC/IGC_rick_thorne_Head.skin'
    skeleton = IGC_Rick_Thorne_head
    part_name = 'Ped_Head'
    FormatWithZoneName
    pak = 'Pak/IGC/IGC_rick_thorne/IGC_rick_thorne.pak'
}
rodriguez_actor = { HeadStructure = rodriguez_actor_head vo_suffix = 'rodriguez' direction_params = ped_m_direction_params management_scripts = igc_ped_management_scripts }
rodriguez_actor_head = {
    Model = 'Peds/IGC/IGC_rodriguez_Head.skin'
    skeleton = IGC_Rodriguez_head
    part_name = 'Ped_Head'
    FormatWithZoneName
    pak = 'Pak/IGC/IGC_rodriguez/IGC_rodriguez.pak'
}
sheckler_actor = { HeadStructure = sheckler_actor_head vo_suffix = 'sheckler' direction_params = ped_m_direction_params management_scripts = igc_ped_management_scripts }
sheckler_actor_head = {
    Model = 'Peds/IGC/IGC_sheckler_Head.skin'
    skeleton = IGC_Sheckler_Head
    part_name = 'Ped_Head'
    FormatWithZoneName
    pak = 'Pak/IGC/IGC_sheckler/IGC_sheckler.pak'
}
skateclub_actor = { HeadStructure = skateclub_actor_head vo_suffix = 'skateclub' direction_params = ped_m_direction_params management_scripts = igc_ped_management_scripts }
skateclub_actor_head = {
    Model = 'Peds/IGC/IGC_skateclub_Head.skin'
    skeleton = IGC_SkateClub_Head
    part_name = 'Ped_Head'
    FormatWithZoneName
    pak = 'Pak/IGC/IGC_skateclub/IGC_skateclub.pak'
}
trujillo_actor = { HeadStructure = trujillo_actor_head vo_suffix = 'trujillo' direction_params = ped_m_direction_params management_scripts = igc_ped_management_scripts }
trujillo_actor_head = {
    Model = 'Peds/IGC/IGC_trujillo_Head.skin'
    skeleton = IGC_Trujillo_Head
    part_name = 'Ped_Head'
    FormatWithZoneName
    pak = 'Pak/IGC/IGC_trujillo/IGC_trujillo.pak'
}
vallely_actor = { HeadStructure = vallely_actor_head vo_suffix = 'vallely' direction_params = ped_m_direction_params management_scripts = igc_ped_management_scripts }
vallely_actor_head = {
    Model = 'Peds/IGC/IGC_vallely_Head.skin'
    skeleton = IGC_Vallely_HEAD
    part_name = 'Ped_Head'
    FormatWithZoneName
    pak = 'Pak/IGC/IGC_vallely/IGC_vallely.pak'
}
vato_actor = { HeadStructure = vato_actor_head vo_suffix = 'vato' direction_params = ped_m_direction_params management_scripts = igc_ped_management_scripts }
vato_actor_head = {
    Model = 'Peds/IGC/IGC_vato_Head.skin'
    skeleton = IGC_Vato_head
    part_name = 'Ped_Head'
    FormatWithZoneName
    pak = 'Pak/IGC/IGC_vato/IGC_vato.pak'
}
williams_actor = { HeadStructure = williams_actor_head vo_suffix = 'williams' direction_params = ped_m_direction_params management_scripts = igc_ped_management_scripts }
williams_actor_head = {
    Model = 'Peds/IGC/IGC_williams_Head.skin'
    skeleton = IGC_Williams_Head
    part_name = 'Ped_Head'
    FormatWithZoneName
    pak = 'Pak/IGC/IGC_williams/IGC_williams.pak'
}
youngskater_actor = { HeadStructure = youngskater_actor_head vo_suffix = 'youngskater' direction_params = ped_m_direction_params management_scripts = igc_ped_management_scripts }
youngskater_actor_head = {
    Model = 'Peds/IGC/IGC_youngskater_Head01.skin'
    skeleton = IGC_YoungSkater_Head01
    part_name = 'Ped_Head'
    FormatWithZoneName
    pak = 'Pak/IGC/IGC_youngskater/IGC_youngskater.pak'
}
alva_actor = {
    HeadStructure = alva_actor_head
    vo_suffix = 'alva'
    direction_params = {
        calm = {
            idle_animations = [ Ped_Alva_Idle02 ]
            talk_animations = [
                Talk_Gesture_01
                Talk_Gesture_02
                Talk_Gesture_03
                Talk_Gesture_04
                Talk_Gesture_05
                Talk_Gesture_06
                Talk_Gesture_07
                Talk_Gesture_08
                Talk_Gesture_09
                Talk_Gesture_10
            ]
            idle_lookat_params = igc_lookat_defaultanims
            talk_lookat_params = igc_lookat_defaultanims
        }
    }
    management_scripts = igc_ped_management_scripts
}
alva_actor_head = {
    Model = 'Peds/IGC/IGC_Alva_Head.skin'
    skeleton = Igc_Alva_HEAD
    part_name = 'Ped_Head'
    FormatWithZoneName
    pak = 'Pak/IGC/IGC_Alva/IGC_Alva.pak'
}
jorge_actor = {
    vo_suffix = 'jorge'
    direction_params = {
        calm = {
            idle_animations = [
                Talk_ScratchChin
                Ped_M_Talk_Dull
                Ped_M_Talk_ISupposeSo
                Ped_M_Talk_RaiseArn
                Ped_M_Talk_Shrug
            ]
            talk_animations = [ Talk_Gesture_07 Talk_Gesture_08 Talk_Gesture_09 Talk_Gesture_10 ]
            idle_lookat_params = igc_lookat_defaultanims
            talk_lookat_params = igc_lookat_defaultanims
        }
    }
    management_scripts = igc_ped_management_scripts
}
igc_template_conversation2 = {
    actor_marks = [
        {
            ActorNum = 2
            relativeto = { ActorNum = 1 }
            angles = (0.0, 150.0, 0.0)
            Pos = (20.0, 0.0, 50.0)
        }
    ]
    default_direction = calm
    default_look_at_enabled = 1
    actor_directions = [
        {
            ActorNum = 1
            lookat = { ActorNum = 2 }
        }
    ]
    camera_cycle = [
        { Pos = (46.0, 42.79999923706055, 60.099998474121094) Quat = (0.022012999281287193, 0.9515799880027771, 0.08197899907827377) FOV = 72.0 }
        { Pos = (-38.79999923706055, 42.20000076293945, 58.70000076293945) Quat = (0.02710700035095215, -0.955826997756958, -0.0804390013217926) FOV = 72.0 }
    ]
}
igc_template_conversation3 = {
    actor_marks = [
        {
            ActorNum = 2
            relativeto = { ActorNum = 1 }
            angles = (0.0, -90.0, 0.0)
            Pos = (40.0, 0.0, 60.0)
        }
        {
            ActorNum = 3
            relativeto = { ActorNum = 1 }
            angles = (0.0, 90.0, 0.0)
            Pos = (-40.0, 0.0, 60.0)
        }
    ]
    default_direction = calm
    default_look_at_enabled = 1
    actor_directions = [
        {
            ActorNum = 1
            lookat = { ActorNum = 2 }
        }
    ]
    camera_cycle = [
        { shot_type = S2RA_Wide2shot }
        { shot_type = S2LA_Wide2shot }
    ]
}
igc_transition_fade = { out = igc_fadeout in = igc_fadein }
igc_transition_fade_in_only = { out = igc_fadeout_fast in = igc_fadein }
igc_transition_fade_out_only = { out = igc_fadeout in = igc_fadein_fast }
